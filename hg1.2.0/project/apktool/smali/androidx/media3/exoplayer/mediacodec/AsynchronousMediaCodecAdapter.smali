.class final Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;
.super Ljava/lang/Object;
.source "AsynchronousMediaCodecAdapter.java"

# interfaces
.implements Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter$Factory;
    }
.end annotation


# static fields
.field private static final STATE_CREATED:I = 0x0

.field private static final STATE_INITIALIZED:I = 0x1

.field private static final STATE_SHUT_DOWN:I = 0x2


# instance fields
.field private final asynchronousMediaCodecCallback:Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

.field private final bufferEnqueuer:Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;

.field private final codec:Landroid/media/MediaCodec;

.field private codecReleased:Z

.field private state:I


# direct methods
.method private constructor <init>(Landroid/media/MediaCodec;Landroid/os/HandlerThread;Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;)V
    .locals 0

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    iput-object p1, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    .line 161
    new-instance p1, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

    invoke-direct {p1, p2}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;-><init>(Landroid/os/HandlerThread;)V

    iput-object p1, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->asynchronousMediaCodecCallback:Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

    .line 162
    iput-object p3, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->bufferEnqueuer:Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;

    const/4 p1, 0x0

    .line 163
    iput p1, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->state:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/media/MediaCodec;Landroid/os/HandlerThread;Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter$1;)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2, p3}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;-><init>(Landroid/media/MediaCodec;Landroid/os/HandlerThread;Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;)V

    return-void
.end method

