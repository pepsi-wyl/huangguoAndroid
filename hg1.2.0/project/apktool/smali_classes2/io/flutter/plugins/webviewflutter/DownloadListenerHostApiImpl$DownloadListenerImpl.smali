.class public Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerImpl;
.super Ljava/lang/Object;
.source "DownloadListenerHostApiImpl.java"

# interfaces
.implements Landroid/webkit/DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DownloadListenerImpl"
.end annotation


# instance fields
.field private final flutterApi:Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;


# direct methods
.method public constructor <init>(Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;

    return-void
.end method

.method static synthetic lambda$onDownloadStart$0(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method


# virtual methods
.method public onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 9

    .line 43
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;

    new-instance v8, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerImpl$$ExternalSyntheticLambda0;

    invoke-direct {v8}, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerImpl$$ExternalSyntheticLambda0;-><init>()V

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-wide v6, p5

    invoke-virtual/range {v0 .. v8}, Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;->onDownloadStart(Landroid/webkit/DownloadListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$DownloadListenerFlutterApi$Reply;)V

    return-void
.end method
