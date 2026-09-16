.class public Lio/flutter/embedding/engine/plugins/lifecycle/FlutterLifecycleAdapter;
.super Ljava/lang/Object;
.source "FlutterLifecycleAdapter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getActivityLifecycle(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)Landroidx/lifecycle/Lifecycle;
    .locals 0

    .line 23
    invoke-interface {p0}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getLifecycle()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lio/flutter/embedding/engine/plugins/lifecycle/HiddenLifecycleReference;

    .line 24
    invoke-virtual {p0}, Lio/flutter/embedding/engine/plugins/lifecycle/HiddenLifecycleReference;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object p0

    return-object p0
.end method
