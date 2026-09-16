.class public Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry;
.super Ljava/lang/Object;
.source "ShimPluginRegistry.java"

# interfaces
.implements Lio/flutter/plugin/common/PluginRegistry;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry$ShimRegistrarAggregate;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ShimPluginRegistry"


# instance fields
.field private final flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

.field private final pluginMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final shimRegistrarAggregate:Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry$ShimRegistrarAggregate;


# direct methods
.method public constructor <init>(Lio/flutter/embedding/engine/FlutterEngine;)V
    .locals 2

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry;->pluginMap:Ljava/util/Map;

    .line 46
    iput-object p1, p0, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 47
    new-instance v0, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry$ShimRegistrarAggregate;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry$ShimRegistrarAggregate;-><init>(Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry$1;)V

    iput-object v0, p0, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry;->shimRegistrarAggregate:Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry$ShimRegistrarAggregate;

    .line 48
    invoke-virtual {p1}, Lio/flutter/embedding/engine/FlutterEngine;->getPlugins()Lio/flutter/embedding/engine/plugins/PluginRegistry;

    move-result-object p1

    invoke-interface {p1, v0}, Lio/flutter/embedding/engine/plugins/PluginRegistry;->add(Lio/flutter/embedding/engine/plugins/FlutterPlugin;)V

    return-void
.end method


# virtual methods
.method public hasPlugin(Ljava/lang/String;)Z
    .locals 1

    .line 66
    iget-object v0, p0, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry;->pluginMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public registrarFor(Ljava/lang/String;)Lio/flutter/plugin/common/PluginRegistry$Registrar;
    .locals 3

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Creating plugin Registrar for \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ShimPluginRegistry"

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry;->pluginMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 58
    iget-object v0, p0, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry;->pluginMap:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    new-instance v0, Lio/flutter/embedding/engine/plugins/shim/ShimRegistrar;

    iget-object v1, p0, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry;->pluginMap:Ljava/util/Map;

    invoke-direct {v0, p1, v1}, Lio/flutter/embedding/engine/plugins/shim/ShimRegistrar;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 60
    iget-object p1, p0, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry;->shimRegistrarAggregate:Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry$ShimRegistrarAggregate;

    invoke-virtual {p1, v0}, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry$ShimRegistrarAggregate;->addPlugin(Lio/flutter/embedding/engine/plugins/shim/ShimRegistrar;)V

    return-object v0

    .line 56
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Plugin key "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " is already in use"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public valuePublishedByPlugin(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lio/flutter/embedding/engine/plugins/shim/ShimPluginRegistry;->pluginMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
