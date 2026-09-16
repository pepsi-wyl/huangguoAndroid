.class public final Landroidx/media3/common/audio/SpeedChangingAudioProcessor;
.super Landroidx/media3/common/audio/BaseAudioProcessor;
.source "SpeedChangingAudioProcessor.java"


# instance fields
.field private bytesRead:J

.field private currentSpeed:F

.field private endOfStreamQueuedToSonic:Z

.field private inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

.field private lastProcessedInputTimeUs:J

.field private lastSpeedAdjustedInputTimeUs:J

.field private lastSpeedAdjustedOutputTimeUs:J

.field private final lock:Ljava/lang/Object;

.field private outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

.field private final pendingCallbackInputTimesUs:Landroidx/media3/common/util/LongArrayQueue;

.field private final pendingCallbacks:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroidx/media3/common/util/TimestampConsumer;",
            ">;"
        }
    .end annotation
.end field

.field private final sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

.field private speedAdjustedTimeAsyncInputTimeUs:J

.field private final speedProvider:Landroidx/media3/common/audio/SpeedProvider;


# direct methods
.method public constructor <init>(Landroidx/media3/common/audio/SpeedProvider;)V
    .locals 2

    .line 95
    invoke-direct {p0}, Landroidx/media3/common/audio/BaseAudioProcessor;-><init>()V

    .line 96
    iput-object p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->speedProvider:Landroidx/media3/common/audio/SpeedProvider;

    .line 97
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lock:Ljava/lang/Object;

    .line 98
    new-instance v0, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-direct {v0, p1}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    .line 99
    new-instance p1, Landroidx/media3/common/util/LongArrayQueue;

    invoke-direct {p1}, Landroidx/media3/common/util/LongArrayQueue;-><init>()V

    iput-object p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->pendingCallbackInputTimesUs:Landroidx/media3/common/util/LongArrayQueue;

    .line 100
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->pendingCallbacks:Ljava/util/Queue;

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 101
    iput-wide v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->speedAdjustedTimeAsyncInputTimeUs:J

    .line 102
    invoke-direct {p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->resetState()V

    return-void
.end method

.method private calculateSpeedAdjustedTime(J)J
    .locals 9

    .line 277
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v0}, Landroidx/media3/common/util/LongArray;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-lez v0, :cond_0

    .line 278
    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v1, v0}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v1

    cmp-long v3, v1, p1

    if-lez v3, :cond_0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 282
    :cond_0
    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v1}, Landroidx/media3/common/util/LongArray;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_2

    .line 283
    iget-wide v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastSpeedAdjustedInputTimeUs:J

    iget-object v3, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v3, v0}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-gez v5, :cond_1

    .line 284
    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v1, v0}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v1

    iput-wide v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastSpeedAdjustedInputTimeUs:J

    .line 285
    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v1, v0}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastSpeedAdjustedOutputTimeUs:J

    .line 287
    :cond_1
    iget-wide v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastSpeedAdjustedInputTimeUs:J

    sub-long v0, p1, v0

    .line 288
    invoke-direct {p0, v0, v1}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->getPlayoutDurationUsAtCurrentSpeed(J)J

    move-result-wide v0

    goto :goto_1

    .line 290
    :cond_2
    iget-wide v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastSpeedAdjustedInputTimeUs:J

    sub-long v1, p1, v1

    long-to-double v1, v1

    .line 291
    iget-object v3, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    add-int/lit8 v4, v0, 0x1

    .line 295
    invoke-virtual {v3, v4}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v5

    iget-object v3, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 296
    invoke-virtual {v3, v0}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v7

    sub-long/2addr v5, v7

    iget-object v3, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 297
    invoke-virtual {v3, v4}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v3

    iget-object v7, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 298
    invoke-virtual {v7, v0}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v7

    sub-long/2addr v3, v7

    .line 294
    invoke-static {v5, v6, v3, v4}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->divide(JJ)D

    move-result-wide v3

    mul-double v1, v1, v3

    .line 292
    invoke-static {v1, v2}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    .line 300
    :goto_1
    iput-wide p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastSpeedAdjustedInputTimeUs:J

    .line 301
    iget-wide p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastSpeedAdjustedOutputTimeUs:J

    add-long/2addr p1, v0

    iput-wide p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastSpeedAdjustedOutputTimeUs:J

    return-wide p1
