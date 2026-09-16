.class public Lio/flutter/plugins/webviewflutter/JavaObjectHostApiImpl;
.super Ljava/lang/Object;
.source "JavaObjectHostApiImpl.java"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$JavaObjectHostApi;


# instance fields
.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;


# direct methods
.method public constructor <init>(Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/JavaObjectHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    return-void
.end method


# virtual methods
.method public dispose(Ljava/lang/Long;)V
    .locals 3

    .line 30
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/JavaObjectHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object v0

    .line 31
    instance-of v1, v0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewPlatformView;

    if-eqz v1, :cond_0

    .line 32
    check-cast v0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewPlatformView;

    invoke-virtual {v0}, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewPlatformView;->destroy()V

    .line 34
    :cond_0
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/JavaObjectHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->remove(J)Ljava/lang/Object;

    return-void
.end method
