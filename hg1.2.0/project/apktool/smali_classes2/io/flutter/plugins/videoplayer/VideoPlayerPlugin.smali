.class public Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;
.super Ljava/lang/Object;
.source "VideoPlayerPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/embedding/engine/plugins/activity/ActivityAware;
.implements Lio/flutter/plugins/videoplayer/Messages$AndroidVideoPlayerApi;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;,
        Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$KeyForAssetFn;,
        Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$KeyForAssetAndPackageName;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoPlayerPlugin"


# instance fields
.field private activity:Landroid/app/Activity;

.field private flutterState:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;

.field private final options:Lio/flutter/plugins/videoplayer/VideoPlayerOptions;

.field private final videoPlayers:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Lio/flutter/plugins/videoplayer/VideoPlayer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    .line 45
    new-instance v0, Lio/flutter/plugins/videoplayer/VideoPlayerOptions;

    invoke-direct {v0}, Lio/flutter/plugins/videoplayer/VideoPlayerOptions;-><init>()V

    iput-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->options:Lio/flutter/plugins/videoplayer/VideoPlayerOptions;

    return-void
.end method

.method private disposeAllPlayers()V
    .locals 2

    const/4 v0, 0x0

    .line 91
    :goto_0
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 92
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {v1, v0}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/videoplayer/VideoPlayer;

    invoke-virtual {v1}, Lio/flutter/plugins/videoplayer/VideoPlayer;->dispose()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 94
    :cond_0
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clear()V

    return-void
.end method


# virtual methods
.method public create(Lio/flutter/plugins/videoplayer/Messages$CreateMessage;)Lio/flutter/plugins/videoplayer/Messages$TextureMessage;
    .locals 11

    .line 111
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->flutterState:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;

    iget-object v0, v0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;->textureRegistry:Lio/flutter/view/TextureRegistry;

    .line 112
    invoke-interface {v0}, Lio/flutter/view/TextureRegistry;->createSurfaceTexture()Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;

    move-result-object v0

    .line 113
    new-instance v1, Lio/flutter/plugin/common/EventChannel;

    iget-object v2, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->flutterState:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;

    iget-object v2, v2, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "flutter.io/videoPlayer/videoEvents"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    invoke-interface {v0}, Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;->id()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    .line 118
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getAsset()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 120
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getPackageName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 121
    iget-object v2, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->flutterState:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;

    iget-object v2, v2, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;->keyForAssetAndPackageName:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$KeyForAssetAndPackageName;

    .line 122
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getAsset()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$KeyForAssetAndPackageName;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 124
    :cond_0
    iget-object v2, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->flutterState:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;

    iget-object v2, v2, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;->keyForAsset:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$KeyForAssetFn;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getAsset()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$KeyForAssetFn;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 126
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "asset:///"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lio/flutter/plugins/videoplayer/VideoAsset;->fromAssetUrl(Ljava/lang/String;)Lio/flutter/plugins/videoplayer/VideoAsset;

    move-result-object v2

    goto :goto_1

    .line 127
    :cond_1
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getUri()Ljava/lang/String;

    move-result-object v2

    const-string v3, "rtsp://"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 128
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getUri()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lio/flutter/plugins/videoplayer/VideoAsset;->fromRtspUrl(Ljava/lang/String;)Lio/flutter/plugins/videoplayer/VideoAsset;

    move-result-object v2

    :goto_1
    move-object v5, v2

    goto :goto_4

    .line 130
    :cond_2
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getHttpHeaders()Ljava/util/Map;

    .line 131
    sget-object v2, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->UNKNOWN:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    .line 132
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getFormatHint()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_6

    .line 134
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    const/4 v5, -0x1

    sparse-switch v4, :sswitch_data_0

    goto :goto_2

    :sswitch_0
    const-string v4, "dash"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_2

    :cond_3
    const/4 v5, 0x2

    goto :goto_2

    :sswitch_1
    const-string v4, "hls"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    goto :goto_2

    :cond_4
    const/4 v5, 0x1

    goto :goto_2

    :sswitch_2
    const-string v4, "ss"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_2

    :cond_5
    const/4 v5, 0x0

    :goto_2
    packed-switch v5, :pswitch_data_0

    goto :goto_3

    .line 139
    :pswitch_0
    sget-object v2, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->DYNAMIC_ADAPTIVE:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    goto :goto_3

    .line 142
    :pswitch_1
    sget-object v2, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->HTTP_LIVE:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    goto :goto_3

    .line 136
    :pswitch_2
    sget-object v2, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->SMOOTH:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    .line 146
    :cond_6
    :goto_3
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getHttpHeaders()Ljava/util/Map;

    move-result-object v4

    invoke-static {v3, v2, v4}, Lio/flutter/plugins/videoplayer/VideoAsset;->fromRemoteUrl(Ljava/lang/String;Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;Ljava/util/Map;)Lio/flutter/plugins/videoplayer/VideoAsset;

    move-result-object v2

    goto :goto_1

    .line 148
    :goto_4
    iget-object v8, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    .line 149
    invoke-interface {v0}, Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;->id()J

    move-result-wide v9

    iget-object v2, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->activity:Landroid/app/Activity;

    iget-object v3, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->flutterState:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;

    iget-object v3, v3, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;->applicationContext:Landroid/content/Context;

    .line 153
    invoke-static {v1}, Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;->bindTo(Lio/flutter/plugin/common/EventChannel;)Lio/flutter/plugins/videoplayer/VideoPlayerEventCallbacks;

    move-result-object v4

    .line 156
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$CreateMessage;->getUri()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->options:Lio/flutter/plugins/videoplayer/VideoPlayerOptions;

    move-object v1, v2

    move-object v2, v3

    move-object v3, v4

    move-object v4, v0

    .line 150
    invoke-static/range {v1 .. v7}, Lio/flutter/plugins/videoplayer/VideoPlayer;->create(Landroid/app/Activity;Landroid/content/Context;Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;Lio/flutter/plugins/videoplayer/VideoAsset;Ljava/lang/String;Lio/flutter/plugins/videoplayer/VideoPlayerOptions;)Lio/flutter/plugins/videoplayer/VideoPlayer;

    move-result-object p1

    .line 148
    invoke-virtual {v8, v9, v10, p1}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 159
    new-instance p1, Lio/flutter/plugins/videoplayer/Messages$TextureMessage$Builder;

    invoke-direct {p1}, Lio/flutter/plugins/videoplayer/Messages$TextureMessage$Builder;-><init>()V

    invoke-interface {v0}, Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;->id()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/flutter/plugins/videoplayer/Messages$TextureMessage$Builder;->setTextureId(Ljava/lang/Long;)Lio/flutter/plugins/videoplayer/Messages$TextureMessage$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$TextureMessage$Builder;->build()Lio/flutter/plugins/videoplayer/Messages$TextureMessage;

    move-result-object p1

    return-object p1

    :sswitch_data_0
    .sparse-switch
        0xe60 -> :sswitch_2
        0x193ef -> :sswitch_1
        0x2eef92 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public dispose(Lio/flutter/plugins/videoplayer/Messages$TextureMessage;)V
    .locals 3

    .line 163
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$TextureMessage;->getTextureId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugins/videoplayer/VideoPlayer;

    .line 164
    invoke-virtual {v0}, Lio/flutter/plugins/videoplayer/VideoPlayer;->dispose()V

    .line 165
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$TextureMessage;->getTextureId()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->remove(J)V

    return-void
