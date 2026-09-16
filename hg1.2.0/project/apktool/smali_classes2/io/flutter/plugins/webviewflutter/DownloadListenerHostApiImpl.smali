.class public Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl;
.super Ljava/lang/Object;
.source "DownloadListenerHostApiImpl.java"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$DownloadListenerHostApi;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerCreator;,
        Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerImpl;
    }
.end annotation


# instance fields
.field private final downloadListenerCreator:Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerCreator;

.field private final flutterApi:Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;

.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;


# direct methods
.method public constructor <init>(Lio/flutter/plugins/webviewflutter/InstanceManager;Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerCreator;Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;)V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 75
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl;->downloadListenerCreator:Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerCreator;

    .line 76
    iput-object p3, p0, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Long;)V
    .locals 4

    .line 81
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl;->downloadListenerCreator:Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerCreator;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;

    .line 82
    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerCreator;->createDownloadListener(Lio/flutter/plugins/webviewflutter/DownloadListenerFlutterApiImpl;)Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl$DownloadListenerImpl;

    move-result-object v0

    .line 83
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/DownloadListenerHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v0, v2, v3}, Lio/flutter/plugins/webviewflutter/InstanceManager;->addDartCreatedInstance(Ljava/lang/Object;J)V

    return-void
.end method
