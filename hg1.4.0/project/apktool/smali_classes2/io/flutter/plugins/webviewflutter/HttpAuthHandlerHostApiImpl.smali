.class public Lio/flutter/plugins/webviewflutter/HttpAuthHandlerHostApiImpl;
.super Ljava/lang/Object;
.source "HttpAuthHandlerHostApiImpl.java"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$HttpAuthHandlerHostApi;


# instance fields
.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/HttpAuthHandlerHostApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 34
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/HttpAuthHandlerHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    return-void
.end method

.method private getHttpAuthHandlerInstance(Ljava/lang/Long;)Landroid/webkit/HttpAuthHandler;
    .locals 3

    .line 55
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/HttpAuthHandlerHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/HttpAuthHandler;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/HttpAuthHandler;

    return-object p1
.end method


# virtual methods
.method public cancel(Ljava/lang/Long;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/HttpAuthHandlerHostApiImpl;->getHttpAuthHandlerInstance(Ljava/lang/Long;)Landroid/webkit/HttpAuthHandler;

    move-result-object p1

    invoke-virtual {p1}, Landroid/webkit/HttpAuthHandler;->cancel()V

    return-void
.end method

.method public proceed(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/HttpAuthHandlerHostApiImpl;->getHttpAuthHandlerInstance(Ljava/lang/Long;)Landroid/webkit/HttpAuthHandler;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Landroid/webkit/HttpAuthHandler;->proceed(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public useHttpAuthUsernamePassword(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 0

    .line 40
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/HttpAuthHandlerHostApiImpl;->getHttpAuthHandlerInstance(Ljava/lang/Long;)Landroid/webkit/HttpAuthHandler;

    move-result-object p1

    invoke-virtual {p1}, Landroid/webkit/HttpAuthHandler;->useHttpAuthUsernamePassword()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
