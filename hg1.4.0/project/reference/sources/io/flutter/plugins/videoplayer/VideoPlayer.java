package io.flutter.plugins.videoplayer;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.Surface;
import android.view.Window;
import android.view.WindowManager;
import io.flutter.view.TextureRegistry;
import tv.danmaku.ijk.media.player.IMediaPlayer;
import tv.danmaku.ijk.media.player.IjkMediaPlayer;

/* loaded from: classes2.dex */
final class VideoPlayer {
    private static final String TAG = "VideoPlayer";
    private Activity activity;
    private IjkMediaPlayer ijkMediaPlayer;
    private final VideoPlayerOptions options;
    private Surface surface;
    private final TextureRegistry.SurfaceTextureEntry textureEntry;
    private final VideoPlayerCallbacks videoPlayerEvents;

    private static void setAudioAttributes(boolean z) {
    }

    void sendBufferingUpdate() {
    }

    static VideoPlayer create(Activity activity, Context context, VideoPlayerCallbacks videoPlayerCallbacks, TextureRegistry.SurfaceTextureEntry surfaceTextureEntry, VideoAsset videoAsset, String str, VideoPlayerOptions videoPlayerOptions) {
        IjkMediaPlayer.loadLibrariesOnce(null);
        IjkMediaPlayer.native_profileBegin("libijkplayer.so");
        return new VideoPlayer(activity, videoPlayerCallbacks, surfaceTextureEntry, videoAsset, str, videoPlayerOptions);
    }

    VideoPlayer(Activity activity, VideoPlayerCallbacks videoPlayerCallbacks, TextureRegistry.SurfaceTextureEntry surfaceTextureEntry, VideoAsset videoAsset, String str, VideoPlayerOptions videoPlayerOptions) {
        this.activity = activity;
        this.videoPlayerEvents = videoPlayerCallbacks;
        this.textureEntry = surfaceTextureEntry;
        this.options = videoPlayerOptions;
        IjkMediaPlayer ijkMediaPlayer = new IjkMediaPlayer();
        this.ijkMediaPlayer = ijkMediaPlayer;
        try {
            ijkMediaPlayer.setDataSource(str);
            this.ijkMediaPlayer.prepareAsync();
        } catch (Exception e) {
            Log.wtf(TAG, "Error setting data source: " + e.getMessage());
        }
        setUpVideoPlayer();
    }

    private void setUpVideoPlayer() {
        Surface surface = new Surface(this.textureEntry.surfaceTexture());
        this.surface = surface;
        this.ijkMediaPlayer.setSurface(surface);
        setAudioAttributes(this.options.mixWithOthers);
        this.ijkMediaPlayer.setOnPreparedListener(new IMediaPlayer.OnPreparedListener() { // from class: io.flutter.plugins.videoplayer.VideoPlayer$$ExternalSyntheticLambda1
            @Override // tv.danmaku.ijk.media.player.IMediaPlayer.OnPreparedListener
            public final void onPrepared(IMediaPlayer iMediaPlayer) {
                this.f$0.m488x9e684862(iMediaPlayer);
            }
        });
        this.ijkMediaPlayer.setOnCompletionListener(new IMediaPlayer.OnCompletionListener() { // from class: io.flutter.plugins.videoplayer.VideoPlayer$$ExternalSyntheticLambda2
            @Override // tv.danmaku.ijk.media.player.IMediaPlayer.OnCompletionListener
            public final void onCompletion(IMediaPlayer iMediaPlayer) {
                this.f$0.m489x6154b1c1(iMediaPlayer);
            }
        });
        this.ijkMediaPlayer.setOnErrorListener(new IMediaPlayer.OnErrorListener() { // from class: io.flutter.plugins.videoplayer.VideoPlayer$$ExternalSyntheticLambda3
            @Override // tv.danmaku.ijk.media.player.IMediaPlayer.OnErrorListener
            public final boolean onError(IMediaPlayer iMediaPlayer, int i, int i2) {
                return VideoPlayer.lambda$setUpVideoPlayer$2(iMediaPlayer, i, i2);
            }
        });
        this.ijkMediaPlayer.setOnBufferingUpdateListener(new IMediaPlayer.OnBufferingUpdateListener() { // from class: io.flutter.plugins.videoplayer.VideoPlayer$$ExternalSyntheticLambda4
            @Override // tv.danmaku.ijk.media.player.IMediaPlayer.OnBufferingUpdateListener
            public final void onBufferingUpdate(IMediaPlayer iMediaPlayer, int i) {
                this.f$0.m490xe72d847f(iMediaPlayer, i);
            }
        });
    }

