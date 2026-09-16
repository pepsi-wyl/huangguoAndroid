package com.kurenai7968.volume_controller;

import android.content.Context;
import androidx.core.app.NotificationCompat;
import com.yosemiteyss.flutter_volume_controller.MethodArg;
import com.yosemiteyss.flutter_volume_controller.MethodName;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: VolumeControllerPlugin.kt */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u00012\u00020\u0002B\u0005¢\u0006\u0002\u0010\u0003J\u0012\u0010\u0010\u001a\u00020\u00112\b\b\u0001\u0010\u0012\u001a\u00020\u0013H\u0016J\u0012\u0010\u0014\u001a\u00020\u00112\b\b\u0001\u0010\u0015\u001a\u00020\u0013H\u0016J\u001c\u0010\u0016\u001a\u00020\u00112\b\b\u0001\u0010\u0017\u001a\u00020\u00182\b\b\u0001\u0010\u0019\u001a\u00020\u001aH\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082D¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082.¢\u0006\u0002\n\u0000¨\u0006\u001b"}, d2 = {"Lcom/kurenai7968/volume_controller/VolumeControllerPlugin;", "Lio/flutter/embedding/engine/plugins/FlutterPlugin;", "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;", "()V", "CHANNEL", "", "context", "Landroid/content/Context;", "methodChannel", "Lio/flutter/plugin/common/MethodChannel;", "volumeListenerEventChannel", "Lio/flutter/plugin/common/EventChannel;", "volumeListenerStreamHandler", "Lcom/kurenai7968/volume_controller/VolumeListener;", "volumeObserver", "Lcom/kurenai7968/volume_controller/VolumeObserver;", "onAttachedToEngine", "", "flutterPluginBinding", "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;", "onDetachedFromEngine", "binding", "onMethodCall", NotificationCompat.CATEGORY_CALL, "Lio/flutter/plugin/common/MethodCall;", "result", "Lio/flutter/plugin/common/MethodChannel$Result;", "volume_controller_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class VolumeControllerPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {
    private final String CHANNEL = "com.kurenai7968.volume_controller.";
    private Context context;
    private MethodChannel methodChannel;
    private EventChannel volumeListenerEventChannel;
    private VolumeListener volumeListenerStreamHandler;
    private VolumeObserver volumeObserver;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        Intrinsics.checkNotNullParameter(flutterPluginBinding, "flutterPluginBinding");
        Context applicationContext = flutterPluginBinding.getApplicationContext();
        Intrinsics.checkNotNullExpressionValue(applicationContext, "getApplicationContext(...)");
        this.context = applicationContext;
        VolumeListener volumeListener = null;
        if (applicationContext == null) {
            Intrinsics.throwUninitializedPropertyAccessException("context");
            applicationContext = null;
        }
        this.volumeObserver = new VolumeObserver(applicationContext);
        this.volumeListenerEventChannel = new EventChannel(flutterPluginBinding.getBinaryMessenger(), this.CHANNEL + "volume_listener_event");
        Context context = this.context;
        if (context == null) {
            Intrinsics.throwUninitializedPropertyAccessException("context");
            context = null;
        }
        this.volumeListenerStreamHandler = new VolumeListener(context);
        EventChannel eventChannel = this.volumeListenerEventChannel;
        if (eventChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("volumeListenerEventChannel");
            eventChannel = null;
        }
        VolumeListener volumeListener2 = this.volumeListenerStreamHandler;
        if (volumeListener2 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("volumeListenerStreamHandler");
        } else {
            volumeListener = volumeListener2;
        }
        eventChannel.setStreamHandler(volumeListener);
        MethodChannel methodChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), this.CHANNEL + "method");
        this.methodChannel = methodChannel;
        methodChannel.setMethodCallHandler(this);
    }

    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        Intrinsics.checkNotNullParameter(call, "call");
        Intrinsics.checkNotNullParameter(result, "result");
        String str = call.method;
        VolumeObserver volumeObserver = null;
        if (Intrinsics.areEqual(str, MethodName.SET_VOLUME)) {
            Object objArgument = call.argument(MethodArg.VOLUME);
            Intrinsics.checkNotNull(objArgument);
            double dDoubleValue = ((Number) objArgument).doubleValue();
            Object objArgument2 = call.argument(MethodArg.SHOW_SYSTEM_UI);
            Intrinsics.checkNotNull(objArgument2);
            boolean zBooleanValue = ((Boolean) objArgument2).booleanValue();
            VolumeObserver volumeObserver2 = this.volumeObserver;
            if (volumeObserver2 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("volumeObserver");
            } else {
                volumeObserver = volumeObserver2;
            }
            volumeObserver.setVolumeByPercentage(dDoubleValue, zBooleanValue);
            return;
        }
        if (Intrinsics.areEqual(str, MethodName.GET_VOLUME)) {
            VolumeObserver volumeObserver3 = this.volumeObserver;
            if (volumeObserver3 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("volumeObserver");
            } else {
                volumeObserver = volumeObserver3;
            }
            result.success(Double.valueOf(volumeObserver.getVolume()));
        }
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
        EventChannel eventChannel = this.volumeListenerEventChannel;
        if (eventChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("volumeListenerEventChannel");
            eventChannel = null;
        }
        eventChannel.setStreamHandler(null);
    }
}
