.class public Lcom/aaassseee/screen_brightness_android/stream_handler/BaseStreamHandler;
.super Ljava/lang/Object;
.source "BaseStreamHandler.kt"

# interfaces
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0003\u0008\u0016\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\t\u001a\u00020\n2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000cH\u0016J\u001c\u0010\r\u001a\u00020\n2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000c2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u0004H\u0016R\u001c\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/aaassseee/screen_brightness_android/stream_handler/BaseStreamHandler;",
        "Lio/flutter/plugin/common/EventChannel$StreamHandler;",
        "()V",
        "eventSink",
        "Lio/flutter/plugin/common/EventChannel$EventSink;",
        "getEventSink",
        "()Lio/flutter/plugin/common/EventChannel$EventSink;",
        "setEventSink",
        "(Lio/flutter/plugin/common/EventChannel$EventSink;)V",
        "onCancel",
        "",
        "arguments",
        "",
        "onListen",
        "events",
        "screen_brightness_android_release"
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
.field private eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getEventSink()Lio/flutter/plugin/common/EventChannel$EventSink;
    .locals 1

    .line 7
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/stream_handler/BaseStreamHandler;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-object v0
.end method

.method public onCancel(Ljava/lang/Object;)V
    .locals 0

    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/aaassseee/screen_brightness_android/stream_handler/BaseStreamHandler;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    .line 10
    iput-object p2, p0, Lcom/aaassseee/screen_brightness_android/stream_handler/BaseStreamHandler;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method

.method public final setEventSink(Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    .line 7
    iput-object p1, p0, Lcom/aaassseee/screen_brightness_android/stream_handler/BaseStreamHandler;->eventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method
