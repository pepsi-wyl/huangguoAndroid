package androidx.media3.exoplayer.video;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.Looper;
import android.util.Pair;
import android.view.Surface;
import androidx.media3.common.C;
import androidx.media3.common.ColorInfo;
import androidx.media3.common.DebugViewProvider;
import androidx.media3.common.Effect;
import androidx.media3.common.Format;
import androidx.media3.common.FrameInfo;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.PreviewingVideoGraph;
import androidx.media3.common.SurfaceInfo;
import androidx.media3.common.VideoFrameProcessingException;
import androidx.media3.common.VideoFrameProcessor;
import androidx.media3.common.VideoGraph;
import androidx.media3.common.VideoSize;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Clock;
import androidx.media3.common.util.HandlerWrapper;
import androidx.media3.common.util.Size;
import androidx.media3.common.util.TimestampIterator;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.ExoPlaybackException;
import androidx.media3.exoplayer.video.CompositingVideoSinkProvider;
import androidx.media3.exoplayer.video.VideoFrameRenderControl;
import androidx.media3.exoplayer.video.VideoSink;
import com.google.common.base.Supplier;
import com.google.common.base.Suppliers;
import com.google.common.collect.ImmutableList;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.Executor;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;
import org.checkerframework.checker.nullness.qual.EnsuresNonNullIf;

/* loaded from: classes.dex */
public final class CompositingVideoSinkProvider implements VideoSinkProvider, VideoGraph.Listener {
    private static final Executor NO_OP_EXECUTOR = new Executor() { // from class: androidx.media3.exoplayer.video.CompositingVideoSinkProvider$$ExternalSyntheticLambda1
        @Override // java.util.concurrent.Executor
        public final void execute(Runnable runnable) {
            CompositingVideoSinkProvider.lambda$static$0(runnable);
        }
    };
    private static final int STATE_CREATED = 0;
    private static final int STATE_INITIALIZED = 1;
    private static final int STATE_RELEASED = 2;
    private long bufferTimestampAdjustmentUs;
    private final Clock clock;
    private final Context context;
    private Pair<Surface, Size> currentSurfaceAndSize;
    private HandlerWrapper handler;
    private final CopyOnWriteArraySet<Listener> listeners;
    private Format outputFormat;
    private int pendingFlushCount;
    private final PreviewingVideoGraph.Factory previewingVideoGraphFactory;
    private int state;
    private VideoFrameMetadataListener videoFrameMetadataListener;
    private final VideoFrameReleaseControl videoFrameReleaseControl;
    private final VideoFrameRenderControl videoFrameRenderControl;
    private PreviewingVideoGraph videoGraph;
    private final VideoSinkImpl videoSinkImpl;

    public interface Listener {
        void onError(CompositingVideoSinkProvider compositingVideoSinkProvider, VideoFrameProcessingException videoFrameProcessingException);

        void onFirstFrameRendered(CompositingVideoSinkProvider compositingVideoSinkProvider);

        void onFrameDropped(CompositingVideoSinkProvider compositingVideoSinkProvider);

        void onVideoSizeChanged(CompositingVideoSinkProvider compositingVideoSinkProvider, VideoSize videoSize);
    }

    static /* synthetic */ void lambda$static$0(Runnable runnable) {
    }

    public static final class Builder {
        private boolean built;
        private Clock clock = Clock.DEFAULT;
        private final Context context;
        private PreviewingVideoGraph.Factory previewingVideoGraphFactory;
        private VideoFrameProcessor.Factory videoFrameProcessorFactory;
        private final VideoFrameReleaseControl videoFrameReleaseControl;

        public Builder(Context context, VideoFrameReleaseControl videoFrameReleaseControl) {
            this.context = context.getApplicationContext();
            this.videoFrameReleaseControl = videoFrameReleaseControl;
        }

        public Builder setVideoFrameProcessorFactory(VideoFrameProcessor.Factory factory) {
            this.videoFrameProcessorFactory = factory;
            return this;
        }

        public Builder setPreviewingVideoGraphFactory(PreviewingVideoGraph.Factory factory) {
            this.previewingVideoGraphFactory = factory;
            return this;
        }

        public Builder setClock(Clock clock) {
            this.clock = clock;
            return this;
        }

