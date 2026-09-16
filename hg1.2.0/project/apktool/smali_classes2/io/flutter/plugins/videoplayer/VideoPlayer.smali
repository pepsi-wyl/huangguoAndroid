.class final Lio/flutter/plugins/videoplayer/VideoPlayer;
.super Ljava/lang/Object;
.source "VideoPlayer.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoPlayer"


# instance fields
.field private activity:Landroid/app/Activity;

.field private ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

.field private final options:Lio/flutter/plugins/videoplayer/VideoPlayerOptions;

.field private surface:Landroid/view/Surface;

.field private final textureEntry:Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;

.field private final videoPlayerEvents:Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;


# direct methods
.method constructor <init>(Landroid/app/Activity;Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;Lio/flutter/plugins/videoplayer/VideoAsset;Ljava/lang/String;Lio/flutter/plugins/videoplayer/VideoPlayerOptions;)V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->activity:Landroid/app/Activity;

    .line 72
    iput-object p2, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->videoPlayerEvents:Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;

    .line 73
    iput-object p3, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->textureEntry:Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;

    .line 74
    iput-object p6, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->options:Lio/flutter/plugins/videoplayer/VideoPlayerOptions;

    .line 75
    new-instance p1, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-direct {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 77
    :try_start_0
    invoke-virtual {p1, p5}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 78
    iget-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->prepareAsync()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 80
    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Error setting data source: "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "VideoPlayer"

    invoke-static {p2, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    :goto_0
    invoke-direct {p0}, Lio/flutter/plugins/videoplayer/VideoPlayer;->setUpVideoPlayer()V

    return-void
.end method

.method static create(Landroid/app/Activity;Landroid/content/Context;Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;Lio/flutter/plugins/videoplayer/VideoAsset;Ljava/lang/String;Lio/flutter/plugins/videoplayer/VideoPlayerOptions;)Lio/flutter/plugins/videoplayer/VideoPlayer;
    .locals 7

    const/4 p1, 0x0

    .line 58
    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->loadLibrariesOnce(Ltv/danmaku/ijk/media/player/IjkLibLoader;)V

    .line 59
    const-string p1, "libijkplayer.so"

    invoke-static {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->native_profileBegin(Ljava/lang/String;)V

    .line 60
    new-instance p1, Lio/flutter/plugins/videoplayer/VideoPlayer;

    move-object v0, p1

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lio/flutter/plugins/videoplayer/VideoPlayer;-><init>(Landroid/app/Activity;Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;Lio/flutter/plugins/videoplayer/VideoAsset;Ljava/lang/String;Lio/flutter/plugins/videoplayer/VideoPlayerOptions;)V

    return-object p1
.end method

.method static synthetic lambda$setUpVideoPlayer$2(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z
    .locals 1

    .line 98
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "IJKPlayer error: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "VideoPlayer"

    invoke-static {p1, p0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x1

    return p0
.end method

.method private static setAudioAttributes(Z)V
    .locals 0

    return-void
.end method

.method private setUpVideoPlayer()V
    .locals 2

    .line 87
    new-instance v0, Landroid/view/Surface;

    iget-object v1, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->textureEntry:Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;

    invoke-interface {v1}, Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;->surfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->surface:Landroid/view/Surface;

    .line 88
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 89
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->options:Lio/flutter/plugins/videoplayer/VideoPlayerOptions;

    iget-boolean v0, v0, Lio/flutter/plugins/videoplayer/VideoPlayerOptions;->mixWithOthers:Z

    invoke-static {v0}, Lio/flutter/plugins/videoplayer/VideoPlayer;->setAudioAttributes(Z)V

    .line 90
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    new-instance v1, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/videoplayer/VideoPlayer;)V

    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOnPreparedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 96
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    new-instance v1, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/videoplayer/VideoPlayer;)V

    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOnCompletionListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 97
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    new-instance v1, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOnErrorListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 101
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    new-instance v1, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugins/videoplayer/VideoPlayer;)V

    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOnBufferingUpdateListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V

    return-void
.end method


# virtual methods
.method dispose()V
    .locals 1

    .line 161
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->textureEntry:Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;

    invoke-interface {v0}, Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;->release()V

    .line 162
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->surface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    .line 163
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 165
    :cond_0
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    if-eqz v0, :cond_1

    .line 166
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->release()V

    .line 168
    :cond_1
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->native_profileEnd()V

    return-void
.end method

.method getPosition()J
    .locals 2

    .line 157
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getCurrentPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method synthetic lambda$setBrightness$4$io-flutter-plugins-videoplayer-VideoPlayer(F)V
    .locals 2

    .line 141
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 142
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 143
    iput p1, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 144
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method synthetic lambda$setUpVideoPlayer$0$io-flutter-plugins-videoplayer-VideoPlayer(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 6

    .line 91
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getVideoWidth()I

    move-result v1

    .line 92
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getVideoHeight()I

    move-result v2

    .line 93
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getDuration()J

    move-result-wide v3

    .line 94
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->videoPlayerEvents:Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;->onInitialized(IIJI)V

    return-void
.end method

.method synthetic lambda$setUpVideoPlayer$1$io-flutter-plugins-videoplayer-VideoPlayer(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 96
    iget-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->videoPlayerEvents:Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;

    invoke-interface {p1}, Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;->onCompleted()V

    return-void
.end method

.method synthetic lambda$setUpVideoPlayer$3$io-flutter-plugins-videoplayer-VideoPlayer(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V
    .locals 3

    .line 102
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->videoPlayerEvents:Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;

    int-to-long v1, p2

    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getDuration()J

    move-result-wide p1

    mul-long v1, v1, p1

    const-wide/16 p1, 0x64

    div-long/2addr v1, p1

    invoke-interface {v0, v1, v2}, Lio/flutter/plugins/videoplayer/VideoPlayerCallbacks;->onBufferingUpdate(J)V

    return-void
.end method

.method pause()V
    .locals 1

    .line 122
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pause()V

    return-void
.end method

.method play()V
    .locals 1

    .line 118
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->start()V

    return-void
.end method

.method seekTo(I)V
    .locals 3

    .line 153
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->seekTo(J)V

    return-void
.end method

.method sendBufferingUpdate()V
    .locals 0

    return-void
.end method

.method setBrightness(D)V
    .locals 2

    .line 136
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->activity:Landroid/app/Activity;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 138
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(DD)D

    move-result-wide p1

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(DD)D

    move-result-wide p1

    double-to-float p1, p1

    .line 140
    iget-object p2, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->activity:Landroid/app/Activity;

    new-instance v0, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/videoplayer/VideoPlayer;F)V

    invoke-virtual {p2, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method setLooping(Z)V
    .locals 1

    .line 126
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setLooping(Z)V

    return-void
.end method

.method setPlaybackSpeed(D)V
    .locals 1

    .line 149
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    double-to-float p1, p1

    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setSpeed(F)V

    return-void
.end method

.method setVolume(D)V
    .locals 2

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 130
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(DD)D

    move-result-wide p1

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(DD)D

    move-result-wide p1

    double-to-float p1, p1

    .line 131
    iget-object p2, p0, Lio/flutter/plugins/videoplayer/VideoPlayer;->ijkMediaPlayer:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {p2, p1, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    return-void
.end method
