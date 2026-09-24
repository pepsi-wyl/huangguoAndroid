package com.example.analytics_sdk;

import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.content.pm.PackageManager;
import android.hardware.Sensor;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.StatFs;
import android.provider.Settings;
import android.telephony.TelephonyManager;
import androidx.core.app.NotificationCompat;
import com.github.gzuliyujiang.oaid.DeviceID;
import com.github.gzuliyujiang.oaid.DeviceIdentifier;
import com.github.gzuliyujiang.oaid.IGetter;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.io.File;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import kotlin.Metadata;
import kotlin.TuplesKt;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.ranges.RangesKt;
import kotlin.text.StringsKt;
import tv.danmaku.ijk.media.player.IjkMediaMeta;

/* compiled from: AnalyticsSdkPlugin.kt */
@Metadata(d1 = {"\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\t\u0018\u0000 E2\u00020\u00012\u00020\u00022\u00020\u0003:\u0001EB\u0005¢\u0006\u0002\u0010\u0004J\u0014\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0016H\u0002J(\u0010\u0018\u001a\u00020\u00192\u001e\u0010\u001a\u001a\u001a\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012\u0012\u0004\u0012\u00020\u00190\u001bH\u0002J\u0010\u0010\u001c\u001a\u00020\u00192\u0006\u0010\u001d\u001a\u00020\u001eH\u0002J\u0014\u0010\u001f\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\b\u0010 \u001a\u00020\u0013H\u0002J(\u0010!\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u00122\u0012\u0010\"\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\b\u0010#\u001a\u00020\u0013H\u0002J\u0014\u0010$\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\b\u0010%\u001a\u00020&H\u0002J\u0012\u0010'\u001a\u00020\u00132\b\u0010(\u001a\u0004\u0018\u00010\u0013H\u0002J\b\u0010)\u001a\u00020\u0013H\u0002J\b\u0010*\u001a\u00020+H\u0002J\u0014\u0010,\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0010\u0010-\u001a\u00020\u00192\u0006\u0010.\u001a\u00020/H\u0016J\u0012\u00100\u001a\u00020\u00192\b\u00101\u001a\u0004\u0018\u00010\u0014H\u0016J\u0010\u00102\u001a\u00020\u00192\u0006\u00103\u001a\u00020/H\u0016J\u001c\u00104\u001a\u00020\u00192\b\u00101\u001a\u0004\u0018\u00010\u00142\b\u00105\u001a\u0004\u0018\u00010\u000eH\u0016J\u0018\u00106\u001a\u00020\u00192\u0006\u00107\u001a\u0002082\u0006\u0010\u001d\u001a\u00020\u001eH\u0016J\b\u00109\u001a\u00020\u0019H\u0002J\b\u0010:\u001a\u00020\u0013H\u0002J\u0010\u0010;\u001a\u00020\u00132\u0006\u0010<\u001a\u00020=H\u0002J\b\u0010>\u001a\u00020&H\u0002J\u0014\u0010?\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0012\u0010@\u001a\u00020\u00192\b\u00105\u001a\u0004\u0018\u00010\u000eH\u0002J\b\u0010A\u001a\u00020\u0019H\u0002J\u0014\u0010B\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0014\u0010C\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0012\u0010D\u001a\u00020\u00132\b\u0010(\u001a\u0004\u0018\u00010\u0013H\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006F"}, d2 = {"Lcom/example/analytics_sdk/AnalyticsSdkPlugin;", "Lio/flutter/embedding/engine/plugins/FlutterPlugin;", "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;", "Lio/flutter/plugin/common/EventChannel$StreamHandler;", "()V", "channel", "Lio/flutter/plugin/common/MethodChannel;", "context", "Landroid/content/Context;", "mainHandler", "Landroid/os/Handler;", "proximityChannel", "Lio/flutter/plugin/common/EventChannel;", "proximityEventSink", "Lio/flutter/plugin/common/EventChannel$EventSink;", "proximityListener", "Landroid/hardware/SensorEventListener;", "androidIdFields", "", "", "", "bytesToGb", "", "bytes", "collectAdvertisingIdFields", "", "onReady", "Lkotlin/Function1;", "collectSdkInitPlatformFields", "result", "Lio/flutter/plugin/common/MethodChannel$Result;", "debugStateFields", "deviceId", "getSdkInitPlatformFields", "advertisingIdFields", "guid", "hardwareCapabilityFields", "hasBaseband", "", "hashIdentifier", "value", "installSource", "isRooted", "", "networkStateFields", "onAttachedToEngine", "flutterPluginBinding", "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;", "onCancel", "arguments", "onDetachedFromEngine", "binding", "onListen", "events", "onMethodCall", NotificationCompat.CATEGORY_CALL, "Lio/flutter/plugin/common/MethodCall;", "registerDeviceIdentifier", "resolveClientIdRaw", "resolveNetworkType", "manager", "Landroid/telephony/TelephonyManager;", "rootedState", "sensorFields", "startProximityEvents", "stopProximityEvents", "storageFields", "telephonyFields", "unknownIfBlank", "Companion", "analytics_sdk_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AnalyticsSdkPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler, EventChannel.StreamHandler {
    private static final Companion Companion = new Companion(null);
    private static final int LOG_CHUNK_SIZE = 1000;
    private static final String LOG_TAG = "AnalyticsSdk";
    private static final int NETWORK_TYPE_LTE_CA = 19;
    private MethodChannel channel;
    private Context context;
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private EventChannel proximityChannel;
    private EventChannel.EventSink proximityEventSink;
    private SensorEventListener proximityListener;

    /* compiled from: AnalyticsSdkPlugin.kt */
    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0082\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000¨\u0006\b"}, d2 = {"Lcom/example/analytics_sdk/AnalyticsSdkPlugin$Companion;", "", "()V", "LOG_CHUNK_SIZE", "", "LOG_TAG", "", "NETWORK_TYPE_LTE_CA", "analytics_sdk_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    private static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
        Intrinsics.checkNotNullParameter(flutterPluginBinding, "flutterPluginBinding");
        Context applicationContext = flutterPluginBinding.getApplicationContext();
        Intrinsics.checkNotNullExpressionValue(applicationContext, "getApplicationContext(...)");
        this.context = applicationContext;
        registerDeviceIdentifier();
        MethodChannel methodChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "analytics_sdk");
        this.channel = methodChannel;
        methodChannel.setMethodCallHandler(this);
        EventChannel eventChannel = new EventChannel(flutterPluginBinding.getBinaryMessenger(), "analytics_sdk/proximity");
        this.proximityChannel = eventChannel;
        eventChannel.setStreamHandler(this);
    }

    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        Intrinsics.checkNotNullParameter(call, "call");
        Intrinsics.checkNotNullParameter(result, "result");
        String str = call.method;
        if (str != null) {
            int iHashCode = str.hashCode();
            if (iHashCode != -1814759840) {
                if (iHashCode != -1107875961) {
                    if (iHashCode == 1385449135 && str.equals("getPlatformVersion")) {
                        result.success("Android " + Build.VERSION.RELEASE);
                        return;
                    }
                } else if (str.equals("getDeviceId")) {
                    result.success(deviceId());
                    return;
                }
            } else if (str.equals("getSdkInitPlatformFields")) {
                collectSdkInitPlatformFields(result);
                return;
            }
        }
        result.notImplemented();
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        stopProximityEvents();
        EventChannel eventChannel = this.proximityChannel;
        if (eventChannel != null) {
            eventChannel.setStreamHandler(null);
        }
        this.proximityChannel = null;
        MethodChannel methodChannel = this.channel;
        if (methodChannel == null) {
            Intrinsics.throwUninitializedPropertyAccessException("channel");
            methodChannel = null;
        }
        methodChannel.setMethodCallHandler(null);
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onListen(Object arguments, EventChannel.EventSink events) {
        stopProximityEvents();
        this.proximityEventSink = events;
        startProximityEvents(events);
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onCancel(Object arguments) {
        stopProximityEvents();
    }

    private final void collectSdkInitPlatformFields(final MethodChannel.Result result) {
        collectAdvertisingIdFields(new Function1<Map<String, ? extends Object>, Unit>() { // from class: com.example.analytics_sdk.AnalyticsSdkPlugin.collectSdkInitPlatformFields.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Map<String, ? extends Object> map) {
                invoke2(map);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke, reason: avoid collision after fix types in other method */
            public final void invoke2(Map<String, ? extends Object> advertisingIdFields) {
                Intrinsics.checkNotNullParameter(advertisingIdFields, "advertisingIdFields");
                result.success(this.getSdkInitPlatformFields(advertisingIdFields));
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Map<String, Object> getSdkInitPlatformFields(Map<String, ? extends Object> advertisingIdFields) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Context context = this.context;
        if (context == null) {
            Intrinsics.throwUninitializedPropertyAccessException("context");
            context = null;
        }
        String packageName = context.getPackageName();
        Intrinsics.checkNotNullExpressionValue(packageName, "getPackageName(...)");
        linkedHashMap.put("package_name", packageName);
        String id = TimeZone.getDefault().getID();
        Intrinsics.checkNotNullExpressionValue(id, "getID(...)");
        linkedHashMap.put("timezone", id);
        linkedHashMap.put("brand", unknownIfBlank(Build.BRAND));
        linkedHashMap.put("manufacturer", unknownIfBlank(Build.MANUFACTURER));
        linkedHashMap.put("model", unknownIfBlank(Build.MODEL));
        String[] SUPPORTED_ABIS = Build.SUPPORTED_ABIS;
        Intrinsics.checkNotNullExpressionValue(SUPPORTED_ABIS, "SUPPORTED_ABIS");
        linkedHashMap.put("abi", unknownIfBlank((String) ArraysKt.firstOrNull(SUPPORTED_ABIS)));
        linkedHashMap.put("build_hardware", unknownIfBlank(Build.HARDWARE));
        linkedHashMap.put("build_product", unknownIfBlank(Build.PRODUCT));
        linkedHashMap.put("build_fingerprint", unknownIfBlank(Build.FINGERPRINT));
        linkedHashMap.putAll(telephonyFields());
        linkedHashMap.putAll(hardwareCapabilityFields());
        linkedHashMap.putAll(storageFields());
        linkedHashMap.putAll(networkStateFields());
        linkedHashMap.putAll(androidIdFields());
        linkedHashMap.putAll(advertisingIdFields);
        linkedHashMap.putAll(debugStateFields());
        linkedHashMap.putAll(sensorFields());
        linkedHashMap.put("install_source", installSource());
        linkedHashMap.put("is_rooted", Integer.valueOf(rootedState()));
        linkedHashMap.put("has_baseband", Integer.valueOf(hasBaseband()));
        return linkedHashMap;
    }

    private final Map<String, Object> hardwareCapabilityFields() {
        int i = 0;
        Map<String, Object> mapMutableMapOf = MapsKt.mutableMapOf(TuplesKt.to("cpu_cores", -1), TuplesKt.to("device_memory_gb", -1), TuplesKt.to("touch_support", -1), TuplesKt.to("max_touch_points", -1));
        try {
            mapMutableMapOf.put("cpu_cores", Integer.valueOf(RangesKt.coerceAtLeast(Runtime.getRuntime().availableProcessors(), 1)));
        } catch (Throwable unused) {
        }
        Context context = null;
        try {
            Context context2 = this.context;
            if (context2 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
                context2 = null;
            }
            Object systemService = context2.getSystemService("activity");
            ActivityManager activityManager = systemService instanceof ActivityManager ? (ActivityManager) systemService : null;
            if (activityManager != null) {
                ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
                activityManager.getMemoryInfo(memoryInfo);
                mapMutableMapOf.put("device_memory_gb", Long.valueOf(bytesToGb(memoryInfo.totalMem)));
            }
        } catch (Throwable unused2) {
        }
        try {
            Context context3 = this.context;
            if (context3 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
            } else {
                context = context3;
            }
            PackageManager packageManager = context.getPackageManager();
            boolean zHasSystemFeature = packageManager.hasSystemFeature("android.hardware.touchscreen");
            mapMutableMapOf.put("touch_support", Integer.valueOf(zHasSystemFeature ? 1 : 0));
            if (packageManager.hasSystemFeature("android.hardware.touchscreen.multitouch.jazzhand")) {
                i = 5;
            } else if (packageManager.hasSystemFeature("android.hardware.touchscreen.multitouch.distinct") || packageManager.hasSystemFeature("android.hardware.touchscreen.multitouch")) {
                i = 2;
            } else if (zHasSystemFeature) {
                i = 1;
            }
            mapMutableMapOf.put("max_touch_points", Integer.valueOf(i));
        } catch (Throwable unused3) {
        }
        return mapMutableMapOf;
    }

    private final Map<String, Object> telephonyFields() {
        TelephonyManager telephonyManager;
        String str = "";
        int i = -1;
        Map<String, Object> mapMutableMapOf = MapsKt.mutableMapOf(TuplesKt.to("network_type", "unknown"), TuplesKt.to("carrier", ""), TuplesKt.to("mcc", "unknown"), TuplesKt.to("mnc", "unknown"), TuplesKt.to("has_sim", -1));
        try {
            Context context = this.context;
            if (context == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
                context = null;
            }
            Object systemService = context.getSystemService("phone");
            telephonyManager = systemService instanceof TelephonyManager ? (TelephonyManager) systemService : null;
        } catch (Throwable unused) {
        }
        if (telephonyManager == null) {
            return mapMutableMapOf;
        }
        String simOperatorName = telephonyManager.getSimOperatorName();
        if (simOperatorName == null) {
            simOperatorName = "";
        }
        mapMutableMapOf.put("carrier", simOperatorName);
        String simOperator = telephonyManager.getSimOperator();
        if (simOperator != null) {
            str = simOperator;
        }
        if (str.length() >= 3) {
            String strSubstring = str.substring(0, 3);
            Intrinsics.checkNotNullExpressionValue(strSubstring, "substring(...)");
            mapMutableMapOf.put("mcc", strSubstring);
        }
        if (str.length() > 3) {
            String strSubstring2 = str.substring(3);
            Intrinsics.checkNotNullExpressionValue(strSubstring2, "substring(...)");
            mapMutableMapOf.put("mnc", strSubstring2);
        }
        mapMutableMapOf.put("network_type", resolveNetworkType(telephonyManager));
        int simState = telephonyManager.getSimState();
        if (simState == 1) {
            i = 0;
        } else if (simState == 5) {
            i = 1;
        }
        mapMutableMapOf.put("has_sim", Integer.valueOf(i));
        return mapMutableMapOf;
    }

    private final String resolveNetworkType(TelephonyManager manager) {
        String str;
        try {
            switch (manager.getNetworkType()) {
                case 1:
                case 2:
                case 4:
                case 7:
                case 11:
                    str = "cellular_2g";
                    break;
                case 3:
                case 5:
                case 6:
                case 8:
                case 9:
                case 10:
                case 12:
                case 14:
                case 15:
                case 17:
                    str = "cellular_3g";
                    break;
                case 13:
                case 18:
                case 19:
                    str = "cellular_4g";
                    break;
                case 16:
                default:
                    return "unknown";
                case 20:
                    str = "cellular_5g";
                    break;
            }
            return str;
        } catch (Throwable unused) {
            return "unknown";
        }
    }

    private final Map<String, Object> storageFields() {
        try {
            Context context = this.context;
            if (context == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
                context = null;
            }
            StatFs statFs = new StatFs(context.getApplicationInfo().dataDir);
            return MapsKt.mapOf(TuplesKt.to("storage", Long.valueOf(bytesToGb(statFs.getTotalBytes()))), TuplesKt.to("available_storage", Long.valueOf(bytesToGb(statFs.getAvailableBytes()))));
        } catch (Throwable unused) {
            return MapsKt.mapOf(TuplesKt.to("storage", -1), TuplesKt.to("available_storage", -1));
        }
    }

    private final Map<String, Object> networkStateFields() {
        NetworkCapabilities networkCapabilities;
        Map<String, Object> mapMutableMapOf = MapsKt.mutableMapOf(TuplesKt.to("vpn_enabled", -1), TuplesKt.to("proxy_enabled", -1));
        try {
            Context context = this.context;
            if (context == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
                context = null;
            }
            Object systemService = context.getSystemService("connectivity");
            ConnectivityManager connectivityManager = systemService instanceof ConnectivityManager ? (ConnectivityManager) systemService : null;
            networkCapabilities = connectivityManager != null ? connectivityManager.getNetworkCapabilities(connectivityManager.getActiveNetwork()) : null;
        } catch (Throwable unused) {
        }
        if (networkCapabilities == null) {
            return mapMutableMapOf;
        }
        mapMutableMapOf.put("vpn_enabled", Integer.valueOf(networkCapabilities.hasTransport(4) ? 1 : 0));
        try {
            String property = System.getProperty("http.proxyHost");
            String string = property != null ? StringsKt.trim((CharSequence) property).toString() : null;
            if (string == null) {
                string = "";
            }
            mapMutableMapOf.put("proxy_enabled", Integer.valueOf(string.length() > 0 ? 1 : 0));
        } catch (Throwable unused2) {
        }
        return mapMutableMapOf;
    }

    private final Map<String, Object> androidIdFields() {
        try {
            Context context = this.context;
            if (context == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
                context = null;
            }
            String string = Settings.Secure.getString(context.getContentResolver(), "android_id");
            String string2 = string != null ? StringsKt.trim((CharSequence) string).toString() : null;
            if (string2 == null) {
                string2 = "";
            }
            if (string2.length() > 0) {
                return MapsKt.mapOf(TuplesKt.to("android_id", hashIdentifier(string2)), TuplesKt.to("android_id_o", string2), TuplesKt.to("android_id_status", "available"));
            }
            return MapsKt.mapOf(TuplesKt.to("android_id", ""), TuplesKt.to("android_id_o", ""), TuplesKt.to("android_id_status", "unavailable"));
        } catch (Throwable unused) {
            return MapsKt.mapOf(TuplesKt.to("android_id", ""), TuplesKt.to("android_id_o", ""), TuplesKt.to("android_id_status", "unknown"));
        }
    }

    private final void collectAdvertisingIdFields(final Function1<? super Map<String, ? extends Object>, Unit> onReady) {
        String strResolveClientIdRaw = resolveClientIdRaw();
        String strGuid = guid();
        final Map mapMutableMapOf = MapsKt.mutableMapOf(TuplesKt.to("oaid", hashIdentifier(strResolveClientIdRaw)), TuplesKt.to("oaid_o", strResolveClientIdRaw), TuplesKt.to("aaid", ""), TuplesKt.to("aaid_o", ""), TuplesKt.to("guid", hashIdentifier(strGuid)), TuplesKt.to("guid_o", strGuid));
        final Object obj = new Object();
        final Ref.BooleanRef booleanRef = new Ref.BooleanRef();
        this.mainHandler.postDelayed(new Runnable() { // from class: com.example.analytics_sdk.AnalyticsSdkPlugin$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                AnalyticsSdkPlugin.collectAdvertisingIdFields$lambda$3(obj, booleanRef, mapMutableMapOf, this, onReady);
            }
        }, 1500L);
        try {
            Context context = this.context;
            if (context == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
                context = null;
            }
            DeviceID.getByGms(context, new IGetter() { // from class: com.example.analytics_sdk.AnalyticsSdkPlugin.collectAdvertisingIdFields.2
                @Override // com.github.gzuliyujiang.oaid.IGetter
                public void onOAIDGetComplete(String result) {
                    AnalyticsSdkPlugin.collectAdvertisingIdFields$finishAaid(obj, booleanRef, mapMutableMapOf, this, onReady, result);
                }

                @Override // com.github.gzuliyujiang.oaid.IGetter
                public void onOAIDGetError(Exception error) {
                    AnalyticsSdkPlugin.collectAdvertisingIdFields$finishAaid(obj, booleanRef, mapMutableMapOf, this, onReady, "");
                }
            });
        } catch (Throwable unused) {
            collectAdvertisingIdFields$finishAaid(obj, booleanRef, mapMutableMapOf, this, onReady, "");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void collectAdvertisingIdFields$finishAaid(Object obj, Ref.BooleanRef booleanRef, Map<String, Object> map, AnalyticsSdkPlugin analyticsSdkPlugin, final Function1<? super Map<String, ? extends Object>, Unit> function1, String str) {
        final Map map2 = null;
        String string = str != null ? StringsKt.trim((CharSequence) str).toString() : null;
        if (string == null) {
            string = "";
        }
        synchronized (obj) {
            if (!booleanRef.element) {
                booleanRef.element = true;
                map.put("aaid", analyticsSdkPlugin.hashIdentifier(string));
                map.put("aaid_o", string);
                map2 = MapsKt.toMap(map);
            }
        }
        if (map2 != null) {
            analyticsSdkPlugin.mainHandler.post(new Runnable() { // from class: com.example.analytics_sdk.AnalyticsSdkPlugin$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    AnalyticsSdkPlugin.collectAdvertisingIdFields$finishAaid$lambda$2$lambda$1(function1, map2);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void collectAdvertisingIdFields$finishAaid$lambda$2$lambda$1(Function1 onReady, Map it) {
        Intrinsics.checkNotNullParameter(onReady, "$onReady");
        Intrinsics.checkNotNullParameter(it, "$it");
        onReady.invoke(it);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void collectAdvertisingIdFields$lambda$3(Object lock, Ref.BooleanRef completed, Map fields, AnalyticsSdkPlugin this$0, Function1 onReady) {
        Intrinsics.checkNotNullParameter(lock, "$lock");
        Intrinsics.checkNotNullParameter(completed, "$completed");
        Intrinsics.checkNotNullParameter(fields, "$fields");
        Intrinsics.checkNotNullParameter(this$0, "this$0");
        Intrinsics.checkNotNullParameter(onReady, "$onReady");
        collectAdvertisingIdFields$finishAaid(lock, completed, fields, this$0, onReady, "");
    }

    private final String guid() {
        try {
            Context context = this.context;
            if (context == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
                context = null;
            }
            String guid = DeviceIdentifier.getGUID(context);
            String string = guid != null ? StringsKt.trim((CharSequence) guid).toString() : null;
            return string == null ? "" : string;
        } catch (Throwable unused) {
            return "";
        }
    }

    private final String resolveClientIdRaw() {
        return ClientIdentifierResolver.INSTANCE.resolve(new Function0<String>() { // from class: com.example.analytics_sdk.AnalyticsSdkPlugin.resolveClientIdRaw.1
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public final String invoke() {
                Context context = AnalyticsSdkPlugin.this.context;
                if (context == null) {
                    Intrinsics.throwUninitializedPropertyAccessException("context");
                    context = null;
                }
                return DeviceIdentifier.getIMEI(context);
            }
        }, new Function0<String>() { // from class: com.example.analytics_sdk.AnalyticsSdkPlugin.resolveClientIdRaw.2
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public final String invoke() {
                Context context = AnalyticsSdkPlugin.this.context;
                if (context == null) {
                    Intrinsics.throwUninitializedPropertyAccessException("context");
                    context = null;
                }
                return DeviceIdentifier.getOAID(context);
            }
        }, new Function0<String>() { // from class: com.example.analytics_sdk.AnalyticsSdkPlugin.resolveClientIdRaw.3
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public final String invoke() {
                Context context = AnalyticsSdkPlugin.this.context;
                if (context == null) {
                    Intrinsics.throwUninitializedPropertyAccessException("context");
                    context = null;
                }
                return DeviceIdentifier.getAndroidID(context);
            }
        }, new Function0<String>() { // from class: com.example.analytics_sdk.AnalyticsSdkPlugin.resolveClientIdRaw.4
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public final String invoke() {
                Context context = AnalyticsSdkPlugin.this.context;
                if (context == null) {
                    Intrinsics.throwUninitializedPropertyAccessException("context");
                    context = null;
                }
                return DeviceIdentifier.getGUID(context);
            }
        });
    }

    private final String deviceId() {
        return hashIdentifier(resolveClientIdRaw());
    }

    private final String hashIdentifier(String value) {
        String string = value != null ? StringsKt.trim((CharSequence) value).toString() : null;
        if (string == null) {
            string = "";
        }
        if (string.length() == 0) {
            return "";
        }
        String strCalculateHash = DeviceID.calculateHash(string, "MD5");
        Intrinsics.checkNotNullExpressionValue(strCalculateHash, "calculateHash(...)");
        return strCalculateHash;
    }

    private final void registerDeviceIdentifier() {
        Context context = this.context;
        if (context == null) {
            Intrinsics.throwUninitializedPropertyAccessException("context");
            context = null;
        }
        Context applicationContext = context.getApplicationContext();
        Application application = applicationContext instanceof Application ? (Application) applicationContext : null;
        if (application == null) {
            return;
        }
        try {
            DeviceIdentifier.register(application);
        } catch (Throwable unused) {
        }
    }

    private final Map<String, Object> debugStateFields() {
        Map<String, Object> mapMutableMapOf = MapsKt.mutableMapOf(TuplesKt.to("developer_options_enabled", -1), TuplesKt.to("adb_enabled", -1), TuplesKt.to("usb_debug_enabled", -1));
        Context context = null;
        try {
            Context context2 = this.context;
            if (context2 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
                context2 = null;
            }
            mapMutableMapOf.put("developer_options_enabled", Integer.valueOf(Settings.Global.getInt(context2.getContentResolver(), "development_settings_enabled", 0) == 1 ? 1 : 0));
        } catch (Throwable unused) {
        }
        try {
            Context context3 = this.context;
            if (context3 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
            } else {
                context = context3;
            }
            int i = Settings.Global.getInt(context.getContentResolver(), "adb_enabled", 0) == 1 ? 1 : 0;
            mapMutableMapOf.put("adb_enabled", Integer.valueOf(i));
            mapMutableMapOf.put("usb_debug_enabled", Integer.valueOf(i));
        } catch (Throwable unused2) {
        }
        return mapMutableMapOf;
    }

    private final Map<String, Object> sensorFields() {
        SensorManager sensorManager;
        Map<String, Object> mapMutableMapOf = MapsKt.mutableMapOf(TuplesKt.to("sensor_count_supported", -1), TuplesKt.to("has_accelerometer", -1), TuplesKt.to("has_gyroscope", -1), TuplesKt.to("has_magnetometer", -1), TuplesKt.to("has_light_sensor", -1), TuplesKt.to("has_proximity_sensor", -1));
        try {
            Context context = this.context;
            if (context == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
                context = null;
            }
            Object systemService = context.getSystemService("sensor");
            sensorManager = systemService instanceof SensorManager ? (SensorManager) systemService : null;
        } catch (Throwable unused) {
        }
        if (sensorManager == null) {
            return mapMutableMapOf;
        }
        mapMutableMapOf.put("sensor_count_supported", Integer.valueOf(sensorManager.getSensorList(-1).size()));
        mapMutableMapOf.put("has_accelerometer", Integer.valueOf(sensorManager.getDefaultSensor(1) != null ? 1 : 0));
        mapMutableMapOf.put("has_gyroscope", Integer.valueOf(sensorManager.getDefaultSensor(4) != null ? 1 : 0));
        mapMutableMapOf.put("has_magnetometer", Integer.valueOf(sensorManager.getDefaultSensor(2) != null ? 1 : 0));
        mapMutableMapOf.put("has_light_sensor", Integer.valueOf(sensorManager.getDefaultSensor(5) != null ? 1 : 0));
        mapMutableMapOf.put("has_proximity_sensor", Integer.valueOf(sensorManager.getDefaultSensor(8) != null ? 1 : 0));
        return mapMutableMapOf;
    }

    private final void startProximityEvents(EventChannel.EventSink events) {
        try {
            Context context = this.context;
            if (context == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
                context = null;
            }
            Object systemService = context.getSystemService("sensor");
            SensorManager sensorManager = systemService instanceof SensorManager ? (SensorManager) systemService : null;
            if (sensorManager == null) {
                if (events != null) {
                    events.error("proximity_unavailable", "SensorManager unavailable", null);
                    return;
                }
                return;
            }
            Sensor defaultSensor = sensorManager.getDefaultSensor(8);
            if (defaultSensor == null) {
                if (events != null) {
                    events.error("proximity_unavailable", "Proximity sensor unavailable", null);
                }
            } else {
                AnalyticsSdkPlugin$startProximityEvents$listener$1 analyticsSdkPlugin$startProximityEvents$listener$1 = new AnalyticsSdkPlugin$startProximityEvents$listener$1(defaultSensor, this);
                this.proximityListener = analyticsSdkPlugin$startProximityEvents$listener$1;
                sensorManager.registerListener(analyticsSdkPlugin$startProximityEvents$listener$1, defaultSensor, 3);
            }
        } catch (Throwable th) {
            if (events != null) {
                String message = th.getMessage();
                if (message == null) {
                    message = "Proximity listener failed";
                }
                events.error("proximity_error", message, null);
            }
        }
    }

    private final void stopProximityEvents() {
        try {
            Context context = this.context;
            if (context == null) {
                Intrinsics.throwUninitializedPropertyAccessException("context");
                context = null;
            }
            Object systemService = context.getSystemService("sensor");
            SensorManager sensorManager = systemService instanceof SensorManager ? (SensorManager) systemService : null;
            SensorEventListener sensorEventListener = this.proximityListener;
            if (sensorManager != null && sensorEventListener != null) {
                sensorManager.unregisterListener(sensorEventListener);
            }
        } catch (Throwable unused) {
        }
        this.proximityListener = null;
        this.proximityEventSink = null;
    }

    private final String installSource() {
        String installerPackageName;
        try {
            Context context = null;
            if (Build.VERSION.SDK_INT >= 30) {
                Context context2 = this.context;
                if (context2 == null) {
                    Intrinsics.throwUninitializedPropertyAccessException("context");
                    context2 = null;
                }
                PackageManager packageManager = context2.getPackageManager();
                Context context3 = this.context;
                if (context3 == null) {
                    Intrinsics.throwUninitializedPropertyAccessException("context");
                } else {
                    context = context3;
                }
                installerPackageName = packageManager.getInstallSourceInfo(context.getPackageName()).getInstallingPackageName();
                if (installerPackageName == null) {
                    return "";
                }
            } else {
                Context context4 = this.context;
                if (context4 == null) {
                    Intrinsics.throwUninitializedPropertyAccessException("context");
                    context4 = null;
                }
                PackageManager packageManager2 = context4.getPackageManager();
                Context context5 = this.context;
                if (context5 == null) {
                    Intrinsics.throwUninitializedPropertyAccessException("context");
                } else {
                    context = context5;
                }
                installerPackageName = packageManager2.getInstallerPackageName(context.getPackageName());
                if (installerPackageName == null) {
                    return "";
                }
            }
            return installerPackageName;
        } catch (Throwable unused) {
            return "";
        }
    }

    private final int hasBaseband() {
        try {
            String radioVersion = Build.getRadioVersion();
            String string = radioVersion != null ? StringsKt.trim((CharSequence) radioVersion).toString() : null;
            if (string == null) {
                string = "";
            }
            if (string.length() == 0) {
                return -1;
            }
            return StringsKt.equals(string, "unknown", true) ? -1 : 1;
        } catch (Throwable unused) {
            return -1;
        }
    }

    private final int rootedState() {
        try {
            return isRooted() ? 1 : 0;
        } catch (Throwable unused) {
            return -1;
        }
    }

    private final boolean isRooted() {
        String str = Build.TAGS;
        if (str == null) {
            str = "";
        }
        if (StringsKt.contains$default((CharSequence) str, (CharSequence) "test-keys", false, 2, (Object) null)) {
            return true;
        }
        List listListOf = CollectionsKt.listOf((Object[]) new String[]{"/system/app/Superuser.apk", "/sbin/su", "/system/bin/su", "/system/xbin/su", "/data/local/xbin/su", "/data/local/bin/su", "/system/sd/xbin/su", "/system/bin/failsafe/su", "/data/local/su"});
        if ((listListOf instanceof Collection) && listListOf.isEmpty()) {
            return false;
        }
        Iterator it = listListOf.iterator();
        while (it.hasNext()) {
            if (new File((String) it.next()).exists()) {
                return true;
            }
        }
        return false;
    }

    private final long bytesToGb(long bytes) {
        if (bytes <= 0) {
            return -1L;
        }
        return bytes / IjkMediaMeta.AV_CH_STEREO_RIGHT;
    }

    private final String unknownIfBlank(String value) {
        String string = value != null ? StringsKt.trim((CharSequence) value).toString() : null;
        if (string == null) {
            string = "";
        }
        return string.length() == 0 ? "unknown" : string;
    }
}
