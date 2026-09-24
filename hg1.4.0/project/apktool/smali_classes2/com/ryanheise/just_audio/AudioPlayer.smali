.class public Lcom/ryanheise/just_audio/AudioPlayer;
.super Ljava/lang/Object;
.source "AudioPlayer.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;
.implements Landroidx/media3/common/Player$Listener;
.implements Landroidx/media3/exoplayer/metadata/MetadataOutput;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;
    }
.end annotation


# static fields
.field static final TAG:Ljava/lang/String; = "AudioPlayer"

.field private static random:Ljava/util/Random;


# instance fields
.field private audioEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/media/audiofx/AudioEffect;",
            ">;"
        }
    .end annotation
.end field

.field private audioEffectsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/media/audiofx/AudioEffect;",
            ">;"
        }
    .end annotation
.end field

.field private audioSessionId:Ljava/lang/Integer;

.field private final bufferWatcher:Ljava/lang/Runnable;

.field private bufferedPosition:J

.field private final context:Landroid/content/Context;

.field private currentIndex:Ljava/lang/Integer;

.field private final dataEventChannel:Lcom/ryanheise/just_audio/BetterEventChannel;

.field private errorCount:I

.field private final eventChannel:Lcom/ryanheise/just_audio/BetterEventChannel;

.field private final handler:Landroid/os/Handler;

.field private icyHeaders:Landroidx/media3/extractor/metadata/icy/IcyHeaders;

.field private icyInfo:Landroidx/media3/extractor/metadata/icy/IcyInfo;

.field private initialIndex:Ljava/lang/Integer;

.field private initialPos:J

.field private lastPlaylistLength:I

.field private livePlaybackSpeedControl:Landroidx/media3/exoplayer/LivePlaybackSpeedControl;

.field private loadControl:Landroidx/media3/exoplayer/LoadControl;

.field private mediaSource:Landroidx/media3/exoplayer/source/MediaSource;

.field private mediaSources:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/media3/exoplayer/source/MediaSource;",
            ">;"
        }
    .end annotation
.end field

.field private final methodChannel:Lio/flutter/plugin/common/MethodChannel;

.field private offloadSchedulingEnabled:Z

.field private pendingAudioAttributes:Landroidx/media3/common/AudioAttributes;

.field private pendingPlaybackEvent:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private playResult:Lio/flutter/plugin/common/MethodChannel$Result;

.field private player:Landroidx/media3/exoplayer/ExoPlayer;

.field private prepareResult:Lio/flutter/plugin/common/MethodChannel$Result;

.field private processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

.field private rawAudioEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private seekPos:Ljava/lang/Long;

.field private seekResult:Lio/flutter/plugin/common/MethodChannel$Result;

.field private updatePosition:J

