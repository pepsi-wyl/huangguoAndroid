.class public interface abstract Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApi;
.super Ljava/lang/Object;
.source "GeneratedAndroidWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "WebViewHostApi"
.end annotation


# virtual methods
.method public abstract addJavaScriptChannel(Ljava/lang/Long;Ljava/lang/Long;)V
.end method

.method public abstract canGoBack(Ljava/lang/Long;)Ljava/lang/Boolean;
.end method

.method public abstract canGoForward(Ljava/lang/Long;)Ljava/lang/Boolean;
.end method

.method public abstract clearCache(Ljava/lang/Long;Ljava/lang/Boolean;)V
.end method

.method public abstract create(Ljava/lang/Long;)V
.end method

.method public abstract evaluateJavascript(Ljava/lang/Long;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$Result;)V
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
.end method

.method public abstract getScrollPosition(Ljava/lang/Long;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint;
.end method

.method public abstract getScrollX(Ljava/lang/Long;)Ljava/lang/Long;
.end method

.method public abstract getScrollY(Ljava/lang/Long;)Ljava/lang/Long;
.end method

.method public abstract getTitle(Ljava/lang/Long;)Ljava/lang/String;
.end method

.method public abstract getUrl(Ljava/lang/Long;)Ljava/lang/String;
.end method

.method public abstract goBack(Ljava/lang/Long;)V
.end method

.method public abstract goForward(Ljava/lang/Long;)V
.end method

.method public abstract loadData(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract loadDataWithBaseUrl(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract loadUrl(Ljava/lang/Long;Ljava/lang/String;Ljava/util/Map;)V
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
.end method

.method public abstract postUrl(Ljava/lang/Long;Ljava/lang/String;[B)V
.end method

.method public abstract reload(Ljava/lang/Long;)V
.end method

.method public abstract removeJavaScriptChannel(Ljava/lang/Long;Ljava/lang/Long;)V
.end method

.method public abstract scrollBy(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V
.end method

.method public abstract scrollTo(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;)V
.end method

.method public abstract setBackgroundColor(Ljava/lang/Long;Ljava/lang/Long;)V
.end method

.method public abstract setDownloadListener(Ljava/lang/Long;Ljava/lang/Long;)V
.end method

.method public abstract setWebChromeClient(Ljava/lang/Long;Ljava/lang/Long;)V
.end method

.method public abstract setWebContentsDebuggingEnabled(Ljava/lang/Boolean;)V
.end method

.method public abstract setWebViewClient(Ljava/lang/Long;Ljava/lang/Long;)V
.end method
