package com.yosemiteyss.flutter_volume_controller;

import android.app.Activity;
import android.content.Context;
import androidx.core.app.NotificationCompat;
import androidx.lifecycle.Lifecycle;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleAdapter;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: FlutterVolumeControllerPlugin.kt */
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\u0005¢\u0006\u0002\u0010\u0004J\n\u0010\u000f\u001a\u0004\u0018\u00010\u0010H\u0002J\u0010\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0016J\u0010\u0010\u0015\u001a\u00020\u00122\u0006\u0010\u0016\u001a\u00020\u0017H\u0016J\b\u0010\u0018\u001a\u00020\u0012H\u0016J\b\u0010\u0019\u001a\u00020\u0012H\u0016J\u0010\u0010\u001a\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0017H\u0016J\u0018\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fH\u0016J\u0010\u0010 \u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0016R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082.¢\u0006\u0002\n\u0000¨\u0006!"}, d2 = {"Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;", "Lio/flutter/embedding/engine/plugins/FlutterPlugin;", "Lio/flutter/embedding/engine/plugins/activity/ActivityAware;", "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;", "()V", "activity", "Landroid/app/Activity;", "eventChannel", "Lio/flutter/plugin/common/EventChannel;", "methodChannel", "Lio/flutter/plugin/common/MethodChannel;", "volumeController", "Lcom/yosemiteyss/flutter_volume_controller/VolumeController;", "volumeStreamHandler", "Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;", "getActivityAudioStream", "Lcom/yosemiteyss/flutter_volume_controller/AudioStream;", "onAttachedToActivity", "", "binding", "Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;", "onAttachedToEngine", "flutterPluginBinding", "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;", "onDetachedFromActivity", "onDetachedFromActivityForConfigChanges", "onDetachedFromEngine", "onMethodCall", NotificationCompat.CATEGORY_CALL, "Lio/flutter/plugin/common/MethodCall;", "result", "Lio/flutter/plugin/common/MethodChannel$Result;", "onReattachedToActivityForConfigChanges", "flutter_volume_controller_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class FlutterVolumeControllerPlugin implements FlutterPlugin, ActivityAware, MethodChannel.MethodCallHandler {
    private Activity activity;
    private EventChannel eventChannel;
    private MethodChannel methodChannel;
    private VolumeController volumeController;
    private VolumeStreamHandler volumeStreamHandler;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        Intrinsics.checkNotNullParameter(flutterPluginBinding, "flutterPluginBinding");
        MethodChannel methodChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "com.yosemiteyss.flutter_volume_controller/method");
        methodChannel.setMethodCallHandler(this);
        this.methodChannel = methodChannel;
        EventChannel eventChannel = new EventChannel(flutterPluginBinding.getBinaryMessenger(), "com.yosemiteyss.flutter_volume_controller/event");
        Context applicationContext = flutterPluginBinding.getApplicationContext();
        Intrinsics.checkNotNullExpressionValue(applicationContext, "getApplicationContext(...)");
        VolumeStreamHandler volumeStreamHandler = new VolumeStreamHandler(applicationContext, new Function1<Integer, Unit>() { // from class: com.yosemiteyss.flutter_volume_controller.FlutterVolumeControllerPlugin$onAttachedToEngine$2$1
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Integer num) {
                invoke(num.intValue());
                return Unit.INSTANCE;
            }

            public final void invoke(int i) {
                Activity activity = this.this$0.activity;
                if (activity == null) {
                    return;
                }
                activity.setVolumeControlStream(i);
            }
        });
        this.volumeStreamHandler = volumeStreamHandler;
        eventChannel.setStreamHandler(volumeStreamHandler);
        this.eventChannel = eventChannel;
        Context applicationContext2 = flutterPluginBinding.getApplicationContext();
        Intrinsics.checkNotNullExpressionValue(applicationContext2, "getApplicationContext(...)");
        this.volumeController = new VolumeController(ExtensionsKt.getAudioManager(applicationContext2));
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        Intrinsics.checkNotNullParameter(call, "call");
        Intrinsics.checkNotNullParameter(result, "result");
        String str = call.method;
        if (str != null) {
            VolumeController volumeController = null;
            VolumeController volumeController2 = null;
            switch (str.hashCode()) {
                case -1704728835:
                    if (str.equals(MethodName.GET_ANDROID_AUDIO_STREAM)) {
                        try {
                            AudioStream activityAudioStream = getActivityAudioStream();
                            result.success(activityAudioStream != null ? Integer.valueOf(activityAudioStream.ordinal()) : null);
                            return;
                        } catch (Exception e) {
                            result.error(ErrorCode.GET_ANDROID_AUDIO_STREAM, ErrorMessage.GET_ANDROID_AUDIO_STREAM, e.getMessage());
                            return;
                        }
                    }
                    break;
                case -879756933:
                    if (str.equals(MethodName.LOWER_VOLUME)) {
                        try {
                            Double d = (Double) call.argument(MethodArg.STEP);
                            Object objArgument = call.argument(MethodArg.SHOW_SYSTEM_UI);
                            Intrinsics.checkNotNull(objArgument);
                            boolean zBooleanValue = ((Boolean) objArgument).booleanValue();
                            Object objArgument2 = call.argument(MethodArg.AUDIO_STREAM);
                            Intrinsics.checkNotNull(objArgument2);
                            int iIntValue = ((Number) objArgument2).intValue();
                            VolumeController volumeController3 = this.volumeController;
                            if (volumeController3 == null) {
                                Intrinsics.throwUninitializedPropertyAccessException("volumeController");
                                volumeController3 = null;
                            }
                            volumeController3.lowerVolume(d, zBooleanValue, AudioStream.values()[iIntValue]);
                            result.success(null);
                            return;
                        } catch (Exception e2) {
                            result.error(ErrorCode.LOWER_VOLUME, ErrorMessage.LOWER_VOLUME, e2.getMessage());
                            return;
                        }
                    }
                    break;
                case -852641907:
                    if (str.equals(MethodName.TOGGLE_MUTE)) {
                        try {
                            Object objArgument3 = call.argument(MethodArg.SHOW_SYSTEM_UI);
                            Intrinsics.checkNotNull(objArgument3);
                            boolean zBooleanValue2 = ((Boolean) objArgument3).booleanValue();
                            Object objArgument4 = call.argument(MethodArg.AUDIO_STREAM);
                            Intrinsics.checkNotNull(objArgument4);
                            int iIntValue2 = ((Number) objArgument4).intValue();
                            VolumeController volumeController4 = this.volumeController;
                            if (volumeController4 == null) {
                                Intrinsics.throwUninitializedPropertyAccessException("volumeController");
                                volumeController4 = null;
                            }
                            volumeController4.toggleMute(zBooleanValue2, AudioStream.values()[iIntValue2]);
                            result.success(null);
                            return;
                        } catch (Exception e3) {
                            result.error(ErrorCode.TOGGLE_MUTE, ErrorMessage.TOGGLE_MUTE, e3.getMessage());
                            return;
                        }
                    }
                    break;
                case -808887770:
                    if (str.equals(MethodName.RAISE_VOLUME)) {
                        try {
                            Double d2 = (Double) call.argument(MethodArg.STEP);
                            Object objArgument5 = call.argument(MethodArg.SHOW_SYSTEM_UI);
                            Intrinsics.checkNotNull(objArgument5);
                            boolean zBooleanValue3 = ((Boolean) objArgument5).booleanValue();
                            Object objArgument6 = call.argument(MethodArg.AUDIO_STREAM);
                            Intrinsics.checkNotNull(objArgument6);
                            int iIntValue3 = ((Number) objArgument6).intValue();
                            VolumeController volumeController5 = this.volumeController;
                            if (volumeController5 == null) {
                                Intrinsics.throwUninitializedPropertyAccessException("volumeController");
                                volumeController5 = null;
                            }
                            volumeController5.raiseVolume(d2, zBooleanValue3, AudioStream.values()[iIntValue3]);
                            result.success(null);
                            return;
                        } catch (Exception e4) {
                            result.error(ErrorCode.RAISE_VOLUME, ErrorMessage.RAISE_VOLUME, e4.getMessage());
                            return;
                        }
                    }
                    break;
                case -75318641:
                    if (str.equals(MethodName.GET_MUTE)) {
                        try {
                            Object objArgument7 = call.argument(MethodArg.AUDIO_STREAM);
                            Intrinsics.checkNotNull(objArgument7);
                            int iIntValue4 = ((Number) objArgument7).intValue();
                            VolumeController volumeController6 = this.volumeController;
                            if (volumeController6 == null) {
                                Intrinsics.throwUninitializedPropertyAccessException("volumeController");
                            } else {
                                volumeController2 = volumeController6;
                            }
                            result.success(Boolean.valueOf(volumeController2.getMute(AudioStream.values()[iIntValue4])));
                            return;
                        } catch (Exception e5) {
                            result.error(ErrorCode.GET_MUTE, ErrorMessage.GET_MUTE, e5.getMessage());
                            return;
                        }
                    }
                    break;
                case 670514716:
                    if (str.equals(MethodName.SET_VOLUME)) {
                        try {
                            Object objArgument8 = call.argument(MethodArg.VOLUME);
                            Intrinsics.checkNotNull(objArgument8);
                            double dDoubleValue = ((Number) objArgument8).doubleValue();
                            Object objArgument9 = call.argument(MethodArg.SHOW_SYSTEM_UI);
                            Intrinsics.checkNotNull(objArgument9);
                            boolean zBooleanValue4 = ((Boolean) objArgument9).booleanValue();
                            Object objArgument10 = call.argument(MethodArg.AUDIO_STREAM);
                            Intrinsics.checkNotNull(objArgument10);
                            int iIntValue5 = ((Number) objArgument10).intValue();
                            VolumeController volumeController7 = this.volumeController;
                            if (volumeController7 == null) {
                                Intrinsics.throwUninitializedPropertyAccessException("volumeController");
                                volumeController7 = null;
                            }
                            volumeController7.setVolume(dDoubleValue, zBooleanValue4, AudioStream.values()[iIntValue5]);
                            result.success(null);
                            return;
                        } catch (Exception e6) {
                            result.error(ErrorCode.SET_VOLUME, ErrorMessage.SET_VOLUME, e6.getMessage());
                            return;
                        }
                    }
                    break;
                case 831482121:
                    if (str.equals(MethodName.SET_ANDROID_AUDIO_STREAM)) {
                        try {
                            Object objArgument11 = call.argument(MethodArg.AUDIO_STREAM);
                            Intrinsics.checkNotNull(objArgument11);
                            int iIntValue6 = ((Number) objArgument11).intValue();
                            VolumeStreamHandler volumeStreamHandler = this.volumeStreamHandler;
                            if (volumeStreamHandler == null) {
                                Intrinsics.throwUninitializedPropertyAccessException("volumeStreamHandler");
                                volumeStreamHandler = null;
                            }
                            volumeStreamHandler.setActivityAudioStream(AudioStream.values()[iIntValue6]);
                            result.success(null);
                            return;
                        } catch (Exception e7) {
                            result.error(ErrorCode.SET_ANDROID_AUDIO_STREAM, ErrorMessage.SET_ANDROID_AUDIO_STREAM, e7.getMessage());
                            return;
                        }
                    }
                    break;
                case 885131792:
                    if (str.equals(MethodName.GET_VOLUME)) {
                        try {
                            Object objArgument12 = call.argument(MethodArg.AUDIO_STREAM);
                            Intrinsics.checkNotNull(objArgument12);
                            int iIntValue7 = ((Number) objArgument12).intValue();
                            VolumeController volumeController8 = this.volumeController;
                            if (volumeController8 == null) {
                                Intrinsics.throwUninitializedPropertyAccessException("volumeController");
                            } else {
                                volumeController = volumeController8;
                            }
                            result.success(String.valueOf(volumeController.getVolume(AudioStream.values()[iIntValue7])));
                            return;
                        } catch (Exception e8) {
                            result.error(ErrorCode.GET_VOLUME, ErrorMessage.GET_VOLUME, e8.getMessage());
                            return;
                        }
                    }
                    break;
                case 1984790939:
                    if (str.equals(MethodName.SET_MUTE)) {
                        try {
                            Object objArgument13 = call.argument(MethodArg.IS_MUTED);
                            Intrinsics.checkNotNull(objArgument13);
                            boolean zBooleanValue5 = ((Boolean) objArgument13).booleanValue();
                            Object objArgument14 = call.argument(MethodArg.SHOW_SYSTEM_UI);
                            Intrinsics.checkNotNull(objArgument14);
                            boolean zBooleanValue6 = ((Boolean) objArgument14).booleanValue();
                            Object objArgument15 = call.argument(MethodArg.AUDIO_STREAM);
                            Intrinsics.checkNotNull(objArgument15);
                            int iIntValue8 = ((Number) objArgument15).intValue();
                            VolumeController volumeController9 = this.volumeController;
                            if (volumeController9 == null) {
                                Intrinsics.throwUninitializedPropertyAccessException("volumeController");
                                volumeController9 = null;
                            }
                            volumeController9.setMute(zBooleanValue5, zBooleanValue6, AudioStream.values()[iIntValue8]);
                            result.success(null);
                            return;
                        } catch (Exception e9) {
                            result.error(ErrorCode.SET_MUTE, ErrorMessage.SET_MUTE, e9.getMessage());
                            return;
                        }
                    }
                    break;
            }
        }
        result.notImplemented();
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        MethodChannel methodChannel = this.methodChannel;
        if (methodChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("methodChannel");
            methodChannel = null;
        }
        methodChannel.setMethodCallHandler(null);
        EventChannel eventChannel = this.eventChannel;
        if (eventChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("eventChannel");
            eventChannel = null;
        }
        eventChannel.setStreamHandler(null);
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onAttachedToActivity(ActivityPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        this.activity = binding.getActivity();
        Lifecycle activityLifecycle = FlutterLifecycleAdapter.getActivityLifecycle(binding);
        VolumeStreamHandler volumeStreamHandler = this.volumeStreamHandler;
        if (volumeStreamHandler == null) {
            Intrinsics.throwUninitializedPropertyAccessException("volumeStreamHandler");
            volumeStreamHandler = null;
        }
        activityLifecycle.addObserver(volumeStreamHandler);
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onDetachedFromActivityForConfigChanges() {
        this.activity = null;
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        this.activity = binding.getActivity();
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onDetachedFromActivity() {
        this.activity = null;
    }

    private final AudioStream getActivityAudioStream() {
        for (AudioStream audioStream : AudioStream.values()) {
            Activity activity = this.activity;
            if (activity != null && audioStream.getStreamType() == activity.getVolumeControlStream()) {
                return audioStream;
            }
        }
        return null;
    }
}
