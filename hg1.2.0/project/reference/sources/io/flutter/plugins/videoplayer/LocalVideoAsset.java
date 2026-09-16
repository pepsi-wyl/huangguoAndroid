package io.flutter.plugins.videoplayer;

import android.content.Context;
import androidx.media3.common.MediaItem;
import androidx.media3.exoplayer.source.DefaultMediaSourceFactory;
import androidx.media3.exoplayer.source.MediaSource;

/* loaded from: classes2.dex */
final class LocalVideoAsset extends VideoAsset {
    LocalVideoAsset(String str) {
        super(str);
    }

    @Override // io.flutter.plugins.videoplayer.VideoAsset
    MediaItem getMediaItem() {
        return new MediaItem.Builder().setUri(this.assetUrl).build();
    }

    @Override // io.flutter.plugins.videoplayer.VideoAsset
    MediaSource.Factory getMediaSourceFactory(Context context) {
        return new DefaultMediaSourceFactory(context);
    }
}
