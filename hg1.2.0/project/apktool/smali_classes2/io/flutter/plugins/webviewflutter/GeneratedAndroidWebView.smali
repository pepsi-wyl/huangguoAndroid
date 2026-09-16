.class public Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView;
.super Ljava/lang/Object;
.source "GeneratedAndroidWebView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FlutterError;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$HttpAuthHandlerFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$HttpAuthHandlerHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$GeolocationPermissionsCallbackFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$GeolocationPermissionsCallbackHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$CustomViewCallbackFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$CustomViewCallbackHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$PermissionRequestFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$PermissionRequestHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebStorageHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApiCodec;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FlutterAssetManagerHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$DownloadListenerFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$DownloadListenerHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientFlutterApiCodec;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewClientHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$JavaScriptChannelFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$JavaScriptChannelHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebSettingsHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApiCodec;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$CookieManagerHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$JavaObjectFlutterApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$JavaObjectHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$InstanceManagerHostApi;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$Result;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceResponseData;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;,
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 47
    instance-of v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FlutterError;

    if-eqz v1, :cond_0

    .line 48
    check-cast p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FlutterError;

    .line 49
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FlutterError;->code:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    invoke-virtual {p0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FlutterError;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    iget-object p0, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FlutterError;->details:Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Cause: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", Stacktrace: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_0
    return-object v0
.end method
