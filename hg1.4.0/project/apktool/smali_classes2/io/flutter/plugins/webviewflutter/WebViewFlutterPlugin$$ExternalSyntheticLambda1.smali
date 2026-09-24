.class public final synthetic Lio/flutter/plugins/webviewflutter/WebViewFlutterPlugin$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/InstanceManager$FinalizationListener;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugin/common/BinaryMessenger;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterPlugin$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugin/common/BinaryMessenger;

    return-void
.end method


# virtual methods
.method public final onFinalize(J)V
    .locals 1

    .line 0
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebViewFlutterPlugin$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugin/common/BinaryMessenger;

    invoke-static {v0, p1, p2}, Lio/flutter/plugins/webviewflutter/WebViewFlutterPlugin;->lambda$setUp$1(Lio/flutter/plugin/common/BinaryMessenger;J)V

    return-void
.end method
