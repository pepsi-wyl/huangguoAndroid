.class public final Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;
.super Ljava/lang/Object;
.source "GeneratedAndroidWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private hasGesture:Ljava/lang/Boolean;

.field private isForMainFrame:Ljava/lang/Boolean;

.field private isRedirect:Ljava/lang/Boolean;

.field private method:Ljava/lang/String;

.field private requestHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;
    .locals 2

    .line 278
    new-instance v0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;-><init>()V

    .line 279
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setUrl(Ljava/lang/String;)V

    .line 280
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->isForMainFrame:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setIsForMainFrame(Ljava/lang/Boolean;)V

    .line 281
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->isRedirect:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setIsRedirect(Ljava/lang/Boolean;)V

    .line 282
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->hasGesture:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setHasGesture(Ljava/lang/Boolean;)V

    .line 283
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setMethod(Ljava/lang/String;)V

    .line 284
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->requestHeaders:Ljava/util/Map;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setRequestHeaders(Ljava/util/Map;)V

    return-object v0
.end method

.method public setHasGesture(Ljava/lang/Boolean;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;
    .locals 0

    .line 259
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->hasGesture:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setIsForMainFrame(Ljava/lang/Boolean;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;
    .locals 0

    .line 245
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->isForMainFrame:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setIsRedirect(Ljava/lang/Boolean;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;
    .locals 0

    .line 252
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->isRedirect:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setMethod(Ljava/lang/String;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;
    .locals 0

    .line 266
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->method:Ljava/lang/String;

    return-object p0
.end method

.method public setRequestHeaders(Ljava/util/Map;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;"
        }
    .end annotation

    .line 273
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->requestHeaders:Ljava/util/Map;

    return-object p0
.end method

.method public setUrl(Ljava/lang/String;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;
    .locals 0

    .line 238
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;->url:Ljava/lang/String;

    return-object p0
.end method
