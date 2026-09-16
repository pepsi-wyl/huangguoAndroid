.class public Lio/flutter/plugins/webviewflutter/JavaScriptChannelFlutterApiImpl;
.super Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$JavaScriptChannelFlutterApi;
.source "JavaScriptChannelFlutterApiImpl.java"


# instance fields
.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$JavaScriptChannelFlutterApi;-><init>(Lio/flutter/plugin/common/BinaryMessenger;)V

    .line 28
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/JavaScriptChannelFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    return-void
.end method

.method private getIdentifierForJavaScriptChannel(Lio/flutter/plugins/webviewflutter/JavaScriptChannel;)J
    .locals 2

    .line 40
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/JavaScriptChannelFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 44
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 42
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Could not find identifier for JavaScriptChannel."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public postMessage(Lio/flutter/plugins/webviewflutter/JavaScriptChannel;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$JavaScriptChannelFlutterApi$Reply;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/webviewflutter/JavaScriptChannel;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$JavaScriptChannelFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/JavaScriptChannelFlutterApiImpl;->getIdentifierForJavaScriptChannel(Lio/flutter/plugins/webviewflutter/JavaScriptChannel;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-super {p0, p1, p2, p3}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$JavaScriptChannelFlutterApi;->postMessage(Ljava/lang/Long;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$JavaScriptChannelFlutterApi$Reply;)V

    return-void
.end method
