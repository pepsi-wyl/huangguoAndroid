package androidx.media3.exoplayer.audio;

import android.os.Handler;
import android.os.SystemClock;
import androidx.media3.common.AudioAttributes;
import androidx.media3.common.AuxEffectInfo;
import androidx.media3.common.C;
import androidx.media3.common.Format;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.PlaybackException;
import androidx.media3.common.PlaybackParameters;
import androidx.media3.common.audio.AudioProcessor;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Log;
import androidx.media3.common.util.TraceUtil;
import androidx.media3.common.util.Util;
import androidx.media3.decoder.CryptoConfig;
import androidx.media3.decoder.Decoder;
import androidx.media3.decoder.DecoderException;
import androidx.media3.decoder.DecoderInputBuffer;
import androidx.media3.decoder.SimpleDecoderOutputBuffer;
import androidx.media3.exoplayer.BaseRenderer;
import androidx.media3.exoplayer.DecoderCounters;
import androidx.media3.exoplayer.DecoderReuseEvaluation;
import androidx.media3.exoplayer.ExoPlaybackException;
import androidx.media3.exoplayer.ExoPlayerImpl$$ExternalSyntheticApiModelOutline0;
import androidx.media3.exoplayer.FormatHolder;
import androidx.media3.exoplayer.MediaClock;
import androidx.media3.exoplayer.RendererCapabilities;
import androidx.media3.exoplayer.audio.AudioRendererEventListener;
import androidx.media3.exoplayer.audio.AudioSink;
import androidx.media3.exoplayer.audio.DefaultAudioSink;
import androidx.media3.exoplayer.drm.DrmSession;
import androidx.media3.exoplayer.source.MediaSource;
import com.google.common.base.MoreObjects;

/* loaded from: classes.dex */
public abstract class DecoderAudioRenderer<T extends Decoder<DecoderInputBuffer, ? extends SimpleDecoderOutputBuffer, ? extends DecoderException>> extends BaseRenderer implements MediaClock {
    private static final int MAX_PENDING_OUTPUT_STREAM_OFFSET_COUNT = 10;
    private static final int REINITIALIZATION_STATE_NONE = 0;
    private static final int REINITIALIZATION_STATE_SIGNAL_END_OF_STREAM = 1;
    private static final int REINITIALIZATION_STATE_WAIT_END_OF_STREAM = 2;
    private static final String TAG = "DecoderAudioRenderer";
    private boolean allowPositionDiscontinuity;
    private final AudioSink audioSink;
    private boolean audioTrackNeedsConfigure;
    private long currentPositionUs;
    private T decoder;
    private DecoderCounters decoderCounters;
    private DrmSession decoderDrmSession;
    private boolean decoderReceivedBuffers;
    private int decoderReinitializationState;
    private int encoderDelay;
    private int encoderPadding;
    private final AudioRendererEventListener.EventDispatcher eventDispatcher;
    private boolean firstStreamSampleRead;
    private final DecoderInputBuffer flagsOnlyBuffer;
    private boolean hasPendingReportedSkippedSilence;
    private DecoderInputBuffer inputBuffer;
    private Format inputFormat;
    private boolean inputStreamEnded;
    private SimpleDecoderOutputBuffer outputBuffer;
    private boolean outputStreamEnded;
    private long outputStreamOffsetUs;
    private int pendingOutputStreamOffsetCount;
    private final long[] pendingOutputStreamOffsetsUs;
    private DrmSession sourceDrmSession;

    protected abstract T createDecoder(Format format, CryptoConfig cryptoConfig) throws DecoderException;

    protected int[] getChannelMapping(T t) {
        return null;
    }

    @Override // androidx.media3.exoplayer.BaseRenderer, androidx.media3.exoplayer.Renderer
    public MediaClock getMediaClock() {
        return this;
    }

    protected abstract Format getOutputFormat(T t);

    protected abstract int supportsFormatInternal(Format format);

