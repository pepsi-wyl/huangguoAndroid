.class public Lio/flutter/plugins/webviewflutter/JavaScriptChannelHostApiImpl$JavaScriptChannelCreator;
.super Ljava/lang/Object;
.source "JavaScriptChannelHostApiImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/JavaScriptChannelHostApiImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "JavaScriptChannelCreator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createJavaScriptChannel(Lio/flutter/plugins/webviewflutter/JavaScriptChannelFlutterApiImpl;Ljava/lang/String;Landroid/os/Handler;)Lio/flutter/plugins/webviewflutter/JavaScriptChannel;
    .locals 1

    .line 38
    new-instance v0, Lio/flutter/plugins/webviewflutter/JavaScriptChannel;

    invoke-direct {v0, p1, p2, p3}, Lio/flutter/plugins/webviewflutter/JavaScriptChannel;-><init>(Lio/flutter/plugins/webviewflutter/JavaScriptChannelFlutterApiImpl;Ljava/lang/String;Landroid/os/Handler;)V

    return-object v0
.end method
