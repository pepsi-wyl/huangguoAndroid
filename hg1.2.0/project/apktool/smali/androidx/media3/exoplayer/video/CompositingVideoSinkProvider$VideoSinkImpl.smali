.class final Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;
.super Ljava/lang/Object;
.source "CompositingVideoSinkProvider.java"

# interfaces
.implements Landroidx/media3/exoplayer/video/VideoSink;
.implements Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "VideoSinkImpl"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private finalBufferPresentationTimeUs:J

.field private hasRegisteredFirstInputStream:Z

.field private inputBufferTimestampAdjustmentUs:J

.field private inputFormat:Landroidx/media3/common/Format;

.field private inputStreamOffsetUs:J

.field private inputType:I

.field private lastBufferPresentationTimeUs:J

.field private listener:Landroidx/media3/exoplayer/video/VideoSink$Listener;

.field private listenerExecutor:Ljava/util/concurrent/Executor;

.field private pendingInputStreamBufferPresentationTimeUs:J

.field private pendingInputStreamOffsetChange:Z

.field private rotationEffect:Landroidx/media3/common/Effect;

.field final synthetic this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

.field private final videoEffects:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/media3/common/Effect;",
            ">;"
        }
    .end annotation
.end field

.field private videoFrameProcessor:Landroidx/media3/common/VideoFrameProcessor;

.field private final videoFrameProcessorMaxPendingFrameCount:I


