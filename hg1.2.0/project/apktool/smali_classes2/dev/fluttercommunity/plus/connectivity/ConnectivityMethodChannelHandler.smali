.class Ldev/fluttercommunity/plus/connectivity/ConnectivityMethodChannelHandler;
.super Ljava/lang/Object;
.source "ConnectivityMethodChannelHandler.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final connectivity:Ldev/fluttercommunity/plus/connectivity/Connectivity;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Ldev/fluttercommunity/plus/connectivity/Connectivity;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityMethodChannelHandler;->connectivity:Ldev/fluttercommunity/plus/connectivity/Connectivity;

    return-void
.end method


# virtual methods
.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    .line 31
    const-string v0, "check"

    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 32
    iget-object p1, p0, Ldev/fluttercommunity/plus/connectivity/ConnectivityMethodChannelHandler;->connectivity:Ldev/fluttercommunity/plus/connectivity/Connectivity;

    invoke-virtual {p1}, Ldev/fluttercommunity/plus/connectivity/Connectivity;->getNetworkTypes()Ljava/util/List;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 34
    :cond_0
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    :goto_0
    return-void
.end method