.end method

.method public initialize()V
    .locals 0

    .line 107
    invoke-direct {p0}, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->disposeAllPlayers()V

    return-void
.end method

.method public onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 0

    .line 222
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->activity:Landroid/app/Activity;

    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 8

    .line 69
    invoke-static {}, Lio/flutter/FlutterInjector;->instance()Lio/flutter/FlutterInjector;

    move-result-object v0

    .line 70
    new-instance v7, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;

    .line 72
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 73
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v3

    .line 74
    invoke-virtual {v0}, Lio/flutter/FlutterInjector;->flutterLoader()Lio/flutter/embedding/engine/loader/FlutterLoader;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$$ExternalSyntheticLambda0;

    invoke-direct {v4, v1}, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$$ExternalSyntheticLambda0;-><init>(Lio/flutter/embedding/engine/loader/FlutterLoader;)V

    .line 75
    invoke-virtual {v0}, Lio/flutter/FlutterInjector;->flutterLoader()Lio/flutter/embedding/engine/loader/FlutterLoader;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$$ExternalSyntheticLambda1;

    invoke-direct {v5, v0}, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$$ExternalSyntheticLambda1;-><init>(Lio/flutter/embedding/engine/loader/FlutterLoader;)V

    .line 76
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getTextureRegistry()Lio/flutter/view/TextureRegistry;

    move-result-object v6

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;-><init>(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$KeyForAssetFn;Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$KeyForAssetAndPackageName;Lio/flutter/view/TextureRegistry;)V

    iput-object v7, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->flutterState:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;

    .line 77
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    invoke-virtual {v7, p0, p1}, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;->startListening(Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;Lio/flutter/plugin/common/BinaryMessenger;)V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 103
    invoke-direct {p0}, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->disposeAllPlayers()V

    return-void
.end method

.method public onDetachedFromActivity()V
    .locals 1

    const/4 v0, 0x0

    .line 238
    iput-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->activity:Landroid/app/Activity;

    return-void
.end method

.method public onDetachedFromActivityForConfigChanges()V
    .locals 1

    const/4 v0, 0x0

    .line 227
    iput-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->activity:Landroid/app/Activity;

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 2

    .line 82
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->flutterState:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;

    if-nez v0, :cond_0

    .line 83
    const-string v0, "VideoPlayerPlugin"

    const-string v1, "Detached from the engine before registering to it."

    invoke-static {v0, v1}, Lio/flutter/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    :cond_0
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->flutterState:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    invoke-virtual {v0, p1}, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;->stopListening(Lio/flutter/plugin/common/BinaryMessenger;)V

    const/4 p1, 0x0

    .line 86
    iput-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->flutterState:Lio/flutter/plugins/videoplayer/VideoPlayerPlugin$FlutterState;

    .line 87
    invoke-virtual {p0}, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->onDestroy()V

    return-void
