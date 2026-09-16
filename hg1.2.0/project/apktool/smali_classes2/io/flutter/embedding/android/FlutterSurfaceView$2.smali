.class Lio/flutter/embedding/android/FlutterSurfaceView$2;
.super Ljava/lang/Object;
.source "FlutterSurfaceView.java"

# interfaces
.implements Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/android/FlutterSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/android/FlutterSurfaceView;


# direct methods
.method constructor <init>(Lio/flutter/embedding/android/FlutterSurfaceView;)V
    .locals 0

    .line 84
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterSurfaceView$2;->this$0:Lio/flutter/embedding/android/FlutterSurfaceView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFlutterUiDisplayed()V
    .locals 2

    .line 87
    const-string v0, "FlutterSurfaceView"

    const-string v1, "onFlutterUiDisplayed()"

    invoke-static {v0, v1}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView$2;->this$0:Lio/flutter/embedding/android/FlutterSurfaceView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lio/flutter/embedding/android/FlutterSurfaceView;->setAlpha(F)V

    .line 91
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView$2;->this$0:Lio/flutter/embedding/android/FlutterSurfaceView;

    invoke-static {v0}, Lio/flutter/embedding/android/FlutterSurfaceView;->access$500(Lio/flutter/embedding/android/FlutterSurfaceView;)Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterSurfaceView$2;->this$0:Lio/flutter/embedding/android/FlutterSurfaceView;

    invoke-static {v0}, Lio/flutter/embedding/android/FlutterSurfaceView;->access$500(Lio/flutter/embedding/android/FlutterSurfaceView;)Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->removeIsDisplayingFlutterUiListener(Lio/flutter/embedding/engine/renderer/FlutterUiDisplayListener;)V

    :cond_0
    return-void
.end method

.method public onFlutterUiNoLongerDisplayed()V
    .locals 0

    return-void
.end method
