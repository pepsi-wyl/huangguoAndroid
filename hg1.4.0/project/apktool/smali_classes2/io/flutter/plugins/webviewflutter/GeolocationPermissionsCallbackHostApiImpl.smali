.class public Lio/flutter/plugins/webviewflutter/GeolocationPermissionsCallbackHostApiImpl;
.super Ljava/lang/Object;
.source "GeolocationPermissionsCallbackHostApiImpl.java"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$GeolocationPermissionsCallbackHostApi;


# instance fields
.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeolocationPermissionsCallbackHostApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 36
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/GeolocationPermissionsCallbackHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    return-void
.end method

.method private getGeolocationPermissionsCallbackInstance(Ljava/lang/Long;)Landroid/webkit/GeolocationPermissions$Callback;
    .locals 3

    .line 50
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/GeolocationPermissionsCallbackHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/GeolocationPermissions$Callback;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/GeolocationPermissions$Callback;

    return-object p1
.end method


# virtual methods
.method public invoke(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/GeolocationPermissionsCallbackHostApiImpl;->getGeolocationPermissionsCallbackInstance(Ljava/lang/Long;)Landroid/webkit/GeolocationPermissions$Callback;

    move-result-object p1

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    invoke-virtual {p4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p4

    invoke-interface {p1, p2, p3, p4}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    return-void
.end method
