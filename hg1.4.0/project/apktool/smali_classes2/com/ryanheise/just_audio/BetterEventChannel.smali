.class public Lcom/ryanheise/just_audio/BetterEventChannel;
.super Ljava/lang/Object;
.source "BetterEventChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/EventChannel$EventSink;


# instance fields
.field private eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V
    .locals 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    invoke-direct {v0, p1, p2}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    .line 12
    new-instance p1, Lcom/ryanheise/just_audio/BetterEventChannel$1;

    invoke-direct {p1, p0}, Lcom/ryanheise/just_audio/BetterEventChannel$1;-><init>(Lcom/ryanheise/just_audio/BetterEventChannel;)V

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    return-void
.end method

.method static synthetic access$002(Lcom/ryanheise/just_audio/BetterEventChannel;Lio/flutter/plugin/common/EventChannel$EventSink;)Lio/flutter/plugin/common/EventChannel$EventSink;
    .locals 0

    .line 7
    iput-object p1, p0, Lcom/ryanheise/just_audio/BetterEventChannel;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-object p1
.end method


# virtual methods
.method public endOfStream()V
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/ryanheise/just_audio/BetterEventChannel;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->endOfStream()V

    :cond_0
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/ryanheise/just_audio/BetterEventChannel;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2, p3}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public success(Ljava/lang/Object;)V
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/ryanheise/just_audio/BetterEventChannel;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
