.class public Lio/flutter/plugin/mouse/MouseCursorPlugin;
.super Ljava/lang/Object;
.source "MouseCursorPlugin.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugin/mouse/MouseCursorPlugin$MouseCursorViewDelegate;
    }
.end annotation


# static fields
.field private static systemCursorConstants:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mView:Lio/flutter/plugin/mouse/MouseCursorPlugin$MouseCursorViewDelegate;

.field private final mouseCursorChannel:Lio/flutter/embedding/engine/systemchannels/MouseCursorChannel;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/mouse/MouseCursorPlugin$MouseCursorViewDelegate;Lio/flutter/embedding/engine/systemchannels/MouseCursorChannel;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lio/flutter/plugin/mouse/MouseCursorPlugin;->mView:Lio/flutter/plugin/mouse/MouseCursorPlugin$MouseCursorViewDelegate;

    .line 27
    iput-object p2, p0, Lio/flutter/plugin/mouse/MouseCursorPlugin;->mouseCursorChannel:Lio/flutter/embedding/engine/systemchannels/MouseCursorChannel;

    .line 28
    new-instance p1, Lio/flutter/plugin/mouse/MouseCursorPlugin$1;

    invoke-direct {p1, p0}, Lio/flutter/plugin/mouse/MouseCursorPlugin$1;-><init>(Lio/flutter/plugin/mouse/MouseCursorPlugin;)V

    invoke-virtual {p2, p1}, Lio/flutter/embedding/engine/systemchannels/MouseCursorChannel;->setMethodHandler(Lio/flutter/embedding/engine/systemchannels/MouseCursorChannel$MouseCursorMethodHandler;)V

    return-void
.end method

.method static synthetic access$000(Lio/flutter/plugin/mouse/MouseCursorPlugin;Ljava/lang/String;)Landroid/view/PointerIcon;
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lio/flutter/plugin/mouse/MouseCursorPlugin;->resolveSystemCursor(Ljava/lang/String;)Landroid/view/PointerIcon;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lio/flutter/plugin/mouse/MouseCursorPlugin;)Lio/flutter/plugin/mouse/MouseCursorPlugin$MouseCursorViewDelegate;
    .locals 0

    .line 19
    iget-object p0, p0, Lio/flutter/plugin/mouse/MouseCursorPlugin;->mView:Lio/flutter/plugin/mouse/MouseCursorPlugin$MouseCursorViewDelegate;

    return-object p0
.end method

.method private resolveSystemCursor(Ljava/lang/String;)Landroid/view/PointerIcon;
    .locals 2

    .line 43
    sget-object v0, Lio/flutter/plugin/mouse/MouseCursorPlugin;->systemCursorConstants:Ljava/util/HashMap;

    if-nez v0, :cond_0

    .line 46
    new-instance v0, Lio/flutter/plugin/mouse/MouseCursorPlugin$2;

    invoke-direct {v0, p0}, Lio/flutter/plugin/mouse/MouseCursorPlugin$2;-><init>(Lio/flutter/plugin/mouse/MouseCursorPlugin;)V

    sput-object v0, Lio/flutter/plugin/mouse/MouseCursorPlugin;->systemCursorConstants:Ljava/util/HashMap;

    .line 89
    :cond_0
    sget-object v0, Lio/flutter/plugin/mouse/MouseCursorPlugin;->systemCursorConstants:Ljava/util/HashMap;

    const/16 v1, 0x3e8

    .line 90
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/huawei/hms/ads/identifier/d$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/HashMap;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 91
    iget-object v0, p0, Lio/flutter/plugin/mouse/MouseCursorPlugin;->mView:Lio/flutter/plugin/mouse/MouseCursorPlugin$MouseCursorViewDelegate;

    invoke-interface {v0, p1}, Lio/flutter/plugin/mouse/MouseCursorPlugin$MouseCursorViewDelegate;->getSystemPointerIcon(I)Landroid/view/PointerIcon;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 100
    iget-object v0, p0, Lio/flutter/plugin/mouse/MouseCursorPlugin;->mouseCursorChannel:Lio/flutter/embedding/engine/systemchannels/MouseCursorChannel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/embedding/engine/systemchannels/MouseCursorChannel;->setMethodHandler(Lio/flutter/embedding/engine/systemchannels/MouseCursorChannel$MouseCursorMethodHandler;)V

    return-void
.end method