    public DecoderAudioRenderer() {
        this((Handler) null, (AudioRendererEventListener) null, new AudioProcessor[0]);
    }

    public DecoderAudioRenderer(Handler handler, AudioRendererEventListener audioRendererEventListener, AudioProcessor... audioProcessorArr) {
        this(handler, audioRendererEventListener, null, audioProcessorArr);
    }

    public DecoderAudioRenderer(Handler handler, AudioRendererEventListener audioRendererEventListener, AudioCapabilities audioCapabilities, AudioProcessor... audioProcessorArr) {
        this(handler, audioRendererEventListener, new DefaultAudioSink.Builder().setAudioCapabilities((AudioCapabilities) MoreObjects.firstNonNull(audioCapabilities, AudioCapabilities.DEFAULT_AUDIO_CAPABILITIES)).setAudioProcessors(audioProcessorArr).build());
    }

    public DecoderAudioRenderer(Handler handler, AudioRendererEventListener audioRendererEventListener, AudioSink audioSink) {
        super(1);
        this.eventDispatcher = new AudioRendererEventListener.EventDispatcher(handler, audioRendererEventListener);
        this.audioSink = audioSink;
        audioSink.setListener(new AudioSinkListener());
        this.flagsOnlyBuffer = DecoderInputBuffer.newNoDataInstance();
        this.decoderReinitializationState = 0;
        this.audioTrackNeedsConfigure = true;
        setOutputStreamOffsetUs(C.TIME_UNSET);
        this.pendingOutputStreamOffsetsUs = new long[10];
    }

    @Override // androidx.media3.exoplayer.RendererCapabilities
    public final int supportsFormat(Format format) {
        if (!MimeTypes.isAudio(format.sampleMimeType)) {
            return RendererCapabilities.CC.create(0);
        }
        int iSupportsFormatInternal = supportsFormatInternal(format);
        if (iSupportsFormatInternal <= 2) {
            return RendererCapabilities.CC.create(iSupportsFormatInternal);
        }
        return RendererCapabilities.CC.create(iSupportsFormatInternal, 8, Util.SDK_INT >= 21 ? 32 : 0);
    }

    protected final boolean sinkSupportsFormat(Format format) {
        return this.audioSink.supportsFormat(format);
    }

    protected final int getSinkFormatSupport(Format format) {
        return this.audioSink.getFormatSupport(format);
    }

    @Override // androidx.media3.exoplayer.Renderer
    public void render(long j, long j2) throws ExoPlaybackException {
        if (this.outputStreamEnded) {
            try {
                this.audioSink.playToEndOfStream();
                return;
            } catch (AudioSink.WriteException e) {
                throw createRendererException(e, e.format, e.isRecoverable, PlaybackException.ERROR_CODE_AUDIO_TRACK_WRITE_FAILED);
            }
        }
        if (this.inputFormat == null) {
            FormatHolder formatHolder = getFormatHolder();
            this.flagsOnlyBuffer.clear();
            int source = readSource(formatHolder, this.flagsOnlyBuffer, 2);
            if (source != -5) {
                if (source == -4) {
                    Assertions.checkState(this.flagsOnlyBuffer.isEndOfStream());
                    this.inputStreamEnded = true;
                    try {
                        processEndOfStream();
                        return;
                    } catch (AudioSink.WriteException e2) {
                        throw createRendererException(e2, null, PlaybackException.ERROR_CODE_AUDIO_TRACK_WRITE_FAILED);
                    }
                }
                return;
            }
            onInputFormatChanged(formatHolder);
        }
        maybeInitDecoder();
        if (this.decoder != null) {
            try {
                TraceUtil.beginSection("drainAndFeed");
                while (drainOutputBuffer()) {
                }
                while (feedInputBuffer()) {
                }
                TraceUtil.endSection();
                this.decoderCounters.ensureUpdated();
            } catch (DecoderException e3) {
                Log.e(TAG, "Audio codec error", e3);
                this.eventDispatcher.audioCodecError(e3);
                throw createRendererException(e3, this.inputFormat, PlaybackException.ERROR_CODE_DECODING_FAILED);
            } catch (AudioSink.ConfigurationException e4) {
                throw createRendererException(e4, e4.format, PlaybackException.ERROR_CODE_AUDIO_TRACK_INIT_FAILED);
            } catch (AudioSink.InitializationException e5) {
                throw createRendererException(e5, e5.format, e5.isRecoverable, PlaybackException.ERROR_CODE_AUDIO_TRACK_INIT_FAILED);
            } catch (AudioSink.WriteException e6) {
                throw createRendererException(e6, e6.format, e6.isRecoverable, PlaybackException.ERROR_CODE_AUDIO_TRACK_WRITE_FAILED);
            }
        }
    }

