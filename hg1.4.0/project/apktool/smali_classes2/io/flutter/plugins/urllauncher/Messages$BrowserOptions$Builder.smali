.class public final Lio/flutter/plugins/urllauncher/Messages$BrowserOptions$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private showTitle:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;
    .locals 2

    .line 187
    new-instance v0, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;

    invoke-direct {v0}, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;-><init>()V

    .line 188
    iget-object v1, p0, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions$Builder;->showTitle:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;->setShowTitle(Ljava/lang/Boolean;)V

    return-object v0
.end method

.method public setShowTitle(Ljava/lang/Boolean;)Lio/flutter/plugins/urllauncher/Messages$BrowserOptions$Builder;
    .locals 0

    .line 182
    iput-object p1, p0, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions$Builder;->showTitle:Ljava/lang/Boolean;

    return-object p0
.end method
