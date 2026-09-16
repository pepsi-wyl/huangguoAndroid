.class final Landroidx/media3/exoplayer/audio/AudioTimestampPoller;
.super Ljava/lang/Object;
.source "AudioTimestampPoller.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;
    }
.end annotation


# static fields
.field private static final ERROR_POLL_INTERVAL_US:I = 0x7a120

.field private static final FAST_POLL_INTERVAL_US:I = 0x2710

.field private static final INITIALIZING_DURATION_US:I = 0x7a120

.field private static final SLOW_POLL_INTERVAL_US:I = 0x989680

.field private static final STATE_ERROR:I = 0x4

.field private static final STATE_INITIALIZING:I = 0x0

.field private static final STATE_NO_TIMESTAMP:I = 0x3

.field private static final STATE_TIMESTAMP:I = 0x1

.field private static final STATE_TIMESTAMP_ADVANCING:I = 0x2


# instance fields
.field private final audioTimestamp:Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;

.field private initialTimestampPositionFrames:J

.field private initializeSystemTimeUs:J

.field private lastTimestampSampleTimeUs:J

.field private sampleIntervalUs:J

.field private state:I


# direct methods
.method public constructor <init>(Landroid/media/AudioTrack;)V
    .locals 1

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    new-instance v0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;

    invoke-direct {v0, p1}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;-><init>(Landroid/media/AudioTrack;)V

    iput-object v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->audioTimestamp:Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;

    .line 109
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->reset()V

    return-void
.end method

.method private updateState(I)V
    .locals 6

    .line 250
    iput p1, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->state:I

    const-wide/16 v0, 0x2710

    if-eqz p1, :cond_3

    const/4 v2, 0x1

    if-eq p1, v2, :cond_2

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    const-wide/32 v0, 0x7a120

    .line 267
    iput-wide v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->sampleIntervalUs:J

    goto :goto_0

    .line 270
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1

    :cond_1
    const-wide/32 v0, 0x989680

    .line 264
    iput-wide v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->sampleIntervalUs:J

    goto :goto_0

    .line 260
    :cond_2
    iput-wide v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->sampleIntervalUs:J

    goto :goto_0

    :cond_3
    const-wide/16 v2, 0x0

    .line 254
    iput-wide v2, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->lastTimestampSampleTimeUs:J

    const-wide/16 v2, -0x1

    .line 255
    iput-wide v2, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->initialTimestampPositionFrames:J

    .line 256
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    iput-wide v2, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->initializeSystemTimeUs:J

    .line 257
    iput-wide v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->sampleIntervalUs:J

    :goto_0
    return-void
.end method


# virtual methods
.method public acceptTimestamp()V
    .locals 2

    .line 192
    iget v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->state:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 193
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->reset()V

    :cond_0
    return-void
.end method

.method public expectTimestampFramePositionReset()V
    .locals 1

    .line 244
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->audioTimestamp:Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;

    if-eqz v0, :cond_0

    .line 245
    invoke-virtual {v0}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;->expectTimestampFramePositionReset()V

    :cond_0
    return-void
.end method

.method public getTimestampPositionFrames()J
    .locals 2

    .line 236
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->audioTimestamp:Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;->getTimestampPositionFrames()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method public getTimestampSystemTimeUs()J
    .locals 2

    .line 228
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->audioTimestamp:Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;->getTimestampSystemTimeUs()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    :goto_0
    return-wide v0
.end method

.method public hasAdvancingTimestamp()Z
    .locals 2

    .line 213
    iget v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->state:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasTimestamp()Z
    .locals 3

    .line 203
    iget v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->state:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method public maybePollTimestamp(J)Z
    .locals 7

    .line 123
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->audioTimestamp:Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    iget-wide v2, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->lastTimestampSampleTimeUs:J

    sub-long v2, p1, v2

    iget-wide v4, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->sampleIntervalUs:J

    cmp-long v6, v2, v4

    if-gez v6, :cond_0

    goto/16 :goto_1

    .line 126
    :cond_0
    iput-wide p1, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->lastTimestampSampleTimeUs:J

    .line 127
    invoke-virtual {v0}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;->maybeUpdateTimestamp()Z

    move-result v0

    .line 128
    iget v2, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->state:I

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-eqz v2, :cond_6

    const/4 p1, 0x2

    if-eq v2, v4, :cond_4

    if-eq v2, p1, :cond_3

    if-eq v2, v3, :cond_2

    const/4 p1, 0x4

    if-ne v2, p1, :cond_1

    goto :goto_0

    .line 173
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1

    :cond_2
    if-eqz v0, :cond_8

    .line 166
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->reset()V

    goto :goto_0

    :cond_3
    if-nez v0, :cond_8

    .line 160
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->reset()V

    goto :goto_0

    :cond_4
    if-eqz v0, :cond_5

    .line 149
    iget-object p2, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->audioTimestamp:Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;

    invoke-virtual {p2}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;->getTimestampPositionFrames()J

    move-result-wide v1

    .line 150
    iget-wide v3, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->initialTimestampPositionFrames:J

    cmp-long p2, v1, v3

    if-lez p2, :cond_8

    .line 151
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->updateState(I)V

    goto :goto_0

    .line 154
    :cond_5
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->reset()V

    goto :goto_0

    :cond_6
    if-eqz v0, :cond_7

    .line 131
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->audioTimestamp:Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;

    invoke-virtual {p1}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;->getTimestampSystemTimeUs()J

    move-result-wide p1

    iget-wide v2, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->initializeSystemTimeUs:J

    cmp-long v5, p1, v2

    if-ltz v5, :cond_9

    .line 133
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->audioTimestamp:Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;

    invoke-virtual {p1}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;->getTimestampPositionFrames()J

    move-result-wide p1

    iput-wide p1, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->initialTimestampPositionFrames:J

    .line 134
    invoke-direct {p0, v4}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->updateState(I)V

    goto :goto_0

    .line 139
    :cond_7
    iget-wide v1, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->initializeSystemTimeUs:J

    sub-long/2addr p1, v1

    const-wide/32 v1, 0x7a120

    cmp-long v4, p1, v1

    if-lez v4, :cond_8

    .line 144
    invoke-direct {p0, v3}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->updateState(I)V

    :cond_8
    :goto_0
    move v1, v0

    :cond_9
    :goto_1
    return v1
.end method

.method public rejectTimestamp()V
    .locals 1

    const/4 v0, 0x4

    .line 184
    invoke-direct {p0, v0}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->updateState(I)V

    return-void
.end method

.method public reset()V
    .locals 1

    .line 218
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->audioTimestamp:Landroidx/media3/exoplayer/audio/AudioTimestampPoller$AudioTimestampWrapper;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 219
    invoke-direct {p0, v0}, Landroidx/media3/exoplayer/audio/AudioTimestampPoller;->updateState(I)V

    :cond_0
    return-void
.end method