    protected void onPositionDiscontinuity() {
        this.allowPositionDiscontinuity = true;
    }

    protected DecoderReuseEvaluation canReuseDecoder(String str, Format format, Format format2) {
        return new DecoderReuseEvaluation(str, format, format2, 0, 1);
    }

    private boolean drainOutputBuffer() throws ExoPlaybackException, DecoderException, AudioSink.WriteException, AudioSink.InitializationException, AudioSink.ConfigurationException {
        if (this.outputBuffer == null) {
            SimpleDecoderOutputBuffer simpleDecoderOutputBuffer = (SimpleDecoderOutputBuffer) this.decoder.dequeueOutputBuffer();
            this.outputBuffer = simpleDecoderOutputBuffer;
            if (simpleDecoderOutputBuffer == null) {
                return false;
            }
            if (simpleDecoderOutputBuffer.skippedOutputBufferCount > 0) {
                this.decoderCounters.skippedOutputBufferCount += this.outputBuffer.skippedOutputBufferCount;
                this.audioSink.handleDiscontinuity();
            }
            if (this.outputBuffer.isFirstSample()) {
                processFirstSampleOfStream();
            }
        }
        if (this.outputBuffer.isEndOfStream()) {
            if (this.decoderReinitializationState == 2) {
                releaseDecoder();
                maybeInitDecoder();
                this.audioTrackNeedsConfigure = true;
            } else {
                this.outputBuffer.release();
                this.outputBuffer = null;
                try {
                    processEndOfStream();
                } catch (AudioSink.WriteException e) {
                    throw createRendererException(e, e.format, e.isRecoverable, PlaybackException.ERROR_CODE_AUDIO_TRACK_WRITE_FAILED);
                }
            }
            return false;
        }
        if (this.audioTrackNeedsConfigure) {
            this.audioSink.configure(getOutputFormat(this.decoder).buildUpon().setEncoderDelay(this.encoderDelay).setEncoderPadding(this.encoderPadding).setMetadata(this.inputFormat.metadata).setCustomData(this.inputFormat.customData).setId(this.inputFormat.id).setLabel(this.inputFormat.label).setLabels(this.inputFormat.labels).setLanguage(this.inputFormat.language).setSelectionFlags(this.inputFormat.selectionFlags).setRoleFlags(this.inputFormat.roleFlags).build(), 0, getChannelMapping(this.decoder));
            this.audioTrackNeedsConfigure = false;
        }
        if (!this.audioSink.handleBuffer(this.outputBuffer.data, this.outputBuffer.timeUs, 1)) {
            return false;
        }
        this.decoderCounters.renderedOutputBufferCount++;
        this.outputBuffer.release();
        this.outputBuffer = null;
        return true;
    }

    private void processFirstSampleOfStream() {
        this.audioSink.handleDiscontinuity();
        if (this.pendingOutputStreamOffsetCount != 0) {
            setOutputStreamOffsetUs(this.pendingOutputStreamOffsetsUs[0]);
            int i = this.pendingOutputStreamOffsetCount - 1;
            this.pendingOutputStreamOffsetCount = i;
            long[] jArr = this.pendingOutputStreamOffsetsUs;
            System.arraycopy(jArr, 1, jArr, 0, i);
        }
    }