    /* renamed from: lambda$setUpVideoPlayer$0$io-flutter-plugins-videoplayer-VideoPlayer, reason: not valid java name */
    /* synthetic */ void m488x9e684862(IMediaPlayer iMediaPlayer) {
        this.videoPlayerEvents.onInitialized(iMediaPlayer.getVideoWidth(), iMediaPlayer.getVideoHeight(), iMediaPlayer.getDuration(), 0);
    }

    /* renamed from: lambda$setUpVideoPlayer$1$io-flutter-plugins-videoplayer-VideoPlayer, reason: not valid java name */
    /* synthetic */ void m489x6154b1c1(IMediaPlayer iMediaPlayer) {
        this.videoPlayerEvents.onCompleted();
    }

    static /* synthetic */ boolean lambda$setUpVideoPlayer$2(IMediaPlayer iMediaPlayer, int i, int i2) {
        Log.wtf(TAG, "IJKPlayer error: " + i + ", " + i2);
        return true;
    }

    /* renamed from: lambda$setUpVideoPlayer$3$io-flutter-plugins-videoplayer-VideoPlayer, reason: not valid java name */
    /* synthetic */ void m490xe72d847f(IMediaPlayer iMediaPlayer, int i) {
        this.videoPlayerEvents.onBufferingUpdate((i * iMediaPlayer.getDuration()) / 100);
    }

    void play() throws IllegalStateException {
        this.ijkMediaPlayer.start();
    }

    void pause() throws IllegalStateException {
        this.ijkMediaPlayer.pause();
    }

    void setLooping(boolean z) {
        this.ijkMediaPlayer.setLooping(z);
    }

    void setVolume(double d) {
        float fMax = (float) Math.max(0.0d, Math.min(1.0d, d));
        this.ijkMediaPlayer.setVolume(fMax, fMax);
    }

    void setBrightness(double d) {
        if (this.activity == null) {
            return;
        }
        final float fMax = (float) Math.max(0.0d, Math.min(1.0d, d));
        this.activity.runOnUiThread(new Runnable() { // from class: io.flutter.plugins.videoplayer.VideoPlayer$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m487x44d1a384(fMax);
            }
        });
    }

    /* renamed from: lambda$setBrightness$4$io-flutter-plugins-videoplayer-VideoPlayer, reason: not valid java name */
    /* synthetic */ void m487x44d1a384(float f) {
        Window window = this.activity.getWindow();
        WindowManager.LayoutParams attributes = window.getAttributes();
        attributes.screenBrightness = f;
        window.setAttributes(attributes);
    }

    void setPlaybackSpeed(double d) {
        this.ijkMediaPlayer.setSpeed((float) d);
    }

    void seekTo(int i) throws IllegalStateException {
        this.ijkMediaPlayer.seekTo(i);
    }

    long getPosition() {
        return this.ijkMediaPlayer.getCurrentPosition();
    }

    void dispose() {
        this.textureEntry.release();
        Surface surface = this.surface;
        if (surface != null) {
            surface.release();
        }
        IjkMediaPlayer ijkMediaPlayer = this.ijkMediaPlayer;
        if (ijkMediaPlayer != null) {
            ijkMediaPlayer.release();
        }
        IjkMediaPlayer.native_profileEnd();
    }
}
