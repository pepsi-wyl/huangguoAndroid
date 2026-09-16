.class public final Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/urllauncher/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BrowserOptions"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/urllauncher/Messages$BrowserOptions$Builder;
    }
.end annotation


# instance fields
.field private showTitle:Ljava/lang/Boolean;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;"
        }
    .end annotation

    .line 201
    new-instance v0, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;

    invoke-direct {v0}, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;-><init>()V

    const/4 v1, 0x0

    .line 202
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 203
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;->setShowTitle(Ljava/lang/Boolean;)V

    return-object v0
.end method


# virtual methods
.method public getShowTitle()Ljava/lang/Boolean;
    .locals 1

    .line 164
    iget-object v0, p0, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;->showTitle:Ljava/lang/Boolean;

    return-object v0
.end method

.method public setShowTitle(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 171
    iput-object p1, p0, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;->showTitle:Ljava/lang/Boolean;

    return-void

    .line 169
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"showTitle\" is null."

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

    .line 195
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 196
    iget-object v1, p0, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;->showTitle:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