    private void setOutputStreamOffsetUs(long j) {
        this.outputStreamOffsetUs = j;
        if (j != C.TIME_UNSET) {
            this.audioSink.setOutputStreamOffsetUs(j);
        }
    }

    private boolean feedInputBuffer() throws ExoPlaybackException, DecoderException {
        T t = this.decoder;
        if (t == null || this.decoderReinitializationState == 2 || this.inputStreamEnded) {
            return false;
        }
        if (this.inputBuffer == null) {
            DecoderInputBuffer decoderInputBuffer = (DecoderInputBuffer) t.dequeueInputBuffer();
            this.inputBuffer = decoderInputBuffer;
            if (decoderInputBuffer == null) {
                return false;
            }
        }
        if (this.decoderReinitializationState == 1) {
            this.inputBuffer.setFlags(4);
            this.decoder.queueInputBuffer(this.inputBuffer);
            this.inputBuffer = null;
            this.decoderReinitializationState = 2;
            return false;
        }
        FormatHolder formatHolder = getFormatHolder();
        int source = readSource(formatHolder, this.inputBuffer, 0);
        if (source == -5) {
            onInputFormatChanged(formatHolder);
            return true;
        }
        if (source != -4) {
            if (source == -3) {
                return false;
            }
            throw new IllegalStateException();
        }
        if (this.inputBuffer.isEndOfStream()) {
            this.inputStreamEnded = true;
            this.decoder.queueInputBuffer(this.inputBuffer);
            this.inputBuffer = null;
            return false;
        }
        if (!this.firstStreamSampleRead) {
            this.firstStreamSampleRead = true;
            this.inputBuffer.addFlag(C.BUFFER_FLAG_FIRST_SAMPLE);
        }
        this.inputBuffer.flip();
        this.inputBuffer.format = this.inputFormat;
        this.decoder.queueInputBuffer(this.inputBuffer);
        this.decoderReceivedBuffers = true;
        this.decoderCounters.queuedInputBufferCount++;
        this.inputBuffer = null;
        return true;
    }

    private void processEndOfStream() throws AudioSink.WriteException {
        this.outputStreamEnded = true;
        this.audioSink.playToEndOfStream();
    }

    private void flushDecoder() throws ExoPlaybackException {
        if (this.decoderReinitializationState != 0) {
            releaseDecoder();
            maybeInitDecoder();
            return;
        }
        this.inputBuffer = null;
        SimpleDecoderOutputBuffer simpleDecoderOutputBuffer = this.outputBuffer;
        if (simpleDecoderOutputBuffer != null) {
            simpleDecoderOutputBuffer.release();
            this.outputBuffer = null;
        }
        Decoder decoder = (Decoder) Assertions.checkNotNull(this.decoder);
        decoder.flush();
        decoder.setOutputStartTimeUs(getLastResetPositionUs());
        this.decoderReceivedBuffers = false;
    }

    @Override // androidx.media3.exoplayer.Renderer
    public boolean isEnded() {
        return this.outputStreamEnded && this.audioSink.isEnded();
    }

    @Override // androidx.media3.exoplayer.Renderer
    public boolean isReady() {
        return this.audioSink.hasPendingData() || (this.inputFormat != null && (isSourceReady() || this.outputBuffer != null));
    }

    @Override // androidx.media3.exoplayer.MediaClock
    public long getPositionUs() {
        if (getState() == 2) {
            updateCurrentPosition();
        }
        return this.currentPositionUs;
    }

    @Override // androidx.media3.exoplayer.MediaClock
    public boolean hasSkippedSilenceSinceLastCall() {
        boolean z = this.hasPendingReportedSkippedSilence;
        this.hasPendingReportedSkippedSilence = false;
        return z;
    }

