.class public final Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;
.super Ljava/lang/Object;
.source "VolumeStreamHandler.kt"

# interfaces
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;
.implements Landroidx/lifecycle/DefaultLifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nVolumeStreamHandler.kt\nKotlin\n*S Kotlin\n*F\n+ 1 VolumeStreamHandler.kt\ncom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,66:1\n1#2:67\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u00012\u00020\u0002B0\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012!\u0010\u0005\u001a\u001d\u0012\u0013\u0012\u00110\u0007\u00a2\u0006\u000c\u0008\u0008\u0012\u0008\u0008\t\u0012\u0004\u0008\u0008(\n\u0012\u0004\u0012\u00020\u000b0\u0006\u00a2\u0006\u0002\u0010\u000cJ\u0012\u0010\u0011\u001a\u00020\u000b2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0013H\u0016J\u001c\u0010\u0014\u001a\u00020\u000b2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0016H\u0016J\u0010\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u0019H\u0016J\u0008\u0010\u001a\u001a\u00020\u000bH\u0002J\u0008\u0010\u001b\u001a\u00020\u000bH\u0002J\u000e\u0010\u001c\u001a\u00020\u000b2\u0006\u0010\u001d\u001a\u00020\u000eR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R)\u0010\u0005\u001a\u001d\u0012\u0013\u0012\u00110\u0007\u00a2\u0006\u000c\u0008\u0008\u0012\u0008\u0008\t\u0012\u0004\u0008\u0008(\n\u0012\u0004\u0012\u00020\u000b0\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;",
        "Lio/flutter/plugin/common/EventChannel$StreamHandler;",
        "Landroidx/lifecycle/DefaultLifecycleObserver;",
        "applicationContext",
        "Landroid/content/Context;",
        "onSetVolumeStream",
        "Lkotlin/Function1;",
        "",
        "Lkotlin/ParameterName;",
        "name",
        "streamType",
        "",
        "(Landroid/content/Context;Lkotlin/jvm/functions/Function1;)V",
        "observedStream",
        "Lcom/yosemiteyss/flutter_volume_controller/AudioStream;",
        "volumeBroadcastReceiver",
        "Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;",
        "onCancel",
        "arguments",
        "",
        "onListen",
        "events",
        "Lio/flutter/plugin/common/EventChannel$EventSink;",
        "onResume",
        "owner",
        "Landroidx/lifecycle/LifecycleOwner;",
        "resetActivityAudioStream",
        "resumeActivityAudioStream",
        "setActivityAudioStream",
        "audioStream",
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
.field private final applicationContext:Landroid/content/Context;

.field private observedStream:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

.field private final onSetVolumeStream:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private volumeBroadcastReceiver:Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "applicationContext"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onSetVolumeStream"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->applicationContext:Landroid/content/Context;

    .line 12
    iput-object p2, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->onSetVolumeStream:Lkotlin/jvm/functions/Function1;

    .line 14
    sget-object p1, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->MUSIC:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    iput-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->observedStream:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    return-void
.end method

.method private final resetActivityAudioStream()V
    .locals 2

    .line 59
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->onSetVolumeStream:Lkotlin/jvm/functions/Function1;

    const/high16 v1, -0x80000000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->MUSIC:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    iput-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->observedStream:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    return-void
.end method

.method private final resumeActivityAudioStream()V
    .locals 2

    .line 64
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->onSetVolumeStream:Lkotlin/jvm/functions/Function1;

    iget-object v1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->observedStream:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    invoke-virtual {v1}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onCancel(Ljava/lang/Object;)V
    .locals 1

    .line 41
    iget-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->volumeBroadcastReceiver:Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->applicationContext:Landroid/content/Context;

    check-cast p1, Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, p1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_0
    const/4 p1, 0x0

    .line 42
    iput-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->volumeBroadcastReceiver:Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;

    .line 43
    invoke-direct {p0}, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->resetActivityAudioStream()V

    return-void
.end method

.method public synthetic onCreate(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onCreate(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public synthetic onDestroy(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onDestroy(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 6

    .line 19
    :try_start_0
    const-string v0, "null cannot be cast to non-null type kotlin.collections.Map<*, *>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Ljava/util/Map;

    .line 20
    invoke-static {}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object v0

    const-string v1, "audioStream"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "null cannot be cast to non-null type kotlin.Int"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v0, v0, v1

    .line 21
    const-string v1, "emitOnStart"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "null cannot be cast to non-null type kotlin.Boolean"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    .line 23
    invoke-virtual {p0, v0}, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->setActivityAudioStream(Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)V

    .line 25
    new-instance v1, Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;

    invoke-direct {v1, p2, v0}, Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;-><init>(Lio/flutter/plugin/common/EventChannel$EventSink;Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)V

    .line 26
    iget-object v2, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->applicationContext:Landroid/content/Context;

    move-object v3, v1

    check-cast v3, Landroid/content/BroadcastReceiver;

    new-instance v4, Landroid/content/IntentFilter;

    const-string v5, "android.media.VOLUME_CHANGED_ACTION"

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 25
    iput-object v1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->volumeBroadcastReceiver:Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;

    if-eqz p1, :cond_0

    .line 30
    iget-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->applicationContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/yosemiteyss/flutter_volume_controller/ExtensionsKt;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object p1

    invoke-static {p1, v0}, Lcom/yosemiteyss/flutter_volume_controller/ExtensionsKt;->getVolume(Landroid/media/AudioManager;Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)D

    move-result-wide v0

    if-eqz p2, :cond_0

    .line 31
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    if-eqz p2, :cond_0

    .line 35
    const-string v0, "Failed to register volume listener"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    .line 34
    const-string v1, "1004"

    invoke-interface {p2, v1, v0, p1}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public synthetic onPause(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onPause(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public onResume(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 1

    const-string v0, "owner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->volumeBroadcastReceiver:Lcom/yosemiteyss/flutter_volume_controller/VolumeBroadcastReceiver;

    if-eqz v0, :cond_0

    .line 48
    invoke-direct {p0}, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->resumeActivityAudioStream()V

    .line 50
    :cond_0
    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onResume(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public synthetic onStart(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onStart(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public synthetic onStop(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/lifecycle/DefaultLifecycleObserver$-CC;->$default$onStop(Landroidx/lifecycle/DefaultLifecycleObserver;Landroidx/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public final setActivityAudioStream(Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)V
    .locals 2

    const-string v0, "audioStream"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->onSetVolumeStream:Lkotlin/jvm/functions/Function1;

    invoke-virtual {p1}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    iput-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->observedStream:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    return-void
.end method