.end method

.method private static divide(JJ)D
    .locals 0

    long-to-double p0, p0

    long-to-double p2, p2

    div-double/2addr p0, p2

    return-wide p0
.end method

.method private getMediaDurationUsAtCurrentSpeed(J)J
    .locals 1

    .line 358
    invoke-direct {p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->isUsingSonic()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 359
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->getMediaDuration(J)J

    move-result-wide p1

    :cond_0
    return-wide p1
.end method

.method private getPlayoutDurationUsAtCurrentSpeed(J)J
    .locals 1

    .line 352
    invoke-direct {p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->isUsingSonic()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 353
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->getPlayoutDuration(J)J

    move-result-wide p1

    :cond_0
    return-wide p1
.end method

.method private isUsingSonic()Z
    .locals 3

    .line 387
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 388
    :try_start_0
    iget v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->currentSpeed:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 389
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private processPendingCallbacks()V
    .locals 6

    .line 310
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 311
    :goto_0
    :try_start_0
    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->pendingCallbacks:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->pendingCallbackInputTimesUs:Landroidx/media3/common/util/LongArrayQueue;

    .line 312
    invoke-virtual {v1}, Landroidx/media3/common/util/LongArrayQueue;->element()J

    move-result-wide v1

    iget-wide v3, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastProcessedInputTimeUs:J

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    invoke-virtual {p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->isEnded()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 313
    :cond_0
    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->pendingCallbacks:Ljava/util/Queue;

    .line 314
    invoke-interface {v1}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/common/util/TimestampConsumer;

    iget-object v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->pendingCallbackInputTimesUs:Landroidx/media3/common/util/LongArrayQueue;

    .line 315
    invoke-virtual {v2}, Landroidx/media3/common/util/LongArrayQueue;->remove()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->calculateSpeedAdjustedTime(J)J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Landroidx/media3/common/util/TimestampConsumer;->onTimestamp(J)V

    goto :goto_0

    .line 317
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private resetState()V
    .locals 4
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "inputSegmentStartTimesUs",
            "outputSegmentStartTimesUs"
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "lock"
        }
    .end annotation

    .line 395
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 396
    :try_start_0
    new-instance v1, Landroidx/media3/common/util/LongArray;

    invoke-direct {v1}, Landroidx/media3/common/util/LongArray;-><init>()V

    iput-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 397
    new-instance v1, Landroidx/media3/common/util/LongArray;

    invoke-direct {v1}, Landroidx/media3/common/util/LongArray;-><init>()V

    iput-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 398
    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Landroidx/media3/common/util/LongArray;->add(J)V

    .line 399
    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v1, v2, v3}, Landroidx/media3/common/util/LongArray;->add(J)V

    .line 400
    iput-wide v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastProcessedInputTimeUs:J

    .line 401
    iput-wide v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastSpeedAdjustedInputTimeUs:J

    .line 402
    iput-wide v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastSpeedAdjustedOutputTimeUs:J

    const/high16 v1, 0x3f800000    # 1.0f

    .line 403
    iput v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->currentSpeed:F

    .line 404
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 406
    iput-wide v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->bytesRead:J

    const/4 v0, 0x0

    .line 407
    iput-boolean v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->endOfStreamQueuedToSonic:Z

    return-void

    :catchall_0
    move-exception v1

    .line 404
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private updateLastProcessedInputTime()V
    .locals 8

    .line 364
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 365
    :try_start_0
    invoke-direct {p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->isUsingSonic()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 368
    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    .line 370
    invoke-virtual {v1}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->getProcessedInputBytes()J

    move-result-wide v2

    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputAudioFormat:Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    iget v1, v1, Landroidx/media3/common/audio/AudioProcessor$AudioFormat;->sampleRate:I

    int-to-long v4, v1

    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputAudioFormat:Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    iget v1, v1, Landroidx/media3/common/audio/AudioProcessor$AudioFormat;->bytesPerFrame:I

    int-to-long v6, v1

    mul-long v6, v6, v4

    const-wide/32 v4, 0xf4240

    .line 369
    invoke-static/range {v2 .. v7}, Landroidx/media3/common/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v1

    .line 373
    iget-object v3, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 374
    invoke-virtual {v3}, Landroidx/media3/common/util/LongArray;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v3

    add-long/2addr v3, v1

    iput-wide v3, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastProcessedInputTimeUs:J

    goto :goto_0

    .line 377
    :cond_0
    iget-wide v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->bytesRead:J

    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputAudioFormat:Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    iget v1, v1, Landroidx/media3/common/audio/AudioProcessor$AudioFormat;->sampleRate:I

    int-to-long v4, v1

    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputAudioFormat:Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    iget v1, v1, Landroidx/media3/common/audio/AudioProcessor$AudioFormat;->bytesPerFrame:I

    int-to-long v6, v1

    mul-long v6, v6, v4

    const-wide/32 v4, 0xf4240

    .line 378
    invoke-static/range {v2 .. v7}, Landroidx/media3/common/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v1

    iput-wide v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastProcessedInputTimeUs:J

    .line 383
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private updateSpeed(FJ)V
    .locals 2

    .line 321
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 322
    :try_start_0
    iget v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->currentSpeed:F

    cmpl-float v1, p1, v1

    if-eqz v1, :cond_1

    .line 323
    invoke-direct {p0, p2, p3}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->updateSpeedChangeArrays(J)V

    .line 324
    iput p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->currentSpeed:F

    .line 325
    invoke-direct {p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->isUsingSonic()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 326
    iget-object p2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {p2, p1}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->setSpeed(F)V

    .line 327
    iget-object p2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {p2, p1}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->setPitch(F)V

    .line 330
    :cond_0
    iget-object p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {p1}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->flush()V

    const/4 p1, 0x0

    .line 331
    iput-boolean p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->endOfStreamQueuedToSonic:Z

    .line 332
    invoke-super {p0}, Landroidx/media3/common/audio/BaseAudioProcessor;->getOutput()Ljava/nio/ByteBuffer;

    .line 334
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private updateSpeedChangeArrays(J)V
    .locals 5

    .line 339
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 340
    invoke-virtual {v0}, Landroidx/media3/common/util/LongArray;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v0

    .line 341
    iget-object v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 342
    invoke-virtual {v2}, Landroidx/media3/common/util/LongArray;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v2

    sub-long v2, p1, v2

    .line 345
    iget-object v4, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v4, p1, p2}, Landroidx/media3/common/util/LongArray;->add(J)V

    .line 346
    iget-object p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 348
    invoke-direct {p0, v2, v3}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->getPlayoutDurationUsAtCurrentSpeed(J)J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 346
    invoke-virtual {p1, v0, v1}, Landroidx/media3/common/util/LongArray;->add(J)V

    return-void
.end method


# virtual methods
.method public getDurationAfterProcessorApplied(J)J
    .locals 1

    .line 107
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->speedProvider:Landroidx/media3/common/audio/SpeedProvider;

    invoke-static {v0, p1, p2}, Landroidx/media3/common/util/SpeedProviderUtil;->getDurationAfterSpeedProviderApplied(Landroidx/media3/common/audio/SpeedProvider;J)J

    move-result-wide p1

    return-wide p1
.end method

.method public getMediaDurationUs(J)J
    .locals 8

    .line 246
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 247
    :try_start_0
    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v1}, Landroidx/media3/common/util/LongArray;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-lez v1, :cond_0

    .line 248
    iget-object v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v2, v1}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v2

    cmp-long v4, v2, p1

    if-lez v4, :cond_0

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 251
    :cond_0
    iget-object v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 252
    invoke-virtual {v2, v1}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v2

    sub-long/2addr p1, v2

    .line 254
    iget-object v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v2}, Landroidx/media3/common/util/LongArray;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_1

    .line 255
    invoke-direct {p0, p1, p2}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->getMediaDurationUsAtCurrentSpeed(J)J

    move-result-wide p1

    goto :goto_1

    :cond_1
    long-to-double p1, p1

    .line 258
    iget-object v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    add-int/lit8 v3, v1, 0x1

    .line 262
    invoke-virtual {v2, v3}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v4

    iget-object v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 263
    invoke-virtual {v2, v1}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v6

    sub-long/2addr v4, v6

    iget-object v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 264
    invoke-virtual {v2, v3}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v2

    iget-object v6, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->outputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    .line 265
    invoke-virtual {v6, v1}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v6

    sub-long/2addr v2, v6

    .line 261
    invoke-static {v4, v5, v2, v3}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->divide(JJ)D

    move-result-wide v2

    mul-double p1, p1, v2

    .line 259
    invoke-static {p1, p2}, Ljava/lang/Math;->round(D)J

    move-result-wide p1

    .line 267
    :goto_1
    iget-object v2, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputSegmentStartTimesUs:Landroidx/media3/common/util/LongArray;

    invoke-virtual {v2, v1}, Landroidx/media3/common/util/LongArray;->get(I)J

    move-result-wide v1

    add-long/2addr v1, p1

    monitor-exit v0

    return-wide v1

    :catchall_0
    move-exception p1

    .line 268
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getOutput()Ljava/nio/ByteBuffer;
    .locals 1

    .line 180
    invoke-direct {p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->isUsingSonic()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {v0}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->getOutput()Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-super {p0}, Landroidx/media3/common/audio/BaseAudioProcessor;->getOutput()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 181
    :goto_0
    invoke-direct {p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->processPendingCallbacks()V

    return-object v0
.end method

.method public getSpeedAdjustedTimeAsync(JLandroidx/media3/common/util/TimestampConsumer;)V
    .locals 4

    .line 221
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 222
    :try_start_0
    iget-wide v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->speedAdjustedTimeAsyncInputTimeUs:J

    cmp-long v3, v1, p1

    if-gez v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 223
    iput-wide p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->speedAdjustedTimeAsyncInputTimeUs:J

    .line 224
    iget-wide v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->lastProcessedInputTimeUs:J

    cmp-long v3, p1, v1

    if-gtz v3, :cond_1

    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->pendingCallbackInputTimesUs:Landroidx/media3/common/util/LongArrayQueue;

    invoke-virtual {v1}, Landroidx/media3/common/util/LongArrayQueue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 225
    :cond_1
    invoke-virtual {p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->isEnded()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 226
    :cond_2
    invoke-direct {p0, p1, p2}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->calculateSpeedAdjustedTime(J)J

    move-result-wide p1

    invoke-interface {p3, p1, p2}, Landroidx/media3/common/util/TimestampConsumer;->onTimestamp(J)V

    .line 227
    monitor-exit v0

    return-void

    .line 229
    :cond_3
    iget-object v1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->pendingCallbackInputTimesUs:Landroidx/media3/common/util/LongArrayQueue;

    invoke-virtual {v1, p1, p2}, Landroidx/media3/common/util/LongArrayQueue;->add(J)V

    .line 230
    iget-object p1, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->pendingCallbacks:Ljava/util/Queue;

    invoke-interface {p1, p3}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 231
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public isEnded()Z
    .locals 1

    .line 187
    invoke-super {p0}, Landroidx/media3/common/audio/BaseAudioProcessor;->isEnded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {v0}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->isEnded()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onConfigure(Landroidx/media3/common/audio/AudioProcessor$AudioFormat;)Landroidx/media3/common/audio/AudioProcessor$AudioFormat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/audio/AudioProcessor$UnhandledAudioFormatException;
        }
    .end annotation

    .line 113
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {v0, p1}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->configure(Landroidx/media3/common/audio/AudioProcessor$AudioFormat;)Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    move-result-object p1

    return-object p1
.end method

.method protected onFlush()V
    .locals 1

    .line 192
    invoke-direct {p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->resetState()V

    .line 193
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {v0}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->flush()V

    return-void
.end method

.method protected onQueueEndOfStream()V
    .locals 1

    .line 172
    iget-boolean v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->endOfStreamQueuedToSonic:Z

    if-nez v0, :cond_0

    .line 173
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {v0}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->queueEndOfStream()V

    const/4 v0, 0x1

    .line 174
    iput-boolean v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->endOfStreamQueuedToSonic:Z

    :cond_0
    return-void
.end method

.method protected onReset()V
    .locals 1

    .line 198
    invoke-direct {p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->resetState()V

    .line 199
    iget-object v0, p0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {v0}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->reset()V

    return-void
.end method

.method public queueInput(Ljava/nio/ByteBuffer;)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 118
    iget-wide v2, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->bytesRead:J

    iget-object v4, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputAudioFormat:Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    iget v4, v4, Landroidx/media3/common/audio/AudioProcessor$AudioFormat;->sampleRate:I

    int-to-long v4, v4

    iget-object v6, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputAudioFormat:Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    iget v6, v6, Landroidx/media3/common/audio/AudioProcessor$AudioFormat;->bytesPerFrame:I

    int-to-long v6, v6

    mul-long v6, v6, v4

    const-wide/32 v4, 0xf4240

    .line 119
    invoke-static/range {v2 .. v7}, Landroidx/media3/common/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v2

    .line 123
    iget-object v4, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->speedProvider:Landroidx/media3/common/audio/SpeedProvider;

    invoke-interface {v4, v2, v3}, Landroidx/media3/common/audio/SpeedProvider;->getSpeed(J)F

    move-result v4

    .line 125
    invoke-direct {v0, v4, v2, v3}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->updateSpeed(FJ)V

    .line 127
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    .line 128
    iget-object v5, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->speedProvider:Landroidx/media3/common/audio/SpeedProvider;

    invoke-interface {v5, v2, v3}, Landroidx/media3/common/audio/SpeedProvider;->getNextSpeedChangeTimeUs(J)J

    move-result-wide v5

    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    const/4 v9, -0x1

    cmp-long v10, v5, v7

    if-eqz v10, :cond_1

    sub-long v11, v5, v2

    .line 131
    iget-object v2, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputAudioFormat:Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    iget v2, v2, Landroidx/media3/common/audio/AudioProcessor$AudioFormat;->sampleRate:I

    int-to-long v2, v2

    iget-object v5, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputAudioFormat:Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    iget v5, v5, Landroidx/media3/common/audio/AudioProcessor$AudioFormat;->bytesPerFrame:I

    int-to-long v5, v5

    mul-long v13, v2, v5

    const-wide/32 v15, 0xf4240

    sget-object v17, Ljava/math/RoundingMode;->CEILING:Ljava/math/RoundingMode;

    .line 133
    invoke-static/range {v11 .. v17}, Landroidx/media3/common/util/Util;->scaleLargeValue(JJJLjava/math/RoundingMode;)J

    move-result-wide v2

    long-to-int v3, v2

    .line 139
    iget-object v2, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputAudioFormat:Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    iget v2, v2, Landroidx/media3/common/audio/AudioProcessor$AudioFormat;->bytesPerFrame:I

    iget-object v5, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputAudioFormat:Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    iget v5, v5, Landroidx/media3/common/audio/AudioProcessor$AudioFormat;->bytesPerFrame:I

    rem-int v5, v3, v5

    sub-int/2addr v2, v5

    .line 141
    iget-object v5, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->inputAudioFormat:Landroidx/media3/common/audio/AudioProcessor$AudioFormat;

    iget v5, v5, Landroidx/media3/common/audio/AudioProcessor$AudioFormat;->bytesPerFrame:I

    if-eq v2, v5, :cond_0

    add-int/2addr v3, v2

    .line 145
    :cond_0
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v2, v3

    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    goto :goto_0

    :cond_1
    const/4 v3, -0x1

    .line 150
    :goto_0
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    int-to-long v5, v2

    .line 151
    invoke-direct/range {p0 .. p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->isUsingSonic()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 152
    iget-object v2, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {v2, v1}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->queueInput(Ljava/nio/ByteBuffer;)V

    if-eq v3, v9, :cond_4

    .line 154
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    int-to-long v7, v2

    sub-long/2addr v7, v5

    int-to-long v2, v3

    cmp-long v9, v7, v2

    if-nez v9, :cond_4

    .line 155
    iget-object v2, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->sonicAudioProcessor:Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;

    invoke-virtual {v2}, Landroidx/media3/common/audio/SynchronizedSonicAudioProcessor;->queueEndOfStream()V

    const/4 v2, 0x1

    .line 156
    iput-boolean v2, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->endOfStreamQueuedToSonic:Z

    goto :goto_1

    .line 159
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-virtual {v0, v2}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->replaceOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 160
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 161
    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 163
    :cond_3
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 165
    :cond_4
    :goto_1
    iget-wide v2, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->bytesRead:J

    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v7

    int-to-long v7, v7

    sub-long/2addr v7, v5

    add-long/2addr v2, v7

    iput-wide v2, v0, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->bytesRead:J

    .line 166
    invoke-direct/range {p0 .. p0}, Landroidx/media3/common/audio/SpeedChangingAudioProcessor;->updateLastProcessedInputTime()V

    .line 167
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    return-void
.end method
