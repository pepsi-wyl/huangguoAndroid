package com.yosemiteyss.flutter_volume_controller;

import android.content.Context;
import android.content.IntentFilter;
import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import io.flutter.plugin.common.EventChannel;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: VolumeStreamHandler.kt */
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u00002\u00020\u00012\u00020\u0002B0\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012!\u0010\u0005\u001a\u001d\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b\b\u0012\b\b\t\u0012\u0004\b\b(\n\u0012\u0004\u0012\u00020\u000b0\u0006¢\u0006\u0002\u0010\fJ\u0012\u0010\u0011\u001a\u00020\u000b2\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013H\u0016J\u001c\u0010\u0014\u001a\u00020\u000b2\b\u0010\u0012\u001a\u0004\u0018\u00010\u00132\b\u0010\u0015\u001a\u0004\u0018\u00010\u0016H\u0016J\u0010\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u0019H\u0016J\b\u0010\u001a\u001a\u00020\u000bH\u0002J\b\u0010\u001b\u001a\u00020\u000bH\u0002J\u000e\u0010\u001c\u001a\u00020\u000b2\u0006\u0010\u001d\u001a\u00020\u000eR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R)\u0010\u0005\u001a\u001d\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b\b\u0012\b\b\t\u0012\u0004\b\b(\n\u0012\u0004\u0012\u00020\u000b0\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u001e"}, d2 = {"Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;", "Lio/flutter/plugin/common/EventChannel$StreamHandler;", "Landroidx/lifecycle/DefaultLifecycleObserver;", "applicationContext", "Landroid/content/Context;", "onSetVolumeStream", "Lkotlin/Function1;", "", "Lkotlin/ParameterName;", "name", "streamType", "", "(Landroid/content/Context;Lkotlin/jvm/functions/Function1;)V", "observedStream", "Lcom/yosemiteyss/flutter_volume_controller/AudioStream;", "volumeBroadcastReceiver", "Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;", "onCancel", "arguments", "", "onListen", "events", "Lio/flutter/plugin/common/EventChannel$EventSink;", "onResume", "owner", "Landroidx/lifecycle/LifecycleOwner;", "resetActivityAudioStream", "resumeActivityAudioStream", "setActivityAudioStream", MethodArg.AUDIO_STREAM, "flutter_volume_controller_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class VolumeStreamHandler implements EventChannel.StreamHandler, DefaultLifecycleObserver {
    private final Context applicationContext;
    private AudioStream observedStream;
    private final Function1<Integer, Unit> onSetVolumeStream;
    private VolumeBroadcastReceiver volumeBroadcastReceiver;

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public /* synthetic */ void onCreate(LifecycleOwner lifecycleOwner) {
        Intrinsics.checkNotNullParameter(lifecycleOwner, "owner");
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public /* synthetic */ void onDestroy(LifecycleOwner lifecycleOwner) {
        Intrinsics.checkNotNullParameter(lifecycleOwner, "owner");
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public /* synthetic */ void onPause(LifecycleOwner lifecycleOwner) {
        Intrinsics.checkNotNullParameter(lifecycleOwner, "owner");
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public /* synthetic */ void onStart(LifecycleOwner lifecycleOwner) {
        Intrinsics.checkNotNullParameter(lifecycleOwner, "owner");
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public /* synthetic */ void onStop(LifecycleOwner lifecycleOwner) {
        Intrinsics.checkNotNullParameter(lifecycleOwner, "owner");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public VolumeStreamHandler(Context applicationContext, Function1<? super Integer, Unit> onSetVolumeStream) {
        Intrinsics.checkNotNullParameter(applicationContext, "applicationContext");
        Intrinsics.checkNotNullParameter(onSetVolumeStream, "onSetVolumeStream");
        this.applicationContext = applicationContext;
        this.onSetVolumeStream = onSetVolumeStream;
        this.observedStream = AudioStream.MUSIC;
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onListen(Object arguments, EventChannel.EventSink events) {
        try {
            Intrinsics.checkNotNull(arguments, "null cannot be cast to non-null type kotlin.collections.Map<*, *>");
            Map map = (Map) arguments;
            AudioStream[] audioStreamArrValues = AudioStream.values();
            Object obj = map.get(MethodArg.AUDIO_STREAM);
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.Int");
            AudioStream audioStream = audioStreamArrValues[((Integer) obj).intValue()];
            Object obj2 = map.get(MethodArg.EMIT_ON_START);
            Intrinsics.checkNotNull(obj2, "null cannot be cast to non-null type kotlin.Boolean");
            boolean zBooleanValue = ((Boolean) obj2).booleanValue();
            setActivityAudioStream(audioStream);
            VolumeBroadcastReceiver volumeBroadcastReceiver = new VolumeBroadcastReceiver(events, audioStream);
            this.applicationContext.registerReceiver(volumeBroadcastReceiver, new IntentFilter(FlutterVolumeControllerPluginKt.VOLUME_CHANGED_ACTION));
            this.volumeBroadcastReceiver = volumeBroadcastReceiver;
            if (zBooleanValue) {
                double volume = ExtensionsKt.getVolume(ExtensionsKt.getAudioManager(this.applicationContext), audioStream);
                if (events != null) {
                    events.success(String.valueOf(volume));
                }
            }
        } catch (Exception e) {
            if (events != null) {
                events.error(ErrorCode.REGISTER_VOLUME_LISTENER, ErrorMessage.REGISTER_VOLUME_LISTENER, e.getMessage());
            }
        }
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onCancel(Object arguments) {
        VolumeBroadcastReceiver volumeBroadcastReceiver = this.volumeBroadcastReceiver;
        if (volumeBroadcastReceiver != null) {
            this.applicationContext.unregisterReceiver(volumeBroadcastReceiver);
        }
        this.volumeBroadcastReceiver = null;
        resetActivityAudioStream();
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onResume(LifecycleOwner owner) {
        Intrinsics.checkNotNullParameter(owner, "owner");
        if (this.volumeBroadcastReceiver != null) {
            resumeActivityAudioStream();
        }
        Intrinsics.checkNotNullParameter(owner, "owner");
    }

    public final void setActivityAudioStream(AudioStream audioStream) {
        Intrinsics.checkNotNullParameter(audioStream, "audioStream");
        this.onSetVolumeStream.invoke(Integer.valueOf(audioStream.getStreamType()));
        this.observedStream = audioStream;
    }

    private final void resetActivityAudioStream() {
        this.onSetVolumeStream.invoke(Integer.MIN_VALUE);
        this.observedStream = AudioStream.MUSIC;
    }

    private final void resumeActivityAudioStream() {
        this.onSetVolumeStream.invoke(Integer.valueOf(this.observedStream.getStreamType()));
    }
}