.method static synthetic access$100(Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->initialize(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    return-void
.end method

.method static synthetic access$200(I)Ljava/lang/String;
    .locals 0

    .line 54
    invoke-static {p0}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->createQueueingThreadLabel(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(I)Ljava/lang/String;
    .locals 0

    .line 54
    invoke-static {p0}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->createCallbackThreadLabel(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static createCallbackThreadLabel(I)Ljava/lang/String;
    .locals 1

    .line 325
    const-string v0, "ExoPlayer:MediaCodecAsyncAdapter:"

    invoke-static {p0, v0}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->createThreadLabel(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static createQueueingThreadLabel(I)Ljava/lang/String;
    .locals 1

    .line 329
    const-string v0, "ExoPlayer:MediaCodecQueueingThread:"

    invoke-static {p0, v0}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->createThreadLabel(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static createThreadLabel(ILjava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 333
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x1

    if-ne p0, p1, :cond_0

    .line 335
    const-string p0, "Audio"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const/4 p1, 0x2

    if-ne p0, p1, :cond_1

    .line 337
    const-string p0, "Video"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 339
    :cond_1
    const-string p1, "Unknown("

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private initialize(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    .locals 2

    .line 171
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->asynchronousMediaCodecCallback:Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

    iget-object v1, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;->initialize(Landroid/media/MediaCodec;)V

    .line 172
    const-string v0, "configureCodec"

    invoke-static {v0}, Landroidx/media3/common/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 173
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 174
    invoke-static {}, Landroidx/media3/common/util/TraceUtil;->endSection()V

    .line 175
    iget-object p1, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->bufferEnqueuer:Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;->start()V

    .line 176
    const-string p1, "startCodec"

    invoke-static {p1}, Landroidx/media3/common/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 177
    iget-object p1, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    .line 178
    invoke-static {}, Landroidx/media3/common/util/TraceUtil;->endSection()V

    const/4 p1, 0x1

    .line 179
    iput p1, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->state:I

    return-void
.end method


# virtual methods
.method public dequeueInputBufferIndex()I
    .locals 1

    .line 211
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->bufferEnqueuer:Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;->maybeThrowException()V

    .line 212
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->asynchronousMediaCodecCallback:Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;->dequeueInputBufferIndex()I

    move-result v0

    return v0
.end method

.method public dequeueOutputBufferIndex(Landroid/media/MediaCodec$BufferInfo;)I
    .locals 1

    .line 217
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->bufferEnqueuer:Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;->maybeThrowException()V

    .line 218
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->asynchronousMediaCodecCallback:Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;->dequeueOutputBufferIndex(Landroid/media/MediaCodec$BufferInfo;)I

    move-result p1

    return p1
.end method

.method public flush()V
    .locals 1

    .line 246
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->bufferEnqueuer:Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;->flush()V

    .line 247
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 248
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->asynchronousMediaCodecCallback:Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;->flush()V

    .line 249
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    return-void
.end method

.method public getInputBuffer(I)Ljava/nio/ByteBuffer;
    .locals 1

    .line 229
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    return-object p1
.end method

.method public getMetrics()Landroid/os/PersistableBundle;
    .locals 1

    .line 311
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-static {v0}, Landroidx/media3/exoplayer/drm/FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/MediaCodec;)Landroid/os/PersistableBundle;

    move-result-object v0

    return-object v0
.end method

.method public getOutputBuffer(I)Ljava/nio/ByteBuffer;
    .locals 1

    .line 235
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    return-object p1
.end method

.method public getOutputFormat()Landroid/media/MediaFormat;
    .locals 1

    .line 223
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->asynchronousMediaCodecCallback:Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$setOnFrameRenderedListener$0$androidx-media3-exoplayer-mediacodec-AsynchronousMediaCodecAdapter(Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$OnFrameRenderedListener;Landroid/media/MediaCodec;JJ)V
    .locals 6

    .line 0
    move-object v0, p1

    move-object v1, p0

    move-wide v2, p3

    move-wide v4, p5

    .line 282
    invoke-interface/range {v0 .. v5}, Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$OnFrameRenderedListener;->onFrameRendered(Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter;JJ)V

    return-void
.end method

.method public needsReconfiguration()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method onError(Landroid/media/MediaCodec$CodecException;)V
    .locals 2

    .line 316
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->asynchronousMediaCodecCallback:Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

    iget-object v1, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0, v1, p1}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;->onError(Landroid/media/MediaCodec;Landroid/media/MediaCodec$CodecException;)V

    return-void
.end method

.method onOutputFormatChanged(Landroid/media/MediaFormat;)V
    .locals 2

    .line 321
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->asynchronousMediaCodecCallback:Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

    iget-object v1, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0, v1, p1}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;->onOutputFormatChanged(Landroid/media/MediaCodec;Landroid/media/MediaFormat;)V

    return-void
.end method

.method public queueInputBuffer(IIIJI)V
    .locals 7

    .line 190
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->bufferEnqueuer:Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;

    move v1, p1

    move v2, p2

    move v3, p3

    move-wide v4, p4

    move v6, p6

    invoke-interface/range {v0 .. v6}, Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;->queueInputBuffer(IIIJI)V

    return-void
.end method

.method public queueSecureInputBuffer(IILandroidx/media3/decoder/CryptoInfo;JI)V
    .locals 7

    .line 196
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->bufferEnqueuer:Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-wide v4, p4

    move v6, p6

    invoke-interface/range {v0 .. v6}, Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;->queueSecureInputBuffer(IILandroidx/media3/decoder/CryptoInfo;JI)V

    return-void
.end method

.method public registerOnBufferAvailableListener(Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$OnBufferAvailableListener;)Z
    .locals 1

    .line 289
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->asynchronousMediaCodecCallback:Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;->setOnBufferAvailableListener(Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$OnBufferAvailableListener;)V

    const/4 p1, 0x1

    return p1
.end method

.method public release()V
    .locals 5

    const/16 v0, 0x21

    const/16 v1, 0x1e

    const/4 v2, 0x1

    .line 255
    :try_start_0
    iget v3, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->state:I

    if-ne v3, v2, :cond_0

    .line 256
    iget-object v3, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->bufferEnqueuer:Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;

    invoke-interface {v3}, Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;->shutdown()V

    .line 257
    iget-object v3, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->asynchronousMediaCodecCallback:Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;

    invoke-virtual {v3}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecCallback;->shutdown()V

    :cond_0
    const/4 v3, 0x2

    .line 259
    iput v3, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->state:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 261
    iget-boolean v3, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codecReleased:Z

    if-nez v3, :cond_2

    .line 267
    :try_start_1
    sget v3, Landroidx/media3/common/util/Util;->SDK_INT:I

    if-lt v3, v1, :cond_1

    sget v1, Landroidx/media3/common/util/Util;->SDK_INT:I

    if-ge v1, v0, :cond_1

    .line 268
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 271
    :cond_1
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 272
    iput-boolean v2, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codecReleased:Z

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 271
    iget-object v1, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V

    .line 272
    iput-boolean v2, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codecReleased:Z

    .line 273
    throw v0

    :cond_2
    :goto_0
    return-void

    :catchall_1
    move-exception v3

    .line 261
    iget-boolean v4, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codecReleased:Z

    if-nez v4, :cond_4

    .line 267
    :try_start_2
    sget v4, Landroidx/media3/common/util/Util;->SDK_INT:I

    if-lt v4, v1, :cond_3

    sget v1, Landroidx/media3/common/util/Util;->SDK_INT:I

    if-ge v1, v0, :cond_3

    .line 268
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 271
    :cond_3
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 272
    iput-boolean v2, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codecReleased:Z

    goto :goto_1

    :catchall_2
    move-exception v0

    .line 271
    iget-object v1, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V

    .line 272
    iput-boolean v2, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codecReleased:Z

    .line 273
    throw v0

    .line 275
    :cond_4
    :goto_1
    throw v3
.end method

.method public releaseOutputBuffer(IJ)V
    .locals 1

    .line 206
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1, p2, p3}, Landroid/media/MediaCodec;->releaseOutputBuffer(IJ)V

    return-void
.end method

.method public releaseOutputBuffer(IZ)V
    .locals 1

    .line 201
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    return-void
.end method

.method public setOnFrameRenderedListener(Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$OnFrameRenderedListener;Landroid/os/Handler;)V
    .locals 2

    .line 280
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    new-instance v1, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter$$ExternalSyntheticLambda3;-><init>(Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$OnFrameRenderedListener;)V

    invoke-static {v0, v1, p2}, Landroidx/media3/exoplayer/drm/FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/MediaCodec;Landroid/media/MediaCodec$OnFrameRenderedListener;Landroid/os/Handler;)V

    return-void
.end method

.method public setOutputSurface(Landroid/view/Surface;)V
    .locals 1

    .line 295
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-static {v0, p1}, Landroidx/media3/exoplayer/drm/FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/MediaCodec;Landroid/view/Surface;)V

    return-void
.end method

.method public setParameters(Landroid/os/Bundle;)V
    .locals 1

    .line 300
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->bufferEnqueuer:Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/mediacodec/MediaCodecBufferEnqueuer;->setParameters(Landroid/os/Bundle;)V

    return-void
.end method

.method public setVideoScalingMode(I)V
    .locals 1

    .line 305
    iget-object v0, p0, Landroidx/media3/exoplayer/mediacodec/AsynchronousMediaCodecAdapter;->codec:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->setVideoScalingMode(I)V

    return-void
.end method
