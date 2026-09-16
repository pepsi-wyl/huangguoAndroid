.class final Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;
.super Landroidx/media3/common/Timeline;
.source "DashMediaSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/dash/DashMediaSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DashTimeline"
.end annotation


# instance fields
.field private final elapsedRealtimeEpochOffsetMs:J

.field private final firstPeriodId:I

.field private final liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

.field private final manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

.field private final mediaItem:Landroidx/media3/common/MediaItem;

.field private final offsetInFirstPeriodUs:J

.field private final presentationStartTimeMs:J

.field private final windowDefaultStartPositionUs:J

.field private final windowDurationUs:J

.field private final windowStartTimeMs:J


# direct methods
.method public constructor <init>(JJJIJJJLandroidx/media3/exoplayer/dash/manifest/DashManifest;Landroidx/media3/common/MediaItem;Landroidx/media3/common/MediaItem$LiveConfiguration;)V
    .locals 7

    move-object v0, p0

    move-object/from16 v1, p14

    move-object/from16 v2, p16

    .line 1251
    invoke-direct {p0}, Landroidx/media3/common/Timeline;-><init>()V

    .line 1252
    iget-boolean v3, v1, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->dynamic:Z

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    :goto_0
    if-ne v3, v6, :cond_1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    invoke-static {v4}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    move-wide v3, p1

    .line 1253
    iput-wide v3, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->presentationStartTimeMs:J

    move-wide v3, p3

    .line 1254
    iput-wide v3, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->windowStartTimeMs:J

    move-wide v3, p5

    .line 1255
    iput-wide v3, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->elapsedRealtimeEpochOffsetMs:J

    move v3, p7

    .line 1256
    iput v3, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->firstPeriodId:I

    move-wide v3, p8

    .line 1257
    iput-wide v3, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->offsetInFirstPeriodUs:J

    move-wide/from16 v3, p10

    .line 1258
    iput-wide v3, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->windowDurationUs:J

    move-wide/from16 v3, p12

    .line 1259
    iput-wide v3, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->windowDefaultStartPositionUs:J

    .line 1260
    iput-object v1, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    move-object/from16 v1, p15

    .line 1261
    iput-object v1, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->mediaItem:Landroidx/media3/common/MediaItem;

    .line 1262
    iput-object v2, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    return-void
.end method

