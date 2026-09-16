.class public Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl;
.super Ljava/lang/Object;
.source "WebStorageHostApiImpl.java"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebStorageHostApi;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl$WebStorageCreator;
    }
.end annotation


# instance fields
.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

.field private final webStorageCreator:Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl$WebStorageCreator;


# direct methods
.method public constructor <init>(Lio/flutter/plugins/webviewflutter/InstanceManager;Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl$WebStorageCreator;)V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 43
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl;->webStorageCreator:Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl$WebStorageCreator;

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Long;)V
    .locals 4

    .line 48
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl;->webStorageCreator:Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl$WebStorageCreator;

    invoke-virtual {v1}, Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl$WebStorageCreator;->createWebStorage()Landroid/webkit/WebStorage;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lio/flutter/plugins/webviewflutter/InstanceManager;->addDartCreatedInstance(Ljava/lang/Object;J)V

    return-void
.end method

.method public deleteAllData(Ljava/lang/Long;)V
    .locals 3

    .line 53
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebStorage;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebStorage;

    .line 54
    invoke-virtual {p1}, Landroid/webkit/WebStorage;->deleteAllData()V

    return-void
.end method
