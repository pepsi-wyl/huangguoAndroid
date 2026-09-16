.class public final Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;
.super Ljava/lang/Object;
.source "GeneratedAndroidWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WebResourceRequestData"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData$Builder;
    }
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
.method constructor <init>()V
    .locals 0

    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;"
        }
    .end annotation

    .line 302
    new-instance v0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;-><init>()V

    const/4 v1, 0x0

    .line 303
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 304
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setUrl(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 305
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 306
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setIsForMainFrame(Ljava/lang/Boolean;)V

    const/4 v1, 0x2

    .line 307
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 308
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setIsRedirect(Ljava/lang/Boolean;)V

    const/4 v1, 0x3

    .line 309
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 310
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setHasGesture(Ljava/lang/Boolean;)V

    const/4 v1, 0x4

    .line 311
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 312
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setMethod(Ljava/lang/String;)V

    const/4 v1, 0x5

    .line 313
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 314
    check-cast p0, Ljava/util/Map;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->setRequestHeaders(Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public getHasGesture()Ljava/lang/Boolean;
    .locals 1

    .line 194
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->hasGesture:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIsForMainFrame()Ljava/lang/Boolean;
    .locals 1

    .line 171
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->isForMainFrame:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getIsRedirect()Ljava/lang/Boolean;
    .locals 1

    .line 184
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->isRedirect:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getMethod()Ljava/lang/String;
    .locals 1

    .line 207
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 220
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->requestHeaders:Ljava/util/Map;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 158
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->url:Ljava/lang/String;

    return-object v0
.end method

.method public setHasGesture(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 201
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->hasGesture:Ljava/lang/Boolean;

    return-void

    .line 199
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"hasGesture\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setIsForMainFrame(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 178
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->isForMainFrame:Ljava/lang/Boolean;

    return-void

    .line 176
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"isForMainFrame\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setIsRedirect(Ljava/lang/Boolean;)V
    .locals 0

    .line 188
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->isRedirect:Ljava/lang/Boolean;

    return-void
.end method

.method public setMethod(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 214
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->method:Ljava/lang/String;

    return-void

    .line 212
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"method\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setRequestHeaders(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 227
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->requestHeaders:Ljava/util/Map;

    return-void

    .line 225
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"requestHeaders\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 165
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->url:Ljava/lang/String;

    return-void

    .line 163
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"url\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method toList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 291
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 292
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 293
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->isForMainFrame:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 294
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->isRedirect:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 295
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->hasGesture:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 296
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceRequestData;->requestHeaders:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