.method private getAdjustedWindowDefaultStartPositionUs(J)J
    .locals 10

    .line 1322
    iget-wide v0, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->windowDefaultStartPositionUs:J

    .line 1323
    iget-object v2, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    invoke-static {v2}, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->isMovingLiveWindow(Landroidx/media3/exoplayer/dash/manifest/DashManifest;)Z

    move-result v2

    if-nez v2, :cond_0

    return-wide v0

    :cond_0
    const-wide/16 v2, 0x0

    cmp-long v4, p1, v2

    if-lez v4, :cond_1

    add-long/2addr v0, p1

    .line 1328
    iget-wide p1, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->windowDurationUs:J

    cmp-long v4, v0, p1

    if-lez v4, :cond_1

    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    return-wide p1

    .line 1335
    :cond_1
    iget-wide p1, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->offsetInFirstPeriodUs:J

    add-long/2addr p1, v0

    .line 1336
    iget-object v4, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->getPeriodDurationUs(I)J

    move-result-wide v6

    const/4 v4, 0x0

    .line 1337
    :goto_0
    iget-object v8, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    invoke-virtual {v8}, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->getPeriodCount()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-ge v4, v8, :cond_2

    cmp-long v8, p1, v6

    if-ltz v8, :cond_2

    sub-long/2addr p1, v6

    add-int/lit8 v4, v4, 0x1

    .line 1341
    iget-object v6, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    invoke-virtual {v6, v4}, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->getPeriodDurationUs(I)J

    move-result-wide v6

    goto :goto_0

    .line 1343
    :cond_2
    iget-object v8, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    invoke-virtual {v8, v4}, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->getPeriod(I)Landroidx/media3/exoplayer/dash/manifest/Period;

    move-result-object v4

    const/4 v8, 0x2

    .line 1344
    invoke-virtual {v4, v8}, Landroidx/media3/exoplayer/dash/manifest/Period;->getAdaptationSetIndex(I)I

    move-result v8

    const/4 v9, -0x1

    if-ne v8, v9, :cond_3

    return-wide v0

    .line 1352
    :cond_3
    iget-object v4, v4, Landroidx/media3/exoplayer/dash/manifest/Period;->adaptationSets:Ljava/util/List;

    .line 1353
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/media3/exoplayer/dash/manifest/AdaptationSet;

    iget-object v4, v4, Landroidx/media3/exoplayer/dash/manifest/AdaptationSet;->representations:Ljava/util/List;

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/media3/exoplayer/dash/manifest/Representation;

    invoke-virtual {v4}, Landroidx/media3/exoplayer/dash/manifest/Representation;->getIndex()Landroidx/media3/exoplayer/dash/DashSegmentIndex;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 1354
    invoke-interface {v4, v6, v7}, Landroidx/media3/exoplayer/dash/DashSegmentIndex;->getSegmentCount(J)J

    move-result-wide v8

    cmp-long v5, v8, v2

    if-nez v5, :cond_4

    goto :goto_1

    .line 1358
    :cond_4
    invoke-interface {v4, p1, p2, v6, v7}, Landroidx/media3/exoplayer/dash/DashSegmentIndex;->getSegmentNum(JJ)J

    move-result-wide v2

    .line 1360
    invoke-interface {v4, v2, v3}, Landroidx/media3/exoplayer/dash/DashSegmentIndex;->getTimeUs(J)J

    move-result-wide v2

    add-long/2addr v0, v2

    sub-long/2addr v0, p1

    :cond_5
    :goto_1
    return-wide v0
.end method

.method private static isMovingLiveWindow(Landroidx/media3/exoplayer/dash/manifest/DashManifest;)Z
    .locals 5

    .line 1371
    iget-boolean v0, p0, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->dynamic:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->minUpdatePeriodMs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget-wide v0, p0, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->durationMs:J

    cmp-long p0, v0, v2

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public getIndexOfPeriod(Ljava/lang/Object;)I
    .locals 2

    .line 1313
    instance-of v0, p1, Ljava/lang/Integer;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    .line 1316
    :cond_0
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 1317
    iget v0, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->firstPeriodId:I

    sub-int/2addr p1, v0

    if-ltz p1, :cond_2

    .line 1318
    invoke-virtual {p0}, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->getPeriodCount()I

    move-result v0

    if-lt p1, v0, :cond_1

    goto :goto_0

    :cond_1
    move v1, p1

    :cond_2
    :goto_0
    return v1
.end method

.method public getPeriod(ILandroidx/media3/common/Timeline$Period;Z)Landroidx/media3/common/Timeline$Period;
    .locals 11

    .line 1272
    invoke-virtual {p0}, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->getPeriodCount()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {p1, v1, v0}, Landroidx/media3/common/util/Assertions;->checkIndex(III)I

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    .line 1273
    iget-object v2, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    invoke-virtual {v2, p1}, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->getPeriod(I)Landroidx/media3/exoplayer/dash/manifest/Period;

    move-result-object v2

    iget-object v2, v2, Landroidx/media3/exoplayer/dash/manifest/Period;->id:Ljava/lang/String;

    move-object v4, v2

    goto :goto_0

    :cond_0
    move-object v4, v0

    :goto_0
    if-eqz p3, :cond_1

    .line 1274
    iget p3, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->firstPeriodId:I

    add-int/2addr p3, p1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :cond_1
    move-object v5, v0

    .line 1275
    iget-object p3, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    .line 1279
    invoke-virtual {p3, p1}, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->getPeriodDurationUs(I)J

    move-result-wide v7

    iget-object p3, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    .line 1280
    invoke-virtual {p3, p1}, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->getPeriod(I)Landroidx/media3/exoplayer/dash/manifest/Period;

    move-result-object p1

    iget-wide v2, p1, Landroidx/media3/exoplayer/dash/manifest/Period;->startMs:J

    iget-object p1, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    invoke-virtual {p1, v1}, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->getPeriod(I)Landroidx/media3/exoplayer/dash/manifest/Period;

    move-result-object p1

    iget-wide v0, p1, Landroidx/media3/exoplayer/dash/manifest/Period;->startMs:J

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Landroidx/media3/common/util/Util;->msToUs(J)J

    move-result-wide v0

    iget-wide v2, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->offsetInFirstPeriodUs:J

    sub-long v9, v0, v2

    const/4 v6, 0x0

    move-object v3, p2

    .line 1275
    invoke-virtual/range {v3 .. v10}, Landroidx/media3/common/Timeline$Period;->set(Ljava/lang/Object;Ljava/lang/Object;IJJ)Landroidx/media3/common/Timeline$Period;

    move-result-object p1

    return-object p1
