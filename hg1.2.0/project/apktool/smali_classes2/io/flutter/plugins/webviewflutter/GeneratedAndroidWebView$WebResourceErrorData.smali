.class public final Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;
.super Ljava/lang/Object;
.source "GeneratedAndroidWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WebResourceErrorData"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData$Builder;
    }
.end annotation


# instance fields
.field private description:Ljava/lang/String;

.field private errorCode:Ljava/lang/Long;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 400
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;"
        }
    .end annotation

    .line 435
    new-instance v0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;-><init>()V

    const/4 v1, 0x0

    .line 436
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    .line 440
    :cond_0
    instance-of v2, v1, Ljava/lang/Integer;

    if-eqz v2, :cond_1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v1, v1

    goto :goto_0

    :cond_1
    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    :goto_0
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 437
    :goto_1
    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;->setErrorCode(Ljava/lang/Long;)V

    const/4 v1, 0x1

    .line 441
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 442
    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;->setDescription(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 1

    .line 389
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getErrorCode()Ljava/lang/Long;
    .locals 1

    .line 376
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;->errorCode:Ljava/lang/Long;

    return-object v0
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 396
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;->description:Ljava/lang/String;

    return-void

    .line 394
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"description\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setErrorCode(Ljava/lang/Long;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 383
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;->errorCode:Ljava/lang/Long;

    return-void

    .line 381
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"errorCode\" is null."

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

    .line 428
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 429
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;->errorCode:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 430
    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebResourceErrorData;->description:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
