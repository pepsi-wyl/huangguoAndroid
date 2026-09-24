.class public final synthetic Lio/flutter/plugins/webviewflutter/JavaScriptChannel$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/webviewflutter/JavaScriptChannel;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/webviewflutter/JavaScriptChannel;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/JavaScriptChannel$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/webviewflutter/JavaScriptChannel;

    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/JavaScriptChannel$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/JavaScriptChannel$$ExternalSyntheticLambda1;->f$0:Lio/flutter/plugins/webviewflutter/JavaScriptChannel;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/JavaScriptChannel$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/JavaScriptChannel;->lambda$postMessage$1$io-flutter-plugins-webviewflutter-JavaScriptChannel(Ljava/lang/String;)V

    return-void
.end method
