.class Lio/flutter/embedding/android/FlutterView$2;
.super Landroid/database/ContentObserver;
.source "FlutterView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/android/FlutterView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/android/FlutterView;


# direct methods
.method constructor <init>(Lio/flutter/embedding/android/FlutterView;Landroid/os/Handler;)V
    .locals 0

    .line 157
    iput-object p1, p0, Lio/flutter/embedding/android/FlutterView$2;->this$0:Lio/flutter/embedding/android/FlutterView;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public deliverSelfNotifications()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onChange(Z)V
    .locals 1

    .line 160
    invoke-super {p0, p1}, Landroid/database/ContentObserver;->onChange(Z)V

    .line 161
    iget-object p1, p0, Lio/flutter/embedding/android/FlutterView$2;->this$0:Lio/flutter/embedding/android/FlutterView;

    invoke-static {p1}, Lio/flutter/embedding/android/FlutterView;->access$100(Lio/flutter/embedding/android/FlutterView;)Lio/flutter/embedding/engine/FlutterEngine;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 164
    :cond_0
    const-string p1, "FlutterView"

    const-string v0, "System settings changed. Sending user settings to Flutter."

    invoke-static {p1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    iget-object p1, p0, Lio/flutter/embedding/android/FlutterView$2;->this$0:Lio/flutter/embedding/android/FlutterView;

    invoke-virtual {p1}, Lio/flutter/embedding/android/FlutterView;->sendUserSettingsToFlutter()V

    return-void
.end method
