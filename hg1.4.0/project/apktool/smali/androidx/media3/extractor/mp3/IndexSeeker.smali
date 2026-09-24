.class final Landroidx/media3/extractor/mp3/IndexSeeker;
.super Ljava/lang/Object;
.source "IndexSeeker.java"

# interfaces
.implements Landroidx/media3/extractor/mp3/Seeker;


# static fields
.field static final MIN_TIME_BETWEEN_POINTS_US:J = 0x186a0L


# instance fields
.field private final averageBitrate:I

.field private final dataEndPosition:J

.field private durationUs:J

.field private final positions:Landroidx/media3/common/util/LongArray;

.field private final timesUs:Landroidx/media3/common/util/LongArray;


# direct methods
.method public constructor <init>(JJJ)V
    .locals 13

    move-object v0, p0

    move-wide v5, p1

    move-wide/from16 v1, p3

    move-wide/from16 v3, p5

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-wide v5, v0, Landroidx/media3/extractor/mp3/IndexSeeker;->durationUs:J

    .line 40
    iput-wide v3, v0, Landroidx/media3/extractor/mp3/IndexSeeker;->dataEndPosition:J

    .line 41
    new-instance v7, Landroidx/media3/common/util/LongArray;

    invoke-direct {v7}, Landroidx/media3/common/util/LongArray;-><init>()V

    iput-object v7, v0, Landroidx/media3/extractor/mp3/IndexSeeker;->timesUs:Landroidx/media3/common/util/LongArray;

    .line 42
    new-instance v8, Landroidx/media3/common/util/LongArray;

    invoke-direct {v8}, Landroidx/media3/common/util/LongArray;-><init>()V

    iput-object v8, v0, Landroidx/media3/extractor/mp3/IndexSeeker;->positions:Landroidx/media3/common/util/LongArray;

    const-wide/16 v9, 0x0

    .line 43
    invoke-virtual {v7, v9, v10}, Landroidx/media3/common/util/LongArray;->add(J)V

    .line 44
    invoke-virtual {v8, v1, v2}, Landroidx/media3/common/util/LongArray;->add(J)V

    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    const v11, -0x7fffffff

    cmp-long v12, v5, v7

    if-eqz v12, :cond_1

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x8

    .line 46
    sget-object v7, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    move-wide v5, p1

    .line 47
    invoke-static/range {v1 .. v7}, Landroidx/media3/common/util/Util;->scaleLargeValue(JJJLjava/math/RoundingMode;)J

    move-result-wide v1

    cmp-long v3, v1, v9

    if-lez v3, :cond_0

    const-wide/32 v3, 0x7fffffff

    cmp-long v5, v1, v3

    if-gtz v5, :cond_0

    long-to-int v11, v1

    .line 50
    :cond_0
    iput v11, v0, Landroidx/media3/extractor/mp3/IndexSeeker;->averageBitrate:I

    goto :goto_0

    .line 52
    :cond_1
    iput v11, v0, Landroidx/media3/extractor/mp3/IndexSeeker;->averageBitrate:I

    :goto_0
    return-void
.end method


# virtual methods
.method public getAverageBitrate()I
    .locals 1

    .line 95
    iget v0, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->averageBitrate:I

    return v0
.end method

.method public getDataEndPosition()J
    .locals 2

    .line 66
    iget-wide v0, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->dataEndPosition:J

    return-wide v0
.end method

.method public getDurationUs()J
    .locals 2

    .line 76
    iget-wide v0, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->durationUs:J

    return-wide v0
.end method

.method public getSeekPoints(J)Landroidx/media3/extractor/SeekMap$SeekPoints;
    .locals 7

    .line 81
    iget-object v0, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->timesUs:Landroidx/media3/common/util/LongArray;

    const/4 v1, 0x1

    .line 82
    invoke-static {v0, p1, p2, v1, v1}, Landroidx/media3/common/util/Util;->binarySearchFloor(Landroidx/media3/common/util/LongArray;JZZ)I

    move-result v0

    .line 83
    new-instance v2, Landroidx/media3/extractor/SeekPoint;

    iget-object v3, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->timesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v3, v0}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v3

    iget-object v5, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->positions:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v5, v0}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v5

    invoke-direct {v2, v3, v4, v5, v6}, Landroidx/media3/extractor/SeekPoint;-><init>(JJ)V

    .line 84
    iget-wide v3, v2, Landroidx/media3/extractor/SeekPoint;->timeUs:J

    cmp-long v5, v3, p1

    if-eqz v5, :cond_1

    iget-object p1, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->timesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {p1}, Landroidx/media3/common/util/LongArray;->size()I

    move-result p1

    sub-int/2addr p1, v1

    if-ne v0, p1, :cond_0

    goto :goto_0

    .line 87
    :cond_0
    new-instance p1, Landroidx/media3/extractor/SeekPoint;

    iget-object p2, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->timesUs:Landroidx/media3/common/util/LongArray;

    add-int/2addr v0, v1

    .line 88
    invoke-virtual {p2, v0}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v3

    iget-object p2, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->positions:Landroidx/media3/common/util/LongArray;

    invoke-virtual {p2, v0}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v0

    invoke-direct {p1, v3, v4, v0, v1}, Landroidx/media3/extractor/SeekPoint;-><init>(JJ)V

    .line 89
    new-instance p2, Landroidx/media3/extractor/SeekMap$SeekPoints;

    invoke-direct {p2, v2, p1}, Landroidx/media3/extractor/SeekMap$SeekPoints;-><init>(Landroidx/media3/extractor/SeekPoint;Landroidx/media3/extractor/SeekPoint;)V

    return-object p2

    .line 85
    :cond_1
    :goto_0
    new-instance p1, Landroidx/media3/extractor/SeekMap$SeekPoints;

    invoke-direct {p1, v2}, Landroidx/media3/extractor/SeekMap$SeekPoints;-><init>(Landroidx/media3/extractor/SeekPoint;)V

    return-object p1
.end method

.method public getTimeUs(J)J
    .locals 2

    .line 58
    iget-object v0, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->positions:Landroidx/media3/common/util/LongArray;

    const/4 v1, 0x1

    .line 59
    invoke-static {v0, p1, p2, v1, v1}, Landroidx/media3/common/util/Util;->binarySearchFloor(Landroidx/media3/common/util/LongArray;JZZ)I

    move-result p1

    .line 61
    iget-object p2, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->timesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {p2, p1}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide p1

    return-wide p1
.end method

.method public isSeekable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isTimeUsInIndex(J)Z
    .locals 4

    .line 121
    iget-object v0, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->timesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v0}, Landroidx/media3/common/util/LongArray;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v0

    sub-long/2addr p1, v0

    const-wide/32 v0, 0x186a0

    cmp-long v3, p1, v0

    if-gez v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method public maybeAddSeekPoint(JJ)V
    .locals 1

    .line 107
    invoke-virtual {p0, p1, p2}, Landroidx/media3/extractor/mp3/IndexSeeker;->isTimeUsInIndex(J)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 110
    :cond_0
    iget-object v0, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->timesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/common/util/LongArray;->add(J)V

    .line 111
    iget-object p1, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->positions:Landroidx/media3/common/util/LongArray;

    invoke-virtual {p1, p3, p4}, Landroidx/media3/common/util/LongArray;->add(J)V

    return-void
.end method

.method setDurationUs(J)V
    .locals 0

    .line 126
    iput-wide p1, p0, Landroidx/media3/extractor/mp3/IndexSeeker;->durationUs:J

    return-void
.end method
