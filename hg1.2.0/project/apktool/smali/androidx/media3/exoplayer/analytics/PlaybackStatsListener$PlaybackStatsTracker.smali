.class final Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;
.super Ljava/lang/Object;
.source "PlaybackStatsListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/analytics/PlaybackStatsListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PlaybackStatsTracker"
.end annotation


# instance fields
.field private audioFormatBitrateTimeProduct:J

.field private final audioFormatHistory:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndFormat;",
            ">;"
        }
    .end annotation
.end field

.field private audioFormatTimeMs:J

.field private audioUnderruns:J

.field private bandwidthBytes:J

.field private bandwidthTimeMs:J

.field private currentAudioFormat:Landroidx/media3/common/Format;

.field private currentPlaybackSpeed:F

.field private currentPlaybackState:I

.field private currentPlaybackStateStartTimeMs:J

.field private currentVideoFormat:Landroidx/media3/common/Format;

.field private droppedFrames:J

.field private fatalErrorCount:I

.field private final fatalErrorHistory:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndException;",
            ">;"
        }
    .end annotation
.end field

.field private firstReportedTimeMs:J

.field private hasBeenReady:Z

.field private hasEnded:Z

.field private hasFatalError:Z

.field private initialAudioFormatBitrate:J

.field private initialVideoFormatBitrate:J

.field private initialVideoFormatHeight:I

.field private final isAd:Z

.field private isForeground:Z

.field private isInterruptedByAd:Z

.field private isJoinTimeInvalid:Z

.field private isSeeking:Z

.field private final keepHistory:Z

.field private lastAudioFormatStartTimeMs:J

.field private lastRebufferStartTimeMs:J

.field private lastVideoFormatStartTimeMs:J

.field private maxRebufferTimeMs:J

.field private final mediaTimeHistory:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[J>;"
        }
    .end annotation
.end field

.field private nonFatalErrorCount:I

.field private final nonFatalErrorHistory:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndException;",
            ">;"
        }
    .end annotation
.end field

.field private pauseBufferCount:I

.field private pauseCount:I

.field private final playbackStateDurationsMs:[J

.field private final playbackStateHistory:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndPlaybackState;",
            ">;"
        }
    .end annotation
.end field

.field private rebufferCount:I

.field private seekCount:I

.field private startedLoading:Z

.field private videoFormatBitrateTimeMs:J

.field private videoFormatBitrateTimeProduct:J

.field private videoFormatHeightTimeMs:J

.field private videoFormatHeightTimeProduct:J

