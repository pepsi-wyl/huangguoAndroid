package dev.fluttercommunity.plus.sensors;

import android.content.Context;
import android.hardware.SensorManager;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: SensorsPlugin.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001eB\u0005¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0016J\u0010\u0010\u0015\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0016J\u0018\u0010\u0016\u001a\u00020\u00122\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J\u0010\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J\b\u0010\u001c\u001a\u00020\u0012H\u0002J\b\u0010\u001d\u001a\u00020\u0012H\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0006X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0006X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0006X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0006X\u0082.¢\u0006\u0002\n\u0000¨\u0006\u001f"}, d2 = {"Ldev/fluttercommunity/plus/sensors/SensorsPlugin;", "Lio/flutter/embedding/engine/plugins/FlutterPlugin;", "()V", "accelerometerChannel", "Lio/flutter/plugin/common/EventChannel;", "accelerometerStreamHandler", "Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;", "barometerChannel", "barometerStreamHandler", "gyroscopeChannel", "gyroscopeStreamHandler", "magnetometerChannel", "magnetometerStreamHandler", "methodChannel", "Lio/flutter/plugin/common/MethodChannel;", "userAccelChannel", "userAccelStreamHandler", "onAttachedToEngine", "", "binding", "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;", "onDetachedFromEngine", "setupEventChannels", "context", "Landroid/content/Context;", "messenger", "Lio/flutter/plugin/common/BinaryMessenger;", "setupMethodChannel", "teardownEventChannels", "teardownMethodChannel", "Companion", "sensors_plus_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class SensorsPlugin implements FlutterPlugin {
    private static final String ACCELEROMETER_CHANNEL_NAME = "dev.fluttercommunity.plus/sensors/accelerometer";
    private static final String BAROMETER_CHANNEL_NAME = "dev.fluttercommunity.plus/sensors/barometer";
    private static final String GYROSCOPE_CHANNEL_NAME = "dev.fluttercommunity.plus/sensors/gyroscope";
    private static final String MAGNETOMETER_CHANNEL_NAME = "dev.fluttercommunity.plus/sensors/magnetometer";
    private static final String METHOD_CHANNEL_NAME = "dev.fluttercommunity.plus/sensors/method";
    private static final String USER_ACCELEROMETER_CHANNEL_NAME = "dev.fluttercommunity.plus/sensors/user_accel";
    private EventChannel accelerometerChannel;
    private StreamHandlerImpl accelerometerStreamHandler;
    private EventChannel barometerChannel;
    private StreamHandlerImpl barometerStreamHandler;
    private EventChannel gyroscopeChannel;
    private StreamHandlerImpl gyroscopeStreamHandler;
    private EventChannel magnetometerChannel;
    private StreamHandlerImpl magnetometerStreamHandler;
    private MethodChannel methodChannel;
    private EventChannel userAccelChannel;
    private StreamHandlerImpl userAccelStreamHandler;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        BinaryMessenger binaryMessenger = binding.getBinaryMessenger();
        Intrinsics.checkNotNullExpressionValue(binaryMessenger, "getBinaryMessenger(...)");
        setupMethodChannel(binaryMessenger);
        Context applicationContext = binding.getApplicationContext();
        Intrinsics.checkNotNullExpressionValue(applicationContext, "getApplicationContext(...)");
        BinaryMessenger binaryMessenger2 = binding.getBinaryMessenger();
        Intrinsics.checkNotNullExpressionValue(binaryMessenger2, "getBinaryMessenger(...)");
        setupEventChannels(applicationContext, binaryMessenger2);
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        teardownMethodChannel();
        teardownEventChannels();
    }

    private final void setupMethodChannel(BinaryMessenger messenger) {
        MethodChannel methodChannel = new MethodChannel(messenger, METHOD_CHANNEL_NAME);
        this.methodChannel = methodChannel;
        methodChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() { // from class: dev.fluttercommunity.plus.sensors.SensorsPlugin$$ExternalSyntheticLambda0
            @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
            public final void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                SensorsPlugin.setupMethodChannel$lambda$0(this.f$0, methodCall, result);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:37:0x007a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void setupMethodChannel$lambda$0(SensorsPlugin this$0, MethodCall call, MethodChannel.Result result) {
        StreamHandlerImpl streamHandlerImpl;
        Intrinsics.checkNotNullParameter(this$0, "this$0");
        Intrinsics.checkNotNullParameter(call, "call");
        Intrinsics.checkNotNullParameter(result, "result");
        String str = call.method;
        if (str != null) {
            switch (str.hashCode()) {
                case -1748473046:
                    if (str.equals("setAccelerationSamplingPeriod")) {
                        streamHandlerImpl = this$0.accelerometerStreamHandler;
                        if (streamHandlerImpl == null) {
                            Intrinsics.throwUninitializedPropertyAccessException("accelerometerStreamHandler");
                            streamHandlerImpl = null;
                            break;
                        }
                    } else {
                        streamHandlerImpl = null;
                    }
                    break;
                case -1203963890:
                    if (str.equals("setMagnetometerSamplingPeriod")) {
                        streamHandlerImpl = this$0.magnetometerStreamHandler;
                        if (streamHandlerImpl == null) {
                            Intrinsics.throwUninitializedPropertyAccessException("magnetometerStreamHandler");
                            streamHandlerImpl = null;
                            break;
                        }
                    }
                    break;
                case -521809110:
                    if (str.equals("setUserAccelerometerSamplingPeriod")) {
                        streamHandlerImpl = this$0.userAccelStreamHandler;
                        if (streamHandlerImpl == null) {
                            Intrinsics.throwUninitializedPropertyAccessException("userAccelStreamHandler");
                            streamHandlerImpl = null;
                            break;
                        }
                    }
                    break;
                case 1134117419:
                    if (str.equals("setGyroscopeSamplingPeriod")) {
                        streamHandlerImpl = this$0.gyroscopeStreamHandler;
                        if (streamHandlerImpl == null) {
                            Intrinsics.throwUninitializedPropertyAccessException("gyroscopeStreamHandler");
                            streamHandlerImpl = null;
                            break;
                        }
                    }
                    break;
                case 1567519091:
                    if (str.equals("setBarometerSamplingPeriod")) {
                        streamHandlerImpl = this$0.barometerStreamHandler;
                        if (streamHandlerImpl == null) {
                            Intrinsics.throwUninitializedPropertyAccessException("barometerStreamHandler");
                            streamHandlerImpl = null;
                            break;
                        }
                    }
                    break;
            }
        }
        if (streamHandlerImpl != null) {
            Object obj = call.arguments;
            Intrinsics.checkNotNull(obj, "null cannot be cast to non-null type kotlin.Int");
            streamHandlerImpl.setSamplingPeriod(((Integer) obj).intValue());
        }
        if (streamHandlerImpl != null) {
            result.success(null);
        } else {
            result.notImplemented();
        }
    }

    private final void teardownMethodChannel() {
        MethodChannel methodChannel = this.methodChannel;
        if (methodChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("methodChannel");
            methodChannel = null;
        }
        methodChannel.setMethodCallHandler(null);
    }

    private final void setupEventChannels(Context context, BinaryMessenger messenger) {
        Object systemService = context.getSystemService("sensor");
        Intrinsics.checkNotNull(systemService, "null cannot be cast to non-null type android.hardware.SensorManager");
        SensorManager sensorManager = (SensorManager) systemService;
        this.accelerometerChannel = new EventChannel(messenger, ACCELEROMETER_CHANNEL_NAME);
        this.accelerometerStreamHandler = new StreamHandlerImpl(sensorManager, 1);
        EventChannel eventChannel = this.accelerometerChannel;
        StreamHandlerImpl streamHandlerImpl = null;
        if (eventChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("accelerometerChannel");
            eventChannel = null;
        }
        StreamHandlerImpl streamHandlerImpl2 = this.accelerometerStreamHandler;
        if (streamHandlerImpl2 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("accelerometerStreamHandler");
            streamHandlerImpl2 = null;
        }
        eventChannel.setStreamHandler(streamHandlerImpl2);
        this.userAccelChannel = new EventChannel(messenger, USER_ACCELEROMETER_CHANNEL_NAME);
        this.userAccelStreamHandler = new StreamHandlerImpl(sensorManager, 10);
        EventChannel eventChannel2 = this.userAccelChannel;
        if (eventChannel2 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("userAccelChannel");
            eventChannel2 = null;
        }
        StreamHandlerImpl streamHandlerImpl3 = this.userAccelStreamHandler;
        if (streamHandlerImpl3 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("userAccelStreamHandler");
            streamHandlerImpl3 = null;
        }
        eventChannel2.setStreamHandler(streamHandlerImpl3);
        this.gyroscopeChannel = new EventChannel(messenger, GYROSCOPE_CHANNEL_NAME);
        this.gyroscopeStreamHandler = new StreamHandlerImpl(sensorManager, 4);
        EventChannel eventChannel3 = this.gyroscopeChannel;
        if (eventChannel3 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("gyroscopeChannel");
            eventChannel3 = null;
        }
        StreamHandlerImpl streamHandlerImpl4 = this.gyroscopeStreamHandler;
        if (streamHandlerImpl4 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("gyroscopeStreamHandler");
            streamHandlerImpl4 = null;
        }
        eventChannel3.setStreamHandler(streamHandlerImpl4);
        this.magnetometerChannel = new EventChannel(messenger, MAGNETOMETER_CHANNEL_NAME);
        this.magnetometerStreamHandler = new StreamHandlerImpl(sensorManager, 2);
        EventChannel eventChannel4 = this.magnetometerChannel;
        if (eventChannel4 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("magnetometerChannel");
            eventChannel4 = null;
        }
        StreamHandlerImpl streamHandlerImpl5 = this.magnetometerStreamHandler;
        if (streamHandlerImpl5 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("magnetometerStreamHandler");
            streamHandlerImpl5 = null;
        }
        eventChannel4.setStreamHandler(streamHandlerImpl5);
        this.barometerChannel = new EventChannel(messenger, BAROMETER_CHANNEL_NAME);
        this.barometerStreamHandler = new StreamHandlerImpl(sensorManager, 6);
        EventChannel eventChannel5 = this.barometerChannel;
        if (eventChannel5 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("barometerChannel");
            eventChannel5 = null;
        }
        StreamHandlerImpl streamHandlerImpl6 = this.barometerStreamHandler;
        if (streamHandlerImpl6 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("barometerStreamHandler");
        } else {
            streamHandlerImpl = streamHandlerImpl6;
        }
        eventChannel5.setStreamHandler(streamHandlerImpl);
    }

    private final void teardownEventChannels() {
        EventChannel eventChannel = this.accelerometerChannel;
        if (eventChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("accelerometerChannel");
            eventChannel = null;
        }
        eventChannel.setStreamHandler(null);
        EventChannel eventChannel2 = this.userAccelChannel;
        if (eventChannel2 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("userAccelChannel");
            eventChannel2 = null;
        }
        eventChannel2.setStreamHandler(null);
        EventChannel eventChannel3 = this.gyroscopeChannel;
        if (eventChannel3 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("gyroscopeChannel");
            eventChannel3 = null;
        }
        eventChannel3.setStreamHandler(null);
        EventChannel eventChannel4 = this.magnetometerChannel;
        if (eventChannel4 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("magnetometerChannel");
            eventChannel4 = null;
        }
        eventChannel4.setStreamHandler(null);
        EventChannel eventChannel5 = this.barometerChannel;
        if (eventChannel5 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("barometerChannel");
            eventChannel5 = null;
        }
        eventChannel5.setStreamHandler(null);
        StreamHandlerImpl streamHandlerImpl = this.accelerometerStreamHandler;
        if (streamHandlerImpl == null) {
            Intrinsics.throwUninitializedPropertyAccessException("accelerometerStreamHandler");
            streamHandlerImpl = null;
        }
        streamHandlerImpl.onCancel(null);
        StreamHandlerImpl streamHandlerImpl2 = this.userAccelStreamHandler;
        if (streamHandlerImpl2 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("userAccelStreamHandler");
            streamHandlerImpl2 = null;
        }
        streamHandlerImpl2.onCancel(null);
        StreamHandlerImpl streamHandlerImpl3 = this.gyroscopeStreamHandler;
        if (streamHandlerImpl3 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("gyroscopeStreamHandler");
            streamHandlerImpl3 = null;
        }
        streamHandlerImpl3.onCancel(null);
        StreamHandlerImpl streamHandlerImpl4 = this.magnetometerStreamHandler;
        if (streamHandlerImpl4 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("magnetometerStreamHandler");
            streamHandlerImpl4 = null;
        }
        streamHandlerImpl4.onCancel(null);
        StreamHandlerImpl streamHandlerImpl5 = this.barometerStreamHandler;
        if (streamHandlerImpl5 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("barometerStreamHandler");
            streamHandlerImpl5 = null;
        }
        streamHandlerImpl5.onCancel(null);
    }
}