.field private updateTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 72
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/ryanheise/just_audio/AudioPlayer;->random:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Ljava/util/Map;Ljava/util/List;Ljava/lang/Boolean;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lio/flutter/plugin/common/BinaryMessenger;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "**>;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Boolean;",
            ")V"
        }
    .end annotation

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->mediaSources:Ljava/util/Map;

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioEffects:Ljava/util/List;

    .line 99
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioEffectsMap:Ljava/util/Map;

    const/4 v0, 0x0

    .line 100
    iput v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->lastPlaylistLength:I

    .line 107
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->handler:Landroid/os/Handler;

    .line 108
    new-instance v1, Lcom/ryanheise/just_audio/AudioPlayer$1;

    invoke-direct {v1, p0}, Lcom/ryanheise/just_audio/AudioPlayer$1;-><init>(Lcom/ryanheise/just_audio/AudioPlayer;)V

    iput-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->bufferWatcher:Ljava/lang/Runnable;

    .line 145
    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->context:Landroid/content/Context;

    .line 146
    iput-object p5, p0, Lcom/ryanheise/just_audio/AudioPlayer;->rawAudioEffects:Ljava/util/List;

    if-eqz p6, :cond_0

    .line 147
    invoke-virtual {p6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->offloadSchedulingEnabled:Z

    .line 148
    new-instance p1, Lio/flutter/plugin/common/MethodChannel;

    new-instance p5, Ljava/lang/StringBuilder;

    const-string p6, "com.ryanheise.just_audio.methods."

    invoke-direct {p5, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-direct {p1, p2, p5}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 149
    invoke-virtual {p1, p0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 150
    new-instance p1, Lcom/ryanheise/just_audio/BetterEventChannel;

    new-instance p5, Ljava/lang/StringBuilder;

    const-string p6, "com.ryanheise.just_audio.events."

    invoke-direct {p5, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-direct {p1, p2, p5}, Lcom/ryanheise/just_audio/BetterEventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->eventChannel:Lcom/ryanheise/just_audio/BetterEventChannel;

    .line 151
    new-instance p1, Lcom/ryanheise/just_audio/BetterEventChannel;

    new-instance p5, Ljava/lang/StringBuilder;

    const-string p6, "com.ryanheise.just_audio.data."

    invoke-direct {p5, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, p2, p3}, Lcom/ryanheise/just_audio/BetterEventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->dataEventChannel:Lcom/ryanheise/just_audio/BetterEventChannel;

    .line 152
    sget-object p1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->none:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-eqz p4, :cond_3

    .line 154
    const-string p1, "androidLoadControl"

    invoke-interface {p4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    const-wide/16 p2, 0x3e8

    if-eqz p1, :cond_2

    .line 156
    new-instance p5, Landroidx/media3/exoplayer/DefaultLoadControl$Builder;

    invoke-direct {p5}, Landroidx/media3/exoplayer/DefaultLoadControl$Builder;-><init>()V

    const-string p6, "minBufferDuration"

    .line 158
    invoke-interface {p1, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p6

    invoke-static {p6}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p6

    invoke-virtual {p6}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    div-long/2addr v1, p2

    long-to-int p6, v1

    const-string v1, "maxBufferDuration"

    .line 159
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    div-long/2addr v1, p2

    long-to-int v2, v1

    const-string v1, "bufferForPlaybackDuration"

    .line 160
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    div-long/2addr v3, p2

    long-to-int v1, v3

    const-string v3, "bufferForPlaybackAfterRebufferDuration"

    .line 161
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    div-long/2addr v3, p2

    long-to-int v4, v3

    .line 157
    invoke-virtual {p5, p6, v2, v1, v4}, Landroidx/media3/exoplayer/DefaultLoadControl$Builder;->setBufferDurationsMs(IIII)Landroidx/media3/exoplayer/DefaultLoadControl$Builder;

    move-result-object p5

    const-string p6, "prioritizeTimeOverSizeThresholds"

    .line 163
    invoke-interface {p1, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Ljava/lang/Boolean;

    invoke-virtual {p6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p6

    invoke-virtual {p5, p6}, Landroidx/media3/exoplayer/DefaultLoadControl$Builder;->setPrioritizeTimeOverSizeThresholds(Z)Landroidx/media3/exoplayer/DefaultLoadControl$Builder;

    move-result-object p5

    const-string p6, "backBufferDuration"

    .line 164
    invoke-interface {p1, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p6

    invoke-static {p6}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p6

    invoke-virtual {p6}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    div-long/2addr v1, p2

    long-to-int p6, v1

    invoke-virtual {p5, p6, v0}, Landroidx/media3/exoplayer/DefaultLoadControl$Builder;->setBackBuffer(IZ)Landroidx/media3/exoplayer/DefaultLoadControl$Builder;

    move-result-object p5

    .line 165
    const-string p6, "targetBufferBytes"

    invoke-interface {p1, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 166
    invoke-interface {p1, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p5, p1}, Landroidx/media3/exoplayer/DefaultLoadControl$Builder;->setTargetBufferBytes(I)Landroidx/media3/exoplayer/DefaultLoadControl$Builder;

    .line 168
    :cond_1
    invoke-virtual {p5}, Landroidx/media3/exoplayer/DefaultLoadControl$Builder;->build()Landroidx/media3/exoplayer/DefaultLoadControl;

    move-result-object p1

    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->loadControl:Landroidx/media3/exoplayer/LoadControl;

    .line 170
    :cond_2
    const-string p1, "androidLivePlaybackSpeedControl"

    invoke-interface {p4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    if-eqz p1, :cond_3

    .line 172
    new-instance p4, Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;

    invoke-direct {p4}, Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;-><init>()V

    const-string p5, "fallbackMinPlaybackSpeed"

    .line 173
    invoke-interface {p1, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Double;

    invoke-virtual {p5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p5

    double-to-float p5, p5

    invoke-virtual {p4, p5}, Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;->setFallbackMinPlaybackSpeed(F)Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;

    move-result-object p4

    const-string p5, "fallbackMaxPlaybackSpeed"

    .line 174
    invoke-interface {p1, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Double;

    invoke-virtual {p5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p5

    double-to-float p5, p5

    invoke-virtual {p4, p5}, Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;->setFallbackMaxPlaybackSpeed(F)Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;

    move-result-object p4

    const-string p5, "minUpdateInterval"

    .line 175
    invoke-interface {p1, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    invoke-static {p5}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Long;->longValue()J

    move-result-wide p5

    div-long/2addr p5, p2

    invoke-virtual {p4, p5, p6}, Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;->setMinUpdateIntervalMs(J)Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;

    move-result-object p4

    const-string p5, "proportionalControlFactor"

    .line 176
    invoke-interface {p1, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Double;

    invoke-virtual {p5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p5

    double-to-float p5, p5

    invoke-virtual {p4, p5}, Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;->setProportionalControlFactor(F)Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;

    move-result-object p4

    const-string p5, "maxLiveOffsetErrorForUnitSpeed"

    .line 177
    invoke-interface {p1, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    invoke-static {p5}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Long;->longValue()J

    move-result-wide p5

    div-long/2addr p5, p2

    invoke-virtual {p4, p5, p6}, Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;->setMaxLiveOffsetErrorMsForUnitSpeed(J)Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;

    move-result-object p4

    const-string p5, "targetLiveOffsetIncrementOnRebuffer"

    .line 178
    invoke-interface {p1, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    invoke-static {p5}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Long;->longValue()J

    move-result-wide p5

    div-long/2addr p5, p2

    invoke-virtual {p4, p5, p6}, Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;->setTargetLiveOffsetIncrementOnRebufferMs(J)Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;

    move-result-object p2

    const-string p3, "minPossibleLiveOffsetSmoothingFactor"

    .line 179
    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p3

    double-to-float p1, p3

    invoke-virtual {p2, p1}, Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;->setMinPossibleLiveOffsetSmoothingFactor(F)Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;

    move-result-object p1

    .line 180
    invoke-virtual {p1}, Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl$Builder;->build()Landroidx/media3/exoplayer/DefaultLivePlaybackSpeedControl;

    move-result-object p1

    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->livePlaybackSpeedControl:Landroidx/media3/exoplayer/LivePlaybackSpeedControl;

    :cond_3
    return-void
.end method

.method private abortExistingConnection()V
    .locals 2

    .line 1076
    const-string v0, "abort"

    const-string v1, "Connection aborted"

    invoke-direct {p0, v0, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->sendError(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private abortSeek()V
    .locals 2

    .line 1064
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekResult:Lio/flutter/plugin/common/MethodChannel$Result;

    if-eqz v0, :cond_0

    .line 1066
    :try_start_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v0, 0x0

    .line 1070
    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 1071
    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekPos:Ljava/lang/Long;

    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/ryanheise/just_audio/AudioPlayer;)Landroidx/media3/exoplayer/ExoPlayer;
    .locals 0

    .line 68
    iget-object p0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    return-object p0
.end method

.method static synthetic access$100(Lcom/ryanheise/just_audio/AudioPlayer;)J
    .locals 2

    .line 68
    iget-wide v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->bufferedPosition:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/ryanheise/just_audio/AudioPlayer;)V
    .locals 0

    .line 68
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastImmediatePlaybackEvent()V

    return-void
.end method

.method static synthetic access$300(Lcom/ryanheise/just_audio/AudioPlayer;)Landroid/os/Handler;
    .locals 0

    .line 68
    iget-object p0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method private audioEffectSetEnabled(Ljava/lang/String;Z)V
    .locals 1

    .line 821
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioEffectsMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/audiofx/AudioEffect;

    invoke-virtual {p1, p2}, Landroid/media/audiofx/AudioEffect;->setEnabled(Z)I

    return-void
.end method

.method private broadcastImmediatePlaybackEvent()V
    .locals 0

    .line 895
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->enqueuePlaybackEvent()V

    .line 896
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastPendingPlaybackEvent()V

    return-void
.end method

.method private broadcastPendingPlaybackEvent()V
    .locals 2

    .line 872
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->pendingPlaybackEvent:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 873
    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->eventChannel:Lcom/ryanheise/just_audio/BetterEventChannel;

    invoke-virtual {v1, v0}, Lcom/ryanheise/just_audio/BetterEventChannel;->success(Ljava/lang/Object;)V

    const/4 v0, 0x0

    .line 874
    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->pendingPlaybackEvent:Ljava/util/Map;

    :cond_0
    return-void
.end method

.method private buildDataSourceFactory(Ljava/util/Map;)Landroidx/media3/datasource/DataSource$Factory;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;)",
            "Landroidx/media3/datasource/DataSource$Factory;"
        }
    .end annotation

    .line 720
    invoke-static {p1}, Lcom/ryanheise/just_audio/AudioPlayer;->castToStringMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 723
    const-string v0, "User-Agent"

    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_1

    .line 725
    const-string v0, "user-agent"

    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :cond_1
    :goto_0
    if-nez v0, :cond_2

    .line 729
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->context:Landroid/content/Context;

    const-string v1, "just_audio"

    invoke-static {v0, v1}, Landroidx/media3/common/util/Util;->getUserAgent(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 731
    :cond_2
    new-instance v1, Landroidx/media3/datasource/DefaultHttpDataSource$Factory;

    invoke-direct {v1}, Landroidx/media3/datasource/DefaultHttpDataSource$Factory;-><init>()V

    .line 732
    invoke-virtual {v1, v0}, Landroidx/media3/datasource/DefaultHttpDataSource$Factory;->setUserAgent(Ljava/lang/String;)Landroidx/media3/datasource/DefaultHttpDataSource$Factory;

    move-result-object v0

    const/4 v1, 0x1

    .line 733
    invoke-virtual {v0, v1}, Landroidx/media3/datasource/DefaultHttpDataSource$Factory;->setAllowCrossProtocolRedirects(Z)Landroidx/media3/datasource/DefaultHttpDataSource$Factory;

    move-result-object v0

    if-eqz p1, :cond_3

    .line 734
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 735
    invoke-virtual {v0, p1}, Landroidx/media3/datasource/DefaultHttpDataSource$Factory;->setDefaultRequestProperties(Ljava/util/Map;)Landroidx/media3/datasource/DefaultHttpDataSource$Factory;

    .line 737
    :cond_3
    new-instance p1, Landroidx/media3/datasource/DefaultDataSource$Factory;

    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->context:Landroid/content/Context;

    invoke-direct {p1, v1, v0}, Landroidx/media3/datasource/DefaultDataSource$Factory;-><init>(Landroid/content/Context;Landroidx/media3/datasource/DataSource$Factory;)V

    return-object p1
.end method

.method private buildExtractorsFactory(Ljava/util/Map;)Landroidx/media3/extractor/DefaultExtractorsFactory;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;)",
            "Landroidx/media3/extractor/DefaultExtractorsFactory;"
        }
    .end annotation

    .line 601
    new-instance v0, Landroidx/media3/extractor/DefaultExtractorsFactory;

    invoke-direct {v0}, Landroidx/media3/extractor/DefaultExtractorsFactory;-><init>()V

    if-eqz p1, :cond_0

    .line 606
    const-string v1, "androidExtractorOptions"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    if-eqz p1, :cond_0

    .line 608
    const-string v1, "constantBitrateSeekingEnabled"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 609
    const-string v2, "constantBitrateSeekingAlwaysEnabled"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 610
    const-string v3, "mp3Flags"

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 p1, 0x0

    .line 613
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/media3/extractor/DefaultExtractorsFactory;->setConstantBitrateSeekingEnabled(Z)Landroidx/media3/extractor/DefaultExtractorsFactory;

    .line 614
    invoke-virtual {v0, v2}, Landroidx/media3/extractor/DefaultExtractorsFactory;->setConstantBitrateSeekingAlwaysEnabled(Z)Landroidx/media3/extractor/DefaultExtractorsFactory;

    .line 615
    invoke-virtual {v0, p1}, Landroidx/media3/extractor/DefaultExtractorsFactory;->setMp3ExtractorFlags(I)Landroidx/media3/extractor/DefaultExtractorsFactory;

    return-object v0
.end method

.method static castToStringMap(Ljava/util/Map;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1106
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1107
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1108
    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private clearAudioEffects()V
    .locals 2

    .line 711
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioEffects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 712
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/audiofx/AudioEffect;

    .line 713
    invoke-virtual {v1}, Landroid/media/audiofx/AudioEffect;->release()V

    .line 714
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 716
    :cond_0
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioEffectsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method private collectIcyMetadata()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 900
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 901
    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyInfo:Landroidx/media3/extractor/metadata/icy/IcyInfo;

    const-string v2, "url"

    if-eqz v1, :cond_0

    .line 902
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 903
    iget-object v3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyInfo:Landroidx/media3/extractor/metadata/icy/IcyInfo;

    iget-object v3, v3, Landroidx/media3/extractor/metadata/icy/IcyInfo;->title:Ljava/lang/String;

    const-string v4, "title"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 904
    iget-object v3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyInfo:Landroidx/media3/extractor/metadata/icy/IcyInfo;

    iget-object v3, v3, Landroidx/media3/extractor/metadata/icy/IcyInfo;->url:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 905
    const-string v3, "info"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 907
    :cond_0
    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyHeaders:Landroidx/media3/extractor/metadata/icy/IcyHeaders;

    if-eqz v1, :cond_1

    .line 908
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 909
    iget-object v3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyHeaders:Landroidx/media3/extractor/metadata/icy/IcyHeaders;

    iget v3, v3, Landroidx/media3/extractor/metadata/icy/IcyHeaders;->bitrate:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "bitrate"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 910
    iget-object v3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyHeaders:Landroidx/media3/extractor/metadata/icy/IcyHeaders;

    iget-object v3, v3, Landroidx/media3/extractor/metadata/icy/IcyHeaders;->genre:Ljava/lang/String;

    const-string v4, "genre"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 911
    iget-object v3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyHeaders:Landroidx/media3/extractor/metadata/icy/IcyHeaders;

    iget-object v3, v3, Landroidx/media3/extractor/metadata/icy/IcyHeaders;->name:Ljava/lang/String;

    const-string v4, "name"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 912
    iget-object v3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyHeaders:Landroidx/media3/extractor/metadata/icy/IcyHeaders;

    iget v3, v3, Landroidx/media3/extractor/metadata/icy/IcyHeaders;->metadataInterval:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "metadataInterval"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 913
    iget-object v3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyHeaders:Landroidx/media3/extractor/metadata/icy/IcyHeaders;

    iget-object v3, v3, Landroidx/media3/extractor/metadata/icy/IcyHeaders;->url:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 914
    iget-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyHeaders:Landroidx/media3/extractor/metadata/icy/IcyHeaders;

    iget-boolean v2, v2, Landroidx/media3/extractor/metadata/icy/IcyHeaders;->isPublic:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "isPublic"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 915
    const-string v2, "headers"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object v0
.end method

.method private completeSeek()V
    .locals 3

    const/4 v0, 0x0

    .line 409
    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekPos:Ljava/lang/Long;

    .line 410
    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekResult:Lio/flutter/plugin/common/MethodChannel$Result;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v1, v2}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 411
    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekResult:Lio/flutter/plugin/common/MethodChannel$Result;

    return-void
.end method

.method private concatenating(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;
    .locals 1

    .line 565
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->mediaSources:Ljava/util/Map;

    check-cast p1, Ljava/lang/String;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;

    return-object p1
.end method

.method private createPlaybackEvent()Ljava/util/Map;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 856
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 857
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->getDuration()J

    move-result-wide v1

    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    const-wide/16 v5, 0x3e8

    cmp-long v7, v1, v3

    if-nez v7, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->getDuration()J

    move-result-wide v1

    mul-long v1, v1, v5

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 858
    :goto_0
    iget-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz v2, :cond_1

    invoke-interface {v2}, Landroidx/media3/exoplayer/ExoPlayer;->getBufferedPosition()J

    move-result-wide v2

    goto :goto_1

    :cond_1
    const-wide/16 v2, 0x0

    :goto_1
    iput-wide v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->bufferedPosition:J

    .line 859
    iget-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    invoke-virtual {v2}, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->ordinal()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "processingState"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 860
    iget-wide v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition:J

    mul-long v2, v2, v5

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v3, "updatePosition"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 861
    iget-wide v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->updateTime:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v3, "updateTime"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 862
    iget-wide v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition:J

    iget-wide v7, p0, Lcom/ryanheise/just_audio/AudioPlayer;->bufferedPosition:J

    invoke-static {v2, v3, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    mul-long v2, v2, v5

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v3, "bufferedPosition"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 863
    const-string v2, "icyMetadata"

    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->collectIcyMetadata()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 864
    const-string v2, "duration"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 865
    const-string v1, "currentIndex"

    iget-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->currentIndex:Ljava/lang/Integer;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 866
    const-string v1, "androidAudioSessionId"

    iget-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioSessionId:Ljava/lang/Integer;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private createShuffleOrder(ILjava/lang/Integer;)Landroidx/media3/exoplayer/source/ShuffleOrder;
    .locals 2

    .line 558
    invoke-static {p1, p2}, Lcom/ryanheise/just_audio/AudioPlayer;->shuffle(ILjava/lang/Integer;)[I

    move-result-object p1

    .line 559
    new-instance p2, Landroidx/media3/exoplayer/source/ShuffleOrder$DefaultShuffleOrder;

    sget-object v0, Lcom/ryanheise/just_audio/AudioPlayer;->random:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    invoke-direct {p2, p1, v0, v1}, Landroidx/media3/exoplayer/source/ShuffleOrder$DefaultShuffleOrder;-><init>([IJ)V

    return-object p2
.end method

.method private decodeAudioEffect(Ljava/lang/Object;I)Landroid/media/audiofx/AudioEffect;
    .locals 4

    .line 692
    check-cast p1, Ljava/util/Map;

    .line 693
    const-string v0, "type"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 694
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    const-string v2, "AndroidEqualizer"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "AndroidLoudnessEnhancer"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 698
    const-string v0, "targetGain"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide v2, 0x408f400000000000L    # 1000.0

    mul-double v0, v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int p1, v0

    .line 699
    new-instance v0, Landroid/media/audiofx/LoudnessEnhancer;

    invoke-direct {v0, p2}, Landroid/media/audiofx/LoudnessEnhancer;-><init>(I)V

    .line 700
    invoke-virtual {v0, p1}, Landroid/media/audiofx/LoudnessEnhancer;->setTargetGain(I)V

    return-object v0

    .line 706
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown AudioEffect type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 703
    :cond_1
    new-instance p1, Landroid/media/audiofx/Equalizer;

    const/4 v0, 0x0

    invoke-direct {p1, v0, p2}, Landroid/media/audiofx/Equalizer;-><init>(II)V

    return-object p1
.end method

.method private decodeAudioSource(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/MediaSource;
    .locals 10

    .line 621
    check-cast p1, Ljava/util/Map;

    .line 622
    const-string v0, "id"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 623
    const-string v1, "type"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, -0x1

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v3, "silence"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v5, 0x6

    goto :goto_0

    :sswitch_1
    const-string v3, "progressive"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v5, 0x5

    goto :goto_0

    :sswitch_2
    const-string v3, "clipping"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    const/4 v5, 0x4

    goto :goto_0

    :sswitch_3
    const-string v3, "looping"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0

    :cond_3
    const/4 v5, 0x3

    goto :goto_0

    :sswitch_4
    const-string v3, "dash"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_0

    :cond_4
    const/4 v5, 0x2

    goto :goto_0

    :sswitch_5
    const-string v3, "hls"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    goto :goto_0

    :cond_5
    const/4 v5, 0x1

    goto :goto_0

    :sswitch_6
    const-string v3, "concatenating"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    goto :goto_0

    :cond_6
    const/4 v5, 0x0

    .line 670
    :goto_0
    const-string v2, "child"

    const-string v3, "uri"

    const-string v6, "headers"

    packed-switch v5, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unknown AudioSource type: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 644
    :pswitch_0
    new-instance v1, Landroidx/media3/exoplayer/source/SilenceMediaSource$Factory;

    invoke-direct {v1}, Landroidx/media3/exoplayer/source/SilenceMediaSource$Factory;-><init>()V

    const-string v2, "duration"

    .line 645
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroidx/media3/exoplayer/source/SilenceMediaSource$Factory;->setDurationUs(J)Landroidx/media3/exoplayer/source/SilenceMediaSource$Factory;

    move-result-object p1

    .line 646
    invoke-virtual {p1, v0}, Landroidx/media3/exoplayer/source/SilenceMediaSource$Factory;->setTag(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/SilenceMediaSource$Factory;

    move-result-object p1

    .line 647
    invoke-virtual {p1}, Landroidx/media3/exoplayer/source/SilenceMediaSource$Factory;->createMediaSource()Landroidx/media3/exoplayer/source/SilenceMediaSource;

    move-result-object p1

    return-object p1

    .line 625
    :pswitch_1
    new-instance v1, Landroidx/media3/exoplayer/source/ProgressiveMediaSource$Factory;

    invoke-static {p1, v6}, Lcom/ryanheise/just_audio/AudioPlayer;->mapGet(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-direct {p0, v2}, Lcom/ryanheise/just_audio/AudioPlayer;->buildDataSourceFactory(Ljava/util/Map;)Landroidx/media3/datasource/DataSource$Factory;

    move-result-object v2

    const-string v4, "options"

    invoke-static {p1, v4}, Lcom/ryanheise/just_audio/AudioPlayer;->mapGet(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    invoke-direct {p0, v4}, Lcom/ryanheise/just_audio/AudioPlayer;->buildExtractorsFactory(Ljava/util/Map;)Landroidx/media3/extractor/DefaultExtractorsFactory;

    move-result-object v4

    invoke-direct {v1, v2, v4}, Landroidx/media3/exoplayer/source/ProgressiveMediaSource$Factory;-><init>(Landroidx/media3/datasource/DataSource$Factory;Landroidx/media3/extractor/ExtractorsFactory;)V

    new-instance v2, Landroidx/media3/common/MediaItem$Builder;

    invoke-direct {v2}, Landroidx/media3/common/MediaItem$Builder;-><init>()V

    .line 627
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroidx/media3/common/MediaItem$Builder;->setUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object p1

    .line 628
    invoke-virtual {p1, v0}, Landroidx/media3/common/MediaItem$Builder;->setTag(Ljava/lang/Object;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object p1

    .line 629
    invoke-virtual {p1}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object p1

    .line 626
    invoke-virtual {v1, p1}, Landroidx/media3/exoplayer/source/ProgressiveMediaSource$Factory;->createMediaSource(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/source/ProgressiveMediaSource;

    move-result-object p1

    return-object p1

    .line 656
    :pswitch_2
    const-string v0, "start"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v0

    .line 657
    const-string v1, "end"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    .line 658
    new-instance v9, Landroidx/media3/exoplayer/source/ClippingMediaSource;

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ryanheise/just_audio/AudioPlayer;->getAudioSource(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/MediaSource;

    move-result-object v4

    if-eqz v0, :cond_7

    .line 659
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    goto :goto_1

    :cond_7
    const-wide/16 v2, 0x0

    :goto_1
    move-wide v5, v2

    if-eqz v1, :cond_8

    .line 660
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_2

    :cond_8
    const-wide/high16 v0, -0x8000000000000000L

    :goto_2
    move-wide v7, v0

    move-object v3, v9

    invoke-direct/range {v3 .. v8}, Landroidx/media3/exoplayer/source/ClippingMediaSource;-><init>(Landroidx/media3/exoplayer/source/MediaSource;JJ)V

    return-object v9

    .line 662
    :pswitch_3
    const-string v0, "count"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 663
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ryanheise/just_audio/AudioPlayer;->getAudioSource(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/MediaSource;

    move-result-object p1

    .line 664
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    new-array v1, v0, [Landroidx/media3/exoplayer/source/MediaSource;

    :goto_3
    if-ge v4, v0, :cond_9

    .line 666
    aput-object p1, v1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 668
    :cond_9
    new-instance p1, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;

    invoke-direct {p1, v1}, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;-><init>([Landroidx/media3/exoplayer/source/MediaSource;)V

    return-object p1

    .line 631
    :pswitch_4
    new-instance v1, Landroidx/media3/exoplayer/dash/DashMediaSource$Factory;

    invoke-static {p1, v6}, Lcom/ryanheise/just_audio/AudioPlayer;->mapGet(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-direct {p0, v2}, Lcom/ryanheise/just_audio/AudioPlayer;->buildDataSourceFactory(Ljava/util/Map;)Landroidx/media3/datasource/DataSource$Factory;

    move-result-object v2

    invoke-direct {v1, v2}, Landroidx/media3/exoplayer/dash/DashMediaSource$Factory;-><init>(Landroidx/media3/datasource/DataSource$Factory;)V

    new-instance v2, Landroidx/media3/common/MediaItem$Builder;

    invoke-direct {v2}, Landroidx/media3/common/MediaItem$Builder;-><init>()V

    .line 633
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroidx/media3/common/MediaItem$Builder;->setUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object p1

    const-string v2, "application/dash+xml"

    .line 634
    invoke-virtual {p1, v2}, Landroidx/media3/common/MediaItem$Builder;->setMimeType(Ljava/lang/String;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object p1

    .line 635
    invoke-virtual {p1, v0}, Landroidx/media3/common/MediaItem$Builder;->setTag(Ljava/lang/Object;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object p1

    .line 636
    invoke-virtual {p1}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object p1

    .line 632
    invoke-virtual {v1, p1}, Landroidx/media3/exoplayer/dash/DashMediaSource$Factory;->createMediaSource(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/dash/DashMediaSource;

    move-result-object p1

    return-object p1

    .line 638
    :pswitch_5
    new-instance v0, Landroidx/media3/exoplayer/hls/HlsMediaSource$Factory;

    invoke-static {p1, v6}, Lcom/ryanheise/just_audio/AudioPlayer;->mapGet(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-direct {p0, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->buildDataSourceFactory(Ljava/util/Map;)Landroidx/media3/datasource/DataSource$Factory;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/media3/exoplayer/hls/HlsMediaSource$Factory;-><init>(Landroidx/media3/datasource/DataSource$Factory;)V

    new-instance v1, Landroidx/media3/common/MediaItem$Builder;

    invoke-direct {v1}, Landroidx/media3/common/MediaItem$Builder;-><init>()V

    .line 640
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroidx/media3/common/MediaItem$Builder;->setUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object p1

    const-string v1, "application/x-mpegURL"

    .line 641
    invoke-virtual {p1, v1}, Landroidx/media3/common/MediaItem$Builder;->setMimeType(Ljava/lang/String;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object p1

    .line 642
    invoke-virtual {p1}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object p1

    .line 639
    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/hls/HlsMediaSource$Factory;->createMediaSource(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/hls/HlsMediaSource;

    move-result-object p1

    return-object p1

    .line 649
    :pswitch_6
    const-string v0, "children"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/ryanheise/just_audio/AudioPlayer;->getAudioSourcesArray(Ljava/lang/Object;)[Landroidx/media3/exoplayer/source/MediaSource;

    move-result-object v0

    .line 650
    new-instance v1, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;

    const-string v2, "useLazyPreparation"

    .line 652
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    const-string v3, "shuffleOrder"

    .line 653
    invoke-static {p1, v3}, Lcom/ryanheise/just_audio/AudioPlayer;->mapGet(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-direct {p0, p1}, Lcom/ryanheise/just_audio/AudioPlayer;->decodeShuffleOrder(Ljava/util/List;)Landroidx/media3/exoplayer/source/ShuffleOrder;

    move-result-object p1

    invoke-direct {v1, v4, v2, p1, v0}, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;-><init>(ZZLandroidx/media3/exoplayer/source/ShuffleOrder;[Landroidx/media3/exoplayer/source/MediaSource;)V

    return-object v1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x1a9425ce -> :sswitch_6
        0x193ef -> :sswitch_5
        0x2eef92 -> :sswitch_4
        0x14db9ebe -> :sswitch_3
        0x36c0fcc2 -> :sswitch_2
        0x43720b8b -> :sswitch_1
        0x7cbaf4a1 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private decodeShuffleOrder(Ljava/util/List;)Landroidx/media3/exoplayer/source/ShuffleOrder;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/media3/exoplayer/source/ShuffleOrder;"
        }
    .end annotation

    .line 529
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 531
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 533
    :cond_0
    new-instance p1, Landroidx/media3/exoplayer/source/ShuffleOrder$DefaultShuffleOrder;

    sget-object v0, Lcom/ryanheise/just_audio/AudioPlayer;->random:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v2

    invoke-direct {p1, v1, v2, v3}, Landroidx/media3/exoplayer/source/ShuffleOrder$DefaultShuffleOrder;-><init>([IJ)V

    return-object p1
.end method

.method private enqueuePlaybackEvent()V
    .locals 1

    .line 889
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 890
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->createPlaybackEvent()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->pendingPlaybackEvent:Ljava/util/Map;

    return-void
.end method

.method private ensurePlayerInitialized()V
    .locals 5

    .line 767
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-nez v0, :cond_2

    .line 768
    new-instance v0, Landroidx/media3/exoplayer/ExoPlayer$Builder;

    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer$Builder;-><init>(Landroid/content/Context;)V

    .line 769
    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->loadControl:Landroidx/media3/exoplayer/LoadControl;

    if-eqz v1, :cond_0

    .line 770
    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer$Builder;->setLoadControl(Landroidx/media3/exoplayer/LoadControl;)Landroidx/media3/exoplayer/ExoPlayer$Builder;

    .line 772
    :cond_0
    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->livePlaybackSpeedControl:Landroidx/media3/exoplayer/LivePlaybackSpeedControl;

    if-eqz v1, :cond_1

    .line 773
    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer$Builder;->setLivePlaybackSpeedControl(Landroidx/media3/exoplayer/LivePlaybackSpeedControl;)Landroidx/media3/exoplayer/ExoPlayer$Builder;

    .line 775
    :cond_1
    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayer$Builder;->build()Landroidx/media3/exoplayer/ExoPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    .line 788
    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getTrackSelectionParameters()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object v1

    .line 789
    invoke-virtual {v1}, Landroidx/media3/common/TrackSelectionParameters;->buildUpon()Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object v1

    new-instance v2, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;

    invoke-direct {v2}, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;-><init>()V

    iget-boolean v3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->offloadSchedulingEnabled:Z

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    .line 792
    invoke-virtual {v2, v3}, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;->setIsGaplessSupportRequired(Z)Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->offloadSchedulingEnabled:Z

    xor-int/2addr v3, v4

    .line 793
    invoke-virtual {v2, v3}, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;->setIsSpeedChangeSupportRequired(Z)Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;

    move-result-object v2

    .line 794
    invoke-virtual {v2, v4}, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;->setAudioOffloadMode(I)Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;

    move-result-object v2

    .line 795
    invoke-virtual {v2}, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;->build()Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    move-result-object v2

    .line 790
    invoke-virtual {v1, v2}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setAudioOffloadPreferences(Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object v1

    .line 797
    invoke-virtual {v1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->build()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object v1

    .line 787
    invoke-interface {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer;->setTrackSelectionParameters(Landroidx/media3/common/TrackSelectionParameters;)V

    .line 799
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getAudioSessionId()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/ryanheise/just_audio/AudioPlayer;->setAudioSessionId(I)V

    .line 800
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0, p0}, Landroidx/media3/exoplayer/ExoPlayer;->addListener(Landroidx/media3/common/Player$Listener;)V

    :cond_2
    return-void
.end method

.method private equalizerAudioEffectGetParameters()Ljava/util/Map;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 830
    iget-object v1, v0, Lcom/ryanheise/just_audio/AudioPlayer;->audioEffectsMap:Ljava/util/Map;

    const-string v2, "AndroidEqualizer"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/audiofx/Equalizer;

    .line 831
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 832
    :goto_0
    invoke-virtual {v1}, Landroid/media/audiofx/Equalizer;->getNumberOfBands()S

    move-result v5

    const/4 v10, 0x2

    const/4 v11, 0x1

    const-wide v12, 0x408f400000000000L    # 1000.0

    if-ge v4, v5, :cond_0

    .line 834
    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v5

    .line 835
    invoke-virtual {v1, v4}, Landroid/media/audiofx/Equalizer;->getBandFreqRange(S)[I

    move-result-object v14

    aget v14, v14, v3

    int-to-double v14, v14

    div-double/2addr v14, v12

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    .line 836
    invoke-virtual {v1, v4}, Landroid/media/audiofx/Equalizer;->getBandFreqRange(S)[I

    move-result-object v15

    aget v15, v15, v11

    int-to-double v6, v15

    div-double/2addr v6, v12

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    .line 837
    invoke-virtual {v1, v4}, Landroid/media/audiofx/Equalizer;->getCenterFreq(S)I

    move-result v7

    int-to-double v8, v7

    div-double/2addr v8, v12

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    .line 838
    invoke-virtual {v1, v4}, Landroid/media/audiofx/Equalizer;->getBandLevel(S)S

    move-result v8

    int-to-double v8, v8

    div-double/2addr v8, v12

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    const/16 v9, 0xa

    new-array v9, v9, [Ljava/lang/Object;

    const-string v12, "index"

    aput-object v12, v9, v3

    aput-object v5, v9, v11

    const-string v5, "lowerFrequency"

    aput-object v5, v9, v10

    const/4 v5, 0x3

    aput-object v14, v9, v5

    const-string v5, "upperFrequency"

    const/4 v10, 0x4

    aput-object v5, v9, v10

    const/4 v5, 0x5

    aput-object v6, v9, v5

    const-string v5, "centerFrequency"

    const/4 v6, 0x6

    aput-object v5, v9, v6

    const/4 v5, 0x7

    aput-object v7, v9, v5

    const-string v5, "gain"

    const/16 v6, 0x8

    aput-object v5, v9, v6

    const/16 v5, 0x9

    aput-object v8, v9, v5

    .line 833
    invoke-static {v9}, Lcom/ryanheise/just_audio/AudioPlayer;->mapOf([Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    int-to-short v4, v4

    goto :goto_0

    .line 843
    :cond_0
    invoke-virtual {v1}, Landroid/media/audiofx/Equalizer;->getBandLevelRange()[S

    move-result-object v4

    aget-short v4, v4, v3

    int-to-double v4, v4

    div-double/2addr v4, v12

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    .line 844
    invoke-virtual {v1}, Landroid/media/audiofx/Equalizer;->getBandLevelRange()[S

    move-result-object v1

    aget-short v1, v1, v11

    int-to-double v5, v1

    div-double/2addr v5, v12

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    const/4 v5, 0x6

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "minDecibels"

    aput-object v6, v5, v3

    aput-object v4, v5, v11

    const-string v4, "maxDecibels"

    aput-object v4, v5, v10

    const/4 v4, 0x3

    aput-object v1, v5, v4

    const-string v1, "bands"

    const/4 v4, 0x4

    aput-object v1, v5, v4

    const/4 v1, 0x5

    aput-object v2, v5, v1

    .line 842
    invoke-static {v5}, Lcom/ryanheise/just_audio/AudioPlayer;->mapOf([Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    new-array v2, v10, [Ljava/lang/Object;

    const-string v4, "parameters"

    aput-object v4, v2, v3

    aput-object v1, v2, v11

    .line 841
    invoke-static {v2}, Lcom/ryanheise/just_audio/AudioPlayer;->mapOf([Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    return-object v1
.end method

.method private equalizerBandSetGain(ID)V
    .locals 3

    .line 851
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioEffectsMap:Ljava/util/Map;

    const-string v1, "AndroidEqualizer"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/audiofx/Equalizer;

    int-to-short p1, p1

    const-wide v1, 0x408f400000000000L    # 1000.0

    mul-double p2, p2, v1

    invoke-static {p2, p3}, Ljava/lang/Math;->round(D)J

    move-result-wide p2

    long-to-int p3, p2

    int-to-short p2, p3

    invoke-virtual {v0, p1, p2}, Landroid/media/audiofx/Equalizer;->setBandLevel(SS)V

    return-void
.end method

.method private getAudioSource(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/MediaSource;
    .locals 2

    .line 590
    check-cast p1, Ljava/util/Map;

    .line 591
    const-string v0, "id"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 592
    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->mediaSources:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/exoplayer/source/MediaSource;

    if-nez v1, :cond_0

    .line 594
    invoke-direct {p0, p1}, Lcom/ryanheise/just_audio/AudioPlayer;->decodeAudioSource(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/MediaSource;

    move-result-object v1

    .line 595
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->mediaSources:Ljava/util/Map;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v1
.end method

.method private getAudioSources(Ljava/lang/Object;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/source/MediaSource;",
            ">;"
        }
    .end annotation

    .line 682
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_1

    .line 683
    check-cast p1, Ljava/util/List;

    .line 684
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 685
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 686
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/ryanheise/just_audio/AudioPlayer;->getAudioSource(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/MediaSource;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0

    .line 682
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "List expected: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private getAudioSourcesArray(Ljava/lang/Object;)[Landroidx/media3/exoplayer/source/MediaSource;
    .locals 1

    .line 675
    invoke-direct {p0, p1}, Lcom/ryanheise/just_audio/AudioPlayer;->getAudioSources(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 676
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Landroidx/media3/exoplayer/source/MediaSource;

    .line 677
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    return-object v0
.end method

.method private getCurrentPosition()J
    .locals 5

    .line 921
    iget-wide v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->initialPos:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    return-wide v0

    .line 923
    :cond_0
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->none:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-eq v0, v1, :cond_3

    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->loading:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 927
    :cond_1
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekPos:Ljava/lang/Long;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_2

    .line 928
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekPos:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 930
    :cond_2
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentPosition()J

    move-result-wide v0

    return-wide v0

    .line 924
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentPosition()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_4

    move-wide v0, v2

    :cond_4
    return-wide v0
.end method

.method private getDuration()J
    .locals 2

    .line 935
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->none:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->loading:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-nez v0, :cond_0

    goto :goto_0

    .line 938
    :cond_0
    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getDuration()J

    move-result-wide v0

    return-wide v0

    :cond_1
    :goto_0
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    return-wide v0
.end method

.method public static getLong(Ljava/lang/Object;)Ljava/lang/Long;
    .locals 2

    if-eqz p0, :cond_1

    .line 1084
    instance-of v0, p0, Ljava/lang/Long;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long v0, p0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    goto :goto_1

    :cond_1
    :goto_0
    check-cast p0, Ljava/lang/Long;

    :goto_1
    return-object p0
.end method

.method private getLowerCaseExtension(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2

    .line 960
    invoke-virtual {p1}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 961
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 962
    :goto_0
    const-string p1, "^.*\\."

    const-string v1, ""

    invoke-virtual {v0, p1, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method static synthetic lambda$onMethodCall$0(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    .line 478
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p0, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$onMethodCall$1(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    .line 484
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p0, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$onMethodCall$2(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    .line 490
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p0, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private load(Landroidx/media3/exoplayer/source/MediaSource;JLjava/lang/Integer;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0

    .line 741
    iput-wide p2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->initialPos:J

    .line 742
    iput-object p4, p0, Lcom/ryanheise/just_audio/AudioPlayer;->initialIndex:Ljava/lang/Integer;

    const/4 p2, 0x0

    if-eqz p4, :cond_0

    .line 743
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p3

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    iput-object p3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->currentIndex:Ljava/lang/Integer;

    .line 744
    sget-object p3, Lcom/ryanheise/just_audio/AudioPlayer$2;->$SwitchMap$com$ryanheise$just_audio$AudioPlayer$ProcessingState:[I

    iget-object p4, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    invoke-virtual {p4}, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->ordinal()I

    move-result p4

    aget p3, p3, p4

    const/4 p4, 0x1

    if-eq p3, p4, :cond_2

    const/4 p4, 0x2

    if-eq p3, p4, :cond_1

    .line 752
    iget-object p3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p3}, Landroidx/media3/exoplayer/ExoPlayer;->stop()V

    goto :goto_1

    .line 748
    :cond_1
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->abortExistingConnection()V

    .line 749
    iget-object p3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p3}, Landroidx/media3/exoplayer/ExoPlayer;->stop()V

    .line 755
    :cond_2
    :goto_1
    iput p2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->errorCount:I

    .line 756
    iput-object p5, p0, Lcom/ryanheise/just_audio/AudioPlayer;->prepareResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 757
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition()V

    .line 758
    sget-object p2, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->loading:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    iput-object p2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    .line 759
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->enqueuePlaybackEvent()V

    .line 760
    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->mediaSource:Landroidx/media3/exoplayer/source/MediaSource;

    .line 762
    iget-object p2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p2, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setMediaSource(Landroidx/media3/exoplayer/source/MediaSource;)V

    .line 763
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    return-void
.end method

.method private loudnessEnhancerSetTargetGain(D)V
    .locals 2

    const-wide v0, 0x408f400000000000L    # 1000.0

    mul-double p1, p1, v0

    .line 825
    invoke-static {p1, p2}, Ljava/lang/Math;->round(D)J

    move-result-wide p1

    long-to-int p2, p1

    .line 826
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioEffectsMap:Ljava/util/Map;

    const-string v0, "AndroidLoudnessEnhancer"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/audiofx/LoudnessEnhancer;

    invoke-virtual {p1, p2}, Landroid/media/audiofx/LoudnessEnhancer;->setTargetGain(I)V

    return-void
.end method

.method static mapGet(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 1089
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 1090
    check-cast p0, Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method static varargs mapOf([Ljava/lang/Object;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1097
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    .line 1098
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 1099
    aget-object v2, p0, v1

    check-cast v2, Ljava/lang/String;

    add-int/lit8 v3, v1, 0x1

    aget-object v3, p0, v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private sendError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 943
    invoke-direct {p0, p1, p2, v0}, Lcom/ryanheise/just_audio/AudioPlayer;->sendError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private sendError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 947
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->prepareResult:Lio/flutter/plugin/common/MethodChannel$Result;

    if-eqz v0, :cond_0

    .line 948
    invoke-interface {v0, p1, p2, p3}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    .line 949
    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->prepareResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 952
    :cond_0
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->eventChannel:Lcom/ryanheise/just_audio/BetterEventChannel;

    invoke-virtual {v0, p1, p2, p3}, Lcom/ryanheise/just_audio/BetterEventChannel;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private setAudioAttributes(III)V
    .locals 1

    .line 805
    new-instance v0, Landroidx/media3/common/AudioAttributes$Builder;

    invoke-direct {v0}, Landroidx/media3/common/AudioAttributes$Builder;-><init>()V

    .line 806
    invoke-virtual {v0, p1}, Landroidx/media3/common/AudioAttributes$Builder;->setContentType(I)Landroidx/media3/common/AudioAttributes$Builder;

    .line 807
    invoke-virtual {v0, p2}, Landroidx/media3/common/AudioAttributes$Builder;->setFlags(I)Landroidx/media3/common/AudioAttributes$Builder;

    .line 808
    invoke-virtual {v0, p3}, Landroidx/media3/common/AudioAttributes$Builder;->setUsage(I)Landroidx/media3/common/AudioAttributes$Builder;

    .line 810
    invoke-virtual {v0}, Landroidx/media3/common/AudioAttributes$Builder;->build()Landroidx/media3/common/AudioAttributes;

    move-result-object p1

    .line 811
    iget-object p2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object p3, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->loading:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-ne p2, p3, :cond_0

    .line 814
    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->pendingAudioAttributes:Landroidx/media3/common/AudioAttributes;

    goto :goto_0

    .line 816
    :cond_0
    iget-object p2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    const/4 p3, 0x0

    invoke-interface {p2, p1, p3}, Landroidx/media3/exoplayer/ExoPlayer;->setAudioAttributes(Landroidx/media3/common/AudioAttributes;Z)V

    :goto_0
    return-void
.end method

.method private setAudioSessionId(I)V
    .locals 4

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 192
    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioSessionId:Ljava/lang/Integer;

    goto :goto_0

    .line 194
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioSessionId:Ljava/lang/Integer;

    .line 196
    :goto_0
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->clearAudioEffects()V

    .line 197
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioSessionId:Ljava/lang/Integer;

    if-eqz p1, :cond_2

    .line 198
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->rawAudioEffects:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 199
    move-object v1, v0

    check-cast v1, Ljava/util/Map;

    .line 200
    iget-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioSessionId:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {p0, v0, v2}, Lcom/ryanheise/just_audio/AudioPlayer;->decodeAudioEffect(Ljava/lang/Object;I)Landroid/media/audiofx/AudioEffect;

    move-result-object v0

    .line 201
    const-string v2, "enabled"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    .line 202
    invoke-virtual {v0, v2}, Landroid/media/audiofx/AudioEffect;->setEnabled(Z)I

    .line 204
    :cond_1
    iget-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioEffects:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 205
    iget-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->audioEffectsMap:Ljava/util/Map;

    const-string v3, "type"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 208
    :cond_2
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->enqueuePlaybackEvent()V

    return-void
.end method

.method private setShuffleOrder(Ljava/lang/Object;)V
    .locals 3

    .line 570
    check-cast p1, Ljava/util/Map;

    .line 571
    const-string v0, "id"

    invoke-static {p1, v0}, Lcom/ryanheise/just_audio/AudioPlayer;->mapGet(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 572
    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->mediaSources:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/source/MediaSource;

    if-nez v0, :cond_0

    return-void

    .line 574
    :cond_0
    const-string v1, "type"

    invoke-static {p1, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->mapGet(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    const-string v2, "concatenating"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v0, "looping"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_1

    .line 584
    :cond_1
    const-string v0, "child"

    invoke-static {p1, v0}, Lcom/ryanheise/just_audio/AudioPlayer;->mapGet(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/ryanheise/just_audio/AudioPlayer;->setShuffleOrder(Ljava/lang/Object;)V

    goto :goto_1

    .line 576
    :cond_2
    check-cast v0, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;

    .line 577
    const-string v1, "shuffleOrder"

    invoke-static {p1, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->mapGet(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-direct {p0, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->decodeShuffleOrder(Ljava/util/List;)Landroidx/media3/exoplayer/source/ShuffleOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;->setShuffleOrder(Landroidx/media3/exoplayer/source/ShuffleOrder;)V

    .line 578
    const-string v0, "children"

    invoke-static {p1, v0}, Lcom/ryanheise/just_audio/AudioPlayer;->mapGet(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 579
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 580
    invoke-direct {p0, v0}, Lcom/ryanheise/just_audio/AudioPlayer;->setShuffleOrder(Ljava/lang/Object;)V

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method

.method private static shuffle(ILjava/lang/Integer;)[I
    .locals 6

    .line 537
    new-array v0, p0, [I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p0, :cond_0

    .line 539
    sget-object v3, Lcom/ryanheise/just_audio/AudioPlayer;->random:Ljava/util/Random;

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    .line 540
    aget v5, v0, v3

    aput v5, v0, v2

    .line 541
    aput v2, v0, v3

    move v2, v4

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_2

    const/4 v2, 0x1

    :goto_1
    if-ge v2, p0, :cond_2

    .line 545
    aget v3, v0, v2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v3, v4, :cond_1

    .line 546
    aget p0, v0, v1

    .line 547
    aget p1, v0, v2

    aput p1, v0, v1

    .line 548
    aput p0, v0, v2

    goto :goto_2

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    return-object v0
.end method

.method private startWatchingBuffer()V
    .locals 2

    .line 186
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->bufferWatcher:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 187
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->bufferWatcher:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private updateCurrentIndex()Z
    .locals 2

    .line 305
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItemIndex()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 308
    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->currentIndex:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 309
    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->currentIndex:Ljava/lang/Integer;

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private updatePosition()V
    .locals 2

    .line 257
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->getCurrentPosition()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition:J

    .line 258
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->updateTime:J

    return-void
.end method

.method private updatePositionIfChanged()Z
    .locals 5

    .line 250
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->getCurrentPosition()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x0

    return v0

    .line 251
    :cond_0
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->getCurrentPosition()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition:J

    .line 252
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->updateTime:J

    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public dispose()V
    .locals 3

    .line 1043
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->loading:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-ne v0, v1, :cond_0

    .line 1044
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->abortExistingConnection()V

    .line 1046
    :cond_0
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->playResult:Lio/flutter/plugin/common/MethodChannel$Result;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1047
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0, v2}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 1048
    iput-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->playResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 1050
    :cond_1
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->mediaSources:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 1051
    iput-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->mediaSource:Landroidx/media3/exoplayer/source/MediaSource;

    .line 1052
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->clearAudioEffects()V

    .line 1053
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz v0, :cond_2

    .line 1054
    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->release()V

    .line 1055
    iput-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    .line 1056
    sget-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->none:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    .line 1057
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastImmediatePlaybackEvent()V

    .line 1059
    :cond_2
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->eventChannel:Lcom/ryanheise/just_audio/BetterEventChannel;

    invoke-virtual {v0}, Lcom/ryanheise/just_audio/BetterEventChannel;->endOfStream()V

    .line 1060
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->dataEventChannel:Lcom/ryanheise/just_audio/BetterEventChannel;

    invoke-virtual {v0}, Lcom/ryanheise/just_audio/BetterEventChannel;->endOfStream()V

    return-void
.end method

.method public synthetic onAudioAttributesChanged(Landroidx/media3/common/AudioAttributes;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onAudioAttributesChanged(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/AudioAttributes;)V

    return-void
.end method

.method public onAudioSessionIdChanged(I)V
    .locals 0

    .line 213
    invoke-direct {p0, p1}, Lcom/ryanheise/just_audio/AudioPlayer;->setAudioSessionId(I)V

    .line 214
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastPendingPlaybackEvent()V

    return-void
.end method

.method public synthetic onAvailableCommandsChanged(Landroidx/media3/common/Player$Commands;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onAvailableCommandsChanged(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/Player$Commands;)V

    return-void
.end method

.method public synthetic onCues(Landroidx/media3/common/text/CueGroup;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onCues(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/text/CueGroup;)V

    return-void
.end method

.method public synthetic onCues(Ljava/util/List;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onCues(Landroidx/media3/common/Player$Listener;Ljava/util/List;)V

    return-void
.end method

.method public synthetic onDeviceInfoChanged(Landroidx/media3/common/DeviceInfo;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onDeviceInfoChanged(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/DeviceInfo;)V

    return-void
.end method

.method public synthetic onDeviceVolumeChanged(IZ)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/media3/common/Player$Listener$-CC;->$default$onDeviceVolumeChanged(Landroidx/media3/common/Player$Listener;IZ)V

    return-void
.end method

.method public synthetic onEvents(Landroidx/media3/common/Player;Landroidx/media3/common/Player$Events;)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/media3/common/Player$Listener$-CC;->$default$onEvents(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/Player;Landroidx/media3/common/Player$Events;)V

    return-void
.end method

.method public synthetic onIsLoadingChanged(Z)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onIsLoadingChanged(Landroidx/media3/common/Player$Listener;Z)V

    return-void
.end method

.method public synthetic onIsPlayingChanged(Z)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onIsPlayingChanged(Landroidx/media3/common/Player$Listener;Z)V

    return-void
.end method

.method public synthetic onLoadingChanged(Z)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onLoadingChanged(Landroidx/media3/common/Player$Listener;Z)V

    return-void
.end method

.method public synthetic onMaxSeekToPreviousPositionChanged(J)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/media3/common/Player$Listener$-CC;->$default$onMaxSeekToPreviousPositionChanged(Landroidx/media3/common/Player$Listener;J)V

    return-void
.end method

.method public synthetic onMediaItemTransition(Landroidx/media3/common/MediaItem;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/media3/common/Player$Listener$-CC;->$default$onMediaItemTransition(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/MediaItem;I)V

    return-void
.end method

.method public synthetic onMediaMetadataChanged(Landroidx/media3/common/MediaMetadata;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onMediaMetadataChanged(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/MediaMetadata;)V

    return-void
.end method

.method public onMetadata(Landroidx/media3/common/Metadata;)V
    .locals 3

    const/4 v0, 0x0

    .line 219
    :goto_0
    invoke-virtual {p1}, Landroidx/media3/common/Metadata;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 220
    invoke-virtual {p1, v0}, Landroidx/media3/common/Metadata;->get(I)Landroidx/media3/common/Metadata$Entry;

    move-result-object v1

    .line 221
    instance-of v2, v1, Landroidx/media3/extractor/metadata/icy/IcyInfo;

    if-eqz v2, :cond_0

    .line 222
    check-cast v1, Landroidx/media3/extractor/metadata/icy/IcyInfo;

    iput-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyInfo:Landroidx/media3/extractor/metadata/icy/IcyInfo;

    .line 223
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastImmediatePlaybackEvent()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 18

    move-object/from16 v7, p0

    move-object/from16 v1, p1

    move-object/from16 v8, p2

    const-string v9, "Error: "

    const-string v10, "Illegal state: "

    .line 416
    invoke-direct/range {p0 .. p0}, Lcom/ryanheise/just_audio/AudioPlayer;->ensurePlayerInitialized()V

    const/4 v11, 0x0

    .line 419
    :try_start_0
    iget-object v2, v1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v5, 0x1

    sparse-switch v3, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v3, "audioEffectSetEnabled"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0x12

    goto/16 :goto_1

    :sswitch_1
    const-string v3, "setAutomaticallyWaitsToMinimizeStalling"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0xa

    goto/16 :goto_1

    :sswitch_2
    const-string v3, "androidEqualizerGetParameters"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0x14

    goto/16 :goto_1

    :sswitch_3
    const-string v3, "setPreferredPeakBitRate"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0xc

    goto/16 :goto_1

    :sswitch_4
    const-string v3, "setSpeed"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto/16 :goto_1

    :sswitch_5
    const-string v3, "setPitch"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x5

    goto/16 :goto_1

    :sswitch_6
    const-string v3, "concatenatingMove"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0x10

    goto/16 :goto_1

    :sswitch_7
    const-string v3, "concatenatingRemoveRange"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0xf

    goto/16 :goto_1

    :sswitch_8
    const-string v3, "setVolume"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x3

    goto/16 :goto_1

    :sswitch_9
    const-string v3, "pause"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x2

    goto/16 :goto_1

    :sswitch_a
    const-string v3, "seek"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0xd

    goto/16 :goto_1

    :sswitch_b
    const-string v3, "play"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto/16 :goto_1

    :sswitch_c
    const-string v3, "load"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    goto/16 :goto_1

    :sswitch_d
    const-string v3, "setLoopMode"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x7

    goto :goto_1

    :sswitch_e
    const-string v3, "setAndroidAudioAttributes"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0x11

    goto :goto_1

    :sswitch_f
    const-string v3, "androidLoudnessEnhancerSetTargetGain"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0x13

    goto :goto_1

    :sswitch_10
    const-string v3, "setCanUseNetworkResourcesForLiveStreamingWhilePaused"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0xb

    goto :goto_1

    :sswitch_11
    const-string v3, "setShuffleOrder"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0x9

    goto :goto_1

    :sswitch_12
    const-string v3, "concatenatingInsertAll"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0xe

    goto :goto_1

    :sswitch_13
    const-string v3, "setSkipSilence"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x6

    goto :goto_1

    :sswitch_14
    const-string v3, "setShuffleMode"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0x8

    goto :goto_1

    :sswitch_15
    const-string v3, "androidEqualizerBandSetGain"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    const/16 v2, 0x15

    goto :goto_1

    :cond_0
    :goto_0
    const/4 v2, -0x1

    :goto_1
    const-wide/16 v12, 0x3e8

    const-string v3, "index"

    const-string v6, "audioSource"

    const-string v4, "enabled"

    const-string v14, "shuffleOrder"

    const-string v15, "id"

    packed-switch v2, :pswitch_data_0

    .line 514
    :try_start_1
    invoke-interface/range {p2 .. p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    goto/16 :goto_5

    .line 510
    :pswitch_0
    const-string v2, "bandIndex"

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const-string v3, "gain"

    invoke-virtual {v1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-direct {v7, v2, v3, v4}, Lcom/ryanheise/just_audio/AudioPlayer;->equalizerBandSetGain(ID)V

    .line 511
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 507
    :pswitch_1
    invoke-direct/range {p0 .. p0}, Lcom/ryanheise/just_audio/AudioPlayer;->equalizerAudioEffectGetParameters()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 503
    :pswitch_2
    const-string v2, "targetGain"

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-direct {v7, v1, v2}, Lcom/ryanheise/just_audio/AudioPlayer;->loudnessEnhancerSetTargetGain(D)V

    .line 504
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 499
    :pswitch_3
    const-string v2, "type"

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v4}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-direct {v7, v2, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->audioEffectSetEnabled(Ljava/lang/String;Z)V

    .line 500
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 495
    :pswitch_4
    const-string v2, "contentType"

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const-string v3, "flags"

    invoke-virtual {v1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const-string v4, "usage"

    invoke-virtual {v1, v4}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {v7, v2, v3, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->setAudioAttributes(III)V

    .line 496
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 489
    :pswitch_5
    invoke-virtual {v1, v15}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v7, v2}, Lcom/ryanheise/just_audio/AudioPlayer;->concatenating(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;

    move-result-object v2

    const-string v3, "currentIndex"

    .line 490
    invoke-virtual {v1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const-string v4, "newIndex"

    invoke-virtual {v1, v4}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v5, v7, Lcom/ryanheise/just_audio/AudioPlayer;->handler:Landroid/os/Handler;

    new-instance v6, Lcom/ryanheise/just_audio/AudioPlayer$$ExternalSyntheticLambda2;

    invoke-direct {v6, v8}, Lcom/ryanheise/just_audio/AudioPlayer$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    invoke-virtual {v2, v3, v4, v5, v6}, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;->moveMediaSource(IILandroid/os/Handler;Ljava/lang/Runnable;)V

    .line 491
    invoke-virtual {v1, v15}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v7, v2}, Lcom/ryanheise/just_audio/AudioPlayer;->concatenating(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;

    move-result-object v2

    .line 492
    invoke-virtual {v1, v14}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-direct {v7, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->decodeShuffleOrder(Ljava/util/List;)Landroidx/media3/exoplayer/source/ShuffleOrder;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;->setShuffleOrder(Landroidx/media3/exoplayer/source/ShuffleOrder;)V

    goto/16 :goto_5

    .line 483
    :pswitch_6
    invoke-virtual {v1, v15}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v7, v2}, Lcom/ryanheise/just_audio/AudioPlayer;->concatenating(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;

    move-result-object v2

    const-string v3, "startIndex"

    .line 484
    invoke-virtual {v1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const-string v4, "endIndex"

    invoke-virtual {v1, v4}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v5, v7, Lcom/ryanheise/just_audio/AudioPlayer;->handler:Landroid/os/Handler;

    new-instance v6, Lcom/ryanheise/just_audio/AudioPlayer$$ExternalSyntheticLambda1;

    invoke-direct {v6, v8}, Lcom/ryanheise/just_audio/AudioPlayer$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    invoke-virtual {v2, v3, v4, v5, v6}, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;->removeMediaSourceRange(IILandroid/os/Handler;Ljava/lang/Runnable;)V

    .line 485
    invoke-virtual {v1, v15}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v7, v2}, Lcom/ryanheise/just_audio/AudioPlayer;->concatenating(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;

    move-result-object v2

    .line 486
    invoke-virtual {v1, v14}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-direct {v7, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->decodeShuffleOrder(Ljava/util/List;)Landroidx/media3/exoplayer/source/ShuffleOrder;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;->setShuffleOrder(Landroidx/media3/exoplayer/source/ShuffleOrder;)V

    goto/16 :goto_5

    .line 477
    :pswitch_7
    invoke-virtual {v1, v15}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v7, v2}, Lcom/ryanheise/just_audio/AudioPlayer;->concatenating(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;

    move-result-object v2

    .line 478
    invoke-virtual {v1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const-string v4, "children"

    invoke-virtual {v1, v4}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-direct {v7, v4}, Lcom/ryanheise/just_audio/AudioPlayer;->getAudioSources(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    iget-object v5, v7, Lcom/ryanheise/just_audio/AudioPlayer;->handler:Landroid/os/Handler;

    new-instance v6, Lcom/ryanheise/just_audio/AudioPlayer$$ExternalSyntheticLambda0;

    invoke-direct {v6, v8}, Lcom/ryanheise/just_audio/AudioPlayer$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    invoke-virtual {v2, v3, v4, v5, v6}, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;->addMediaSources(ILjava/util/Collection;Landroid/os/Handler;Ljava/lang/Runnable;)V

    .line 479
    invoke-virtual {v1, v15}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v7, v2}, Lcom/ryanheise/just_audio/AudioPlayer;->concatenating(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;

    move-result-object v2

    .line 480
    invoke-virtual {v1, v14}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-direct {v7, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->decodeShuffleOrder(Ljava/util/List;)Landroidx/media3/exoplayer/source/ShuffleOrder;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroidx/media3/exoplayer/source/ConcatenatingMediaSource;->setShuffleOrder(Landroidx/media3/exoplayer/source/ShuffleOrder;)V

    goto/16 :goto_5

    .line 472
    :pswitch_8
    const-string v2, "position"

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v2

    .line 473
    invoke-virtual {v1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    if-nez v2, :cond_1

    const-wide v14, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_2

    .line 474
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    div-long v14, v2, v12

    :goto_2
    invoke-virtual {v7, v14, v15, v1, v8}, Lcom/ryanheise/just_audio/AudioPlayer;->seek(JLjava/lang/Integer;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto/16 :goto_5

    .line 469
    :pswitch_9
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 466
    :pswitch_a
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 463
    :pswitch_b
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 459
    :pswitch_c
    invoke-virtual {v1, v6}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v7, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->setShuffleOrder(Ljava/lang/Object;)V

    .line 460
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 455
    :pswitch_d
    const-string v2, "shuffleMode"

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v5, :cond_2

    const/4 v4, 0x1

    goto :goto_3

    :cond_2
    const/4 v4, 0x0

    :goto_3
    invoke-virtual {v7, v4}, Lcom/ryanheise/just_audio/AudioPlayer;->setShuffleModeEnabled(Z)V

    .line 456
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 451
    :pswitch_e
    const-string v2, "loopMode"

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v7, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->setLoopMode(I)V

    .line 452
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 447
    :pswitch_f
    invoke-virtual {v1, v4}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v7, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->setSkipSilenceEnabled(Z)V

    .line 448
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 443
    :pswitch_10
    const-string v2, "pitch"

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-virtual {v7, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->setPitch(F)V

    .line 444
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 439
    :pswitch_11
    const-string v2, "speed"

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-virtual {v7, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->setSpeed(F)V

    .line 440
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_5

    .line 435
    :pswitch_12
    const-string v2, "volume"

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-virtual {v7, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->setVolume(F)V

    .line 436
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_5

    .line 431
    :pswitch_13
    invoke-virtual/range {p0 .. p0}, Lcom/ryanheise/just_audio/AudioPlayer;->pause()V

    .line 432
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v8, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_5

    .line 428
    :pswitch_14
    invoke-virtual {v7, v8}, Lcom/ryanheise/just_audio/AudioPlayer;->play(Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_5

    .line 421
    :pswitch_15
    const-string v2, "initialPosition"

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/ryanheise/just_audio/AudioPlayer;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v2

    .line 422
    const-string v3, "initialIndex"

    invoke-virtual {v1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Ljava/lang/Integer;

    .line 423
    invoke-virtual {v1, v6}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v7, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->getAudioSource(Ljava/lang/Object;)Landroidx/media3/exoplayer/source/MediaSource;

    move-result-object v3

    if-nez v2, :cond_3

    const-wide v16, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_4

    .line 424
    :cond_3
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    div-long/2addr v1, v12

    move-wide/from16 v16, v1

    :goto_4
    move-object/from16 v1, p0

    move-object v2, v3

    move-wide/from16 v3, v16

    move-object/from16 v6, p2

    .line 423
    invoke-direct/range {v1 .. v6}, Lcom/ryanheise/just_audio/AudioPlayer;->load(Landroidx/media3/exoplayer/source/MediaSource;JLjava/lang/Integer;Lio/flutter/plugin/common/MethodChannel$Result;)V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 524
    :goto_5
    invoke-direct/range {p0 .. p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastPendingPlaybackEvent()V

    goto :goto_6

    :catchall_0
    move-exception v0

    move-object v1, v0

    goto :goto_7

    :catch_0
    move-exception v0

    move-object v1, v0

    .line 521
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 522
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v8, v2, v1, v11}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_5

    :catch_1
    move-exception v0

    move-object v1, v0

    .line 518
    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 519
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v8, v2, v1, v11}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_5

    :goto_6
    return-void

    .line 524
    :goto_7
    invoke-direct/range {p0 .. p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastPendingPlaybackEvent()V

    .line 525
    throw v1

    :sswitch_data_0
    .sparse-switch
        -0x7aad3a17 -> :sswitch_15
        -0x76787586 -> :sswitch_14
        -0x6fccfba0 -> :sswitch_13
        -0x5bd749ea -> :sswitch_12
        -0x5878aea9 -> :sswitch_11
        -0x29f8037e -> :sswitch_10
        -0x1494f7ca -> :sswitch_f
        -0x64229a0 -> :sswitch_e
        -0x2e1df17 -> :sswitch_d
        0x32c4e6 -> :sswitch_c
        0x348b34 -> :sswitch_b
        0x35ce78 -> :sswitch_a
        0x65825f6 -> :sswitch_9
        0x27f73e1c -> :sswitch_8
        0x3264dd87 -> :sswitch_7
        0x3ad42123 -> :sswitch_6
        0x538783fe -> :sswitch_5
        0x53b4c105 -> :sswitch_4
        0x56b389ef -> :sswitch_3
        0x60da657d -> :sswitch_2
        0x613a0038 -> :sswitch_1
        0x7e381ce6 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public synthetic onPlayWhenReadyChanged(ZI)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/media3/common/Player$Listener$-CC;->$default$onPlayWhenReadyChanged(Landroidx/media3/common/Player$Listener;ZI)V

    return-void
.end method

.method public synthetic onPlaybackParametersChanged(Landroidx/media3/common/PlaybackParameters;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onPlaybackParametersChanged(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/PlaybackParameters;)V

    return-void
.end method

.method public onPlaybackStateChanged(I)V
    .locals 7

    const/4 v0, 0x2

    if-eq p1, v0, :cond_7

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eq p1, v0, :cond_3

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    goto/16 :goto_1

    .line 346
    :cond_0
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->completed:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-eq p1, v0, :cond_1

    .line 347
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition()V

    .line 348
    sget-object p1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->completed:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    .line 349
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastImmediatePlaybackEvent()V

    .line 351
    :cond_1
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->prepareResult:Lio/flutter/plugin/common/MethodChannel$Result;

    if-eqz p1, :cond_2

    .line 352
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 353
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->prepareResult:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 354
    iput-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->prepareResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 355
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->pendingAudioAttributes:Landroidx/media3/common/AudioAttributes;

    if-eqz p1, :cond_2

    .line 356
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0, p1, v1}, Landroidx/media3/exoplayer/ExoPlayer;->setAudioAttributes(Landroidx/media3/common/AudioAttributes;Z)V

    .line 357
    iput-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->pendingAudioAttributes:Landroidx/media3/common/AudioAttributes;

    .line 360
    :cond_2
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->playResult:Lio/flutter/plugin/common/MethodChannel$Result;

    if-eqz p1, :cond_9

    .line 361
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 362
    iput-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->playResult:Lio/flutter/plugin/common/MethodChannel$Result;

    goto :goto_1

    .line 319
    :cond_3
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 320
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition()V

    .line 321
    :cond_4
    sget-object p1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->ready:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    .line 322
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastImmediatePlaybackEvent()V

    .line 323
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->prepareResult:Lio/flutter/plugin/common/MethodChannel$Result;

    if-eqz p1, :cond_6

    .line 324
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 325
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->getDuration()J

    move-result-wide v3

    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v0, v3, v5

    if-nez v0, :cond_5

    move-object v0, v2

    goto :goto_0

    :cond_5
    const-wide/16 v3, 0x3e8

    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->getDuration()J

    move-result-wide v5

    mul-long v5, v5, v3

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :goto_0
    const-string v3, "duration"

    invoke-interface {p1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->prepareResult:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 327
    iput-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->prepareResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 328
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->pendingAudioAttributes:Landroidx/media3/common/AudioAttributes;

    if-eqz p1, :cond_6

    .line 329
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0, p1, v1}, Landroidx/media3/exoplayer/ExoPlayer;->setAudioAttributes(Landroidx/media3/common/AudioAttributes;Z)V

    .line 330
    iput-object v2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->pendingAudioAttributes:Landroidx/media3/common/AudioAttributes;

    .line 333
    :cond_6
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekResult:Lio/flutter/plugin/common/MethodChannel$Result;

    if-eqz p1, :cond_9

    .line 334
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->completeSeek()V

    goto :goto_1

    .line 338
    :cond_7
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->updatePositionIfChanged()Z

    .line 339
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->buffering:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-eq p1, v0, :cond_8

    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->loading:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-eq p1, v0, :cond_8

    .line 340
    sget-object p1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->buffering:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    .line 341
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastImmediatePlaybackEvent()V

    .line 343
    :cond_8
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->startWatchingBuffer()V

    :cond_9
    :goto_1
    return-void
.end method

.method public synthetic onPlaybackSuppressionReasonChanged(I)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onPlaybackSuppressionReasonChanged(Landroidx/media3/common/Player$Listener;I)V

    return-void
.end method

.method public onPlayerError(Landroidx/media3/common/PlaybackException;)V
    .locals 7

    .line 370
    instance-of v0, p1, Landroidx/media3/exoplayer/ExoPlaybackException;

    const/4 v1, 0x0

    const-string v2, "index"

    const/4 v3, 0x2

    const/4 v4, 0x1

    const-string v5, "AudioPlayer"

    if-eqz v0, :cond_3

    .line 371
    check-cast p1, Landroidx/media3/exoplayer/ExoPlaybackException;

    .line 372
    iget v0, p1, Landroidx/media3/exoplayer/ExoPlaybackException;->type:I

    if-eqz v0, :cond_2

    if-eq v0, v4, :cond_1

    if-eq v0, v3, :cond_0

    .line 386
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v6, "default ExoPlaybackException: "

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/media3/exoplayer/ExoPlaybackException;->getUnexpectedException()Ljava/lang/RuntimeException;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 382
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v6, "TYPE_UNEXPECTED: "

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/media3/exoplayer/ExoPlaybackException;->getUnexpectedException()Ljava/lang/RuntimeException;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 378
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v6, "TYPE_RENDERER: "

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/media3/exoplayer/ExoPlaybackException;->getRendererException()Ljava/lang/Exception;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 374
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v6, "TYPE_SOURCE: "

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/media3/exoplayer/ExoPlaybackException;->getSourceException()Ljava/io/IOException;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    :goto_0
    iget v0, p1, Landroidx/media3/exoplayer/ExoPlaybackException;->type:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/media3/exoplayer/ExoPlaybackException;->getMessage()Ljava/lang/String;

    move-result-object p1

    iget-object v5, p0, Lcom/ryanheise/just_audio/AudioPlayer;->currentIndex:Ljava/lang/Integer;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v1

    aput-object v5, v3, v4

    invoke-static {v3}, Lcom/ryanheise/just_audio/AudioPlayer;->mapOf([Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->sendError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 391
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v6, "default PlaybackException: "

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/media3/common/PlaybackException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    iget v0, p1, Landroidx/media3/common/PlaybackException;->errorCode:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/media3/common/PlaybackException;->getMessage()Ljava/lang/String;

    move-result-object p1

    iget-object v5, p0, Lcom/ryanheise/just_audio/AudioPlayer;->currentIndex:Ljava/lang/Integer;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v2, v3, v1

    aput-object v5, v3, v4

    invoke-static {v3}, Lcom/ryanheise/just_audio/AudioPlayer;->mapOf([Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1}, Lcom/ryanheise/just_audio/AudioPlayer;->sendError(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 394
    :goto_1
    iget p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->errorCount:I

    add-int/2addr p1, v4

    iput p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->errorCount:I

    .line 395
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->hasNextMediaItem()Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->currentIndex:Ljava/lang/Integer;

    if-eqz p1, :cond_4

    iget v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->errorCount:I

    const/4 v1, 0x5

    if-gt v0, v1, :cond_4

    .line 396
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    add-int/2addr p1, v4

    .line 397
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentTimeline()Landroidx/media3/common/Timeline;

    move-result-object v0

    .line 399
    invoke-virtual {v0}, Landroidx/media3/common/Timeline;->getWindowCount()I

    move-result v0

    if-ge p1, v0, :cond_4

    .line 401
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->mediaSource:Landroidx/media3/exoplayer/source/MediaSource;

    invoke-interface {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer;->setMediaSource(Landroidx/media3/exoplayer/source/MediaSource;)V

    .line 402
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    .line 403
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    const-wide/16 v1, 0x0

    invoke-interface {v0, p1, v1, v2}, Landroidx/media3/exoplayer/ExoPlayer;->seekTo(IJ)V

    :cond_4
    return-void
.end method

.method public synthetic onPlayerErrorChanged(Landroidx/media3/common/PlaybackException;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onPlayerErrorChanged(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/PlaybackException;)V

    return-void
.end method

.method public synthetic onPlayerStateChanged(ZI)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/media3/common/Player$Listener$-CC;->$default$onPlayerStateChanged(Landroidx/media3/common/Player$Listener;ZI)V

    return-void
.end method

.method public synthetic onPlaylistMetadataChanged(Landroidx/media3/common/MediaMetadata;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onPlaylistMetadataChanged(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/MediaMetadata;)V

    return-void
.end method

.method public synthetic onPositionDiscontinuity(I)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onPositionDiscontinuity(Landroidx/media3/common/Player$Listener;I)V

    return-void
.end method

.method public onPositionDiscontinuity(Landroidx/media3/common/Player$PositionInfo;Landroidx/media3/common/Player$PositionInfo;I)V
    .locals 0

    .line 263
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition()V

    if-eqz p3, :cond_0

    const/4 p1, 0x1

    if-eq p3, p1, :cond_0

    goto :goto_0

    .line 267
    :cond_0
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->updateCurrentIndex()Z

    .line 270
    :goto_0
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastImmediatePlaybackEvent()V

    return-void
.end method

.method public synthetic onRenderedFirstFrame()V
    .locals 0

    invoke-static {p0}, Landroidx/media3/common/Player$Listener$-CC;->$default$onRenderedFirstFrame(Landroidx/media3/common/Player$Listener;)V

    return-void
.end method

.method public synthetic onRepeatModeChanged(I)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onRepeatModeChanged(Landroidx/media3/common/Player$Listener;I)V

    return-void
.end method

.method public synthetic onSeekBackIncrementChanged(J)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/media3/common/Player$Listener$-CC;->$default$onSeekBackIncrementChanged(Landroidx/media3/common/Player$Listener;J)V

    return-void
.end method

.method public synthetic onSeekForwardIncrementChanged(J)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/media3/common/Player$Listener$-CC;->$default$onSeekForwardIncrementChanged(Landroidx/media3/common/Player$Listener;J)V

    return-void
.end method

.method public synthetic onShuffleModeEnabledChanged(Z)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onShuffleModeEnabledChanged(Landroidx/media3/common/Player$Listener;Z)V

    return-void
.end method

.method public synthetic onSkipSilenceEnabledChanged(Z)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onSkipSilenceEnabledChanged(Landroidx/media3/common/Player$Listener;Z)V

    return-void
.end method

.method public synthetic onSurfaceSizeChanged(II)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/media3/common/Player$Listener$-CC;->$default$onSurfaceSizeChanged(Landroidx/media3/common/Player$Listener;II)V

    return-void
.end method

.method public onTimelineChanged(Landroidx/media3/common/Timeline;I)V
    .locals 5

    .line 275
    iget-wide p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->initialPos:J

    const/4 v0, 0x0

    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v3, p1, v1

    if-nez v3, :cond_0

    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->initialIndex:Ljava/lang/Integer;

    if-eqz p1, :cond_2

    .line 276
    :cond_0
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->initialIndex:Ljava/lang/Integer;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 277
    :goto_0
    iget-object p2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    iget-wide v3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->initialPos:J

    invoke-interface {p2, p1, v3, v4}, Landroidx/media3/exoplayer/ExoPlayer;->seekTo(IJ)V

    const/4 p1, 0x0

    .line 278
    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->initialIndex:Ljava/lang/Integer;

    .line 279
    iput-wide v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->initialPos:J

    .line 281
    :cond_2
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->updateCurrentIndex()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 282
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastImmediatePlaybackEvent()V

    .line 284
    :cond_3
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result p1

    const/4 p2, 0x4

    if-ne p1, p2, :cond_6

    .line 286
    :try_start_0
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result p1

    const-wide/16 v1, 0x0

    if-eqz p1, :cond_5

    .line 287
    iget p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->lastPlaylistLength:I

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getMediaItemCount()I

    move-result p1

    if-lez p1, :cond_4

    .line 288
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1, v0, v1, v2}, Landroidx/media3/exoplayer/ExoPlayer;->seekTo(IJ)V

    goto :goto_1

    .line 289
    :cond_4
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->hasNextMediaItem()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 290
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->seekToNextMediaItem()V

    goto :goto_1

    .line 293
    :cond_5
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItemIndex()I

    move-result p1

    iget-object p2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p2}, Landroidx/media3/exoplayer/ExoPlayer;->getMediaItemCount()I

    move-result p2

    if-ge p1, p2, :cond_6

    .line 294
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItemIndex()I

    move-result p2

    invoke-interface {p1, p2, v1, v2}, Landroidx/media3/exoplayer/ExoPlayer;->seekTo(IJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 298
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 301
    :cond_6
    :goto_1
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getMediaItemCount()I

    move-result p1

    iput p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->lastPlaylistLength:I

    return-void
.end method

.method public synthetic onTrackSelectionParametersChanged(Landroidx/media3/common/TrackSelectionParameters;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onTrackSelectionParametersChanged(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/TrackSelectionParameters;)V

    return-void
.end method

.method public onTracksChanged(Landroidx/media3/common/Tracks;)V
    .locals 8

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 230
    :goto_0
    invoke-virtual {p1}, Landroidx/media3/common/Tracks;->getGroups()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 231
    invoke-virtual {p1}, Landroidx/media3/common/Tracks;->getGroups()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/common/Tracks$Group;

    invoke-virtual {v2}, Landroidx/media3/common/Tracks$Group;->getMediaTrackGroup()Landroidx/media3/common/TrackGroup;

    move-result-object v2

    const/4 v3, 0x0

    .line 233
    :goto_1
    iget v4, v2, Landroidx/media3/common/TrackGroup;->length:I

    if-ge v3, v4, :cond_2

    .line 234
    invoke-virtual {v2, v3}, Landroidx/media3/common/TrackGroup;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object v4

    iget-object v4, v4, Landroidx/media3/common/Format;->metadata:Landroidx/media3/common/Metadata;

    if-eqz v4, :cond_1

    const/4 v5, 0x0

    .line 237
    :goto_2
    invoke-virtual {v4}, Landroidx/media3/common/Metadata;->length()I

    move-result v6

    if-ge v5, v6, :cond_1

    .line 238
    invoke-virtual {v4, v5}, Landroidx/media3/common/Metadata;->get(I)Landroidx/media3/common/Metadata$Entry;

    move-result-object v6

    .line 239
    instance-of v7, v6, Landroidx/media3/extractor/metadata/icy/IcyHeaders;

    if-eqz v7, :cond_0

    .line 240
    check-cast v6, Landroidx/media3/extractor/metadata/icy/IcyHeaders;

    iput-object v6, p0, Lcom/ryanheise/just_audio/AudioPlayer;->icyHeaders:Landroidx/media3/extractor/metadata/icy/IcyHeaders;

    .line 241
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->broadcastImmediatePlaybackEvent()V

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method public synthetic onVideoSizeChanged(Landroidx/media3/common/VideoSize;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onVideoSizeChanged(Landroidx/media3/common/Player$Listener;Landroidx/media3/common/VideoSize;)V

    return-void
.end method

.method public synthetic onVolumeChanged(F)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/common/Player$Listener$-CC;->$default$onVolumeChanged(Landroidx/media3/common/Player$Listener;F)V

    return-void
.end method

.method public pause()V
    .locals 2

    .line 983
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 984
    :cond_0
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer;->setPlayWhenReady(Z)V

    .line 985
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition()V

    .line 986
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->playResult:Lio/flutter/plugin/common/MethodChannel$Result;

    if-eqz v0, :cond_1

    .line 987
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    const/4 v0, 0x0

    .line 988
    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->playResult:Lio/flutter/plugin/common/MethodChannel$Result;

    :cond_1
    return-void
.end method

.method public play(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    .line 966
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 967
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void

    .line 970
    :cond_0
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->playResult:Lio/flutter/plugin/common/MethodChannel$Result;

    if-eqz v0, :cond_1

    .line 971
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    .line 973
    :cond_1
    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->playResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 974
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroidx/media3/exoplayer/ExoPlayer;->setPlayWhenReady(Z)V

    .line 975
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition()V

    .line 976
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->completed:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->playResult:Lio/flutter/plugin/common/MethodChannel$Result;

    if-eqz p1, :cond_2

    .line 977
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    const/4 p1, 0x0

    .line 978
    iput-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->playResult:Lio/flutter/plugin/common/MethodChannel$Result;

    :cond_2
    return-void
.end method

.method public seek(JLjava/lang/Integer;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    .line 1025
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->none:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-eq v0, v1, :cond_2

    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->processingState:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->loading:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    if-ne v0, v1, :cond_0

    goto :goto_1

    .line 1029
    :cond_0
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->abortSeek()V

    .line 1030
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekPos:Ljava/lang/Long;

    .line 1031
    iput-object p4, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekResult:Lio/flutter/plugin/common/MethodChannel$Result;

    if-eqz p3, :cond_1

    .line 1033
    :try_start_0
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    goto :goto_0

    :cond_1
    iget-object p3, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p3}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItemIndex()I

    move-result p3

    .line 1034
    :goto_0
    iget-object p4, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p4, p3, p1, p2}, Landroidx/media3/exoplayer/ExoPlayer;->seekTo(IJ)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    const/4 p2, 0x0

    .line 1036
    iput-object p2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekResult:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 1037
    iput-object p2, p0, Lcom/ryanheise/just_audio/AudioPlayer;->seekPos:Ljava/lang/Long;

    .line 1038
    throw p1

    .line 1026
    :cond_2
    :goto_1
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p4, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method public setLoopMode(I)V
    .locals 1

    .line 1017
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setRepeatMode(I)V

    return-void
.end method

.method public setPitch(F)V
    .locals 3

    .line 1006
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;

    move-result-object v0

    .line 1007
    iget v1, v0, Landroidx/media3/common/PlaybackParameters;->pitch:F

    cmpl-float v1, v1, p1

    if-nez v1, :cond_0

    return-void

    .line 1008
    :cond_0
    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    new-instance v2, Landroidx/media3/common/PlaybackParameters;

    iget v0, v0, Landroidx/media3/common/PlaybackParameters;->speed:F

    invoke-direct {v2, v0, p1}, Landroidx/media3/common/PlaybackParameters;-><init>(FF)V

    invoke-interface {v1, v2}, Landroidx/media3/exoplayer/ExoPlayer;->setPlaybackParameters(Landroidx/media3/common/PlaybackParameters;)V

    .line 1009
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->enqueuePlaybackEvent()V

    return-void
.end method

.method public setShuffleModeEnabled(Z)V
    .locals 1

    .line 1021
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setShuffleModeEnabled(Z)V

    return-void
.end method

.method public setSkipSilenceEnabled(Z)V
    .locals 1

    .line 1013
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setSkipSilenceEnabled(Z)V

    return-void
.end method

.method public setSpeed(F)V
    .locals 3

    .line 997
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;

    move-result-object v0

    .line 998
    iget v1, v0, Landroidx/media3/common/PlaybackParameters;->speed:F

    cmpl-float v1, v1, p1

    if-nez v1, :cond_0

    return-void

    .line 999
    :cond_0
    iget-object v1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    new-instance v2, Landroidx/media3/common/PlaybackParameters;

    iget v0, v0, Landroidx/media3/common/PlaybackParameters;->pitch:F

    invoke-direct {v2, p1, v0}, Landroidx/media3/common/PlaybackParameters;-><init>(FF)V

    invoke-interface {v1, v2}, Landroidx/media3/exoplayer/ExoPlayer;->setPlaybackParameters(Landroidx/media3/common/PlaybackParameters;)V

    .line 1000
    iget-object p1, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1001
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->updatePosition()V

    .line 1002
    :cond_1
    invoke-direct {p0}, Lcom/ryanheise/just_audio/AudioPlayer;->enqueuePlaybackEvent()V

    return-void
.end method

.method public setVolume(F)V
    .locals 1

    .line 993
    iget-object v0, p0, Lcom/ryanheise/just_audio/AudioPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setVolume(F)V

    return-void
.end method
