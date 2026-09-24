.class Lio/flutter/plugins/webviewflutter/FlutterViewFactory;
.super Lio/flutter/plugin/platform/PlatformViewFactory;
.source "FlutterViewFactory.java"


# instance fields
.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;


# direct methods
.method constructor <init>(Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 1

    .line 19
    sget-object v0, Lio/flutter/plugin/common/StandardMessageCodec;->INSTANCE:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-direct {p0, v0}, Lio/flutter/plugin/platform/PlatformViewFactory;-><init>(Lio/flutter/plugin/common/MessageCodec;)V

    .line 20
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/FlutterViewFactory;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    return-void
.end method


# virtual methods
.method public create(Landroid/content/Context;ILjava/lang/Object;)Lio/flutter/plugin/platform/PlatformView;
    .locals 2

    .line 26
    move-object p1, p3

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_2

    .line 31
    iget-object p2, p0, Lio/flutter/plugins/webviewflutter/FlutterViewFactory;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-long v0, p1

    invoke-virtual {p2, v0, v1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    .line 33
    instance-of p2, p1, Lio/flutter/plugin/platform/PlatformView;

    if-eqz p2, :cond_0

    .line 34
    check-cast p1, Lio/flutter/plugin/platform/PlatformView;

    return-object p1

    .line 35
    :cond_0
    instance-of p2, p1, Landroid/view/View;

    if-eqz p2, :cond_1

    .line 36
    new-instance p2, Lio/flutter/plugins/webviewflutter/FlutterViewFactory$1;

    invoke-direct {p2, p0, p1}, Lio/flutter/plugins/webviewflutter/FlutterViewFactory$1;-><init>(Lio/flutter/plugins/webviewflutter/FlutterViewFactory;Ljava/lang/Object;)V

    return-object p2

    .line 47
    :cond_1
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unable to find a PlatformView or View instance: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p3, ", "

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 28
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "An identifier is required to retrieve a View instance."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
