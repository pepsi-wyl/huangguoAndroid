.class final Landroidx/media3/exoplayer/MediaPeriodQueue;
.super Ljava/lang/Object;
.source "MediaPeriodQueue.java"


# static fields
.field public static final INITIAL_RENDERER_POSITION_OFFSET_US:J = 0xe8d4a51000L

.field private static final MAXIMUM_BUFFER_AHEAD_PERIODS:I = 0x64


# instance fields
.field private final analyticsCollector:Landroidx/media3/exoplayer/analytics/AnalyticsCollector;

.field private final analyticsCollectorHandler:Landroidx/media3/common/util/HandlerWrapper;

.field private length:I

.field private loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

.field private final mediaPeriodHolderFactory:Landroidx/media3/exoplayer/MediaPeriodHolder$Factory;

.field private nextWindowSequenceNumber:J

.field private oldFrontPeriodUid:Ljava/lang/Object;

.field private oldFrontPeriodWindowSequenceNumber:J

.field private final period:Landroidx/media3/common/Timeline$Period;

.field private playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

.field private preloadConfiguration:Landroidx/media3/exoplayer/ExoPlayer$PreloadConfiguration;

.field private preloadPriorityList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/MediaPeriodHolder;",
            ">;"
        }
    .end annotation
.end field

.field private reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

.field private repeatMode:I

.field private shuffleModeEnabled:Z

.field private final window:Landroidx/media3/common/Timeline$Window;


# direct methods
.method public constructor <init>(Landroidx/media3/exoplayer/analytics/AnalyticsCollector;Landroidx/media3/common/util/HandlerWrapper;Landroidx/media3/exoplayer/MediaPeriodHolder$Factory;Landroidx/media3/exoplayer/ExoPlayer$PreloadConfiguration;)V
    .locals 0

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->analyticsCollector:Landroidx/media3/exoplayer/analytics/AnalyticsCollector;

    .line 105
    iput-object p2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->analyticsCollectorHandler:Landroidx/media3/common/util/HandlerWrapper;

    .line 106
    iput-object p3, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->mediaPeriodHolderFactory:Landroidx/media3/exoplayer/MediaPeriodHolder$Factory;

    .line 107
    iput-object p4, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadConfiguration:Landroidx/media3/exoplayer/ExoPlayer$PreloadConfiguration;

    .line 108
    new-instance p1, Landroidx/media3/common/Timeline$Period;

    invoke-direct {p1}, Landroidx/media3/common/Timeline$Period;-><init>()V

    iput-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    .line 109
    new-instance p1, Landroidx/media3/common/Timeline$Window;

    invoke-direct {p1}, Landroidx/media3/common/Timeline$Window;-><init>()V

    iput-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    .line 110
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadPriorityList:Ljava/util/List;

    return-void
.end method

.method static areDurationsCompatible(JJ)Z
    .locals 3

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v2, p0, v0

    if-eqz v2, :cond_1

    cmp-long v0, p0, p2

    if-nez v0, :cond_0

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

.method private canKeepMediaPeriodHolder(Landroidx/media3/exoplayer/MediaPeriodInfo;Landroidx/media3/exoplayer/MediaPeriodInfo;)Z
    .locals 5

    .line 748
    iget-wide v0, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->startPositionUs:J

    iget-wide v2, p2, Landroidx/media3/exoplayer/MediaPeriodInfo;->startPositionUs:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    iget-object p1, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-object p2, p2, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    invoke-virtual {p1, p2}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private getDefaultPeriodPositionOfNextWindow(Landroidx/media3/common/Timeline;Ljava/lang/Object;J)Landroid/util/Pair;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/common/Timeline;",
            "Ljava/lang/Object;",
            "J)",
            "Landroid/util/Pair<",
            "Ljava/lang/Object;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 314
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    .line 316
    invoke-virtual {p1, p2, v0}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    move-result-object p2

    iget p2, p2, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    iget v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->repeatMode:I

    iget-boolean v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->shuffleModeEnabled:Z

    .line 315
    invoke-virtual {p1, p2, v0, v1}, Landroidx/media3/common/Timeline;->getNextWindowIndex(IIZ)I

    move-result v5

    const/4 p2, -0x1

    if-eq v5, p2, :cond_0

    .line 318
    iget-object v3, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    iget-object v4, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    move-object v2, p1

    move-wide v8, p3

    invoke-virtual/range {v2 .. v9}, Landroidx/media3/common/Timeline;->getPeriodPositionUs(Landroidx/media3/common/Timeline$Window;Landroidx/media3/common/Timeline$Period;IJJ)Landroid/util/Pair;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private getFirstMediaPeriodInfo(Landroidx/media3/exoplayer/PlaybackInfo;)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 7

    .line 806
    iget-object v1, p1, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    iget-object v2, p1, Landroidx/media3/exoplayer/PlaybackInfo;->periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v3, p1, Landroidx/media3/exoplayer/PlaybackInfo;->requestedContentPositionUs:J

    iget-wide v5, p1, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMediaPeriodInfo(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJ)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object p1

    return-object p1
.end method