    @Override // androidx.media3.exoplayer.MediaClock
    public void setPlaybackParameters(PlaybackParameters playbackParameters) {
        this.audioSink.setPlaybackParameters(playbackParameters);
    }

    @Override // androidx.media3.exoplayer.MediaClock
    public PlaybackParameters getPlaybackParameters() {
        return this.audioSink.getPlaybackParameters();
    }

    @Override // androidx.media3.exoplayer.BaseRenderer
    protected void onEnabled(boolean z, boolean z2) throws ExoPlaybackException {
        DecoderCounters decoderCounters = new DecoderCounters();
        this.decoderCounters = decoderCounters;
        this.eventDispatcher.enabled(decoderCounters);
        if (getConfiguration().tunneling) {
            this.audioSink.enableTunnelingV21();
        } else {
            this.audioSink.disableTunneling();
        }
        this.audioSink.setPlayerId(getPlayerId());
        this.audioSink.setClock(getClock());
    }

    @Override // androidx.media3.exoplayer.BaseRenderer
    protected void onPositionReset(long j, boolean z) throws ExoPlaybackException {
        this.audioSink.flush();
        this.currentPositionUs = j;
        this.hasPendingReportedSkippedSilence = false;
        this.allowPositionDiscontinuity = true;
        this.inputStreamEnded = false;
        this.outputStreamEnded = false;
        if (this.decoder != null) {
            flushDecoder();
        }
    }

    @Override // androidx.media3.exoplayer.BaseRenderer
    protected void onStarted() {
        this.audioSink.play();
    }

    @Override // androidx.media3.exoplayer.BaseRenderer
    protected void onStopped() {
        updateCurrentPosition();
        this.audioSink.pause();
    }

    @Override // androidx.media3.exoplayer.BaseRenderer
    protected void onDisabled() {
        this.inputFormat = null;
        this.audioTrackNeedsConfigure = true;
        setOutputStreamOffsetUs(C.TIME_UNSET);
        this.hasPendingReportedSkippedSilence = false;
        try {
            setSourceDrmSession(null);
            releaseDecoder();
            this.audioSink.reset();
        } finally {
            this.eventDispatcher.disabled(this.decoderCounters);
        }
    }

    @Override // androidx.media3.exoplayer.BaseRenderer
    protected void onStreamChanged(Format[] formatArr, long j, long j2, MediaSource.MediaPeriodId mediaPeriodId) throws ExoPlaybackException {
        super.onStreamChanged(formatArr, j, j2, mediaPeriodId);
        this.firstStreamSampleRead = false;
        if (this.outputStreamOffsetUs == C.TIME_UNSET) {
            setOutputStreamOffsetUs(j2);
            return;
        }
        int i = this.pendingOutputStreamOffsetCount;
        if (i == this.pendingOutputStreamOffsetsUs.length) {
            Log.w(TAG, "Too many stream changes, so dropping offset: " + this.pendingOutputStreamOffsetsUs[this.pendingOutputStreamOffsetCount - 1]);
        } else {
            this.pendingOutputStreamOffsetCount = i + 1;
        }
        this.pendingOutputStreamOffsetsUs[this.pendingOutputStreamOffsetCount - 1] = j2;
    }

    @Override // androidx.media3.exoplayer.BaseRenderer, androidx.media3.exoplayer.PlayerMessage.Target
    public void handleMessage(int i, Object obj) throws ExoPlaybackException {
        if (i == 2) {
            this.audioSink.setVolume(((Float) obj).floatValue());
            return;
        }
        if (i == 3) {
            this.audioSink.setAudioAttributes((AudioAttributes) obj);
            return;
        }
        if (i == 6) {
            this.audioSink.setAuxEffectInfo((AuxEffectInfo) obj);
            return;
        }
        if (i == 12) {
            if (Util.SDK_INT >= 23) {
                Api23.setAudioSinkPreferredDevice(this.audioSink, obj);
            }
        } else if (i == 9) {
            this.audioSink.setSkipSilenceEnabled(((Boolean) obj).booleanValue());
        } else if (i == 10) {
            this.audioSink.setAudioSessionId(((Integer) obj).intValue());
        } else {
            super.handleMessage(i, obj);
        }
    }

