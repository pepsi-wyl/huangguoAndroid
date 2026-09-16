package com.kurenai7968.volume_controller;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import io.flutter.plugin.common.EventChannel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: VolumeObserve.kt */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0004J\u001a\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0011H\u0016R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;", "Landroid/content/BroadcastReceiver;", "events", "Lio/flutter/plugin/common/EventChannel$EventSink;", "(Lio/flutter/plugin/common/EventChannel$EventSink;)V", "audioManager", "Landroid/media/AudioManager;", "currentVolume", "", "maxVolume", "volumePercentage", "", "onReceive", "", "context", "Landroid/content/Context;", "intent", "Landroid/content/Intent;", "volume_controller_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class VolumeBroadcastReceiver extends BroadcastReceiver {
    private AudioManager audioManager;
    private int currentVolume;
    private final EventChannel.EventSink events;
    private int maxVolume;
    private double volumePercentage;

    public VolumeBroadcastReceiver(EventChannel.EventSink eventSink) {
        this.events = eventSink;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Intrinsics.checkNotNullParameter(context, "context");
        Object systemService = context.getSystemService("audio");
        Intrinsics.checkNotNull(systemService, "null cannot be cast to non-null type android.media.AudioManager");
        AudioManager audioManager = (AudioManager) systemService;
        this.audioManager = audioManager;
        AudioManager audioManager2 = null;
        if (audioManager == null) {
            Intrinsics.throwUninitializedPropertyAccessException("audioManager");
            audioManager = null;
        }
        this.currentVolume = audioManager.getStreamVolume(3);
        AudioManager audioManager3 = this.audioManager;
        if (audioManager3 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("audioManager");
        } else {
            audioManager2 = audioManager3;
        }
        int streamMaxVolume = audioManager2.getStreamMaxVolume(3);
        this.maxVolume = streamMaxVolume;
        double d = this.currentVolume / streamMaxVolume;
        double d2 = 10000;
        double dRint = Math.rint(d * d2) / d2;
        this.volumePercentage = dRint;
        EventChannel.EventSink eventSink = this.events;
        if (eventSink != null) {
            eventSink.success(Double.valueOf(dRint));
        }
    }
}
