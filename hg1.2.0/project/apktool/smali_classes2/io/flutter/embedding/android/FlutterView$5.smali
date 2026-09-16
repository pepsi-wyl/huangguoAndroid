.class Lio/flutter/embedding/android/FlutterView$5;
.super Ljava/lang/Object;
.source "FlutterView.java"

# interfaces
.implements Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/embedding/android/FlutterView;->revertImageView(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/android/FlutterView;

.field final synthetic val$onDone:Ljava/lang/Runnable;

.field final synthetic val$renderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;


# direct methods
.method constructor <init>(Lio/flutter/embedding/android/FlutterView;Lio/flutter/embedding/engine/renderer/FlutterRenderer;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1323
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterView$5;->this$0:Lio/flutter/embedding/android/FlutterView;

    iput-object p2, p0, Lio/flutter/embedding/android/FlutterView$5;->val$renderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    iput-object p3, p0, Lio/flutter/embedding/android/FlutterView$5;->val$onDone:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFlutterUiDisplayed()V
    .locals 1

    .line 1326
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView$5;->val$renderer:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    invoke-virtual {v0, p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->removeIsDisplayingFlutterUiListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V

    .line 1327
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView$5;->val$onDone:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 1328
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView$5;->this$0:Lio/flutter/embedding/android/FlutterView;

    iget-object v0, v0, Lio/flutter/embedding/android/FlutterView;->renderSurface:Lio/flutter/embedding/engine/renderer/RenderSurface;

    instance-of v0, v0, Lio/flutter/embedding/android/FlutterImageView;

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView$5;->this$0:Lio/flutter/embedding/android/FlutterView;

    invoke-static {v0}, Lio/flutter/embedding/android/FlutterView;->access$400(Lio/flutter/embedding/android/FlutterView;)Lio/flutter/embedding/android/FlutterImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1329
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView$5;->this$0:Lio/flutter/embedding/android/FlutterView;

    invoke-static {v0}, Lio/flutter/embedding/android/FlutterView;->access$400(Lio/flutter/embedding/android/FlutterView;)Lio/flutter/embedding/android/FlutterImageView;

    move-result-object v0

    invoke-virtual {v0}, Lio/flutter/embedding/android/FlutterImageView;->detachFromRenderer()V

    .line 1330
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterView$5;->this$0:Lio/flutter/embedding/android/FlutterView;

    invoke-static {v0}, Lio/flutter/embedding/android/FlutterView;->access$500(Lio/flutter/embedding/android/FlutterView;)V

    :cond_0
    return-void
.end method

.method public onFlutterUiNoLongerDisplayed()V
    .locals 0

    return-void
.end method
