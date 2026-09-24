.class public final Lcom/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1;
.super Ljava/lang/Object;
.source "AnalyticsSdkPlugin.kt"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->startProximityEvents(Lio/flutter/plugin/common/EventChannel$EventSink;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001a\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\u0008\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "com/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1",
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
        "analytics_sdk_release"
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
.field final synthetic $sensor:Landroid/hardware/Sensor;

.field final synthetic this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;


# direct methods
.method public static synthetic $r8$lambda$Ki2V2PkcuFjbPrJRMo73-BXuzcI(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Z)V
    .locals 0

    invoke-static {p0, p1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1;->onSensorChanged$lambda$0(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Z)V

    return-void
.end method

.method constructor <init>(Landroid/hardware/Sensor;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)V
    .locals 0

    iput-object p1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1;->$sensor:Landroid/hardware/Sensor;

    iput-object p2, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1;->this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;

    .line 443
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final onSensorChanged$lambda$0(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Z)V
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 448
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->access$getProximityEventSink$p(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)Lio/flutter/plugin/common/EventChannel$EventSink;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 3

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 445
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    const-string v0, "values"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1}, Lkotlin/collections/ArraysKt;->firstOrNull([F)Ljava/lang/Float;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    .line 446
    iget-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1;->$sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v0

    cmpg-float p1, p1, v0

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 447
    :goto_0
    iget-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1;->this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;

    invoke-static {v0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->access$getMainHandler$p(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1;->this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;

    new-instance v2, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1, p1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1$$ExternalSyntheticLambda0;-><init>(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Z)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method
