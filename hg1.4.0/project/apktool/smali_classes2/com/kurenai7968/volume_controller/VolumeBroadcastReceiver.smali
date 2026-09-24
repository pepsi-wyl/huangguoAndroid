.class public final Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "VolumeObserve.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0002\u0010\u0004J\u001a\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0011H\u0016R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;",
        "Landroid/content/BroadcastReceiver;",
        "events",
        "Lio/flutter/plugin/common/EventChannel$EventSink;",
        "(Lio/flutter/plugin/common/EventChannel$EventSink;)V",
        "audioManager",
        "Landroid/media/AudioManager;",
        "currentVolume",
        "",
        "maxVolume",
        "volumePercentage",
        "",
        "onReceive",
        "",
        "context",
        "Landroid/content/Context;",
        "intent",
        "Landroid/content/Intent;",
        "volume_controller_release"
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
.field private audioManager:Landroid/media/AudioManager;

.field private currentVolume:I

.field private final events:Lio/flutter/plugin/common/EventChannel$EventSink;

.field private maxVolume:I

.field private volumePercentage:D


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    .line 72
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    iput-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;->events:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    const-string p2, "context"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    const-string p2, "audio"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string p2, "null cannot be cast to non-null type android.media.AudioManager"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/media/AudioManager;

    iput-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;->audioManager:Landroid/media/AudioManager;

    const/4 p2, 0x0

    .line 79
    const-string v0, "audioManager"

    if-nez p1, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, p2

    :cond_0
    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result p1

    iput p1, p0, Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;->currentVolume:I

    .line 80
    iget-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;->audioManager:Landroid/media/AudioManager;

    if-nez p1, :cond_1

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object p2, p1

    :goto_0
    invoke-virtual {p2, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result p1

    iput p1, p0, Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;->maxVolume:I

    .line 81
    iget p2, p0, Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;->currentVolume:I

    int-to-double v0, p2

    int-to-double p1, p1

    div-double/2addr v0, p1

    const/16 p1, 0x2710

    int-to-double p1, p1

    mul-double v0, v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->rint(D)D

    move-result-wide v0

    div-double/2addr v0, p1

    iput-wide v0, p0, Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;->volumePercentage:D

    .line 82
    iget-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;->events:Lio/flutter/plugin/common/EventChannel$EventSink;

    if-eqz p1, :cond_2

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    invoke-interface {p1, p2}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method
