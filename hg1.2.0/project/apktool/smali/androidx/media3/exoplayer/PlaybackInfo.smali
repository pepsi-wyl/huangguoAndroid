.class final Landroidx/media3/exoplayer/PlaybackInfo;
.super Ljava/lang/Object;
.source "PlaybackInfo.java"


# static fields
.field private static final PLACEHOLDER_MEDIA_PERIOD_ID:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;


# instance fields
.field public volatile bufferedPositionUs:J

.field public final discontinuityStartPositionUs:J

.field public final isLoading:Z

.field public final loadingMediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

.field public final periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

.field public final playWhenReady:Z

.field public final playWhenReadyChangeReason:I

.field public final playbackError:Landroidx/media3/exoplayer/ExoPlaybackException;

.field public final playbackParameters:Landroidx/media3/common/PlaybackParameters;

.field public final playbackState:I

.field public final playbackSuppressionReason:I

.field public volatile positionUpdateTimeMs:J

.field public volatile positionUs:J

.field public final requestedContentPositionUs:J

.field public final sleepingForOffload:Z

.field public final staticMetadata:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media3/common/Metadata;",
            ">;"
        }
    .end annotation
.end field

.field public final timeline:Landroidx/media3/common/Timeline;

.field public volatile totalBufferedDurationUs:J

.field public final trackGroups:Landroidx/media3/exoplayer/source/TrackGroupArray;

.field public final trackSelectorResult:Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 41
    new-instance v0, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-direct {v0, v1}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;-><init>(Ljava/lang/Object;)V

    sput-object v0, Landroidx/media3/exoplayer/PlaybackInfo;->PLACEHOLDER_MEDIA_PERIOD_ID:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    return-void
.end method

.method public constructor <init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/common/Timeline;",
            "Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;",
            "JJI",
            "Landroidx/media3/exoplayer/ExoPlaybackException;",
            "Z",
            "Landroidx/media3/exoplayer/source/TrackGroupArray;",
            "Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;",
            "Ljava/util/List<",
            "Landroidx/media3/common/Metadata;",
            ">;",
            "Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;",
            "ZII",
            "Landroidx/media3/common/PlaybackParameters;",
            "JJJJZ)V"
        }
    .end annotation

    move-object v0, p0

    .line 198
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v1, p1

    .line 199
    iput-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    move-object v1, p2

    .line 200
    iput-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move-wide v1, p3

    .line 201
    iput-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->requestedContentPositionUs:J

    move-wide v1, p5

    .line 202
    iput-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->discontinuityStartPositionUs:J

    move v1, p7

    .line 203
    iput v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackState:I

    move-object v1, p8

    .line 204
    iput-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackError:Landroidx/media3/exoplayer/ExoPlaybackException;

    move v1, p9

    .line 205
    iput-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->isLoading:Z

    move-object v1, p10

    .line 206
    iput-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackGroups:Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-object v1, p11

    .line 207
    iput-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackSelectorResult:Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;

    move-object v1, p12

    .line 208
    iput-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->staticMetadata:Ljava/util/List;

    move-object/from16 v1, p13

    .line 209
    iput-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->loadingMediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move/from16 v1, p14

    .line 210
    iput-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReady:Z

    move/from16 v1, p15

    .line 211
    iput v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReadyChangeReason:I

    move/from16 v1, p16

    .line 212
    iput v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackSuppressionReason:I

    move-object/from16 v1, p17

    .line 213
    iput-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackParameters:Landroidx/media3/common/PlaybackParameters;

    move-wide/from16 v1, p18

    .line 214
    iput-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->bufferedPositionUs:J

    move-wide/from16 v1, p20

    .line 215
    iput-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->totalBufferedDurationUs:J

    move-wide/from16 v1, p22

    .line 216
    iput-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    move-wide/from16 v1, p24

    .line 217
    iput-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    move/from16 v1, p26

    .line 218
    iput-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->sleepingForOffload:Z

    return-void
.end method

