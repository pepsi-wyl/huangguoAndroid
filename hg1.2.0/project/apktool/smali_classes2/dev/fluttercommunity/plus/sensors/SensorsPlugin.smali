.class public final Ldev/fluttercommunity/plus/sensors/SensorsPlugin;
.super Ljava/lang/Object;
.source "SensorsPlugin.kt"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ldev/fluttercommunity/plus/sensors/SensorsPlugin$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001eB\u0005\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0016J\u0010\u0010\u0015\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0016J\u0018\u0010\u0016\u001a\u00020\u00122\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J\u0010\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J\u0008\u0010\u001c\u001a\u00020\u0012H\u0002J\u0008\u0010\u001d\u001a\u00020\u0012H\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001f"
    }
    d2 = {
        "Ldev/fluttercommunity/plus/sensors/SensorsPlugin;",
        "Lio/flutter/embedding/engine/plugins/FlutterPlugin;",
        "()V",
        "accelerometerChannel",
        "Lio/flutter/plugin/common/EventChannel;",
        "accelerometerStreamHandler",
        "Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;",
        "barometerChannel",
        "barometerStreamHandler",
        "gyroscopeChannel",
        "gyroscopeStreamHandler",
        "magnetometerChannel",
        "magnetometerStreamHandler",
        "methodChannel",
        "Lio/flutter/plugin/common/MethodChannel;",
        "userAccelChannel",
        "userAccelStreamHandler",
        "onAttachedToEngine",
        "",
        "binding",
        "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;",
        "onDetachedFromEngine",
        "setupEventChannels",
        "context",
        "Landroid/content/Context;",
        "messenger",
        "Lio/flutter/plugin/common/BinaryMessenger;",
        "setupMethodChannel",
        "teardownEventChannels",
        "teardownMethodChannel",
        "Companion",
        "sensors_plus_release"
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
.field private static final ACCELEROMETER_CHANNEL_NAME:Ljava/lang/String; = "dev.fluttercommunity.plus/sensors/accelerometer"

.field private static final BAROMETER_CHANNEL_NAME:Ljava/lang/String; = "dev.fluttercommunity.plus/sensors/barometer"

.field public static final Companion:Ldev/fluttercommunity/plus/sensors/SensorsPlugin$Companion;

.field private static final GYROSCOPE_CHANNEL_NAME:Ljava/lang/String; = "dev.fluttercommunity.plus/sensors/gyroscope"

.field private static final MAGNETOMETER_CHANNEL_NAME:Ljava/lang/String; = "dev.fluttercommunity.plus/sensors/magnetometer"

.field private static final METHOD_CHANNEL_NAME:Ljava/lang/String; = "dev.fluttercommunity.plus/sensors/method"

.field private static final USER_ACCELEROMETER_CHANNEL_NAME:Ljava/lang/String; = "dev.fluttercommunity.plus/sensors/user_accel"


# instance fields
.field private accelerometerChannel:Lio/flutter/plugin/common/EventChannel;

.field private accelerometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

.field private barometerChannel:Lio/flutter/plugin/common/EventChannel;

.field private barometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

.field private gyroscopeChannel:Lio/flutter/plugin/common/EventChannel;

.field private gyroscopeStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

.field private magnetometerChannel:Lio/flutter/plugin/common/EventChannel;

.field private magnetometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

.field private methodChannel:Lio/flutter/plugin/common/MethodChannel;

.field private userAccelChannel:Lio/flutter/plugin/common/EventChannel;

.field private userAccelStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;


# direct methods
.method public static synthetic $r8$lambda$aPjCsW5h3K3KjybVa3VvR48oObE(Ldev/fluttercommunity/plus/sensors/SensorsPlugin;Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0

    invoke-static {p0, p1, p2}, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->setupMethodChannel$lambda$0(Ldev/fluttercommunity/plus/sensors/SensorsPlugin;Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ldev/fluttercommunity/plus/sensors/SensorsPlugin$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->Companion:Ldev/fluttercommunity/plus/sensors/SensorsPlugin$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final setupEventChannels(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 3

    .line 63
    const-string v0, "sensor"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type android.hardware.SensorManager"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/hardware/SensorManager;

    .line 65
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    const-string v1, "dev.fluttercommunity.plus/sensors/accelerometer"

    invoke-direct {v0, p2, v1}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->accelerometerChannel:Lio/flutter/plugin/common/EventChannel;

    .line 66
    new-instance v0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;-><init>(Landroid/hardware/SensorManager;I)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->accelerometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    .line 70
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->accelerometerChannel:Lio/flutter/plugin/common/EventChannel;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "accelerometerChannel"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    iget-object v2, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->accelerometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez v2, :cond_1

    const-string v2, "accelerometerStreamHandler"

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v1

    :cond_1
    check-cast v2, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 72
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    const-string v2, "dev.fluttercommunity.plus/sensors/user_accel"

    invoke-direct {v0, p2, v2}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->userAccelChannel:Lio/flutter/plugin/common/EventChannel;

    .line 73
    new-instance v0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    const/16 v2, 0xa

    invoke-direct {v0, p1, v2}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;-><init>(Landroid/hardware/SensorManager;I)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->userAccelStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    .line 77
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->userAccelChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez v0, :cond_2

    const-string v0, "userAccelChannel"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_2
    iget-object v2, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->userAccelStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez v2, :cond_3

    const-string v2, "userAccelStreamHandler"

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v1

    :cond_3
    check-cast v2, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 79
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    const-string v2, "dev.fluttercommunity.plus/sensors/gyroscope"

    invoke-direct {v0, p2, v2}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->gyroscopeChannel:Lio/flutter/plugin/common/EventChannel;

    .line 80
    new-instance v0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    const/4 v2, 0x4

    invoke-direct {v0, p1, v2}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;-><init>(Landroid/hardware/SensorManager;I)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->gyroscopeStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    .line 84
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->gyroscopeChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez v0, :cond_4

    const-string v0, "gyroscopeChannel"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_4
    iget-object v2, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->gyroscopeStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez v2, :cond_5

    const-string v2, "gyroscopeStreamHandler"

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v1

    :cond_5
    check-cast v2, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 86
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    const-string v2, "dev.fluttercommunity.plus/sensors/magnetometer"

    invoke-direct {v0, p2, v2}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->magnetometerChannel:Lio/flutter/plugin/common/EventChannel;

    .line 87
    new-instance v0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    const/4 v2, 0x2

    invoke-direct {v0, p1, v2}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;-><init>(Landroid/hardware/SensorManager;I)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->magnetometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    .line 91
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->magnetometerChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez v0, :cond_6

    const-string v0, "magnetometerChannel"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_6
    iget-object v2, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->magnetometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez v2, :cond_7

    const-string v2, "magnetometerStreamHandler"

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v1

    :cond_7
    check-cast v2, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    invoke-virtual {v0, v2}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 93
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    const-string v2, "dev.fluttercommunity.plus/sensors/barometer"

    invoke-direct {v0, p2, v2}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->barometerChannel:Lio/flutter/plugin/common/EventChannel;

    .line 94
    new-instance p2, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    const/4 v0, 0x6

    invoke-direct {p2, p1, v0}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;-><init>(Landroid/hardware/SensorManager;I)V

    iput-object p2, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->barometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    .line 98
    iget-object p1, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->barometerChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez p1, :cond_8

    const-string p1, "barometerChannel"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v1

    :cond_8
    iget-object p2, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->barometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez p2, :cond_9

    const-string p2, "barometerStreamHandler"

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_9
    move-object v1, p2

    :goto_0
    check-cast v1, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    invoke-virtual {p1, v1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    return-void
.end method

.method private final setupMethodChannel(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 2

    .line 39
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    const-string v1, "dev.fluttercommunity.plus/sensors/method"

    invoke-direct {v0, p1, v1}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 40
    new-instance p1, Ldev/fluttercommunity/plus/sensors/SensorsPlugin$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Ldev/fluttercommunity/plus/sensors/SensorsPlugin$$ExternalSyntheticLambda0;-><init>(Ldev/fluttercommunity/plus/sensors/SensorsPlugin;)V

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method

.method private static final setupMethodChannel$lambda$0(Ldev/fluttercommunity/plus/sensors/SensorsPlugin;Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "call"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "result"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v2, "setBarometerSamplingPeriod"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 46
    :cond_0
    iget-object p0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->barometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez p0, :cond_6

    const-string p0, "barometerStreamHandler"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    .line 41
    :sswitch_1
    const-string v2, "setGyroscopeSamplingPeriod"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 44
    :cond_1
    iget-object p0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->gyroscopeStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez p0, :cond_6

    const-string p0, "gyroscopeStreamHandler"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    .line 41
    :sswitch_2
    const-string v2, "setUserAccelerometerSamplingPeriod"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 43
    :cond_2
    iget-object p0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->userAccelStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez p0, :cond_6

    const-string p0, "userAccelStreamHandler"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    .line 41
    :sswitch_3
    const-string v2, "setMagnetometerSamplingPeriod"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    .line 45
    :cond_3
    iget-object p0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->magnetometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez p0, :cond_6

    const-string p0, "magnetometerStreamHandler"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    .line 41
    :sswitch_4
    const-string v2, "setAccelerationSamplingPeriod"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    .line 42
    :cond_4
    iget-object p0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->accelerometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez p0, :cond_6

    const-string p0, "accelerometerStreamHandler"

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    :cond_5
    :goto_0
    move-object p0, v1

    :cond_6
    if-nez p0, :cond_7

    goto :goto_1

    .line 49
    :cond_7
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    const-string v0, "null cannot be cast to non-null type kotlin.Int"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->setSamplingPeriod(I)V

    :goto_1
    if-eqz p0, :cond_8

    .line 51
    invoke-interface {p2, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_2

    .line 53
    :cond_8
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    :goto_2
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x683794d6 -> :sswitch_4
        -0x47c307f2 -> :sswitch_3
        -0x1f1a2cd6 -> :sswitch_2
        0x4399422b -> :sswitch_1
        0x5d6e7173 -> :sswitch_0
    .end sparse-switch
.end method

.method private final teardownEventChannels()V
    .locals 2

    .line 102
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->accelerometerChannel:Lio/flutter/plugin/common/EventChannel;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "accelerometerChannel"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 103
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->userAccelChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez v0, :cond_1

    const-string v0, "userAccelChannel"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_1
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 104
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->gyroscopeChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez v0, :cond_2

    const-string v0, "gyroscopeChannel"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_2
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 105
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->magnetometerChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez v0, :cond_3

    const-string v0, "magnetometerChannel"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_3
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 106
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->barometerChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez v0, :cond_4

    const-string v0, "barometerChannel"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_4
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 108
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->accelerometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez v0, :cond_5

    const-string v0, "accelerometerStreamHandler"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_5
    invoke-virtual {v0, v1}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->onCancel(Ljava/lang/Object;)V

    .line 109
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->userAccelStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez v0, :cond_6

    const-string v0, "userAccelStreamHandler"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_6
    invoke-virtual {v0, v1}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->onCancel(Ljava/lang/Object;)V

    .line 110
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->gyroscopeStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez v0, :cond_7

    const-string v0, "gyroscopeStreamHandler"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_7
    invoke-virtual {v0, v1}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->onCancel(Ljava/lang/Object;)V

    .line 111
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->magnetometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez v0, :cond_8

    const-string v0, "magnetometerStreamHandler"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_8
    invoke-virtual {v0, v1}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->onCancel(Ljava/lang/Object;)V

    .line 112
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->barometerStreamHandler:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    if-nez v0, :cond_9

    const-string v0, "barometerStreamHandler"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_9
    invoke-virtual {v0, v1}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->onCancel(Ljava/lang/Object;)V

    return-void
.end method

.method private final teardownMethodChannel()V
    .locals 2

    .line 59
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "methodChannel"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method


# virtual methods
.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 3

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v0

    const-string v1, "getBinaryMessenger(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->setupMethodChannel(Lio/flutter/plugin/common/BinaryMessenger;)V

    .line 30
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "getApplicationContext(...)"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, v0, p1}, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->setupEventChannels(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    invoke-direct {p0}, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->teardownMethodChannel()V

    .line 35
    invoke-direct {p0}, Ldev/fluttercommunity/plus/sensors/SensorsPlugin;->teardownEventChannels()V

    return-void
.end method
