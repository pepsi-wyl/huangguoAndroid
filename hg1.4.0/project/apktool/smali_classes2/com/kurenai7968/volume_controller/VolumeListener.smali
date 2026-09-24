.class public final Lcom/kurenai7968/volume_controller/VolumeListener;
.super Ljava/lang/Object;
.source "VolumeObserve.kt"

# interfaces
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0004\n\u0002\u0010\u0006\n\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0012\u0010\r\u001a\u00020\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u0010H\u0016J\u001c\u0010\u0011\u001a\u00020\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0008\u0010\u0012\u001a\u0004\u0018\u00010\nH\u0016J\u0008\u0010\u0013\u001a\u00020\u000eH\u0002J\u0008\u0010\u0014\u001a\u00020\u0015H\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/kurenai7968/volume_controller/VolumeListener;",
        "Lio/flutter/plugin/common/EventChannel$StreamHandler;",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "VOLUME_CHANGED_ACTION",
        "",
        "audioManager",
        "Landroid/media/AudioManager;",
        "eventSink",
        "Lio/flutter/plugin/common/EventChannel$EventSink;",
        "volumeBroadcastReceiver",
        "Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;",
        "onCancel",
        "",
        "arguments",
        "",
        "onListen",
        "events",
        "registerReceiver",
        "volume",
        "",
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
.field private final VOLUME_CHANGED_ACTION:Ljava/lang/String;

.field private audioManager:Landroid/media/AudioManager;

.field private final context:Landroid/content/Context;

.field private eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

.field private volumeBroadcastReceiver:Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->context:Landroid/content/Context;

    .line 41
    const-string p1, "android.media.VOLUME_CHANGED_ACTION"

    iput-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->VOLUME_CHANGED_ACTION:Ljava/lang/String;

    return-void
.end method

.method private final registerReceiver()V
    .locals 3

    .line 61
    new-instance v0, Landroid/content/IntentFilter;

    iget-object v1, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->VOLUME_CHANGED_ACTION:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 62
    iget-object v1, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->volumeBroadcastReceiver:Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;

    if-nez v2, :cond_0

    const-string v2, "volumeBroadcastReceiver"

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v2, 0x0

    :cond_0
    check-cast v2, Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private final volume()D
    .locals 5

    .line 66
    iget-object v0, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->audioManager:Landroid/media/AudioManager;

    const/4 v1, 0x0

    const-string v2, "audioManager"

    if-nez v0, :cond_0

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    const/4 v3, 0x3

    invoke-virtual {v0, v3}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    .line 67
    iget-object v4, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->audioManager:Landroid/media/AudioManager;

    if-nez v4, :cond_1

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v1, v4

    :goto_0
    invoke-virtual {v1, v3}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v1

    int-to-double v2, v0

    int-to-double v0, v1

    div-double/2addr v2, v0

    const/16 v0, 0x2710

    int-to-double v0, v0

    mul-double v2, v2, v0

    .line 68
    invoke-static {v2, v3}, Ljava/lang/Math;->rint(D)D

    move-result-wide v2

    div-double/2addr v2, v0

    return-wide v2
.end method


# virtual methods
.method public onCancel(Ljava/lang/Object;)V
    .locals 2

    .line 56
    iget-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->context:Landroid/content/Context;

    iget-object v0, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->volumeBroadcastReceiver:Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "volumeBroadcastReceiver"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    check-cast v0, Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 57
    iput-object v1, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 2

    .line 48
    iput-object p2, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    .line 49
    iget-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->context:Landroid/content/Context;

    const-string p2, "audio"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string p2, "null cannot be cast to non-null type android.media.AudioManager"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/media/AudioManager;

    iput-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->audioManager:Landroid/media/AudioManager;

    .line 50
    new-instance p1, Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;

    iget-object p2, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-direct {p1, p2}, Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;-><init>(Lio/flutter/plugin/common/EventChannel$EventSink;)V

    iput-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->volumeBroadcastReceiver:Lcom/kurenai7968/volume_controller/VolumeBroadcastReceiver;

    .line 51
    invoke-direct {p0}, Lcom/kurenai7968/volume_controller/VolumeListener;->registerReceiver()V

    .line 52
    iget-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeListener;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/kurenai7968/volume_controller/VolumeListener;->volume()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    invoke-interface {p1, p2}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
