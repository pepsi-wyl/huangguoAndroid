.class public final Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/urllauncher/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WebViewOptions"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/urllauncher/Messages$WebViewOptions$Builder;
    }
.end annotation


# instance fields
.field private enableDomStorage:Ljava/lang/Boolean;

.field private enableJavaScript:Ljava/lang/Boolean;

.field private headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;"
        }
    .end annotation

    .line 148
    new-instance v0, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;

    invoke-direct {v0}, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;-><init>()V

    const/4 v1, 0x0

    .line 149
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 150
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->setEnableJavaScript(Ljava/lang/Boolean;)V

    const/4 v1, 0x1

    .line 151
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 152
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->setEnableDomStorage(Ljava/lang/Boolean;)V

    const/4 v1, 0x2

    .line 153
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 154
    check-cast p0, Ljava/util/Map;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->setHeaders(Ljava/util/Map;)V

    return-object v0
.end method


# virtual methods
.method public getEnableDomStorage()Ljava/lang/Boolean;
    .locals 1

    .line 80
    iget-object v0, p0, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->enableDomStorage:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getEnableJavaScript()Ljava/lang/Boolean;
    .locals 1

    .line 67
    iget-object v0, p0, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->enableJavaScript:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getHeaders()Ljava/util/Map;
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

    .line 93
    iget-object v0, p0, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public setEnableDomStorage(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 87
    iput-object p1, p0, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->enableDomStorage:Ljava/lang/Boolean;

    return-void

    .line 85
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"enableDomStorage\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setEnableJavaScript(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 74
    iput-object p1, p0, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->enableJavaScript:Ljava/lang/Boolean;

    return-void

    .line 72
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"enableJavaScript\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setHeaders(Ljava/util/Map;)V
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

    .line 100
    iput-object p1, p0, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->headers:Ljava/util/Map;

    return-void

    .line 98
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"headers\" is null."

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

    .line 140
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 141
    iget-object v1, p0, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->enableJavaScript:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    iget-object v1, p0, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->enableDomStorage:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    iget-object v1, p0, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->headers:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
