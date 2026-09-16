.class public interface abstract Landroidx/media3/exoplayer/video/VideoSink;
.super Ljava/lang/Object;
.source "VideoSink.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/exoplayer/video/VideoSink$InputType;,
        Landroidx/media3/exoplayer/video/VideoSink$Listener;,
        Landroidx/media3/exoplayer/video/VideoSink$VideoSinkException;
    }
.end annotation


# static fields
.field public static final INPUT_TYPE_BITMAP:I = 0x2

.field public static final INPUT_TYPE_SURFACE:I = 0x1


# virtual methods
.method public abstract clearOutputSurfaceInfo()V
.end method

.method public abstract enableMayRenderStartOfStream()V
.end method

.method public abstract flush(Z)V
.end method

.method public abstract getInputSurface()Landroid/view/Surface;
.end method

.method public abstract initialize(Landroidx/media3/common/Format;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/video/VideoSink$VideoSinkException;
        }
    .end annotation
.end method

.method public abstract isEnded()Z
.end method

.method public abstract isFrameDropAllowedOnInput()Z
.end method

.method public abstract isInitialized()Z
.end method

.method public abstract isReady()Z
.end method

.method public abstract onRendererDisabled()V
.end method

.method public abstract onRendererEnabled(Z)V
.end method

.method public abstract onRendererStarted()V
.end method

.method public abstract onRendererStopped()V
.end method

.method public abstract queueBitmap(Landroid/graphics/Bitmap;Landroidx/media3/common/util/TimestampIterator;)Z
.end method

.method public abstract registerInputFrame(JZ)J
.end method

.method public abstract registerInputStream(ILandroidx/media3/common/Format;)V
.end method

.method public abstract release()V
.end method

.method public abstract render(JJ)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/video/VideoSink$VideoSinkException;
        }
    .end annotation
.end method

.method public abstract setListener(Landroidx/media3/exoplayer/video/VideoSink$Listener;Ljava/util/concurrent/Executor;)V
.end method

.method public abstract setOutputSurfaceInfo(Landroid/view/Surface;Landroidx/media3/common/util/Size;)V
.end method

.method public abstract setPendingVideoEffects(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/common/Effect;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setPlaybackSpeed(F)V
.end method

.method public abstract setStreamOffsetAndAdjustmentUs(JJ)V
.end method

.method public abstract setVideoEffects(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/media3/common/Effect;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setVideoFrameMetadataListener(Landroidx/media3/exoplayer/video/VideoFrameMetadataListener;)V
.end method
