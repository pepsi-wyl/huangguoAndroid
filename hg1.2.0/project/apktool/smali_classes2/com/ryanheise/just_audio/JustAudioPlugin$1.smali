.class Lcom/ryanheise/just_audio/JustAudioPlugin$1;
.super Ljava/lang/Object;
.source "JustAudioPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/FlutterEngine$EngineLifecycleListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ryanheise/just_audio/JustAudioPlugin;->onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ryanheise/just_audio/JustAudioPlugin;


# direct methods
.method constructor <init>(Lcom/ryanheise/just_audio/JustAudioPlugin;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/ryanheise/just_audio/JustAudioPlugin$1;->this$0:Lcom/ryanheise/just_audio/JustAudioPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEngineWillDestroy()V
    .locals 0

    return-void
.end method

.method public onPreEngineRestart()V
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/ryanheise/just_audio/JustAudioPlugin$1;->this$0:Lcom/ryanheise/just_audio/JustAudioPlugin;

    invoke-static {v0}, Lcom/ryanheise/just_audio/JustAudioPlugin;->access$000(Lcom/ryanheise/just_audio/JustAudioPlugin;)Lcom/ryanheise/just_audio/MainMethodCallHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ryanheise/just_audio/MainMethodCallHandler;->dispose()V

    return-void
.end method
