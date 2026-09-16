.class Lio/flutter/view/VsyncWaiter$1;
.super Ljava/lang/Object;
.source "VsyncWaiter.java"

# interfaces
.implements Lio/flutter/embedding/engine/FlutterJNI$AsyncWaitForVsyncDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/view/VsyncWaiter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/view/VsyncWaiter;


# direct methods
.method constructor <init>(Lio/flutter/view/VsyncWaiter;)V
    .locals 0

    .line 106
    iput-object p1, p0, Lio/flutter/view/VsyncWaiter$1;->this$0:Lio/flutter/view/VsyncWaiter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private obtainFrameCallback(J)Landroid/view/Choreographer$FrameCallback;
    .locals 2

    .line 109
    iget-object v0, p0, Lio/flutter/view/VsyncWaiter$1;->this$0:Lio/flutter/view/VsyncWaiter;

    invoke-static {v0}, Lio/flutter/view/VsyncWaiter;->access$200(Lio/flutter/view/VsyncWaiter;)Lio/flutter/view/VsyncWaiter$FrameCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 110
    iget-object v0, p0, Lio/flutter/view/VsyncWaiter$1;->this$0:Lio/flutter/view/VsyncWaiter;

    invoke-static {v0}, Lio/flutter/view/VsyncWaiter;->access$200(Lio/flutter/view/VsyncWaiter;)Lio/flutter/view/VsyncWaiter$FrameCallback;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lio/flutter/view/VsyncWaiter$FrameCallback;->access$302(Lio/flutter/view/VsyncWaiter$FrameCallback;J)J

    .line 111
    iget-object p1, p0, Lio/flutter/view/VsyncWaiter$1;->this$0:Lio/flutter/view/VsyncWaiter;

    invoke-static {p1}, Lio/flutter/view/VsyncWaiter;->access$200(Lio/flutter/view/VsyncWaiter;)Lio/flutter/view/VsyncWaiter$FrameCallback;

    move-result-object p1

    .line 112
    iget-object p2, p0, Lio/flutter/view/VsyncWaiter$1;->this$0:Lio/flutter/view/VsyncWaiter;

    const/4 v0, 0x0

    invoke-static {p2, v0}, Lio/flutter/view/VsyncWaiter;->access$202(Lio/flutter/view/VsyncWaiter;Lio/flutter/view/VsyncWaiter$FrameCallback;)Lio/flutter/view/VsyncWaiter$FrameCallback;

    return-object p1

    .line 115
    :cond_0
    new-instance v0, Lio/flutter/view/VsyncWaiter$FrameCallback;

    iget-object v1, p0, Lio/flutter/view/VsyncWaiter$1;->this$0:Lio/flutter/view/VsyncWaiter;

    invoke-direct {v0, v1, p1, p2}, Lio/flutter/view/VsyncWaiter$FrameCallback;-><init>(Lio/flutter/view/VsyncWaiter;J)V

    return-object v0
.end method


# virtual methods
.method public asyncWaitForVsync(J)V
    .locals 1

    .line 120
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object v0

    invoke-direct {p0, p1, p2}, Lio/flutter/view/VsyncWaiter$1;->obtainFrameCallback(J)Landroid/view/Choreographer$FrameCallback;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    return-void
.end method