.method public static createDummy(Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;)Landroidx/media3/exoplayer/PlaybackInfo;
    .locals 28

    move-object/from16 v11, p0

    .line 132
    new-instance v27, Landroidx/media3/exoplayer/PlaybackInfo;

    move-object/from16 v0, v27

    sget-object v1, Landroidx/media3/common/Timeline;->EMPTY:Landroidx/media3/common/Timeline;

    sget-object v13, Landroidx/media3/exoplayer/PlaybackInfo;->PLACEHOLDER_MEDIA_PERIOD_ID:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move-object v2, v13

    sget-object v10, Landroidx/media3/exoplayer/source/TrackGroupArray;->EMPTY:Landroidx/media3/exoplayer/source/TrackGroupArray;

    .line 142
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v12

    sget-object v17, Landroidx/media3/common/PlaybackParameters;->DEFAULT:Landroidx/media3/common/PlaybackParameters;

    const-wide/16 v24, 0x0

    const/16 v26, 0x0

    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    const-wide/16 v5, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    const-wide/16 v18, 0x0

    const-wide/16 v20, 0x0

    const-wide/16 v22, 0x0

    invoke-direct/range {v0 .. v26}, Landroidx/media3/exoplayer/PlaybackInfo;-><init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V

    return-object v27
.end method

.method public static getDummyPeriodForEmptyTimeline()Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;
    .locals 1

    .line 223
    sget-object v0, Landroidx/media3/exoplayer/PlaybackInfo;->PLACEHOLDER_MEDIA_PERIOD_ID:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    return-object v0
.end method


# virtual methods
.method public copyWithEstimatedPosition()Landroidx/media3/exoplayer/PlaybackInfo;
    .locals 31

    move-object/from16 v0, p0

    .line 539
    new-instance v28, Landroidx/media3/exoplayer/PlaybackInfo;

    move-object/from16 v1, v28

    iget-object v2, v0, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    iget-object v3, v0, Landroidx/media3/exoplayer/PlaybackInfo;->periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v4, v0, Landroidx/media3/exoplayer/PlaybackInfo;->requestedContentPositionUs:J

    iget-wide v6, v0, Landroidx/media3/exoplayer/PlaybackInfo;->discontinuityStartPositionUs:J

    iget v8, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackState:I

    iget-object v9, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackError:Landroidx/media3/exoplayer/ExoPlaybackException;

    iget-boolean v10, v0, Landroidx/media3/exoplayer/PlaybackInfo;->isLoading:Z

    iget-object v11, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackGroups:Landroidx/media3/exoplayer/source/TrackGroupArray;

    iget-object v12, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackSelectorResult:Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;

    iget-object v13, v0, Landroidx/media3/exoplayer/PlaybackInfo;->staticMetadata:Ljava/util/List;

    iget-object v14, v0, Landroidx/media3/exoplayer/PlaybackInfo;->loadingMediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-boolean v15, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReady:Z

    move-object/from16 v29, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReadyChangeReason:I

    move/from16 v16, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackSuppressionReason:I

    move/from16 v17, v1

    iget-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackParameters:Landroidx/media3/common/PlaybackParameters;

    move-object/from16 v18, v1

    move-object/from16 v30, v2

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->bufferedPositionUs:J

    move-wide/from16 v19, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->totalBufferedDurationUs:J

    move-wide/from16 v21, v1

    .line 557
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/exoplayer/PlaybackInfo;->getEstimatedPositionUs()J

    move-result-wide v23

    .line 558
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v25

    iget-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->sleepingForOffload:Z

    move/from16 v27, v1

    move-object/from16 v1, v29

    move-object/from16 v2, v30

    invoke-direct/range {v1 .. v27}, Landroidx/media3/exoplayer/PlaybackInfo;-><init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V

    return-object v28
.end method