    private void maybeInitDecoder() throws ExoPlaybackException {
        CryptoConfig cryptoConfig;
        if (this.decoder != null) {
            return;
        }
        setDecoderDrmSession(this.sourceDrmSession);
        DrmSession drmSession = this.decoderDrmSession;
        if (drmSession != null) {
            cryptoConfig = drmSession.getCryptoConfig();
            if (cryptoConfig == null && this.decoderDrmSession.getError() == null) {
                return;
            }
        } else {
            cryptoConfig = null;
        }
        try {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            TraceUtil.beginSection("createAudioDecoder");
            T t = (T) createDecoder(this.inputFormat, cryptoConfig);
            this.decoder = t;
            t.setOutputStartTimeUs(getLastResetPositionUs());
            TraceUtil.endSection();
            long jElapsedRealtime2 = SystemClock.elapsedRealtime();
            this.eventDispatcher.decoderInitialized(this.decoder.getName(), jElapsedRealtime2, jElapsedRealtime2 - jElapsedRealtime);
            this.decoderCounters.decoderInitCount++;
        } catch (DecoderException e) {
            Log.e(TAG, "Audio codec error", e);
            this.eventDispatcher.audioCodecError(e);
            throw createRendererException(e, this.inputFormat, PlaybackException.ERROR_CODE_DECODER_INIT_FAILED);
        } catch (OutOfMemoryError e2) {
            throw createRendererException(e2, this.inputFormat, PlaybackException.ERROR_CODE_DECODER_INIT_FAILED);
        }
    }

    private void releaseDecoder() {
        this.inputBuffer = null;
        this.outputBuffer = null;
        this.decoderReinitializationState = 0;
        this.decoderReceivedBuffers = false;
        if (this.decoder != null) {
            this.decoderCounters.decoderReleaseCount++;
            this.decoder.release();
            this.eventDispatcher.decoderReleased(this.decoder.getName());
            this.decoder = null;
        }
        setDecoderDrmSession(null);
    }

    private void setSourceDrmSession(DrmSession drmSession) {
        DrmSession.CC.replaceSession(this.sourceDrmSession, drmSession);
        this.sourceDrmSession = drmSession;
    }

    private void setDecoderDrmSession(DrmSession drmSession) {
        DrmSession.CC.replaceSession(this.decoderDrmSession, drmSession);
        this.decoderDrmSession = drmSession;
    }

    private void onInputFormatChanged(FormatHolder formatHolder) throws ExoPlaybackException {
        DecoderReuseEvaluation decoderReuseEvaluationCanReuseDecoder;
        Format format = (Format) Assertions.checkNotNull(formatHolder.format);
        setSourceDrmSession(formatHolder.drmSession);
        Format format2 = this.inputFormat;
        this.inputFormat = format;
        this.encoderDelay = format.encoderDelay;
        this.encoderPadding = format.encoderPadding;
        T t = this.decoder;
        if (t == null) {
            maybeInitDecoder();
            this.eventDispatcher.inputFormatChanged(this.inputFormat, null);
            return;
        }
        if (this.sourceDrmSession != this.decoderDrmSession) {
            decoderReuseEvaluationCanReuseDecoder = new DecoderReuseEvaluation(t.getName(), format2, format, 0, 128);
        } else {
            decoderReuseEvaluationCanReuseDecoder = canReuseDecoder(t.getName(), format2, format);
        }
        if (decoderReuseEvaluationCanReuseDecoder.result == 0) {
            if (this.decoderReceivedBuffers) {
                this.decoderReinitializationState = 1;
            } else {
                releaseDecoder();
                maybeInitDecoder();
                this.audioTrackNeedsConfigure = true;
            }
        }
        this.eventDispatcher.inputFormatChanged(this.inputFormat, decoderReuseEvaluationCanReuseDecoder);
    }