.end method

.method public onReattachedToActivityForConfigChanges(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 0

    .line 233
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->activity:Landroid/app/Activity;

    return-void
.end method

.method public pause(Lio/flutter/plugins/videoplayer/Messages$TextureMessage;)V
    .locals 3

    .line 205
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$TextureMessage;->getTextureId()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/videoplayer/VideoPlayer;

    .line 206
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/VideoPlayer;->pause()V

    return-void
.end method

.method public play(Lio/flutter/plugins/videoplayer/Messages$TextureMessage;)V
    .locals 3

    .line 184
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$TextureMessage;->getTextureId()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/videoplayer/VideoPlayer;

    .line 185
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/VideoPlayer;->play()V

    return-void
.end method

.method public position(Lio/flutter/plugins/videoplayer/Messages$TextureMessage;)Lio/flutter/plugins/videoplayer/Messages$PositionMessage;
    .locals 4

    .line 189
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$TextureMessage;->getTextureId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugins/videoplayer/VideoPlayer;

    .line 190
    new-instance v1, Lio/flutter/plugins/videoplayer/Messages$PositionMessage$Builder;

    invoke-direct {v1}, Lio/flutter/plugins/videoplayer/Messages$PositionMessage$Builder;-><init>()V

    .line 192
    invoke-virtual {v0}, Lio/flutter/plugins/videoplayer/VideoPlayer;->getPosition()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/flutter/plugins/videoplayer/Messages$PositionMessage$Builder;->setPosition(Ljava/lang/Long;)Lio/flutter/plugins/videoplayer/Messages$PositionMessage$Builder;

    move-result-object v1

    .line 193
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$TextureMessage;->getTextureId()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v1, p1}, Lio/flutter/plugins/videoplayer/Messages$PositionMessage$Builder;->setTextureId(Ljava/lang/Long;)Lio/flutter/plugins/videoplayer/Messages$PositionMessage$Builder;

    move-result-object p1

    .line 194
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$PositionMessage$Builder;->build()Lio/flutter/plugins/videoplayer/Messages$PositionMessage;

    move-result-object p1

    .line 195
    invoke-virtual {v0}, Lio/flutter/plugins/videoplayer/VideoPlayer;->sendBufferingUpdate()V

    return-object p1
.end method

.method public seekTo(Lio/flutter/plugins/videoplayer/Messages$PositionMessage;)V
    .locals 3

    .line 200
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$PositionMessage;->getTextureId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugins/videoplayer/VideoPlayer;

    .line 201
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$PositionMessage;->getPosition()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Lio/flutter/plugins/videoplayer/VideoPlayer;->seekTo(I)V

    return-void
.end method

.method public setBrightness(Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage;)V
    .locals 3

    .line 216
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage;->getTextureId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugins/videoplayer/VideoPlayer;

    .line 217
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage;->getBrightness()Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/videoplayer/VideoPlayer;->setBrightness(D)V

    return-void
.end method

.method public setLooping(Lio/flutter/plugins/videoplayer/Messages$LoopingMessage;)V
    .locals 3

    .line 169
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$LoopingMessage;->getTextureId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugins/videoplayer/VideoPlayer;

    .line 170
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$LoopingMessage;->getIsLooping()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v0, p1}, Lio/flutter/plugins/videoplayer/VideoPlayer;->setLooping(Z)V

    return-void
.end method

.method public setMixWithOthers(Lio/flutter/plugins/videoplayer/Messages$MixWithOthersMessage;)V
    .locals 1

    .line 211
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->options:Lio/flutter/plugins/videoplayer/VideoPlayerOptions;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$MixWithOthersMessage;->getMixWithOthers()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, v0, Lio/flutter/plugins/videoplayer/VideoPlayerOptions;->mixWithOthers:Z

    return-void
.end method

.method public setPlaybackSpeed(Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage;)V
    .locals 3

    .line 179
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage;->getTextureId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugins/videoplayer/VideoPlayer;

    .line 180
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage;->getSpeed()Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/videoplayer/VideoPlayer;->setPlaybackSpeed(D)V

    return-void
.end method

.method public setVolume(Lio/flutter/plugins/videoplayer/Messages$VolumeMessage;)V
    .locals 3

    .line 174
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayerPlugin;->videoPlayers:Landroid/util/LongSparseArray;

    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$VolumeMessage;->getTextureId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/plugins/videoplayer/VideoPlayer;

    .line 175
    invoke-virtual {p1}, Lio/flutter/plugins/videoplayer/Messages$VolumeMessage;->getVolume()Ljava/lang/Double;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/videoplayer/VideoPlayer;->setVolume(D)V

    return-void
.end method