.method public copyWithIsLoading(Z)Landroidx/media3/exoplayer/PlaybackInfo;
    .locals 30

    move-object/from16 v0, p0

    move/from16 v10, p1

    .line 375
    new-instance v28, Landroidx/media3/exoplayer/PlaybackInfo;

    move-object/from16 v1, v28

    iget-object v2, v0, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    iget-object v3, v0, Landroidx/media3/exoplayer/PlaybackInfo;->periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v4, v0, Landroidx/media3/exoplayer/PlaybackInfo;->requestedContentPositionUs:J

    iget-wide v6, v0, Landroidx/media3/exoplayer/PlaybackInfo;->discontinuityStartPositionUs:J

    iget v8, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackState:I

    iget-object v9, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackError:Landroidx/media3/exoplayer/ExoPlaybackException;

    iget-object v11, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackGroups:Landroidx/media3/exoplayer/source/TrackGroupArray;

    iget-object v12, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackSelectorResult:Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;

    iget-object v13, v0, Landroidx/media3/exoplayer/PlaybackInfo;->staticMetadata:Ljava/util/List;

    iget-object v14, v0, Landroidx/media3/exoplayer/PlaybackInfo;->loadingMediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-boolean v15, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReady:Z

    move-object/from16 p1, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReadyChangeReason:I

    move/from16 v16, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackSuppressionReason:I

    move/from16 v17, v1

    iget-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackParameters:Landroidx/media3/common/PlaybackParameters;

    move-object/from16 v18, v1

    move-object/from16 v29, v2

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->bufferedPositionUs:J

    move-wide/from16 v19, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->totalBufferedDurationUs:J

    move-wide/from16 v21, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    move-wide/from16 v23, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    move-wide/from16 v25, v1

    iget-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->sleepingForOffload:Z

    move/from16 v27, v1

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-direct/range {v1 .. v27}, Landroidx/media3/exoplayer/PlaybackInfo;-><init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V

    return-object v28
.end method

.method public copyWithLoadingMediaPeriodId(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;)Landroidx/media3/exoplayer/PlaybackInfo;
    .locals 30

    move-object/from16 v0, p0

    move-object/from16 v14, p1

    .line 406
    new-instance v28, Landroidx/media3/exoplayer/PlaybackInfo;

    move-object/from16 v1, v28

    iget-object v2, v0, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    iget-object v3, v0, Landroidx/media3/exoplayer/PlaybackInfo;->periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v4, v0, Landroidx/media3/exoplayer/PlaybackInfo;->requestedContentPositionUs:J

    iget-wide v6, v0, Landroidx/media3/exoplayer/PlaybackInfo;->discontinuityStartPositionUs:J

    iget v8, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackState:I

    iget-object v9, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackError:Landroidx/media3/exoplayer/ExoPlaybackException;

    iget-boolean v10, v0, Landroidx/media3/exoplayer/PlaybackInfo;->isLoading:Z

    iget-object v11, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackGroups:Landroidx/media3/exoplayer/source/TrackGroupArray;

    iget-object v12, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackSelectorResult:Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;

    iget-object v13, v0, Landroidx/media3/exoplayer/PlaybackInfo;->staticMetadata:Ljava/util/List;

    iget-boolean v15, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReady:Z

    move-object/from16 p1, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReadyChangeReason:I

    move/from16 v16, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackSuppressionReason:I

    move/from16 v17, v1

    iget-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackParameters:Landroidx/media3/common/PlaybackParameters;

    move-object/from16 v18, v1

    move-object/from16 v29, v2

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->bufferedPositionUs:J

    move-wide/from16 v19, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->totalBufferedDurationUs:J

    move-wide/from16 v21, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    move-wide/from16 v23, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    move-wide/from16 v25, v1

    iget-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->sleepingForOffload:Z

    move/from16 v27, v1

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-direct/range {v1 .. v27}, Landroidx/media3/exoplayer/PlaybackInfo;-><init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V

    return-object v28
.end method

