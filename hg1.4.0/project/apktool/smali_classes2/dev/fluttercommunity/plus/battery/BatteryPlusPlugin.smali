.class public final Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;
.super Ljava/lang/Object;
.source "BatteryPlusPlugin.kt"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000l\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u0000 -2\u00020\u00012\u00020\u00022\u00020\u0003:\u0001-B\u0005\u00a2\u0006\u0002\u0010\u0004J\u0008\u0010\r\u001a\u00020\u000eH\u0002J\u0012\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0002J\u0010\u0010\u0013\u001a\u00020\u00082\u0006\u0010\u0014\u001a\u00020\u0015H\u0002J\u0010\u0010\u0016\u001a\u00020\u00122\u0006\u0010\u0017\u001a\u00020\u0012H\u0002J\n\u0010\u0018\u001a\u0004\u0018\u00010\u0010H\u0002J\u0008\u0010\u0019\u001a\u00020\u000eH\u0002J\u000f\u0010\u001a\u001a\u0004\u0018\u00010\u000eH\u0002\u00a2\u0006\u0002\u0010\u001bJ\u0008\u0010\u001c\u001a\u00020\u000eH\u0002J\u0008\u0010\u001d\u001a\u00020\u000eH\u0002J\u0010\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!H\u0016J\u0012\u0010\"\u001a\u00020\u001f2\u0008\u0010#\u001a\u0004\u0018\u00010$H\u0016J\u0010\u0010%\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020!H\u0016J\u001a\u0010&\u001a\u00020\u001f2\u0008\u0010#\u001a\u0004\u0018\u00010$2\u0006\u0010\u0014\u001a\u00020\u0015H\u0017J\u0018\u0010\'\u001a\u00020\u001f2\u0006\u0010(\u001a\u00020)2\u0006\u0010*\u001a\u00020+H\u0016J\u001a\u0010,\u001a\u00020\u001f2\u0006\u0010\u0014\u001a\u00020\u00152\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0002R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006."
    }
    d2 = {
        "Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;",
        "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;",
        "Lio/flutter/plugin/common/EventChannel$StreamHandler;",
        "Lio/flutter/embedding/engine/plugins/FlutterPlugin;",
        "()V",
        "applicationContext",
        "Landroid/content/Context;",
        "chargingStateChangeReceiver",
        "Landroid/content/BroadcastReceiver;",
        "eventChannel",
        "Lio/flutter/plugin/common/EventChannel;",
        "methodChannel",
        "Lio/flutter/plugin/common/MethodChannel;",
        "checkPowerServiceSaveMode",
        "",
        "convertBatteryStatus",
        "",
        "status",
        "",
        "createChargingStateChangeReceiver",
        "events",
        "Lio/flutter/plugin/common/EventChannel$EventSink;",
        "getBatteryProperty",
        "property",
        "getBatteryStatus",
        "isHuaweiPowerSaveModeActive",
        "isInPowerSaveMode",
        "()Ljava/lang/Boolean;",
        "isSamsungPowerSaveModeActive",
        "isXiaomiPowerSaveModeActive",
        "onAttachedToEngine",
        "",
        "binding",
        "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;",
        "onCancel",
        "arguments",
        "",
        "onDetachedFromEngine",
        "onListen",
        "onMethodCall",
        "call",
        "Lio/flutter/plugin/common/MethodCall;",
        "result",
        "Lio/flutter/plugin/common/MethodChannel$Result;",
        "publishBatteryStatus",
        "Companion",
        "battery_plus_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin$Companion;

.field private static final POWER_SAVE_MODE_HUAWEI_NAME:Ljava/lang/String; = "SmartModeStatus"

.field private static final POWER_SAVE_MODE_HUAWEI_VALUE:I = 0x4

.field private static final POWER_SAVE_MODE_SAMSUNG_NAME:Ljava/lang/String; = "psm_switch"

.field private static final POWER_SAVE_MODE_SAMSUNG_VALUE:Ljava/lang/String; = "1"

.field private static final POWER_SAVE_MODE_XIAOMI_NAME:Ljava/lang/String; = "POWER_SAVE_MODE_OPEN"

.field private static final POWER_SAVE_MODE_XIAOMI_VALUE:I = 0x1


# instance fields
.field private applicationContext:Landroid/content/Context;

.field private chargingStateChangeReceiver:Landroid/content/BroadcastReceiver;

.field private eventChannel:Lio/flutter/plugin/common/EventChannel;

.field private methodChannel:Lio/flutter/plugin/common/MethodChannel;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->Companion:Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic access$convertBatteryStatus(Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;I)Ljava/lang/String;
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->convertBatteryStatus(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$publishBatteryStatus(Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/lang/String;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->publishBatteryStatus(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/lang/String;)V

    return-void
.end method

.method private final checkPowerServiceSaveMode()Z
    .locals 2

    .line 174
    iget-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->applicationContext:Landroid/content/Context;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type android.os.PowerManager"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/os/PowerManager;

    .line 175
    invoke-virtual {v0}, Landroid/os/PowerManager;->isPowerSaveMode()Z

    move-result v0

    return v0
.end method

.method private final convertBatteryStatus(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 196
    :cond_0
    const-string p1, "full"

    goto :goto_0

    .line 198
    :cond_1
    const-string p1, "connected_not_charging"

    goto :goto_0

    .line 197
    :cond_2
    const-string p1, "discharging"

    goto :goto_0

    .line 195
    :cond_3
    const-string p1, "charging"

    goto :goto_0

    .line 199
    :cond_4
    const-string p1, "unknown"

    :goto_0
    return-object p1
.end method

.method private final createChargingStateChangeReceiver(Lio/flutter/plugin/common/EventChannel$EventSink;)Landroid/content/BroadcastReceiver;
    .locals 1

    .line 185
    new-instance v0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin$createChargingStateChangeReceiver$1;

    invoke-direct {v0, p0, p1}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin$createChargingStateChangeReceiver$1;-><init>(Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    check-cast v0, Landroid/content/BroadcastReceiver;

    return-object v0
.end method

.method private final getBatteryProperty(I)I
    .locals 2

    .line 180
    iget-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->applicationContext:Landroid/content/Context;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const-string v1, "batterymanager"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type android.os.BatteryManager"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/os/BatteryManager;

    .line 181
    invoke-virtual {v0, p1}, Landroid/os/BatteryManager;->getIntProperty(I)I

    move-result p1

    return p1
.end method

.method private final getBatteryStatus()Ljava/lang/String;
    .locals 3

    .line 103
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_0

    const/4 v0, 0x6

    .line 104
    invoke-direct {p0, v0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->getBatteryProperty(I)I

    move-result v0

    goto :goto_0

    .line 106
    :cond_0
    new-instance v0, Landroid/content/ContextWrapper;

    iget-object v1, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->applicationContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 108
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    .line 106
    invoke-virtual {v0, v2, v1}, Landroid/content/ContextWrapper;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    .line 110
    const-string v2, "status"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    .line 112
    :goto_0
    invoke-direct {p0, v0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->convertBatteryStatus(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final isHuaweiPowerSaveModeActive()Z
    .locals 3

    .line 146
    iget-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->applicationContext:Landroid/content/Context;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 145
    const-string v1, "SmartModeStatus"

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eq v0, v2, :cond_1

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 155
    :cond_1
    invoke-direct {p0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->checkPowerServiceSaveMode()Z

    move-result v0

    :goto_0
    return v0
.end method

.method private final isInPowerSaveMode()Ljava/lang/Boolean;
    .locals 3

    .line 116
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v1, "MANUFACTURER"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const-string v2, "getDefault(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "this as java.lang.String).toLowerCase(locale)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 118
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, -0x47e95e19

    if-eq v1, v2, :cond_4

    const v2, -0x2d450b45

    if-eq v1, v2, :cond_2

    const v2, 0x6f28bffa

    if-eq v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "samsung"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 121
    :cond_1
    invoke-direct {p0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->isSamsungPowerSaveModeActive()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1

    .line 118
    :cond_2
    const-string v1, "xiaomi"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    .line 119
    :cond_3
    invoke-direct {p0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->isXiaomiPowerSaveModeActive()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1

    .line 118
    :cond_4
    const-string v1, "huawei"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 122
    :goto_0
    invoke-direct {p0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->checkPowerServiceSaveMode()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_1

    .line 120
    :cond_5
    invoke-direct {p0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->isHuaweiPowerSaveModeActive()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_1
    return-object v0
.end method

.method private final isSamsungPowerSaveModeActive()Z
    .locals 2

    .line 128
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-ge v0, v1, :cond_0

    .line 130
    iget-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->applicationContext:Landroid/content/Context;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 131
    const-string v1, "psm_switch"

    .line 129
    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 138
    invoke-direct {p0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->checkPowerServiceSaveMode()Z

    move-result v0

    goto :goto_1

    .line 140
    :cond_1
    const-string v1, "1"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    :goto_1
    return v0
.end method

.method private final isXiaomiPowerSaveModeActive()Z
    .locals 3

    .line 161
    iget-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->applicationContext:Landroid/content/Context;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 160
    const-string v1, "POWER_SAVE_MODE_OPEN"

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eq v0, v2, :cond_1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 168
    :cond_1
    invoke-direct {p0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->checkPowerServiceSaveMode()Z

    move-result v1

    :goto_0
    return v1
.end method

.method private final publishBatteryStatus(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/lang/String;)V
    .locals 2

    if-eqz p2, :cond_0

    .line 206
    invoke-interface {p1, p2}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 208
    :cond_0
    const-string p2, "Charging status unavailable"

    const/4 v0, 0x0

    const-string v1, "UNAVAILABLE"

    invoke-interface {p1, v1, p2, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 3

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->applicationContext:Landroid/content/Context;

    .line 36
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v1

    const-string v2, "dev.fluttercommunity.plus/battery"

    invoke-direct {v0, v1, v2}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 37
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    const-string v1, "dev.fluttercommunity.plus/charging"

    invoke-direct {v0, p1, v1}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    .line 38
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object p1, p0

    check-cast p1, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 39
    iget-object p1, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v0, p0

    check-cast v0, Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method

.method public onCancel(Ljava/lang/Object;)V
    .locals 1

    .line 98
    iget-object p1, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->applicationContext:Landroid/content/Context;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->chargingStateChangeReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 p1, 0x0

    .line 99
    iput-object p1, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->chargingStateChangeReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 43
    iput-object p1, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->applicationContext:Landroid/content/Context;

    .line 44
    iget-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 45
    iput-object p1, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 46
    iget-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 47
    iput-object p1, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 3

    const-string p1, "events"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    invoke-direct {p0, p2}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->createChargingStateChangeReceiver(Lio/flutter/plugin/common/EventChannel$EventSink;)Landroid/content/BroadcastReceiver;

    move-result-object p1

    iput-object p1, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->chargingStateChangeReceiver:Landroid/content/BroadcastReceiver;

    .line 87
    iget-object v0, p0, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->applicationContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 90
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x4

    .line 88
    invoke-static {v0, p1, v1, v2}, Landroidx/core/content/ContextCompat;->registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 93
    :cond_0
    invoke-direct {p0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->getBatteryStatus()Ljava/lang/String;

    move-result-object p1

    .line 94
    invoke-direct {p0, p2, p1}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->publishBatteryStatus(Lio/flutter/plugin/common/EventChannel$EventSink;Ljava/lang/String;)V

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 4

    const-string v0, "call"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "result"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x4e4b013

    const/4 v2, 0x0

    const-string v3, "UNAVAILABLE"

    if-eq v0, v1, :cond_6

    const v1, -0x47b8706

    if-eq v0, v1, :cond_3

    const v1, 0x89625fe

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "isInBatterySaveMode"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    .line 72
    :cond_1
    invoke-direct {p0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->isInPowerSaveMode()Ljava/lang/Boolean;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 74
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_1

    .line 76
    :cond_2
    const-string p1, "Battery save mode not available."

    invoke-interface {p2, v3, p1, v2}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 51
    :cond_3
    const-string v0, "getBatteryState"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    goto :goto_0

    .line 63
    :cond_4
    invoke-direct {p0}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->getBatteryStatus()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 65
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_1

    .line 67
    :cond_5
    const-string p1, "Charging status not available."

    invoke-interface {p2, v3, p1, v2}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 51
    :cond_6
    const-string v0, "getBatteryLevel"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    goto :goto_0

    :cond_7
    const/4 p1, 0x4

    .line 54
    invoke-direct {p0, p1}, Ldev/fluttercommunity/plus/battery/BatteryPlusPlugin;->getBatteryProperty(I)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_8

    .line 56
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_1

    .line 58
    :cond_8
    const-string p1, "Battery level not available."

    invoke-interface {p2, v3, p1, v2}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 80
    :cond_9
    :goto_0
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    :goto_1
    return-void
.end method
