.class Lio/flutter/plugins/webviewflutter/FlutterViewFactory$1;
.super Ljava/lang/Object;
.source "FlutterViewFactory.java"

# interfaces
.implements Lio/flutter/plugin/platform/PlatformView;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugins/webviewflutter/FlutterViewFactory;->create(Landroid/content/Context;ILjava/lang/Object;)Lio/flutter/plugin/platform/PlatformView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/plugins/webviewflutter/FlutterViewFactory;

.field final synthetic val$instance:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lio/flutter/plugins/webviewflutter/FlutterViewFactory;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 36
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/FlutterViewFactory$1;->this$0:Lio/flutter/plugins/webviewflutter/FlutterViewFactory;

    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/FlutterViewFactory$1;->val$instance:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 0

    return-void
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 39
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/FlutterViewFactory$1;->val$instance:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    return-object v0
.end method

.method public synthetic onFlutterViewAttached(Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1}, Lio/flutter/plugin/platform/PlatformView$-CC;->$default$onFlutterViewAttached(Lio/flutter/plugin/platform/PlatformView;Landroid/view/View;)V

    return-void
.end method

.method public synthetic onFlutterViewDetached()V
    .locals 0

    invoke-static {p0}, Lio/flutter/plugin/platform/PlatformView$-CC;->$default$onFlutterViewDetached(Lio/flutter/plugin/platform/PlatformView;)V

    return-void
.end method

.method public synthetic onInputConnectionLocked()V
    .locals 0

    invoke-static {p0}, Lio/flutter/plugin/platform/PlatformView$-CC;->$default$onInputConnectionLocked(Lio/flutter/plugin/platform/PlatformView;)V

    return-void
.end method

.method public synthetic onInputConnectionUnlocked()V
    .locals 0

    invoke-static {p0}, Lio/flutter/plugin/platform/PlatformView$-CC;->$default$onInputConnectionUnlocked(Lio/flutter/plugin/platform/PlatformView;)V

    return-void
.end method