.method public copyWithNewPosition(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJJJLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;)Landroidx/media3/exoplayer/PlaybackInfo;
    .locals 29
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;",
            "JJJJ",
            "Landroidx/media3/exoplayer/source/TrackGroupArray;",
            "Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;",
            "Ljava/util/List<",
            "Landroidx/media3/common/Metadata;",
            ">;)",
            "Landroidx/media3/exoplayer/PlaybackInfo;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    move-wide/from16 v23, p2

    move-wide/from16 v4, p4

    move-wide/from16 v6, p6

    move-wide/from16 v21, p8

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    .line 251
    new-instance v28, Landroidx/media3/exoplayer/PlaybackInfo;

    move-object/from16 v1, v28

    iget-object v2, v0, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    iget v8, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackState:I

    iget-object v9, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackError:Landroidx/media3/exoplayer/ExoPlaybackException;

    iget-boolean v10, v0, Landroidx/media3/exoplayer/PlaybackInfo;->isLoading:Z

    iget-object v14, v0, Landroidx/media3/exoplayer/PlaybackInfo;->loadingMediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-boolean v15, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReady:Z

    move-object/from16 p1, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReadyChangeReason:I

    move/from16 v16, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackSuppressionReason:I

    move/from16 v17, v1

    iget-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackParameters:Landroidx/media3/common/PlaybackParameters;

    move-object/from16 v18, v1

    move-object/from16 p2, v2

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->bufferedPositionUs:J

    move-wide/from16 v19, v1

    .line 270
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v25

    iget-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->sleepingForOffload:Z

    move/from16 v27, v1

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct/range {v1 .. v27}, Landroidx/media3/exoplayer/PlaybackInfo;-><init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V

    return-object v28
.end method

.method public copyWithPlayWhenReady(ZII)Landroidx/media3/exoplayer/PlaybackInfo;
    .locals 29

    move-object/from16 v0, p0

    move/from16 v15, p1

    move/from16 v16, p2

    move/from16 v17, p3

    .line 444
    new-instance v28, Landroidx/media3/exoplayer/PlaybackInfo;

    move-object/from16 v1, v28

    iget-object v2, v0, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    iget-object v3, v0, Landroidx/media3/exoplayer/PlaybackInfo;->periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v4, v0, Landroidx/media3/exoplayer/PlaybackInfo;->requestedContentPositionUs:J

    iget-wide v6, v0, Landroidx/media3/exoplayer/PlaybackInfo;->discontinuityStartPositionUs:J

    iget v8, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackState:I

    iget-object v9, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackError:Landroidx/media3/exoplayer/ExoPlaybackException;

    iget-boolean v10, v0, Landroidx/media3/exoplayer/PlaybackInfo;->isLoading:Z

    iget-object v11, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackGroups:Landroidx/media3/exoplayer/source/TrackGroupArray;

    iget-object v12, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackSelectorResult:Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;

    iget-object v13, v0, Landroidx/media3/exoplayer/PlaybackInfo;->staticMetadata:Ljava/util/List;

    iget-object v14, v0, Landroidx/media3/exoplayer/PlaybackInfo;->loadingMediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move-object/from16 p1, v1

    iget-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackParameters:Landroidx/media3/common/PlaybackParameters;

    move-object/from16 v18, v1

    move-object/from16 p2, v2

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->bufferedPositionUs:J

    move-wide/from16 v19, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->totalBufferedDurationUs:J

    move-wide/from16 v21, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    move-wide/from16 v23, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    move-wide/from16 v25, v1

    iget-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->sleepingForOffload:Z

    move/from16 v27, v1

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct/range {v1 .. v27}, Landroidx/media3/exoplayer/PlaybackInfo;-><init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V

    return-object v28
.end method

