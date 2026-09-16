.class public Landroidx/media3/exoplayer/SimpleExoPlayer;
.super Landroidx/media3/common/BasePlayer;
.source "SimpleExoPlayer.java"

# interfaces
.implements Landroidx/media3/exoplayer/ExoPlayer;
.implements Landroidx/media3/exoplayer/ExoPlayer$AudioComponent;
.implements Landroidx/media3/exoplayer/ExoPlayer$VideoComponent;
.implements Landroidx/media3/exoplayer/ExoPlayer$TextComponent;
.implements Landroidx/media3/exoplayer/ExoPlayer$DeviceComponent;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/exoplayer/SimpleExoPlayer$Builder;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final constructorFinished:Landroidx/media3/common/util/ConditionVariable;

.field private final player:Landroidx/media3/exoplayer/ExoPlayerImpl;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Landroidx/media3/exoplayer/RenderersFactory;Landroidx/media3/exoplayer/trackselection/TrackSelector;Landroidx/media3/exoplayer/source/MediaSource$Factory;Landroidx/media3/exoplayer/LoadControl;Landroidx/media3/exoplayer/upstream/BandwidthMeter;Landroidx/media3/exoplayer/analytics/AnalyticsCollector;ZLandroidx/media3/common/util/Clock;Landroid/os/Looper;)V
    .locals 9
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 417
    new-instance v8, Landroidx/media3/exoplayer/ExoPlayer$Builder;

    move-object v0, v8

    move-object v1, p1

    move-object v2, p2

    move-object v3, p4

    move-object v4, p3

    move-object v5, p5

    move-object v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v0 .. v7}, Landroidx/media3/exoplayer/ExoPlayer$Builder;-><init>(Landroid/content/Context;Landroidx/media3/exoplayer/RenderersFactory;Landroidx/media3/exoplayer/source/MediaSource$Factory;Landroidx/media3/exoplayer/trackselection/TrackSelector;Landroidx/media3/exoplayer/LoadControl;Landroidx/media3/exoplayer/upstream/BandwidthMeter;Landroidx/media3/exoplayer/analytics/AnalyticsCollector;)V

    move/from16 v0, p8

    .line 426
    invoke-virtual {v8, v0}, Landroidx/media3/exoplayer/ExoPlayer$Builder;->setUseLazyPreparation(Z)Landroidx/media3/exoplayer/ExoPlayer$Builder;

    move-result-object v0

    move-object/from16 v1, p9

    .line 427
    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer$Builder;->setClock(Landroidx/media3/common/util/Clock;)Landroidx/media3/exoplayer/ExoPlayer$Builder;

    move-result-object v0

    move-object/from16 v1, p10

    .line 428
    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer$Builder;->setLooper(Landroid/os/Looper;)Landroidx/media3/exoplayer/ExoPlayer$Builder;

    move-result-object v0

    move-object v1, p0

    .line 417
    invoke-direct {p0, v0}, Landroidx/media3/exoplayer/SimpleExoPlayer;-><init>(Landroidx/media3/exoplayer/ExoPlayer$Builder;)V

    return-void
.end method

.method constructor <init>(Landroidx/media3/exoplayer/ExoPlayer$Builder;)V
    .locals 2

    .line 441
    invoke-direct {p0}, Landroidx/media3/common/BasePlayer;-><init>()V

    .line 442
    new-instance v0, Landroidx/media3/common/util/ConditionVariable;

    invoke-direct {v0}, Landroidx/media3/common/util/ConditionVariable;-><init>()V

    iput-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->constructorFinished:Landroidx/media3/common/util/ConditionVariable;

    .line 444
    :try_start_0
    new-instance v1, Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-direct {v1, p1, p0}, Landroidx/media3/exoplayer/ExoPlayerImpl;-><init>(Landroidx/media3/exoplayer/ExoPlayer$Builder;Landroidx/media3/common/Player;)V

    iput-object v1, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 446
    invoke-virtual {v0}, Landroidx/media3/common/util/ConditionVariable;->open()Z

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->constructorFinished:Landroidx/media3/common/util/ConditionVariable;

    invoke-virtual {v0}, Landroidx/media3/common/util/ConditionVariable;->open()Z

    .line 447
    throw p1
