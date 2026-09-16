package com.kurenai7968.volume_controller;

import android.content.Context;
import android.media.AudioManager;
import com.yosemiteyss.flutter_volume_controller.MethodArg;
import com.yosemiteyss.flutter_volume_controller.MethodName;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: VolumeObserve.kt */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0006\u0010\u0007\u001a\u00020\bJ\u0016\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\rR\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000e"}, d2 = {"Lcom/kurenai7968/volume_controller/VolumeObserver;", "", "context", "Landroid/content/Context;", "(Landroid/content/Context;)V", "audioManager", "Landroid/media/AudioManager;", MethodName.GET_VOLUME, "", "setVolumeByPercentage", "", MethodArg.VOLUME, MethodArg.SHOW_SYSTEM_UI, "", "volume_controller_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class VolumeObserver {
    private AudioManager audioManager;
    private final Context context;

    public VolumeObserver(Context context) {
        Intrinsics.checkNotNullParameter(context, "context");
        this.context = context;
        Object systemService = context.getSystemService("audio");
        Intrinsics.checkNotNull(systemService, "null cannot be cast to non-null type android.media.AudioManager");
        this.audioManager = (AudioManager) systemService;
    }

    public final void setVolumeByPercentage(double volume, boolean showSystemUI) {
        double d = volume <= 1.0d ? volume : 1.0d;
        if (volume < 0.0d) {
            d = 0.0d;
        }
        this.audioManager.setStreamVolume(3, (int) Math.rint(d * this.audioManager.getStreamMaxVolume(3)), showSystemUI ? 1 : 0);
    }

    public final double getVolume() {
        double d = 10000;
        return Math.rint((this.audioManager.getStreamVolume(3) / this.audioManager.getStreamMaxVolume(3)) * d) / d;
    }
}
