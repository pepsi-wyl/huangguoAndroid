.class public final Landroidx/media3/common/Timeline$RemotableTimeline;
.super Landroidx/media3/common/Timeline;
.source "Timeline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/common/Timeline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RemotableTimeline"
.end annotation


# instance fields
.field private final periods:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Landroidx/media3/common/Timeline$Period;",
            ">;"
        }
    .end annotation
.end field

.field private final shuffledWindowIndices:[I

.field private final windowIndicesInShuffled:[I

.field private final windows:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Landroidx/media3/common/Timeline$Window;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/common/collect/ImmutableList;Lcom/google/common/collect/ImmutableList;[I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList<",
            "Landroidx/media3/common/Timeline$Window;",
            ">;",
            "Lcom/google/common/collect/ImmutableList<",
            "Landroidx/media3/common/Timeline$Period;",
            ">;[I)V"
        }
    .end annotation

    .line 1485
    invoke-direct {p0}, Landroidx/media3/common/Timeline;-><init>()V

    .line 1486
    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    array-length v1, p3

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 1487
    iput-object p1, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->windows:Lcom/google/common/collect/ImmutableList;

    .line 1488
    iput-object p2, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->periods:Lcom/google/common/collect/ImmutableList;

    .line 1489
    iput-object p3, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->shuffledWindowIndices:[I

    .line 1490
    array-length p1, p3

    new-array p1, p1, [I

    iput-object p1, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->windowIndicesInShuffled:[I

    .line 1491
    :goto_1
    array-length p1, p3

    if-ge v2, p1, :cond_1

    .line 1492
    iget-object p1, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->windowIndicesInShuffled:[I

    aget p2, p3, v2

    aput v2, p1, p2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method


# virtual methods
.method public getFirstWindowIndex(Z)I
    .locals 1

    .line 1567
    invoke-virtual {p0}, Landroidx/media3/common/Timeline$RemotableTimeline;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 1570
    iget-object p1, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->shuffledWindowIndices:[I

    aget v0, p1, v0

    :cond_1
    return v0
.end method

.method public getIndexOfPeriod(Ljava/lang/Object;)I
    .locals 0

    .line 1594
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public getLastWindowIndex(Z)I
    .locals 1

    .line 1557
    invoke-virtual {p0}, Landroidx/media3/common/Timeline$RemotableTimeline;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    if-eqz p1, :cond_1

    .line 1561
    iget-object p1, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->shuffledWindowIndices:[I

    invoke-virtual {p0}, Landroidx/media3/common/Timeline$RemotableTimeline;->getWindowCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    aget p1, p1, v0

    goto :goto_0

    .line 1562
    :cond_1
    invoke-virtual {p0}, Landroidx/media3/common/Timeline$RemotableTimeline;->getWindowCount()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    :goto_0
    return p1
.end method

.method public getNextWindowIndex(IIZ)I
    .locals 2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    return p1

    .line 1529
    :cond_0
    invoke-virtual {p0, p3}, Landroidx/media3/common/Timeline$RemotableTimeline;->getLastWindowIndex(Z)I

    move-result v1

    if-ne p1, v1, :cond_2

    const/4 p1, 0x2

    if-ne p2, p1, :cond_1

    .line 1531
    invoke-virtual {p0, p3}, Landroidx/media3/common/Timeline$RemotableTimeline;->getFirstWindowIndex(Z)I

    move-result p1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    :goto_0
    return p1

    :cond_2
    if-eqz p3, :cond_3

    .line 1535
    iget-object p2, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->shuffledWindowIndices:[I

    iget-object p3, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->windowIndicesInShuffled:[I

    aget p1, p3, p1

    add-int/2addr p1, v0

    aget p1, p2, p1

    goto :goto_1

    :cond_3
    add-int/2addr p1, v0

    :goto_1
    return p1
.end method

.method public getPeriod(ILandroidx/media3/common/Timeline$Period;Z)Landroidx/media3/common/Timeline$Period;
    .locals 10

    .line 1580
    iget-object p3, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->periods:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p3, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/common/Timeline$Period;

    .line 1581
    iget-object v1, p1, Landroidx/media3/common/Timeline$Period;->id:Ljava/lang/Object;

    iget-object v2, p1, Landroidx/media3/common/Timeline$Period;->uid:Ljava/lang/Object;

    iget v3, p1, Landroidx/media3/common/Timeline$Period;->windowIndex:I

    iget-wide v4, p1, Landroidx/media3/common/Timeline$Period;->durationUs:J

    iget-wide v6, p1, Landroidx/media3/common/Timeline$Period;->positionInWindowUs:J

    .line 1587
    invoke-static {p1}, Landroidx/media3/common/Timeline$Period;->access$000(Landroidx/media3/common/Timeline$Period;)Landroidx/media3/common/AdPlaybackState;

    move-result-object v8

    iget-boolean v9, p1, Landroidx/media3/common/Timeline$Period;->isPlaceholder:Z

    move-object v0, p2

    .line 1581
    invoke-virtual/range {v0 .. v9}, Landroidx/media3/common/Timeline$Period;->set(Ljava/lang/Object;Ljava/lang/Object;IJJLandroidx/media3/common/AdPlaybackState;Z)Landroidx/media3/common/Timeline$Period;

    return-object p2
.end method

.method public getPeriodCount()I
    .locals 1

    .line 1575
    iget-object v0, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->periods:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    return v0
.end method

.method public getPreviousWindowIndex(IIZ)I
    .locals 2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    return p1

    .line 1545
    :cond_0
    invoke-virtual {p0, p3}, Landroidx/media3/common/Timeline$RemotableTimeline;->getFirstWindowIndex(Z)I

    move-result v1

    if-ne p1, v1, :cond_2

    const/4 p1, 0x2

    if-ne p2, p1, :cond_1

    .line 1547
    invoke-virtual {p0, p3}, Landroidx/media3/common/Timeline$RemotableTimeline;->getLastWindowIndex(Z)I

    move-result p1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    :goto_0
    return p1

    :cond_2
    if-eqz p3, :cond_3

    .line 1551
    iget-object p2, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->shuffledWindowIndices:[I

    iget-object p3, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->windowIndicesInShuffled:[I

    aget p1, p3, p1

    sub-int/2addr p1, v0

    aget p1, p2, p1

    goto :goto_1

    :cond_3
    sub-int/2addr p1, v0

    :goto_1
    return p1
.end method

.method public getUidOfPeriod(I)Ljava/lang/Object;
    .locals 0

    .line 1599
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public getWindow(ILandroidx/media3/common/Timeline$Window;J)Landroidx/media3/common/Timeline$Window;
    .locals 22

    move-object/from16 v15, p2

    move-object/from16 v0, p2

    move-object/from16 v13, p0

    .line 1503
    iget-object v1, v13, Landroidx/media3/common/Timeline$RemotableTimeline;->windows:Lcom/google/common/collect/ImmutableList;

    move/from16 v2, p1

    invoke-virtual {v1, v2}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Landroidx/media3/common/Timeline$Window;

    .line 1504
    iget-object v1, v14, Landroidx/media3/common/Timeline$Window;->uid:Ljava/lang/Object;

    iget-object v2, v14, Landroidx/media3/common/Timeline$Window;->mediaItem:Landroidx/media3/common/MediaItem;

    iget-object v3, v14, Landroidx/media3/common/Timeline$Window;->manifest:Ljava/lang/Object;

    iget-wide v4, v14, Landroidx/media3/common/Timeline$Window;->presentationStartTimeMs:J

    iget-wide v6, v14, Landroidx/media3/common/Timeline$Window;->windowStartTimeMs:J

    iget-wide v8, v14, Landroidx/media3/common/Timeline$Window;->elapsedRealtimeEpochOffsetMs:J

    iget-boolean v10, v14, Landroidx/media3/common/Timeline$Window;->isSeekable:Z

    iget-boolean v11, v14, Landroidx/media3/common/Timeline$Window;->isDynamic:Z

    iget-object v12, v14, Landroidx/media3/common/Timeline$Window;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    move-object/from16 p3, v0

    move-object/from16 p1, v1

    iget-wide v0, v14, Landroidx/media3/common/Timeline$Window;->defaultPositionUs:J

    move-object/from16 p4, v2

    move-object v2, v14

    move-wide v13, v0

    iget-wide v0, v2, Landroidx/media3/common/Timeline$Window;->durationUs:J

    move-wide v15, v0

    iget v0, v2, Landroidx/media3/common/Timeline$Window;->firstPeriodIndex:I

    move/from16 v17, v0

    iget v0, v2, Landroidx/media3/common/Timeline$Window;->lastPeriodIndex:I

    move/from16 v18, v0

    iget-wide v0, v2, Landroidx/media3/common/Timeline$Window;->positionInFirstPeriodUs:J

    move-wide/from16 v19, v0

    move-object/from16 v1, p1

    move-object/from16 v0, p3

    move-object/from16 v21, v2

    move-object/from16 v2, p4

    invoke-virtual/range {v0 .. v20}, Landroidx/media3/common/Timeline$Window;->set(Ljava/lang/Object;Landroidx/media3/common/MediaItem;Ljava/lang/Object;JJJZZLandroidx/media3/common/MediaItem$LiveConfiguration;JJIIJ)Landroidx/media3/common/Timeline$Window;

    move-object/from16 v1, v21

    .line 1519
    iget-boolean v0, v1, Landroidx/media3/common/Timeline$Window;->isPlaceholder:Z

    move-object/from16 v1, p2

    iput-boolean v0, v1, Landroidx/media3/common/Timeline$Window;->isPlaceholder:Z

    return-object v1
.end method

.method public getWindowCount()I
    .locals 1

    .line 1498
    iget-object v0, p0, Landroidx/media3/common/Timeline$RemotableTimeline;->windows:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    return v0
.end method
