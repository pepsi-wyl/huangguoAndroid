.class public final Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;
.super Ljava/lang/Object;
.source "StreamHandlerImpl.kt"

# interfaces
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0008\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u0013\u001a\u00020\u00102\u0006\u0010\u0014\u001a\u00020\u0015H\u0002J\u0010\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0004\u001a\u00020\u0005H\u0002J\u0012\u0010\u0018\u001a\u00020\u00192\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u001bH\u0016J\u001a\u0010\u001c\u001a\u00020\u00192\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u001b2\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0008\u0010\u001d\u001a\u00020\u0019H\u0002R$\u0010\u0008\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u0005@FX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001e"
    }
    d2 = {
        "Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;",
        "Lio/flutter/plugin/common/EventChannel$StreamHandler;",
        "sensorManager",
        "Landroid/hardware/SensorManager;",
        "sensorType",
        "",
        "(Landroid/hardware/SensorManager;I)V",
        "value",
        "samplingPeriod",
        "getSamplingPeriod",
        "()I",
        "setSamplingPeriod",
        "(I)V",
        "sensor",
        "Landroid/hardware/Sensor;",
        "sensorEventListener",
        "Landroid/hardware/SensorEventListener;",
        "timestampMicroAtBoot",
        "",
        "createSensorEventListener",
        "events",
        "Lio/flutter/plugin/common/EventChannel$EventSink;",
        "getSensorName",
        "",
        "onCancel",
        "",
        "arguments",
        "",
        "onListen",
        "updateRegistration",
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


# instance fields
.field private samplingPeriod:I

.field private sensor:Landroid/hardware/Sensor;

.field private sensorEventListener:Landroid/hardware/SensorEventListener;

.field private final sensorManager:Landroid/hardware/SensorManager;

.field private final sensorType:I

.field private timestampMicroAtBoot:J


# direct methods
.method public constructor <init>(Landroid/hardware/SensorManager;I)V
    .locals 4

    const-string v0, "sensorManager"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorManager:Landroid/hardware/SensorManager;

    .line 13
    iput p2, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorType:I

    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    const/16 v0, 0x3e8

    int-to-long v0, v0

    mul-long p1, p1, v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v2

    div-long/2addr v2, v0

    sub-long/2addr p1, v2

    iput-wide p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->timestampMicroAtBoot:J

    const p1, 0x30d40

    .line 21
    iput p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->samplingPeriod:I

    return-void
.end method

.method public static final synthetic access$getTimestampMicroAtBoot$p(Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;)J
    .locals 2

    .line 11
    iget-wide v0, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->timestampMicroAtBoot:J

    return-wide v0
.end method

.method private final createSensorEventListener(Lio/flutter/plugin/common/EventChannel$EventSink;)Landroid/hardware/SensorEventListener;
    .locals 1

    .line 67
    new-instance v0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl$createSensorEventListener$1;

    invoke-direct {v0, p0, p1}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl$createSensorEventListener$1;-><init>(Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;Lio/flutter/plugin/common/EventChannel$EventSink;)V

    check-cast v0, Landroid/hardware/SensorEventListener;

    return-object v0
.end method

.method private final getSensorName(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x4

    if-eq p1, v0, :cond_2

    const/4 v0, 0x6

    if-eq p1, v0, :cond_1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_0

    .line 62
    const-string p1, "Undefined"

    goto :goto_0

    .line 58
    :cond_0
    const-string p1, "User Accelerometer"

    goto :goto_0

    .line 61
    :cond_1
    const-string p1, "Barometer"

    goto :goto_0

    .line 59
    :cond_2
    const-string p1, "Gyroscope"

    goto :goto_0

    .line 60
    :cond_3
    const-string p1, "Magnetometer"

    goto :goto_0

    .line 57
    :cond_4
    const-string p1, "Accelerometer"

    :goto_0
    return-object p1
.end method

.method private final updateRegistration()V
    .locals 4

    .line 49
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorEventListener:Landroid/hardware/SensorEventListener;

    if-eqz v0, :cond_0

    .line 50
    iget-object v1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 51
    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorEventListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensor:Landroid/hardware/Sensor;

    iget v3, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->samplingPeriod:I

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    :cond_0
    return-void
.end method


# virtual methods
.method public final getSamplingPeriod()I
    .locals 1

    .line 21
    iget v0, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->samplingPeriod:I

    return v0
.end method

.method public onCancel(Ljava/lang/Object;)V
    .locals 1

    .line 42
    iget-object p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensor:Landroid/hardware/Sensor;

    if-eqz p1, :cond_0

    .line 43
    iget-object p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorEventListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    const/4 p1, 0x0

    .line 44
    iput-object p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorEventListener:Landroid/hardware/SensorEventListener;

    :cond_0
    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 2

    const-string p1, "events"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    iget-object p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorManager:Landroid/hardware/SensorManager;

    iget v0, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorType:I

    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensor:Landroid/hardware/Sensor;

    if-eqz p1, :cond_0

    .line 30
    invoke-direct {p0, p2}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->createSensorEventListener(Lio/flutter/plugin/common/EventChannel$EventSink;)Landroid/hardware/SensorEventListener;

    move-result-object p1

    iput-object p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorEventListener:Landroid/hardware/SensorEventListener;

    .line 31
    iget-object p2, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v0, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensor:Landroid/hardware/Sensor;

    iget v1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->samplingPeriod:I

    invoke-virtual {p2, p1, v0, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    goto :goto_0

    .line 36
    :cond_0
    iget p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->sensorType:I

    invoke-direct {p0, p1}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->getSensorName(I)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "It seems that your device has no "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " sensor"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 33
    const-string v0, "NO_SENSOR"

    const-string v1, "Sensor not found"

    invoke-interface {p2, v0, v1, p1}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public final setSamplingPeriod(I)V
    .locals 0

    .line 23
    iput p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->samplingPeriod:I

    .line 24
    invoke-direct {p0}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->updateRegistration()V

    return-void
.end method
