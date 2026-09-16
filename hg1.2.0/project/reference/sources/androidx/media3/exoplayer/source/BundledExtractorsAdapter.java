package androidx.media3.exoplayer.source;

import android.net.Uri;
import androidx.media3.common.DataReader;
import androidx.media3.common.util.Assertions;
import androidx.media3.extractor.DefaultExtractorInput;
import androidx.media3.extractor.Extractor;
import androidx.media3.extractor.ExtractorInput;
import androidx.media3.extractor.ExtractorOutput;
import androidx.media3.extractor.ExtractorsFactory;
import androidx.media3.extractor.PositionHolder;
import androidx.media3.extractor.mp3.Mp3Extractor;
import com.google.common.base.Function;
import com.google.common.base.Joiner;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Lists;
import java.io.EOFException;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class BundledExtractorsAdapter implements ProgressiveMediaExtractor {
    private Extractor extractor;
    private ExtractorInput extractorInput;
    private final ExtractorsFactory extractorsFactory;

    public BundledExtractorsAdapter(ExtractorsFactory extractorsFactory) {
        this.extractorsFactory = extractorsFactory;
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public void init(DataReader dataReader, Uri uri, Map<String, List<String>> map, long j, long j2, ExtractorOutput extractorOutput) throws IOException {
        DefaultExtractorInput defaultExtractorInput = new DefaultExtractorInput(dataReader, j, j2);
        this.extractorInput = defaultExtractorInput;
        if (this.extractor != null) {
            return;
        }
        Extractor[] extractorArrCreateExtractors = this.extractorsFactory.createExtractors(uri, map);
        ImmutableList.Builder builderBuilderWithExpectedSize = ImmutableList.builderWithExpectedSize(extractorArrCreateExtractors.length);
        if (extractorArrCreateExtractors.length == 1) {
            this.extractor = extractorArrCreateExtractors[0];
        } else {
            int length = extractorArrCreateExtractors.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                Extractor extractor = extractorArrCreateExtractors[i];
                try {
                } catch (EOFException unused) {
                    if (this.extractor != null || defaultExtractorInput.getPosition() == j) {
                    }
                } catch (Throwable th) {
                    Assertions.checkState(this.extractor != null || defaultExtractorInput.getPosition() == j);
                    defaultExtractorInput.resetPeekPosition();
                    throw th;
                }
                if (extractor.sniff(defaultExtractorInput)) {
                    this.extractor = extractor;
                    Assertions.checkState(extractor != null || defaultExtractorInput.getPosition() == j);
                    defaultExtractorInput.resetPeekPosition();
                } else {
                    builderBuilderWithExpectedSize.addAll((Iterable) extractor.getSniffFailureDetails());
                    boolean z = this.extractor != null || defaultExtractorInput.getPosition() == j;
                    Assertions.checkState(z);
                    defaultExtractorInput.resetPeekPosition();
                    i++;
                }
            }
            if (this.extractor == null) {
                throw new UnrecognizedInputFormatException("None of the available extractors (" + Joiner.on(", ").join(Lists.transform(ImmutableList.copyOf(extractorArrCreateExtractors), new Function() { // from class: androidx.media3.exoplayer.source.BundledExtractorsAdapter$$ExternalSyntheticLambda0
                    @Override // com.google.common.base.Function
                    public final Object apply(Object obj) {
                        return ((Extractor) obj).getUnderlyingImplementation().getClass().getSimpleName();
                    }
                })) + ") could read the stream.", (Uri) Assertions.checkNotNull(uri), builderBuilderWithExpectedSize.build());
            }
        }
        this.extractor.init(extractorOutput);
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public void release() {
        Extractor extractor = this.extractor;
        if (extractor != null) {
            extractor.release();
            this.extractor = null;
        }
        this.extractorInput = null;
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public void disableSeekingOnMp3Streams() {
        Extractor extractor = this.extractor;
        if (extractor == null) {
            return;
        }
        Extractor underlyingImplementation = extractor.getUnderlyingImplementation();
        if (underlyingImplementation instanceof Mp3Extractor) {
            ((Mp3Extractor) underlyingImplementation).disableSeeking();
        }
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public long getCurrentInputPosition() {
        ExtractorInput extractorInput = this.extractorInput;
        if (extractorInput != null) {
            return extractorInput.getPosition();
        }
        return -1L;
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public void seek(long j, long j2) {
        ((Extractor) Assertions.checkNotNull(this.extractor)).seek(j, j2);
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public int read(PositionHolder positionHolder) throws IOException {
        return ((Extractor) Assertions.checkNotNull(this.extractor)).read((ExtractorInput) Assertions.checkNotNull(this.extractorInput), positionHolder);
    }
}