        public CompositingVideoSinkProvider build() {
            Assertions.checkState(!this.built);
            if (this.previewingVideoGraphFactory == null) {
                if (this.videoFrameProcessorFactory == null) {
                    this.videoFrameProcessorFactory = new ReflectiveDefaultVideoFrameProcessorFactory();
                }
                this.previewingVideoGraphFactory = new ReflectivePreviewingSingleInputVideoGraphFactory(this.videoFrameProcessorFactory);
            }
            CompositingVideoSinkProvider compositingVideoSinkProvider = new CompositingVideoSinkProvider(this);
            this.built = true;
            return compositingVideoSinkProvider;
        }
    }

    private CompositingVideoSinkProvider(Builder builder) {
        Context context = builder.context;
        this.context = context;
        VideoSinkImpl videoSinkImpl = new VideoSinkImpl(context);
        this.videoSinkImpl = videoSinkImpl;
        Clock clock = builder.clock;
        this.clock = clock;
        VideoFrameReleaseControl videoFrameReleaseControl = builder.videoFrameReleaseControl;
        this.videoFrameReleaseControl = videoFrameReleaseControl;
        videoFrameReleaseControl.setClock(clock);
        this.videoFrameRenderControl = new VideoFrameRenderControl(new FrameRendererImpl(), videoFrameReleaseControl);
        this.previewingVideoGraphFactory = (PreviewingVideoGraph.Factory) Assertions.checkStateNotNull(builder.previewingVideoGraphFactory);
        this.listeners = new CopyOnWriteArraySet<>();
        this.state = 0;
        addListener(videoSinkImpl);
    }

    public void addListener(Listener listener) {
        this.listeners.add(listener);
    }

    public void removeListener(Listener listener) {
        this.listeners.remove(listener);
    }

    @Override // androidx.media3.exoplayer.video.VideoSinkProvider
    public VideoFrameReleaseControl getVideoFrameReleaseControl() {
        return this.videoFrameReleaseControl;
    }

    @Override // androidx.media3.exoplayer.video.VideoSinkProvider
    public VideoSink getSink() {
        return this.videoSinkImpl;
    }

    @Override // androidx.media3.exoplayer.video.VideoSinkProvider
    public void setOutputSurfaceInfo(Surface surface, Size size) {
        Pair<Surface, Size> pair = this.currentSurfaceAndSize;
        if (pair != null && ((Surface) pair.first).equals(surface) && ((Size) this.currentSurfaceAndSize.second).equals(size)) {
            return;
        }
        this.currentSurfaceAndSize = Pair.create(surface, size);
        maybeSetOutputSurfaceInfo(surface, size.getWidth(), size.getHeight());
    }

    @Override // androidx.media3.exoplayer.video.VideoSinkProvider
    public void clearOutputSurfaceInfo() {
        maybeSetOutputSurfaceInfo(null, Size.UNKNOWN.getWidth(), Size.UNKNOWN.getHeight());
        this.currentSurfaceAndSize = null;
    }

    @Override // androidx.media3.exoplayer.video.VideoSinkProvider
    public void release() {
        if (this.state == 2) {
            return;
        }
        HandlerWrapper handlerWrapper = this.handler;
        if (handlerWrapper != null) {
            handlerWrapper.removeCallbacksAndMessages(null);
        }
        PreviewingVideoGraph previewingVideoGraph = this.videoGraph;
        if (previewingVideoGraph != null) {
            previewingVideoGraph.release();
        }
        this.currentSurfaceAndSize = null;
        this.state = 2;
    }

    @Override // androidx.media3.common.VideoGraph.Listener
    public void onOutputSizeChanged(int i, int i2) {
        this.videoFrameRenderControl.onOutputSizeChanged(i, i2);
    }

    @Override // androidx.media3.common.VideoGraph.Listener
    public void onOutputFrameAvailableForRendering(long j) {
        if (this.pendingFlushCount > 0) {
            return;
        }
        this.videoFrameRenderControl.onOutputFrameAvailableForRendering(j - this.bufferTimestampAdjustmentUs);
    }

    @Override // androidx.media3.common.VideoGraph.Listener
    public void onEnded(long j) {
        throw new UnsupportedOperationException();
    }