.method private getFirstMediaPeriodInfoOfNextPeriod(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/MediaPeriodHolder;J)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 20

    move-object/from16 v7, p0

    move-object/from16 v6, p1

    move-object/from16 v14, p2

    .line 856
    iget-object v15, v14, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    .line 857
    iget-object v0, v15, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-object v0, v0, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    invoke-virtual {v6, v0}, Landroidx/media3/common/Timeline;->getIndexOfPeriod(Ljava/lang/Object;)I

    move-result v1

    .line 858
    iget-object v2, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget-object v3, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    iget v4, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->repeatMode:I

    iget-boolean v5, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->shuffleModeEnabled:Z

    move-object/from16 v0, p1

    .line 859
    invoke-virtual/range {v0 .. v5}, Landroidx/media3/common/Timeline;->getNextPeriodIndex(ILandroidx/media3/common/Timeline$Period;Landroidx/media3/common/Timeline$Window;IZ)I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return-object v2

    .line 867
    :cond_0
    iget-object v1, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    const/4 v3, 0x1

    .line 868
    invoke-virtual {v6, v0, v1, v3}, Landroidx/media3/common/Timeline;->getPeriod(ILandroidx/media3/common/Timeline$Period;Z)Landroidx/media3/common/Timeline$Period;

    move-result-object v1

    iget v11, v1, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    .line 869
    iget-object v1, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget-object v1, v1, Landroidx/media3/common/Timeline$Period;->uid:Ljava/lang/Object;

    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 870
    iget-object v3, v15, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v3, v3, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    .line 871
    iget-object v5, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    invoke-virtual {v6, v11, v5}, Landroidx/media3/common/Timeline;->getWindow(ILandroidx/media3/common/Timeline$Window;)Landroidx/media3/common/Timeline$Window;

    move-result-object v5

    iget v5, v5, Landroidx/media3/common/Timeline$Window;->firstPeriodIndex:I

    const-wide v16, -0x7fffffffffffffffL    # -4.9E-324

    const-wide/16 v8, 0x0

    if-ne v5, v0, :cond_4

    .line 877
    iget-object v0, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    iget-object v10, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    move-wide/from16 v3, p3

    .line 883
    invoke-static {v8, v9, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    move-object/from16 v8, p1

    move-object v9, v0

    move-object v0, v15

    move-wide v14, v3

    .line 878
    invoke-virtual/range {v8 .. v15}, Landroidx/media3/common/Timeline;->getPeriodPositionUs(Landroidx/media3/common/Timeline$Window;Landroidx/media3/common/Timeline$Period;IJJ)Landroid/util/Pair;

    move-result-object v1

    if-nez v1, :cond_1

    return-object v2

    .line 887
    :cond_1
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 888
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 889
    invoke-virtual/range {p2 .. p2}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 890
    iget-object v3, v1, Landroidx/media3/exoplayer/MediaPeriodHolder;->uid:Ljava/lang/Object;

    invoke-virtual {v3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 891
    iget-object v1, v1, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-object v1, v1, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v3, v1, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    :cond_2
    :goto_0
    move-wide v12, v3

    move-wide/from16 v3, v16

    move-wide/from16 v18, v8

    move-object v9, v2

    move-wide/from16 v1, v18

    goto :goto_1

    .line 894
    :cond_3
    invoke-direct {v7, v2}, Landroidx/media3/exoplayer/MediaPeriodQueue;->resolvePeriodUidToWindowSequenceNumberInPreloadPeriods(Ljava/lang/Object;)J

    move-result-wide v3

    const-wide/16 v10, -0x1

    cmp-long v1, v3, v10

    if-nez v1, :cond_2

    .line 897
    iget-wide v3, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->nextWindowSequenceNumber:J

    const-wide/16 v10, 0x1

    add-long/2addr v10, v3

    iput-wide v10, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->nextWindowSequenceNumber:J

    goto :goto_0

    :cond_4
    move-object v0, v15

    move-wide v12, v3

    move-wide v3, v8

    move-object v9, v1

    move-wide v1, v3

    .line 903
    :goto_1
    iget-object v14, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    iget-object v15, v7, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    move-object/from16 v8, p1

    move-wide v10, v1

    .line 904
    invoke-static/range {v8 .. v15}, Landroidx/media3/exoplayer/MediaPeriodQueue;->resolveMediaPeriodIdForAds(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJLandroidx/media3/common/Timeline$Window;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move-result-object v5

    cmp-long v8, v3, v16

    if-eqz v8, :cond_6

    .line 906
    iget-wide v8, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    cmp-long v10, v8, v16

    if-eqz v10, :cond_6

    .line 908
    iget-object v8, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-object v8, v8, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    .line 909
    invoke-direct {v7, v8, v6}, Landroidx/media3/exoplayer/MediaPeriodQueue;->hasServerSideInsertedAds(Ljava/lang/Object;Landroidx/media3/common/Timeline;)Z

    move-result v8

    .line 911
    invoke-virtual {v5}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->isAd()Z

    move-result v9

    if-eqz v9, :cond_5

    if-eqz v8, :cond_5

    .line 913
    iget-wide v3, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    goto :goto_2

    :cond_5
    if-eqz v8, :cond_6

    .line 916
    iget-wide v0, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    move-wide v8, v0

    goto :goto_3

    :cond_6
    :goto_2
    move-wide v8, v1

    :goto_3
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v2, v5

    move-wide v5, v8

    .line 919
    invoke-direct/range {v0 .. v6}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMediaPeriodInfo(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJ)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object v0

    return-object v0
.end method

.method private getFollowingMediaPeriodInfo(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/MediaPeriodHolder;J)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 5

    .line 830
    iget-object v0, p2, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    .line 835
    invoke-virtual {p2}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getRendererOffset()J

    move-result-wide v1

    iget-wide v3, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    add-long/2addr v1, v3

    sub-long/2addr v1, p3

    .line 836
    iget-boolean p3, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelinePeriod:Z

    if-eqz p3, :cond_0

    .line 837
    invoke-direct {p0, p1, p2, v1, v2}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getFirstMediaPeriodInfoOfNextPeriod(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/MediaPeriodHolder;J)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object p1

    goto :goto_0

    .line 838
    :cond_0
    invoke-direct {p0, p1, p2, v1, v2}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getFollowingMediaPeriodInfoOfCurrentPeriod(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/MediaPeriodHolder;J)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private getFollowingMediaPeriodInfoOfCurrentPeriod(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/MediaPeriodHolder;J)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 14

    move-object v9, p0

    move-object v8, p1

    move-object/from16 v0, p2

    .line 934
    iget-object v10, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    .line 935
    iget-object v11, v10, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    .line 936
    iget-object v1, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget-object v2, v9, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {p1, v1, v2}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    .line 937
    invoke-virtual {v11}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->isAd()Z

    move-result v1

    const/4 v2, -0x1

    if-eqz v1, :cond_4

    .line 938
    iget v3, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adGroupIndex:I

    .line 939
    iget-object v0, v9, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {v0, v3}, Landroidx/media3/common/Timeline$Period;->getAdCountInAdGroup(I)I

    move-result v0

    const/4 v12, 0x0

    if-ne v0, v2, :cond_0

    return-object v12

    .line 943
    :cond_0
    iget-object v1, v9, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v2, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adIndexInAdGroup:I

    .line 944
    invoke-virtual {v1, v3, v2}, Landroidx/media3/common/Timeline$Period;->getNextAdIndexToPlay(II)I

    move-result v4

    if-ge v4, v0, :cond_1

    .line 947
    iget-object v2, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget-wide v5, v10, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    iget-wide v10, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    move-object v0, p0

    move-object v1, p1

    move-wide v7, v10

    invoke-direct/range {v0 .. v8}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMediaPeriodInfoForAd(Landroidx/media3/common/Timeline;Ljava/lang/Object;IIJJ)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object v0

    return-object v0

    .line 956
    :cond_1
    iget-wide v0, v10, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-nez v4, :cond_3

    .line 961
    iget-object v1, v9, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    iget-object v2, v9, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v3, v2, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    const-wide/16 v4, 0x0

    move-wide/from16 v6, p3

    .line 967
    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    move-object v0, p1

    .line 962
    invoke-virtual/range {v0 .. v7}, Landroidx/media3/common/Timeline;->getPeriodPositionUs(Landroidx/media3/common/Timeline$Window;Landroidx/media3/common/Timeline$Period;IJJ)Landroid/util/Pair;

    move-result-object v0

    if-nez v0, :cond_2

    return-object v12

    .line 971
    :cond_2
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 973
    :cond_3
    iget-object v2, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget v3, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adGroupIndex:I

    .line 974
    invoke-direct {p0, p1, v2, v3}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMinStartPositionAfterAdGroupUs(Landroidx/media3/common/Timeline;Ljava/lang/Object;I)J

    move-result-wide v2

    .line 976
    iget-object v4, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    .line 979
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    iget-wide v12, v10, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    iget-wide v10, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    move-object v0, p0

    move-object v1, p1

    move-object v2, v4

    move-wide v3, v5

    move-wide v5, v12

    move-wide v7, v10

    .line 976
    invoke-direct/range {v0 .. v8}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMediaPeriodInfoForContent(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJJ)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object v0

    return-object v0

    :cond_4
    move-wide/from16 v6, p3

    .line 983
    iget v1, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    if-eq v1, v2, :cond_5

    iget-object v1, v9, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v2, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    .line 984
    invoke-virtual {v1, v2}, Landroidx/media3/common/Timeline$Period;->isLivePostrollPlaceholder(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 986
    invoke-direct/range {p0 .. p4}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getFirstMediaPeriodInfoOfNextPeriod(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/MediaPeriodHolder;J)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object v0

    return-object v0

    .line 989
    :cond_5
    iget-object v0, v9, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v1, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    invoke-virtual {v0, v1}, Landroidx/media3/common/Timeline$Period;->getFirstAdIndexToPlay(I)I

    move-result v4

    .line 990
    iget-object v0, v9, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v1, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    .line 991
    invoke-virtual {v0, v1}, Landroidx/media3/common/Timeline$Period;->isServerSideInsertedAdGroup(I)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, v9, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v1, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    .line 992
    invoke-virtual {v0, v1, v4}, Landroidx/media3/common/Timeline$Period;->getAdState(II)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_6

    const/4 v0, 0x1

    goto :goto_0

    :cond_6
    const/4 v0, 0x0

    .line 994
    :goto_0
    iget-object v1, v9, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v2, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    invoke-virtual {v1, v2}, Landroidx/media3/common/Timeline$Period;->getAdCountInAdGroup(I)I

    move-result v1

    if-eq v4, v1, :cond_8

    if-eqz v0, :cond_7

    goto :goto_1

    .line 1008
    :cond_7
    iget-object v2, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget v3, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    iget-wide v5, v10, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    iget-wide v10, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    move-object v0, p0

    move-object v1, p1

    move-wide v7, v10

    invoke-direct/range {v0 .. v8}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMediaPeriodInfoForAd(Landroidx/media3/common/Timeline;Ljava/lang/Object;IIJJ)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object v0

    return-object v0

    .line 998
    :cond_8
    :goto_1
    iget-object v0, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget v1, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    .line 999
    invoke-direct {p0, p1, v0, v1}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMinStartPositionAfterAdGroupUs(Landroidx/media3/common/Timeline;Ljava/lang/Object;I)J

    move-result-wide v3

    .line 1001
    iget-object v2, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget-wide v5, v10, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    iget-wide v10, v11, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    move-object v0, p0

    move-object v1, p1

    move-wide v7, v10

    invoke-direct/range {v0 .. v8}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMediaPeriodInfoForContent(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJJ)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object v0

    return-object v0
.end method

.method private getMediaPeriodInfo(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJ)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 12

    move-object v0, p2

    .line 1028
    iget-object v1, v0, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    move-object v11, p0

    iget-object v2, v11, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    move-object v3, p1

    invoke-virtual {p1, v1, v2}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    .line 1029
    invoke-virtual {p2}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->isAd()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1030
    iget-object v4, v0, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget v5, v0, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adGroupIndex:I

    iget v6, v0, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adIndexInAdGroup:I

    iget-wide v9, v0, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    move-object v2, p0

    move-object v3, p1

    move-wide v7, p3

    invoke-direct/range {v2 .. v10}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMediaPeriodInfoForAd(Landroidx/media3/common/Timeline;Ljava/lang/Object;IIJJ)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object v0

    return-object v0

    .line 1038
    :cond_0
    iget-object v4, v0, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget-wide v9, v0, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    move-object v2, p0

    move-object v3, p1

    move-wide/from16 v5, p5

    move-wide v7, p3

    invoke-direct/range {v2 .. v10}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMediaPeriodInfoForContent(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJJ)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object v0

    return-object v0
.end method

.method private getMediaPeriodInfoForAd(Landroidx/media3/common/Timeline;Ljava/lang/Object;IIJJ)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 18

    move-object/from16 v0, p0

    .line 1054
    new-instance v7, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move-object v1, v7

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-wide/from16 v5, p7

    invoke-direct/range {v1 .. v6}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;-><init>(Ljava/lang/Object;IIJ)V

    .line 1056
    iget-object v1, v7, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget-object v2, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    move-object/from16 v3, p1

    .line 1058
    invoke-virtual {v3, v1, v2}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    move-result-object v1

    iget v2, v7, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adGroupIndex:I

    iget v3, v7, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adIndexInAdGroup:I

    .line 1059
    invoke-virtual {v1, v2, v3}, Landroidx/media3/common/Timeline$Period;->getAdDurationUs(II)J

    move-result-wide v9

    .line 1061
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    move/from16 v2, p3

    invoke-virtual {v1, v2}, Landroidx/media3/common/Timeline$Period;->getFirstAdIndexToPlay(I)I

    move-result v1

    const-wide/16 v2, 0x0

    if-ne v4, v1, :cond_0

    .line 1062
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {v1}, Landroidx/media3/common/Timeline$Period;->getAdResumePositionUs()J

    move-result-wide v4

    goto :goto_0

    :cond_0
    move-wide v4, v2

    .line 1064
    :goto_0
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v6, v7, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adGroupIndex:I

    .line 1065
    invoke-virtual {v1, v6}, Landroidx/media3/common/Timeline$Period;->isServerSideInsertedAdGroup(I)Z

    move-result v11

    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v1, v9, v12

    if-eqz v1, :cond_1

    cmp-long v1, v4, v9

    if-ltz v1, :cond_1

    const-wide/16 v4, 0x1

    sub-long v4, v9, v4

    .line 1068
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    move-wide v3, v1

    goto :goto_1

    :cond_1
    move-wide v3, v4

    .line 1070
    :goto_1
    new-instance v15, Landroidx/media3/exoplayer/MediaPeriodInfo;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const-wide v16, -0x7fffffffffffffffL    # -4.9E-324

    const/4 v12, 0x0

    move-object v1, v15

    move-object v2, v7

    move-wide/from16 v5, p5

    move-wide/from16 v7, v16

    invoke-direct/range {v1 .. v14}, Landroidx/media3/exoplayer/MediaPeriodInfo;-><init>(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJJJZZZZ)V

    return-object v15
.end method

.method private getMediaPeriodInfoForContent(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJJ)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-wide/from16 v3, p3

    .line 1088
    iget-object v5, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {v1, v2, v5}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    .line 1089
    iget-object v5, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {v5, v3, v4}, Landroidx/media3/common/Timeline$Period;->getAdGroupIndexAfterPositionUs(J)I

    move-result v5

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, -0x1

    if-eq v5, v8, :cond_0

    .line 1090
    iget-object v9, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    .line 1091
    invoke-virtual {v9, v5}, Landroidx/media3/common/Timeline$Period;->isLivePostrollPlaceholder(I)Z

    move-result v9

    if-eqz v9, :cond_0

    const/4 v9, 0x1

    goto :goto_0

    :cond_0
    const/4 v9, 0x0

    :goto_0
    if-ne v5, v8, :cond_1

    .line 1095
    iget-object v10, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    .line 1096
    invoke-virtual {v10}, Landroidx/media3/common/Timeline$Period;->getAdGroupCount()I

    move-result v10

    if-lez v10, :cond_2

    iget-object v10, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    .line 1097
    invoke-virtual {v10}, Landroidx/media3/common/Timeline$Period;->getRemovedAdGroupCount()I

    move-result v11

    invoke-virtual {v10, v11}, Landroidx/media3/common/Timeline$Period;->isServerSideInsertedAdGroup(I)Z

    move-result v10

    if-eqz v10, :cond_2

    goto :goto_1

    .line 1098
    :cond_1
    iget-object v10, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {v10, v5}, Landroidx/media3/common/Timeline$Period;->isServerSideInsertedAdGroup(I)Z

    move-result v10

    if-eqz v10, :cond_2

    iget-object v10, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    .line 1099
    invoke-virtual {v10, v5}, Landroidx/media3/common/Timeline$Period;->getAdGroupTimeUs(I)J

    move-result-wide v10

    iget-object v12, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget-wide v12, v12, Landroidx/media3/common/Timeline$Period;->durationUs:J

    cmp-long v14, v10, v12

    if-nez v14, :cond_2

    iget-object v10, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    .line 1100
    invoke-virtual {v10, v5}, Landroidx/media3/common/Timeline$Period;->hasPlayedAdGroup(I)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v5, -0x1

    :goto_1
    const/4 v10, 0x1

    goto :goto_2

    :cond_2
    const/4 v10, 0x0

    .line 1106
    :goto_2
    new-instance v12, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move-wide/from16 v13, p7

    invoke-direct {v12, v2, v13, v14, v5}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;-><init>(Ljava/lang/Object;JI)V

    .line 1107
    invoke-direct {v0, v12}, Landroidx/media3/exoplayer/MediaPeriodQueue;->isLastInPeriod(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;)Z

    move-result v2

    .line 1108
    invoke-direct {v0, v1, v12}, Landroidx/media3/exoplayer/MediaPeriodQueue;->isLastInWindow(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;)Z

    move-result v23

    .line 1109
    invoke-direct {v0, v1, v12, v2}, Landroidx/media3/exoplayer/MediaPeriodQueue;->isLastInTimeline(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;Z)Z

    move-result v24

    if-eq v5, v8, :cond_3

    .line 1110
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    .line 1112
    invoke-virtual {v1, v5}, Landroidx/media3/common/Timeline$Period;->isServerSideInsertedAdGroup(I)Z

    move-result v1

    if-eqz v1, :cond_3

    if-nez v9, :cond_3

    const/16 v21, 0x1

    goto :goto_3

    :cond_3
    const/16 v21, 0x0

    :goto_3
    const-wide v13, -0x7fffffffffffffffL    # -4.9E-324

    if-eq v5, v8, :cond_4

    if-nez v9, :cond_4

    .line 1116
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {v1, v5}, Landroidx/media3/common/Timeline$Period;->getAdGroupTimeUs(I)J

    move-result-wide v8

    goto :goto_4

    :cond_4
    if-eqz v10, :cond_5

    .line 1117
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget-wide v8, v1, Landroidx/media3/common/Timeline$Period;->durationUs:J

    :goto_4
    move-wide/from16 v17, v8

    goto :goto_5

    :cond_5
    move-wide/from16 v17, v13

    :goto_5
    cmp-long v1, v17, v13

    if-eqz v1, :cond_7

    const-wide/high16 v8, -0x8000000000000000L

    cmp-long v1, v17, v8

    if-nez v1, :cond_6

    goto :goto_6

    :cond_6
    move-wide/from16 v19, v17

    goto :goto_7

    .line 1120
    :cond_7
    :goto_6
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget-wide v8, v1, Landroidx/media3/common/Timeline$Period;->durationUs:J

    move-wide/from16 v19, v8

    :goto_7
    cmp-long v1, v19, v13

    if-eqz v1, :cond_a

    cmp-long v1, v3, v19

    if-ltz v1, :cond_a

    if-nez v24, :cond_9

    if-nez v10, :cond_8

    goto :goto_8

    :cond_8
    const/4 v6, 0x0

    :cond_9
    :goto_8
    int-to-long v3, v6

    sub-long v3, v19, v3

    const-wide/16 v5, 0x0

    .line 1125
    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    :cond_a
    move-wide v13, v3

    .line 1127
    new-instance v1, Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-object v11, v1

    move-wide/from16 v15, p5

    move/from16 v22, v2

    invoke-direct/range {v11 .. v24}, Landroidx/media3/exoplayer/MediaPeriodInfo;-><init>(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJJJZZZZ)V

    return-object v1
.end method

.method private getMediaPeriodInfoForPeriodPosition(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJ)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 9

    .line 292
    iget-object v6, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    iget-object v7, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    move-object v0, p1

    move-object v1, p2

    move-wide v2, p3

    move-wide v4, p5

    .line 293
    invoke-static/range {v0 .. v7}, Landroidx/media3/exoplayer/MediaPeriodQueue;->resolveMediaPeriodIdForAds(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJLandroidx/media3/common/Timeline$Window;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move-result-object p2

    .line 295
    invoke-virtual {p2}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->isAd()Z

    move-result p5

    if-eqz p5, :cond_0

    .line 296
    iget-object v2, p2, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget v3, p2, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adGroupIndex:I

    iget v4, p2, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adIndexInAdGroup:I

    iget-wide v7, p2, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    move-object v0, p0

    move-object v1, p1

    move-wide v5, p3

    invoke-direct/range {v0 .. v8}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMediaPeriodInfoForAd(Landroidx/media3/common/Timeline;Ljava/lang/Object;IIJJ)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object p1

    goto :goto_0

    .line 303
    :cond_0
    iget-object v2, p2, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    iget-wide v7, p2, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    move-object v0, p0

    move-object v1, p1

    move-wide v3, p3

    invoke-direct/range {v0 .. v8}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMediaPeriodInfoForContent(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJJ)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private getMinStartPositionAfterAdGroupUs(Landroidx/media3/common/Timeline;Ljava/lang/Object;I)J
    .locals 3

    .line 1163
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {p1, p2, v0}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    .line 1164
    iget-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {p1, p3}, Landroidx/media3/common/Timeline$Period;->getAdGroupTimeUs(I)J

    move-result-wide p1

    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    .line 1166
    iget-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget-wide p1, p1, Landroidx/media3/common/Timeline$Period;->durationUs:J

    return-wide p1

    .line 1168
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {v0, p3}, Landroidx/media3/common/Timeline$Period;->getContentResumeOffsetUs(I)J

    move-result-wide v0

    add-long/2addr p1, v0

    return-wide p1
.end method

.method private hasServerSideInsertedAds(Ljava/lang/Object;Landroidx/media3/common/Timeline;)Z
    .locals 4

    .line 1019
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {p2, p1, v0}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/media3/common/Timeline$Period;->getAdGroupCount()I

    move-result p1

    .line 1020
    iget-object p2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {p2}, Landroidx/media3/common/Timeline$Period;->getRemovedAdGroupCount()I

    move-result p2

    if-lez p1, :cond_0

    .line 1021
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    .line 1022
    invoke-virtual {v0, p2}, Landroidx/media3/common/Timeline$Period;->isServerSideInsertedAdGroup(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    if-gt p1, v0, :cond_1

    iget-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    .line 1023
    invoke-virtual {p1, p2}, Landroidx/media3/common/Timeline$Period;->getAdGroupTimeUs(I)J

    move-result-wide p1

    const-wide/high16 v1, -0x8000000000000000L

    cmp-long v3, p1, v1

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :cond_1
    :goto_0
    return v0
.end method

.method private isLastInPeriod(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;)Z
    .locals 1

    .line 1140
    invoke-virtual {p1}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->isAd()Z

    move-result v0

    if-nez v0, :cond_0

    iget p1, p1, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isLastInTimeline(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;Z)Z
    .locals 6

    .line 1154
    iget-object p2, p2, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    invoke-virtual {p1, p2}, Landroidx/media3/common/Timeline;->getIndexOfPeriod(Ljava/lang/Object;)I

    move-result v1

    .line 1155
    iget-object p2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {p1, v1, p2}, Landroidx/media3/common/Timeline;->getPeriod(ILandroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    move-result-object p2

    iget p2, p2, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    .line 1156
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    invoke-virtual {p1, p2, v0}, Landroidx/media3/common/Timeline;->getWindow(ILandroidx/media3/common/Timeline$Window;)Landroidx/media3/common/Timeline$Window;

    move-result-object p2

    iget-boolean p2, p2, Landroidx/media3/common/Timeline$Window;->isDynamic:Z

    if-nez p2, :cond_0

    iget-object v2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget-object v3, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    iget v4, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->repeatMode:I

    iget-boolean v5, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->shuffleModeEnabled:Z

    move-object v0, p1

    .line 1157
    invoke-virtual/range {v0 .. v5}, Landroidx/media3/common/Timeline;->isLastPeriod(ILandroidx/media3/common/Timeline$Period;Landroidx/media3/common/Timeline$Window;IZ)Z

    move-result p1

    if-eqz p1, :cond_0

    if-eqz p3, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isLastInWindow(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;)Z
    .locals 3

    .line 1144
    invoke-direct {p0, p2}, Landroidx/media3/exoplayer/MediaPeriodQueue;->isLastInPeriod(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 1147
    :cond_0
    iget-object v0, p2, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget-object v2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {p1, v0, v2}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    move-result-object v0

    iget v0, v0, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    .line 1148
    iget-object p2, p2, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    invoke-virtual {p1, p2}, Landroidx/media3/common/Timeline;->getIndexOfPeriod(Ljava/lang/Object;)I

    move-result p2

    .line 1149
    iget-object v2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    invoke-virtual {p1, v0, v2}, Landroidx/media3/common/Timeline;->getWindow(ILandroidx/media3/common/Timeline$Window;)Landroidx/media3/common/Timeline$Window;

    move-result-object p1

    iget p1, p1, Landroidx/media3/common/Timeline$Window;->lastPeriodIndex:I

    if-ne p1, p2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method private static isSkippableAdPeriod(Landroidx/media3/common/Timeline$Period;)Z
    .locals 8

    .line 608
    invoke-virtual {p0}, Landroidx/media3/common/Timeline$Period;->getAdGroupCount()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    .line 610
    invoke-virtual {p0, v1}, Landroidx/media3/common/Timeline$Period;->isLivePostrollPlaceholder(I)Z

    move-result v3

    if-nez v3, :cond_5

    .line 611
    :cond_0
    invoke-virtual {p0}, Landroidx/media3/common/Timeline$Period;->getRemovedAdGroupCount()I

    move-result v3

    invoke-virtual {p0, v3}, Landroidx/media3/common/Timeline$Period;->isServerSideInsertedAdGroup(I)Z

    move-result v3

    if-eqz v3, :cond_5

    const-wide/16 v3, 0x0

    .line 612
    invoke-virtual {p0, v3, v4}, Landroidx/media3/common/Timeline$Period;->getAdGroupIndexForPositionUs(J)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    goto :goto_2

    .line 615
    :cond_1
    iget-wide v5, p0, Landroidx/media3/common/Timeline$Period;->durationUs:J

    cmp-long v7, v5, v3

    if-nez v7, :cond_2

    return v2

    :cond_2
    add-int/lit8 v5, v0, -0x1

    .line 620
    invoke-virtual {p0, v5}, Landroidx/media3/common/Timeline$Period;->isLivePostrollPlaceholder(I)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v5, 0x2

    goto :goto_0

    :cond_3
    const/4 v5, 0x1

    :goto_0
    sub-int/2addr v0, v5

    const/4 v5, 0x0

    :goto_1
    if-gt v5, v0, :cond_4

    .line 622
    invoke-virtual {p0, v5}, Landroidx/media3/common/Timeline$Period;->getContentResumeOffsetUs(I)J

    move-result-wide v6

    add-long/2addr v3, v6

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 624
    :cond_4
    iget-wide v5, p0, Landroidx/media3/common/Timeline$Period;->durationUs:J

    cmp-long p0, v5, v3

    if-gtz p0, :cond_5

    const/4 v1, 0x1

    :cond_5
    :goto_2
    return v1
.end method

.method private notifyQueueUpdate()V
    .locals 4

    .line 665
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v0

    .line 666
    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    :goto_0
    if-eqz v1, :cond_0

    .line 668
    iget-object v2, v1, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-object v2, v2, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    invoke-virtual {v0, v2}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    .line 669
    invoke-virtual {v1}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v1

    goto :goto_0

    .line 671
    :cond_0
    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    iget-object v1, v1, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-object v1, v1, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    .line 672
    :goto_1
    iget-object v2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->analyticsCollectorHandler:Landroidx/media3/common/util/HandlerWrapper;

    new-instance v3, Landroidx/media3/exoplayer/MediaPeriodQueue$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v0, v1}, Landroidx/media3/exoplayer/MediaPeriodQueue$$ExternalSyntheticLambda0;-><init>(Landroidx/media3/exoplayer/MediaPeriodQueue;Lcom/google/common/collect/ImmutableList$Builder;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;)V

    invoke-interface {v2, v3}, Landroidx/media3/common/util/HandlerWrapper;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private releaseAndResetPreloadPriorityList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/MediaPeriodHolder;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 284
    :goto_0
    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadPriorityList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 285
    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadPriorityList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/exoplayer/MediaPeriodHolder;

    invoke-virtual {v1}, Landroidx/media3/exoplayer/MediaPeriodHolder;->release()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 287
    :cond_0
    iput-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadPriorityList:Ljava/util/List;

    return-void
.end method

.method private removePreloadedMediaPeriodHolder(Landroidx/media3/exoplayer/MediaPeriodInfo;)Landroidx/media3/exoplayer/MediaPeriodHolder;
    .locals 2

    const/4 v0, 0x0

    .line 274
    :goto_0
    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadPriorityList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 275
    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadPriorityList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 276
    invoke-virtual {v1, p1}, Landroidx/media3/exoplayer/MediaPeriodHolder;->canBeUsedForMediaPeriodInfo(Landroidx/media3/exoplayer/MediaPeriodInfo;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 277
    iget-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadPriorityList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/MediaPeriodHolder;

    return-object p1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private static resolveMediaPeriodIdForAds(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJLandroidx/media3/common/Timeline$Window;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;
    .locals 7

    .line 587
    invoke-virtual {p0, p1, p7}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    .line 588
    iget v0, p7, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    invoke-virtual {p0, v0, p6}, Landroidx/media3/common/Timeline;->getWindow(ILandroidx/media3/common/Timeline$Window;)Landroidx/media3/common/Timeline$Window;

    .line 590
    invoke-virtual {p0, p1}, Landroidx/media3/common/Timeline;->getIndexOfPeriod(Ljava/lang/Object;)I

    move-result v0

    move-object v2, p1

    .line 591
    :goto_0
    invoke-static {p7}, Landroidx/media3/exoplayer/MediaPeriodQueue;->isSkippableAdPeriod(Landroidx/media3/common/Timeline$Period;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget p1, p6, Landroidx/media3/common/Timeline$Window;->lastPeriodIndex:I

    if-gt v0, p1, :cond_0

    const/4 p1, 0x1

    .line 593
    invoke-virtual {p0, v0, p7, p1}, Landroidx/media3/common/Timeline;->getPeriod(ILandroidx/media3/common/Timeline$Period;Z)Landroidx/media3/common/Timeline$Period;

    .line 594
    iget-object p1, p7, Landroidx/media3/common/Timeline$Period;->uid:Ljava/lang/Object;

    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 596
    :cond_0
    invoke-virtual {p0, v2, p7}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    .line 597
    invoke-virtual {p7, p2, p3}, Landroidx/media3/common/Timeline$Period;->getAdGroupIndexForPositionUs(J)I

    move-result v3

    const/4 p0, -0x1

    if-ne v3, p0, :cond_1

    .line 599
    invoke-virtual {p7, p2, p3}, Landroidx/media3/common/Timeline$Period;->getAdGroupIndexAfterPositionUs(J)I

    move-result p0

    .line 600
    new-instance p1, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    invoke-direct {p1, v2, p4, p5, p0}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;-><init>(Ljava/lang/Object;JI)V

    return-object p1

    .line 602
    :cond_1
    invoke-virtual {p7, v3}, Landroidx/media3/common/Timeline$Period;->getFirstAdIndexToPlay(I)I

    move-result v4

    .line 603
    new-instance p0, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move-object v1, p0

    move-wide v5, p4

    invoke-direct/range {v1 .. v6}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;-><init>(Ljava/lang/Object;IIJ)V

    return-object p0
.end method

.method private resolvePeriodUidToWindowSequenceNumber(Landroidx/media3/common/Timeline;Ljava/lang/Object;)J
    .locals 5

    .line 686
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {p1, p2, v0}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    move-result-object v0

    iget v0, v0, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    .line 687
    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->oldFrontPeriodUid:Ljava/lang/Object;

    const/4 v2, -0x1

    if-eqz v1, :cond_0

    .line 688
    invoke-virtual {p1, v1}, Landroidx/media3/common/Timeline;->getIndexOfPeriod(Ljava/lang/Object;)I

    move-result v1

    if-eq v1, v2, :cond_0

    .line 690
    iget-object v3, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {p1, v1, v3}, Landroidx/media3/common/Timeline;->getPeriod(ILandroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    move-result-object v1

    iget v1, v1, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    if-ne v1, v0, :cond_0

    .line 693
    iget-wide p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->oldFrontPeriodWindowSequenceNumber:J

    return-wide p1

    .line 697
    :cond_0
    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    :goto_0
    if-eqz v1, :cond_2

    .line 699
    iget-object v3, v1, Landroidx/media3/exoplayer/MediaPeriodHolder;->uid:Ljava/lang/Object;

    invoke-virtual {v3, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 701
    iget-object p1, v1, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-object p1, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide p1, p1, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    return-wide p1

    .line 703
    :cond_1
    invoke-virtual {v1}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v1

    goto :goto_0

    .line 705
    :cond_2
    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    :goto_1
    if-eqz v1, :cond_4

    .line 707
    iget-object v3, v1, Landroidx/media3/exoplayer/MediaPeriodHolder;->uid:Ljava/lang/Object;

    invoke-virtual {p1, v3}, Landroidx/media3/common/Timeline;->getIndexOfPeriod(Ljava/lang/Object;)I

    move-result v3

    if-eq v3, v2, :cond_3

    .line 709
    iget-object v4, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {p1, v3, v4}, Landroidx/media3/common/Timeline;->getPeriod(ILandroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    move-result-object v3

    iget v3, v3, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    if-ne v3, v0, :cond_3

    .line 712
    iget-object p1, v1, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-object p1, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide p1, p1, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    return-wide p1

    .line 715
    :cond_3
    invoke-virtual {v1}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v1

    goto :goto_1

    .line 718
    :cond_4
    invoke-direct {p0, p2}, Landroidx/media3/exoplayer/MediaPeriodQueue;->resolvePeriodUidToWindowSequenceNumberInPreloadPeriods(Ljava/lang/Object;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long p1, v0, v2

    if-eqz p1, :cond_5

    return-wide v0

    .line 724
    :cond_5
    iget-wide v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->nextWindowSequenceNumber:J

    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->nextWindowSequenceNumber:J

    .line 725
    iget-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    if-nez p1, :cond_6

    .line 727
    iput-object p2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->oldFrontPeriodUid:Ljava/lang/Object;

    .line 728
    iput-wide v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->oldFrontPeriodWindowSequenceNumber:J

    :cond_6
    return-wide v0
.end method

.method private resolvePeriodUidToWindowSequenceNumberInPreloadPeriods(Ljava/lang/Object;)J
    .locals 3

    const/4 v0, 0x0

    .line 734
    :goto_0
    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadPriorityList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 735
    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadPriorityList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 736
    iget-object v2, v1, Landroidx/media3/exoplayer/MediaPeriodHolder;->uid:Ljava/lang/Object;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 737
    iget-object p1, v1, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-object p1, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v0, p1, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    return-wide v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method private updateForPlaybackModeChange(Landroidx/media3/common/Timeline;)Z
    .locals 8

    .line 766
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    .line 770
    :cond_0
    iget-object v2, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->uid:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Landroidx/media3/common/Timeline;->getIndexOfPeriod(Ljava/lang/Object;)I

    move-result v2

    move v3, v2

    .line 772
    :goto_0
    iget-object v4, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget-object v5, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    iget v6, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->repeatMode:I

    iget-boolean v7, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->shuffleModeEnabled:Z

    move-object v2, p1

    .line 773
    invoke-virtual/range {v2 .. v7}, Landroidx/media3/common/Timeline;->getNextPeriodIndex(ILandroidx/media3/common/Timeline$Period;Landroidx/media3/common/Timeline$Window;IZ)I

    move-result v3

    .line 775
    :goto_1
    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/exoplayer/MediaPeriodHolder;

    invoke-virtual {v2}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-boolean v2, v2, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelinePeriod:Z

    if-nez v2, :cond_1

    .line 777
    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v0

    goto :goto_1

    .line 780
    :cond_1
    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v2

    const/4 v4, -0x1

    if-eq v3, v4, :cond_4

    if-nez v2, :cond_2

    goto :goto_2

    .line 784
    :cond_2
    iget-object v4, v2, Landroidx/media3/exoplayer/MediaPeriodHolder;->uid:Ljava/lang/Object;

    invoke-virtual {p1, v4}, Landroidx/media3/common/Timeline;->getIndexOfPeriod(Ljava/lang/Object;)I

    move-result v4

    if-eq v4, v3, :cond_3

    goto :goto_2

    :cond_3
    move-object v0, v2

    goto :goto_0

    .line 793
    :cond_4
    :goto_2
    invoke-virtual {p0, v0}, Landroidx/media3/exoplayer/MediaPeriodQueue;->removeAfter(Landroidx/media3/exoplayer/MediaPeriodHolder;)Z

    move-result v2

    .line 796
    iget-object v3, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    invoke-virtual {p0, p1, v3}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getUpdatedMediaPeriodInfo(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/MediaPeriodInfo;)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object p1

    iput-object p1, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    xor-int/lit8 p1, v2, 0x1

    return p1
.end method


# virtual methods
.method public advancePlayingPeriod()Landroidx/media3/exoplayer/MediaPeriodHolder;
    .locals 3

    .line 370
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 373
    :cond_0
    iget-object v2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    if-ne v0, v2, :cond_1

    .line 374
    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 376
    :cond_1
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->release()V

    .line 377
    iget v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->length:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->length:I

    if-nez v0, :cond_2

    .line 379
    iput-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 380
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    iget-object v0, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->uid:Ljava/lang/Object;

    iput-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->oldFrontPeriodUid:Ljava/lang/Object;

    .line 381
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    iget-object v0, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-object v0, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v0, v0, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    iput-wide v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->oldFrontPeriodWindowSequenceNumber:J

    .line 383
    :cond_2
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 384
    invoke-direct {p0}, Landroidx/media3/exoplayer/MediaPeriodQueue;->notifyQueueUpdate()V

    .line 385
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    return-object v0
.end method

.method public advanceReadingPeriod()Landroidx/media3/exoplayer/MediaPeriodHolder;
    .locals 1

    .line 357
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/MediaPeriodHolder;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 358
    invoke-direct {p0}, Landroidx/media3/exoplayer/MediaPeriodQueue;->notifyQueueUpdate()V

    .line 359
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/MediaPeriodHolder;

    return-object v0
.end method

.method public clear()V
    .locals 3

    .line 419
    iget v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->length:I

    if-nez v0, :cond_0

    return-void

    .line 422
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 423
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->uid:Ljava/lang/Object;

    iput-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->oldFrontPeriodUid:Ljava/lang/Object;

    .line 424
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-object v1, v1, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v1, v1, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->windowSequenceNumber:J

    iput-wide v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->oldFrontPeriodWindowSequenceNumber:J

    :goto_0
    if-eqz v0, :cond_1

    .line 426
    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->release()V

    .line 427
    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 429
    iput-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 430
    iput-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 431
    iput-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    const/4 v0, 0x0

    .line 432
    iput v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->length:I

    .line 433
    invoke-direct {p0}, Landroidx/media3/exoplayer/MediaPeriodQueue;->notifyQueueUpdate()V

    return-void
.end method

.method public enqueueNextMediaPeriodHolder(Landroidx/media3/exoplayer/MediaPeriodInfo;)Landroidx/media3/exoplayer/MediaPeriodHolder;
    .locals 4

    .line 200
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    if-nez v0, :cond_0

    const-wide v0, 0xe8d4a51000L

    goto :goto_0

    .line 202
    :cond_0
    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getRendererOffset()J

    move-result-wide v0

    iget-object v2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    iget-object v2, v2, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-wide v2, v2, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    add-long/2addr v0, v2

    iget-wide v2, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->startPositionUs:J

    sub-long/2addr v0, v2

    .line 203
    :goto_0
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/MediaPeriodQueue;->removePreloadedMediaPeriodHolder(Landroidx/media3/exoplayer/MediaPeriodInfo;)Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v2

    if-nez v2, :cond_1

    .line 205
    iget-object v2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->mediaPeriodHolderFactory:Landroidx/media3/exoplayer/MediaPeriodHolder$Factory;

    invoke-interface {v2, p1, v0, v1}, Landroidx/media3/exoplayer/MediaPeriodHolder$Factory;->create(Landroidx/media3/exoplayer/MediaPeriodInfo;J)Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v2

    goto :goto_1

    .line 207
    :cond_1
    iput-object p1, v2, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    .line 208
    invoke-virtual {v2, v0, v1}, Landroidx/media3/exoplayer/MediaPeriodHolder;->setRendererOffset(J)V

    .line 210
    :goto_1
    iget-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    if-eqz p1, :cond_2

    .line 211
    invoke-virtual {p1, v2}, Landroidx/media3/exoplayer/MediaPeriodHolder;->setNext(Landroidx/media3/exoplayer/MediaPeriodHolder;)V

    goto :goto_2

    .line 213
    :cond_2
    iput-object v2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 214
    iput-object v2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    :goto_2
    const/4 p1, 0x0

    .line 216
    iput-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->oldFrontPeriodUid:Ljava/lang/Object;

    .line 217
    iput-object v2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 218
    iget p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->length:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->length:I

    .line 219
    invoke-direct {p0}, Landroidx/media3/exoplayer/MediaPeriodQueue;->notifyQueueUpdate()V

    return-object v2
.end method

.method public getLoadingPeriod()Landroidx/media3/exoplayer/MediaPeriodHolder;
    .locals 1

    .line 333
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    return-object v0
.end method

.method public getNextMediaPeriodInfo(JLandroidx/media3/exoplayer/PlaybackInfo;)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 1

    .line 187
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    if-nez v0, :cond_0

    .line 188
    invoke-direct {p0, p3}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getFirstMediaPeriodInfo(Landroidx/media3/exoplayer/PlaybackInfo;)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object p1

    goto :goto_0

    .line 189
    :cond_0
    iget-object p3, p3, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    invoke-direct {p0, p3, v0, p1, p2}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getFollowingMediaPeriodInfo(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/MediaPeriodHolder;J)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public getPlayingPeriod()Landroidx/media3/exoplayer/MediaPeriodHolder;
    .locals 1

    .line 342
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    return-object v0
.end method

.method public getReadingPeriod()Landroidx/media3/exoplayer/MediaPeriodHolder;
    .locals 1

    .line 348
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    return-object v0
.end method

.method public getUpdatedMediaPeriodInfo(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/MediaPeriodInfo;)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 518
    iget-object v3, v2, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    .line 519
    invoke-direct {v0, v3}, Landroidx/media3/exoplayer/MediaPeriodQueue;->isLastInPeriod(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;)Z

    move-result v12

    .line 520
    invoke-direct {v0, v1, v3}, Landroidx/media3/exoplayer/MediaPeriodQueue;->isLastInWindow(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;)Z

    move-result v13

    .line 521
    invoke-direct {v0, v1, v3, v12}, Landroidx/media3/exoplayer/MediaPeriodQueue;->isLastInTimeline(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;Z)Z

    move-result v14

    .line 522
    iget-object v4, v2, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-object v4, v4, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    iget-object v5, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {v1, v4, v5}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    .line 524
    invoke-virtual {v3}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->isAd()Z

    move-result v1

    const/4 v4, -0x1

    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    if-nez v1, :cond_1

    iget v1, v3, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    if-ne v1, v4, :cond_0

    goto :goto_0

    .line 526
    :cond_0
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v7, v3, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    invoke-virtual {v1, v7}, Landroidx/media3/common/Timeline$Period;->getAdGroupTimeUs(I)J

    move-result-wide v7

    goto :goto_1

    :cond_1
    :goto_0
    move-wide v7, v5

    .line 528
    :goto_1
    invoke-virtual {v3}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->isAd()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 529
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v5, v3, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adGroupIndex:I

    iget v6, v3, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adIndexInAdGroup:I

    invoke-virtual {v1, v5, v6}, Landroidx/media3/common/Timeline$Period;->getAdDurationUs(II)J

    move-result-wide v5

    :goto_2
    move-wide v9, v5

    goto :goto_4

    :cond_2
    cmp-long v1, v7, v5

    if-eqz v1, :cond_4

    const-wide/high16 v5, -0x8000000000000000L

    cmp-long v1, v7, v5

    if-nez v1, :cond_3

    goto :goto_3

    :cond_3
    move-wide v9, v7

    goto :goto_4

    .line 531
    :cond_4
    :goto_3
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {v1}, Landroidx/media3/common/Timeline$Period;->getDurationUs()J

    move-result-wide v5

    goto :goto_2

    .line 534
    :goto_4
    invoke-virtual {v3}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->isAd()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 535
    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v4, v3, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->adGroupIndex:I

    invoke-virtual {v1, v4}, Landroidx/media3/common/Timeline$Period;->isServerSideInsertedAdGroup(I)Z

    move-result v1

    move v11, v1

    goto :goto_5

    .line 536
    :cond_5
    iget v1, v3, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    if-eq v1, v4, :cond_6

    iget-object v1, v0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v4, v3, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->nextAdGroupIndex:I

    .line 537
    invoke-virtual {v1, v4}, Landroidx/media3/common/Timeline$Period;->isServerSideInsertedAdGroup(I)Z

    move-result v1

    if-eqz v1, :cond_6

    const/4 v1, 0x1

    const/4 v11, 0x1

    goto :goto_5

    :cond_6
    const/4 v1, 0x0

    const/4 v11, 0x0

    .line 538
    :goto_5
    new-instance v15, Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-wide v4, v2, Landroidx/media3/exoplayer/MediaPeriodInfo;->startPositionUs:J

    iget-wide v1, v2, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    move-wide/from16 v16, v1

    move-object v1, v15

    move-object v2, v3

    move-wide v3, v4

    move-wide/from16 v5, v16

    invoke-direct/range {v1 .. v14}, Landroidx/media3/exoplayer/MediaPeriodInfo;-><init>(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJJJZZZZ)V

    return-object v15
.end method

.method public invalidatePreloadPool(Landroidx/media3/common/Timeline;)V
    .locals 14

    .line 225
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadConfiguration:Landroidx/media3/exoplayer/ExoPlayer$PreloadConfiguration;

    iget-wide v0, v0, Landroidx/media3/exoplayer/ExoPlayer$PreloadConfiguration;->targetPreloadDurationUs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-eqz v4, :cond_4

    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    if-nez v0, :cond_0

    goto :goto_0

    .line 230
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 231
    iget-object v2, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-object v2, v2, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-object v2, v2, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->periodUid:Ljava/lang/Object;

    const-wide/16 v3, 0x0

    .line 232
    invoke-direct {p0, p1, v2, v3, v4}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getDefaultPeriodPositionOfNextWindow(Landroidx/media3/common/Timeline;Ljava/lang/Object;J)Landroid/util/Pair;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 234
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    iget-object v4, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    .line 237
    invoke-virtual {p1, v3, v4}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    move-result-object v3

    iget v3, v3, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    iget-object v4, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    .line 236
    invoke-virtual {p1, v3, v4}, Landroidx/media3/common/Timeline;->getWindow(ILandroidx/media3/common/Timeline$Window;)Landroidx/media3/common/Timeline$Window;

    move-result-object v3

    .line 239
    invoke-virtual {v3}, Landroidx/media3/common/Timeline$Window;->isLive()Z

    move-result v3

    if-nez v3, :cond_3

    .line 240
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 241
    invoke-direct {p0, v3}, Landroidx/media3/exoplayer/MediaPeriodQueue;->resolvePeriodUidToWindowSequenceNumberInPreloadPeriods(Ljava/lang/Object;)J

    move-result-wide v3

    const-wide/16 v5, -0x1

    cmp-long v7, v3, v5

    if-nez v7, :cond_1

    .line 243
    iget-wide v3, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->nextWindowSequenceNumber:J

    const-wide/16 v5, 0x1

    add-long/2addr v5, v3

    iput-wide v5, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->nextWindowSequenceNumber:J

    :cond_1
    move-wide v12, v3

    .line 246
    iget-object v9, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Long;

    .line 250
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    move-object v7, p0

    move-object v8, p1

    .line 247
    invoke-direct/range {v7 .. v13}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getMediaPeriodInfoForPeriodPosition(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJ)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object p1

    .line 253
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/MediaPeriodQueue;->removePreloadedMediaPeriodHolder(Landroidx/media3/exoplayer/MediaPeriodInfo;)Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v2

    if-nez v2, :cond_2

    .line 257
    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getRendererOffset()J

    move-result-wide v2

    iget-object v0, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-wide v4, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    add-long/2addr v2, v4

    iget-wide v4, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->startPositionUs:J

    sub-long/2addr v2, v4

    .line 258
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->mediaPeriodHolderFactory:Landroidx/media3/exoplayer/MediaPeriodHolder$Factory;

    invoke-interface {v0, p1, v2, v3}, Landroidx/media3/exoplayer/MediaPeriodHolder$Factory;->create(Landroidx/media3/exoplayer/MediaPeriodInfo;J)Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v2

    .line 260
    :cond_2
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    :cond_3
    invoke-direct {p0, v1}, Landroidx/media3/exoplayer/MediaPeriodQueue;->releaseAndResetPreloadPriorityList(Ljava/util/List;)V

    return-void

    .line 226
    :cond_4
    :goto_0
    invoke-virtual {p0}, Landroidx/media3/exoplayer/MediaPeriodQueue;->releasePreloadPool()V

    return-void
.end method

.method public isLoading(Landroidx/media3/exoplayer/source/MediaPeriod;)Z
    .locals 1

    .line 153
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    if-eqz v0, :cond_0

    iget-object v0, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method synthetic lambda$notifyQueueUpdate$0$androidx-media3-exoplayer-MediaPeriodQueue(Lcom/google/common/collect/ImmutableList$Builder;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;)V
    .locals 1

    .line 673
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->analyticsCollector:Landroidx/media3/exoplayer/analytics/AnalyticsCollector;

    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Landroidx/media3/exoplayer/analytics/AnalyticsCollector;->updateMediaPeriodQueueInfo(Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;)V

    return-void
.end method

.method public reevaluateBuffer(J)V
    .locals 1

    .line 162
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    if-eqz v0, :cond_0

    .line 163
    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/MediaPeriodHolder;->reevaluateBuffer(J)V

    :cond_0
    return-void
.end method

.method public releasePreloadPool()V
    .locals 1

    .line 267
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadPriorityList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 268
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {p0, v0}, Landroidx/media3/exoplayer/MediaPeriodQueue;->releaseAndResetPreloadPriorityList(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method public removeAfter(Landroidx/media3/exoplayer/MediaPeriodHolder;)Z
    .locals 3

    .line 397
    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 402
    :cond_0
    iput-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 403
    :goto_0
    invoke-virtual {p1}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 404
    invoke-virtual {p1}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object p1

    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 405
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    const/4 v2, 0x1

    if-ne p1, v0, :cond_1

    .line 406
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    iput-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    const/4 v1, 0x1

    .line 409
    :cond_1
    invoke-virtual {p1}, Landroidx/media3/exoplayer/MediaPeriodHolder;->release()V

    .line 410
    iget v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->length:I

    sub-int/2addr v0, v2

    iput v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->length:I

    goto :goto_0

    .line 412
    :cond_2
    iget-object p1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/MediaPeriodHolder;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->setNext(Landroidx/media3/exoplayer/MediaPeriodHolder;)V

    .line 413
    invoke-direct {p0}, Landroidx/media3/exoplayer/MediaPeriodQueue;->notifyQueueUpdate()V

    return v1
.end method

.method public resolveMediaPeriodIdForAds(Landroidx/media3/common/Timeline;Ljava/lang/Object;J)Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;
    .locals 8

    .line 562
    invoke-direct {p0, p1, p2}, Landroidx/media3/exoplayer/MediaPeriodQueue;->resolvePeriodUidToWindowSequenceNumber(Landroidx/media3/common/Timeline;Ljava/lang/Object;)J

    move-result-wide v4

    .line 563
    iget-object v6, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    iget-object v7, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    move-object v0, p1

    move-object v1, p2

    move-wide v2, p3

    invoke-static/range {v0 .. v7}, Landroidx/media3/exoplayer/MediaPeriodQueue;->resolveMediaPeriodIdForAds(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJLandroidx/media3/common/Timeline$Window;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move-result-object p1

    return-object p1
.end method

.method public resolveMediaPeriodIdForAdsAfterPeriodPositionChange(Landroidx/media3/common/Timeline;Ljava/lang/Object;J)Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;
    .locals 10

    .line 639
    invoke-direct {p0, p1, p2}, Landroidx/media3/exoplayer/MediaPeriodQueue;->resolvePeriodUidToWindowSequenceNumber(Landroidx/media3/common/Timeline;Ljava/lang/Object;)J

    move-result-wide v4

    .line 641
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {p1, p2, v0}, Landroidx/media3/common/Timeline;->getPeriodByUid(Ljava/lang/Object;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/Timeline$Period;

    .line 642
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget v0, v0, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    iget-object v1, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    invoke-virtual {p1, v0, v1}, Landroidx/media3/common/Timeline;->getWindow(ILandroidx/media3/common/Timeline$Window;)Landroidx/media3/common/Timeline$Window;

    .line 645
    invoke-virtual {p1, p2}, Landroidx/media3/common/Timeline;->getIndexOfPeriod(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    iget v3, v3, Landroidx/media3/common/Timeline$Window;->firstPeriodIndex:I

    if-lt v0, v3, :cond_3

    .line 646
    iget-object v3, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    const/4 v6, 0x1

    invoke-virtual {p1, v0, v3, v6}, Landroidx/media3/common/Timeline;->getPeriod(ILandroidx/media3/common/Timeline$Period;Z)Landroidx/media3/common/Timeline$Period;

    .line 647
    iget-object v3, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    invoke-virtual {v3}, Landroidx/media3/common/Timeline$Period;->getAdGroupCount()I

    move-result v3

    if-lez v3, :cond_0

    goto :goto_1

    :cond_0
    const/4 v6, 0x0

    :goto_1
    or-int/2addr v2, v6

    .line 649
    iget-object v3, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget-wide v7, v3, Landroidx/media3/common/Timeline$Period;->durationUs:J

    invoke-virtual {v3, v7, v8}, Landroidx/media3/common/Timeline$Period;->getAdGroupIndexForPositionUs(J)I

    move-result v3

    const/4 v7, -0x1

    if-eq v3, v7, :cond_1

    .line 651
    iget-object p2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget-object p2, p2, Landroidx/media3/common/Timeline$Period;->uid:Ljava/lang/Object;

    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    :cond_1
    if-eqz v2, :cond_2

    if-eqz v6, :cond_3

    .line 653
    iget-object v3, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    iget-wide v6, v3, Landroidx/media3/common/Timeline$Period;->durationUs:J

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    :goto_2
    move-object v1, p2

    .line 658
    iget-object v6, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->window:Landroidx/media3/common/Timeline$Window;

    iget-object v7, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->period:Landroidx/media3/common/Timeline$Period;

    move-object v0, p1

    move-wide v2, p3

    invoke-static/range {v0 .. v7}, Landroidx/media3/exoplayer/MediaPeriodQueue;->resolveMediaPeriodIdForAds(Landroidx/media3/common/Timeline;Ljava/lang/Object;JJLandroidx/media3/common/Timeline$Window;Landroidx/media3/common/Timeline$Period;)Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move-result-object p1

    return-object p1
.end method

.method public shouldLoadNextMediaPeriod()Z
    .locals 5

    .line 169
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    if-eqz v0, :cond_1

    iget-object v0, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-boolean v0, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFinal:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    .line 171
    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->isFullyBuffered()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->loading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    iget-object v0, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-wide v0, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->length:I

    const/16 v1, 0x64

    if-ge v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public updatePreloadConfiguration(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/ExoPlayer$PreloadConfiguration;)V
    .locals 0

    .line 147
    iput-object p2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->preloadConfiguration:Landroidx/media3/exoplayer/ExoPlayer$PreloadConfiguration;

    .line 148
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/MediaPeriodQueue;->invalidatePreloadPool(Landroidx/media3/common/Timeline;)V

    return-void
.end method

.method public updateQueuedPeriods(Landroidx/media3/common/Timeline;JJ)Z
    .locals 8

    .line 455
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->playing:Landroidx/media3/exoplayer/MediaPeriodHolder;

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x1

    if-eqz v0, :cond_8

    .line 457
    iget-object v3, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    if-nez v1, :cond_0

    .line 465
    invoke-virtual {p0, p1, v3}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getUpdatedMediaPeriodInfo(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/MediaPeriodInfo;)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object v1

    goto :goto_1

    .line 468
    :cond_0
    invoke-direct {p0, p1, v1, p2, p3}, Landroidx/media3/exoplayer/MediaPeriodQueue;->getFollowingMediaPeriodInfo(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/MediaPeriodHolder;J)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object v4

    if-nez v4, :cond_1

    .line 471
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/MediaPeriodQueue;->removeAfter(Landroidx/media3/exoplayer/MediaPeriodHolder;)Z

    move-result p1

    xor-int/2addr p1, v2

    return p1

    .line 473
    :cond_1
    invoke-direct {p0, v3, v4}, Landroidx/media3/exoplayer/MediaPeriodQueue;->canKeepMediaPeriodHolder(Landroidx/media3/exoplayer/MediaPeriodInfo;Landroidx/media3/exoplayer/MediaPeriodInfo;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 475
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/MediaPeriodQueue;->removeAfter(Landroidx/media3/exoplayer/MediaPeriodHolder;)Z

    move-result p1

    xor-int/2addr p1, v2

    return p1

    :cond_2
    move-object v1, v4

    .line 481
    :goto_1
    iget-wide v4, v3, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    .line 482
    invoke-virtual {v1, v4, v5}, Landroidx/media3/exoplayer/MediaPeriodInfo;->copyWithRequestedContentPositionUs(J)Landroidx/media3/exoplayer/MediaPeriodInfo;

    move-result-object v4

    iput-object v4, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    .line 485
    iget-wide v3, v3, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    iget-wide v5, v1, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    invoke-static {v3, v4, v5, v6}, Landroidx/media3/exoplayer/MediaPeriodQueue;->areDurationsCompatible(JJ)Z

    move-result v3

    if-nez v3, :cond_7

    .line 488
    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->updateClipping()V

    .line 490
    iget-wide p1, v1, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long p3, p1, v3

    if-nez p3, :cond_3

    const-wide p1, 0x7fffffffffffffffL

    goto :goto_2

    .line 492
    :cond_3
    iget-wide p1, v1, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/MediaPeriodHolder;->toRendererTime(J)J

    move-result-wide p1

    .line 493
    :goto_2
    iget-object p3, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->reading:Landroidx/media3/exoplayer/MediaPeriodHolder;

    const/4 v1, 0x0

    if-ne v0, p3, :cond_5

    iget-object p3, v0, Landroidx/media3/exoplayer/MediaPeriodHolder;->info:Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-boolean p3, p3, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFollowedByTransitionToSameStream:Z

    if-nez p3, :cond_5

    const-wide/high16 v3, -0x8000000000000000L

    cmp-long p3, p4, v3

    if-eqz p3, :cond_4

    cmp-long p3, p4, p1

    if-ltz p3, :cond_5

    :cond_4
    const/4 p1, 0x1

    goto :goto_3

    :cond_5
    const/4 p1, 0x0

    .line 498
    :goto_3
    invoke-virtual {p0, v0}, Landroidx/media3/exoplayer/MediaPeriodQueue;->removeAfter(Landroidx/media3/exoplayer/MediaPeriodHolder;)Z

    move-result p2

    if-nez p2, :cond_6

    if-nez p1, :cond_6

    goto :goto_4

    :cond_6
    const/4 v2, 0x0

    :goto_4
    return v2

    .line 503
    :cond_7
    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaPeriodHolder;->getNext()Landroidx/media3/exoplayer/MediaPeriodHolder;

    move-result-object v1

    move-object v7, v1

    move-object v1, v0

    move-object v0, v7

    goto :goto_0

    :cond_8
    return v2
.end method

.method public updateRepeatMode(Landroidx/media3/common/Timeline;I)Z
    .locals 0

    .line 122
    iput p2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->repeatMode:I

    .line 123
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/MediaPeriodQueue;->updateForPlaybackModeChange(Landroidx/media3/common/Timeline;)Z

    move-result p1

    return p1
.end method

.method public updateShuffleModeEnabled(Landroidx/media3/common/Timeline;Z)Z
    .locals 0

    .line 135
    iput-boolean p2, p0, Landroidx/media3/exoplayer/MediaPeriodQueue;->shuffleModeEnabled:Z

    .line 136
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/MediaPeriodQueue;->updateForPlaybackModeChange(Landroidx/media3/common/Timeline;)Z

    move-result p1

    return p1
.end method