.method public copyWithPlaybackError(Landroidx/media3/exoplayer/ExoPlaybackException;)Landroidx/media3/exoplayer/PlaybackInfo;
    .locals 30

    move-object/from16 v0, p0

    move-object/from16 v9, p1

    .line 344
    new-instance v28, Landroidx/media3/exoplayer/PlaybackInfo;

    move-object/from16 v1, v28

    iget-object v2, v0, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    iget-object v3, v0, Landroidx/media3/exoplayer/PlaybackInfo;->periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v4, v0, Landroidx/media3/exoplayer/PlaybackInfo;->requestedContentPositionUs:J

    iget-wide v6, v0, Landroidx/media3/exoplayer/PlaybackInfo;->discontinuityStartPositionUs:J

    iget v8, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackState:I

    iget-boolean v10, v0, Landroidx/media3/exoplayer/PlaybackInfo;->isLoading:Z

    iget-object v11, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackGroups:Landroidx/media3/exoplayer/source/TrackGroupArray;

    iget-object v12, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackSelectorResult:Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;

    iget-object v13, v0, Landroidx/media3/exoplayer/PlaybackInfo;->staticMetadata:Ljava/util/List;

    iget-object v14, v0, Landroidx/media3/exoplayer/PlaybackInfo;->loadingMediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-boolean v15, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReady:Z

    move-object/from16 p1, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReadyChangeReason:I

    move/from16 v16, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackSuppressionReason:I

    move/from16 v17, v1

    iget-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackParameters:Landroidx/media3/common/PlaybackParameters;

    move-object/from16 v18, v1

    move-object/from16 v29, v2

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->bufferedPositionUs:J

    move-wide/from16 v19, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->totalBufferedDurationUs:J

    move-wide/from16 v21, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    move-wide/from16 v23, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    move-wide/from16 v25, v1

    iget-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->sleepingForOffload:Z

    move/from16 v27, v1

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-direct/range {v1 .. v27}, Landroidx/media3/exoplayer/PlaybackInfo;-><init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V

    return-object v28
.end method

.method public copyWithPlaybackParameters(Landroidx/media3/common/PlaybackParameters;)Landroidx/media3/exoplayer/PlaybackInfo;
    .locals 30

    move-object/from16 v0, p0

    move-object/from16 v18, p1

    .line 475
    new-instance v28, Landroidx/media3/exoplayer/PlaybackInfo;

    move-object/from16 v1, v28

    iget-object v2, v0, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    iget-object v3, v0, Landroidx/media3/exoplayer/PlaybackInfo;->periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v4, v0, Landroidx/media3/exoplayer/PlaybackInfo;->requestedContentPositionUs:J

    iget-wide v6, v0, Landroidx/media3/exoplayer/PlaybackInfo;->discontinuityStartPositionUs:J

    iget v8, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackState:I

    iget-object v9, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackError:Landroidx/media3/exoplayer/ExoPlaybackException;

    iget-boolean v10, v0, Landroidx/media3/exoplayer/PlaybackInfo;->isLoading:Z

    iget-object v11, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackGroups:Landroidx/media3/exoplayer/source/TrackGroupArray;

    iget-object v12, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackSelectorResult:Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;

    iget-object v13, v0, Landroidx/media3/exoplayer/PlaybackInfo;->staticMetadata:Ljava/util/List;

    iget-object v14, v0, Landroidx/media3/exoplayer/PlaybackInfo;->loadingMediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-boolean v15, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReady:Z

    move-object/from16 p1, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReadyChangeReason:I

    move/from16 v16, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackSuppressionReason:I

    move/from16 v17, v1

    move-object/from16 v29, v2

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->bufferedPositionUs:J

    move-wide/from16 v19, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->totalBufferedDurationUs:J

    move-wide/from16 v21, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    move-wide/from16 v23, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    move-wide/from16 v25, v1

    iget-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->sleepingForOffload:Z

    move/from16 v27, v1

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-direct/range {v1 .. v27}, Landroidx/media3/exoplayer/PlaybackInfo;-><init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V

    return-object v28
.end method