    @Override // androidx.media3.common.VideoGraph.Listener
    public void onError(VideoFrameProcessingException videoFrameProcessingException) {
        Iterator<Listener> it = this.listeners.iterator();
        while (it.hasNext()) {
            it.next().onError(this, videoFrameProcessingException);
        }
    }

    public void render(long j, long j2) throws ExoPlaybackException {
        if (this.pendingFlushCount == 0) {
            this.videoFrameRenderControl.render(j, j2);
        }
    }

    public Surface getOutputSurface() {
        Pair<Surface, Size> pair = this.currentSurfaceAndSize;
        if (pair != null) {
            return (Surface) pair.first;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public VideoFrameProcessor initialize(Format format) throws VideoSink.VideoSinkException {
        Assertions.checkState(this.state == 0);
        ColorInfo adjustedInputColorInfo = getAdjustedInputColorInfo(format.colorInfo);
        if (adjustedInputColorInfo.colorTransfer == 7 && Util.SDK_INT < 34) {
            adjustedInputColorInfo = adjustedInputColorInfo.buildUpon().setColorTransfer(6).build();
        }
        ColorInfo colorInfo = adjustedInputColorInfo;
        this.handler = this.clock.createHandler((Looper) Assertions.checkStateNotNull(Looper.myLooper()), null);
        try {
            PreviewingVideoGraph.Factory factory = this.previewingVideoGraphFactory;
            Context context = this.context;
            DebugViewProvider debugViewProvider = DebugViewProvider.NONE;
            final HandlerWrapper handlerWrapper = this.handler;
            Objects.requireNonNull(handlerWrapper);
            this.videoGraph = factory.create(context, colorInfo, debugViewProvider, this, new Executor() { // from class: androidx.media3.exoplayer.video.CompositingVideoSinkProvider$$ExternalSyntheticLambda0
                @Override // java.util.concurrent.Executor
                public final void execute(Runnable runnable) {
                    handlerWrapper.post(runnable);
                }
            }, ImmutableList.of(), 0L);
            Pair<Surface, Size> pair = this.currentSurfaceAndSize;
            if (pair != null) {
                Surface surface = (Surface) pair.first;
                Size size = (Size) this.currentSurfaceAndSize.second;
                maybeSetOutputSurfaceInfo(surface, size.getWidth(), size.getHeight());
            }
            this.videoGraph.registerInput(0);
            this.state = 1;
            return this.videoGraph.getProcessor(0);
        } catch (VideoFrameProcessingException e) {
            throw new VideoSink.VideoSinkException(e, format);
        }
    }

    private boolean isInitialized() {
        return this.state == 1;
    }

    private void maybeSetOutputSurfaceInfo(Surface surface, int i, int i2) {
        if (this.videoGraph != null) {
            this.videoGraph.setOutputSurfaceInfo(surface != null ? new SurfaceInfo(surface, i, i2) : null);
            this.videoFrameReleaseControl.setOutputSurface(surface);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isReady() {
        return this.pendingFlushCount == 0 && this.videoFrameRenderControl.isReady();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean hasReleasedFrame(long j) {
        return this.pendingFlushCount == 0 && this.videoFrameRenderControl.hasReleasedFrame(j);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void flush() {
        if (isInitialized()) {
            this.pendingFlushCount++;
            this.videoFrameRenderControl.flush();
            ((HandlerWrapper) Assertions.checkStateNotNull(this.handler)).post(new Runnable() { // from class: androidx.media3.exoplayer.video.CompositingVideoSinkProvider$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.flushInternal();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void flushInternal() {
        int i = this.pendingFlushCount - 1;
        this.pendingFlushCount = i;
        if (i > 0) {
            return;
        }
        if (i < 0) {
            throw new IllegalStateException(String.valueOf(this.pendingFlushCount));
        }
        this.videoFrameRenderControl.flush();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setVideoFrameMetadataListener(VideoFrameMetadataListener videoFrameMetadataListener) {
        this.videoFrameMetadataListener = videoFrameMetadataListener;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setPlaybackSpeed(float f) {
        this.videoFrameRenderControl.setPlaybackSpeed(f);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onStreamOffsetChange(long j, long j2, long j3) {
        this.bufferTimestampAdjustmentUs = j;
        this.videoFrameRenderControl.onStreamOffsetChange(j2, j3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static ColorInfo getAdjustedInputColorInfo(ColorInfo colorInfo) {
        return (colorInfo == null || !colorInfo.isDataSpaceValid()) ? ColorInfo.SDR_BT709_LIMITED : colorInfo;
    }

    /* JADX INFO: Access modifiers changed from: private */
    final class VideoSinkImpl implements VideoSink, Listener {
        private final Context context;
        private boolean hasRegisteredFirstInputStream;
        private long inputBufferTimestampAdjustmentUs;
        private Format inputFormat;
        private long inputStreamOffsetUs;
        private int inputType;
        private long pendingInputStreamBufferPresentationTimeUs;
        private boolean pendingInputStreamOffsetChange;
        private Effect rotationEffect;
        private VideoFrameProcessor videoFrameProcessor;
        private final int videoFrameProcessorMaxPendingFrameCount;
        private final ArrayList<Effect> videoEffects = new ArrayList<>();
        private long finalBufferPresentationTimeUs = C.TIME_UNSET;
        private long lastBufferPresentationTimeUs = C.TIME_UNSET;
        private VideoSink.Listener listener = VideoSink.Listener.NO_OP;
        private Executor listenerExecutor = CompositingVideoSinkProvider.NO_OP_EXECUTOR;

        public VideoSinkImpl(Context context) {
            this.context = context;
            this.videoFrameProcessorMaxPendingFrameCount = Util.getMaxPendingFramesCountForMediaCodecDecoders(context);
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void onRendererEnabled(boolean z) {
            CompositingVideoSinkProvider.this.videoFrameReleaseControl.onEnabled(z);
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void onRendererDisabled() {
            CompositingVideoSinkProvider.this.videoFrameReleaseControl.onDisabled();
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void onRendererStarted() {
            CompositingVideoSinkProvider.this.videoFrameReleaseControl.onStarted();
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void onRendererStopped() {
            CompositingVideoSinkProvider.this.videoFrameReleaseControl.onStopped();
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void setListener(VideoSink.Listener listener, Executor executor) {
            this.listener = listener;
            this.listenerExecutor = executor;
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void initialize(Format format) throws VideoSink.VideoSinkException {
            Assertions.checkState(!isInitialized());
            this.videoFrameProcessor = CompositingVideoSinkProvider.this.initialize(format);
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        @EnsuresNonNullIf(expression = {"videoFrameProcessor"}, result = true)
        public boolean isInitialized() {
            return this.videoFrameProcessor != null;
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void flush(boolean z) {
            if (isInitialized()) {
                this.videoFrameProcessor.flush();
            }
            this.hasRegisteredFirstInputStream = false;
            this.finalBufferPresentationTimeUs = C.TIME_UNSET;
            this.lastBufferPresentationTimeUs = C.TIME_UNSET;
            CompositingVideoSinkProvider.this.flush();
            if (z) {
                CompositingVideoSinkProvider.this.videoFrameReleaseControl.reset();
            }
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public boolean isReady() {
            return isInitialized() && CompositingVideoSinkProvider.this.isReady();
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public boolean isEnded() {
            if (isInitialized()) {
                long j = this.finalBufferPresentationTimeUs;
                if (j != C.TIME_UNSET && CompositingVideoSinkProvider.this.hasReleasedFrame(j)) {
                    return true;
                }
            }
            return false;
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void registerInputStream(int i, Format format) {
            Format format2;
            Assertions.checkState(isInitialized());
            if (i == 1 || i == 2) {
                CompositingVideoSinkProvider.this.videoFrameReleaseControl.setFrameRate(format.frameRate);
                if (i == 1 && Util.SDK_INT < 21 && format.rotationDegrees != -1 && format.rotationDegrees != 0) {
                    if (this.rotationEffect == null || (format2 = this.inputFormat) == null || format2.rotationDegrees != format.rotationDegrees) {
                        this.rotationEffect = ScaleAndRotateAccessor.createRotationEffect(format.rotationDegrees);
                    }
                } else {
                    this.rotationEffect = null;
                }
                this.inputType = i;
                this.inputFormat = format;
                if (!this.hasRegisteredFirstInputStream) {
                    maybeRegisterInputStream();
                    this.hasRegisteredFirstInputStream = true;
                    this.pendingInputStreamBufferPresentationTimeUs = C.TIME_UNSET;
                    return;
                } else {
                    Assertions.checkState(this.lastBufferPresentationTimeUs != C.TIME_UNSET);
                    this.pendingInputStreamBufferPresentationTimeUs = this.lastBufferPresentationTimeUs;
                    return;
                }
            }
            throw new UnsupportedOperationException("Unsupported input type " + i);
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public boolean isFrameDropAllowedOnInput() {
            return Util.isFrameDropAllowedOnSurfaceInput(this.context);
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public Surface getInputSurface() {
            Assertions.checkState(isInitialized());
            return ((VideoFrameProcessor) Assertions.checkStateNotNull(this.videoFrameProcessor)).getInputSurface();
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void setVideoFrameMetadataListener(VideoFrameMetadataListener videoFrameMetadataListener) {
            CompositingVideoSinkProvider.this.setVideoFrameMetadataListener(videoFrameMetadataListener);
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void setPlaybackSpeed(float f) {
            CompositingVideoSinkProvider.this.setPlaybackSpeed(f);
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void setVideoEffects(List<Effect> list) {
            if (this.videoEffects.equals(list)) {
                return;
            }
            setPendingVideoEffects(list);
            maybeRegisterInputStream();
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void setPendingVideoEffects(List<Effect> list) {
            this.videoEffects.clear();
            this.videoEffects.addAll(list);
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void setStreamOffsetAndAdjustmentUs(long j, long j2) {
            this.pendingInputStreamOffsetChange |= (this.inputStreamOffsetUs == j && this.inputBufferTimestampAdjustmentUs == j2) ? false : true;
            this.inputStreamOffsetUs = j;
            this.inputBufferTimestampAdjustmentUs = j2;
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void setOutputSurfaceInfo(Surface surface, Size size) {
            CompositingVideoSinkProvider.this.setOutputSurfaceInfo(surface, size);
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void clearOutputSurfaceInfo() {
            CompositingVideoSinkProvider.this.clearOutputSurfaceInfo();
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void enableMayRenderStartOfStream() {
            CompositingVideoSinkProvider.this.videoFrameReleaseControl.allowReleaseFirstFrameBeforeStarted();
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public long registerInputFrame(long j, boolean z) {
            Assertions.checkState(isInitialized());
            Assertions.checkState(this.videoFrameProcessorMaxPendingFrameCount != -1);
            long j2 = this.pendingInputStreamBufferPresentationTimeUs;
            if (j2 != C.TIME_UNSET) {
                if (!CompositingVideoSinkProvider.this.hasReleasedFrame(j2)) {
                    return C.TIME_UNSET;
                }
                maybeRegisterInputStream();
                this.pendingInputStreamBufferPresentationTimeUs = C.TIME_UNSET;
            }
            if (((VideoFrameProcessor) Assertions.checkStateNotNull(this.videoFrameProcessor)).getPendingInputFrameCount() >= this.videoFrameProcessorMaxPendingFrameCount || !((VideoFrameProcessor) Assertions.checkStateNotNull(this.videoFrameProcessor)).registerInputFrame()) {
                return C.TIME_UNSET;
            }
            long j3 = j - this.inputBufferTimestampAdjustmentUs;
            maybeSetStreamOffsetChange(j3);
            this.lastBufferPresentationTimeUs = j3;
            if (z) {
                this.finalBufferPresentationTimeUs = j3;
            }
            return j * 1000;
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public boolean queueBitmap(Bitmap bitmap, TimestampIterator timestampIterator) {
            Assertions.checkState(isInitialized());
            if (!maybeRegisterPendingInputStream() || !((VideoFrameProcessor) Assertions.checkStateNotNull(this.videoFrameProcessor)).queueInputBitmap(bitmap, timestampIterator)) {
                return false;
            }
            TimestampIterator timestampIteratorCopyOf = timestampIterator.copyOf();
            long next = timestampIteratorCopyOf.next();
            long lastTimestampUs = timestampIteratorCopyOf.getLastTimestampUs() - this.inputBufferTimestampAdjustmentUs;
            Assertions.checkState(lastTimestampUs != C.TIME_UNSET);
            maybeSetStreamOffsetChange(next);
            this.lastBufferPresentationTimeUs = lastTimestampUs;
            this.finalBufferPresentationTimeUs = lastTimestampUs;
            return true;
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void render(long j, long j2) throws VideoSink.VideoSinkException {
            try {
                CompositingVideoSinkProvider.this.render(j, j2);
            } catch (ExoPlaybackException e) {
                Format formatBuild = this.inputFormat;
                if (formatBuild == null) {
                    formatBuild = new Format.Builder().build();
                }
                throw new VideoSink.VideoSinkException(e, formatBuild);
            }
        }

        @Override // androidx.media3.exoplayer.video.VideoSink
        public void release() {
            CompositingVideoSinkProvider.this.release();
        }

        private void maybeSetStreamOffsetChange(long j) {
            if (this.pendingInputStreamOffsetChange) {
                CompositingVideoSinkProvider.this.onStreamOffsetChange(this.inputBufferTimestampAdjustmentUs, j, this.inputStreamOffsetUs);
                this.pendingInputStreamOffsetChange = false;
            }
        }

        private boolean maybeRegisterPendingInputStream() {
            long j = this.pendingInputStreamBufferPresentationTimeUs;
            if (j == C.TIME_UNSET) {
                return true;
            }
            if (!CompositingVideoSinkProvider.this.hasReleasedFrame(j)) {
                return false;
            }
            maybeRegisterInputStream();
            this.pendingInputStreamBufferPresentationTimeUs = C.TIME_UNSET;
            return true;
        }

        private void maybeRegisterInputStream() {
            if (this.inputFormat == null) {
                return;
            }
            ArrayList arrayList = new ArrayList();
            Effect effect = this.rotationEffect;
            if (effect != null) {
                arrayList.add(effect);
            }
            arrayList.addAll(this.videoEffects);
            Format format = (Format) Assertions.checkNotNull(this.inputFormat);
            ((VideoFrameProcessor) Assertions.checkStateNotNull(this.videoFrameProcessor)).registerInputStream(this.inputType, arrayList, new FrameInfo.Builder(CompositingVideoSinkProvider.getAdjustedInputColorInfo(format.colorInfo), format.width, format.height).setPixelWidthHeightRatio(format.pixelWidthHeightRatio).build());
            this.finalBufferPresentationTimeUs = C.TIME_UNSET;
        }

        @Override // androidx.media3.exoplayer.video.CompositingVideoSinkProvider.Listener
        public void onFirstFrameRendered(CompositingVideoSinkProvider compositingVideoSinkProvider) {
            final VideoSink.Listener listener = this.listener;
            this.listenerExecutor.execute(new Runnable() { // from class: androidx.media3.exoplayer.video.CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m306x348684b(listener);
                }
            });
        }

        /* renamed from: lambda$onFirstFrameRendered$0$androidx-media3-exoplayer-video-CompositingVideoSinkProvider$VideoSinkImpl, reason: not valid java name */
        /* synthetic */ void m306x348684b(VideoSink.Listener listener) {
            listener.onFirstFrameRendered(this);
        }

        @Override // androidx.media3.exoplayer.video.CompositingVideoSinkProvider.Listener
        public void onFrameDropped(CompositingVideoSinkProvider compositingVideoSinkProvider) {
            final VideoSink.Listener listener = this.listener;
            this.listenerExecutor.execute(new Runnable() { // from class: androidx.media3.exoplayer.video.CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m307x461c6929(listener);
                }
            });
        }

        /* renamed from: lambda$onFrameDropped$1$androidx-media3-exoplayer-video-CompositingVideoSinkProvider$VideoSinkImpl, reason: not valid java name */
        /* synthetic */ void m307x461c6929(VideoSink.Listener listener) {
            listener.onFrameDropped((VideoSink) Assertions.checkStateNotNull(this));
        }

        @Override // androidx.media3.exoplayer.video.CompositingVideoSinkProvider.Listener
        public void onVideoSizeChanged(CompositingVideoSinkProvider compositingVideoSinkProvider, final VideoSize videoSize) {
            final VideoSink.Listener listener = this.listener;
            this.listenerExecutor.execute(new Runnable() { // from class: androidx.media3.exoplayer.video.CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m308xf251aa43(listener, videoSize);
                }
            });
        }

        /* renamed from: lambda$onVideoSizeChanged$2$androidx-media3-exoplayer-video-CompositingVideoSinkProvider$VideoSinkImpl, reason: not valid java name */
        /* synthetic */ void m308xf251aa43(VideoSink.Listener listener, VideoSize videoSize) {
            listener.onVideoSizeChanged(this, videoSize);
        }

        @Override // androidx.media3.exoplayer.video.CompositingVideoSinkProvider.Listener
        public void onError(CompositingVideoSinkProvider compositingVideoSinkProvider, final VideoFrameProcessingException videoFrameProcessingException) {
            final VideoSink.Listener listener = this.listener;
            this.listenerExecutor.execute(new Runnable() { // from class: androidx.media3.exoplayer.video.CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m305x1676cf0a(listener, videoFrameProcessingException);
                }
            });
        }

        /* renamed from: lambda$onError$3$androidx-media3-exoplayer-video-CompositingVideoSinkProvider$VideoSinkImpl, reason: not valid java name */
        /* synthetic */ void m305x1676cf0a(VideoSink.Listener listener, VideoFrameProcessingException videoFrameProcessingException) {
            listener.onError(this, new VideoSink.VideoSinkException(videoFrameProcessingException, (Format) Assertions.checkStateNotNull(this.inputFormat)));
        }
    }

    private final class FrameRendererImpl implements VideoFrameRenderControl.FrameRenderer {
        private FrameRendererImpl() {
        }

        @Override // androidx.media3.exoplayer.video.VideoFrameRenderControl.FrameRenderer
        public void onVideoSizeChanged(VideoSize videoSize) {
            CompositingVideoSinkProvider.this.outputFormat = new Format.Builder().setWidth(videoSize.width).setHeight(videoSize.height).setSampleMimeType(MimeTypes.VIDEO_RAW).build();
            Iterator it = CompositingVideoSinkProvider.this.listeners.iterator();
            while (it.hasNext()) {
                ((Listener) it.next()).onVideoSizeChanged(CompositingVideoSinkProvider.this, videoSize);
            }
        }

        @Override // androidx.media3.exoplayer.video.VideoFrameRenderControl.FrameRenderer
        public void renderFrame(long j, long j2, long j3, boolean z) {
            if (z && CompositingVideoSinkProvider.this.currentSurfaceAndSize != null) {
                Iterator it = CompositingVideoSinkProvider.this.listeners.iterator();
                while (it.hasNext()) {
                    ((Listener) it.next()).onFirstFrameRendered(CompositingVideoSinkProvider.this);
                }
            }
            if (CompositingVideoSinkProvider.this.videoFrameMetadataListener != null) {
                CompositingVideoSinkProvider.this.videoFrameMetadataListener.onVideoFrameAboutToBeRendered(j2, CompositingVideoSinkProvider.this.clock.nanoTime(), CompositingVideoSinkProvider.this.outputFormat == null ? new Format.Builder().build() : CompositingVideoSinkProvider.this.outputFormat, null);
            }
            ((PreviewingVideoGraph) Assertions.checkStateNotNull(CompositingVideoSinkProvider.this.videoGraph)).renderOutputFrame(j);
        }

        @Override // androidx.media3.exoplayer.video.VideoFrameRenderControl.FrameRenderer
        public void dropFrame() {
            Iterator it = CompositingVideoSinkProvider.this.listeners.iterator();
            while (it.hasNext()) {
                ((Listener) it.next()).onFrameDropped(CompositingVideoSinkProvider.this);
            }
            ((PreviewingVideoGraph) Assertions.checkStateNotNull(CompositingVideoSinkProvider.this.videoGraph)).renderOutputFrame(-2L);
        }
    }

    private static final class ReflectivePreviewingSingleInputVideoGraphFactory implements PreviewingVideoGraph.Factory {
        private final VideoFrameProcessor.Factory videoFrameProcessorFactory;

        public ReflectivePreviewingSingleInputVideoGraphFactory(VideoFrameProcessor.Factory factory) {
            this.videoFrameProcessorFactory = factory;
        }

        @Override // androidx.media3.common.PreviewingVideoGraph.Factory
        public PreviewingVideoGraph create(Context context, ColorInfo colorInfo, DebugViewProvider debugViewProvider, VideoGraph.Listener listener, Executor executor, List<Effect> list, long j) throws VideoFrameProcessingException, NoSuchMethodException, SecurityException {
            try {
                Constructor<?> constructor = Class.forName("androidx.media3.effect.PreviewingSingleInputVideoGraph$Factory").getConstructor(VideoFrameProcessor.Factory.class);
                Object[] objArr = new Object[1];
                try {
                    objArr[0] = this.videoFrameProcessorFactory;
                    return ((PreviewingVideoGraph.Factory) constructor.newInstance(objArr)).create(context, colorInfo, debugViewProvider, listener, executor, list, j);
                } catch (Exception e) {
                    e = e;
                    throw VideoFrameProcessingException.from(e);
                }
            } catch (Exception e2) {
                e = e2;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    static final class ReflectiveDefaultVideoFrameProcessorFactory implements VideoFrameProcessor.Factory {
        private static final Supplier<VideoFrameProcessor.Factory> VIDEO_FRAME_PROCESSOR_FACTORY_SUPPLIER = Suppliers.memoize(new Supplier() { // from class: androidx.media3.exoplayer.video.CompositingVideoSinkProvider$ReflectiveDefaultVideoFrameProcessorFactory$$ExternalSyntheticLambda0
            @Override // com.google.common.base.Supplier
            public final Object get() {
                return CompositingVideoSinkProvider.ReflectiveDefaultVideoFrameProcessorFactory.lambda$static$0();
            }
        });

        private ReflectiveDefaultVideoFrameProcessorFactory() {
        }

        static /* synthetic */ VideoFrameProcessor.Factory lambda$static$0() throws IllegalAccessException, InstantiationException, ClassNotFoundException, IllegalArgumentException, InvocationTargetException {
            try {
                Class<?> cls = Class.forName("androidx.media3.effect.DefaultVideoFrameProcessor$Factory$Builder");
                return (VideoFrameProcessor.Factory) Assertions.checkNotNull(cls.getMethod("build", new Class[0]).invoke(cls.getConstructor(new Class[0]).newInstance(new Object[0]), new Object[0]));
            } catch (Exception e) {
                throw new IllegalStateException(e);
            }
        }

        @Override // androidx.media3.common.VideoFrameProcessor.Factory
        public VideoFrameProcessor create(Context context, DebugViewProvider debugViewProvider, ColorInfo colorInfo, boolean z, Executor executor, VideoFrameProcessor.Listener listener) throws VideoFrameProcessingException {
            return VIDEO_FRAME_PROCESSOR_FACTORY_SUPPLIER.get().create(context, debugViewProvider, colorInfo, z, executor, listener);
        }
    }

    private static final class ScaleAndRotateAccessor {
        private static Method buildScaleAndRotateTransformationMethod;
        private static Constructor<?> scaleAndRotateTransformationBuilderConstructor;
        private static Method setRotationMethod;

        private ScaleAndRotateAccessor() {
        }

        public static Effect createRotationEffect(float f) throws IllegalAccessException, InstantiationException, IllegalArgumentException, InvocationTargetException {
            try {
                prepare();
                Object objNewInstance = scaleAndRotateTransformationBuilderConstructor.newInstance(new Object[0]);
                setRotationMethod.invoke(objNewInstance, Float.valueOf(f));
                return (Effect) Assertions.checkNotNull(buildScaleAndRotateTransformationMethod.invoke(objNewInstance, new Object[0]));
            } catch (Exception e) {
                throw new IllegalStateException(e);
            }
        }

        @EnsuresNonNull({"scaleAndRotateTransformationBuilderConstructor", "setRotationMethod", "buildScaleAndRotateTransformationMethod"})
        private static void prepare() throws NoSuchMethodException, ClassNotFoundException {
            if (scaleAndRotateTransformationBuilderConstructor == null || setRotationMethod == null || buildScaleAndRotateTransformationMethod == null) {
                Class<?> cls = Class.forName("androidx.media3.effect.ScaleAndRotateTransformation$Builder");
                scaleAndRotateTransformationBuilderConstructor = cls.getConstructor(new Class[0]);
                setRotationMethod = cls.getMethod("setRotationDegrees", Float.TYPE);
                buildScaleAndRotateTransformationMethod = cls.getMethod("build", new Class[0]);
            }
        }
    }
}
