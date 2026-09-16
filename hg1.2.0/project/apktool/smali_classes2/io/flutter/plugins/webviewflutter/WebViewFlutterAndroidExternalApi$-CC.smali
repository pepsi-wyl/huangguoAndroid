.class public final synthetic Lio/flutter/plugins/webviewflutter/WebViewFlutterAndroidExternalApi$-CC;
.super Ljava/lang/Object;
.source "WebViewFlutterAndroidExternalApi.java"


# direct methods
.method public static getWebView(Lio/flutter/embedding/engine/FlutterEngine;J)Landroid/webkit/WebView;
    .locals 1

    .line 40
    invoke-virtual {p0}, Lio/flutter/embedding/engine/FlutterEngine;->getPlugins()Lio/flutter/embedding/engine/plugins/PluginRegistry;

    move-result-object p0

    const-class v0, Lio/flutter/plugins/webviewflutter/WebViewFlutterPlugin;

    invoke-interface {p0, v0}, Lio/flutter/embedding/engine/plugins/PluginRegistry;->get(Ljava/lang/Class;)Lio/flutter/embedding/engine/plugins/FlutterPlugin;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterPlugin;

    if-eqz p0, :cond_0

    .line 42
    invoke-virtual {p0}, Lio/flutter/plugins/webviewflutter/WebViewFlutterPlugin;->getInstanceManager()Lio/flutter/plugins/webviewflutter/InstanceManager;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 43
    invoke-virtual {p0}, Lio/flutter/plugins/webviewflutter/WebViewFlutterPlugin;->getInstanceManager()Lio/flutter/plugins/webviewflutter/InstanceManager;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p0

    .line 44
    instance-of p1, p0, Landroid/webkit/WebView;

    if-eqz p1, :cond_0

    .line 45
    check-cast p0, Landroid/webkit/WebView;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method
