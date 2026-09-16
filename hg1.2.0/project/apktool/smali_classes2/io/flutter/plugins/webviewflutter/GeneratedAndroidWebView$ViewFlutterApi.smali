.class public Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi;
.super Ljava/lang/Object;
.source "GeneratedAndroidWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewFlutterApi"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi$Reply;
    }
.end annotation


# instance fields
.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 0

    .line 3547
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3548
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    return-void
.end method

.method static getCodec()Lio/flutter/plugin/common/MessageCodec;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/flutter/plugin/common/MessageCodec<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 3558
    new-instance v0, Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-direct {v0}, Lio/flutter/plugin/common/StandardMessageCodec;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$create$0(Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi$Reply;Ljava/lang/Object;)V
    .locals 0

    const/4 p1, 0x0

    .line 3569
    invoke-interface {p0, p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi$Reply;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 3562
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    const-string v2, "dev.flutter.pigeon.webview_flutter_android.ViewFlutterApi.create"

    .line 3566
    invoke-static {}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    .line 3567
    new-instance v1, Ljava/util/ArrayList;

    .line 3568
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance p1, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi$$ExternalSyntheticLambda0;

    invoke-direct {p1, p2}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi$Reply;)V

    .line 3567
    invoke-virtual {v0, v1, p1}, Lio/flutter/plugin/common/BasicMessageChannel;->send(Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    return-void
.end method
