.class public Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewProxy;
.super Ljava/lang/Object;
.source "WebViewHostApiImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WebViewProxy"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createWebView(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewPlatformView;
    .locals 1

    .line 55
    new-instance v0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewPlatformView;

    invoke-direct {v0, p1, p2, p3}, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewPlatformView;-><init>(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V

    return-object v0
.end method

.method public setWebContentsDebuggingEnabled(Z)V
    .locals 0

    .line 64
    invoke-static {p1}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V

    return-void
.end method
