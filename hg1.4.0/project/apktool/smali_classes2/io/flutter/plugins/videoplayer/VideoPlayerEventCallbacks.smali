.class final Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;
.super Ljava/lang/Object;
.source "VideoPlayerEventCallbacks.java"

# interfaces
.implements Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;


# instance fields
.field private final eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method private constructor <init>(Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method

.method static bindTo(Lio/flutter/plugin/common/EventChannel;)Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;
    .locals 2

    .line 21
    new-instance v0, Lio/flutter/plugins/videoplayer/QueuingEventSink;

    invoke-direct {v0}, Lio/flutter/plugins/videoplayer/QueuingEventSink;-><init>()V

    .line 22
    new-instance v1, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks$1;

    invoke-direct {v1, v0}, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks$1;-><init>(Lio/flutter/plugins/videoplayer/QueuingEventSink;)V

    invoke-virtual {p0, v1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 34
    invoke-static {v0}, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;->withSink(Lio/flutter/plugin/common/EventChannel$EventSink;)Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;

    move-result-object p0

    return-object p0
.end method

.method static withSink(Lio/flutter/plugin/common/EventChannel$EventSink;)Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;
    .locals 1

    .line 39
    new-instance v0, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;

    invoke-direct {v0, p0}, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;-><init>(Lio/flutter/plugin/common/EventChannel$EventSink;)V

    return-object v0
.end method


# virtual methods
.method public onBufferingEnd()V
    .locals 3

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 81
    const-string v1, "event"

    const-string v2, "bufferingEnd"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-interface {v1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public onBufferingStart()V
    .locals 3

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 63
    const-string v1, "event"

    const-string v2, "bufferingStart"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-interface {v1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public onBufferingUpdate(J)V
    .locals 4

    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 71
    const-string v1, "event"

    const-string v2, "bufferingUpdate"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x2

    .line 73
    new-array v1, v1, [Ljava/lang/Number;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    aput-object p1, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 74
    const-string p2, "values"

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    iget-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public onCompleted()V
    .locals 3

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 88
    const-string v1, "event"

    const-string v2, "completed"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-interface {v1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public onError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 94
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-interface {v0, p1, p2, p3}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public onInitialized(IIJI)V
    .locals 3

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 50
    const-string v1, "event"

    const-string v2, "initialized"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    const-string v1, "width"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    const-string p1, "height"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    const-string p1, "duration"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p5, :cond_0

    .line 55
    const-string p1, "rotationCorrection"

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    :cond_0
    iget-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public onIsPlayingStateUpdate(Z)V
    .locals 3

    .line 99
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 100
    const-string v1, "event"

    const-string v2, "isPlayingStateUpdate"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    const-string v1, "isPlaying"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    iget-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    return-void
.end method
