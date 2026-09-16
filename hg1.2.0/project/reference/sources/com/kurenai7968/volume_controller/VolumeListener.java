package com.kurenai7968.volume_controller;

import android.content.Context;
import android.content.IntentFilter;
import android.media.AudioManager;
import com.yosemiteyss.flutter_volume_controller.FlutterVolumeControllerPluginKt;
import com.yosemiteyss.flutter_volume_controller.MethodArg;
import io.flutter.plugin.common.EventChannel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: VolumeObserve.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0010\u0006\n\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0012\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010H\u0016J\u001c\u0010\u0011\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u00102\b\u0010\u0012\u001a\u0004\u0018\u00010\nH\u0016J\b\u0010\u0013\u001a\u00020\u000eH\u0002J\b\u0010\u0014\u001a\u00020\u0015H\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082D¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082.¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Lcom/kurenai7968/volume_controller/VolumeListener;", "Lio/flutter/plugin/common/EventChannel$StreamHandler;", "context", "Landroid/content/Context;", "(Landroid/content/Context;)V", "VOLUME_CHANGED_ACTION", "", "audioManager", "Landroid/media/AudioManager;", "eventSink", "Lio/flutter/plugin/common/EventChannel$EventSink;", "volumeBroadcastReceiver", "Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;", "onCancel", "", "arguments", "", "onListen", "events", "registerReceiver", MethodArg.VOLUME, "", "volume_controller_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class VolumeListener implements EventChannel.StreamHandler {
    private final String VOLUME_CHANGED_ACTION;
    private AudioManager audioManager;
    private final Context context;
    private EventChannel.EventSink eventSink;
    private VolumeBroadcastReceiver volumeBroadcastReceiver;

    public VolumeListener(Context context) {
        Intrinsics.checkNotNullParameter(context, "context");
        this.context = context;
        this.VOLUME_CHANGED_ACTION = FlutterVolumeControllerPluginKt.VOLUME_CHANGED_ACTION;
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onListen(Object arguments, EventChannel.EventSink events) {
        this.eventSink = events;
        Object systemService = this.context.getSystemService("audio");
        Intrinsics.checkNotNull(systemService, "null cannot be cast to non-null type android.media.AudioManager");
        this.audioManager = (AudioManager) systemService;
        this.volumeBroadcastReceiver = new VolumeBroadcastReceiver(this.eventSink);
        registerReceiver();
        EventChannel.EventSink eventSink = this.eventSink;
        if (eventSink != null) {
            eventSink.success(Double.valueOf(volume()));
        }
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onCancel(Object arguments) {
        Context context = this.context;
        VolumeBroadcastReceiver volumeBroadcastReceiver = this.volumeBroadcastReceiver;
        if (volumeBroadcastReceiver == null) {
            Intrinsics.throwUninitializedPropertyAccessException("volumeBroadcastReceiver");
            volumeBroadcastReceiver = null;
        }
        context.unregisterReceiver(volumeBroadcastReceiver);
        this.eventSink = null;
    }

    private final void registerReceiver() {
        IntentFilter intentFilter = new IntentFilter(this.VOLUME_CHANGED_ACTION);
        Context context = this.context;
        VolumeBroadcastReceiver volumeBroadcastReceiver = this.volumeBroadcastReceiver;
        if (volumeBroadcastReceiver == null) {
            Intrinsics.throwUninitializedPropertyAccessException("volumeBroadcastReceiver");
            volumeBroadcastReceiver = null;
        }
        context.registerReceiver(volumeBroadcastReceiver, intentFilter);
    }

    private final double volume() {
        AudioManager audioManager = this.audioManager;
        AudioManager audioManager2 = null;
        if (audioManager == null) {
            Intrinsics.throwUninitializedPropertyAccessException("audioManager");
            audioManager = null;
        }
        int streamVolume = audioManager.getStreamVolume(3);
        AudioManager audioManager3 = this.audioManager;
        if (audioManager3 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("audioManager");
        } else {
            audioManager2 = audioManager3;
        }
        double streamMaxVolume = streamVolume / audioManager2.getStreamMaxVolume(3);
        double d = 10000;
        return Math.rint(streamMaxVolume * d) / d;
    }
}
