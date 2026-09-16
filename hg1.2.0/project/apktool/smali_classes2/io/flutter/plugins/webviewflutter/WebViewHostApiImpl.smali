.class public Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;
.super Ljava/lang/Object;
.source "WebViewHostApiImpl.java"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApi;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewProxy;,
        Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewPlatformView;
    }
.end annotation


# instance fields
.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private context:Landroid/content/Context;

.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

.field private final webViewProxy:Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewProxy;


# direct methods
.method public constructor <init>(Lio/flutter/plugins/webviewflutter/InstanceManager;Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewProxy;Landroid/content/Context;)V
    .locals 0

    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 215
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 216
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 217
    iput-object p3, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->webViewProxy:Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewProxy;

    .line 218
    iput-object p4, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public addJavaScriptChannel(Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 3

    .line 390
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 391
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 392
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/flutter/plugins/webviewflutter/JavaScriptChannel;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/flutter/plugins/webviewflutter/JavaScriptChannel;

    .line 393
    iget-object v0, p2, Lio/flutter/plugins/webviewflutter/JavaScriptChannel;->javaScriptChannelName:Ljava/lang/String;

    invoke-virtual {p1, p2, v0}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public canGoBack(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 3

    .line 288
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 289
    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public canGoForward(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 3

    .line 295
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 296
    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoForward()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public clearCache(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 319
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 320
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->clearCache(Z)V

    return-void
.end method

.method public create(Ljava/lang/Long;)V
    .locals 6

    .line 232
    new-instance v0, Lio/flutter/plugins/webviewflutter/DisplayListenerProxy;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/DisplayListenerProxy;-><init>()V

    .line 233
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->context:Landroid/content/Context;

    const-string v2, "display"

    .line 234
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/DisplayManager;

    .line 235
    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/DisplayListenerProxy;->onPreWebViewInitialization(Landroid/hardware/display/DisplayManager;)V

    .line 237
    iget-object v2, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->webViewProxy:Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewProxy;

    iget-object v3, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->context:Landroid/content/Context;

    iget-object v4, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v5, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {v2, v3, v4, v5}, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewProxy;->createWebView(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewPlatformView;

    move-result-object v2

    .line 239
    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/DisplayListenerProxy;->onPostWebViewInitialization(Landroid/hardware/display/DisplayManager;)V

    .line 240
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Lio/flutter/plugins/webviewflutter/InstanceManager;->addDartCreatedInstance(Ljava/lang/Object;J)V

    return-void
.end method

.method public evaluateJavascript(Ljava/lang/Long;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$Result;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$Result<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 328
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 329
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$$ExternalSyntheticLambda0;

    invoke-direct {v0, p3}, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$Result;)V

    invoke-virtual {p1, p2, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method

.method public getInstanceManager()Lio/flutter/plugins/webviewflutter/InstanceManager;
    .locals 1

    .line 428
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    return-object v0
.end method

.method public getScrollPosition(Ljava/lang/Long;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint;
    .locals 3

    .line 368
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 369
    new-instance v0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint$Builder;-><init>()V

    .line 370
    invoke-virtual {p1}, Landroid/webkit/WebView;->getScrollX()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint$Builder;->setX(Ljava/lang/Long;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint$Builder;

    move-result-object v0

    .line 371
    invoke-virtual {p1}, Landroid/webkit/WebView;->getScrollY()I

    move-result p1

    int-to-long v1, p1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint$Builder;->setY(Ljava/lang/Long;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint$Builder;

    move-result-object p1

    .line 372
    invoke-virtual {p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint$Builder;->build()Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint;

    move-result-object p1

    return-object p1
.end method

.method public getScrollX(Ljava/lang/Long;)Ljava/lang/Long;
    .locals 3

    .line 354
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 355
    invoke-virtual {p1}, Landroid/webkit/WebView;->getScrollX()I

    move-result p1

    int-to-long v0, p1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public getScrollY(Ljava/lang/Long;)Ljava/lang/Long;
    .locals 3

    .line 361
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 362
    invoke-virtual {p1}, Landroid/webkit/WebView;->getScrollY()I

    move-result p1

    int-to-long v0, p1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public getTitle(Ljava/lang/Long;)Ljava/lang/String;
    .locals 3

    .line 335
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 336
    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getUrl(Ljava/lang/Long;)Ljava/lang/String;
    .locals 3

    .line 281
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 282
    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public goBack(Ljava/lang/Long;)V
    .locals 3

    .line 301
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 302
    invoke-virtual {p1}, Landroid/webkit/WebView;->goBack()V

    return-void
.end method

.method public goForward(Ljava/lang/Long;)V
    .locals 3

    .line 307
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 308
    invoke-virtual {p1}, Landroid/webkit/WebView;->goForward()V

    return-void
.end method

.method public loadData(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 249
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 250
    invoke-virtual {p1, p2, p3, p4}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public loadDataWithBaseUrl(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 261
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Landroid/webkit/WebView;

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    .line 262
    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public loadUrl(Ljava/lang/Long;Ljava/lang/String;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 268
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 269
    invoke-virtual {p1, p2, p3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public postUrl(Ljava/lang/Long;Ljava/lang/String;[B)V
    .locals 3

    .line 274
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 275
    invoke-virtual {p1, p2, p3}, Landroid/webkit/WebView;->postUrl(Ljava/lang/String;[B)V

    return-void
.end method

.method public reload(Ljava/lang/Long;)V
    .locals 3

    .line 313
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 314
    invoke-virtual {p1}, Landroid/webkit/WebView;->reload()V

    return-void
.end method

.method public removeJavaScriptChannel(Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 3

    .line 399
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 400
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 401
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/flutter/plugins/webviewflutter/JavaScriptChannel;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lio/flutter/plugins/webviewflutter/JavaScriptChannel;

    .line 402
    iget-object p2, p2, Lio/flutter/plugins/webviewflutter/JavaScriptChannel;->javaScriptChannelName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->removeJavascriptInterface(Ljava/lang/String;)V

    return-void
.end method

.method public scrollBy(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 3

    .line 347
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 348
    invoke-virtual {p2}, Ljava/lang/Long;->intValue()I

    move-result p2

    invoke-virtual {p3}, Ljava/lang/Long;->intValue()I

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/webkit/WebView;->scrollBy(II)V

    return-void
.end method

.method public scrollTo(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 3

    .line 341
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 342
    invoke-virtual {p2}, Ljava/lang/Long;->intValue()I

    move-result p2

    invoke-virtual {p3}, Ljava/lang/Long;->intValue()I

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/webkit/WebView;->scrollTo(II)V

    return-void
.end method

.method public setBackgroundColor(Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 3

    .line 421
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 422
    invoke-virtual {p2}, Ljava/lang/Long;->intValue()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .locals 0

    .line 227
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->context:Landroid/content/Context;

    return-void
.end method

.method public setDownloadListener(Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 3

    .line 407
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 408
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 409
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/webkit/DownloadListener;

    .line 408
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    return-void
.end method

.method public setWebChromeClient(Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 3

    .line 414
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 415
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 416
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/webkit/WebChromeClient;

    .line 415
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    return-void
.end method

.method public setWebContentsDebuggingEnabled(Ljava/lang/Boolean;)V
    .locals 1

    .line 377
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->webViewProxy:Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewProxy;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl$WebViewProxy;->setWebContentsDebuggingEnabled(Z)V

    return-void
.end method

.method public setWebViewClient(Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 3

    .line 382
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebView;

    .line 383
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/webkit/WebViewClient;

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    return-void
.end method
