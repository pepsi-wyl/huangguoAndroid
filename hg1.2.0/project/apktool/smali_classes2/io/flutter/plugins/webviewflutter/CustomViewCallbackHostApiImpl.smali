.class public Lio/flutter/plugins/webviewflutter/CustomViewCallbackHostApiImpl;
.super Ljava/lang/Object;
.source "CustomViewCallbackHostApiImpl.java"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$CustomViewCallbackHostApi;


# instance fields
.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/CustomViewCallbackHostApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 35
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/CustomViewCallbackHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    return-void
.end method

.method private getCustomViewCallbackInstance(Ljava/lang/Long;)Landroid/webkit/WebChromeClient$CustomViewCallback;
    .locals 3

    .line 44
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/CustomViewCallbackHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebChromeClient$CustomViewCallback;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebChromeClient$CustomViewCallback;

    return-object p1
.end method


# virtual methods
.method public onCustomViewHidden(Ljava/lang/Long;)V
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/CustomViewCallbackHostApiImpl;->getCustomViewCallbackInstance(Ljava/lang/Long;)Landroid/webkit/WebChromeClient$CustomViewCallback;

    move-result-object p1

    invoke-interface {p1}, Landroid/webkit/WebChromeClient$CustomViewCallback;->onCustomViewHidden()V

    return-void
.end method
