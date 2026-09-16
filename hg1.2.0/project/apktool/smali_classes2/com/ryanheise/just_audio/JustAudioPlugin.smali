.class public Lcom/ryanheise/just_audio/JustAudioPlugin;
.super Ljava/lang/Object;
.source "JustAudioPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;


# instance fields
.field private channel:Lio/flutter/plugin/common/MethodChannel;

.field private methodCallHandler:Lcom/ryanheise/just_audio/MainMethodCallHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/ryanheise/just_audio/JustAudioPlugin;)Lcom/ryanheise/just_audio/MainMethodCallHandler;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/ryanheise/just_audio/JustAudioPlugin;->methodCallHandler:Lcom/ryanheise/just_audio/MainMethodCallHandler;

    return-object p0
.end method


# virtual methods
.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 3

    .line 23
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 24
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v1

    .line 25
    new-instance v2, Lcom/ryanheise/just_audio/MainMethodCallHandler;

    invoke-direct {v2, v0, v1}, Lcom/ryanheise/just_audio/MainMethodCallHandler;-><init>(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V

    iput-object v2, p0, Lcom/ryanheise/just_audio/JustAudioPlugin;->methodCallHandler:Lcom/ryanheise/just_audio/MainMethodCallHandler;

    .line 27
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    const-string v2, "com.ryanheise.just_audio.methods"

    invoke-direct {v0, v1, v2}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ryanheise/just_audio/JustAudioPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 28
    iget-object v1, p0, Lcom/ryanheise/just_audio/JustAudioPlugin;->methodCallHandler:Lcom/ryanheise/just_audio/MainMethodCallHandler;

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 30
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getFlutterEngine()Lio/flutter/embedding/engine/FlutterEngine;

    move-result-object p1

    .line 31
    new-instance v0, Lcom/ryanheise/just_audio/JustAudioPlugin$1;

    invoke-direct {v0, p0}, Lcom/ryanheise/just_audio/JustAudioPlugin$1;-><init>(Lcom/ryanheise/just_audio/JustAudioPlugin;)V

    invoke-virtual {p1, v0}, Lio/flutter/embedding/engine/FlutterEngine;->addEngineLifecycleListener(Lio/flutter/embedding/engine/FlutterEngine$EngineLifecycleListener;)V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 45
    iget-object p1, p0, Lcom/ryanheise/just_audio/JustAudioPlugin;->methodCallHandler:Lcom/ryanheise/just_audio/MainMethodCallHandler;

    invoke-virtual {p1}, Lcom/ryanheise/just_audio/MainMethodCallHandler;->dispose()V

    const/4 p1, 0x0

    .line 46
    iput-object p1, p0, Lcom/ryanheise/just_audio/JustAudioPlugin;->methodCallHandler:Lcom/ryanheise/just_audio/MainMethodCallHandler;

    .line 48
    iget-object v0, p0, Lcom/ryanheise/just_audio/JustAudioPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method
