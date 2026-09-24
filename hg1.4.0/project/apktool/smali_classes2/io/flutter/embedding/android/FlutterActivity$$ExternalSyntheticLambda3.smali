.class public final synthetic Lio/flutter/embedding/android/FlutterActivity$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/window/OnBackInvokedCallback;


# instance fields
.field public final synthetic f$0:Lio/flutter/embedding/android/FlutterActivity;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/embedding/android/FlutterActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/embedding/android/FlutterActivity$$ExternalSyntheticLambda3;->f$0:Lio/flutter/embedding/android/FlutterActivity;

    return-void
.end method


# virtual methods
.method public final onBackInvoked()V
    .locals 1

    .line 0
    iget-object v0, p0, Lio/flutter/embedding/android/FlutterActivity$$ExternalSyntheticLambda3;->f$0:Lio/flutter/embedding/android/FlutterActivity;

    invoke-virtual {v0}, Lio/flutter/embedding/android/FlutterActivity;->onBackPressed()V

    return-void
.end method
