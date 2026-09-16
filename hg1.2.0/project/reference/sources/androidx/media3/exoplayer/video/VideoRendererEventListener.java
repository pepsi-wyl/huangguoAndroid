package androidx.media3.exoplayer.video;

import android.os.Handler;
import android.os.SystemClock;
import androidx.media3.common.Format;
import androidx.media3.common.VideoSize;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.DecoderCounters;
import androidx.media3.exoplayer.DecoderReuseEvaluation;

/* loaded from: classes.dex */
public interface VideoRendererEventListener {

    /* renamed from: androidx.media3.exoplayer.video.VideoRendererEventListener$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static void $default$onDroppedFrames(VideoRendererEventListener _this, int i, long j) {
        }

        public static void $default$onRenderedFirstFrame(VideoRendererEventListener _this, Object obj, long j) {
        }

        public static void $default$onVideoCodecError(VideoRendererEventListener _this, Exception exc) {
        }

        public static void $default$onVideoDecoderInitialized(VideoRendererEventListener _this, String str, long j, long j2) {
        }

        public static void $default$onVideoDecoderReleased(VideoRendererEventListener _this, String str) {
        }

        public static void $default$onVideoDisabled(VideoRendererEventListener _this, DecoderCounters decoderCounters) {
        }

        public static void $default$onVideoEnabled(VideoRendererEventListener _this, DecoderCounters decoderCounters) {
        }

        public static void $default$onVideoFrameProcessingOffset(VideoRendererEventListener _this, long j, int i) {
        }

        public static void $default$onVideoInputFormatChanged(VideoRendererEventListener _this, Format format, DecoderReuseEvaluation decoderReuseEvaluation) {
        }

        public static void $default$onVideoSizeChanged(VideoRendererEventListener _this, VideoSize videoSize) {
        }
    }

    void onDroppedFrames(int i, long j);

    void onRenderedFirstFrame(Object obj, long j);

    void onVideoCodecError(Exception exc);

    void onVideoDecoderInitialized(String str, long j, long j2);

    void onVideoDecoderReleased(String str);

    void onVideoDisabled(DecoderCounters decoderCounters);

    void onVideoEnabled(DecoderCounters decoderCounters);

    void onVideoFrameProcessingOffset(long j, int i);

    void onVideoInputFormatChanged(Format format, DecoderReuseEvaluation decoderReuseEvaluation);

    void onVideoSizeChanged(VideoSize videoSize);

    public static final class EventDispatcher {
        private final Handler handler;
        private final VideoRendererEventListener listener;

        public EventDispatcher(Handler handler, VideoRendererEventListener videoRendererEventListener) {
            this.handler = videoRendererEventListener != null ? (Handler) Assertions.checkNotNull(handler) : null;
            this.listener = videoRendererEventListener;
        }

        public void enabled(final DecoderCounters decoderCounters) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.video.VideoRendererEventListener$EventDispatcher$$ExternalSyntheticLambda6
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m313x7180d5d(decoderCounters);
                    }
                });
            }
        }

        /* renamed from: lambda$enabled$0$androidx-media3-exoplayer-video-VideoRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m313x7180d5d(DecoderCounters decoderCounters) {
            ((VideoRendererEventListener) Util.castNonNull(this.listener)).onVideoEnabled(decoderCounters);
        }

        public void decoderInitialized(final String str, final long j, final long j2) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.video.VideoRendererEventListener$EventDispatcher$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m309xffa420d3(str, j, j2);
                    }
                });
            }
        }

        /* renamed from: lambda$decoderInitialized$1$androidx-media3-exoplayer-video-VideoRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m309xffa420d3(String str, long j, long j2) {
            ((VideoRendererEventListener) Util.castNonNull(this.listener)).onVideoDecoderInitialized(str, j, j2);
        }

        public void inputFormatChanged(final Format format, final DecoderReuseEvaluation decoderReuseEvaluation) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.video.VideoRendererEventListener$EventDispatcher$$ExternalSyntheticLambda7
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m314xd00d27ef(format, decoderReuseEvaluation);
                    }
                });
            }
        }

        /* renamed from: lambda$inputFormatChanged$2$androidx-media3-exoplayer-video-VideoRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m314xd00d27ef(Format format, DecoderReuseEvaluation decoderReuseEvaluation) {
            ((VideoRendererEventListener) Util.castNonNull(this.listener)).onVideoInputFormatChanged(format, decoderReuseEvaluation);
        }

        public void droppedFrames(final int i, final long j) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.video.VideoRendererEventListener$EventDispatcher$$ExternalSyntheticLambda2
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m312x9a4cf695(i, j);
                    }
                });
            }
        }

        /* renamed from: lambda$droppedFrames$3$androidx-media3-exoplayer-video-VideoRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m312x9a4cf695(int i, long j) {
            ((VideoRendererEventListener) Util.castNonNull(this.listener)).onDroppedFrames(i, j);
        }

        public void reportVideoFrameProcessingOffset(final long j, final int i) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.video.VideoRendererEventListener$EventDispatcher$$ExternalSyntheticLambda4
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m316xc5ffb974(j, i);
                    }
                });
            }
        }

        /* renamed from: lambda$reportVideoFrameProcessingOffset$4$androidx-media3-exoplayer-video-VideoRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m316xc5ffb974(long j, int i) {
            ((VideoRendererEventListener) Util.castNonNull(this.listener)).onVideoFrameProcessingOffset(j, i);
        }

        public void videoSizeChanged(final VideoSize videoSize) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.video.VideoRendererEventListener$EventDispatcher$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m318xad971007(videoSize);
                    }
                });
            }
        }

        /* renamed from: lambda$videoSizeChanged$5$androidx-media3-exoplayer-video-VideoRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m318xad971007(VideoSize videoSize) {
            ((VideoRendererEventListener) Util.castNonNull(this.listener)).onVideoSizeChanged(videoSize);
        }

        public void renderedFirstFrame(final Object obj) {
            if (this.handler != null) {
                final long jElapsedRealtime = SystemClock.elapsedRealtime();
                this.handler.post(new Runnable() { // from class: androidx.media3.exoplayer.video.VideoRendererEventListener$EventDispatcher$$ExternalSyntheticLambda3
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m315xb1e96bac(obj, jElapsedRealtime);
                    }
                });
            }
        }

        /* renamed from: lambda$renderedFirstFrame$6$androidx-media3-exoplayer-video-VideoRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m315xb1e96bac(Object obj, long j) {
            ((VideoRendererEventListener) Util.castNonNull(this.listener)).onRenderedFirstFrame(obj, j);
        }

        public void decoderReleased(final String str) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.video.VideoRendererEventListener$EventDispatcher$$ExternalSyntheticLambda9
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m310x45853f96(str);
                    }
                });
            }
        }

        /* renamed from: lambda$decoderReleased$7$androidx-media3-exoplayer-video-VideoRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m310x45853f96(String str) {
            ((VideoRendererEventListener) Util.castNonNull(this.listener)).onVideoDecoderReleased(str);
        }

        public void disabled(final DecoderCounters decoderCounters) {
            decoderCounters.ensureUpdated();
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.video.VideoRendererEventListener$EventDispatcher$$ExternalSyntheticLambda8
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m311x166f1720(decoderCounters);
                    }
                });
            }
        }

        /* renamed from: lambda$disabled$8$androidx-media3-exoplayer-video-VideoRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m311x166f1720(DecoderCounters decoderCounters) {
            decoderCounters.ensureUpdated();
            ((VideoRendererEventListener) Util.castNonNull(this.listener)).onVideoDisabled(decoderCounters);
        }

        public void videoCodecError(final Exception exc) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.video.VideoRendererEventListener$EventDispatcher$$ExternalSyntheticLambda5
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m317x90ab4908(exc);
                    }
                });
            }
        }

        /* renamed from: lambda$videoCodecError$9$androidx-media3-exoplayer-video-VideoRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m317x90ab4908(Exception exc) {
            ((VideoRendererEventListener) Util.castNonNull(this.listener)).onVideoCodecError(exc);
        }
    }
}
