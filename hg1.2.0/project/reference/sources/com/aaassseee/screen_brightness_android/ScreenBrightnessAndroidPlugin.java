package com.aaassseee.screen_brightness_android;

import android.app.Activity;
import android.content.Context;
import android.os.PowerManager;
import android.provider.Settings;
import android.view.WindowManager;
import androidx.core.app.NotificationCompat;
import com.aaassseee.screen_brightness_android.stream_handler.CurrentBrightnessChangeStreamHandler;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.lang.reflect.Field;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.MutablePropertyReference1Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.properties.Delegates;
import kotlin.properties.ReadWriteProperty;
import kotlin.reflect.KProperty;

/* compiled from: ScreenBrightnessAndroidPlugin.kt */
@Metadata(d1 = {"\u0000l\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\u0005¢\u0006\u0002\u0010\u0004J\u0010\u0010\u001f\u001a\u00020\b2\u0006\u0010 \u001a\u00020!H\u0002J\u0010\u0010\u001c\u001a\u00020\b2\u0006\u0010 \u001a\u00020!H\u0002J\u0010\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020\bH\u0002J\u0010\u0010%\u001a\u00020#2\u0006\u0010&\u001a\u00020'H\u0002J\u0010\u0010(\u001a\u00020#2\u0006\u0010&\u001a\u00020'H\u0002J\u0010\u0010)\u001a\u00020#2\u0006\u0010&\u001a\u00020'H\u0002J\u0010\u0010*\u001a\u00020#2\u0006\u0010&\u001a\u00020'H\u0002J\u0010\u0010+\u001a\u00020#2\u0006\u0010&\u001a\u00020'H\u0002J\u0010\u0010,\u001a\u00020#2\u0006\u0010&\u001a\u00020'H\u0002J\u0018\u0010-\u001a\u00020#2\u0006\u0010.\u001a\u00020/2\u0006\u0010&\u001a\u00020'H\u0002J\u0018\u00100\u001a\u00020#2\u0006\u0010.\u001a\u00020/2\u0006\u0010&\u001a\u00020'H\u0002J\u0018\u00101\u001a\u00020#2\u0006\u0010.\u001a\u00020/2\u0006\u0010&\u001a\u00020'H\u0002J\u0010\u00102\u001a\u00020#2\u0006\u00103\u001a\u000204H\u0016J\u0010\u00105\u001a\u00020#2\u0006\u00106\u001a\u000207H\u0016J\b\u00108\u001a\u00020#H\u0016J\b\u00109\u001a\u00020#H\u0016J\u0010\u0010:\u001a\u00020#2\u0006\u00103\u001a\u000207H\u0016J\u0018\u0010;\u001a\u00020#2\u0006\u0010.\u001a\u00020/2\u0006\u0010&\u001a\u00020'H\u0016J\u0010\u0010<\u001a\u00020#2\u0006\u00103\u001a\u000204H\u0016J\u0010\u0010=\u001a\u00020\u000f2\u0006\u0010>\u001a\u00020\bH\u0002R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\u0007\u001a\u0004\u0018\u00010\bX\u0082\u000e¢\u0006\u0004\n\u0002\u0010\tR\u000e\u0010\n\u001a\u00020\u000bX\u0082.¢\u0006\u0002\n\u0000R\u0010\u0010\f\u001a\u0004\u0018\u00010\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R+\u0010\u0012\u001a\u00020\b2\u0006\u0010\u0011\u001a\u00020\b8B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b\u0017\u0010\u0018\u001a\u0004\b\u0013\u0010\u0014\"\u0004\b\u0015\u0010\u0016R\u000e\u0010\u0019\u001a\u00020\u001aX\u0082.¢\u0006\u0002\n\u0000R+\u0010\u001b\u001a\u00020\b2\u0006\u0010\u0011\u001a\u00020\b8B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b\u001e\u0010\u0018\u001a\u0004\b\u001c\u0010\u0014\"\u0004\b\u001d\u0010\u0016¨\u0006?"}, d2 = {"Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;", "Lio/flutter/embedding/engine/plugins/FlutterPlugin;", "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;", "Lio/flutter/embedding/engine/plugins/activity/ActivityAware;", "()V", "activity", "Landroid/app/Activity;", "changedBrightness", "", "Ljava/lang/Float;", "currentBrightnessChangeEventChannel", "Lio/flutter/plugin/common/EventChannel;", "currentBrightnessChangeStreamHandler", "Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;", "isAnimate", "", "isAutoReset", "<set-?>", "maximumBrightness", "getMaximumBrightness", "()F", "setMaximumBrightness", "(F)V", "maximumBrightness$delegate", "Lkotlin/properties/ReadWriteProperty;", "methodChannel", "Lio/flutter/plugin/common/MethodChannel;", "systemBrightness", "getSystemBrightness", "setSystemBrightness", "systemBrightness$delegate", "getScreenMaximumBrightness", "context", "Landroid/content/Context;", "handleCurrentBrightnessChanged", "", "currentBrightness", "handleGetScreenBrightnessMethodCall", "result", "Lio/flutter/plugin/common/MethodChannel$Result;", "handleGetSystemBrightnessMethodCall", "handleHasChangedMethodCall", "handleIsAnimateMethodCall", "handleIsAutoResetMethodCall", "handleResetScreenBrightnessMethodCall", "handleSetAnimateMethodCall", NotificationCompat.CATEGORY_CALL, "Lio/flutter/plugin/common/MethodCall;", "handleSetAutoResetMethodCall", "handleSetScreenBrightnessMethodCall", "onAttachedToActivity", "binding", "Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;", "onAttachedToEngine", "flutterPluginBinding", "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;", "onDetachedFromActivity", "onDetachedFromActivityForConfigChanges", "onDetachedFromEngine", "onMethodCall", "onReattachedToActivityForConfigChanges", "setWindowsAttributesBrightness", "brightness", "screen_brightness_android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ScreenBrightnessAndroidPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
    static final /* synthetic */ KProperty<Object>[] $$delegatedProperties = {Reflection.mutableProperty1(new MutablePropertyReference1Impl(ScreenBrightnessAndroidPlugin.class, "systemBrightness", "getSystemBrightness()F", 0)), Reflection.mutableProperty1(new MutablePropertyReference1Impl(ScreenBrightnessAndroidPlugin.class, "maximumBrightness", "getMaximumBrightness()F", 0))};
    private Activity activity;
    private Float changedBrightness;
    private EventChannel currentBrightnessChangeEventChannel;
    private CurrentBrightnessChangeStreamHandler currentBrightnessChangeStreamHandler;
    private MethodChannel methodChannel;

    /* renamed from: systemBrightness$delegate, reason: from kotlin metadata */
    private final ReadWriteProperty systemBrightness = Delegates.INSTANCE.notNull();

    /* renamed from: maximumBrightness$delegate, reason: from kotlin metadata */
    private final ReadWriteProperty maximumBrightness = Delegates.INSTANCE.notNull();
    private boolean isAutoReset = true;
    private boolean isAnimate = true;

    /* JADX INFO: Access modifiers changed from: private */
    public final float getSystemBrightness() {
        return ((Number) this.systemBrightness.getValue(this, $$delegatedProperties[0])).floatValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void setSystemBrightness(float f) {
        this.systemBrightness.setValue(this, $$delegatedProperties[0], Float.valueOf(f));
    }

    private final float getMaximumBrightness() {
        return ((Number) this.maximumBrightness.getValue(this, $$delegatedProperties[1])).floatValue();
    }

    private final void setMaximumBrightness(float f) {
        this.maximumBrightness.setValue(this, $$delegatedProperties[1], Float.valueOf(f));
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        Intrinsics.checkNotNullParameter(flutterPluginBinding, "flutterPluginBinding");
        MethodChannel methodChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "github.com/aaassseee/screen_brightness");
        this.methodChannel = methodChannel;
        methodChannel.setMethodCallHandler(this);
        this.currentBrightnessChangeEventChannel = new EventChannel(flutterPluginBinding.getBinaryMessenger(), "github.com/aaassseee/screen_brightness/change");
        try {
            Context applicationContext = flutterPluginBinding.getApplicationContext();
            Intrinsics.checkNotNullExpressionValue(applicationContext, "getApplicationContext(...)");
            setMaximumBrightness(getScreenMaximumBrightness(applicationContext));
            Context applicationContext2 = flutterPluginBinding.getApplicationContext();
            Intrinsics.checkNotNullExpressionValue(applicationContext2, "getApplicationContext(...)");
            setSystemBrightness(getSystemBrightness(applicationContext2));
        } catch (Settings.SettingNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override // io.flutter.embedding.engine.plugins.activity.ActivityAware
    public void onAttachedToActivity(final ActivityPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        this.activity = binding.getActivity();
        Activity activity = binding.getActivity();
        Intrinsics.checkNotNullExpressionValue(activity, "getActivity(...)");
        Function1<EventChannel.EventSink, Unit> function1 = new Function1<EventChannel.EventSink, Unit>() { // from class: com.aaassseee.screen_brightness_android.ScreenBrightnessAndroidPlugin.onAttachedToActivity.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(EventChannel.EventSink eventSink) {
                invoke2(eventSink);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke, reason: avoid collision after fix types in other method */
            public final void invoke2(EventChannel.EventSink eventSink) {
                Intrinsics.checkNotNullParameter(eventSink, "eventSink");
                ScreenBrightnessAndroidPlugin screenBrightnessAndroidPlugin = ScreenBrightnessAndroidPlugin.this;
                Activity activity2 = binding.getActivity();
                Intrinsics.checkNotNullExpressionValue(activity2, "getActivity(...)");
                screenBrightnessAndroidPlugin.setSystemBrightness(screenBrightnessAndroidPlugin.getSystemBrightness(activity2));
                if (ScreenBrightnessAndroidPlugin.this.changedBrightness == null) {
                    eventSink.success(Float.valueOf(ScreenBrightnessAndroidPlugin.this.getSystemBrightness()));
                }
            }
        };
        EventChannel eventChannel = null;
        this.currentBrightnessChangeStreamHandler = new CurrentBrightnessChangeStreamHandler(activity, null, function1);
        EventChannel eventChannel2 = this.currentBrightnessChangeEventChannel;
        if (eventChannel2 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("currentBrightnessChangeEventChannel");
        } else {
            eventChannel = eventChannel2;
        }
        eventChannel.setStreamHandler(this.currentBrightnessChangeStreamHandler);
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        Intrinsics.checkNotNullParameter(call, "call");
        Intrinsics.checkNotNullParameter(result, "result");
        String str = call.method;
        if (str != null) {
            switch (str.hashCode()) {
                case -1523636550:
                    if (str.equals("hasChanged")) {
                        handleHasChangedMethodCall(result);
                        return;
                    }
                    break;
                case -1467693354:
                    if (str.equals("isAutoReset")) {
                        handleIsAutoResetMethodCall(result);
                        return;
                    }
                    break;
                case -1436714409:
                    if (str.equals("isAnimate")) {
                        handleIsAnimateMethodCall(result);
                        return;
                    }
                    break;
                case -1368320692:
                    if (str.equals("resetScreenBrightness")) {
                        handleResetScreenBrightnessMethodCall(result);
                        return;
                    }
                    break;
                case -1350947233:
                    if (str.equals("setScreenBrightness")) {
                        handleSetScreenBrightnessMethodCall(call, result);
                        return;
                    }
                    break;
                case -1106725218:
                    if (str.equals("setAutoReset")) {
                        handleSetAutoResetMethodCall(call, result);
                        return;
                    }
                    break;
                case 192780627:
                    if (str.equals("getScreenBrightness")) {
                        handleGetScreenBrightnessMethodCall(result);
                        return;
                    }
                    break;
                case 576725282:
                    if (str.equals("getSystemScreenBrightness")) {
                        handleGetSystemBrightnessMethodCall(result);
                        return;
                    }
                    break;
                case 2116729887:
                    if (str.equals("setAnimate")) {
                        handleSetAnimateMethodCall(call, result);
                        return;
                    }
                    break;
            }
        }
        result.notImplemented();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final float getSystemBrightness(Context context) {
        return Settings.System.getInt(context.getContentResolver(), "screen_brightness") / getMaximumBrightness();
    }

    private final void handleGetSystemBrightnessMethodCall(MethodChannel.Result result) {
        result.success(Float.valueOf(getSystemBrightness()));
    }

    private final void handleGetScreenBrightnessMethodCall(MethodChannel.Result result) {
        Activity activity = this.activity;
        if (activity == null) {
            result.error("-10", "Unexpected error on activity binding", null);
            return;
        }
        WindowManager.LayoutParams attributes = activity.getWindow().getAttributes();
        Intrinsics.checkNotNullExpressionValue(attributes, "getAttributes(...)");
        float f = attributes.screenBrightness;
        Float fValueOf = Float.valueOf(f);
        fValueOf.getClass();
        if (Math.signum(f) != -1.0f) {
            result.success(fValueOf);
            return;
        }
        try {
            result.success(Float.valueOf(getSystemBrightness(activity)));
        } catch (Settings.SettingNotFoundException e) {
            e.printStackTrace();
            result.error("-11", "Could not found system setting screen brightness value", null);
        }
    }

    private final float getScreenMaximumBrightness(Context context) throws IllegalAccessException, ClassNotFoundException, IllegalArgumentException {
        try {
            PowerManager powerManager = (PowerManager) context.getSystemService("power");
            if (powerManager == null) {
                throw new ClassNotFoundException();
            }
            Field[] declaredFields = powerManager.getClass().getDeclaredFields();
            Intrinsics.checkNotNullExpressionValue(declaredFields, "getDeclaredFields(...)");
            for (Field field : declaredFields) {
                if (field.getName().equals("BRIGHTNESS_ON")) {
                    field.setAccessible(true);
                    Intrinsics.checkNotNull(field.get(powerManager), "null cannot be cast to non-null type kotlin.Int");
                    return ((Integer) r8).intValue();
                }
            }
            return 255.0f;
        } catch (Exception unused) {
            return 255.0f;
        }
    }

    private final boolean setWindowsAttributesBrightness(float brightness) {
        try {
            Activity activity = this.activity;
            Intrinsics.checkNotNull(activity);
            WindowManager.LayoutParams attributes = activity.getWindow().getAttributes();
            Intrinsics.checkNotNullExpressionValue(attributes, "getAttributes(...)");
            attributes.screenBrightness = brightness;
            Activity activity2 = this.activity;
            Intrinsics.checkNotNull(activity2);
            activity2.getWindow().setAttributes(attributes);
            return true;
        } catch (Exception unused) {
            return false;
        }
    }

    private final void handleSetScreenBrightnessMethodCall(MethodCall call, MethodChannel.Result result) {
        if (this.activity == null) {
            result.error("-10", "Unexpected error on activity binding", null);
            return;
        }
        Object objArgument = call.argument("brightness");
        Double d = objArgument instanceof Double ? (Double) objArgument : null;
        Float fValueOf = d != null ? Float.valueOf((float) d.doubleValue()) : null;
        if (fValueOf == null) {
            result.error("-2", "Unexpected error on null brightness", null);
        } else {
            if (!setWindowsAttributesBrightness(fValueOf.floatValue())) {
                result.error("-1", "Unable to change screen brightness", null);
                return;
            }
            this.changedBrightness = fValueOf;
            handleCurrentBrightnessChanged(fValueOf.floatValue());
            result.success(null);
        }
    }

    private final void handleResetScreenBrightnessMethodCall(MethodChannel.Result result) {
        if (this.activity == null) {
            result.error("-10", "Unexpected error on activity binding", null);
        } else {
            if (!setWindowsAttributesBrightness(-1.0f)) {
                result.error("-1", "Unable to change screen brightness", null);
                return;
            }
            this.changedBrightness = null;
            handleCurrentBrightnessChanged(getSystemBrightness());
            result.success(null);
        }
    }

    private final void handleCurrentBrightnessChanged(float currentBrightness) {
        CurrentBrightnessChangeStreamHandler currentBrightnessChangeStreamHandler = this.currentBrightnessChangeStreamHandler;
        if (currentBrightnessChangeStreamHandler != null) {
            currentBrightnessChangeStreamHandler.addCurrentBrightnessToEventSink(currentBrightness);
        }
    }

    private final void handleHasChangedMethodCall(MethodChannel.Result result) {
        result.success(Boolean.valueOf(this.changedBrightness != null));
    }

    private final void handleIsAutoResetMethodCall(MethodChannel.Result result) {
        result.success(Boolean.valueOf(this.isAutoReset));
    }

    private final void handleSetAutoResetMethodCall(MethodCall call, MethodChannel.Result result) {
        Object objArgument = call.argument("isAutoReset");
        Boolean bool = objArgument instanceof Boolean ? (Boolean) objArgument : null;
        if (bool == null) {
            result.error("-2", "Unexpected error on null isAutoReset", null);
        } else {
            this.isAutoReset = bool.booleanValue();
            result.success(null);
        }
    }

    private final void handleIsAnimateMethodCall(MethodChannel.Result result) {
        result.success(Boolean.valueOf(this.isAnimate));
    }

    private final void handleSetAnimateMethodCall(MethodCall call, MethodChannel.Result result) {
        Object objArgument = call.argument("isAnimate");
        Boolean bool = objArgument instanceof Boolean ? (Boolean) objArgument : null;
        if (bool == null) {
            result.error("-2", "Unexpected error on null isAnimate", null);
        } else {
            this.isAnimate = bool.booleanValue();
            result.success(null);
        }
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
        EventChannel eventChannel = this.currentBrightnessChangeEventChannel;
        if (eventChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("currentBrightnessChangeEventChannel");
            eventChannel = null;
        }
        eventChannel.setStreamHandler(null);
        this.currentBrightnessChangeStreamHandler = null;
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
        EventChannel eventChannel = this.currentBrightnessChangeEventChannel;
        if (eventChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("currentBrightnessChangeEventChannel");
            eventChannel = null;
        }
        eventChannel.setStreamHandler(null);
        this.currentBrightnessChangeStreamHandler = null;
    }
}
