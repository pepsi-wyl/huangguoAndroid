.class Lio/flutter/plugins/urllauncher/WebViewActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "WebViewActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/urllauncher/WebViewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/plugins/urllauncher/WebViewActivity;


# direct methods
.method constructor <init>(Lio/flutter/plugins/urllauncher/WebViewActivity;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lio/flutter/plugins/urllauncher/WebViewActivity$1;->this$0:Lio/flutter/plugins/urllauncher/WebViewActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 44
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    .line 45
    const-string p2, "close action"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 46
    iget-object p1, p0, Lio/flutter/plugins/urllauncher/WebViewActivity$1;->this$0:Lio/flutter/plugins/urllauncher/WebViewActivity;

    invoke-virtual {p1}, Lio/flutter/plugins/urllauncher/WebViewActivity;->finish()V

    :cond_0
    return-void
.end method
