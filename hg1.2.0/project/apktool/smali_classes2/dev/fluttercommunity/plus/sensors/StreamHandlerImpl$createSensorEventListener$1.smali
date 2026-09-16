.class public final Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl$createSensorEventListener$1;
.super Ljava/lang/Object;
.source "StreamHandlerImpl.kt"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->createSensorEventListener(Lio/flutter/plugin/common/EventChannel$EventSink;)Landroid/hardware/SensorEventListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nStreamHandlerImpl.kt\nKotlin\n*S Kotlin\n*F\n+ 1 StreamHandlerImpl.kt\ndev/fluttercommunity/plus/sensors/StreamHandlerImpl$createSensorEventListener$1\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,84:1\n13658#2,3:85\n*S KotlinDebug\n*F\n+ 1 StreamHandlerImpl.kt\ndev/fluttercommunity/plus/sensors/StreamHandlerImpl$createSensorEventListener$1\n*L\n72#1:85,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\u0008\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "dev/fluttercommunity/plus/sensors/StreamHandlerImpl$createSensorEventListener$1",
        "Landroid/hardware/SensorEventListener;",
        "onAccuracyChanged",
        "",
        "sensor",
        "Landroid/hardware/Sensor;",
        "accuracy",
        "",
        "onSensorChanged",
        "event",
        "Landroid/hardware/SensorEvent;",
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
.field final synthetic $events:Lio/flutter/plugin/common/EventChannel$EventSink;

.field final synthetic this$0:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;


# direct methods
.method constructor <init>(Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    iput-object p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl$createSensorEventListener$1;->this$0:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    iput-object p2, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl$createSensorEventListener$1;->$events:Lio/flutter/plugin/common/EventChannel$EventSink;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    const-string p2, "sensor"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 9

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [D

    .line 72
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    const-string v2, "values"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget v5, v1, v3

    add-int/lit8 v6, v4, 0x1

    float-to-double v7, v5

    .line 73
    aput-wide v7, v0, v4

    add-int/lit8 v3, v3, 0x1

    move v4, v6

    goto :goto_0

    .line 76
    :cond_0
    iget-object v1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl$createSensorEventListener$1;->this$0:Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;

    invoke-static {v1}, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;->access$getTimestampMicroAtBoot$p(Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl;)J

    move-result-wide v1

    iget-wide v3, p1, Landroid/hardware/SensorEvent;->timestamp:J

    const/16 v5, 0x3e8

    int-to-long v5, v5

    div-long/2addr v3, v5

    add-long/2addr v1, v3

    .line 77
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    array-length p1, p1

    long-to-double v1, v1

    aput-wide v1, v0, p1

    .line 79
    iget-object p1, p0, Ldev/fluttercommunity/plus/sensors/StreamHandlerImpl$createSensorEventListener$1;->$events:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    return-void
.end method
