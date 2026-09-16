.class public Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi;
.super Ljava/lang/Object;
.source "GeneratedAndroidWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileChooserParamsFlutterApi"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$Reply;
    }
.end annotation


# instance fields
.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 0

    .line 3282
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3283
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

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

    .line 3293
    new-instance v0, Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-direct {v0}, Lio/flutter/plugin/common/StandardMessageCodec;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$create$0(Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$Reply;Ljava/lang/Object;)V
    .locals 0

    const/4 p1, 0x0

    .line 3316
    invoke-interface {p0, p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Long;Ljava/lang/Boolean;Ljava/util/List;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$Reply;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Ljava/lang/Boolean;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 3303
    new-instance v0, Lio/flutter/plugin/common/BasicMessageChannel;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    const-string v2, "dev.flutter.pigeon.webview_flutter_android.FileChooserParamsFlutterApi.create"

    .line 3307
    invoke-static {}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    .line 3308
    new-instance v1, Ljava/util/ArrayList;

    iget p4, p4, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;->index:I

    .line 3314
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    aput-object p2, v2, p1

    const/4 p1, 0x2

    aput-object p3, v2, p1

    const/4 p1, 0x3

    aput-object p4, v2, p1

    const/4 p1, 0x4

    aput-object p5, v2, p1

    .line 3310
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance p1, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$$ExternalSyntheticLambda0;

    invoke-direct {p1, p6}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$Reply;)V

    .line 3308
    invoke-virtual {v0, v1, p1}, Lio/flutter/plugin/common/BasicMessageChannel;->send(Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    return-void
.end method
