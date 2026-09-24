.class Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;
.super Ljava/lang/Object;
.source "FlutterPluginRegistry.java"

# interfaces
.implements Lio/flutter/plugin/common/PluginRegistry$Registrar;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/app/FlutterPluginRegistry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FlutterRegistrar"
.end annotation


# instance fields
.field private final pluginKey:Ljava/lang/String;

.field final synthetic this$0:Lio/flutter/app/FlutterPluginRegistry;


# direct methods
.method constructor <init>(Lio/flutter/app/FlutterPluginRegistry;Ljava/lang/String;)V
    .locals 0

    .line 107
    iput-object p1, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p2, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->pluginKey:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public activeContext()Landroid/content/Context;
    .locals 1

    .line 123
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$000(Lio/flutter/app/FlutterPluginRegistry;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$000(Lio/flutter/app/FlutterPluginRegistry;)Landroid/app/Activity;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$100(Lio/flutter/app/FlutterPluginRegistry;)Landroid/content/Context;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public activity()Landroid/app/Activity;
    .locals 1

    .line 113
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$000(Lio/flutter/app/FlutterPluginRegistry;)Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public addActivityResultListener(Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;)Lio/flutter/plugin/common/PluginRegistry$Registrar;
    .locals 1

    .line 171
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$700(Lio/flutter/app/FlutterPluginRegistry;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addNewIntentListener(Lio/flutter/plugin/common/PluginRegistry$NewIntentListener;)Lio/flutter/plugin/common/PluginRegistry$Registrar;
    .locals 1

    .line 177
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$800(Lio/flutter/app/FlutterPluginRegistry;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addRequestPermissionsResultListener(Lio/flutter/plugin/common/PluginRegistry$RequestPermissionsResultListener;)Lio/flutter/plugin/common/PluginRegistry$Registrar;
    .locals 1

    .line 165
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$600(Lio/flutter/app/FlutterPluginRegistry;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addUserLeaveHintListener(Lio/flutter/plugin/common/PluginRegistry$UserLeaveHintListener;)Lio/flutter/plugin/common/PluginRegistry$Registrar;
    .locals 1

    .line 183
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$900(Lio/flutter/app/FlutterPluginRegistry;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addViewDestroyListener(Lio/flutter/plugin/common/PluginRegistry$ViewDestroyListener;)Lio/flutter/plugin/common/PluginRegistry$Registrar;
    .locals 1

    .line 195
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$1100(Lio/flutter/app/FlutterPluginRegistry;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addWindowFocusChangedListener(Lio/flutter/plugin/common/PluginRegistry$WindowFocusChangedListener;)Lio/flutter/plugin/common/PluginRegistry$Registrar;
    .locals 1

    .line 189
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$1000(Lio/flutter/app/FlutterPluginRegistry;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public context()Landroid/content/Context;
    .locals 1

    .line 118
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$100(Lio/flutter/app/FlutterPluginRegistry;)Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public lookupKeyForAsset(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 148
    invoke-static {p1}, Lio/flutter/view/FlutterMain;->getLookupKeyForAsset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public lookupKeyForAsset(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 153
    invoke-static {p1, p2}, Lio/flutter/view/FlutterMain;->getLookupKeyForAsset(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public messenger()Lio/flutter/plugin/common/BinaryMessenger;
    .locals 1

    .line 128
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$200(Lio/flutter/app/FlutterPluginRegistry;)Lio/flutter/view/FlutterNativeView;

    move-result-object v0

    return-object v0
.end method

.method public platformViewRegistry()Lio/flutter/plugin/platform/PlatformViewRegistry;
    .locals 1

    .line 138
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$400(Lio/flutter/app/FlutterPluginRegistry;)Lio/flutter/plugin/platform/PlatformViewsController;

    move-result-object v0

    invoke-virtual {v0}, Lio/flutter/plugin/platform/PlatformViewsController;->getRegistry()Lio/flutter/plugin/platform/PlatformViewRegistry;

    move-result-object v0

    return-object v0
.end method

.method public publish(Ljava/lang/Object;)Lio/flutter/plugin/common/PluginRegistry$Registrar;
    .locals 2

    .line 158
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$500(Lio/flutter/app/FlutterPluginRegistry;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->pluginKey:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public textures()Lio/flutter/view/TextureRegistry;
    .locals 1

    .line 133
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$300(Lio/flutter/app/FlutterPluginRegistry;)Lio/flutter/view/FlutterView;

    move-result-object v0

    return-object v0
.end method

.method public view()Lio/flutter/view/FlutterView;
    .locals 1

    .line 143
    iget-object v0, p0, Lio/flutter/app/FlutterPluginRegistry$FlutterRegistrar;->this$0:Lio/flutter/app/FlutterPluginRegistry;

    invoke-static {v0}, Lio/flutter/app/FlutterPluginRegistry;->access$300(Lio/flutter/app/FlutterPluginRegistry;)Lio/flutter/view/FlutterView;

    move-result-object v0

    return-object v0
.end method
