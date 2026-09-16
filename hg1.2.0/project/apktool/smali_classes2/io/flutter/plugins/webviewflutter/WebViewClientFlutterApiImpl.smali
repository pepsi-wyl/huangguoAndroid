.class public Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;
.super Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi;
.source "WebViewClientFlutterApiImpl.java"


# instance fields
.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

.field private final webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 1

    .line 92
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi;-><init>(Lio/flutter/plugin/common/BinaryMessenger;)V

    .line 93
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 94
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 95
    new-instance v0, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    invoke-direct {v0, p1, p2}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V

    iput-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    return-void
.end method

.method static createWebResourceErrorData(Landroid/webkit/WebResourceError;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;
    .locals 3

    .line 39
    new-instance v0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;-><init>()V

    .line 40
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/webkit/WebResourceError;)I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;->setErrorCode(Ljava/lang/Long;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;

    move-result-object v0

    .line 41
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/webkit/WebResourceError;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;->setDescription(Ljava/lang/String;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;

    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;->build()Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;

    move-result-object p0

    return-object p0
.end method

.method static createWebResourceErrorData(Landroidx/webkit/WebResourceErrorCompat;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;
    .locals 3

    .line 48
    new-instance v0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;-><init>()V

    .line 49
    invoke-virtual {p0}, Landroidx/webkit/WebResourceErrorCompat;->getErrorCode()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;->setErrorCode(Ljava/lang/Long;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;

    move-result-object v0

    .line 50
    invoke-virtual {p0}, Landroidx/webkit/WebResourceErrorCompat;->getDescription()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;->setDescription(Ljava/lang/String;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;

    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;->build()Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;

    move-result-object p0

    return-object p0
.end method

.method static createWebResourceRequestData(Landroid/webkit/WebResourceRequest;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;
    .locals 3

    .line 57
    new-instance v0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;-><init>()V

    .line 59
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->setUrl(Ljava/lang/String;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;

    move-result-object v0

    .line 60
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->setIsForMainFrame(Ljava/lang/Boolean;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;

    move-result-object v0

    .line 61
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->hasGesture()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->setHasGesture(Ljava/lang/Boolean;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;

    move-result-object v0

    .line 62
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->setMethod(Ljava/lang/String;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;

    move-result-object v0

    .line 64
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->getRequestHeaders()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 65
    invoke-interface {p0}, Landroid/webkit/WebResourceRequest;->getRequestHeaders()Ljava/util/Map;

    move-result-object v1

    goto :goto_0

    .line 66
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 63
    :goto_0
    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->setRequestHeaders(Ljava/util/Map;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;

    move-result-object v0

    .line 67
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v1, v2, :cond_1

    .line 68
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/webkit/WebResourceRequest;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->setIsRedirect(Ljava/lang/Boolean;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;

    .line 71
    :cond_1
    invoke-virtual {v0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->build()Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;

    move-result-object p0

    return-object p0
.end method

.method static createWebResourceResponseData(Landroid/webkit/WebResourceResponse;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceResponseData;
    .locals 3

    .line 77
    new-instance v0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceResponseData$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceResponseData$Builder;-><init>()V

    .line 79
    invoke-virtual {p0}, Landroid/webkit/WebResourceResponse;->getStatusCode()I

    move-result p0

    int-to-long v1, p0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceResponseData$Builder;->setStatusCode(Ljava/lang/Long;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceResponseData$Builder;

    move-result-object p0

    .line 81
    invoke-virtual {p0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceResponseData$Builder;->build()Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceResponseData;

    move-result-object p0

    return-object p0
.end method

.method private getIdentifierForClient(Landroid/webkit/WebViewClient;)J
    .locals 2

    .line 285
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 289
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 287
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Could not find identifier for WebViewClient."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic lambda$doUpdateVisitedHistory$8(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onPageFinished$1(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onPageStarted$0(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onReceivedError$5(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onReceivedHttpAuthRequest$9(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onReceivedHttpError$2(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onReceivedRequestError$3(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onReceivedRequestError$4(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$requestLoading$6(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$urlLoading$7(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method


# virtual methods
.method public doUpdateVisitedHistory(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Ljava/lang/String;ZLio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebViewClient;",
            "Landroid/webkit/WebView;",
            "Ljava/lang/String;",
            "Z",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 256
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda4;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda4;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    .line 258
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 259
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    move-object v2, p2

    check-cast v2, Ljava/lang/Long;

    .line 261
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->getIdentifierForClient(Landroid/webkit/WebViewClient;)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    move-object v0, p0

    move-object v3, p3

    move-object v5, p5

    .line 260
    invoke-virtual/range {v0 .. v5}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->doUpdateVisitedHistory(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Boolean;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebViewClient;",
            "Landroid/webkit/WebView;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 117
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda7;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda7;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    .line 119
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 120
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    .line 121
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->getIdentifierForClient(Landroid/webkit/WebViewClient;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3, p4}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onPageFinished(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebViewClient;",
            "Landroid/webkit/WebView;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda10;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda10;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    .line 106
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 107
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    .line 108
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->getIdentifierForClient(Landroid/webkit/WebViewClient;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3, p4}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onPageStarted(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebViewClient;",
            "Landroid/webkit/WebView;",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 200
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    .line 202
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 203
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    move-object v2, p2

    check-cast v2, Ljava/lang/Long;

    .line 205
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->getIdentifierForClient(Landroid/webkit/WebViewClient;)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    move-object v0, p0

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 204
    invoke-virtual/range {v0 .. v6}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onReceivedError(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onReceivedHttpAuthRequest(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebViewClient;",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/HttpAuthHandler;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 272
    new-instance v0, Lio/flutter/plugins/webviewflutter/HttpAuthHandlerFlutterApiImpl;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v2, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/HttpAuthHandlerFlutterApiImpl;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda9;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda9;-><init>()V

    .line 273
    invoke-virtual {v0, p3, v1}, Lio/flutter/plugins/webviewflutter/HttpAuthHandlerFlutterApiImpl;->create(Landroid/webkit/HttpAuthHandler;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$HttpAuthHandlerFlutterApi$Reply;)V

    .line 275
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 276
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/lang/Long;

    iget-object p1, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 277
    invoke-virtual {p1, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Ljava/lang/Long;

    iget-object p1, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 278
    invoke-virtual {p1, p3}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Ljava/lang/Long;

    move-object v0, p0

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 275
    invoke-virtual/range {v0 .. v6}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onReceivedHttpAuthRequest(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onReceivedHttpError(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebViewClient;",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/WebResourceRequest;",
            "Landroid/webkit/WebResourceResponse;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 132
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda6;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda6;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    .line 134
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v3

    .line 136
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->getIdentifierForClient(Landroid/webkit/WebViewClient;)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 138
    invoke-static {p3}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->createWebResourceRequestData(Landroid/webkit/WebResourceRequest;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;

    move-result-object v4

    .line 139
    invoke-static {p4}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->createWebResourceResponseData(Landroid/webkit/WebResourceResponse;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceResponseData;

    move-result-object v5

    move-object v1, p0

    move-object v6, p5

    .line 135
    invoke-virtual/range {v1 .. v6}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onReceivedHttpError(Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceResponseData;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onReceivedRequestError(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebViewClient;",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/WebResourceRequest;",
            "Landroid/webkit/WebResourceError;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 154
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda12;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda12;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    .line 156
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 157
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    move-object v2, p2

    check-cast v2, Ljava/lang/Long;

    .line 159
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->getIdentifierForClient(Landroid/webkit/WebViewClient;)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 161
    invoke-static {p3}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->createWebResourceRequestData(Landroid/webkit/WebResourceRequest;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;

    move-result-object v3

    .line 162
    invoke-static {p4}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->createWebResourceErrorData(Landroid/webkit/WebResourceError;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;

    move-result-object v4

    move-object v0, p0

    move-object v5, p5

    .line 158
    invoke-virtual/range {v0 .. v5}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onReceivedRequestError(Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onReceivedRequestError(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroidx/webkit/WebResourceErrorCompat;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebViewClient;",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/WebResourceRequest;",
            "Landroidx/webkit/WebResourceErrorCompat;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 177
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda11;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda11;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    .line 179
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 180
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    move-object v2, p2

    check-cast v2, Ljava/lang/Long;

    .line 182
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->getIdentifierForClient(Landroid/webkit/WebViewClient;)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 184
    invoke-static {p3}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->createWebResourceRequestData(Landroid/webkit/WebResourceRequest;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;

    move-result-object v3

    .line 185
    invoke-static {p4}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->createWebResourceErrorData(Landroidx/webkit/WebResourceErrorCompat;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;

    move-result-object v4

    move-object v0, p0

    move-object v5, p5

    .line 181
    invoke-virtual/range {v0 .. v5}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onReceivedRequestError(Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public requestLoading(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebViewClient;",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/WebResourceRequest;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 223
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda8;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda8;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    .line 225
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 226
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    .line 228
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->getIdentifierForClient(Landroid/webkit/WebViewClient;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 230
    invoke-static {p3}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->createWebResourceRequestData(Landroid/webkit/WebResourceRequest;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;

    move-result-object p3

    .line 227
    invoke-virtual {p0, p1, p2, p3, p4}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->requestLoading(Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public urlLoading(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebViewClient;",
            "Landroid/webkit/WebView;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 242
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda5;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl$$ExternalSyntheticLambda5;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    .line 244
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 245
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    .line 246
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->getIdentifierForClient(Landroid/webkit/WebViewClient;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3, p4}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->urlLoading(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method
