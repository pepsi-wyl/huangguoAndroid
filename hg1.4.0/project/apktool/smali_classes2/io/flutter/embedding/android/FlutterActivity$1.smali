.class Lio/flutter/embedding/android/FlutterActivity$1;
.super Ljava/lang/Object;
.source "FlutterActivity.java"

# interfaces
.implements Landroid/window/OnBackAnimationCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/embedding/android/FlutterActivity;->createOnBackInvokedCallback()Landroid/window/OnBackInvokedCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/android/FlutterActivity;


# direct methods
.method constructor <init>(Lio/flutter/embedding/android/FlutterActivity;)V
    .locals 0

    .line 697
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterActivity$1;->this$0:Lio/flutter/embedding/android/FlutterActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackCancelled()V
    .locals 1

    .line 705
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterActivity$1;->this$0:Lio/flutter/embedding/android/FlutterActivity;

    invoke-virtual {v0}, Lio/flutter/embedding/android/FlutterActivity;->cancelBackGesture()V

    return-void
.end method

.method public onBackInvoked()V
    .locals 1

    .line 700
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterActivity$1;->this$0:Lio/flutter/embedding/android/FlutterActivity;

    invoke-virtual {v0}, Lio/flutter/embedding/android/FlutterActivity;->commitBackGesture()V

    return-void
.end method

.method public onBackProgressed(Landroid/window/BackEvent;)V
    .locals 1

    .line 710
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterActivity$1;->this$0:Lio/flutter/embedding/android/FlutterActivity;

    invoke-virtual {v0, p1}, Lio/flutter/embedding/android/FlutterActivity;->updateBackGestureProgress(Landroid/window/BackEvent;)V

    return-void
.end method

.method public onBackStarted(Landroid/window/BackEvent;)V
    .locals 1

    .line 715
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterActivity$1;->this$0:Lio/flutter/embedding/android/FlutterActivity;

    invoke-virtual {v0, p1}, Lio/flutter/embedding/android/FlutterActivity;->startBackGesture(Landroid/window/BackEvent;)V

    return-void
.end method
