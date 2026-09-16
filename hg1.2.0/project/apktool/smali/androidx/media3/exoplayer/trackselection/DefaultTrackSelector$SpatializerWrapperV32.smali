.class Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;
.super Ljava/lang/Object;
.source "DefaultTrackSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SpatializerWrapperV32"
.end annotation


# instance fields
.field private handler:Landroid/os/Handler;

.field private listener:Landroid/media/Spatializer$OnSpatializerStateChangedListener;

.field private final spatializationSupported:Z

.field private final spatializer:Landroid/media/Spatializer;


# direct methods
.method private constructor <init>(Landroid/media/Spatializer;)V
    .locals 0

    .line 4171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4172
    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->spatializer:Landroid/media/Spatializer;

    .line 4174
    invoke-static {p1}, Landroidx/media3/exoplayer/drm/FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/Spatializer;)I

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->spatializationSupported:Z

    return-void
.end method

.method public static tryCreateInstance(Landroid/content/Context;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;
    .locals 1

    .line 4167
    const-string v0, "audio"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/media/AudioManager;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    .line 4168
    :cond_0
    new-instance v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

    invoke-static {p0}, Landroidx/media3/exoplayer/drm/FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;)Landroid/media/Spatializer;

    move-result-object p0

    invoke-direct {v0, p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;-><init>(Landroid/media/Spatializer;)V

    move-object p0, v0

    :goto_0
    return-object p0
.end method


# virtual methods
.method public canBeSpatialized(Landroidx/media3/common/AudioAttributes;Landroidx/media3/common/Format;)Z
    .locals 3

    .line 4214
    const-string v0, "audio/eac3-joc"

    iget-object v1, p2, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p2, Landroidx/media3/common/Format;->channelCount:I

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    const/16 v0, 0xc

    goto :goto_0

    .line 4216
    :cond_0
    iget v0, p2, Landroidx/media3/common/Format;->channelCount:I

    .line 4217
    :goto_0
    invoke-static {v0}, Landroidx/media3/common/util/Util;->getAudioTrackChannelConfig(I)I

    move-result v0

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 4221
    :cond_1
    new-instance v1, Landroid/media/AudioFormat$Builder;

    invoke-direct {v1}, Landroid/media/AudioFormat$Builder;-><init>()V

    const/4 v2, 0x2

    .line 4223
    invoke-virtual {v1, v2}, Landroid/media/AudioFormat$Builder;->setEncoding(I)Landroid/media/AudioFormat$Builder;

    move-result-object v1

    .line 4224
    invoke-virtual {v1, v0}, Landroid/media/AudioFormat$Builder;->setChannelMask(I)Landroid/media/AudioFormat$Builder;

    move-result-object v0

    .line 4225
    iget v1, p2, Landroidx/media3/common/Format;->sampleRate:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 4226
    iget p2, p2, Landroidx/media3/common/Format;->sampleRate:I

    invoke-virtual {v0, p2}, Landroid/media/AudioFormat$Builder;->setSampleRate(I)Landroid/media/AudioFormat$Builder;

    .line 4228
    :cond_2
    iget-object p2, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->spatializer:Landroid/media/Spatializer;

    .line 4229
    invoke-virtual {p1}, Landroidx/media3/common/AudioAttributes;->getAudioAttributesV21()Landroidx/media3/common/AudioAttributes$AudioAttributesV21;

    move-result-object p1

    iget-object p1, p1, Landroidx/media3/common/AudioAttributes$AudioAttributesV21;->audioAttributes:Landroid/media/AudioAttributes;

    invoke-virtual {v0}, Landroid/media/AudioFormat$Builder;->build()Landroid/media/AudioFormat;

    move-result-object v0

    .line 4228
    invoke-static {p2, p1, v0}, Landroidx/media3/exoplayer/drm/FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/Spatializer;Landroid/media/AudioAttributes;Landroid/media/AudioFormat;)Z

    move-result p1

    return p1
.end method

.method public ensureInitialized(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;Landroid/os/Looper;)V
    .locals 1

    .line 4178
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->listener:Landroid/media/Spatializer$OnSpatializerStateChangedListener;

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 4181
    :cond_0
    new-instance v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32$1;

    invoke-direct {v0, p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32$1;-><init>(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;)V

    iput-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->listener:Landroid/media/Spatializer$OnSpatializerStateChangedListener;

    .line 4193
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->handler:Landroid/os/Handler;

    .line 4194
    iget-object p2, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->spatializer:Landroid/media/Spatializer;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$StreamEventCallbackV29$$ExternalSyntheticLambda2;

    invoke-direct {v0, p1}, Landroidx/media3/exoplayer/audio/DefaultAudioSink$StreamEventCallbackV29$$ExternalSyntheticLambda2;-><init>(Landroid/os/Handler;)V

    iget-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->listener:Landroid/media/Spatializer$OnSpatializerStateChangedListener;

    invoke-static {p2, v0, p1}, Landroidx/media3/exoplayer/drm/FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/Spatializer;Ljava/util/concurrent/Executor;Landroid/media/Spatializer$OnSpatializerStateChangedListener;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public isAvailable()Z
    .locals 1

    .line 4202
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->spatializer:Landroid/media/Spatializer;

    invoke-static {v0}, Landroidx/media3/exoplayer/drm/FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/Spatializer;)Z

    move-result v0

    return v0
.end method

.method public isEnabled()Z
    .locals 1

    .line 4206
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->spatializer:Landroid/media/Spatializer;

    invoke-static {v0}, Landroidx/media3/exoplayer/drm/FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/Spatializer;)Z

    move-result v0

    return v0
.end method

.method public isSpatializationSupported()Z
    .locals 1

    .line 4198
    iget-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->spatializationSupported:Z

    return v0
.end method

.method public release()V
    .locals 2

    .line 4233
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->listener:Landroid/media/Spatializer$OnSpatializerStateChangedListener;

    if-eqz v0, :cond_1

    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->handler:Landroid/os/Handler;

    if-nez v1, :cond_0

    goto :goto_0

    .line 4236
    :cond_0
    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->spatializer:Landroid/media/Spatializer;

    invoke-static {v1, v0}, Landroidx/media3/exoplayer/drm/FrameworkMediaDrm$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/Spatializer;Landroid/media/Spatializer$OnSpatializerStateChangedListener;)V

    .line 4237
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->handler:Landroid/os/Handler;

    invoke-static {v0}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 4238
    iput-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->handler:Landroid/os/Handler;

    .line 4239
    iput-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->listener:Landroid/media/Spatializer$OnSpatializerStateChangedListener;

    :cond_1
    :goto_0
    return-void
.end method