.end method

.method protected constructor <init>(Landroidx/media3/exoplayer/SimpleExoPlayer$Builder;)V
    .locals 0

    .line 435
    invoke-static {p1}, Landroidx/media3/exoplayer/SimpleExoPlayer$Builder;->access$000(Landroidx/media3/exoplayer/SimpleExoPlayer$Builder;)Landroidx/media3/exoplayer/ExoPlayer$Builder;

    move-result-object p1

    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/SimpleExoPlayer;-><init>(Landroidx/media3/exoplayer/ExoPlayer$Builder;)V

    return-void
.end method

.method private blockUntilConstructorFinished()V
    .locals 1

    .line 1368
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->constructorFinished:Landroidx/media3/common/util/ConditionVariable;

    invoke-virtual {v0}, Landroidx/media3/common/util/ConditionVariable;->blockUninterruptible()V

    return-void
.end method


# virtual methods
.method public addAnalyticsListener(Landroidx/media3/exoplayer/analytics/AnalyticsListener;)V
    .locals 1

    .line 684
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 685
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->addAnalyticsListener(Landroidx/media3/exoplayer/analytics/AnalyticsListener;)V

    return-void
.end method

.method public addAudioOffloadListener(Landroidx/media3/exoplayer/ExoPlayer$AudioOffloadListener;)V
    .locals 1

    .line 593
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 594
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->addAudioOffloadListener(Landroidx/media3/exoplayer/ExoPlayer$AudioOffloadListener;)V

    return-void
.end method

.method public addListener(Landroidx/media3/common/Player$Listener;)V
    .locals 1

    .line 792
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 793
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->addListener(Landroidx/media3/common/Player$Listener;)V

    return-void
.end method

.method public addMediaItems(ILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroidx/media3/common/MediaItem;",
            ">;)V"
        }
    .end annotation

    .line 907
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 908
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/ExoPlayerImpl;->addMediaItems(ILjava/util/List;)V

    return-void
.end method

.method public addMediaSource(ILandroidx/media3/exoplayer/source/MediaSource;)V
    .locals 1

    .line 919
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 920
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/ExoPlayerImpl;->addMediaSource(ILandroidx/media3/exoplayer/source/MediaSource;)V

    return-void
.end method

.method public addMediaSource(Landroidx/media3/exoplayer/source/MediaSource;)V
    .locals 1

    .line 913
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 914
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->addMediaSource(Landroidx/media3/exoplayer/source/MediaSource;)V

    return-void
.end method

.method public addMediaSources(ILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/source/MediaSource;",
            ">;)V"
        }
    .end annotation

    .line 931
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 932
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/ExoPlayerImpl;->addMediaSources(ILjava/util/List;)V

    return-void
.end method

.method public addMediaSources(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/source/MediaSource;",
            ">;)V"
        }
    .end annotation

    .line 925
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 926
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->addMediaSources(Ljava/util/List;)V

    return-void
.end method

.method public clearAuxEffectInfo()V
    .locals 1

    .line 635
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 636
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->clearAuxEffectInfo()V

    return-void
.end method

.method public clearCameraMotionListener(Landroidx/media3/exoplayer/video/spherical/CameraMotionListener;)V
    .locals 1

    .line 760
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 761
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->clearCameraMotionListener(Landroidx/media3/exoplayer/video/spherical/CameraMotionListener;)V

    return-void
.end method

.method public clearVideoFrameMetadataListener(Landroidx/media3/exoplayer/video/VideoFrameMetadataListener;)V
    .locals 1

    .line 748
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 749
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->clearVideoFrameMetadataListener(Landroidx/media3/exoplayer/video/VideoFrameMetadataListener;)V

    return-void
.end method

.method public clearVideoSurface()V
    .locals 1

    .line 539
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 540
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->clearVideoSurface()V

    return-void
.end method

.method public clearVideoSurface(Landroid/view/Surface;)V
    .locals 1

    .line 545
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 546
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->clearVideoSurface(Landroid/view/Surface;)V

    return-void
.end method

