.class public final Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "VolumeBroadcastReceiver.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u001a\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000cH\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;",
        "Landroid/content/BroadcastReceiver;",
        "event",
        "Lio/flutter/plugin/common/EventChannel$EventSink;",
        "audioStream",
        "Lcom/yosemiteyss/flutter_volume_controller/AudioStream;",
        "(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)V",
        "onReceive",
        "",
        "context",
        "Landroid/content/Context;",
        "intent",
        "Landroid/content/Intent;",
        "flutter_volume_controller_release"
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
.field private final audioStream:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

.field private final event:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)V
    .locals 1

    const-string v0, "audioStream"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 11
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;->event:Lio/flutter/plugin/common/EventChannel$EventSink;

    .line 10
    iput-object p2, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;->audioStream:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 14
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "android.media.EXTRA_VOLUME_STREAM_TYPE"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-eqz p2, :cond_1

    .line 15
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    :cond_1
    const-string p2, "android.media.VOLUME_CHANGED_ACTION"

    invoke-static {v0, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;->audioStream:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    invoke-virtual {p2}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result p2

    if-nez v1, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, p2, :cond_3

    .line 16
    invoke-static {p1}, Lcom/yosemiteyss/flutter_volume_controller/ExtensionsKt;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object p1

    iget-object p2, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;->audioStream:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    invoke-static {p1, p2}, Lcom/yosemiteyss/flutter_volume_controller/ExtensionsKt;->getVolume(Landroid/media/AudioManager;Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)D

    move-result-wide p1

    .line 17
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;->event:Lio/flutter/plugin/common/EventChannel$EventSink;

    if-eqz v0, :cond_3

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    :cond_3
    :goto_1
    return-void
.end method
