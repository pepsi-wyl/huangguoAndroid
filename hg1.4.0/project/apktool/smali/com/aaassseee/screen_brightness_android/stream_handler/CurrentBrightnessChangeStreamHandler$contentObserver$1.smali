.class public final Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler$contentObserver$1;
.super Landroid/database/ContentObserver;
.source "CurrentBrightnessChangeStreamHandler.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;-><init>(Landroid/content/Context;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler$contentObserver$1",
        "Landroid/database/ContentObserver;",
        "onChange",
        "",
        "selfChange",
        "",
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
.field final synthetic this$0:Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;


# direct methods
.method constructor <init>(Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler$contentObserver$1;->this$0:Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;

    .line 16
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1

    .line 18
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 19
    iget-object p1, p0, Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler$contentObserver$1;->this$0:Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;

    invoke-virtual {p1}, Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;->getEventSink()Lio/flutter/plugin/common/EventChannel$EventSink;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler$contentObserver$1;->this$0:Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;

    invoke-virtual {v0}, Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;->getOnChange()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
