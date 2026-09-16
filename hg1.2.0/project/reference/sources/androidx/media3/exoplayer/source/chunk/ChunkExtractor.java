package androidx.media3.exoplayer.source.chunk;

import androidx.media3.common.Format;
import androidx.media3.exoplayer.analytics.PlayerId;
import androidx.media3.extractor.ChunkIndex;
import androidx.media3.extractor.ExtractorInput;
import androidx.media3.extractor.TrackOutput;
import androidx.media3.extractor.text.SubtitleParser;
import java.io.IOException;
import java.util.List;

/* loaded from: classes.dex */
public interface ChunkExtractor {

    public interface Factory {

        /* renamed from: androidx.media3.exoplayer.source.chunk.ChunkExtractor$Factory$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static Factory $default$experimentalParseSubtitlesDuringExtraction(Factory _this, boolean z) {
                return _this;
            }

            public static Format $default$getOutputTextFormat(Factory _this, Format format) {
                return format;
            }

            public static Factory $default$setSubtitleParserFactory(Factory _this, SubtitleParser.Factory factory) {
                return _this;
            }
        }

        ChunkExtractor createProgressiveMediaExtractor(int i, Format format, boolean z, List<Format> list, TrackOutput trackOutput, PlayerId playerId);

        Factory experimentalParseSubtitlesDuringExtraction(boolean z);

        Format getOutputTextFormat(Format format);

        Factory setSubtitleParserFactory(SubtitleParser.Factory factory);
    }

    public interface TrackOutputProvider {
        TrackOutput track(int i, int i2);
    }

    ChunkIndex getChunkIndex();

    Format[] getSampleFormats();

    void init(TrackOutputProvider trackOutputProvider, long j, long j2);

    boolean read(ExtractorInput extractorInput) throws IOException;

    void release();
}