.method public copyWithPlaybackState(I)Landroidx/media3/exoplayer/PlaybackInfo;
    .locals 30

    move-object/from16 v0, p0

    move/from16 v8, p1

    .line 313
    new-instance v28, Landroidx/media3/exoplayer/PlaybackInfo;

    move-object/from16 v1, v28

    iget-object v2, v0, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    iget-object v3, v0, Landroidx/media3/exoplayer/PlaybackInfo;->periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v4, v0, Landroidx/media3/exoplayer/PlaybackInfo;->requestedContentPositionUs:J

    iget-wide v6, v0, Landroidx/media3/exoplayer/PlaybackInfo;->discontinuityStartPositionUs:J

    iget-object v9, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackError:Landroidx/media3/exoplayer/ExoPlaybackException;

    iget-boolean v10, v0, Landroidx/media3/exoplayer/PlaybackInfo;->isLoading:Z

    iget-object v11, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackGroups:Landroidx/media3/exoplayer/source/TrackGroupArray;

    iget-object v12, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackSelectorResult:Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;

    iget-object v13, v0, Landroidx/media3/exoplayer/PlaybackInfo;->staticMetadata:Ljava/util/List;

    iget-object v14, v0, Landroidx/media3/exoplayer/PlaybackInfo;->loadingMediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-boolean v15, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReady:Z

    move-object/from16 p1, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReadyChangeReason:I

    move/from16 v16, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackSuppressionReason:I

    move/from16 v17, v1

    iget-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackParameters:Landroidx/media3/common/PlaybackParameters;

    move-object/from16 v18, v1

    move-object/from16 v29, v2

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->bufferedPositionUs:J

    move-wide/from16 v19, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->totalBufferedDurationUs:J

    move-wide/from16 v21, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    move-wide/from16 v23, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    move-wide/from16 v25, v1

    iget-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->sleepingForOffload:Z

    move/from16 v27, v1

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-direct/range {v1 .. v27}, Landroidx/media3/exoplayer/PlaybackInfo;-><init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V

    return-object v28
.end method

.method public copyWithSleepingForOffload(Z)Landroidx/media3/exoplayer/PlaybackInfo;
    .locals 30

    move-object/from16 v0, p0

    move/from16 v27, p1

    .line 506
    new-instance v28, Landroidx/media3/exoplayer/PlaybackInfo;

    move-object/from16 v1, v28

    iget-object v2, v0, Landroidx/media3/exoplayer/PlaybackInfo;->timeline:Landroidx/media3/common/Timeline;

    iget-object v3, v0, Landroidx/media3/exoplayer/PlaybackInfo;->periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v4, v0, Landroidx/media3/exoplayer/PlaybackInfo;->requestedContentPositionUs:J

    iget-wide v6, v0, Landroidx/media3/exoplayer/PlaybackInfo;->discontinuityStartPositionUs:J

    iget v8, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackState:I

    iget-object v9, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackError:Landroidx/media3/exoplayer/ExoPlaybackException;

    iget-boolean v10, v0, Landroidx/media3/exoplayer/PlaybackInfo;->isLoading:Z

    iget-object v11, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackGroups:Landroidx/media3/exoplayer/source/TrackGroupArray;

    iget-object v12, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackSelectorResult:Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;

    iget-object v13, v0, Landroidx/media3/exoplayer/PlaybackInfo;->staticMetadata:Ljava/util/List;

    iget-object v14, v0, Landroidx/media3/exoplayer/PlaybackInfo;->loadingMediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-boolean v15, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReady:Z

    move-object/from16 p1, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReadyChangeReason:I

    move/from16 v16, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackSuppressionReason:I

    move/from16 v17, v1

    iget-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackParameters:Landroidx/media3/common/PlaybackParameters;

    move-object/from16 v18, v1

    move-object/from16 v29, v2

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->bufferedPositionUs:J

    move-wide/from16 v19, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->totalBufferedDurationUs:J

    move-wide/from16 v21, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    move-wide/from16 v23, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    move-wide/from16 v25, v1

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-direct/range {v1 .. v27}, Landroidx/media3/exoplayer/PlaybackInfo;-><init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V

    return-object v28
.end method

