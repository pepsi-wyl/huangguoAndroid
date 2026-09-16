.class public Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;
.super Ljava/lang/Object;
.source "FlutterPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FlutterPluginBinding"
.end annotation


# instance fields
.field private final applicationContext:Landroid/content/Context;

.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final flutterAssets:Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterAssets;

.field private final flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

.field private final group:Lio/flutter/embedding/engine/FlutterEngineGroup;

.field private final platformViewRegistry:Lio/flutter/plugin/platform/PlatformViewRegistry;

.field private final textureRegistry:Lio/flutter/view/TextureRegistry;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lio/flutter/embedding/engine/FlutterEngine;Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/view/TextureRegistry;Lio/flutter/plugin/platform/PlatformViewRegistry;Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterAssets;Lio/flutter/embedding/engine/FlutterEngineGroup;)V
    .locals 0

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    iput-object p1, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->applicationContext:Landroid/content/Context;

    .line 123
    iput-object p2, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    .line 124
    iput-object p3, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 125
    iput-object p4, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->textureRegistry:Lio/flutter/view/TextureRegistry;

    .line 126
    iput-object p5, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->platformViewRegistry:Lio/flutter/plugin/platform/PlatformViewRegistry;

    .line 127
    iput-object p6, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->flutterAssets:Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterAssets;

    .line 128
    iput-object p7, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->group:Lio/flutter/embedding/engine/FlutterEngineGroup;

    return-void
.end method


# virtual methods
.method public getApplicationContext()Landroid/content/Context;
    .locals 1

    .line 133
    iget-object v0, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;
    .locals 1

    .line 148
    iget-object v0, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    return-object v0
.end method

.method public getEngineGroup()Lio/flutter/embedding/engine/FlutterEngineGroup;
    .locals 1

    .line 178
    iget-object v0, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->group:Lio/flutter/embedding/engine/FlutterEngineGroup;

    return-object v0
.end method

.method public getFlutterAssets()Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterAssets;
    .locals 1

    .line 163
    iget-object v0, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->flutterAssets:Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterAssets;

    return-object v0
.end method

.method public getFlutterEngine()Lio/flutter/embedding/engine/FlutterEngine;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 143
    iget-object v0, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->flutterEngine:Lio/flutter/embedding/engine/FlutterEngine;

    return-object v0
.end method

.method public getPlatformViewRegistry()Lio/flutter/plugin/platform/PlatformViewRegistry;
    .locals 1

    .line 158
    iget-object v0, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->platformViewRegistry:Lio/flutter/plugin/platform/PlatformViewRegistry;

    return-object v0
.end method

.method public getTextureRegistry()Lio/flutter/view/TextureRegistry;
    .locals 1

    .line 153
    iget-object v0, p0, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->textureRegistry:Lio/flutter/view/TextureRegistry;

    return-object v0
.end method
