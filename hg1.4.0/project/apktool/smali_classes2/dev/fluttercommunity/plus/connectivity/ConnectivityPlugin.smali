.class public Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;
.super Ljava/lang/Object;
.source "ConnectivityPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;


# instance fields
.field private eventChannel:Lio/flutter/plugin/common/EventChannel;

.field private methodChannel:Lio/flutter/plugin/common/MethodChannel;

.field private receiver:Ldev/fluttercommunity/plus/connectivity/ConnectivityBroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private setupChannels(Lio/flutter/plugin/common/BinaryMessenger;Landroid/content/Context;)V
    .locals 2

    .line 33
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    const-string v1, "dev.fluttercommunity.plus/connectivity"

    invoke-direct {v0, p1, v1}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 34
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    const-string v1, "dev.fluttercommunity.plus/connectivity_status"

    invoke-direct {v0, p1, v1}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    .line 35
    const-string p1, "connectivity"

    .line 36
    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    .line 38
    new-instance v0, Ldev/fluttercommunity/plus/connectivity/Connectivity;

    invoke-direct {v0, p1}, Ldev/fluttercommunity/plus/connectivity/Connectivity;-><init>(Landroid/net/ConnectivityManager;)V

    .line 40
    new-instance p1, Ldev/fluttercommunity/plus/connectivity/ConnectivityMethodChannelHandler;

    invoke-direct {p1, v0}, Ldev/fluttercommunity/plus/connectivity/ConnectivityMethodChannelHandler;-><init>(Ldev/fluttercommunity/plus/connectivity/Connectivity;)V

    .line 42
    new-instance v1, Ldev/fluttercommunity/plus/connectivity/ConnectivityBroadcastReceiver;

    invoke-direct {v1, p2, v0}, Ldev/fluttercommunity/plus/connectivity/ConnectivityBroadcastReceiver;-><init>(Landroid/content/Context;Ldev/fluttercommunity/plus/connectivity/Connectivity;)V

    iput-object v1, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->receiver:Ldev/fluttercommunity/plus/connectivity/ConnectivityBroadcastReceiver;

    .line 44
    iget-object p2, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p2, p1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 45
    iget-object p1, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    iget-object p2, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->receiver:Ldev/fluttercommunity/plus/connectivity/ConnectivityBroadcastReceiver;

    invoke-virtual {p1, p2}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    return-void
.end method

.method private teardownChannels()V
    .locals 2

    .line 49
    iget-object v0, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 50
    iget-object v0, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 51
    iget-object v0, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->receiver:Ldev/fluttercommunity/plus/connectivity/ConnectivityBroadcastReceiver;

    invoke-virtual {v0, v1}, Ldev/fluttercommunity/plus/connectivity/ConnectivityBroadcastReceiver;->onCancel(Ljava/lang/Object;)V

    .line 52
    iput-object v1, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 53
    iput-object v1, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    .line 54
    iput-object v1, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->receiver:Ldev/fluttercommunity/plus/connectivity/ConnectivityBroadcastReceiver;

    return-void
.end method


# virtual methods
.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 24
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v0

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->setupChannels(Lio/flutter/plugin/common/BinaryMessenger;Landroid/content/Context;)V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ldev/fluttercommunity/plus/connectivity/ConnectivityPlugin;->teardownChannels()V

    return-void
.end method
