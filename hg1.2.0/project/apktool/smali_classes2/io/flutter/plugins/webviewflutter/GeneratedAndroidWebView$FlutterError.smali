.class public Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FlutterError;
.super Ljava/lang/RuntimeException;
.source "GeneratedAndroidWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FlutterError"
.end annotation


# instance fields
.field public final code:Ljava/lang/String;

.field public final details:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 38
    invoke-direct {p0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 39
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FlutterError;->code:Ljava/lang/String;

    .line 40
    iput-object p3, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FlutterError;->details:Ljava/lang/Object;

    return-void
.end method
