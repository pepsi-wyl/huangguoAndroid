.class public Lio/flutter/plugins/webviewflutter/PermissionRequestHostApiImpl;
.super Ljava/lang/Object;
.source "PermissionRequestHostApiImpl.java"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$PermissionRequestHostApi;


# instance fields
.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/PermissionRequestHostApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 39
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/PermissionRequestHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    return-void
.end method

.method private getPermissionRequestInstance(Ljava/lang/Long;)Landroid/webkit/PermissionRequest;
    .locals 3

    .line 53
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/PermissionRequestHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/PermissionRequest;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/PermissionRequest;

    return-object p1
.end method


# virtual methods
.method public deny(Ljava/lang/Long;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/PermissionRequestHostApiImpl;->getPermissionRequestInstance(Ljava/lang/Long;)Landroid/webkit/PermissionRequest;

    move-result-object p1

    invoke-virtual {p1}, Landroid/webkit/PermissionRequest;->deny()V

    return-void
.end method

.method public grant(Ljava/lang/Long;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 44
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/PermissionRequestHostApiImpl;->getPermissionRequestInstance(Ljava/lang/Long;)Landroid/webkit/PermissionRequest;

    move-result-object p1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/webkit/PermissionRequest;->grant([Ljava/lang/String;)V

    return-void
.end method
