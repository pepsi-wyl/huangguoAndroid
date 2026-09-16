package androidx.media3.exoplayer.video;

import android.graphics.Bitmap;
import android.view.Surface;
import androidx.media3.common.Effect;
import androidx.media3.common.Format;
import androidx.media3.common.VideoSize;
import androidx.media3.common.util.Size;
import androidx.media3.common.util.TimestampIterator;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.List;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public interface VideoSink {
    public static final int INPUT_TYPE_BITMAP = 2;
    public static final int INPUT_TYPE_SURFACE = 1;

    @Target({ElementType.TYPE_USE})
    @Documented
    @Retention(RetentionPolicy.SOURCE)
    public @interface InputType {
    }

    public interface Listener {
        public static final Listener NO_OP = new Listener() { // from class: androidx.media3.exoplayer.video.VideoSink.Listener.1
            @Override // androidx.media3.exoplayer.video.VideoSink.Listener
            public void onError(VideoSink videoSink, VideoSinkException videoSinkException) {
            }

            @Override // androidx.media3.exoplayer.video.VideoSink.Listener
            public void onFirstFrameRendered(VideoSink videoSink) {
            }

            @Override // androidx.media3.exoplayer.video.VideoSink.Listener
            public void onFrameDropped(VideoSink videoSink) {
            }

            @Override // androidx.media3.exoplayer.video.VideoSink.Listener
            public void onVideoSizeChanged(VideoSink videoSink, VideoSize videoSize) {
            }
        };

        void onError(VideoSink videoSink, VideoSinkException videoSinkException);

        void onFirstFrameRendered(VideoSink videoSink);

        void onFrameDropped(VideoSink videoSink);

        void onVideoSizeChanged(VideoSink videoSink, VideoSize videoSize);
    }

    void clearOutputSurfaceInfo();

    void enableMayRenderStartOfStream();

    void flush(boolean z);

    Surface getInputSurface();

    void initialize(Format format) throws VideoSinkException;

    boolean isEnded();

    boolean isFrameDropAllowedOnInput();

    boolean isInitialized();

    boolean isReady();

    void onRendererDisabled();

    void onRendererEnabled(boolean z);

    void onRendererStarted();

    void onRendererStopped();

    boolean queueBitmap(Bitmap bitmap, TimestampIterator timestampIterator);

    long registerInputFrame(long j, boolean z);

    void registerInputStream(int i, Format format);

    void release();

    void render(long j, long j2) throws VideoSinkException;

    void setListener(Listener listener, Executor executor);

    void setOutputSurfaceInfo(Surface surface, Size size);

    void setPendingVideoEffects(List<Effect> list);

    void setPlaybackSpeed(float f);

    void setStreamOffsetAndAdjustmentUs(long j, long j2);

    void setVideoEffects(List<Effect> list);

    void setVideoFrameMetadataListener(VideoFrameMetadataListener videoFrameMetadataListener);

    public static final class VideoSinkException extends Exception {
        public final Format format;

        public VideoSinkException(Throwable th, Format format) {
            super(th);
            this.format = format;
        }
    }
}
