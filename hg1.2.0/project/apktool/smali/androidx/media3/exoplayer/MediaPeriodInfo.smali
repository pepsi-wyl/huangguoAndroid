.class final Landroidx/media3/exoplayer/MediaPeriodInfo;
.super Ljava/lang/Object;
.source "MediaPeriodInfo.java"


# instance fields
.field public final durationUs:J

.field public final endPositionUs:J

.field public final id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

.field public final isFinal:Z

.field public final isFollowedByTransitionToSameStream:Z

.field public final isLastInTimelinePeriod:Z

.field public final isLastInTimelineWindow:Z

.field public final requestedContentPositionUs:J

.field public final startPositionUs:J


# direct methods
.method constructor <init>(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJJJZZZZ)V
    .locals 8

    move-object v0, p0

    move/from16 v1, p10

    move/from16 v2, p11

    move/from16 v3, p12

    move/from16 v4, p13

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v4, :cond_1

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v7, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v7, 0x1

    .line 91
    :goto_1
    invoke-static {v7}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    if-eqz v3, :cond_3

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    const/4 v7, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v7, 0x1

    .line 92
    :goto_3
    invoke-static {v7}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    if-eqz v1, :cond_4

    if-nez v2, :cond_5

    if-nez v3, :cond_5

    if-nez v4, :cond_5

    :cond_4
    const/4 v5, 0x1

    .line 93
    :cond_5
    invoke-static {v5}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    move-object v5, p1

    .line 96
    iput-object v5, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    move-wide v5, p2

    .line 97
    iput-wide v5, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->startPositionUs:J

    move-wide v5, p4

    .line 98
    iput-wide v5, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    move-wide v5, p6

    .line 99
    iput-wide v5, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->endPositionUs:J

    move-wide/from16 v5, p8

    .line 100
    iput-wide v5, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    .line 101
    iput-boolean v1, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFollowedByTransitionToSameStream:Z

    .line 102
    iput-boolean v2, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelinePeriod:Z

    .line 103
    iput-boolean v3, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelineWindow:Z

    .line 104
    iput-boolean v4, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFinal:Z

    return-void
.end method


# virtual methods
.method public copyWithRequestedContentPositionUs(J)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 17

    move-object/from16 v0, p0

    .line 131
    iget-wide v1, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    cmp-long v3, p1, v1

    if-nez v3, :cond_0

    move-object v1, v0

    goto :goto_0

    .line 133
    :cond_0
    new-instance v1, Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-object v4, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v5, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->startPositionUs:J

    iget-wide v9, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->endPositionUs:J

    iget-wide v11, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    iget-boolean v13, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFollowedByTransitionToSameStream:Z

    iget-boolean v14, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelinePeriod:Z

    iget-boolean v15, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelineWindow:Z

    iget-boolean v2, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFinal:Z

    move-object v3, v1

    move-wide/from16 v7, p1

    move/from16 v16, v2

    invoke-direct/range {v3 .. v16}, Landroidx/media3/exoplayer/MediaPeriodInfo;-><init>(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJJJZZZZ)V

    :goto_0
    return-object v1
.end method

.method public copyWithStartPositionUs(J)Landroidx/media3/exoplayer/MediaPeriodInfo;
    .locals 17

    move-object/from16 v0, p0

    .line 112
    iget-wide v1, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->startPositionUs:J

    cmp-long v3, p1, v1

    if-nez v3, :cond_0

    move-object v1, v0

    goto :goto_0

    .line 114
    :cond_0
    new-instance v1, Landroidx/media3/exoplayer/MediaPeriodInfo;

    iget-object v4, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-wide v7, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    iget-wide v9, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->endPositionUs:J

    iget-wide v11, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    iget-boolean v13, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFollowedByTransitionToSameStream:Z

    iget-boolean v14, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelinePeriod:Z

    iget-boolean v15, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelineWindow:Z

    iget-boolean v2, v0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFinal:Z

    move-object v3, v1

    move-wide/from16 v5, p1

    move/from16 v16, v2

    invoke-direct/range {v3 .. v16}, Landroidx/media3/exoplayer/MediaPeriodInfo;-><init>(Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;JJJJZZZZ)V

    :goto_0
    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 150
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 153
    :cond_1
    check-cast p1, Landroidx/media3/exoplayer/MediaPeriodInfo;

    .line 154
    iget-wide v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->startPositionUs:J

    iget-wide v4, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->startPositionUs:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget-wide v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    iget-wide v4, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget-wide v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->endPositionUs:J

    iget-wide v4, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->endPositionUs:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget-wide v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    iget-wide v4, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget-boolean v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFollowedByTransitionToSameStream:Z

    iget-boolean v3, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFollowedByTransitionToSameStream:Z

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelinePeriod:Z

    iget-boolean v3, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelinePeriod:Z

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelineWindow:Z

    iget-boolean v3, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelineWindow:Z

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFinal:Z

    iget-boolean v3, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFinal:Z

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    iget-object p1, p1, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    .line 162
    invoke-static {v2, p1}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 4

    .line 168
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->id:Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;->hashCode()I

    move-result v0

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 169
    iget-wide v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->startPositionUs:J

    long-to-int v0, v2

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 170
    iget-wide v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->requestedContentPositionUs:J

    long-to-int v0, v2

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 171
    iget-wide v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->endPositionUs:J

    long-to-int v0, v2

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 172
    iget-wide v2, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->durationUs:J

    long-to-int v0, v2

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 173
    iget-boolean v0, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFollowedByTransitionToSameStream:Z

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 174
    iget-boolean v0, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelinePeriod:Z

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 175
    iget-boolean v0, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isLastInTimelineWindow:Z

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 176
    iget-boolean v0, p0, Landroidx/media3/exoplayer/MediaPeriodInfo;->isFinal:Z

    add-int/2addr v1, v0

    return v1
.end method
