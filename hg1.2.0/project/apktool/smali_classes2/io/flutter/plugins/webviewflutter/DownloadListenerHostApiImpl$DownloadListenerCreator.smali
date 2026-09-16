.class public Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerCreator;
.super Ljava/lang/Object;
.source "DownloadListenerHostApiImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DownloadListenerCreator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createDownloadListener(Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;)Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerImpl;
    .locals 1

    .line 59
    new-instance v0, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerImpl;

    invoke-direct {v0, p1}, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerImpl;-><init>(Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;)V

    return-object v0
.end method
