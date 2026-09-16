package androidx.media3.exoplayer.dash;

import androidx.media3.common.Format;
import androidx.media3.datasource.TransferListener;
import androidx.media3.exoplayer.analytics.PlayerId;
import androidx.media3.exoplayer.dash.PlayerEmsgHandler;
import androidx.media3.exoplayer.dash.manifest.DashManifest;
import androidx.media3.exoplayer.source.chunk.ChunkSource;
import androidx.media3.exoplayer.trackselection.ExoTrackSelection;
import androidx.media3.exoplayer.upstream.CmcdConfiguration;
import androidx.media3.exoplayer.upstream.LoaderErrorThrower;
import androidx.media3.extractor.text.SubtitleParser;
import java.util.List;

/* loaded from: classes.dex */
public interface DashChunkSource extends ChunkSource {

    public interface Factory {

        /* renamed from: androidx.media3.exoplayer.dash.DashChunkSource$Factory$-CC, reason: invalid class name */
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

        DashChunkSource createDashChunkSource(LoaderErrorThrower loaderErrorThrower, DashManifest dashManifest, BaseUrlExclusionList baseUrlExclusionList, int i, int[] iArr, ExoTrackSelection exoTrackSelection, int i2, long j, boolean z, List<Format> list, PlayerEmsgHandler.PlayerTrackEmsgHandler playerTrackEmsgHandler, TransferListener transferListener, PlayerId playerId, CmcdConfiguration cmcdConfiguration);

        Factory experimentalParseSubtitlesDuringExtraction(boolean z);

        Format getOutputTextFormat(Format format);

        Factory setSubtitleParserFactory(SubtitleParser.Factory factory);
    }

    void updateManifest(DashManifest dashManifest, int i);

    void updateTrackSelection(ExoTrackSelection exoTrackSelection);
}