    private void updateCurrentPosition() {
        long currentPositionUs = this.audioSink.getCurrentPositionUs(isEnded());
        if (currentPositionUs != Long.MIN_VALUE) {
            if (!this.allowPositionDiscontinuity) {
                currentPositionUs = Math.max(this.currentPositionUs, currentPositionUs);
            }
            this.currentPositionUs = currentPositionUs;
            this.allowPositionDiscontinuity = false;
        }
    }

    private final class AudioSinkListener implements AudioSink.Listener {
        @Override // androidx.media3.exoplayer.audio.AudioSink.Listener
        public /* synthetic */ void onAudioCapabilitiesChanged() {
            AudioSink.Listener.CC.$default$onAudioCapabilitiesChanged(this);
        }

        @Override // androidx.media3.exoplayer.audio.AudioSink.Listener
        public /* synthetic */ void onOffloadBufferEmptying() {
            AudioSink.Listener.CC.$default$onOffloadBufferEmptying(this);
        }

        @Override // androidx.media3.exoplayer.audio.AudioSink.Listener
        public /* synthetic */ void onOffloadBufferFull() {
            AudioSink.Listener.CC.$default$onOffloadBufferFull(this);
        }

        private AudioSinkListener() {
        }

        @Override // androidx.media3.exoplayer.audio.AudioSink.Listener
        public void onPositionDiscontinuity() {
            DecoderAudioRenderer.this.onPositionDiscontinuity();
        }

        @Override // androidx.media3.exoplayer.audio.AudioSink.Listener
        public void onSilenceSkipped() {
            DecoderAudioRenderer.this.hasPendingReportedSkippedSilence = true;
        }

        @Override // androidx.media3.exoplayer.audio.AudioSink.Listener
        public void onPositionAdvancing(long j) {
            DecoderAudioRenderer.this.eventDispatcher.positionAdvancing(j);
        }

        @Override // androidx.media3.exoplayer.audio.AudioSink.Listener
        public void onUnderrun(int i, long j, long j2) {
            DecoderAudioRenderer.this.eventDispatcher.underrun(i, j, j2);
        }

        @Override // androidx.media3.exoplayer.audio.AudioSink.Listener
        public void onSkipSilenceEnabledChanged(boolean z) {
            DecoderAudioRenderer.this.eventDispatcher.skipSilenceEnabledChanged(z);
        }

        @Override // androidx.media3.exoplayer.audio.AudioSink.Listener
        public void onAudioSinkError(Exception exc) {
            Log.e(DecoderAudioRenderer.TAG, "Audio sink error", exc);
            DecoderAudioRenderer.this.eventDispatcher.audioSinkError(exc);
        }

        @Override // androidx.media3.exoplayer.audio.AudioSink.Listener
        public void onAudioTrackInitialized(AudioSink.AudioTrackConfig audioTrackConfig) {
            DecoderAudioRenderer.this.eventDispatcher.audioTrackInitialized(audioTrackConfig);
        }

        @Override // androidx.media3.exoplayer.audio.AudioSink.Listener
        public void onAudioTrackReleased(AudioSink.AudioTrackConfig audioTrackConfig) {
            DecoderAudioRenderer.this.eventDispatcher.audioTrackReleased(audioTrackConfig);
        }
    }

    private static final class Api23 {
        private Api23() {
        }

        public static void setAudioSinkPreferredDevice(AudioSink audioSink, Object obj) {
            audioSink.setPreferredDevice(ExoPlayerImpl$$ExternalSyntheticApiModelOutline0.m(obj));
        }
    }
}
