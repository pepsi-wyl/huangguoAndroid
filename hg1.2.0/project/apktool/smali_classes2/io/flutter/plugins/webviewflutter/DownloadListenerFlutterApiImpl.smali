.class public Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;
.super Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$DownloadListenerFlutterApi;
.source "DownloadListenerFlutterApiImpl.java"


# instance fields
.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$DownloadListenerFlutterApi;-><init>(Lio/flutter/plugin/common/BinaryMessenger;)V

    .line 29
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    return-void
.end method

.method private getIdentifierForListener(Landroid/webkit/DownloadListener;)J
    .locals 2

    .line 52
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 56
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 54
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Could not find identifier for DownloadListener."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public onDownloadStart(Landroid/webkit/DownloadListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$DownloadListenerFlutterApi$Reply;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/DownloadListener;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$DownloadListenerFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 42
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;->getIdentifierForListener(Landroid/webkit/DownloadListener;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 47
    invoke-static/range {p6 .. p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    move-object v2, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object/from16 v9, p8

    .line 41
    invoke-virtual/range {v2 .. v9}, Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;->onDownloadStart(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$DownloadListenerFlutterApi$Reply;)V

    return-void
.end method
