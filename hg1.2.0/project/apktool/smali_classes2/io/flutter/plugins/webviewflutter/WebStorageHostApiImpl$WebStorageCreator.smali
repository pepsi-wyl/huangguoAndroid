.class public Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl$WebStorageCreator;
.super Ljava/lang/Object;
.source "WebStorageHostApiImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/WebStorageHostApiImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WebStorageCreator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createWebStorage()Landroid/webkit/WebStorage;
    .locals 1

    .line 30
    invoke-static {}, Landroid/webkit/WebStorage;->getInstance()Landroid/webkit/WebStorage;

    move-result-object v0

    return-object v0
.end method