# direct methods
.method public constructor <init>(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;Landroid/content/Context;)V
    .locals 0

    .line 513
    iput-object p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 514
    iput-object p2, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->context:Landroid/content/Context;

    .line 520
    invoke-static {p2}, Landroidx/media3/common/util/Util;->getMaxPendingFramesCountForMediaCodecDecoders(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoFrameProcessorMaxPendingFrameCount:I

    .line 522
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoEffects:Ljava/util/ArrayList;

    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 523
    iput-wide p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->finalBufferPresentationTimeUs:J

    .line 524
    iput-wide p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->lastBufferPresentationTimeUs:J

    .line 525
    sget-object p1, Landroidx/media3/exoplayer/video/VideoSink$Listener;->NO_OP:Landroidx/media3/exoplayer/video/VideoSink$Listener;

    iput-object p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listener:Landroidx/media3/exoplayer/video/VideoSink$Listener;

    .line 526
    invoke-static {}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$700()Ljava/util/concurrent/Executor;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listenerExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method private maybeRegisterInputStream()V
    .locals 8

    .line 823
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputFormat:Landroidx/media3/common/Format;

    if-nez v0, :cond_0

    return-void

    .line 827
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 828
    iget-object v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->rotationEffect:Landroidx/media3/common/Effect;

    if-eqz v1, :cond_1

    .line 829
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 831
    :cond_1
    iget-object v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoEffects:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 832
    iget-object v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputFormat:Landroidx/media3/common/Format;

    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/common/Format;

    .line 833
    iget-object v2, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoFrameProcessor:Landroidx/media3/common/VideoFrameProcessor;

    invoke-static {v2}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/common/VideoFrameProcessor;

    iget v3, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputType:I

    new-instance v4, Landroidx/media3/common/FrameInfo$Builder;

    iget-object v5, v1, Landroidx/media3/common/Format;->colorInfo:Landroidx/media3/common/ColorInfo;

    .line 838
    invoke-static {v5}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$1600(Landroidx/media3/common/ColorInfo;)Landroidx/media3/common/ColorInfo;

    move-result-object v5

    iget v6, v1, Landroidx/media3/common/Format;->width:I

    iget v7, v1, Landroidx/media3/common/Format;->height:I

    invoke-direct {v4, v5, v6, v7}, Landroidx/media3/common/FrameInfo$Builder;-><init>(Landroidx/media3/common/ColorInfo;II)V

    iget v1, v1, Landroidx/media3/common/Format;->pixelWidthHeightRatio:F

    .line 841
    invoke-virtual {v4, v1}, Landroidx/media3/common/FrameInfo$Builder;->setPixelWidthHeightRatio(F)Landroidx/media3/common/FrameInfo$Builder;

    move-result-object v1

    .line 842
    invoke-virtual {v1}, Landroidx/media3/common/FrameInfo$Builder;->build()Landroidx/media3/common/FrameInfo;

    move-result-object v1

    .line 834
    invoke-interface {v2, v3, v0, v1}, Landroidx/media3/common/VideoFrameProcessor;->registerInputStream(ILjava/util/List;Landroidx/media3/common/FrameInfo;)V

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 843
    iput-wide v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->finalBufferPresentationTimeUs:J

    return-void
.end method

.method private maybeRegisterPendingInputStream()Z
    .locals 6

    .line 808
    iget-wide v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->pendingInputStreamBufferPresentationTimeUs:J

    const/4 v2, 0x1

    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v5, v0, v3

    if-nez v5, :cond_0

    return v2

    .line 813
    :cond_0
    iget-object v5, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v5, v0, v1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$1200(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 815
    invoke-direct {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->maybeRegisterInputStream()V

    .line 816
    iput-wide v3, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->pendingInputStreamBufferPresentationTimeUs:J

    return v2

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private maybeSetStreamOffsetChange(J)V
    .locals 8

    .line 793
    iget-boolean v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->pendingInputStreamOffsetChange:Z

    if-eqz v0, :cond_0

    .line 794
    iget-object v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    iget-wide v2, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputBufferTimestampAdjustmentUs:J

    iget-wide v6, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputStreamOffsetUs:J

    move-wide v4, p1

    invoke-static/range {v1 .. v7}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$1500(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;JJJ)V

    const/4 p1, 0x0

    .line 798
    iput-boolean p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->pendingInputStreamOffsetChange:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public clearOutputSurfaceInfo()V
    .locals 1

    .line 697
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->clearOutputSurfaceInfo()V

    return-void
.end method

.method public enableMayRenderStartOfStream()V
    .locals 1

    .line 702
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$800(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;)Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;->allowReleaseFirstFrameBeforeStarted()V

    return-void
.end method

.method public flush(Z)V
    .locals 2

    .line 571
    invoke-virtual {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 572
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoFrameProcessor:Landroidx/media3/common/VideoFrameProcessor;

    invoke-interface {v0}, Landroidx/media3/common/VideoFrameProcessor;->flush()V

    :cond_0
    const/4 v0, 0x0

    .line 574
    iput-boolean v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->hasRegisteredFirstInputStream:Z

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 575
    iput-wide v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->finalBufferPresentationTimeUs:J

    .line 576
    iput-wide v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->lastBufferPresentationTimeUs:J

    .line 577
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$1000(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;)V

    if-eqz p1, :cond_1

    .line 579
    iget-object p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {p1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$800(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;)Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;->reset()V

    :cond_1
    return-void
.end method

.method public getInputSurface()Landroid/view/Surface;
    .locals 1

    .line 649
    invoke-virtual {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->isInitialized()Z

    move-result v0

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 650
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoFrameProcessor:Landroidx/media3/common/VideoFrameProcessor;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/common/VideoFrameProcessor;

    invoke-interface {v0}, Landroidx/media3/common/VideoFrameProcessor;->getInputSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method public initialize(Landroidx/media3/common/Format;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/video/VideoSink$VideoSinkException;
        }
    .end annotation

    .line 559
    invoke-virtual {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->isInitialized()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 560
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v0, p1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$900(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;Landroidx/media3/common/Format;)Landroidx/media3/common/VideoFrameProcessor;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoFrameProcessor:Landroidx/media3/common/VideoFrameProcessor;

    return-void
.end method

.method public isEnded()Z
    .locals 5

    .line 594
    invoke-virtual {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->finalBufferPresentationTimeUs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget-object v2, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    .line 596
    invoke-static {v2, v0, v1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$1200(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFrameDropAllowedOnInput()Z
    .locals 1

    .line 644
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->context:Landroid/content/Context;

    invoke-static {v0}, Landroidx/media3/common/util/Util;->isFrameDropAllowedOnSurfaceInput(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public isInitialized()Z
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNullIf;
        expression = {
            "videoFrameProcessor"
        }
        result = true
    .end annotation

    .line 566
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoFrameProcessor:Landroidx/media3/common/VideoFrameProcessor;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isReady()Z
    .locals 1

    .line 589
    invoke-virtual {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$1100(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method synthetic lambda$onError$3$androidx-media3-exoplayer-video-CompositingVideoSinkProvider$VideoSinkImpl(Landroidx/media3/exoplayer/video/VideoSink$Listener;Landroidx/media3/common/VideoFrameProcessingException;)V
    .locals 2

    .line 876
    new-instance v0, Landroidx/media3/exoplayer/video/VideoSink$VideoSinkException;

    iget-object v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputFormat:Landroidx/media3/common/Format;

    .line 879
    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/common/Format;

    invoke-direct {v0, p2, v1}, Landroidx/media3/exoplayer/video/VideoSink$VideoSinkException;-><init>(Ljava/lang/Throwable;Landroidx/media3/common/Format;)V

    .line 876
    invoke-interface {p1, p0, v0}, Landroidx/media3/exoplayer/video/VideoSink$Listener;->onError(Landroidx/media3/exoplayer/video/VideoSink;Landroidx/media3/exoplayer/video/VideoSink$VideoSinkException;)V

    return-void
.end method

.method synthetic lambda$onFirstFrameRendered$0$androidx-media3-exoplayer-video-CompositingVideoSinkProvider$VideoSinkImpl(Landroidx/media3/exoplayer/video/VideoSink$Listener;)V
    .locals 0

    .line 851
    invoke-interface {p1, p0}, Landroidx/media3/exoplayer/video/VideoSink$Listener;->onFirstFrameRendered(Landroidx/media3/exoplayer/video/VideoSink;)V

    return-void
.end method

.method synthetic lambda$onFrameDropped$1$androidx-media3-exoplayer-video-CompositingVideoSinkProvider$VideoSinkImpl(Landroidx/media3/exoplayer/video/VideoSink$Listener;)V
    .locals 1

    .line 858
    invoke-static {p0}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/video/VideoSink;

    invoke-interface {p1, v0}, Landroidx/media3/exoplayer/video/VideoSink$Listener;->onFrameDropped(Landroidx/media3/exoplayer/video/VideoSink;)V

    return-void
.end method

.method synthetic lambda$onVideoSizeChanged$2$androidx-media3-exoplayer-video-CompositingVideoSinkProvider$VideoSinkImpl(Landroidx/media3/exoplayer/video/VideoSink$Listener;Landroidx/media3/common/VideoSize;)V
    .locals 0

    .line 866
    invoke-interface {p1, p0, p2}, Landroidx/media3/exoplayer/video/VideoSink$Listener;->onVideoSizeChanged(Landroidx/media3/exoplayer/video/VideoSink;Landroidx/media3/common/VideoSize;)V

    return-void
.end method

.method public onError(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;Landroidx/media3/common/VideoFrameProcessingException;)V
    .locals 2

    .line 873
    iget-object p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listener:Landroidx/media3/exoplayer/video/VideoSink$Listener;

    .line 874
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listenerExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1, p2}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda2;-><init>(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;Landroidx/media3/exoplayer/video/VideoSink$Listener;Landroidx/media3/common/VideoFrameProcessingException;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onFirstFrameRendered(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;)V
    .locals 2

    .line 850
    iget-object p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listener:Landroidx/media3/exoplayer/video/VideoSink$Listener;

    .line 851
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listenerExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda3;-><init>(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;Landroidx/media3/exoplayer/video/VideoSink$Listener;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onFrameDropped(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;)V
    .locals 2

    .line 856
    iget-object p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listener:Landroidx/media3/exoplayer/video/VideoSink$Listener;

    .line 857
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listenerExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda1;-><init>(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;Landroidx/media3/exoplayer/video/VideoSink$Listener;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onRendererDisabled()V
    .locals 1

    .line 538
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$800(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;)Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;->onDisabled()V

    return-void
.end method

.method public onRendererEnabled(Z)V
    .locals 1

    .line 533
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$800(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;)Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;->onEnabled(Z)V

    return-void
.end method

.method public onRendererStarted()V
    .locals 1

    .line 543
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$800(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;)Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;->onStarted()V

    return-void
.end method

.method public onRendererStopped()V
    .locals 1

    .line 548
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$800(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;)Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;->onStopped()V

    return-void
.end method

.method public onVideoSizeChanged(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;Landroidx/media3/common/VideoSize;)V
    .locals 2

    .line 864
    iget-object p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listener:Landroidx/media3/exoplayer/video/VideoSink$Listener;

    .line 865
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listenerExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;Landroidx/media3/exoplayer/video/VideoSink$Listener;Landroidx/media3/common/VideoSize;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public queueBitmap(Landroid/graphics/Bitmap;Landroidx/media3/common/util/TimestampIterator;)Z
    .locals 7

    .line 750
    invoke-virtual {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->isInitialized()Z

    move-result v0

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 752
    invoke-direct {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->maybeRegisterPendingInputStream()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 756
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoFrameProcessor:Landroidx/media3/common/VideoFrameProcessor;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/common/VideoFrameProcessor;

    .line 757
    invoke-interface {v0, p1, p2}, Landroidx/media3/common/VideoFrameProcessor;->queueInputBitmap(Landroid/graphics/Bitmap;Landroidx/media3/common/util/TimestampIterator;)Z

    move-result p1

    if-nez p1, :cond_1

    return v1

    .line 763
    :cond_1
    invoke-interface {p2}, Landroidx/media3/common/util/TimestampIterator;->copyOf()Landroidx/media3/common/util/TimestampIterator;

    move-result-object p1

    .line 764
    invoke-interface {p1}, Landroidx/media3/common/util/TimestampIterator;->next()J

    move-result-wide v2

    .line 767
    invoke-interface {p1}, Landroidx/media3/common/util/TimestampIterator;->getLastTimestampUs()J

    move-result-wide p1

    iget-wide v4, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputBufferTimestampAdjustmentUs:J

    sub-long/2addr p1, v4

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    const/4 v0, 0x1

    cmp-long v6, p1, v4

    if-eqz v6, :cond_2

    const/4 v1, 0x1

    .line 768
    :cond_2
    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 769
    invoke-direct {p0, v2, v3}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->maybeSetStreamOffsetChange(J)V

    .line 770
    iput-wide p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->lastBufferPresentationTimeUs:J

    .line 771
    iput-wide p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->finalBufferPresentationTimeUs:J

    return v0
.end method

.method public registerInputFrame(JZ)J
    .locals 5

    .line 707
    invoke-virtual {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->isInitialized()Z

    move-result v0

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 708
    iget v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoFrameProcessorMaxPendingFrameCount:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 712
    iget-wide v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->pendingInputStreamBufferPresentationTimeUs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-eqz v4, :cond_2

    .line 713
    iget-object v4, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v4, v0, v1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$1200(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;J)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 715
    invoke-direct {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->maybeRegisterInputStream()V

    .line 716
    iput-wide v2, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->pendingInputStreamBufferPresentationTimeUs:J

    goto :goto_1

    :cond_1
    return-wide v2

    .line 722
    :cond_2
    :goto_1
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoFrameProcessor:Landroidx/media3/common/VideoFrameProcessor;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/common/VideoFrameProcessor;

    invoke-interface {v0}, Landroidx/media3/common/VideoFrameProcessor;->getPendingInputFrameCount()I

    move-result v0

    iget v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoFrameProcessorMaxPendingFrameCount:I

    if-lt v0, v1, :cond_3

    return-wide v2

    .line 726
    :cond_3
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoFrameProcessor:Landroidx/media3/common/VideoFrameProcessor;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/common/VideoFrameProcessor;

    invoke-interface {v0}, Landroidx/media3/common/VideoFrameProcessor;->registerInputFrame()Z

    move-result v0

    if-nez v0, :cond_4

    return-wide v2

    .line 739
    :cond_4
    iget-wide v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputBufferTimestampAdjustmentUs:J

    sub-long v0, p1, v0

    .line 740
    invoke-direct {p0, v0, v1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->maybeSetStreamOffsetChange(J)V

    .line 741
    iput-wide v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->lastBufferPresentationTimeUs:J

    if-eqz p3, :cond_5

    .line 743
    iput-wide v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->finalBufferPresentationTimeUs:J

    :cond_5
    const-wide/16 v0, 0x3e8

    mul-long p1, p1, v0

    return-wide p1
.end method

.method public registerInputStream(ILandroidx/media3/common/Format;)V
    .locals 4

    .line 601
    invoke-virtual {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->isInitialized()Z

    move-result v0

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    goto :goto_0

    .line 607
    :cond_0
    new-instance p2, Ljava/lang/UnsupportedOperationException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unsupported input type "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 609
    :cond_1
    :goto_0
    iget-object v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$800(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;)Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;

    move-result-object v1

    iget v2, p2, Landroidx/media3/common/Format;->frameRate:F

    invoke-virtual {v1, v2}, Landroidx/media3/exoplayer/video/VideoFrameReleaseControl;->setFrameRate(F)V

    if-ne p1, v0, :cond_3

    .line 611
    sget v1, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_3

    iget v1, p2, Landroidx/media3/common/Format;->rotationDegrees:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    iget v1, p2, Landroidx/media3/common/Format;->rotationDegrees:I

    if-eqz v1, :cond_3

    .line 616
    iget-object v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->rotationEffect:Landroidx/media3/common/Effect;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputFormat:Landroidx/media3/common/Format;

    if-eqz v1, :cond_2

    iget v1, v1, Landroidx/media3/common/Format;->rotationDegrees:I

    iget v2, p2, Landroidx/media3/common/Format;->rotationDegrees:I

    if-eq v1, v2, :cond_4

    .line 619
    :cond_2
    iget v1, p2, Landroidx/media3/common/Format;->rotationDegrees:I

    int-to-float v1, v1

    invoke-static {v1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;->createRotationEffect(F)Landroidx/media3/common/Effect;

    move-result-object v1

    iput-object v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->rotationEffect:Landroidx/media3/common/Effect;

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    .line 623
    iput-object v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->rotationEffect:Landroidx/media3/common/Effect;

    .line 625
    :cond_4
    :goto_1
    iput p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputType:I

    .line 626
    iput-object p2, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputFormat:Landroidx/media3/common/Format;

    .line 628
    iget-boolean p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->hasRegisteredFirstInputStream:Z

    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    if-nez p1, :cond_5

    .line 629
    invoke-direct {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->maybeRegisterInputStream()V

    .line 630
    iput-boolean v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->hasRegisteredFirstInputStream:Z

    .line 634
    iput-wide v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->pendingInputStreamBufferPresentationTimeUs:J

    goto :goto_3

    .line 637
    :cond_5
    iget-wide p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->lastBufferPresentationTimeUs:J

    cmp-long v3, p1, v1

    if-eqz v3, :cond_6

    goto :goto_2

    :cond_6
    const/4 v0, 0x0

    :goto_2
    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 638
    iget-wide p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->lastBufferPresentationTimeUs:J

    iput-wide p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->pendingInputStreamBufferPresentationTimeUs:J

    :goto_3
    return-void
.end method

.method public release()V
    .locals 1

    .line 787
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->release()V

    return-void
.end method

.method public render(JJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/video/VideoSink$VideoSinkException;
        }
    .end annotation

    .line 778
    :try_start_0
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->render(JJ)V
    :try_end_0
    .catch Landroidx/media3/exoplayer/ExoPlaybackException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 780
    new-instance p2, Landroidx/media3/exoplayer/video/VideoSink$VideoSinkException;

    .line 781
    iget-object p3, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputFormat:Landroidx/media3/common/Format;

    if-eqz p3, :cond_0

    goto :goto_0

    :cond_0
    new-instance p3, Landroidx/media3/common/Format$Builder;

    invoke-direct {p3}, Landroidx/media3/common/Format$Builder;-><init>()V

    invoke-virtual {p3}, Landroidx/media3/common/Format$Builder;->build()Landroidx/media3/common/Format;

    move-result-object p3

    :goto_0
    invoke-direct {p2, p1, p3}, Landroidx/media3/exoplayer/video/VideoSink$VideoSinkException;-><init>(Ljava/lang/Throwable;Landroidx/media3/common/Format;)V

    throw p2
.end method

.method public setListener(Landroidx/media3/exoplayer/video/VideoSink$Listener;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 553
    iput-object p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listener:Landroidx/media3/exoplayer/video/VideoSink$Listener;

    .line 554
    iput-object p2, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->listenerExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public setOutputSurfaceInfo(Landroid/view/Surface;Landroidx/media3/common/util/Size;)V
    .locals 1

    .line 692
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->setOutputSurfaceInfo(Landroid/view/Surface;Landroidx/media3/common/util/Size;)V

    return-void
.end method

.method public setPendingVideoEffects(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/common/Effect;",
            ">;)V"
        }
    .end annotation

    .line 675
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoEffects:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 676
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoEffects:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public setPlaybackSpeed(F)V
    .locals 1

    .line 661
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v0, p1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$1400(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;F)V

    return-void
.end method

.method public setStreamOffsetAndAdjustmentUs(JJ)V
    .locals 4

    .line 683
    iget-boolean v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->pendingInputStreamOffsetChange:Z

    iget-wide v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputStreamOffsetUs:J

    cmp-long v3, v1, p1

    if-nez v3, :cond_1

    iget-wide v1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputBufferTimestampAdjustmentUs:J

    cmp-long v3, v1, p3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    or-int/2addr v0, v1

    iput-boolean v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->pendingInputStreamOffsetChange:Z

    .line 686
    iput-wide p1, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputStreamOffsetUs:J

    .line 687
    iput-wide p3, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->inputBufferTimestampAdjustmentUs:J

    return-void
.end method

.method public setVideoEffects(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/common/Effect;",
            ">;)V"
        }
    .end annotation

    .line 666
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->videoEffects:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 669
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->setPendingVideoEffects(Ljava/util/List;)V

    .line 670
    invoke-direct {p0}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->maybeRegisterInputStream()V

    return-void
.end method

.method public setVideoFrameMetadataListener(Landroidx/media3/exoplayer/video/VideoFrameMetadataListener;)V
    .locals 1

    .line 656
    iget-object v0, p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$VideoSinkImpl;->this$0:Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;

    invoke-static {v0, p1}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;->access$1300(Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;Landroidx/media3/exoplayer/video/VideoFrameMetadataListener;)V

    return-void
.end method
