package androidx.media3.exoplayer.smoothstreaming;

import androidx.media3.common.Format;
import androidx.media3.datasource.TransferListener;
import androidx.media3.exoplayer.smoothstreaming.manifest.SsManifest;
import androidx.media3.exoplayer.source.chunk.ChunkSource;
import androidx.media3.exoplayer.trackselection.ExoTrackSelection;
import androidx.media3.exoplayer.upstream.CmcdConfiguration;
import androidx.media3.exoplayer.upstream.LoaderErrorThrower;
import androidx.media3.extractor.text.SubtitleParser;

/* loaded from: classes.dex */
public interface SsChunkSource extends ChunkSource {

    public interface Factory {

        /* renamed from: androidx.media3.exoplayer.smoothstreaming.SsChunkSource$Factory$-CC, reason: invalid class name */
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

        SsChunkSource createChunkSource(LoaderErrorThrower loaderErrorThrower, SsManifest ssManifest, int i, ExoTrackSelection exoTrackSelection, TransferListener transferListener, CmcdConfiguration cmcdConfiguration);

        Factory experimentalParseSubtitlesDuringExtraction(boolean z);

        Format getOutputTextFormat(Format format);

        Factory setSubtitleParserFactory(SubtitleParser.Factory factory);
    }

    void updateManifest(SsManifest ssManifest);

    void updateTrackSelection(ExoTrackSelection exoTrackSelection);
}