.method public clearVideoSurfaceHolder(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 563
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 564
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->clearVideoSurfaceHolder(Landroid/view/SurfaceHolder;)V

    return-void
.end method

.method public clearVideoSurfaceView(Landroid/view/SurfaceView;)V
    .locals 1

    .line 575
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 576
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->clearVideoSurfaceView(Landroid/view/SurfaceView;)V

    return-void
.end method

.method public clearVideoTextureView(Landroid/view/TextureView;)V
    .locals 1

    .line 587
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 588
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->clearVideoTextureView(Landroid/view/TextureView;)V

    return-void
.end method

.method public createMessage(Landroidx/media3/exoplayer/PlayerMessage$Target;)Landroidx/media3/exoplayer/PlayerMessage;
    .locals 1

    .line 1099
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1100
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->createMessage(Landroidx/media3/exoplayer/PlayerMessage$Target;)Landroidx/media3/exoplayer/PlayerMessage;

    move-result-object p1

    return-object p1
.end method

.method public decreaseDeviceVolume()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1317
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1318
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->decreaseDeviceVolume()V

    return-void
.end method

.method public decreaseDeviceVolume(I)V
    .locals 1

    .line 1323
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1324
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->decreaseDeviceVolume(I)V

    return-void
.end method

.method public getAnalyticsCollector()Landroidx/media3/exoplayer/analytics/AnalyticsCollector;
    .locals 1

    .line 678
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 679
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getAnalyticsCollector()Landroidx/media3/exoplayer/analytics/AnalyticsCollector;

    move-result-object v0

    return-object v0
.end method

.method public getApplicationLooper()Landroid/os/Looper;
    .locals 1

    .line 780
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 781
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getApplicationLooper()Landroid/os/Looper;

    move-result-object v0

    return-object v0
.end method

.method public getAudioAttributes()Landroidx/media3/common/AudioAttributes;
    .locals 1

    .line 611
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 612
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getAudioAttributes()Landroidx/media3/common/AudioAttributes;

    move-result-object v0

    return-object v0
.end method

.method public getAudioComponent()Landroidx/media3/exoplayer/ExoPlayer$AudioComponent;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-object p0
.end method

.method public getAudioDecoderCounters()Landroidx/media3/exoplayer/DecoderCounters;
    .locals 1

    .line 736
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 737
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getAudioDecoderCounters()Landroidx/media3/exoplayer/DecoderCounters;

    move-result-object v0

    return-object v0
.end method

.method public getAudioFormat()Landroidx/media3/common/Format;
    .locals 1

    .line 722
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 723
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getAudioFormat()Landroidx/media3/common/Format;

    move-result-object v0

    return-object v0
.end method

.method public getAudioSessionId()I
    .locals 1

    .line 623
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 624
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getAudioSessionId()I

    move-result v0

    return v0
.end method

.method public getAvailableCommands()Landroidx/media3/common/Player$Commands;
    .locals 1

    .line 823
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 824
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getAvailableCommands()Landroidx/media3/common/Player$Commands;

    move-result-object v0

    return-object v0
.end method

.method public getBufferedPosition()J
    .locals 2

    .line 1215
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1216
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getBufferedPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getClock()Landroidx/media3/common/util/Clock;
    .locals 1

    .line 786
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 787
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getClock()Landroidx/media3/common/util/Clock;

    move-result-object v0

    return-object v0
.end method

.method public getContentBufferedPosition()J
    .locals 2

    .line 1251
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1252
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getContentBufferedPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getContentPosition()J
    .locals 2

    .line 1245
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1246
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getContentPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCurrentAdGroupIndex()I
    .locals 1

    .line 1233
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1234
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getCurrentAdGroupIndex()I

    move-result v0

    return v0
.end method

.method public getCurrentAdIndexInAdGroup()I
    .locals 1

    .line 1239
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1240
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getCurrentAdIndexInAdGroup()I

    move-result v0

    return v0
.end method

.method public getCurrentCues()Landroidx/media3/common/text/CueGroup;
    .locals 1

    .line 766
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 767
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getCurrentCues()Landroidx/media3/common/text/CueGroup;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentMediaItemIndex()I
    .locals 1

    .line 1197
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1198
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getCurrentMediaItemIndex()I

    move-result v0

    return v0
.end method

.method public getCurrentPeriodIndex()I
    .locals 1

    .line 1191
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1192
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getCurrentPeriodIndex()I

    move-result v0

    return v0
.end method

.method public getCurrentPosition()J
    .locals 2

    .line 1209
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1210
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getCurrentPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCurrentTimeline()Landroidx/media3/common/Timeline;
    .locals 1

    .line 1185
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1186
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getCurrentTimeline()Landroidx/media3/common/Timeline;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentTrackGroups()Landroidx/media3/exoplayer/source/TrackGroupArray;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1133
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1134
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getCurrentTrackGroups()Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentTrackSelections()Landroidx/media3/exoplayer/trackselection/TrackSelectionArray;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1143
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1144
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getCurrentTrackSelections()Landroidx/media3/exoplayer/trackselection/TrackSelectionArray;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentTracks()Landroidx/media3/common/Tracks;
    .locals 1

    .line 1149
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1150
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getCurrentTracks()Landroidx/media3/common/Tracks;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceComponent()Landroidx/media3/exoplayer/ExoPlayer$DeviceComponent;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-object p0
.end method

.method public getDeviceInfo()Landroidx/media3/common/DeviceInfo;
    .locals 1

    .line 1263
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1264
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getDeviceInfo()Landroidx/media3/common/DeviceInfo;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceVolume()I
    .locals 1

    .line 1269
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1270
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getDeviceVolume()I

    move-result v0

    return v0
.end method

.method public getDuration()J
    .locals 2

    .line 1203
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1204
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getMaxSeekToPreviousPosition()J
    .locals 2

    .line 1051
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1052
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getMaxSeekToPreviousPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getMediaMetadata()Landroidx/media3/common/MediaMetadata;
    .locals 1

    .line 1167
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1168
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getMediaMetadata()Landroidx/media3/common/MediaMetadata;

    move-result-object v0

    return-object v0
.end method

.method public getPauseAtEndOfMediaItems()Z
    .locals 1

    .line 979
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 980
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getPauseAtEndOfMediaItems()Z

    move-result v0

    return v0
.end method

.method public getPlayWhenReady()Z
    .locals 1

    .line 967
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 968
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getPlayWhenReady()Z

    move-result v0

    return v0
.end method

.method public getPlaybackLooper()Landroid/os/Looper;
    .locals 1

    .line 774
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 775
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getPlaybackLooper()Landroid/os/Looper;

    move-result-object v0

    return-object v0
.end method

.method public getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;
    .locals 1

    .line 1063
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1064
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;

    move-result-object v0

    return-object v0
.end method

.method public getPlaybackState()I
    .locals 1

    .line 804
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 805
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getPlaybackState()I

    move-result v0

    return v0
.end method

.method public getPlaybackSuppressionReason()I
    .locals 1

    .line 810
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 811
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getPlaybackSuppressionReason()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getPlayerError()Landroidx/media3/common/PlaybackException;
    .locals 1

    .line 71
    invoke-virtual {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->getPlayerError()Landroidx/media3/exoplayer/ExoPlaybackException;

    move-result-object v0

    return-object v0
.end method

.method public getPlayerError()Landroidx/media3/exoplayer/ExoPlaybackException;
    .locals 1

    .line 817
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 818
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getPlayerError()Landroidx/media3/exoplayer/ExoPlaybackException;

    move-result-object v0

    return-object v0
.end method

.method public getPlaylistMetadata()Landroidx/media3/common/MediaMetadata;
    .locals 1

    .line 1173
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1174
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getPlaylistMetadata()Landroidx/media3/common/MediaMetadata;

    move-result-object v0

    return-object v0
.end method

.method public getPreloadConfiguration()Landroidx/media3/exoplayer/ExoPlayer$PreloadConfiguration;
    .locals 1

    .line 1003
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1004
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getPreloadConfiguration()Landroidx/media3/exoplayer/ExoPlayer$PreloadConfiguration;

    move-result-object v0

    return-object v0
.end method

.method public getRenderer(I)Landroidx/media3/exoplayer/Renderer;
    .locals 1

    .line 1117
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1118
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getRenderer(I)Landroidx/media3/exoplayer/Renderer;

    move-result-object p1

    return-object p1
.end method

.method public getRendererCount()I
    .locals 1

    .line 1105
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1106
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getRendererCount()I

    move-result v0

    return v0
.end method

.method public getRendererType(I)I
    .locals 1

    .line 1111
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1112
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getRendererType(I)I

    move-result p1

    return p1
.end method

.method public getRepeatMode()I
    .locals 1

    .line 985
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 986
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getRepeatMode()I

    move-result v0

    return v0
.end method

.method public getSeekBackIncrement()J
    .locals 2

    .line 1039
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1040
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getSeekBackIncrement()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSeekForwardIncrement()J
    .locals 2

    .line 1045
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1046
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getSeekForwardIncrement()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSeekParameters()Landroidx/media3/exoplayer/SeekParameters;
    .locals 1

    .line 1075
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1076
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getSeekParameters()Landroidx/media3/exoplayer/SeekParameters;

    move-result-object v0

    return-object v0
.end method

.method public getShuffleModeEnabled()Z
    .locals 1

    .line 1015
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1016
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getShuffleModeEnabled()Z

    move-result v0

    return v0
.end method

.method public getSkipSilenceEnabled()Z
    .locals 1

    .line 660
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 661
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getSkipSilenceEnabled()Z

    move-result v0

    return v0
.end method

.method public getSurfaceSize()Landroidx/media3/common/util/Size;
    .locals 1

    .line 533
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 534
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getSurfaceSize()Landroidx/media3/common/util/Size;

    move-result-object v0

    return-object v0
.end method

.method public getTextComponent()Landroidx/media3/exoplayer/ExoPlayer$TextComponent;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-object p0
.end method

.method public getTotalBufferedDuration()J
    .locals 2

    .line 1221
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1222
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getTotalBufferedDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getTrackSelectionParameters()Landroidx/media3/common/TrackSelectionParameters;
    .locals 1

    .line 1155
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1156
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getTrackSelectionParameters()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object v0

    return-object v0
.end method

.method public getTrackSelector()Landroidx/media3/exoplayer/trackselection/TrackSelector;
    .locals 1

    .line 1123
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1124
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getTrackSelector()Landroidx/media3/exoplayer/trackselection/TrackSelector;

    move-result-object v0

    return-object v0
.end method

.method public getVideoChangeFrameRateStrategy()I
    .locals 1

    .line 521
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 522
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getVideoChangeFrameRateStrategy()I

    move-result v0

    return v0
.end method

.method public getVideoComponent()Landroidx/media3/exoplayer/ExoPlayer$VideoComponent;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-object p0
.end method

.method public getVideoDecoderCounters()Landroidx/media3/exoplayer/DecoderCounters;
    .locals 1

    .line 729
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 730
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getVideoDecoderCounters()Landroidx/media3/exoplayer/DecoderCounters;

    move-result-object v0

    return-object v0
.end method

.method public getVideoFormat()Landroidx/media3/common/Format;
    .locals 1

    .line 715
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 716
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getVideoFormat()Landroidx/media3/common/Format;

    move-result-object v0

    return-object v0
.end method

.method public getVideoScalingMode()I
    .locals 1

    .line 508
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 509
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getVideoScalingMode()I

    move-result v0

    return v0
.end method

.method public getVideoSize()Landroidx/media3/common/VideoSize;
    .locals 1

    .line 527
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 528
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getVideoSize()Landroidx/media3/common/VideoSize;

    move-result-object v0

    return-object v0
.end method

.method public getVolume()F
    .locals 1

    .line 654
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 655
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->getVolume()F

    move-result v0

    return v0
.end method

.method public increaseDeviceVolume()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1301
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1302
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->increaseDeviceVolume()V

    return-void
.end method

.method public increaseDeviceVolume(I)V
    .locals 1

    .line 1307
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1308
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->increaseDeviceVolume(I)V

    return-void
.end method

.method public isDeviceMuted()Z
    .locals 1

    .line 1275
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1276
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->isDeviceMuted()Z

    move-result v0

    return v0
.end method

.method public isLoading()Z
    .locals 1

    .line 1021
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1022
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->isLoading()Z

    move-result v0

    return v0
.end method

.method public isPlayingAd()Z
    .locals 1

    .line 1227
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1228
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->isPlayingAd()Z

    move-result v0

    return v0
.end method

.method public isReleased()Z
    .locals 1

    .line 1351
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->isReleased()Z

    move-result v0

    return v0
.end method

.method public isSleepingForOffload()Z
    .locals 1

    .line 452
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 453
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->isSleepingForOffload()Z

    move-result v0

    return v0
.end method

.method public isTunnelingEnabled()Z
    .locals 1

    .line 1345
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1346
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->isTunnelingEnabled()Z

    move-result v0

    return v0
.end method

.method public moveMediaItems(III)V
    .locals 1

    .line 937
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 938
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/media3/exoplayer/ExoPlayerImpl;->moveMediaItems(III)V

    return-void
.end method

.method public prepare()V
    .locals 1

    .line 829
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 830
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->prepare()V

    return-void
.end method

.method public prepare(Landroidx/media3/exoplayer/source/MediaSource;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 840
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 841
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->prepare(Landroidx/media3/exoplayer/source/MediaSource;)V

    return-void
.end method

.method public prepare(Landroidx/media3/exoplayer/source/MediaSource;ZZ)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 852
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 853
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/media3/exoplayer/ExoPlayerImpl;->prepare(Landroidx/media3/exoplayer/source/MediaSource;ZZ)V

    return-void
.end method

.method public release()V
    .locals 1

    .line 1093
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1094
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->release()V

    return-void
.end method

.method public removeAnalyticsListener(Landroidx/media3/exoplayer/analytics/AnalyticsListener;)V
    .locals 1

    .line 690
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 691
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->removeAnalyticsListener(Landroidx/media3/exoplayer/analytics/AnalyticsListener;)V

    return-void
.end method

.method public removeAudioOffloadListener(Landroidx/media3/exoplayer/ExoPlayer$AudioOffloadListener;)V
    .locals 1

    .line 599
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 600
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->removeAudioOffloadListener(Landroidx/media3/exoplayer/ExoPlayer$AudioOffloadListener;)V

    return-void
.end method

.method public removeListener(Landroidx/media3/common/Player$Listener;)V
    .locals 1

    .line 798
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 799
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->removeListener(Landroidx/media3/common/Player$Listener;)V

    return-void
.end method

.method public removeMediaItems(II)V
    .locals 1

    .line 949
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 950
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/ExoPlayerImpl;->removeMediaItems(II)V

    return-void
.end method

.method public replaceMediaItems(IILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Landroidx/media3/common/MediaItem;",
            ">;)V"
        }
    .end annotation

    .line 943
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 944
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/media3/exoplayer/ExoPlayerImpl;->replaceMediaItems(IILjava/util/List;)V

    return-void
.end method

.method public seekTo(IJIZ)V
    .locals 6

    .line 1033
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1034
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    move v1, p1

    move-wide v2, p2

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroidx/media3/exoplayer/ExoPlayerImpl;->seekTo(IJIZ)V

    return-void
.end method

.method public setAudioAttributes(Landroidx/media3/common/AudioAttributes;Z)V
    .locals 1

    .line 605
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 606
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setAudioAttributes(Landroidx/media3/common/AudioAttributes;Z)V

    return-void
.end method

.method public setAudioSessionId(I)V
    .locals 1

    .line 617
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 618
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setAudioSessionId(I)V

    return-void
.end method

.method public setAuxEffectInfo(Landroidx/media3/common/AuxEffectInfo;)V
    .locals 1

    .line 629
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 630
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setAuxEffectInfo(Landroidx/media3/common/AuxEffectInfo;)V

    return-void
.end method

.method public setCameraMotionListener(Landroidx/media3/exoplayer/video/spherical/CameraMotionListener;)V
    .locals 1

    .line 754
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 755
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setCameraMotionListener(Landroidx/media3/exoplayer/video/spherical/CameraMotionListener;)V

    return-void
.end method

.method public setDeviceMuted(Z)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1333
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1334
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setDeviceMuted(Z)V

    return-void
.end method

.method public setDeviceMuted(ZI)V
    .locals 1

    .line 1339
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1340
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setDeviceMuted(ZI)V

    return-void
.end method

.method public setDeviceVolume(I)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1285
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1286
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setDeviceVolume(I)V

    return-void
.end method

.method public setDeviceVolume(II)V
    .locals 1

    .line 1291
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1292
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setDeviceVolume(II)V

    return-void
.end method

.method public setForegroundMode(Z)V
    .locals 1

    .line 1081
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1082
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setForegroundMode(Z)V

    return-void
.end method

.method public setHandleAudioBecomingNoisy(Z)V
    .locals 1

    .line 696
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 697
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setHandleAudioBecomingNoisy(Z)V

    return-void
.end method

.method public setImageOutput(Landroidx/media3/exoplayer/image/ImageOutput;)V
    .locals 1

    .line 1356
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1357
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setImageOutput(Landroidx/media3/exoplayer/image/ImageOutput;)V

    return-void
.end method

.method public setMediaItems(Ljava/util/List;IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/common/MediaItem;",
            ">;IJ)V"
        }
    .end annotation

    .line 864
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 865
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setMediaItems(Ljava/util/List;IJ)V

    return-void
.end method

.method public setMediaItems(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/common/MediaItem;",
            ">;Z)V"
        }
    .end annotation

    .line 858
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 859
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setMediaItems(Ljava/util/List;Z)V

    return-void
.end method

.method public setMediaSource(Landroidx/media3/exoplayer/source/MediaSource;)V
    .locals 1

    .line 889
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 890
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setMediaSource(Landroidx/media3/exoplayer/source/MediaSource;)V

    return-void
.end method

.method public setMediaSource(Landroidx/media3/exoplayer/source/MediaSource;J)V
    .locals 1

    .line 901
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 902
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setMediaSource(Landroidx/media3/exoplayer/source/MediaSource;J)V

    return-void
.end method

.method public setMediaSource(Landroidx/media3/exoplayer/source/MediaSource;Z)V
    .locals 1

    .line 895
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 896
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setMediaSource(Landroidx/media3/exoplayer/source/MediaSource;Z)V

    return-void
.end method

.method public setMediaSources(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/source/MediaSource;",
            ">;)V"
        }
    .end annotation

    .line 870
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 871
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setMediaSources(Ljava/util/List;)V

    return-void
.end method

.method public setMediaSources(Ljava/util/List;IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/source/MediaSource;",
            ">;IJ)V"
        }
    .end annotation

    .line 883
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 884
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setMediaSources(Ljava/util/List;IJ)V

    return-void
.end method

.method public setMediaSources(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/source/MediaSource;",
            ">;Z)V"
        }
    .end annotation

    .line 876
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 877
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setMediaSources(Ljava/util/List;Z)V

    return-void
.end method

.method public setPauseAtEndOfMediaItems(Z)V
    .locals 1

    .line 973
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 974
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setPauseAtEndOfMediaItems(Z)V

    return-void
.end method

.method public setPlayWhenReady(Z)V
    .locals 1

    .line 961
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 962
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setPlayWhenReady(Z)V

    return-void
.end method

.method public setPlaybackParameters(Landroidx/media3/common/PlaybackParameters;)V
    .locals 1

    .line 1057
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1058
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setPlaybackParameters(Landroidx/media3/common/PlaybackParameters;)V

    return-void
.end method

.method public setPlaylistMetadata(Landroidx/media3/common/MediaMetadata;)V
    .locals 1

    .line 1179
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1180
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setPlaylistMetadata(Landroidx/media3/common/MediaMetadata;)V

    return-void
.end method

.method public setPreferredAudioDevice(Landroid/media/AudioDeviceInfo;)V
    .locals 1

    .line 642
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 643
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setPreferredAudioDevice(Landroid/media/AudioDeviceInfo;)V

    return-void
.end method

.method public setPreloadConfiguration(Landroidx/media3/exoplayer/ExoPlayer$PreloadConfiguration;)V
    .locals 1

    .line 997
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 998
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setPreloadConfiguration(Landroidx/media3/exoplayer/ExoPlayer$PreloadConfiguration;)V

    return-void
.end method

.method public setPriority(I)V
    .locals 1

    .line 702
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 703
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setPriority(I)V

    return-void
.end method

.method public setPriorityTaskManager(Landroidx/media3/common/PriorityTaskManager;)V
    .locals 1

    .line 708
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 709
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setPriorityTaskManager(Landroidx/media3/common/PriorityTaskManager;)V

    return-void
.end method

.method public setRepeatMode(I)V
    .locals 1

    .line 991
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 992
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setRepeatMode(I)V

    return-void
.end method

.method public setSeekParameters(Landroidx/media3/exoplayer/SeekParameters;)V
    .locals 1

    .line 1069
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1070
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setSeekParameters(Landroidx/media3/exoplayer/SeekParameters;)V

    return-void
.end method

.method public setShuffleModeEnabled(Z)V
    .locals 1

    .line 1009
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1010
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setShuffleModeEnabled(Z)V

    return-void
.end method

.method public setShuffleOrder(Landroidx/media3/exoplayer/source/ShuffleOrder;)V
    .locals 1

    .line 955
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 956
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setShuffleOrder(Landroidx/media3/exoplayer/source/ShuffleOrder;)V

    return-void
.end method

.method public setSkipSilenceEnabled(Z)V
    .locals 1

    .line 672
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 673
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setSkipSilenceEnabled(Z)V

    return-void
.end method

.method setThrowsWhenUsingWrongThread(Z)V
    .locals 1

    .line 1361
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1362
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setThrowsWhenUsingWrongThread(Z)V

    return-void
.end method

.method public setTrackSelectionParameters(Landroidx/media3/common/TrackSelectionParameters;)V
    .locals 1

    .line 1161
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1162
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setTrackSelectionParameters(Landroidx/media3/common/TrackSelectionParameters;)V

    return-void
.end method

.method public setVideoChangeFrameRateStrategy(I)V
    .locals 1

    .line 515
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 516
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setVideoChangeFrameRateStrategy(I)V

    return-void
.end method

.method public setVideoEffects(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/common/Effect;",
            ">;)V"
        }
    .end annotation

    .line 666
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 667
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setVideoEffects(Ljava/util/List;)V

    return-void
.end method

.method public setVideoFrameMetadataListener(Landroidx/media3/exoplayer/video/VideoFrameMetadataListener;)V
    .locals 1

    .line 742
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 743
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setVideoFrameMetadataListener(Landroidx/media3/exoplayer/video/VideoFrameMetadataListener;)V

    return-void
.end method

.method public setVideoScalingMode(I)V
    .locals 1

    .line 502
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 503
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setVideoScalingMode(I)V

    return-void
.end method

.method public setVideoSurface(Landroid/view/Surface;)V
    .locals 1

    .line 551
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 552
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setVideoSurface(Landroid/view/Surface;)V

    return-void
.end method

.method public setVideoSurfaceHolder(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 557
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 558
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setVideoSurfaceHolder(Landroid/view/SurfaceHolder;)V

    return-void
.end method

.method public setVideoSurfaceView(Landroid/view/SurfaceView;)V
    .locals 1

    .line 569
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 570
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setVideoSurfaceView(Landroid/view/SurfaceView;)V

    return-void
.end method

.method public setVideoTextureView(Landroid/view/TextureView;)V
    .locals 1

    .line 581
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 582
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setVideoTextureView(Landroid/view/TextureView;)V

    return-void
.end method

.method public setVolume(F)V
    .locals 1

    .line 648
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 649
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setVolume(F)V

    return-void
.end method

.method public setWakeMode(I)V
    .locals 1

    .line 1257
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1258
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl;->setWakeMode(I)V

    return-void
.end method

.method public stop()V
    .locals 1

    .line 1087
    invoke-direct {p0}, Landroidx/media3/exoplayer/SimpleExoPlayer;->blockUntilConstructorFinished()V

    .line 1088
    iget-object v0, p0, Landroidx/media3/exoplayer/SimpleExoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayerImpl;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->stop()V

    return-void
.end method