.end method

.method public getPeriodCount()I
    .locals 1

    .line 1267
    iget-object v0, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/dash/manifest/DashManifest;->getPeriodCount()I

    move-result v0

    return v0
.end method

.method public getUidOfPeriod(I)Ljava/lang/Object;
    .locals 2

    const/4 v0, 0x0

    .line 1366
    invoke-virtual {p0}, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->getPeriodCount()I

    move-result v1

    invoke-static {p1, v0, v1}, Landroidx/media3/common/util/Assertions;->checkIndex(III)I

    .line 1367
    iget v0, p0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->firstPeriodId:I

    add-int/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getWindow(ILandroidx/media3/common/Timeline$Window;J)Landroidx/media3/common/Timeline$Window;
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const/4 v2, 0x0

    const/4 v11, 0x1

    move/from16 v3, p1

    .line 1291
    invoke-static {v3, v2, v11}, Landroidx/media3/common/util/Assertions;->checkIndex(III)I

    move-wide/from16 v2, p3

    .line 1293
    invoke-direct {v0, v2, v3}, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->getAdjustedWindowDefaultStartPositionUs(J)J

    move-result-wide v14

    .line 1294
    sget-object v2, Landroidx/media3/common/Timeline$Window;->SINGLE_WINDOW_UID:Ljava/lang/Object;

    iget-object v3, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->mediaItem:Landroidx/media3/common/MediaItem;

    iget-object v12, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->manifest:Landroidx/media3/exoplayer/dash/manifest/DashManifest;

    move-object v4, v12

    iget-wide v5, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->presentationStartTimeMs:J

    iget-wide v7, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->windowStartTimeMs:J

    iget-wide v9, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->elapsedRealtimeEpochOffsetMs:J

    .line 1302
    invoke-static {v12}, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->isMovingLiveWindow(Landroidx/media3/exoplayer/dash/manifest/DashManifest;)Z

    move-result v12

    iget-object v13, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    move/from16 p1, v12

    iget-wide v11, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->windowDurationUs:J

    move-wide/from16 v16, v11

    .line 1307
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->getPeriodCount()I

    move-result v11

    const/4 v12, 0x1

    add-int/lit8 v19, v11, -0x1

    iget-wide v11, v0, Landroidx/media3/exoplayer/dash/DashMediaSource$DashTimeline;->offsetInFirstPeriodUs:J

    move-wide/from16 v20, v11

    const/4 v11, 0x1

    const/16 v18, 0x0

    move/from16 v12, p1

    .line 1294
    invoke-virtual/range {v1 .. v21}, Landroidx/media3/common/Timeline$Window;->set(Ljava/lang/Object;Landroidx/media3/common/MediaItem;Ljava/lang/Object;JJJZZLandroidx/media3/common/MediaItem$LiveConfiguration;JJIIJ)Landroidx/media3/common/Timeline$Window;

    move-result-object v1

    return-object v1
.end method

.method public getWindowCount()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
