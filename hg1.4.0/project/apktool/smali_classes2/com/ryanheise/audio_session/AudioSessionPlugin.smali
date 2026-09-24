.class public Lcom/ryanheise/audio_session/AudioSessionPlugin;
.super Ljava/lang/Object;
.source "AudioSessionPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# static fields
.field private static configuration:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "**>;"
        }
    .end annotation
.end field

.field private static instances:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ryanheise/audio_session/AudioSessionPlugin;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private androidAudioManager:Lcom/ryanheise/audio_session/AndroidAudioManager;

.field private channel:Lio/flutter/plugin/common/MethodChannel;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/ryanheise/audio_session/AudioSessionPlugin;->instances:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private varargs invokeMethod(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 4

    .line 62
    sget-object v0, Lcom/ryanheise/audio_session/AudioSessionPlugin;->instances:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ryanheise/audio_session/AudioSessionPlugin;

    .line 63
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 64
    iget-object v1, v1, Lcom/ryanheise/audio_session/AudioSessionPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {v1, p1, v2}, Lio/flutter/plugin/common/MethodChannel;->invokeMethod(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 3

    .line 25
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v0

    .line 26
    new-instance v1, Lio/flutter/plugin/common/MethodChannel;

    const-string v2, "com.ryanheise.audio_session"

    invoke-direct {v1, v0, v2}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/ryanheise/audio_session/AudioSessionPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 27
    invoke-virtual {v1, p0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 28
    new-instance v1, Lcom/ryanheise/audio_session/AndroidAudioManager;

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;-><init>(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V

    iput-object v1, p0, Lcom/ryanheise/audio_session/AudioSessionPlugin;->androidAudioManager:Lcom/ryanheise/audio_session/AndroidAudioManager;

    .line 29
    sget-object p1, Lcom/ryanheise/audio_session/AudioSessionPlugin;->instances:Ljava/util/List;

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 34
    iget-object p1, p0, Lcom/ryanheise/audio_session/AudioSessionPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 35
    iput-object v0, p0, Lcom/ryanheise/audio_session/AudioSessionPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 36
    iget-object p1, p0, Lcom/ryanheise/audio_session/AudioSessionPlugin;->androidAudioManager:Lcom/ryanheise/audio_session/AndroidAudioManager;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager;->dispose()V

    .line 37
    iput-object v0, p0, Lcom/ryanheise/audio_session/AudioSessionPlugin;->androidAudioManager:Lcom/ryanheise/audio_session/AndroidAudioManager;

    .line 38
    sget-object p1, Lcom/ryanheise/audio_session/AudioSessionPlugin;->instances:Ljava/util/List;

    invoke-interface {p1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    .line 43
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    .line 44
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    const-string v1, "setConfiguration"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v0, "getConfiguration"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 56
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    goto :goto_0

    .line 52
    :cond_0
    sget-object p1, Lcom/ryanheise/audio_session/AudioSessionPlugin;->configuration:Ljava/util/Map;

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 46
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    sput-object v0, Lcom/ryanheise/audio_session/AudioSessionPlugin;->configuration:Ljava/util/Map;

    const/4 v0, 0x0

    .line 47
    invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    const/4 p2, 0x1

    .line 48
    new-array p2, p2, [Ljava/lang/Object;

    sget-object v0, Lcom/ryanheise/audio_session/AudioSessionPlugin;->configuration:Ljava/util/Map;

    aput-object v0, p2, p1

    const-string p1, "onConfigurationChanged"

    invoke-direct {p0, p1, p2}, Lcom/ryanheise/audio_session/AudioSessionPlugin;->invokeMethod(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
