package dev.fluttercommunity.plus.battery;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.PowerManager;
import android.provider.Settings;
import androidx.core.app.NotificationCompat;
import androidx.core.content.ContextCompat;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: BatteryPlusPlugin.kt */
@Metadata(d1 = {"\u0000l\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u0000 -2\u00020\u00012\u00020\u00022\u00020\u0003:\u0001-B\u0005¢\u0006\u0002\u0010\u0004J\b\u0010\r\u001a\u00020\u000eH\u0002J\u0012\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0002J\u0010\u0010\u0013\u001a\u00020\b2\u0006\u0010\u0014\u001a\u00020\u0015H\u0002J\u0010\u0010\u0016\u001a\u00020\u00122\u0006\u0010\u0017\u001a\u00020\u0012H\u0002J\n\u0010\u0018\u001a\u0004\u0018\u00010\u0010H\u0002J\b\u0010\u0019\u001a\u00020\u000eH\u0002J\u000f\u0010\u001a\u001a\u0004\u0018\u00010\u000eH\u0002¢\u0006\u0002\u0010\u001bJ\b\u0010\u001c\u001a\u00020\u000eH\u0002J\b\u0010\u001d\u001a\u00020\u000eH\u0002J\u0010\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!H\u0016J\u0012\u0010\"\u001a\u00020\u001f2\b\u0010#\u001a\u0004\u0018\u00010$H\u0016J\u0010\u0010%\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!H\u0016J\u001a\u0010&\u001a\u00020\u001f2\b\u0010#\u001a\u0004\u0018\u00010$2\u0006\u0010\u0014\u001a\u00020\u0015H\u0017J\u0018\u0010'\u001a\u00020\u001f2\u0006\u0010(\u001a\u00020)2\u0006\u0010*\u001a\u00020+H\u0016J\u001a\u0010,\u001a\u00020\u001f2\u0006\u0010\u0014\u001a\u00020\u00152\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0002R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006."}, d2 = {"Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;", "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;", "Lio/flutter/plugin/common/EventChannel$StreamHandler;", "Lio/flutter/embedding/engine/plugins/FlutterPlugin;", "()V", "applicationContext", "Landroid/content/Context;", "chargingStateChangeReceiver", "Landroid/content/BroadcastReceiver;", "eventChannel", "Lio/flutter/plugin/common/EventChannel;", "methodChannel", "Lio/flutter/plugin/common/MethodChannel;", "checkPowerServiceSaveMode", "", "convertBatteryStatus", "", NotificationCompat.CATEGORY_STATUS, "", "createChargingStateChangeReceiver", "events", "Lio/flutter/plugin/common/EventChannel$EventSink;", "getBatteryProperty", "property", "getBatteryStatus", "isHuaweiPowerSaveModeActive", "isInPowerSaveMode", "()Ljava/lang/Boolean;", "isSamsungPowerSaveModeActive", "isXiaomiPowerSaveModeActive", "onAttachedToEngine", "", "binding", "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;", "onCancel", "arguments", "", "onDetachedFromEngine", "onListen", "onMethodCall", NotificationCompat.CATEGORY_CALL, "Lio/flutter/plugin/common/MethodCall;", "result", "Lio/flutter/plugin/common/MethodChannel$Result;", "publishBatteryStatus", "Companion", "battery_plus_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class BatteryPlusPlugin implements MethodChannel.MethodCallHandler, EventChannel.StreamHandler, FlutterPlugin {
    private static final String POWER_SAVE_MODE_HUAWEI_NAME = "SmartModeStatus";
    private static final int POWER_SAVE_MODE_HUAWEI_VALUE = 4;
    private static final String POWER_SAVE_MODE_SAMSUNG_NAME = "psm_switch";
    private static final String POWER_SAVE_MODE_SAMSUNG_VALUE = "1";
    private static final String POWER_SAVE_MODE_XIAOMI_NAME = "POWER_SAVE_MODE_OPEN";
    private static final int POWER_SAVE_MODE_XIAOMI_VALUE = 1;
    private Context applicationContext;
    private BroadcastReceiver chargingStateChangeReceiver;
    private EventChannel eventChannel;
    private MethodChannel methodChannel;

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        this.applicationContext = binding.getApplicationContext();
        this.methodChannel = new MethodChannel(binding.getBinaryMessenger(), "dev.fluttercommunity.plus/battery");
        EventChannel eventChannel = new EventChannel(binding.getBinaryMessenger(), "dev.fluttercommunity.plus/charging");
        this.eventChannel = eventChannel;
        Intrinsics.checkNotNull(eventChannel);
        eventChannel.setStreamHandler(this);
        MethodChannel methodChannel = this.methodChannel;
        Intrinsics.checkNotNull(methodChannel);
        methodChannel.setMethodCallHandler(this);
    }

    @Override // io.flutter.embedding.engine.plugins.FlutterPlugin
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        this.applicationContext = null;
        MethodChannel methodChannel = this.methodChannel;
        Intrinsics.checkNotNull(methodChannel);
        methodChannel.setMethodCallHandler(null);
        this.methodChannel = null;
        EventChannel eventChannel = this.eventChannel;
        Intrinsics.checkNotNull(eventChannel);
        eventChannel.setStreamHandler(null);
        this.eventChannel = null;
    }

    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        Intrinsics.checkNotNullParameter(call, "call");
        Intrinsics.checkNotNullParameter(result, "result");
        String str = call.method;
        if (str != null) {
            int iHashCode = str.hashCode();
            if (iHashCode != -82096147) {
                if (iHashCode != -75204358) {
                    if (iHashCode == 144057854 && str.equals("isInBatterySaveMode")) {
                        Boolean boolIsInPowerSaveMode = isInPowerSaveMode();
                        if (boolIsInPowerSaveMode != null) {
                            result.success(boolIsInPowerSaveMode);
                            return;
                        } else {
                            result.error("UNAVAILABLE", "Battery save mode not available.", null);
                            return;
                        }
                    }
                } else if (str.equals("getBatteryState")) {
                    String batteryStatus = getBatteryStatus();
                    if (batteryStatus != null) {
                        result.success(batteryStatus);
                        return;
                    } else {
                        result.error("UNAVAILABLE", "Charging status not available.", null);
                        return;
                    }
                }
            } else if (str.equals("getBatteryLevel")) {
                int batteryProperty = getBatteryProperty(4);
                if (batteryProperty != -1) {
                    result.success(Integer.valueOf(batteryProperty));
                    return;
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null);
                    return;
                }
            }
        }
        result.notImplemented();
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onListen(Object arguments, EventChannel.EventSink events) {
        Intrinsics.checkNotNullParameter(events, "events");
        BroadcastReceiver broadcastReceiverCreateChargingStateChangeReceiver = createChargingStateChangeReceiver(events);
        this.chargingStateChangeReceiver = broadcastReceiverCreateChargingStateChangeReceiver;
        Context context = this.applicationContext;
        if (context != null) {
            ContextCompat.registerReceiver(context, broadcastReceiverCreateChargingStateChangeReceiver, new IntentFilter("android.intent.action.BATTERY_CHANGED"), 4);
        }
        publishBatteryStatus(events, getBatteryStatus());
    }

    @Override // io.flutter.plugin.common.EventChannel.StreamHandler
    public void onCancel(Object arguments) {
        Context context = this.applicationContext;
        Intrinsics.checkNotNull(context);
        context.unregisterReceiver(this.chargingStateChangeReceiver);
        this.chargingStateChangeReceiver = null;
    }

    private final String getBatteryStatus() {
        int intExtra;
        if (Build.VERSION.SDK_INT >= 26) {
            intExtra = getBatteryProperty(6);
        } else {
            Intent intentRegisterReceiver = new ContextWrapper(this.applicationContext).registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
            intExtra = intentRegisterReceiver != null ? intentRegisterReceiver.getIntExtra(NotificationCompat.CATEGORY_STATUS, -1) : -1;
        }
        return convertBatteryStatus(intExtra);
    }

    private final Boolean isInPowerSaveMode() {
        String MANUFACTURER = Build.MANUFACTURER;
        Intrinsics.checkNotNullExpressionValue(MANUFACTURER, "MANUFACTURER");
        Locale locale = Locale.getDefault();
        Intrinsics.checkNotNullExpressionValue(locale, "getDefault(...)");
        String lowerCase = MANUFACTURER.toLowerCase(locale);
        Intrinsics.checkNotNullExpressionValue(lowerCase, "this as java.lang.String).toLowerCase(locale)");
        int iHashCode = lowerCase.hashCode();
        if (iHashCode != -1206476313) {
            if (iHashCode != -759499589) {
                if (iHashCode == 1864941562 && lowerCase.equals("samsung")) {
                    return Boolean.valueOf(isSamsungPowerSaveModeActive());
                }
            } else if (lowerCase.equals("xiaomi")) {
                return Boolean.valueOf(isXiaomiPowerSaveModeActive());
            }
        } else if (lowerCase.equals("huawei")) {
            return Boolean.valueOf(isHuaweiPowerSaveModeActive());
        }
        return Boolean.valueOf(checkPowerServiceSaveMode());
    }

    private final boolean isSamsungPowerSaveModeActive() {
        String string;
        if (Build.VERSION.SDK_INT < 31) {
            Context context = this.applicationContext;
            Intrinsics.checkNotNull(context);
            string = Settings.System.getString(context.getContentResolver(), POWER_SAVE_MODE_SAMSUNG_NAME);
        } else {
            string = null;
        }
        if (string == null) {
            return checkPowerServiceSaveMode();
        }
        return Intrinsics.areEqual(string, "1");
    }

    private final boolean isHuaweiPowerSaveModeActive() {
        Context context = this.applicationContext;
        Intrinsics.checkNotNull(context);
        int i = Settings.System.getInt(context.getContentResolver(), POWER_SAVE_MODE_HUAWEI_NAME, -1);
        if (i != -1) {
            return i == 4;
        }
        return checkPowerServiceSaveMode();
    }

    private final boolean isXiaomiPowerSaveModeActive() {
        Context context = this.applicationContext;
        Intrinsics.checkNotNull(context);
        int i = Settings.System.getInt(context.getContentResolver(), POWER_SAVE_MODE_XIAOMI_NAME, -1);
        if (i != -1) {
            return i == 1;
        }
        return checkPowerServiceSaveMode();
    }

    private final boolean checkPowerServiceSaveMode() {
        Context context = this.applicationContext;
        Intrinsics.checkNotNull(context);
        Object systemService = context.getSystemService("power");
        Intrinsics.checkNotNull(systemService, "null cannot be cast to non-null type android.os.PowerManager");
        return ((PowerManager) systemService).isPowerSaveMode();
    }

    private final int getBatteryProperty(int property) {
        Context context = this.applicationContext;
        Intrinsics.checkNotNull(context);
        Object systemService = context.getSystemService("batterymanager");
        Intrinsics.checkNotNull(systemService, "null cannot be cast to non-null type android.os.BatteryManager");
        return ((BatteryManager) systemService).getIntProperty(property);
    }

    private final BroadcastReceiver createChargingStateChangeReceiver(final EventChannel.EventSink events) {
        return new BroadcastReceiver() { // from class: dev.fluttercommunity.plus.battery.BatteryPlusPlugin.createChargingStateChangeReceiver.1
            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                Intrinsics.checkNotNullParameter(context, "context");
                Intrinsics.checkNotNullParameter(intent, "intent");
                int intExtra = intent.getIntExtra(NotificationCompat.CATEGORY_STATUS, -1);
                BatteryPlusPlugin batteryPlusPlugin = BatteryPlusPlugin.this;
                batteryPlusPlugin.publishBatteryStatus(events, batteryPlusPlugin.convertBatteryStatus(intExtra));
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final String convertBatteryStatus(int status) {
        if (status == 1) {
            return "unknown";
        }
        if (status == 2) {
            return "charging";
        }
        if (status == 3) {
            return "discharging";
        }
        if (status == 4) {
            return "connected_not_charging";
        }
        if (status != 5) {
            return null;
        }
        return "full";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void publishBatteryStatus(EventChannel.EventSink events, String status) {
        if (status != null) {
            events.success(status);
        } else {
            events.error("UNAVAILABLE", "Charging status unavailable", null);
        }
    }
}