.method public copyWithTimeline(Landroidx/media3/common/Timeline;)Landroidx/media3/exoplayer/PlaybackInfo;
    .locals 30

    move-object/from16 v0, p0

    move-object/from16 v2, p1

    .line 282
    new-instance v28, Landroidx/media3/exoplayer/PlaybackInfo;

    move-object/from16 v1, v28

    iget-object v3, v0, Landroidx/media3/exoplayer/PlaybackInfo;->periodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v4, v0, Landroidx/media3/exoplayer/PlaybackInfo;->requestedContentPositionUs:J

    iget-wide v6, v0, Landroidx/media3/exoplayer/PlaybackInfo;->discontinuityStartPositionUs:J

    iget v8, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackState:I

    iget-object v9, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackError:Landroidx/media3/exoplayer/ExoPlaybackException;

    iget-boolean v10, v0, Landroidx/media3/exoplayer/PlaybackInfo;->isLoading:Z

    iget-object v11, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackGroups:Landroidx/media3/exoplayer/source/TrackGroupArray;

    iget-object v12, v0, Landroidx/media3/exoplayer/PlaybackInfo;->trackSelectorResult:Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;

    iget-object v13, v0, Landroidx/media3/exoplayer/PlaybackInfo;->staticMetadata:Ljava/util/List;

    iget-object v14, v0, Landroidx/media3/exoplayer/PlaybackInfo;->loadingMediaPeriodId:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-boolean v15, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReady:Z

    move-object/from16 p1, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReadyChangeReason:I

    move/from16 v16, v1

    iget v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackSuppressionReason:I

    move/from16 v17, v1

    iget-object v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackParameters:Landroidx/media3/common/PlaybackParameters;

    move-object/from16 v18, v1

    move-object/from16 v29, v2

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->bufferedPositionUs:J

    move-wide/from16 v19, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->totalBufferedDurationUs:J

    move-wide/from16 v21, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    move-wide/from16 v23, v1

    iget-wide v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    move-wide/from16 v25, v1

    iget-boolean v1, v0, Landroidx/media3/exoplayer/PlaybackInfo;->sleepingForOffload:Z

    move/from16 v27, v1

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-direct/range {v1 .. v27}, Landroidx/media3/exoplayer/PlaybackInfo;-><init>(Landroidx/media3/common/Timeline;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJILandroidx/media3/exoplayer/ExoPlaybackException;ZLandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/TrackSelectorResult;Ljava/util/List;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;ZIILandroidx/media3/common/PlaybackParameters;JJJJZ)V

    return-object v28
.end method

.method public getEstimatedPositionUs()J
    .locals 7

    .line 584
    invoke-virtual {p0}, Landroidx/media3/exoplayer/PlaybackInfo;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    .line 585
    iget-wide v0, p0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    return-wide v0

    .line 593
    :cond_0
    iget-wide v0, p0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    .line 594
    iget-wide v2, p0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    .line 595
    iget-wide v4, p0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    cmp-long v6, v0, v4

    if-nez v6, :cond_0

    .line 597
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    sub-long/2addr v4, v0

    .line 599
    invoke-static {v2, v3}, Landroidx/media3/common/util/Util;->usToMs(J)J

    move-result-wide v0

    long-to-float v2, v4

    iget-object v3, p0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackParameters:Landroidx/media3/common/PlaybackParameters;

    iget v3, v3, Landroidx/media3/common/PlaybackParameters;->speed:F

    mul-float v2, v2, v3

    float-to-long v2, v2

    add-long/2addr v0, v2

    .line 600
    invoke-static {v0, v1}, Landroidx/media3/common/util/Util;->msToUs(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public isPlaying()Z
    .locals 2

    .line 617
    iget v0, p0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Landroidx/media3/exoplayer/PlaybackInfo;->playWhenReady:Z

    if-eqz v0, :cond_0

    iget v0, p0, Landroidx/media3/exoplayer/PlaybackInfo;->playbackSuppressionReason:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public updatePositionUs(J)V
    .locals 0

    .line 571
    iput-wide p1, p0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUs:J

    .line 572
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    iput-wide p1, p0, Landroidx/media3/exoplayer/PlaybackInfo;->positionUpdateTimeMs:J

    return-void
.end method
