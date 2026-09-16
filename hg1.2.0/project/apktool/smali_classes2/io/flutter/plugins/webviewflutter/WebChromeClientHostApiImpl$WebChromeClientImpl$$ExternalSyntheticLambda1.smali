.class public final synthetic Lio/flutter/plugins/webviewflutter/WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;


# instance fields
.field public final synthetic f$0:Landroid/webkit/JsResult;


# direct methods
.method public synthetic constructor <init>(Landroid/webkit/JsResult;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda1;->f$0:Landroid/webkit/JsResult;

    return-void
.end method


# virtual methods
.method public final reply(Ljava/lang/Object;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda1;->f$0:Landroid/webkit/JsResult;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p1}, Lio/flutter/plugins/webviewflutter/WebChromeClientHostApiImpl$WebChromeClientImpl;->lambda$onJsConfirm$9(Landroid/webkit/JsResult;Ljava/lang/Boolean;)V

    return-void
.end method
