package androidx.media3.exoplayer;

import androidx.media3.common.Format;
import androidx.media3.common.Timeline;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Clock;
import androidx.media3.common.util.Util;
import androidx.media3.decoder.DecoderInputBuffer;
import androidx.media3.exoplayer.Renderer;
import androidx.media3.exoplayer.RendererCapabilities;
import androidx.media3.exoplayer.analytics.PlayerId;
import androidx.media3.exoplayer.source.MediaSource;
import androidx.media3.exoplayer.source.SampleStream;
import java.io.IOException;

/* loaded from: classes.dex */
public abstract class BaseRenderer implements Renderer, RendererCapabilities {
    private Clock clock;
    private RendererConfiguration configuration;
    private int index;
    private long lastResetPositionUs;
    private PlayerId playerId;
    private RendererCapabilities.Listener rendererCapabilitiesListener;
    private int state;
    private SampleStream stream;
    private Format[] streamFormats;
    private boolean streamIsFinal;
    private long streamOffsetUs;
    private boolean throwRendererExceptionIsExecuting;
    private final int trackType;
    private final Object lock = new Object();
    private final FormatHolder formatHolder = new FormatHolder();
    private long readingPositionUs = Long.MIN_VALUE;
    private Timeline timeline = Timeline.EMPTY;

