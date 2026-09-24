package com.yosemiteyss.flutter_volume_controller;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import androidx.core.app.NotificationCompat;
import io.flutter.plugin.common.EventChannel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: VolumeBroadcastReceiver.kt */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\u001a\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fH\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\r"}, d2 = {"Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;", "Landroid/content/BroadcastReceiver;", NotificationCompat.CATEGORY_EVENT, "Lio/flutter/plugin/common/EventChannel$EventSink;", MethodArg.AUDIO_STREAM, "Lcom/yosemiteyss/flutter_volume_controller/AudioStream;", "(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)V", "onReceive", "", "context", "Landroid/content/Context;", "intent", "Landroid/content/Intent;", "flutter_volume_controller_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class VolumeBroadcastReceiver extends BroadcastReceiver {
    private final AudioStream audioStream;
    private final EventChannel.EventSink event;

    public VolumeBroadcastReceiver(EventChannel.EventSink eventSink, AudioStream audioStream) {
        Intrinsics.checkNotNullParameter(audioStream, "audioStream");
        this.event = eventSink;
        this.audioStream = audioStream;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Bundle extras;
        Intrinsics.checkNotNullParameter(context, "context");
        Integer numValueOf = (intent == null || (extras = intent.getExtras()) == null) ? null : Integer.valueOf(extras.getInt(FlutterVolumeControllerPluginKt.EXTRA_VOLUME_STREAM_TYPE));
        if (Intrinsics.areEqual(intent != null ? intent.getAction() : null, FlutterVolumeControllerPluginKt.VOLUME_CHANGED_ACTION)) {
            int streamType = this.audioStream.getStreamType();
            if (numValueOf != null && numValueOf.intValue() == streamType) {
                double volume = ExtensionsKt.getVolume(ExtensionsKt.getAudioManager(context), this.audioStream);
                EventChannel.EventSink eventSink = this.event;
                if (eventSink != null) {
                    eventSink.success(String.valueOf(volume));
                }
            }
        }
    }
}
