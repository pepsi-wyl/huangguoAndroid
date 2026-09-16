.class Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener$1;
.super Ljava/lang/Object;
.source "VirtualDisplayController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener;->onDraw()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener;


# direct methods
.method constructor <init>(Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener;)V
    .locals 0

    .line 352
    iput-object p1, p0, Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener$1;->this$0:Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 355
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener$1;->this$0:Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener;

    iget-object v0, v0, Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener$1;->this$0:Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    return-void
.end method
