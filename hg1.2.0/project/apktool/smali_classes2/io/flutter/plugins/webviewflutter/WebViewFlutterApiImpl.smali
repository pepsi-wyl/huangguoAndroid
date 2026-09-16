.class public Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;
.super Ljava/lang/Object;
.source "WebViewFlutterApiImpl.java"


# instance fields
.field private api:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi;

.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 37
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 38
    new-instance p2, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi;

    invoke-direct {p2, p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi;-><init>(Lio/flutter/plugin/common/BinaryMessenger;)V

    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->api:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi;

    return-void
.end method


# virtual methods
.method public create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->containsInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 47
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->api:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {v1, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->addHostCreatedInstance(Ljava/lang/Object;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi;->create(Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    :cond_0
    return-void
.end method

.method public onScrollChanged(Landroid/webkit/WebView;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->api:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 69
    invoke-virtual {v1, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/lang/Long;

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 68
    invoke-virtual/range {v0 .. v6}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi;->onScrollChanged(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    return-void
.end method

.method setApi(Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->api:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi;

    return-void
.end method
