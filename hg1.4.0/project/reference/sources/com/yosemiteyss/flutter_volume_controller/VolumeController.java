package com.yosemiteyss.flutter_volume_controller;

import android.media.AudioManager;
import android.os.Build;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: VolumeController.kt */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0002\n\u0002\b\n\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bJ\u000e\u0010\t\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\bJ%\u0010\u000b\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\n2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0002\u0010\u000fJ%\u0010\u0010\u001a\u00020\f2\b\u0010\r\u001a\u0004\u0018\u00010\n2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0002\u0010\u000fJ\u001e\u0010\u0011\u001a\u00020\f2\u0006\u0010\u0012\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bJ\u001e\u0010\u0013\u001a\u00020\f2\u0006\u0010\u0014\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bJ\u0016\u0010\u0015\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Lcom/yosemiteyss/flutter_volume_controller/VolumeController;", "", "audioManager", "Landroid/media/AudioManager;", "(Landroid/media/AudioManager;)V", MethodName.GET_MUTE, "", MethodArg.AUDIO_STREAM, "Lcom/yosemiteyss/flutter_volume_controller/AudioStream;", MethodName.GET_VOLUME, "", MethodName.LOWER_VOLUME, "", MethodArg.STEP, MethodArg.SHOW_SYSTEM_UI, "(Ljava/lang/Double;ZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V", MethodName.RAISE_VOLUME, MethodName.SET_MUTE, MethodArg.IS_MUTED, MethodName.SET_VOLUME, MethodArg.VOLUME, MethodName.TOGGLE_MUTE, "flutter_volume_controller_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class VolumeController {
    private final AudioManager audioManager;

    public VolumeController(AudioManager audioManager) {
        Intrinsics.checkNotNullParameter(audioManager, "audioManager");
        this.audioManager = audioManager;
    }

    public final double getVolume(AudioStream audioStream) {
        Intrinsics.checkNotNullParameter(audioStream, "audioStream");
        return ExtensionsKt.getVolume(this.audioManager, audioStream);
    }

    public final void setVolume(double volume, boolean showSystemUI, AudioStream audioStream) {
        Intrinsics.checkNotNullParameter(audioStream, "audioStream");
        this.audioManager.setStreamVolume(audioStream.getStreamType(), (int) (this.audioManager.getStreamMaxVolume(audioStream.getStreamType()) * volume), showSystemUI ? 1 : 0);
    }

    public final void raiseVolume(Double step, boolean showSystemUI, AudioStream audioStream) {
        Intrinsics.checkNotNullParameter(audioStream, "audioStream");
        if (step == null) {
            this.audioManager.adjustStreamVolume(audioStream.getStreamType(), 1, showSystemUI ? 1 : 0);
        } else {
            setVolume(getVolume(audioStream) + step.doubleValue(), showSystemUI, audioStream);
        }
    }

    public final void lowerVolume(Double step, boolean showSystemUI, AudioStream audioStream) {
        Intrinsics.checkNotNullParameter(audioStream, "audioStream");
        if (step == null) {
            this.audioManager.adjustStreamVolume(audioStream.getStreamType(), -1, showSystemUI ? 1 : 0);
        } else {
            setVolume(getVolume(audioStream) - step.doubleValue(), showSystemUI, audioStream);
        }
    }

    public final boolean getMute(AudioStream audioStream) {
        Intrinsics.checkNotNullParameter(audioStream, "audioStream");
        if (Build.VERSION.SDK_INT >= 23) {
            return this.audioManager.isStreamMute(audioStream.getStreamType());
        }
        return this.audioManager.getStreamVolume(audioStream.getStreamType()) == 0;
    }

    public final void setMute(boolean isMuted, boolean showSystemUI, AudioStream audioStream) {
        Intrinsics.checkNotNullParameter(audioStream, "audioStream");
        if (Build.VERSION.SDK_INT >= 23) {
            this.audioManager.adjustStreamVolume(audioStream.getStreamType(), isMuted ? -100 : 100, showSystemUI ? 1 : 0);
        } else {
            this.audioManager.setStreamMute(audioStream.getStreamType(), isMuted);
        }
    }

    public final void toggleMute(boolean showSystemUI, AudioStream audioStream) {
        Intrinsics.checkNotNullParameter(audioStream, "audioStream");
        setMute(!getMute(audioStream), showSystemUI, audioStream);
    }
}