.field private final videoFormatHistory:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndFormat;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ZLandroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;)V
    .locals 2

    .line 414
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 415
    iput-boolean p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->keepHistory:Z

    const/16 v0, 0x10

    .line 416
    new-array v0, v0, [J

    iput-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->playbackStateDurationsMs:[J

    if-eqz p1, :cond_0

    .line 417
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->playbackStateHistory:Ljava/util/List;

    if-eqz p1, :cond_1

    .line 418
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_1

    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->mediaTimeHistory:Ljava/util/List;

    if-eqz p1, :cond_2

    .line 419
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_2

    :cond_2
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_2
    iput-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatHistory:Ljava/util/List;

    if-eqz p1, :cond_3

    .line 420
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_3

    :cond_3
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_3
    iput-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioFormatHistory:Ljava/util/List;

    if-eqz p1, :cond_4

    .line 421
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_4

    :cond_4
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_4
    iput-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->fatalErrorHistory:Ljava/util/List;

    if-eqz p1, :cond_5

    .line 422
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_5

    :cond_5
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    :goto_5
    iput-object p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->nonFatalErrorHistory:Ljava/util/List;

    const/4 p1, 0x0

    .line 423
    iput p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    .line 424
    iget-wide v0, p2, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    iput-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackStateStartTimeMs:J

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 425
    iput-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->firstReportedTimeMs:J

    .line 426
    iput-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maxRebufferTimeMs:J

    .line 427
    iget-object v0, p2, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->mediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    if-eqz v0, :cond_6

    iget-object p2, p2, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->mediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    invoke-virtual {p2}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->isAd()Z

    move-result p2

    if-eqz p2, :cond_6

    const/4 p1, 0x1

    :cond_6
    iput-boolean p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isAd:Z

    const-wide/16 p1, -0x1

    .line 428
    iput-wide p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialAudioFormatBitrate:J

    .line 429
    iput-wide p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialVideoFormatBitrate:J

    const/4 p1, -0x1

    .line 430
    iput p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialVideoFormatHeight:I

    const/high16 p1, 0x3f800000    # 1.0f

    .line 431
    iput p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackSpeed:F

    return-void
.end method

.method private guessMediaTimeBasedOnElapsedRealtime(J)[J
    .locals 7

    .line 771
    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->mediaTimeHistory:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    const/4 v1, 0x0

    .line 772
    aget-wide v3, v0, v1

    .line 773
    aget-wide v5, v0, v2

    sub-long v3, p1, v3

    long-to-float v0, v3

    .line 774
    iget v3, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackSpeed:F

    mul-float v0, v0, v3

    float-to-long v3, v0

    add-long/2addr v5, v3

    const/4 v0, 0x2

    .line 777
    new-array v0, v0, [J

    aput-wide p1, v0, v1

    aput-wide v5, v0, v2

    return-object v0
.end method

.method private static isInvalidJoinTransition(II)Z
    .locals 4

    const/16 v0, 0xe

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq p0, v3, :cond_0

    if-eq p0, v2, :cond_0

    if-eq p0, v0, :cond_0

    return v1

    :cond_0
    if-eq p1, v3, :cond_1

    if-eq p1, v2, :cond_1

    if-eq p1, v0, :cond_1

    const/4 p0, 0x3

    if-eq p1, p0, :cond_1

    const/4 p0, 0x4

    if-eq p1, p0, :cond_1

    const/16 p0, 0x9

    if-eq p1, p0, :cond_1

    const/16 p0, 0xb

    if-eq p1, p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method private static isPausedState(I)Z
    .locals 1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/4 v0, 0x7

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static isReadyState(I)Z
    .locals 1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/16 v0, 0x9

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static isRebufferingState(I)Z
    .locals 1

    const/4 v0, 0x6

    if-eq p0, v0, :cond_1

    const/4 v0, 0x7

    if-eq p0, v0, :cond_1

    const/16 v0, 0xa

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private maybeRecordAudioFormatTime(J)V
    .locals 6

    .line 832
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentAudioFormat:Landroidx/media3/common/Format;

    if-eqz v0, :cond_0

    iget v0, v0, Landroidx/media3/common/Format;->bitrate:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 835
    iget-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->lastAudioFormatStartTimeMs:J

    sub-long v0, p1, v0

    long-to-float v0, v0

    iget v1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackSpeed:F

    mul-float v0, v0, v1

    float-to-long v0, v0

    .line 836
    iget-wide v2, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioFormatTimeMs:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioFormatTimeMs:J

    .line 837
    iget-wide v2, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioFormatBitrateTimeProduct:J

    iget-object v4, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentAudioFormat:Landroidx/media3/common/Format;

    iget v4, v4, Landroidx/media3/common/Format;->bitrate:I

    int-to-long v4, v4

    mul-long v0, v0, v4

    add-long/2addr v2, v0

    iput-wide v2, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioFormatBitrateTimeProduct:J

    .line 839
    :cond_0
    iput-wide p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->lastAudioFormatStartTimeMs:J

    return-void
.end method

.method private maybeRecordVideoFormatTime(J)V
    .locals 8

    .line 816
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentVideoFormat:Landroidx/media3/common/Format;

    if-eqz v0, :cond_1

    .line 818
    iget-wide v1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->lastVideoFormatStartTimeMs:J

    sub-long v1, p1, v1

    long-to-float v1, v1

    iget v2, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackSpeed:F

    mul-float v1, v1, v2

    float-to-long v1, v1

    .line 819
    iget v0, v0, Landroidx/media3/common/Format;->height:I

    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    .line 820
    iget-wide v4, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatHeightTimeMs:J

    add-long/2addr v4, v1

    iput-wide v4, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatHeightTimeMs:J

    .line 821
    iget-wide v4, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatHeightTimeProduct:J

    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentVideoFormat:Landroidx/media3/common/Format;

    iget v0, v0, Landroidx/media3/common/Format;->height:I

    int-to-long v6, v0

    mul-long v6, v6, v1

    add-long/2addr v4, v6

    iput-wide v4, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatHeightTimeProduct:J

    .line 823
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentVideoFormat:Landroidx/media3/common/Format;

    iget v0, v0, Landroidx/media3/common/Format;->bitrate:I

    if-eq v0, v3, :cond_1

    .line 824
    iget-wide v3, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatBitrateTimeMs:J

    add-long/2addr v3, v1

    iput-wide v3, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatBitrateTimeMs:J

    .line 825
    iget-wide v3, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatBitrateTimeProduct:J

    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentVideoFormat:Landroidx/media3/common/Format;

    iget v0, v0, Landroidx/media3/common/Format;->bitrate:I

    int-to-long v5, v0

    mul-long v1, v1, v5

    add-long/2addr v3, v1

    iput-wide v3, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatBitrateTimeProduct:J

    .line 828
    :cond_1
    iput-wide p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->lastVideoFormatStartTimeMs:J

    return-void
.end method

.method private maybeUpdateAudioFormat(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Landroidx/media3/common/Format;)V
    .locals 5

    .line 800
    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentAudioFormat:Landroidx/media3/common/Format;

    invoke-static {v0, p2}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 803
    :cond_0
    iget-wide v0, p1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    invoke-direct {p0, v0, v1}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeRecordAudioFormatTime(J)V

    if-eqz p2, :cond_1

    .line 804
    iget-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialAudioFormatBitrate:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    iget v0, p2, Landroidx/media3/common/Format;->bitrate:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 807
    iget v0, p2, Landroidx/media3/common/Format;->bitrate:I

    int-to-long v0, v0

    iput-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialAudioFormatBitrate:J

    .line 809
    :cond_1
    iput-object p2, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentAudioFormat:Landroidx/media3/common/Format;

    .line 810
    iget-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->keepHistory:Z

    if-eqz v0, :cond_2

    .line 811
    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioFormatHistory:Ljava/util/List;

    new-instance v1, Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndFormat;

    invoke-direct {v1, p1, p2}, Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndFormat;-><init>(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Landroidx/media3/common/Format;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    return-void
.end method

.method private maybeUpdateMaxRebufferTimeMs(J)V
    .locals 5

    .line 739
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    invoke-static {v0}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isRebufferingState(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 740
    iget-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->lastRebufferStartTimeMs:J

    sub-long/2addr p1, v0

    .line 741
    iget-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maxRebufferTimeMs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    cmp-long v2, p1, v0

    if-lez v2, :cond_1

    .line 742
    :cond_0
    iput-wide p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maxRebufferTimeMs:J

    :cond_1
    return-void
.end method

.method private maybeUpdateMediaTimeHistory(JJ)V
    .locals 9

    .line 748
    iget-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->keepHistory:Z

    if-nez v0, :cond_0

    return-void

    .line 751
    :cond_0
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x2

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    const/4 v6, 0x1

    if-eq v0, v1, :cond_2

    cmp-long v0, p3, v4

    if-nez v0, :cond_1

    return-void

    .line 755
    :cond_1
    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->mediaTimeHistory:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 756
    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->mediaTimeHistory:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v6

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    aget-wide v7, v0, v6

    cmp-long v0, v7, p3

    if-eqz v0, :cond_2

    .line 758
    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->mediaTimeHistory:Ljava/util/List;

    new-array v1, v3, [J

    aput-wide p1, v1, v2

    aput-wide v7, v1, v6

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    cmp-long v0, p3, v4

    if-eqz v0, :cond_3

    .line 764
    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->mediaTimeHistory:Ljava/util/List;

    new-array v1, v3, [J

    aput-wide p1, v1, v2

    aput-wide p3, v1, v6

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 765
    :cond_3
    iget-object p3, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->mediaTimeHistory:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_4

    .line 766
    iget-object p3, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->mediaTimeHistory:Ljava/util/List;

    invoke-direct {p0, p1, p2}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->guessMediaTimeBasedOnElapsedRealtime(J)[J

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    :goto_0
    return-void
.end method

.method private maybeUpdateVideoFormat(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Landroidx/media3/common/Format;)V
    .locals 6

    .line 781
    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentVideoFormat:Landroidx/media3/common/Format;

    invoke-static {v0, p2}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 784
    :cond_0
    iget-wide v0, p1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    invoke-direct {p0, v0, v1}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeRecordVideoFormatTime(J)V

    if-eqz p2, :cond_2

    .line 786
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialVideoFormatHeight:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    iget v0, p2, Landroidx/media3/common/Format;->height:I

    if-eq v0, v1, :cond_1

    .line 787
    iget v0, p2, Landroidx/media3/common/Format;->height:I

    iput v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialVideoFormatHeight:I

    .line 789
    :cond_1
    iget-wide v2, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialVideoFormatBitrate:J

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-nez v0, :cond_2

    iget v0, p2, Landroidx/media3/common/Format;->bitrate:I

    if-eq v0, v1, :cond_2

    .line 790
    iget v0, p2, Landroidx/media3/common/Format;->bitrate:I

    int-to-long v0, v0

    iput-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialVideoFormatBitrate:J

    .line 793
    :cond_2
    iput-object p2, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentVideoFormat:Landroidx/media3/common/Format;

    .line 794
    iget-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->keepHistory:Z

    if-eqz v0, :cond_3

    .line 795
    iget-object v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatHistory:Ljava/util/List;

    new-instance v1, Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndFormat;

    invoke-direct {v1, p1, p2}, Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndFormat;-><init>(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Landroidx/media3/common/Format;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    return-void
.end method

.method private resolveNewPlaybackState(Landroidx/media3/common/Player;)I
    .locals 5

    .line 694
    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlaybackState()I

    move-result v0

    .line 695
    iget-boolean v1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isSeeking:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isForeground:Z

    if-eqz v1, :cond_0

    const/4 p1, 0x5

    return p1

    .line 698
    :cond_0
    iget-boolean v1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->hasFatalError:Z

    if-eqz v1, :cond_1

    const/16 p1, 0xd

    return p1

    .line 700
    :cond_1
    iget-boolean v1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isForeground:Z

    if-nez v1, :cond_2

    .line 702
    iget-boolean p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->startedLoading:Z

    return p1

    .line 705
    :cond_2
    iget-boolean v1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isInterruptedByAd:Z

    const/16 v2, 0xe

    if-eqz v1, :cond_3

    return v2

    :cond_3
    const/4 v1, 0x4

    if-ne v0, v1, :cond_4

    const/16 p1, 0xb

    return p1

    :cond_4
    const/4 v3, 0x1

    const/4 v4, 0x2

    if-ne v0, v4, :cond_9

    .line 710
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    if-eqz v0, :cond_8

    if-eq v0, v3, :cond_8

    if-eq v0, v4, :cond_8

    if-ne v0, v2, :cond_5

    goto :goto_1

    .line 716
    :cond_5
    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlayWhenReady()Z

    move-result v0

    if-nez v0, :cond_6

    const/4 p1, 0x7

    return p1

    .line 719
    :cond_6
    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlaybackSuppressionReason()I

    move-result p1

    if-eqz p1, :cond_7

    const/16 p1, 0xa

    goto :goto_0

    :cond_7
    const/4 p1, 0x6

    :goto_0
    return p1

    :cond_8
    :goto_1
    return v4

    :cond_9
    const/4 v2, 0x3

    if-ne v0, v2, :cond_c

    .line 723
    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlayWhenReady()Z

    move-result v0

    if-nez v0, :cond_a

    return v1

    .line 726
    :cond_a
    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlaybackSuppressionReason()I

    move-result p1

    if-eqz p1, :cond_b

    const/16 v2, 0x9

    :cond_b
    return v2

    :cond_c
    if-ne v0, v3, :cond_d

    .line 729
    iget p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    if-eqz p1, :cond_d

    const/16 p1, 0xc

    return p1

    .line 735
    :cond_d
    iget p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    return p1
.end method

.method private updatePlaybackState(ILandroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;)V
    .locals 8

    .line 660
    iget-wide v0, p2, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    iget-wide v2, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackStateStartTimeMs:J

    const/4 v4, 0x0

    const/4 v5, 0x1

    cmp-long v6, v0, v2

    if-ltz v6, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 661
    iget-wide v0, p2, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    iget-wide v2, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackStateStartTimeMs:J

    sub-long/2addr v0, v2

    .line 662
    iget-object v2, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->playbackStateDurationsMs:[J

    iget v3, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    aget-wide v6, v2, v3

    add-long/2addr v6, v0

    aput-wide v6, v2, v3

    .line 663
    iget-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->firstReportedTimeMs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v6, v0, v2

    if-nez v6, :cond_1

    .line 664
    iget-wide v0, p2, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    iput-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->firstReportedTimeMs:J

    .line 666
    :cond_1
    iget-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isJoinTimeInvalid:Z

    iget v1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    invoke-static {v1, p1}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isInvalidJoinTransition(II)Z

    move-result v1

    or-int/2addr v0, v1

    iput-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isJoinTimeInvalid:Z

    .line 667
    iget-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->hasBeenReady:Z

    invoke-static {p1}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isReadyState(I)Z

    move-result v1

    or-int/2addr v0, v1

    iput-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->hasBeenReady:Z

    .line 668
    iget-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->hasEnded:Z

    const/16 v1, 0xb

    if-ne p1, v1, :cond_2

    const/4 v4, 0x1

    :cond_2
    or-int/2addr v0, v4

    iput-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->hasEnded:Z

    .line 669
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    invoke-static {v0}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isPausedState(I)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {p1}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isPausedState(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 670
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->pauseCount:I

    add-int/2addr v0, v5

    iput v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->pauseCount:I

    :cond_3
    const/4 v0, 0x5

    if-ne p1, v0, :cond_4

    .line 673
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->seekCount:I

    add-int/2addr v0, v5

    iput v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->seekCount:I

    .line 675
    :cond_4
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    invoke-static {v0}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isRebufferingState(I)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {p1}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isRebufferingState(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 676
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->rebufferCount:I

    add-int/2addr v0, v5

    iput v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->rebufferCount:I

    .line 677
    iget-wide v0, p2, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    iput-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->lastRebufferStartTimeMs:J

    .line 679
    :cond_5
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    invoke-static {v0}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isRebufferingState(I)Z

    move-result v0

    if-eqz v0, :cond_6

    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_6

    if-ne p1, v1, :cond_6

    .line 682
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->pauseBufferCount:I

    add-int/2addr v0, v5

    iput v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->pauseBufferCount:I

    .line 684
    :cond_6
    iget-wide v0, p2, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    invoke-direct {p0, v0, v1}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeUpdateMaxRebufferTimeMs(J)V

    .line 686
    iput p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    .line 687
    iget-wide v0, p2, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    iput-wide v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackStateStartTimeMs:J

    .line 688
    iget-boolean p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->keepHistory:Z

    if-eqz p1, :cond_7

    .line 689
    iget-object p1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->playbackStateHistory:Ljava/util/List;

    new-instance v0, Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndPlaybackState;

    iget v1, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    invoke-direct {v0, p2, v1}, Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndPlaybackState;-><init>(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;I)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_7
    return-void
.end method


# virtual methods
.method public build(Z)Landroidx/media3/exoplayer/analytics/PlaybackStats;
    .locals 63

    move-object/from16 v0, p0

    .line 589
    iget-object v1, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->playbackStateDurationsMs:[J

    .line 590
    iget-object v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->mediaTimeHistory:Ljava/util/List;

    const-wide/16 v3, 0x0

    if-nez p1, :cond_1

    .line 592
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 593
    iget-object v5, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->playbackStateDurationsMs:[J

    const/16 v6, 0x10

    .line 594
    invoke-static {v5, v6}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v5

    .line 595
    iget-wide v6, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackStateStartTimeMs:J

    sub-long v6, v1, v6

    invoke-static {v3, v4, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 596
    iget v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    aget-wide v9, v5, v8

    add-long/2addr v9, v6

    aput-wide v9, v5, v8

    .line 597
    invoke-direct {v0, v1, v2}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeUpdateMaxRebufferTimeMs(J)V

    .line 598
    invoke-direct {v0, v1, v2}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeRecordVideoFormatTime(J)V

    .line 599
    invoke-direct {v0, v1, v2}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeRecordAudioFormatTime(J)V

    .line 600
    new-instance v6, Ljava/util/ArrayList;

    iget-object v7, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->mediaTimeHistory:Ljava/util/List;

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 601
    iget-boolean v7, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->keepHistory:Z

    if-eqz v7, :cond_0

    iget v7, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    const/4 v8, 0x3

    if-ne v7, v8, :cond_0

    .line 602
    invoke-direct {v0, v1, v2}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->guessMediaTimeBasedOnElapsedRealtime(J)[J

    move-result-object v1

    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    move-object v9, v5

    move-object v11, v6

    goto :goto_0

    :cond_1
    move-object v9, v1

    move-object v11, v2

    .line 605
    :goto_0
    iget-boolean v1, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isJoinTimeInvalid:Z

    const/4 v5, 0x1

    if-nez v1, :cond_3

    iget-boolean v1, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->hasBeenReady:Z

    if-nez v1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v1, 0x1

    :goto_2
    if-eqz v1, :cond_4

    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_3

    :cond_4
    const/4 v6, 0x2

    .line 609
    aget-wide v6, v9, v6

    :goto_3
    move-wide/from16 v18, v6

    .line 610
    aget-wide v6, v9, v5

    cmp-long v8, v6, v3

    if-lez v8, :cond_5

    const/16 v17, 0x1

    goto :goto_4

    :cond_5
    const/16 v17, 0x0

    :goto_4
    if-eqz p1, :cond_6

    .line 613
    iget-object v3, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatHistory:Ljava/util/List;

    goto :goto_5

    :cond_6
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatHistory:Ljava/util/List;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_5
    move-object/from16 v28, v3

    if-eqz p1, :cond_7

    .line 615
    iget-object v3, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioFormatHistory:Ljava/util/List;

    goto :goto_6

    :cond_7
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioFormatHistory:Ljava/util/List;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_6
    move-object/from16 v29, v3

    .line 616
    new-instance v3, Landroidx/media3/exoplayer/analytics/PlaybackStats;

    if-eqz p1, :cond_8

    .line 619
    iget-object v4, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->playbackStateHistory:Ljava/util/List;

    goto :goto_7

    :cond_8
    new-instance v4, Ljava/util/ArrayList;

    iget-object v6, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->playbackStateHistory:Ljava/util/List;

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_7
    move-object v10, v4

    iget-wide v12, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->firstReportedTimeMs:J

    .line 622
    iget-boolean v14, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isForeground:Z

    .line 623
    iget-boolean v4, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->hasBeenReady:Z

    xor-int/lit8 v15, v4, 0x1

    .line 624
    iget-boolean v4, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->hasEnded:Z

    xor-int/lit8 v20, v1, 0x1

    .line 627
    iget v1, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->pauseCount:I

    iget v6, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->pauseBufferCount:I

    iget v7, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->seekCount:I

    iget v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->rebufferCount:I

    move/from16 v22, v6

    iget-wide v5, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maxRebufferTimeMs:J

    .line 633
    iget-boolean v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isAd:Z

    move/from16 v24, v8

    move-object/from16 v23, v9

    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatHeightTimeMs:J

    move-wide/from16 v25, v8

    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatHeightTimeProduct:J

    move-wide/from16 v30, v8

    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatBitrateTimeMs:J

    move-wide/from16 v32, v8

    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->videoFormatBitrateTimeProduct:J

    move-wide/from16 v34, v8

    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioFormatTimeMs:J

    move-wide/from16 v36, v8

    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioFormatBitrateTimeProduct:J

    move-wide/from16 v38, v8

    .line 642
    iget v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialVideoFormatHeight:I

    const/4 v9, -0x1

    move/from16 v27, v8

    if-ne v8, v9, :cond_9

    const/16 v42, 0x0

    goto :goto_8

    :cond_9
    const/16 v42, 0x1

    .line 643
    :goto_8
    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialVideoFormatBitrate:J

    const-wide/16 v40, -0x1

    cmp-long v43, v8, v40

    move-wide/from16 v44, v8

    if-nez v43, :cond_a

    const/16 v43, 0x0

    goto :goto_9

    :cond_a
    const/16 v43, 0x1

    .line 646
    :goto_9
    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->initialAudioFormatBitrate:J

    cmp-long v46, v8, v40

    move-wide/from16 v40, v8

    if-nez v46, :cond_b

    const/16 v47, 0x0

    goto :goto_a

    :cond_b
    const/16 v47, 0x1

    :goto_a
    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->bandwidthTimeMs:J

    move-wide/from16 v48, v8

    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->bandwidthBytes:J

    move-wide/from16 v50, v8

    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->droppedFrames:J

    move-wide/from16 v52, v8

    iget-wide v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioUnderruns:J

    move-wide/from16 v54, v8

    .line 652
    iget v8, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->fatalErrorCount:I

    if-lez v8, :cond_c

    const/16 v58, 0x1

    goto :goto_b

    :cond_c
    const/16 v58, 0x0

    :goto_b
    iget v9, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->nonFatalErrorCount:I

    move/from16 v60, v9

    iget-object v9, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->fatalErrorHistory:Ljava/util/List;

    move-object/from16 v61, v9

    iget-object v9, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->nonFatalErrorHistory:Ljava/util/List;

    move-object/from16 v62, v9

    const/4 v9, 0x1

    move/from16 v59, v8

    move-wide/from16 v45, v44

    move-wide/from16 v56, v54

    move/from16 v44, v27

    move-wide/from16 v54, v52

    move-wide/from16 v52, v50

    move-wide/from16 v50, v48

    move-wide/from16 v48, v40

    move-wide/from16 v40, v38

    move-wide/from16 v38, v36

    move-wide/from16 v36, v34

    move-wide/from16 v34, v32

    move-wide/from16 v32, v30

    move-wide/from16 v30, v25

    move v8, v9

    move/from16 v25, v7

    move-object v7, v3

    move-object/from16 v9, v23

    move/from16 v16, v4

    move/from16 v21, v1

    move/from16 v23, v25

    move-wide/from16 v25, v5

    move/from16 v27, v2

    invoke-direct/range {v7 .. v62}, Landroidx/media3/exoplayer/analytics/PlaybackStats;-><init>(I[JLjava/util/List;Ljava/util/List;JIIIIJIIIIIJILjava/util/List;Ljava/util/List;JJJJJJIIIJIJJJJJIIILjava/util/List;Ljava/util/List;)V

    return-object v3
.end method

.method public onEvents(Landroidx/media3/common/Player;Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;ZJZIZZLandroidx/media3/common/PlaybackException;Ljava/lang/Exception;JJLandroidx/media3/common/Format;Landroidx/media3/common/Format;Landroidx/media3/common/VideoSize;)V
    .locals 14

    move-object v0, p0

    move-object/from16 v1, p2

    move-wide/from16 v2, p4

    move-object/from16 v4, p10

    move-object/from16 v5, p11

    move-object/from16 v6, p16

    move-object/from16 v7, p17

    move-object/from16 v8, p18

    const/4 v9, 0x1

    const-wide v10, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v12, v2, v10

    if-eqz v12, :cond_0

    .line 505
    iget-wide v12, v1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    invoke-direct {p0, v12, v13, v2, v3}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeUpdateMediaTimeHistory(JJ)V

    .line 506
    iput-boolean v9, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isSeeking:Z

    .line 508
    :cond_0
    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlaybackState()I

    move-result v2

    const/4 v3, 0x2

    const/4 v12, 0x0

    if-eq v2, v3, :cond_1

    .line 509
    iput-boolean v12, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isSeeking:Z

    .line 511
    :cond_1
    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlaybackState()I

    move-result v2

    if-eq v2, v9, :cond_2

    const/4 v13, 0x4

    if-eq v2, v13, :cond_2

    if-eqz p6, :cond_3

    .line 515
    :cond_2
    iput-boolean v12, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isInterruptedByAd:Z

    :cond_3
    if-eqz v4, :cond_4

    .line 518
    iput-boolean v9, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->hasFatalError:Z

    .line 519
    iget v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->fatalErrorCount:I

    add-int/2addr v2, v9

    iput v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->fatalErrorCount:I

    .line 520
    iget-boolean v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->keepHistory:Z

    if-eqz v2, :cond_5

    .line 521
    iget-object v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->fatalErrorHistory:Ljava/util/List;

    new-instance v12, Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndException;

    invoke-direct {v12, v1, v4}, Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndException;-><init>(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Ljava/lang/Exception;)V

    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 523
    :cond_4
    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlayerError()Landroidx/media3/common/PlaybackException;

    move-result-object v2

    if-nez v2, :cond_5

    .line 524
    iput-boolean v12, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->hasFatalError:Z

    .line 526
    :cond_5
    :goto_0
    iget-boolean v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isForeground:Z

    if-eqz v2, :cond_7

    iget-boolean v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isInterruptedByAd:Z

    if-nez v2, :cond_7

    .line 527
    invoke-interface {p1}, Landroidx/media3/common/Player;->getCurrentTracks()Landroidx/media3/common/Tracks;

    move-result-object v2

    .line 528
    invoke-virtual {v2, v3}, Landroidx/media3/common/Tracks;->isTypeSelected(I)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_6

    .line 529
    invoke-direct {p0, v1, v4}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeUpdateVideoFormat(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Landroidx/media3/common/Format;)V

    .line 531
    :cond_6
    invoke-virtual {v2, v9}, Landroidx/media3/common/Tracks;->isTypeSelected(I)Z

    move-result v2

    if-nez v2, :cond_7

    .line 532
    invoke-direct {p0, v1, v4}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeUpdateAudioFormat(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Landroidx/media3/common/Format;)V

    :cond_7
    if-eqz v6, :cond_8

    .line 536
    invoke-direct {p0, v1, v6}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeUpdateVideoFormat(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Landroidx/media3/common/Format;)V

    :cond_8
    if-eqz v7, :cond_9

    .line 539
    invoke-direct {p0, v1, v7}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeUpdateAudioFormat(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Landroidx/media3/common/Format;)V

    .line 541
    :cond_9
    iget-object v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentVideoFormat:Landroidx/media3/common/Format;

    if-eqz v2, :cond_a

    iget v2, v2, Landroidx/media3/common/Format;->height:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_a

    if-eqz v8, :cond_a

    .line 544
    iget-object v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentVideoFormat:Landroidx/media3/common/Format;

    .line 546
    invoke-virtual {v2}, Landroidx/media3/common/Format;->buildUpon()Landroidx/media3/common/Format$Builder;

    move-result-object v2

    iget v3, v8, Landroidx/media3/common/VideoSize;->width:I

    .line 547
    invoke-virtual {v2, v3}, Landroidx/media3/common/Format$Builder;->setWidth(I)Landroidx/media3/common/Format$Builder;

    move-result-object v2

    iget v3, v8, Landroidx/media3/common/VideoSize;->height:I

    .line 548
    invoke-virtual {v2, v3}, Landroidx/media3/common/Format$Builder;->setHeight(I)Landroidx/media3/common/Format$Builder;

    move-result-object v2

    .line 549
    invoke-virtual {v2}, Landroidx/media3/common/Format$Builder;->build()Landroidx/media3/common/Format;

    move-result-object v2

    .line 550
    invoke-direct {p0, v1, v2}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeUpdateVideoFormat(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Landroidx/media3/common/Format;)V

    :cond_a
    if-eqz p9, :cond_b

    .line 553
    iput-boolean v9, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->startedLoading:Z

    :cond_b
    if-eqz p8, :cond_c

    .line 556
    iget-wide v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioUnderruns:J

    const-wide/16 v6, 0x1

    add-long/2addr v2, v6

    iput-wide v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->audioUnderruns:J

    .line 558
    :cond_c
    iget-wide v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->droppedFrames:J

    move/from16 v4, p7

    int-to-long v6, v4

    add-long/2addr v2, v6

    iput-wide v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->droppedFrames:J

    .line 559
    iget-wide v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->bandwidthTimeMs:J

    add-long v2, v2, p12

    iput-wide v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->bandwidthTimeMs:J

    .line 560
    iget-wide v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->bandwidthBytes:J

    add-long v2, v2, p14

    iput-wide v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->bandwidthBytes:J

    if-eqz v5, :cond_d

    .line 562
    iget v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->nonFatalErrorCount:I

    add-int/2addr v2, v9

    iput v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->nonFatalErrorCount:I

    .line 563
    iget-boolean v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->keepHistory:Z

    if-eqz v2, :cond_d

    .line 564
    iget-object v2, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->nonFatalErrorHistory:Ljava/util/List;

    new-instance v3, Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndException;

    invoke-direct {v3, v1, v5}, Landroidx/media3/exoplayer/analytics/PlaybackStats$EventTimeAndException;-><init>(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;Ljava/lang/Exception;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 568
    :cond_d
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->resolveNewPlaybackState(Landroidx/media3/common/Player;)I

    move-result v2

    .line 569
    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;

    move-result-object v3

    iget v3, v3, Landroidx/media3/common/PlaybackParameters;->speed:F

    .line 570
    iget v4, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    if-ne v4, v2, :cond_e

    iget v4, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackSpeed:F

    cmpl-float v4, v4, v3

    if-eqz v4, :cond_10

    .line 571
    :cond_e
    iget-wide v4, v1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    if-eqz p3, :cond_f

    .line 573
    iget-wide v10, v1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->eventPlaybackPositionMs:J

    .line 571
    :cond_f
    invoke-direct {p0, v4, v5, v10, v11}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeUpdateMediaTimeHistory(JJ)V

    .line 574
    iget-wide v4, v1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    invoke-direct {p0, v4, v5}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeRecordVideoFormatTime(J)V

    .line 575
    iget-wide v4, v1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    invoke-direct {p0, v4, v5}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeRecordAudioFormatTime(J)V

    .line 577
    :cond_10
    iput v3, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackSpeed:F

    .line 578
    iget v3, v0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    if-eq v3, v2, :cond_11

    .line 579
    invoke-direct {p0, v2, v1}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->updatePlaybackState(ILandroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;)V

    :cond_11
    return-void
.end method

.method public onFinished(Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;ZJ)V
    .locals 4

    .line 459
    iget v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->currentPlaybackState:I

    const/16 v1, 0xb

    if-eq v0, v1, :cond_1

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const/16 v1, 0xf

    .line 462
    :cond_1
    :goto_0
    iget-wide v2, p1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    invoke-direct {p0, v2, v3, p3, p4}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeUpdateMediaTimeHistory(JJ)V

    .line 463
    iget-wide p2, p1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    invoke-direct {p0, p2, p3}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeRecordVideoFormatTime(J)V

    .line 464
    iget-wide p2, p1, Landroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;->realtimeMs:J

    invoke-direct {p0, p2, p3}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->maybeRecordAudioFormatTime(J)V

    .line 465
    invoke-direct {p0, v1, p1}, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->updatePlaybackState(ILandroidx/media3/exoplayer/analytics/AnalyticsListener$EventTime;)V

    return-void
.end method

.method public onForeground()V
    .locals 1

    const/4 v0, 0x1

    .line 436
    iput-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isForeground:Z

    return-void
.end method

.method public onInterruptedByAd()V
    .locals 1

    const/4 v0, 0x1

    .line 441
    iput-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isInterruptedByAd:Z

    const/4 v0, 0x0

    .line 442
    iput-boolean v0, p0, Landroidx/media3/exoplayer/analytics/PlaybackStatsListener$PlaybackStatsTracker;->isSeeking:Z

    return-void
.end method
