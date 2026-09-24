package io.flutter.plugins.videoplayer;

import android.content.Context;
import androidx.media3.common.MediaItem;
import androidx.media3.exoplayer.source.MediaSource;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
abstract class VideoAsset {
    protected final String assetUrl;

    enum StreamingFormat {
        UNKNOWN,
        SMOOTH,
        DYNAMIC_ADAPTIVE,
        HTTP_LIVE
    }

    abstract MediaItem getMediaItem();

    abstract MediaSource.Factory getMediaSourceFactory(Context context);

    static VideoAsset fromAssetUrl(String str) {
        if (!str.startsWith("asset:///")) {
            throw new IllegalArgumentException("assetUrl must start with 'asset:///'");
        }
        return new LocalVideoAsset(str);
    }

    static VideoAsset fromRemoteUrl(String str, StreamingFormat streamingFormat, Map<String, String> map) {
        return new HttpVideoAsset(str, streamingFormat, new HashMap(map));
    }

    static VideoAsset fromRtspUrl(String str) {
        if (!str.startsWith("rtsp://")) {
            throw new IllegalArgumentException("rtspUrl must start with 'rtsp://'");
        }
        return new RtspVideoAsset(str);
    }

    protected VideoAsset(String str) {
        this.assetUrl = str;
    }
}
