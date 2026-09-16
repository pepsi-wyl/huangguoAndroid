package androidx.media3.exoplayer.hls;

import android.net.Uri;
import android.text.TextUtils;
import androidx.media3.common.FileTypes;
import androidx.media3.common.Format;
import androidx.media3.common.Metadata;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.TimestampAdjuster;
import androidx.media3.exoplayer.analytics.PlayerId;
import androidx.media3.extractor.Extractor;
import androidx.media3.extractor.ExtractorInput;
import androidx.media3.extractor.mp3.Mp3Extractor;
import androidx.media3.extractor.mp4.FragmentedMp4Extractor;
import androidx.media3.extractor.text.DefaultSubtitleParserFactory;
import androidx.media3.extractor.text.SubtitleParser;
import androidx.media3.extractor.ts.Ac3Extractor;
import androidx.media3.extractor.ts.Ac4Extractor;
import androidx.media3.extractor.ts.AdtsExtractor;
import androidx.media3.extractor.ts.DefaultTsPayloadReaderFactory;
import androidx.media3.extractor.ts.TsExtractor;
import com.google.common.collect.ImmutableList;
import com.google.common.primitives.Ints;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class DefaultHlsExtractorFactory implements HlsExtractorFactory {
    private static final int[] DEFAULT_EXTRACTOR_ORDER = {8, 13, 11, 2, 0, 1, 7};
    private final boolean exposeCea608WhenMissingDeclarations;
    private boolean parseSubtitlesDuringExtraction;
    private final int payloadReaderFactoryFlags;
    private SubtitleParser.Factory subtitleParserFactory;

    @Override // androidx.media3.exoplayer.hls.HlsExtractorFactory
    public /* bridge */ /* synthetic */ HlsMediaChunkExtractor createExtractor(Uri uri, Format format, List list, TimestampAdjuster timestampAdjuster, Map map, ExtractorInput extractorInput, PlayerId playerId) throws IOException {
        return createExtractor(uri, format, (List<Format>) list, timestampAdjuster, (Map<String, List<String>>) map, extractorInput, playerId);
    }

    public DefaultHlsExtractorFactory() {
        this(0, true);
    }

    public DefaultHlsExtractorFactory(int i, boolean z) {
        this.payloadReaderFactoryFlags = i;
        this.exposeCea608WhenMissingDeclarations = z;
        this.subtitleParserFactory = new DefaultSubtitleParserFactory();
    }

    @Override // androidx.media3.exoplayer.hls.HlsExtractorFactory
    public BundledHlsMediaChunkExtractor createExtractor(Uri uri, Format format, List<Format> list, TimestampAdjuster timestampAdjuster, Map<String, List<String>> map, ExtractorInput extractorInput, PlayerId playerId) throws IOException {
        int iInferFileTypeFromMimeType = FileTypes.inferFileTypeFromMimeType(format.sampleMimeType);
        int iInferFileTypeFromResponseHeaders = FileTypes.inferFileTypeFromResponseHeaders(map);
        int iInferFileTypeFromUri = FileTypes.inferFileTypeFromUri(uri);
        int[] iArr = DEFAULT_EXTRACTOR_ORDER;
        ArrayList arrayList = new ArrayList(iArr.length);
        addFileTypeIfValidAndNotPresent(iInferFileTypeFromMimeType, arrayList);
        addFileTypeIfValidAndNotPresent(iInferFileTypeFromResponseHeaders, arrayList);
        addFileTypeIfValidAndNotPresent(iInferFileTypeFromUri, arrayList);
        for (int i : iArr) {
            addFileTypeIfValidAndNotPresent(i, arrayList);
        }
        extractorInput.resetPeekPosition();
        Extractor extractor = null;
        for (int i2 = 0; i2 < arrayList.size(); i2++) {
            int iIntValue = ((Integer) arrayList.get(i2)).intValue();
            Extractor extractor2 = (Extractor) Assertions.checkNotNull(createExtractorByFileType(iIntValue, format, list, timestampAdjuster));
            if (sniffQuietly(extractor2, extractorInput)) {
                return new BundledHlsMediaChunkExtractor(extractor2, format, timestampAdjuster, this.subtitleParserFactory, this.parseSubtitlesDuringExtraction);
            }
            if (extractor == null && (iIntValue == iInferFileTypeFromMimeType || iIntValue == iInferFileTypeFromResponseHeaders || iIntValue == iInferFileTypeFromUri || iIntValue == 11)) {
                extractor = extractor2;
            }
        }
        return new BundledHlsMediaChunkExtractor((Extractor) Assertions.checkNotNull(extractor), format, timestampAdjuster, this.subtitleParserFactory, this.parseSubtitlesDuringExtraction);
    }

    @Override // androidx.media3.exoplayer.hls.HlsExtractorFactory
    public DefaultHlsExtractorFactory setSubtitleParserFactory(SubtitleParser.Factory factory) {
        this.subtitleParserFactory = factory;
        return this;
    }

    @Override // androidx.media3.exoplayer.hls.HlsExtractorFactory
    public DefaultHlsExtractorFactory experimentalParseSubtitlesDuringExtraction(boolean z) {
        this.parseSubtitlesDuringExtraction = z;
        return this;
    }

    @Override // androidx.media3.exoplayer.hls.HlsExtractorFactory
    public Format getOutputTextFormat(Format format) {
        String str;
        if (!this.parseSubtitlesDuringExtraction || !this.subtitleParserFactory.supportsFormat(format)) {
            return format;
        }
        Format.Builder cueReplacementBehavior = format.buildUpon().setSampleMimeType(MimeTypes.APPLICATION_MEDIA3_CUES).setCueReplacementBehavior(this.subtitleParserFactory.getCueReplacementBehavior(format));
        StringBuilder sb = new StringBuilder();
        sb.append(format.sampleMimeType);
        if (format.codecs != null) {
            str = " " + format.codecs;
        } else {
            str = "";
        }
        sb.append(str);
        return cueReplacementBehavior.setCodecs(sb.toString()).setSubsampleOffsetUs(Long.MAX_VALUE).build();
    }

    private static void addFileTypeIfValidAndNotPresent(int i, List<Integer> list) {
        if (Ints.indexOf(DEFAULT_EXTRACTOR_ORDER, i) == -1 || list.contains(Integer.valueOf(i))) {
            return;
        }
        list.add(Integer.valueOf(i));
    }

    private Extractor createExtractorByFileType(int i, Format format, List<Format> list, TimestampAdjuster timestampAdjuster) {
        if (i == 0) {
            return new Ac3Extractor();
        }
        if (i == 1) {
            return new Ac4Extractor();
        }
        if (i == 2) {
            return new AdtsExtractor();
        }
        if (i == 7) {
            return new Mp3Extractor(0, 0L);
        }
        if (i == 8) {
            return createFragmentedMp4Extractor(this.subtitleParserFactory, this.parseSubtitlesDuringExtraction, timestampAdjuster, format, list);
        }
        if (i == 11) {
            return createTsExtractor(this.payloadReaderFactoryFlags, this.exposeCea608WhenMissingDeclarations, format, list, timestampAdjuster, this.subtitleParserFactory, this.parseSubtitlesDuringExtraction);
        }
        if (i != 13) {
            return null;
        }
        return new WebvttExtractor(format.language, timestampAdjuster, this.subtitleParserFactory, this.parseSubtitlesDuringExtraction);
    }

    private static TsExtractor createTsExtractor(int i, boolean z, Format format, List<Format> list, TimestampAdjuster timestampAdjuster, SubtitleParser.Factory factory, boolean z2) {
        SubtitleParser.Factory factory2;
        int i2;
        int i3 = i | 16;
        if (list != null) {
            i3 = i | 48;
        } else if (z) {
            list = Collections.singletonList(new Format.Builder().setSampleMimeType(MimeTypes.APPLICATION_CEA608).build());
        } else {
            list = Collections.emptyList();
        }
        String str = format.codecs;
        if (!TextUtils.isEmpty(str)) {
            if (!MimeTypes.containsCodecsCorrespondingToMimeType(str, MimeTypes.AUDIO_AAC)) {
                i3 |= 2;
            }
            if (!MimeTypes.containsCodecsCorrespondingToMimeType(str, MimeTypes.VIDEO_H264)) {
                i3 |= 4;
            }
        }
        if (z2) {
            factory2 = factory;
            i2 = 0;
        } else {
            factory2 = SubtitleParser.Factory.UNSUPPORTED;
            i2 = 1;
        }
        return new TsExtractor(2, i2, factory2, timestampAdjuster, new DefaultTsPayloadReaderFactory(i3, list), TsExtractor.DEFAULT_TIMESTAMP_SEARCH_BYTES);
    }

    private static FragmentedMp4Extractor createFragmentedMp4Extractor(SubtitleParser.Factory factory, boolean z, TimestampAdjuster timestampAdjuster, Format format, List<Format> list) {
        int i = isFmp4Variant(format) ? 4 : 0;
        if (!z) {
            factory = SubtitleParser.Factory.UNSUPPORTED;
            i |= 32;
        }
        SubtitleParser.Factory factory2 = factory;
        int i2 = i;
        if (list == null) {
            list = ImmutableList.of();
        }
        return new FragmentedMp4Extractor(factory2, i2, timestampAdjuster, null, list, null);
    }

    private static boolean isFmp4Variant(Format format) {
        Metadata metadata = format.metadata;
        if (metadata == null) {
            return false;
        }
        for (int i = 0; i < metadata.length(); i++) {
            if (metadata.get(i) instanceof HlsTrackMetadataEntry) {
                return !((HlsTrackMetadataEntry) r2).variantInfos.isEmpty();
            }
        }
        return false;
    }

    private static boolean sniffQuietly(Extractor extractor, ExtractorInput extractorInput) throws IOException {
        try {
            boolean zSniff = extractor.sniff(extractorInput);
            extractorInput.resetPeekPosition();
            return zSniff;
        } catch (EOFException unused) {
            extractorInput.resetPeekPosition();
            return false;
        } catch (Throwable th) {
            extractorInput.resetPeekPosition();
            throw th;
        }
    }
}
