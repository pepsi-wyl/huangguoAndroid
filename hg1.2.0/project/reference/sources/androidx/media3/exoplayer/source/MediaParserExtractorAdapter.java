package androidx.media3.exoplayer.source;

import android.media.MediaParser;
import android.net.Uri;
import android.util.Pair;
import androidx.media3.common.DataReader;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.analytics.PlayerId;
import androidx.media3.exoplayer.drm.FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0;
import androidx.media3.exoplayer.source.ProgressiveMediaExtractor;
import androidx.media3.exoplayer.source.mediaparser.InputReaderAdapterV30;
import androidx.media3.exoplayer.source.mediaparser.MediaParserUtil;
import androidx.media3.exoplayer.source.mediaparser.OutputConsumerAdapterV30;
import androidx.media3.extractor.ExtractorOutput;
import androidx.media3.extractor.PositionHolder;
import com.google.common.collect.ImmutableMap;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class MediaParserExtractorAdapter implements ProgressiveMediaExtractor {

    @Deprecated
    public static final ProgressiveMediaExtractor.Factory FACTORY = new ProgressiveMediaExtractor.Factory() { // from class: androidx.media3.exoplayer.source.MediaParserExtractorAdapter$$ExternalSyntheticLambda3
        @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor.Factory
        public final ProgressiveMediaExtractor createProgressiveMediaExtractor(PlayerId playerId) {
            return MediaParserExtractorAdapter.lambda$static$0(playerId);
        }
    };
    private final InputReaderAdapterV30 inputReaderAdapter;
    private final MediaParser mediaParser;
    private final OutputConsumerAdapterV30 outputConsumerAdapter;
    private String parserName;

    static /* synthetic */ ProgressiveMediaExtractor lambda$static$0(PlayerId playerId) {
        return new MediaParserExtractorAdapter(playerId, ImmutableMap.of());
    }

    public static final class Factory implements ProgressiveMediaExtractor.Factory {
        private static final Map<String, Object> parameters = new HashMap();

        public void setConstantBitrateSeekingEnabled(boolean z) {
            if (z) {
                Map<String, Object> map = parameters;
                map.put("android.media.mediaparser.adts.enableCbrSeeking", true);
                map.put("android.media.mediaparser.amr.enableCbrSeeking", true);
                map.put("android.media.mediaparser.mp3.enableCbrSeeking", true);
                return;
            }
            Map<String, Object> map2 = parameters;
            map2.remove("android.media.mediaparser.adts.enableCbrSeeking");
            map2.remove("android.media.mediaparser.amr.enableCbrSeeking");
            map2.remove("android.media.mediaparser.mp3.enableCbrSeeking");
        }

        @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor.Factory
        public MediaParserExtractorAdapter createProgressiveMediaExtractor(PlayerId playerId) {
            return new MediaParserExtractorAdapter(playerId, parameters);
        }
    }

    @Deprecated
    public MediaParserExtractorAdapter(PlayerId playerId) {
        this(playerId, ImmutableMap.of());
    }

    private MediaParserExtractorAdapter(PlayerId playerId, Map<String, Object> map) {
        OutputConsumerAdapterV30 outputConsumerAdapterV30 = new OutputConsumerAdapterV30();
        this.outputConsumerAdapter = outputConsumerAdapterV30;
        this.inputReaderAdapter = new InputReaderAdapterV30();
        MediaParser mediaParserCreate = MediaParser.create(outputConsumerAdapterV30, new String[0]);
        this.mediaParser = mediaParserCreate;
        mediaParserCreate.setParameter(MediaParserUtil.PARAMETER_EAGERLY_EXPOSE_TRACK_TYPE, true);
        mediaParserCreate.setParameter(MediaParserUtil.PARAMETER_IN_BAND_CRYPTO_INFO, true);
        mediaParserCreate.setParameter(MediaParserUtil.PARAMETER_INCLUDE_SUPPLEMENTAL_DATA, true);
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            this.mediaParser.setParameter(entry.getKey(), entry.getValue());
        }
        this.parserName = "android.media.mediaparser.UNKNOWN";
        if (Util.SDK_INT >= 31) {
            MediaParserUtil.setLogSessionIdOnMediaParser(this.mediaParser, playerId);
        }
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public void init(DataReader dataReader, Uri uri, Map<String, List<String>> map, long j, long j2, ExtractorOutput extractorOutput) throws IOException {
        this.outputConsumerAdapter.setExtractorOutput(extractorOutput);
        this.inputReaderAdapter.setDataReader(dataReader, j2);
        this.inputReaderAdapter.setCurrentPosition(j);
        String parserName = this.mediaParser.getParserName();
        if ("android.media.mediaparser.UNKNOWN".equals(parserName)) {
            this.mediaParser.advance(this.inputReaderAdapter);
            String parserName2 = this.mediaParser.getParserName();
            this.parserName = parserName2;
            this.outputConsumerAdapter.setSelectedParserName(parserName2);
            return;
        }
        if (parserName.equals(this.parserName)) {
            return;
        }
        String parserName3 = this.mediaParser.getParserName();
        this.parserName = parserName3;
        this.outputConsumerAdapter.setSelectedParserName(parserName3);
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public void release() {
        this.mediaParser.release();
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public void disableSeekingOnMp3Streams() {
        if ("android.media.mediaparser.Mp3Parser".equals(this.parserName)) {
            this.outputConsumerAdapter.disableSeeking();
        }
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public long getCurrentInputPosition() {
        return this.inputReaderAdapter.getPosition();
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public void seek(long j, long j2) {
        this.inputReaderAdapter.setCurrentPosition(j);
        Pair<MediaParser.SeekPoint, MediaParser.SeekPoint> seekPoints = this.outputConsumerAdapter.getSeekPoints(j2);
        this.mediaParser.seek(FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0.m237m(seekPoints.second).position == j ? FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0.m237m(seekPoints.second) : FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0.m237m(seekPoints.first));
    }

    @Override // androidx.media3.exoplayer.source.ProgressiveMediaExtractor
    public int read(PositionHolder positionHolder) throws IOException {
        boolean zAdvance = this.mediaParser.advance(this.inputReaderAdapter);
        positionHolder.position = this.inputReaderAdapter.getAndResetSeekPosition();
        if (zAdvance) {
            return positionHolder.position != -1 ? 1 : 0;
        }
        return -1;
    }
}