    @Override // androidx.media3.exoplayer.Renderer
    public /* synthetic */ void enableMayRenderStartOfStream() {
        Renderer.CC.$default$enableMayRenderStartOfStream(this);
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final RendererCapabilities getCapabilities() {
        return this;
    }

    @Override // androidx.media3.exoplayer.Renderer
    public /* synthetic */ long getDurationToProgressUs(long j, long j2) {
        return Renderer.DEFAULT_DURATION_TO_PROGRESS_US;
    }

    @Override // androidx.media3.exoplayer.Renderer
    public MediaClock getMediaClock() {
        return null;
    }

    @Override // androidx.media3.exoplayer.PlayerMessage.Target
    public void handleMessage(int i, Object obj) throws ExoPlaybackException {
    }

    protected void onDisabled() {
    }

    protected void onEnabled(boolean z, boolean z2) throws ExoPlaybackException {
    }

    protected void onInit() {
    }

    protected void onPositionReset(long j, boolean z) throws ExoPlaybackException {
    }

    protected void onRelease() {
    }

    protected void onReset() {
    }

    protected void onStarted() throws ExoPlaybackException {
    }

    protected void onStopped() {
    }

    protected void onStreamChanged(Format[] formatArr, long j, long j2, MediaSource.MediaPeriodId mediaPeriodId) throws ExoPlaybackException {
    }

    protected void onTimelineChanged(Timeline timeline) {
    }

    @Override // androidx.media3.exoplayer.Renderer
    public /* synthetic */ void setPlaybackSpeed(float f, float f2) throws ExoPlaybackException {
        Renderer.CC.$default$setPlaybackSpeed(this, f, f2);
    }

    @Override // androidx.media3.exoplayer.RendererCapabilities
    public int supportsMixedMimeTypeAdaptation() throws ExoPlaybackException {
        return 0;
    }

    public BaseRenderer(int i) {
        this.trackType = i;
    }

    @Override // androidx.media3.exoplayer.Renderer, androidx.media3.exoplayer.RendererCapabilities
    public final int getTrackType() {
        return this.trackType;
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void init(int i, PlayerId playerId, Clock clock) {
        this.index = i;
        this.playerId = playerId;
        this.clock = clock;
        onInit();
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final int getState() {
        return this.state;
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void enable(RendererConfiguration rendererConfiguration, Format[] formatArr, SampleStream sampleStream, long j, boolean z, boolean z2, long j2, long j3, MediaSource.MediaPeriodId mediaPeriodId) throws ExoPlaybackException {
        Assertions.checkState(this.state == 0);
        this.configuration = rendererConfiguration;
        this.state = 1;
        onEnabled(z, z2);
        replaceStream(formatArr, sampleStream, j2, j3, mediaPeriodId);
        resetPosition(j2, z);
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void start() throws ExoPlaybackException {
        Assertions.checkState(this.state == 1);
        this.state = 2;
        onStarted();
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void replaceStream(Format[] formatArr, SampleStream sampleStream, long j, long j2, MediaSource.MediaPeriodId mediaPeriodId) throws ExoPlaybackException {
        Assertions.checkState(!this.streamIsFinal);
        this.stream = sampleStream;
        if (this.readingPositionUs == Long.MIN_VALUE) {
            this.readingPositionUs = j;
        }
        this.streamFormats = formatArr;
        this.streamOffsetUs = j2;
        onStreamChanged(formatArr, j, j2, mediaPeriodId);
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final SampleStream getStream() {
        return this.stream;
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final boolean hasReadStreamToEnd() {
        return this.readingPositionUs == Long.MIN_VALUE;
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final long getReadingPositionUs() {
        return this.readingPositionUs;
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void setCurrentStreamFinal() {
        this.streamIsFinal = true;
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final boolean isCurrentStreamFinal() {
        return this.streamIsFinal;
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void maybeThrowStreamError() throws IOException {
        ((SampleStream) Assertions.checkNotNull(this.stream)).maybeThrowError();
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void setTimeline(Timeline timeline) {
        if (Util.areEqual(this.timeline, timeline)) {
            return;
        }
        this.timeline = timeline;
        onTimelineChanged(timeline);
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void resetPosition(long j) throws ExoPlaybackException {
        resetPosition(j, false);
    }

    private void resetPosition(long j, boolean z) throws ExoPlaybackException {
        this.streamIsFinal = false;
        this.lastResetPositionUs = j;
        this.readingPositionUs = j;
        onPositionReset(j, z);
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void stop() {
        Assertions.checkState(this.state == 2);
        this.state = 1;
        onStopped();
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void disable() {
        Assertions.checkState(this.state == 1);
        this.formatHolder.clear();
        this.state = 0;
        this.stream = null;
        this.streamFormats = null;
        this.streamIsFinal = false;
        onDisabled();
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void reset() {
        Assertions.checkState(this.state == 0);
        this.formatHolder.clear();
        onReset();
    }

    @Override // androidx.media3.exoplayer.Renderer
    public final void release() {
        Assertions.checkState(this.state == 0);
        onRelease();
    }

    @Override // androidx.media3.exoplayer.RendererCapabilities
    public final void setListener(RendererCapabilities.Listener listener) {
        synchronized (this.lock) {
            this.rendererCapabilitiesListener = listener;
        }
    }

    @Override // androidx.media3.exoplayer.RendererCapabilities
    public final void clearListener() {
        synchronized (this.lock) {
            this.rendererCapabilitiesListener = null;
        }
    }

    protected final long getLastResetPositionUs() {
        return this.lastResetPositionUs;
    }

    protected final FormatHolder getFormatHolder() {
        this.formatHolder.clear();
        return this.formatHolder;
    }

    protected final Format[] getStreamFormats() {
        return (Format[]) Assertions.checkNotNull(this.streamFormats);
    }

    protected final RendererConfiguration getConfiguration() {
        return (RendererConfiguration) Assertions.checkNotNull(this.configuration);
    }

    protected final int getIndex() {
        return this.index;
    }

    protected final PlayerId getPlayerId() {
        return (PlayerId) Assertions.checkNotNull(this.playerId);
    }

    protected final Clock getClock() {
        return (Clock) Assertions.checkNotNull(this.clock);
    }

    protected final Timeline getTimeline() {
        return this.timeline;
    }

    protected final ExoPlaybackException createRendererException(Throwable th, Format format, int i) {
        return createRendererException(th, format, false, i);
    }

    protected final ExoPlaybackException createRendererException(Throwable th, Format format, boolean z, int i) {
        int i2;
        if (format == null || this.throwRendererExceptionIsExecuting) {
            i2 = 4;
        } else {
            this.throwRendererExceptionIsExecuting = true;
            try {
                int formatSupport = RendererCapabilities.CC.getFormatSupport(supportsFormat(format));
                this.throwRendererExceptionIsExecuting = false;
                i2 = formatSupport;
            } catch (ExoPlaybackException unused) {
                this.throwRendererExceptionIsExecuting = false;
            } catch (Throwable th2) {
                this.throwRendererExceptionIsExecuting = false;
                throw th2;
            }
        }
        return ExoPlaybackException.createForRenderer(th, getName(), getIndex(), format, i2, z, i);
    }

    protected final int readSource(FormatHolder formatHolder, DecoderInputBuffer decoderInputBuffer, int i) {
        int data = ((SampleStream) Assertions.checkNotNull(this.stream)).readData(formatHolder, decoderInputBuffer, i);
        if (data == -4) {
            if (decoderInputBuffer.isEndOfStream()) {
                this.readingPositionUs = Long.MIN_VALUE;
                return this.streamIsFinal ? -4 : -3;
            }
            decoderInputBuffer.timeUs += this.streamOffsetUs;
            this.readingPositionUs = Math.max(this.readingPositionUs, decoderInputBuffer.timeUs);
        } else if (data == -5) {
            Format format = (Format) Assertions.checkNotNull(formatHolder.format);
            if (format.subsampleOffsetUs != Long.MAX_VALUE) {
                formatHolder.format = format.buildUpon().setSubsampleOffsetUs(format.subsampleOffsetUs + this.streamOffsetUs).build();
            }
        }
        return data;
    }

    protected int skipSource(long j) {
        return ((SampleStream) Assertions.checkNotNull(this.stream)).skipData(j - this.streamOffsetUs);
    }

    protected final boolean isSourceReady() {
        return hasReadStreamToEnd() ? this.streamIsFinal : ((SampleStream) Assertions.checkNotNull(this.stream)).isReady();
    }

    protected final void onRendererCapabilitiesChanged() {
        RendererCapabilities.Listener listener;
        synchronized (this.lock) {
            listener = this.rendererCapabilitiesListener;
        }
        if (listener != null) {
            listener.onRendererCapabilitiesChanged(this);
        }
    }
}
