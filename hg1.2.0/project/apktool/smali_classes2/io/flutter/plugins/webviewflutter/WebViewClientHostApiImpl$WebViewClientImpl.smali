.class public Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;
.super Landroid/webkit/WebViewClient;
.source "WebViewClientHostApiImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WebViewClientImpl"
.end annotation


# instance fields
.field private final flutterApi:Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;

.field private returnValueForShouldOverrideUrlLoading:Z


# direct methods
.method public constructor <init>(Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;)V
    .locals 1

    .line 45
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    const/4 v0, 0x0

    .line 38
    iput-boolean v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->returnValueForShouldOverrideUrlLoading:Z

    .line 46
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;

    return-void
.end method

.method static synthetic lambda$doUpdateVisitedHistory$7(Ljava/lang/Void;)V
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

.method static synthetic lambda$onReceivedError$3(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onReceivedError$4(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onReceivedHttpAuthRequest$8(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onReceivedHttpError$2(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$shouldOverrideUrlLoading$5(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$shouldOverrideUrlLoading$6(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method


# virtual methods
.method public doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V
    .locals 6

    .line 108
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;

    new-instance v5, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda8;

    invoke-direct {v5}, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda8;-><init>()V

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    invoke-virtual/range {v0 .. v5}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->doUpdateVisitedHistory(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Ljava/lang/String;ZLio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2

    .line 56
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda2;-><init>()V

    invoke-virtual {v0, p0, p1, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onPageFinished(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 51
    iget-object p3, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;

    new-instance v0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda5;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda5;-><init>()V

    invoke-virtual {p3, p0, p1, p2, v0}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onPageStarted(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 83
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;

    int-to-long v1, p2

    .line 84
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    new-instance v6, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda6;

    invoke-direct {v6}, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda6;-><init>()V

    move-object v1, p0

    move-object v2, p1

    move-object v4, p3

    move-object v5, p4

    .line 83
    invoke-virtual/range {v0 .. v6}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onReceivedError(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V
    .locals 6

    .line 72
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;

    new-instance v5, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda0;

    invoke-direct {v5}, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda0;-><init>()V

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onReceivedRequestError(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 117
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;

    new-instance v6, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda7;

    invoke-direct {v6}, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda7;-><init>()V

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v6}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onReceivedHttpAuthRequest(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V
    .locals 6

    .line 64
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;

    new-instance v5, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda4;

    invoke-direct {v5}, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda4;-><init>()V

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->onReceivedHttpError(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    return-void
.end method

.method public onUnhandledKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)V
    .locals 0

    return-void
.end method

.method public setReturnValueForShouldOverrideUrlLoading(Z)V
    .locals 0

    .line 129
    iput-boolean p1, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->returnValueForShouldOverrideUrlLoading:Z

    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z
    .locals 2

    .line 90
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda1;-><init>()V

    invoke-virtual {v0, p0, p1, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->requestLoading(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    .line 94
    invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->isForMainFrame()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->returnValueForShouldOverrideUrlLoading:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 2

    .line 101
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->flutterApi:Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {v0, p0, p1, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewClientFlutterApiImpl;->urlLoading(Landroid/webkit/WebViewClient;Landroid/webkit/WebView;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi$Reply;)V

    .line 102
    iget-boolean p1, p0, Lio/flutter/plugins/webviewflutter/WebViewClientHostApiImpl$WebViewClientImpl;->returnValueForShouldOverrideUrlLoading:Z

    return p1
.end method
