package androidx.media3.exoplayer.audio;

import android.os.Handler;
import androidx.media3.common.Format;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.DecoderCounters;
import androidx.media3.exoplayer.DecoderReuseEvaluation;
import androidx.media3.exoplayer.audio.AudioSink;

/* loaded from: classes.dex */
public interface AudioRendererEventListener {

    /* renamed from: androidx.media3.exoplayer.audio.AudioRendererEventListener$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static void $default$onAudioCodecError(AudioRendererEventListener _this, Exception exc) {
        }

        public static void $default$onAudioDecoderInitialized(AudioRendererEventListener _this, String str, long j, long j2) {
        }

        public static void $default$onAudioDecoderReleased(AudioRendererEventListener _this, String str) {
        }

        public static void $default$onAudioDisabled(AudioRendererEventListener _this, DecoderCounters decoderCounters) {
        }

        public static void $default$onAudioEnabled(AudioRendererEventListener _this, DecoderCounters decoderCounters) {
        }

        public static void $default$onAudioInputFormatChanged(AudioRendererEventListener _this, Format format, DecoderReuseEvaluation decoderReuseEvaluation) {
        }

        public static void $default$onAudioPositionAdvancing(AudioRendererEventListener _this, long j) {
        }

        public static void $default$onAudioSinkError(AudioRendererEventListener _this, Exception exc) {
        }

        public static void $default$onAudioTrackInitialized(AudioRendererEventListener _this, AudioSink.AudioTrackConfig audioTrackConfig) {
        }

        public static void $default$onAudioTrackReleased(AudioRendererEventListener _this, AudioSink.AudioTrackConfig audioTrackConfig) {
        }

        public static void $default$onAudioUnderrun(AudioRendererEventListener _this, int i, long j, long j2) {
        }

        public static void $default$onSkipSilenceEnabledChanged(AudioRendererEventListener _this, boolean z) {
        }
    }

    void onAudioCodecError(Exception exc);

    void onAudioDecoderInitialized(String str, long j, long j2);

    void onAudioDecoderReleased(String str);

    void onAudioDisabled(DecoderCounters decoderCounters);

    void onAudioEnabled(DecoderCounters decoderCounters);

    void onAudioInputFormatChanged(Format format, DecoderReuseEvaluation decoderReuseEvaluation);

    void onAudioPositionAdvancing(long j);

    void onAudioSinkError(Exception exc);

    void onAudioTrackInitialized(AudioSink.AudioTrackConfig audioTrackConfig);

    void onAudioTrackReleased(AudioSink.AudioTrackConfig audioTrackConfig);

    void onAudioUnderrun(int i, long j, long j2);

    void onSkipSilenceEnabledChanged(boolean z);

    public static final class EventDispatcher {
        private final Handler handler;
        private final AudioRendererEventListener listener;

        public EventDispatcher(Handler handler, AudioRendererEventListener audioRendererEventListener) {
            this.handler = audioRendererEventListener != null ? (Handler) Assertions.checkNotNull(handler) : null;
            this.listener = audioRendererEventListener;
        }

        public void enabled(final DecoderCounters decoderCounters) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m213x55ee20a7(decoderCounters);
                    }
                });
            }
        }

        /* renamed from: lambda$enabled$0$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m213x55ee20a7(DecoderCounters decoderCounters) {
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onAudioEnabled(decoderCounters);
        }

        public void decoderInitialized(final String str, final long j, final long j2) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda10
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m210x4e7a341d(str, j, j2);
                    }
                });
            }
        }

        /* renamed from: lambda$decoderInitialized$1$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m210x4e7a341d(String str, long j, long j2) {
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onAudioDecoderInitialized(str, j, j2);
        }

        public void inputFormatChanged(final Format format, final DecoderReuseEvaluation decoderReuseEvaluation) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda8
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m214x1ee33b39(format, decoderReuseEvaluation);
                    }
                });
            }
        }

        /* renamed from: lambda$inputFormatChanged$2$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m214x1ee33b39(Format format, DecoderReuseEvaluation decoderReuseEvaluation) {
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onAudioInputFormatChanged(format, decoderReuseEvaluation);
        }

        public void positionAdvancing(final long j) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda2
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m215xa4e1944f(j);
                    }
                });
            }
        }

        /* renamed from: lambda$positionAdvancing$3$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m215xa4e1944f(long j) {
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onAudioPositionAdvancing(j);
        }

        public void underrun(final int i, final long j, final long j2) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda3
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m217x8e019017(i, j, j2);
                    }
                });
            }
        }

        /* renamed from: lambda$underrun$4$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m217x8e019017(int i, long j, long j2) {
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onAudioUnderrun(i, j, j2);
        }

        public void decoderReleased(final String str) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda11
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m211x102cf822(str);
                    }
                });
            }
        }

        /* renamed from: lambda$decoderReleased$5$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m211x102cf822(String str) {
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onAudioDecoderReleased(str);
        }

        public void disabled(final DecoderCounters decoderCounters) {
            decoderCounters.ensureUpdated();
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m212xe116cfac(decoderCounters);
                    }
                });
            }
        }

        /* renamed from: lambda$disabled$6$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m212xe116cfac(DecoderCounters decoderCounters) {
            decoderCounters.ensureUpdated();
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onAudioDisabled(decoderCounters);
        }

        public void skipSilenceEnabledChanged(final boolean z) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda9
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m216x60b531cc(z);
                    }
                });
            }
        }

        /* renamed from: lambda$skipSilenceEnabledChanged$7$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m216x60b531cc(boolean z) {
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onSkipSilenceEnabledChanged(z);
        }

        public void audioSinkError(final Exception exc) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda7
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m207xc89a3787(exc);
                    }
                });
            }
        }

        /* renamed from: lambda$audioSinkError$8$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m207xc89a3787(Exception exc) {
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onAudioSinkError(exc);
        }

        public void audioCodecError(final Exception exc) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda6
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m206xdf751697(exc);
                    }
                });
            }
        }

        /* renamed from: lambda$audioCodecError$9$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m206xdf751697(Exception exc) {
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onAudioCodecError(exc);
        }

        public void audioTrackInitialized(final AudioSink.AudioTrackConfig audioTrackConfig) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda4
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m208xee74b056(audioTrackConfig);
                    }
                });
            }
        }

        /* renamed from: lambda$audioTrackInitialized$10$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m208xee74b056(AudioSink.AudioTrackConfig audioTrackConfig) {
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onAudioTrackInitialized(audioTrackConfig);
        }

        public void audioTrackReleased(final AudioSink.AudioTrackConfig audioTrackConfig) {
            Handler handler = this.handler;
            if (handler != null) {
                handler.post(new Runnable() { // from class: androidx.media3.exoplayer.audio.AudioRendererEventListener$EventDispatcher$$ExternalSyntheticLambda5
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m209x12b02702(audioTrackConfig);
                    }
                });
            }
        }

        /* renamed from: lambda$audioTrackReleased$11$androidx-media3-exoplayer-audio-AudioRendererEventListener$EventDispatcher, reason: not valid java name */
        /* synthetic */ void m209x12b02702(AudioSink.AudioTrackConfig audioTrackConfig) {
            ((AudioRendererEventListener) Util.castNonNull(this.listener)).onAudioTrackReleased(audioTrackConfig);
        }
    }
}
