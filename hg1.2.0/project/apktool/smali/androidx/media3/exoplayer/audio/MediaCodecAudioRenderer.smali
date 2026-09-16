.class public Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;
.super Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;
.source "MediaCodecAudioRenderer.java"

# interfaces
.implements Landroidx/media3/exoplayer/MediaClock;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer$AudioSinkListener;,
        Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer$Api23;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaCodecAudioRenderer"

.field private static final VIVO_BITS_PER_SAMPLE_KEY:Ljava/lang/String; = "v-bits-per-sample"


# instance fields
.field private allowPositionDiscontinuity:Z

.field private final audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

.field private audioSinkNeedsReset:Z

.field private codecMaxInputSize:I

.field private codecNeedsDiscardChannelsWorkaround:Z

.field private codecNeedsVorbisToAndroidChannelMappingWorkaround:Z

.field private final context:Landroid/content/Context;

.field private currentPositionUs:J

.field private decryptOnlyCodecFormat:Landroidx/media3/common/Format;

.field private final eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

.field private hasPendingReportedSkippedSilence:Z

.field private inputFormat:Landroidx/media3/common/Format;

.field private isStarted:Z

.field private nextBufferToWritePresentationTimeUs:J

.field private rendererPriority:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Factory;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;ZLandroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioRendererEventListener;Landroidx/media3/exoplayer/audio/AudioSink;)V
    .locals 6

    const/4 v1, 0x1

    const v5, 0x472c4400    # 44100.0f

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    .line 255
    invoke-direct/range {v0 .. v5}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;-><init>(ILandroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Factory;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;ZF)V

    .line 261
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 262
    iput-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->context:Landroid/content/Context;

    .line 263
    iput-object p7, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    const/16 p1, -0x3e8

    .line 264
    iput p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->rendererPriority:I

    .line 265
    new-instance p1, Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    invoke-direct {p1, p5, p6}, Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;-><init>(Landroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioRendererEventListener;)V

    iput-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 266
    iput-wide p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->nextBufferToWritePresentationTimeUs:J

    .line 267
    new-instance p1, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer$AudioSinkListener;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer$AudioSinkListener;-><init>(Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer$1;)V

    invoke-interface {p7, p1}, Landroidx/media3/exoplayer/audio/AudioSink;->setListener(Landroidx/media3/exoplayer/audio/AudioSink$Listener;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;)V
    .locals 1

    const/4 v0, 0x0

    .line 132
    invoke-direct {p0, p1, p2, v0, v0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;-><init>(Landroid/content/Context;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioRendererEventListener;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioRendererEventListener;)V
    .locals 7

    .line 147
    new-instance v0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$Builder;

    invoke-direct {v0, p1}, Landroidx/media3/exoplayer/audio/DefaultAudioSink$Builder;-><init>(Landroid/content/Context;)V

    .line 152
    invoke-virtual {v0}, Landroidx/media3/exoplayer/audio/DefaultAudioSink$Builder;->build()Landroidx/media3/exoplayer/audio/DefaultAudioSink;

    move-result-object v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 147
    invoke-direct/range {v1 .. v6}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;-><init>(Landroid/content/Context;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioRendererEventListener;Landroidx/media3/exoplayer/audio/AudioSink;)V

    return-void
.end method

.method public varargs constructor <init>(Landroid/content/Context;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioRendererEventListener;Landroidx/media3/exoplayer/audio/AudioCapabilities;[Landroidx/media3/common/audio/AudioProcessor;)V
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 168
    new-instance v0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$Builder;

    invoke-direct {v0}, Landroidx/media3/exoplayer/audio/DefaultAudioSink$Builder;-><init>()V

    sget-object v1, Landroidx/media3/exoplayer/audio/AudioCapabilities;->DEFAULT_AUDIO_CAPABILITIES:Landroidx/media3/exoplayer/audio/AudioCapabilities;

    .line 175
    invoke-static {p5, v1}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Landroidx/media3/exoplayer/audio/AudioCapabilities;

    .line 174
    invoke-virtual {v0, p5}, Landroidx/media3/exoplayer/audio/DefaultAudioSink$Builder;->setAudioCapabilities(Landroidx/media3/exoplayer/audio/AudioCapabilities;)Landroidx/media3/exoplayer/audio/DefaultAudioSink$Builder;

    move-result-object p5

    .line 176
    invoke-virtual {p5, p6}, Landroidx/media3/exoplayer/audio/DefaultAudioSink$Builder;->setAudioProcessors([Landroidx/media3/common/audio/AudioProcessor;)Landroidx/media3/exoplayer/audio/DefaultAudioSink$Builder;

    move-result-object p5

    .line 177
    invoke-virtual {p5}, Landroidx/media3/exoplayer/audio/DefaultAudioSink$Builder;->build()Landroidx/media3/exoplayer/audio/DefaultAudioSink;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 168
    invoke-direct/range {v0 .. v5}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;-><init>(Landroid/content/Context;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioRendererEventListener;Landroidx/media3/exoplayer/audio/AudioSink;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioRendererEventListener;Landroidx/media3/exoplayer/audio/AudioSink;)V
    .locals 8

    .line 196
    invoke-static {p1}, Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Factory$-CC;->getDefault(Landroid/content/Context;)Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Factory;

    move-result-object v2

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    .line 194
    invoke-direct/range {v0 .. v7}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;-><init>(Landroid/content/Context;Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Factory;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;ZLandroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioRendererEventListener;Landroidx/media3/exoplayer/audio/AudioSink;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;ZLandroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioRendererEventListener;Landroidx/media3/exoplayer/audio/AudioSink;)V
    .locals 8

    .line 224
    invoke-static {p1}, Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Factory$-CC;->getDefault(Landroid/content/Context;)Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Factory;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    .line 222
    invoke-direct/range {v0 .. v7}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;-><init>(Landroid/content/Context;Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Factory;Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;ZLandroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioRendererEventListener;Landroidx/media3/exoplayer/audio/AudioSink;)V

    return-void
.end method

.method static synthetic access$102(Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;Z)Z
    .locals 0

    .line 97
    iput-boolean p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->hasPendingReportedSkippedSilence:Z

    return p1
.end method

.method static synthetic access$200(Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;)Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;
    .locals 0

    .line 97
    iget-object p0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    return-object p0
.end method

.method static synthetic access$300(Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;)Landroidx/media3/exoplayer/Renderer$WakeupListener;
    .locals 0

    .line 97
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getWakeupListener()Landroidx/media3/exoplayer/Renderer$WakeupListener;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;)Landroidx/media3/exoplayer/Renderer$WakeupListener;
    .locals 0

    .line 97
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getWakeupListener()Landroidx/media3/exoplayer/Renderer$WakeupListener;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;)V
    .locals 0

    .line 97
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->onRendererCapabilitiesChanged()V

    return-void
.end method

.method private static codecNeedsDiscardChannelsWorkaround(Ljava/lang/String;)Z
    .locals 2

    .line 1024
    sget v0, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v1, 0x18

    if-ge v0, v1, :cond_1

    const-string v0, "OMX.SEC.aac.dec"

    .line 1025
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "samsung"

    sget-object v0, Landroidx/media3/common/util/Util;->MANUFACTURER:Ljava/lang/String;

    .line 1026
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    sget-object p0, Landroidx/media3/common/util/Util;->DEVICE:Ljava/lang/String;

    const-string v0, "zeroflte"

    .line 1027
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    sget-object p0, Landroidx/media3/common/util/Util;->DEVICE:Ljava/lang/String;

    const-string v0, "herolte"

    .line 1028
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    sget-object p0, Landroidx/media3/common/util/Util;->DEVICE:Ljava/lang/String;

    const-string v0, "heroqlte"

    .line 1029
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static codecNeedsVorbisToAndroidChannelMappingWorkaround(Ljava/lang/String;)Z
    .locals 1

    .line 1039
    const-string v0, "OMX.google.opus.decoder"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "c2.android.opus.decoder"

    .line 1040
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "OMX.google.vorbis.decoder"

    .line 1041
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "c2.android.vorbis.decoder"

    .line 1042
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static deviceDoesntSupportOperatingRate()Z
    .locals 2

    .line 1012
    sget v0, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v1, 0x17

    if-ne v0, v1, :cond_1

    const-string v0, "ZTE B2017G"

    sget-object v1, Landroidx/media3/common/util/Util;->MODEL:Ljava/lang/String;

    .line 1013
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "AXON 7 mini"

    sget-object v1, Landroidx/media3/common/util/Util;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private getAudioOffloadSupport(Landroidx/media3/common/Format;)I
    .locals 1

    .line 356
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    .line 357
    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/audio/AudioSink;->getFormatOffloadSupport(Landroidx/media3/common/Format;)Landroidx/media3/exoplayer/audio/AudioOffloadSupport;

    move-result-object p1

    .line 358
    iget-boolean v0, p1, Landroidx/media3/exoplayer/audio/AudioOffloadSupport;->isFormatSupported:Z

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 362
    :cond_0
    iget-boolean v0, p1, Landroidx/media3/exoplayer/audio/AudioOffloadSupport;->isGaplessSupported:Z

    if-eqz v0, :cond_1

    const/16 v0, 0x600

    goto :goto_0

    :cond_1
    const/16 v0, 0x200

    .line 365
    :goto_0
    iget-boolean p1, p1, Landroidx/media3/exoplayer/audio/AudioOffloadSupport;->isSpeedChangeSupported:Z

    if-eqz p1, :cond_2

    or-int/lit16 v0, v0, 0x800

    :cond_2
    return v0
.end method

.method private getCodecMaxInputSize(Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;Landroidx/media3/common/Format;)I
    .locals 1

    .line 918
    const-string v0, "OMX.google.raw.decoder"

    iget-object p1, p1, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 923
    sget p1, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v0, 0x18

    if-ge p1, v0, :cond_1

    sget p1, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v0, 0x17

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->context:Landroid/content/Context;

    invoke-static {p1}, Landroidx/media3/common/util/Util;->isTv(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    const/4 p1, -0x1

    return p1

    .line 927
    :cond_1
    iget p1, p2, Landroidx/media3/common/Format;->maxInputSize:I

    return p1
.end method

.method private static getDecoderInfos(Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroidx/media3/common/Format;ZLandroidx/media3/exoplayer/audio/AudioSink;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;",
            "Landroidx/media3/common/Format;",
            "Z",
            "Landroidx/media3/exoplayer/audio/AudioSink;",
            ")",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/mediacodec/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .line 401
    iget-object v0, p1, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 402
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0

    .line 404
    :cond_0
    invoke-interface {p3, p1}, Landroidx/media3/exoplayer/audio/AudioSink;->supportsFormat(Landroidx/media3/common/Format;)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 406
    invoke-static {}, Landroidx/media3/exoplayer/mediacodec/MediaCodecUtil;->getDecryptOnlyDecoderInfo()Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;

    move-result-object p3

    if-eqz p3, :cond_1

    .line 408
    invoke-static {p3}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p3, 0x0

    .line 411
    invoke-static {p0, p1, p2, p3}, Landroidx/media3/exoplayer/mediacodec/MediaCodecUtil;->getDecoderInfosSoftMatch(Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroidx/media3/common/Format;ZZ)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private updateCodecImportance()V
    .locals 4

    .line 981
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getCodec()Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 986
    :cond_0
    sget v1, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v2, 0x23

    if-lt v1, v2, :cond_1

    .line 987
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 989
    iget v2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->rendererPriority:I

    neg-int v2, v2

    const/4 v3, 0x0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    const-string v3, "importance"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 990
    invoke-interface {v0, v1}, Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter;->setParameters(Landroid/os/Bundle;)V

    :cond_1
    return-void
.end method

.method private updateCurrentPosition()V
    .locals 5

    .line 995
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->isEnded()Z

    move-result v1

    invoke-interface {v0, v1}, Landroidx/media3/exoplayer/audio/AudioSink;->getCurrentPositionUs(Z)J

    move-result-wide v0

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    .line 998
    iget-boolean v2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->allowPositionDiscontinuity:Z

    if-eqz v2, :cond_0

    goto :goto_0

    .line 1000
    :cond_0
    iget-wide v2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->currentPositionUs:J

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    :goto_0
    iput-wide v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->currentPositionUs:J

    const/4 v0, 0x0

    .line 1001
    iput-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->allowPositionDiscontinuity:Z

    :cond_1
    return-void
.end method


# virtual methods
.method protected canReuseCodec(Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;Landroidx/media3/common/Format;Landroidx/media3/common/Format;)Landroidx/media3/exoplayer/DecoderReuseEvaluation;
    .locals 8

    .line 454
    invoke-virtual {p1, p2, p3}, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->canReuseCodec(Landroidx/media3/common/Format;Landroidx/media3/common/Format;)Landroidx/media3/exoplayer/DecoderReuseEvaluation;

    move-result-object v0

    .line 456
    iget v1, v0, Landroidx/media3/exoplayer/DecoderReuseEvaluation;->discardReasons:I

    .line 457
    invoke-virtual {p0, p3}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->isBypassPossible(Landroidx/media3/common/Format;)Z

    move-result v2

    if-eqz v2, :cond_0

    const v2, 0x8000

    or-int/2addr v1, v2

    .line 462
    :cond_0
    invoke-direct {p0, p1, p3}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getCodecMaxInputSize(Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;Landroidx/media3/common/Format;)I

    move-result v2

    iget v3, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->codecMaxInputSize:I

    if-le v2, v3, :cond_1

    or-int/lit8 v1, v1, 0x40

    :cond_1
    move v7, v1

    .line 466
    new-instance v1, Landroidx/media3/exoplayer/DecoderReuseEvaluation;

    iget-object v3, p1, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->name:Ljava/lang/String;

    if-eqz v7, :cond_2

    const/4 p1, 0x0

    const/4 v6, 0x0

    goto :goto_0

    .line 470
    :cond_2
    iget p1, v0, Landroidx/media3/exoplayer/DecoderReuseEvaluation;->result:I

    move v6, p1

    :goto_0
    move-object v2, v1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v2 .. v7}, Landroidx/media3/exoplayer/DecoderReuseEvaluation;-><init>(Ljava/lang/String;Landroidx/media3/common/Format;Landroidx/media3/common/Format;II)V

    return-object v1
.end method

.method protected getCodecMaxInputSize(Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;Landroidx/media3/common/Format;[Landroidx/media3/common/Format;)I
    .locals 5

    .line 895
    invoke-direct {p0, p1, p2}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getCodecMaxInputSize(Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;Landroidx/media3/common/Format;)I

    move-result v0

    .line 896
    array-length v1, p3

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    return v0

    .line 901
    :cond_0
    array-length v1, p3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, p3, v2

    .line 902
    invoke-virtual {p1, p2, v3}, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->canReuseCodec(Landroidx/media3/common/Format;Landroidx/media3/common/Format;)Landroidx/media3/exoplayer/DecoderReuseEvaluation;

    move-result-object v4

    iget v4, v4, Landroidx/media3/exoplayer/DecoderReuseEvaluation;->result:I

    if-eqz v4, :cond_1

    .line 903
    invoke-direct {p0, p1, v3}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getCodecMaxInputSize(Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;Landroidx/media3/common/Format;)I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method protected getCodecOperatingRateV23(FLandroidx/media3/common/Format;[Landroidx/media3/common/Format;)F
    .locals 4

    .line 505
    array-length p2, p3

    const/4 v0, -0x1

    const/4 v1, 0x0

    const/4 v2, -0x1

    :goto_0
    if-ge v1, p2, :cond_1

    aget-object v3, p3, v1

    .line 506
    iget v3, v3, Landroidx/media3/common/Format;->sampleRate:I

    if-eq v3, v0, :cond_0

    .line 508
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    if-ne v2, v0, :cond_2

    const/high16 p1, -0x40800000    # -1.0f

    goto :goto_1

    :cond_2
    int-to-float p2, v2

    mul-float p1, p1, p2

    :goto_1
    return p1
.end method

.method protected getDecoderInfos(Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroidx/media3/common/Format;Z)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;",
            "Landroidx/media3/common/Format;",
            "Z)",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/mediacodec/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .line 375
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    .line 376
    invoke-static {p1, p2, p3, v0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getDecoderInfos(Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroidx/media3/common/Format;ZLandroidx/media3/exoplayer/audio/AudioSink;)Ljava/util/List;

    move-result-object p1

    .line 375
    invoke-static {p1, p2}, Landroidx/media3/exoplayer/mediacodec/MediaCodecUtil;->getDecoderInfosSortedByFormatSupport(Ljava/util/List;Landroidx/media3/common/Format;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getDurationToProgressUs(ZJJ)J
    .locals 5

    .line 483
    iget-wide v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->nextBufferToWritePresentationTimeUs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-eqz v4, :cond_2

    sub-long/2addr v0, p2

    long-to-float p1, v0

    .line 487
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;

    move-result-object p2

    iget p2, p2, Landroidx/media3/common/PlaybackParameters;->speed:F

    goto :goto_0

    :cond_0
    const/high16 p2, 0x3f800000    # 1.0f

    :goto_0
    div-float/2addr p1, p2

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    float-to-long p1, p1

    .line 489
    iget-boolean p3, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->isStarted:Z

    if-eqz p3, :cond_1

    .line 491
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getClock()Landroidx/media3/common/util/Clock;

    move-result-object p3

    invoke-interface {p3}, Landroidx/media3/common/util/Clock;->elapsedRealtime()J

    move-result-wide v0

    invoke-static {v0, v1}, Landroidx/media3/common/util/Util;->msToUs(J)J

    move-result-wide v0

    sub-long/2addr v0, p4

    sub-long/2addr p1, v0

    :cond_1
    const-wide/16 p3, 0x2710

    .line 493
    invoke-static {p3, p4, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    return-wide p1

    .line 495
    :cond_2
    invoke-super/range {p0 .. p5}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->getDurationToProgressUs(ZJJ)J

    move-result-wide p1

    return-wide p1
.end method

.method public getMediaClock()Landroidx/media3/exoplayer/MediaClock;
    .locals 0

    return-object p0
.end method

.method protected getMediaCodecConfiguration(Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;Landroidx/media3/common/Format;Landroid/media/MediaCrypto;F)Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Configuration;
    .locals 2

    .line 436
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getStreamFormats()[Landroidx/media3/common/Format;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getCodecMaxInputSize(Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;Landroidx/media3/common/Format;[Landroidx/media3/common/Format;)I

    move-result v0

    iput v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->codecMaxInputSize:I

    .line 437
    iget-object v0, p1, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->name:Ljava/lang/String;

    invoke-static {v0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->codecNeedsDiscardChannelsWorkaround(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->codecNeedsDiscardChannelsWorkaround:Z

    .line 438
    iget-object v0, p1, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->name:Ljava/lang/String;

    .line 439
    invoke-static {v0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->codecNeedsVorbisToAndroidChannelMappingWorkaround(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->codecNeedsVorbisToAndroidChannelMappingWorkaround:Z

    .line 440
    iget-object v0, p1, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->codecMimeType:Ljava/lang/String;

    iget v1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->codecMaxInputSize:I

    .line 441
    invoke-virtual {p0, p2, v0, v1, p4}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getMediaFormat(Landroidx/media3/common/Format;Ljava/lang/String;IF)Landroid/media/MediaFormat;

    move-result-object p4

    .line 443
    iget-object v0, p1, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->mimeType:Ljava/lang/String;

    .line 444
    const-string v1, "audio/raw"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p2, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    .line 445
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, p2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 446
    :goto_0
    iput-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->decryptOnlyCodecFormat:Landroidx/media3/common/Format;

    .line 447
    invoke-static {p1, p4, p2, p3}, Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Configuration;->createForAudioDecoding(Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;Landroid/media/MediaFormat;Landroidx/media3/common/Format;Landroid/media/MediaCrypto;)Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Configuration;

    move-result-object p1

    return-object p1
.end method

.method protected getMediaFormat(Landroidx/media3/common/Format;Ljava/lang/String;IF)Landroid/media/MediaFormat;
    .locals 2

    .line 944
    new-instance v0, Landroid/media/MediaFormat;

    invoke-direct {v0}, Landroid/media/MediaFormat;-><init>()V

    .line 946
    const-string v1, "mime"

    invoke-virtual {v0, v1, p2}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 947
    const-string p2, "channel-count"

    iget v1, p1, Landroidx/media3/common/Format;->channelCount:I

    invoke-virtual {v0, p2, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 948
    const-string p2, "sample-rate"

    iget v1, p1, Landroidx/media3/common/Format;->sampleRate:I

    invoke-virtual {v0, p2, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 949
    iget-object p2, p1, Landroidx/media3/common/Format;->initializationData:Ljava/util/List;

    invoke-static {v0, p2}, Landroidx/media3/common/util/MediaFormatUtil;->setCsdBuffers(Landroid/media/MediaFormat;Ljava/util/List;)V

    .line 951
    const-string p2, "max-input-size"

    invoke-static {v0, p2, p3}, Landroidx/media3/common/util/MediaFormatUtil;->maybeSetInteger(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 953
    sget p2, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 p3, 0x17

    const/4 v1, 0x0

    if-lt p2, p3, :cond_0

    .line 954
    const-string p2, "priority"

    invoke-virtual {v0, p2, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const/high16 p2, -0x40800000    # -1.0f

    cmpl-float p2, p4, p2

    if-eqz p2, :cond_0

    .line 955
    invoke-static {}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->deviceDoesntSupportOperatingRate()Z

    move-result p2

    if-nez p2, :cond_0

    .line 956
    const-string p2, "operating-rate"

    invoke-virtual {v0, p2, p4}, Landroid/media/MediaFormat;->setFloat(Ljava/lang/String;F)V

    .line 959
    :cond_0
    sget p2, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 p3, 0x1c

    if-gt p2, p3, :cond_1

    const-string p2, "audio/ac4"

    iget-object p3, p1, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 962
    const-string p2, "ac4-is-sync"

    const/4 p3, 0x1

    invoke-virtual {v0, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 964
    :cond_1
    sget p2, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 p3, 0x18

    if-lt p2, p3, :cond_2

    iget-object p2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    iget p3, p1, Landroidx/media3/common/Format;->channelCount:I

    iget p1, p1, Landroidx/media3/common/Format;->sampleRate:I

    const/4 p4, 0x4

    .line 966
    invoke-static {p4, p3, p1}, Landroidx/media3/common/util/Util;->getPcmFormat(III)Landroidx/media3/common/Format;

    move-result-object p1

    .line 965
    invoke-interface {p2, p1}, Landroidx/media3/exoplayer/audio/AudioSink;->getFormatSupport(Landroidx/media3/common/Format;)I

    move-result p1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_2

    .line 968
    const-string p1, "pcm-encoding"

    invoke-virtual {v0, p1, p4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 970
    :cond_2
    sget p1, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 p2, 0x20

    if-lt p1, p2, :cond_3

    .line 971
    const-string p1, "max-output-channel-count"

    const/16 p2, 0x63

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 973
    :cond_3
    sget p1, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 p2, 0x23

    if-lt p1, p2, :cond_4

    .line 975
    iget p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->rendererPriority:I

    neg-int p1, p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    const-string p2, "importance"

    invoke-virtual {v0, p2, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    :cond_4
    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 272
    const-string v0, "MediaCodecAudioRenderer"

    return-object v0
.end method

.method public getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;
    .locals 1

    .line 727
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0}, Landroidx/media3/exoplayer/audio/AudioSink;->getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;

    move-result-object v0

    return-object v0
.end method

.method public getPositionUs()J
    .locals 2

    .line 707
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getState()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 708
    invoke-direct {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->updateCurrentPosition()V

    .line 710
    :cond_0
    iget-wide v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->currentPositionUs:J

    return-wide v0
.end method

.method protected handleInputBufferSupplementalData(Landroidx/media3/decoder/DecoderInputBuffer;)V
    .locals 4

    .line 870
    sget v0, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    iget-object v0, p1, Landroidx/media3/decoder/DecoderInputBuffer;->format:Landroidx/media3/common/Format;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroidx/media3/decoder/DecoderInputBuffer;->format:Landroidx/media3/common/Format;

    iget-object v0, v0, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    const-string v1, "audio/opus"

    .line 872
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 873
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->isBypassEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 874
    iget-object v0, p1, Landroidx/media3/decoder/DecoderInputBuffer;->supplementalData:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 875
    iget-object p1, p1, Landroidx/media3/decoder/DecoderInputBuffer;->format:Landroidx/media3/common/Format;

    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/common/Format;

    iget p1, p1, Landroidx/media3/common/Format;->encoderDelay:I

    .line 876
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_0

    .line 877
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 878
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    const-wide/32 v2, 0xbb80

    mul-long v0, v0, v2

    const-wide/32 v2, 0x3b9aca00

    div-long/2addr v0, v2

    long-to-int v1, v0

    .line 879
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0, p1, v1}, Landroidx/media3/exoplayer/audio/AudioSink;->setOffloadDelayPadding(II)V

    :cond_0
    return-void
.end method

.method public handleMessage(ILjava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    const/4 v0, 0x2

    if-eq p1, v0, :cond_6

    const/4 v0, 0x3

    if-eq p1, v0, :cond_5

    const/4 v0, 0x6

    if-eq p1, v0, :cond_4

    const/16 v0, 0xc

    if-eq p1, v0, :cond_3

    const/16 v0, 0x10

    if-eq p1, v0, :cond_2

    const/16 v0, 0x9

    if-eq p1, v0, :cond_1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_0

    .line 863
    invoke-super {p0, p1, p2}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->handleMessage(ILjava/lang/Object;)V

    goto :goto_0

    .line 856
    :cond_0
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-interface {p1, p2}, Landroidx/media3/exoplayer/audio/AudioSink;->setAudioSessionId(I)V

    goto :goto_0

    .line 853
    :cond_1
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-interface {p1, p2}, Landroidx/media3/exoplayer/audio/AudioSink;->setSkipSilenceEnabled(Z)V

    goto :goto_0

    .line 859
    :cond_2
    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->rendererPriority:I

    .line 860
    invoke-direct {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->updateCodecImportance()V

    goto :goto_0

    .line 848
    :cond_3
    sget p1, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v0, 0x17

    if-lt p1, v0, :cond_7

    .line 849
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-static {p1, p2}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer$Api23;->setAudioSinkPreferredDevice(Landroidx/media3/exoplayer/audio/AudioSink;Ljava/lang/Object;)V

    goto :goto_0

    .line 844
    :cond_4
    check-cast p2, Landroidx/media3/common/AuxEffectInfo;

    .line 845
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/media3/common/AuxEffectInfo;

    invoke-interface {p1, p2}, Landroidx/media3/exoplayer/audio/AudioSink;->setAuxEffectInfo(Landroidx/media3/common/AuxEffectInfo;)V

    goto :goto_0

    .line 840
    :cond_5
    check-cast p2, Landroidx/media3/common/AudioAttributes;

    .line 841
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/media3/common/AudioAttributes;

    invoke-interface {p1, p2}, Landroidx/media3/exoplayer/audio/AudioSink;->setAudioAttributes(Landroidx/media3/common/AudioAttributes;)V

    goto :goto_0

    .line 837
    :cond_6
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    invoke-interface {p1, p2}, Landroidx/media3/exoplayer/audio/AudioSink;->setVolume(F)V

    :cond_7
    :goto_0
    return-void
.end method

.method public hasSkippedSilenceSinceLastCall()Z
    .locals 2

    .line 715
    iget-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->hasPendingReportedSkippedSilence:Z

    const/4 v1, 0x0

    .line 716
    iput-boolean v1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->hasPendingReportedSkippedSilence:Z

    return v0
.end method

.method public isEnded()Z
    .locals 1

    .line 697
    invoke-super {p0}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->isEnded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0}, Landroidx/media3/exoplayer/audio/AudioSink;->isEnded()Z

    move-result v0

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

    .line 702
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0}, Landroidx/media3/exoplayer/audio/AudioSink;->hasPendingData()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected onCodecError(Ljava/lang/Exception;)V
    .locals 2

    .line 530
    const-string v0, "MediaCodecAudioRenderer"

    const-string v1, "Audio codec error"

    invoke-static {v0, v1, p1}, Landroidx/media3/common/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 531
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;->audioCodecError(Ljava/lang/Exception;)V

    return-void
.end method

.method protected onCodecInitialized(Ljava/lang/String;Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter$Configuration;JJ)V
    .locals 6

    .line 520
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    move-object v1, p1

    move-wide v2, p3

    move-wide v4, p5

    invoke-virtual/range {v0 .. v5}, Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;->decoderInitialized(Ljava/lang/String;JJ)V

    return-void
.end method

.method protected onCodecReleased(Ljava/lang/String;)V
    .locals 1

    .line 525
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;->decoderReleased(Ljava/lang/String;)V

    return-void
.end method

.method protected onDisabled()V
    .locals 3

    const/4 v0, 0x1

    .line 664
    iput-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSinkNeedsReset:Z

    const/4 v0, 0x0

    .line 665
    iput-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->inputFormat:Landroidx/media3/common/Format;

    .line 667
    :try_start_0
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0}, Landroidx/media3/exoplayer/audio/AudioSink;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 670
    :try_start_1
    invoke-super {p0}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->onDisabled()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 672
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    iget-object v1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->decoderCounters:Landroidx/media3/exoplayer/DecoderCounters;

    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;->disabled(Landroidx/media3/exoplayer/DecoderCounters;)V

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    iget-object v2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->decoderCounters:Landroidx/media3/exoplayer/DecoderCounters;

    invoke-virtual {v1, v2}, Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;->disabled(Landroidx/media3/exoplayer/DecoderCounters;)V

    .line 673
    throw v0

    :catchall_1
    move-exception v0

    .line 670
    :try_start_2
    invoke-super {p0}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->onDisabled()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 672
    iget-object v1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    iget-object v2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->decoderCounters:Landroidx/media3/exoplayer/DecoderCounters;

    invoke-virtual {v1, v2}, Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;->disabled(Landroidx/media3/exoplayer/DecoderCounters;)V

    .line 674
    throw v0

    :catchall_2
    move-exception v0

    .line 672
    iget-object v1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    iget-object v2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->decoderCounters:Landroidx/media3/exoplayer/DecoderCounters;

    invoke-virtual {v1, v2}, Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;->disabled(Landroidx/media3/exoplayer/DecoderCounters;)V

    .line 673
    throw v0
.end method

.method protected onEnabled(ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 626
    invoke-super {p0, p1, p2}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->onEnabled(ZZ)V

    .line 627
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    iget-object p2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->decoderCounters:Landroidx/media3/exoplayer/DecoderCounters;

    invoke-virtual {p1, p2}, Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;->enabled(Landroidx/media3/exoplayer/DecoderCounters;)V

    .line 628
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getConfiguration()Landroidx/media3/exoplayer/RendererConfiguration;

    move-result-object p1

    iget-boolean p1, p1, Landroidx/media3/exoplayer/RendererConfiguration;->tunneling:Z

    if-eqz p1, :cond_0

    .line 629
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {p1}, Landroidx/media3/exoplayer/audio/AudioSink;->enableTunnelingV21()V

    goto :goto_0

    .line 631
    :cond_0
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {p1}, Landroidx/media3/exoplayer/audio/AudioSink;->disableTunneling()V

    .line 633
    :goto_0
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getPlayerId()Landroidx/media3/exoplayer/analytics/PlayerId;

    move-result-object p2

    invoke-interface {p1, p2}, Landroidx/media3/exoplayer/audio/AudioSink;->setPlayerId(Landroidx/media3/exoplayer/analytics/PlayerId;)V

    .line 634
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getClock()Landroidx/media3/common/util/Clock;

    move-result-object p2

    invoke-interface {p1, p2}, Landroidx/media3/exoplayer/audio/AudioSink;->setClock(Landroidx/media3/common/util/Clock;)V

    return-void
.end method

.method protected onInputFormatChanged(Landroidx/media3/exoplayer/FormatHolder;)Landroidx/media3/exoplayer/DecoderReuseEvaluation;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 538
    iget-object v0, p1, Landroidx/media3/exoplayer/FormatHolder;->format:Landroidx/media3/common/Format;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/common/Format;

    .line 539
    iput-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->inputFormat:Landroidx/media3/common/Format;

    .line 540
    invoke-super {p0, p1}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->onInputFormatChanged(Landroidx/media3/exoplayer/FormatHolder;)Landroidx/media3/exoplayer/DecoderReuseEvaluation;

    move-result-object p1

    .line 541
    iget-object v1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->eventDispatcher:Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;

    invoke-virtual {v1, v0, p1}, Landroidx/media3/exoplayer/audio/AudioRendererEventListener$EventDispatcher;->inputFormatChanged(Landroidx/media3/common/Format;Landroidx/media3/exoplayer/DecoderReuseEvaluation;)V

    return-object p1
.end method

.method protected onOutputFormatChanged(Landroidx/media3/common/Format;Landroid/media/MediaFormat;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 550
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->decryptOnlyCodecFormat:Landroidx/media3/common/Format;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move-object p1, v0

    goto/16 :goto_2

    .line 552
    :cond_0
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getCodec()Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter;

    move-result-object v0

    if-nez v0, :cond_1

    goto/16 :goto_2

    .line 555
    :cond_1
    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 557
    iget-object v0, p1, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    const-string v3, "audio/raw"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 559
    iget v0, p1, Landroidx/media3/common/Format;->pcmEncoding:I

    goto :goto_0

    .line 560
    :cond_2
    sget v0, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v4, 0x18

    if-lt v0, v4, :cond_3

    const-string v0, "pcm-encoding"

    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 561
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 562
    :cond_3
    const-string v0, "v-bits-per-sample"

    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 563
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Landroidx/media3/common/util/Util;->getPcmEncoding(I)I

    move-result v0

    goto :goto_0

    :cond_4
    const/4 v0, 0x2

    .line 569
    :goto_0
    new-instance v4, Landroidx/media3/common/Format$Builder;

    invoke-direct {v4}, Landroidx/media3/common/Format$Builder;-><init>()V

    .line 571
    invoke-virtual {v4, v3}, Landroidx/media3/common/Format$Builder;->setSampleMimeType(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;

    move-result-object v3

    .line 572
    invoke-virtual {v3, v0}, Landroidx/media3/common/Format$Builder;->setPcmEncoding(I)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    iget v3, p1, Landroidx/media3/common/Format;->encoderDelay:I

    .line 573
    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setEncoderDelay(I)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    iget v3, p1, Landroidx/media3/common/Format;->encoderPadding:I

    .line 574
    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setEncoderPadding(I)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    iget-object v3, p1, Landroidx/media3/common/Format;->metadata:Landroidx/media3/common/Metadata;

    .line 575
    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setMetadata(Landroidx/media3/common/Metadata;)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    iget-object v3, p1, Landroidx/media3/common/Format;->customData:Ljava/lang/Object;

    .line 576
    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setCustomData(Ljava/lang/Object;)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    iget-object v3, p1, Landroidx/media3/common/Format;->id:Ljava/lang/String;

    .line 577
    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setId(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    iget-object v3, p1, Landroidx/media3/common/Format;->label:Ljava/lang/String;

    .line 578
    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setLabel(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    iget-object v3, p1, Landroidx/media3/common/Format;->labels:Ljava/util/List;

    .line 579
    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setLabels(Ljava/util/List;)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    iget-object v3, p1, Landroidx/media3/common/Format;->language:Ljava/lang/String;

    .line 580
    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setLanguage(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    iget v3, p1, Landroidx/media3/common/Format;->selectionFlags:I

    .line 581
    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setSelectionFlags(I)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    iget v3, p1, Landroidx/media3/common/Format;->roleFlags:I

    .line 582
    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setRoleFlags(I)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    const-string v3, "channel-count"

    .line 583
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setChannelCount(I)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    const-string v3, "sample-rate"

    .line 584
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {v0, p2}, Landroidx/media3/common/Format$Builder;->setSampleRate(I)Landroidx/media3/common/Format$Builder;

    move-result-object p2

    .line 585
    invoke-virtual {p2}, Landroidx/media3/common/Format$Builder;->build()Landroidx/media3/common/Format;

    move-result-object p2

    .line 586
    iget-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->codecNeedsDiscardChannelsWorkaround:Z

    if-eqz v0, :cond_5

    iget v0, p2, Landroidx/media3/common/Format;->channelCount:I

    const/4 v3, 0x6

    if-ne v0, v3, :cond_5

    iget v0, p1, Landroidx/media3/common/Format;->channelCount:I

    if-ge v0, v3, :cond_5

    .line 589
    iget v0, p1, Landroidx/media3/common/Format;->channelCount:I

    new-array v2, v0, [I

    const/4 v0, 0x0

    .line 590
    :goto_1
    iget v3, p1, Landroidx/media3/common/Format;->channelCount:I

    if-ge v0, v3, :cond_6

    .line 591
    aput v0, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 593
    :cond_5
    iget-boolean p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->codecNeedsVorbisToAndroidChannelMappingWorkaround:Z

    if-eqz p1, :cond_6

    .line 594
    iget p1, p2, Landroidx/media3/common/Format;->channelCount:I

    .line 595
    invoke-static {p1}, Landroidx/media3/extractor/VorbisUtil;->getVorbisToAndroidChannelLayoutMapping(I)[I

    move-result-object v2

    :cond_6
    move-object p1, p2

    .line 599
    :goto_2
    :try_start_0
    sget p2, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v0, 0x1d

    if-lt p2, v0, :cond_8

    .line 600
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->isBypassEnabled()Z

    move-result p2

    if-eqz p2, :cond_7

    .line 601
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getConfiguration()Landroidx/media3/exoplayer/RendererConfiguration;

    move-result-object p2

    iget p2, p2, Landroidx/media3/exoplayer/RendererConfiguration;->offloadModePreferred:I

    if-eqz p2, :cond_7

    .line 604
    iget-object p2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getConfiguration()Landroidx/media3/exoplayer/RendererConfiguration;

    move-result-object v0

    iget v0, v0, Landroidx/media3/exoplayer/RendererConfiguration;->offloadModePreferred:I

    invoke-interface {p2, v0}, Landroidx/media3/exoplayer/audio/AudioSink;->setOffloadMode(I)V

    goto :goto_3

    .line 606
    :cond_7
    iget-object p2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {p2, v1}, Landroidx/media3/exoplayer/audio/AudioSink;->setOffloadMode(I)V

    .line 609
    :cond_8
    :goto_3
    iget-object p2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {p2, p1, v1, v2}, Landroidx/media3/exoplayer/audio/AudioSink;->configure(Landroidx/media3/common/Format;I[I)V
    :try_end_0
    .catch Landroidx/media3/exoplayer/audio/AudioSink$ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 611
    iget-object p2, p1, Landroidx/media3/exoplayer/audio/AudioSink$ConfigurationException;->format:Landroidx/media3/common/Format;

    const/16 v0, 0x1389

    invoke-virtual {p0, p1, p2, v0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->createRendererException(Ljava/lang/Throwable;Landroidx/media3/common/Format;I)Landroidx/media3/exoplayer/ExoPlaybackException;

    move-result-object p1

    throw p1
.end method

.method protected onOutputStreamOffsetUsChanged(J)V
    .locals 1

    .line 829
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0, p1, p2}, Landroidx/media3/exoplayer/audio/AudioSink;->setOutputStreamOffsetUs(J)V

    return-void
.end method

.method protected onPositionDiscontinuity()V
    .locals 1

    const/4 v0, 0x1

    .line 620
    iput-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->allowPositionDiscontinuity:Z

    return-void
.end method

.method protected onPositionReset(JZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 639
    invoke-super {p0, p1, p2, p3}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->onPositionReset(JZ)V

    .line 640
    iget-object p3, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {p3}, Landroidx/media3/exoplayer/audio/AudioSink;->flush()V

    .line 642
    iput-wide p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->currentPositionUs:J

    const/4 p1, 0x0

    .line 643
    iput-boolean p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->hasPendingReportedSkippedSilence:Z

    const/4 p1, 0x1

    .line 644
    iput-boolean p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->allowPositionDiscontinuity:Z

    return-void
.end method

.method protected onProcessedStreamChange()V
    .locals 1

    .line 732
    invoke-super {p0}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->onProcessedStreamChange()V

    .line 733
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0}, Landroidx/media3/exoplayer/audio/AudioSink;->handleDiscontinuity()V

    return-void
.end method

.method protected onRelease()V
    .locals 1

    .line 692
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0}, Landroidx/media3/exoplayer/audio/AudioSink;->release()V

    return-void
.end method

.method protected onReset()V
    .locals 3

    const/4 v0, 0x0

    .line 679
    iput-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->hasPendingReportedSkippedSilence:Z

    .line 681
    :try_start_0
    invoke-super {p0}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->onReset()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 683
    iget-boolean v1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSinkNeedsReset:Z

    if-eqz v1, :cond_0

    .line 684
    iput-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSinkNeedsReset:Z

    .line 685
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0}, Landroidx/media3/exoplayer/audio/AudioSink;->reset()V

    :cond_0
    return-void

    :catchall_0
    move-exception v1

    .line 683
    iget-boolean v2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSinkNeedsReset:Z

    if-eqz v2, :cond_1

    .line 684
    iput-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSinkNeedsReset:Z

    .line 685
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0}, Landroidx/media3/exoplayer/audio/AudioSink;->reset()V

    .line 687
    :cond_1
    throw v1
.end method

.method protected onStarted()V
    .locals 1

    .line 649
    invoke-super {p0}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->onStarted()V

    .line 650
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0}, Landroidx/media3/exoplayer/audio/AudioSink;->play()V

    const/4 v0, 0x1

    .line 651
    iput-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->isStarted:Z

    return-void
.end method

.method protected onStopped()V
    .locals 1

    .line 656
    invoke-direct {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->updateCurrentPosition()V

    const/4 v0, 0x0

    .line 657
    iput-boolean v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->isStarted:Z

    .line 658
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0}, Landroidx/media3/exoplayer/audio/AudioSink;->pause()V

    .line 659
    invoke-super {p0}, Landroidx/media3/exoplayer/mediacodec/MediaCodecRenderer;->onStopped()V

    return-void
.end method

.method protected processOutputBuffer(JJLandroidx/media3/exoplayer/mediacodec/MediaCodecAdapter;Ljava/nio/ByteBuffer;IIIJZZLandroidx/media3/common/Format;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 750
    invoke-static {p6}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 753
    iput-wide p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->nextBufferToWritePresentationTimeUs:J

    .line 755
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->decryptOnlyCodecFormat:Landroidx/media3/common/Format;

    const/4 p2, 0x1

    const/4 p3, 0x0

    if-eqz p1, :cond_0

    and-int/lit8 p1, p8, 0x2

    if-eqz p1, :cond_0

    .line 758
    invoke-static {p5}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter;

    invoke-interface {p1, p7, p3}, Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter;->releaseOutputBuffer(IZ)V

    return p2

    :cond_0
    if-eqz p12, :cond_2

    if-eqz p5, :cond_1

    .line 764
    invoke-interface {p5, p7, p3}, Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter;->releaseOutputBuffer(IZ)V

    .line 766
    :cond_1
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->decoderCounters:Landroidx/media3/exoplayer/DecoderCounters;

    iget p3, p1, Landroidx/media3/exoplayer/DecoderCounters;->skippedOutputBufferCount:I

    add-int/2addr p3, p9

    iput p3, p1, Landroidx/media3/exoplayer/DecoderCounters;->skippedOutputBufferCount:I

    .line 767
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {p1}, Landroidx/media3/exoplayer/audio/AudioSink;->handleDiscontinuity()V

    return p2

    .line 773
    :cond_2
    :try_start_0
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {p1, p6, p10, p11, p9}, Landroidx/media3/exoplayer/audio/AudioSink;->handleBuffer(Ljava/nio/ByteBuffer;JI)Z

    move-result p1
    :try_end_0
    .catch Landroidx/media3/exoplayer/audio/AudioSink$InitializationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroidx/media3/exoplayer/audio/AudioSink$WriteException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_4

    if-eqz p5, :cond_3

    .line 796
    invoke-interface {p5, p7, p3}, Landroidx/media3/exoplayer/mediacodec/MediaCodecAdapter;->releaseOutputBuffer(IZ)V

    .line 798
    :cond_3
    iget-object p1, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->decoderCounters:Landroidx/media3/exoplayer/DecoderCounters;

    iget p3, p1, Landroidx/media3/exoplayer/DecoderCounters;->renderedOutputBufferCount:I

    add-int/2addr p3, p9

    iput p3, p1, Landroidx/media3/exoplayer/DecoderCounters;->renderedOutputBufferCount:I

    return p2

    .line 803
    :cond_4
    iput-wide p10, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->nextBufferToWritePresentationTimeUs:J

    return p3

    :catch_0
    move-exception p1

    .line 784
    iget-boolean p2, p1, Landroidx/media3/exoplayer/audio/AudioSink$WriteException;->isRecoverable:Z

    .line 788
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->isBypassEnabled()Z

    move-result p3

    if-eqz p3, :cond_5

    .line 789
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getConfiguration()Landroidx/media3/exoplayer/RendererConfiguration;

    move-result-object p3

    iget p3, p3, Landroidx/media3/exoplayer/RendererConfiguration;->offloadModePreferred:I

    if-eqz p3, :cond_5

    const/16 p3, 0x138b

    goto :goto_0

    :cond_5
    const/16 p3, 0x138a

    .line 784
    :goto_0
    invoke-virtual {p0, p1, p14, p2, p3}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->createRendererException(Ljava/lang/Throwable;Landroidx/media3/common/Format;ZI)Landroidx/media3/exoplayer/ExoPlaybackException;

    move-result-object p1

    throw p1

    :catch_1
    move-exception p1

    .line 775
    iget-object p2, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->inputFormat:Landroidx/media3/common/Format;

    iget-boolean p3, p1, Landroidx/media3/exoplayer/audio/AudioSink$InitializationException;->isRecoverable:Z

    .line 779
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->isBypassEnabled()Z

    move-result p4

    if-eqz p4, :cond_6

    .line 780
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getConfiguration()Landroidx/media3/exoplayer/RendererConfiguration;

    move-result-object p4

    iget p4, p4, Landroidx/media3/exoplayer/RendererConfiguration;->offloadModePreferred:I

    if-eqz p4, :cond_6

    const/16 p4, 0x138c

    goto :goto_1

    :cond_6
    const/16 p4, 0x1389

    .line 775
    :goto_1
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->createRendererException(Ljava/lang/Throwable;Landroidx/media3/common/Format;ZI)Landroidx/media3/exoplayer/ExoPlaybackException;

    move-result-object p1

    throw p1
.end method

.method protected renderToEndOfStream()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 812
    :try_start_0
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0}, Landroidx/media3/exoplayer/audio/AudioSink;->playToEndOfStream()V

    .line 813
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getLastBufferInStreamPresentationTimeUs()J

    move-result-wide v0

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 814
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getLastBufferInStreamPresentationTimeUs()J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->nextBufferToWritePresentationTimeUs:J
    :try_end_0
    .catch Landroidx/media3/exoplayer/audio/AudioSink$WriteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    .line 817
    iget-object v1, v0, Landroidx/media3/exoplayer/audio/AudioSink$WriteException;->format:Landroidx/media3/common/Format;

    iget-boolean v2, v0, Landroidx/media3/exoplayer/audio/AudioSink$WriteException;->isRecoverable:Z

    .line 821
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->isBypassEnabled()Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v3, 0x138b

    goto :goto_0

    :cond_1
    const/16 v3, 0x138a

    .line 817
    :goto_0
    invoke-virtual {p0, v0, v1, v2, v3}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->createRendererException(Ljava/lang/Throwable;Landroidx/media3/common/Format;ZI)Landroidx/media3/exoplayer/ExoPlaybackException;

    move-result-object v0

    throw v0
.end method

.method public setPlaybackParameters(Landroidx/media3/common/PlaybackParameters;)V
    .locals 1

    .line 722
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/audio/AudioSink;->setPlaybackParameters(Landroidx/media3/common/PlaybackParameters;)V

    return-void
.end method

.method protected shouldUseBypass(Landroidx/media3/common/Format;)Z
    .locals 3

    .line 417
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getConfiguration()Landroidx/media3/exoplayer/RendererConfiguration;

    move-result-object v0

    iget v0, v0, Landroidx/media3/exoplayer/RendererConfiguration;->offloadModePreferred:I

    if-eqz v0, :cond_1

    .line 418
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getAudioOffloadSupport(Landroidx/media3/common/Format;)I

    move-result v0

    and-int/lit16 v1, v0, 0x200

    if-eqz v1, :cond_1

    .line 420
    invoke-virtual {p0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getConfiguration()Landroidx/media3/exoplayer/RendererConfiguration;

    move-result-object v1

    iget v1, v1, Landroidx/media3/exoplayer/RendererConfiguration;->offloadModePreferred:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    and-int/lit16 v0, v0, 0x400

    if-nez v0, :cond_0

    iget v0, p1, Landroidx/media3/common/Format;->encoderDelay:I

    if-nez v0, :cond_1

    iget v0, p1, Landroidx/media3/common/Format;->encoderPadding:I

    if-nez v0, :cond_1

    :cond_0
    const/4 p1, 0x1

    return p1

    .line 427
    :cond_1
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/audio/AudioSink;->supportsFormat(Landroidx/media3/common/Format;)Z

    move-result p1

    return p1
.end method

.method protected supportsFormat(Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroidx/media3/common/Format;)I
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/mediacodec/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .line 278
    iget-object v0, p2, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-static {v0}, Landroidx/media3/common/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 279
    invoke-static {v1}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->create(I)I

    move-result p1

    return p1

    .line 282
    :cond_0
    sget v0, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v0, v2, :cond_1

    const/16 v0, 0x20

    const/16 v4, 0x20

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    .line 283
    :goto_0
    iget v0, p2, Landroidx/media3/common/Format;->cryptoType:I

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    .line 284
    :goto_1
    invoke-static {p2}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->supportsFormatDrm(Landroidx/media3/common/Format;)Z

    move-result v3

    const/16 v5, 0x8

    const/4 v6, 0x4

    if-eqz v3, :cond_5

    if-eqz v0, :cond_3

    .line 290
    invoke-static {}, Landroidx/media3/exoplayer/mediacodec/MediaCodecUtil;->getDecryptOnlyDecoderInfo()Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 291
    :cond_3
    invoke-direct {p0, p2}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getAudioOffloadSupport(Landroidx/media3/common/Format;)I

    move-result v0

    .line 292
    iget-object v7, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v7, p2}, Landroidx/media3/exoplayer/audio/AudioSink;->supportsFormat(Landroidx/media3/common/Format;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 293
    invoke-static {v6, v5, v4, v0}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->create(IIII)I

    move-result p1

    return p1

    :cond_4
    move v7, v0

    goto :goto_2

    :cond_5
    const/4 v7, 0x0

    .line 299
    :goto_2
    const-string v0, "audio/raw"

    iget-object v8, p2, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    invoke-interface {v0, p2}, Landroidx/media3/exoplayer/audio/AudioSink;->supportsFormat(Landroidx/media3/common/Format;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 300
    invoke-static {v2}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->create(I)I

    move-result p1

    return p1

    .line 303
    :cond_6
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    iget v8, p2, Landroidx/media3/common/Format;->channelCount:I

    iget v9, p2, Landroidx/media3/common/Format;->sampleRate:I

    const/4 v10, 0x2

    .line 304
    invoke-static {v10, v8, v9}, Landroidx/media3/common/util/Util;->getPcmFormat(III)Landroidx/media3/common/Format;

    move-result-object v8

    .line 303
    invoke-interface {v0, v8}, Landroidx/media3/exoplayer/audio/AudioSink;->supportsFormat(Landroidx/media3/common/Format;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 305
    invoke-static {v2}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->create(I)I

    move-result p1

    return p1

    .line 307
    :cond_7
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->audioSink:Landroidx/media3/exoplayer/audio/AudioSink;

    .line 308
    invoke-static {p1, p2, v1, v0}, Landroidx/media3/exoplayer/audio/MediaCodecAudioRenderer;->getDecoderInfos(Landroidx/media3/exoplayer/mediacodec/MediaCodecSelector;Landroidx/media3/common/Format;ZLandroidx/media3/exoplayer/audio/AudioSink;)Ljava/util/List;

    move-result-object p1

    .line 309
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 310
    invoke-static {v2}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->create(I)I

    move-result p1

    return p1

    :cond_8
    if-nez v3, :cond_9

    .line 313
    invoke-static {v10}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->create(I)I

    move-result p1

    return p1

    .line 317
    :cond_9
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;

    .line 318
    invoke-virtual {v0, p2}, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->isFormatSupported(Landroidx/media3/common/Format;)Z

    move-result v3

    if-nez v3, :cond_b

    const/4 v8, 0x1

    .line 322
    :goto_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v9

    if-ge v8, v9, :cond_b

    .line 323
    invoke-interface {p1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;

    .line 324
    invoke-virtual {v9, p2}, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->isFormatSupported(Landroidx/media3/common/Format;)Z

    move-result v10

    if-eqz v10, :cond_a

    move-object v0, v9

    const/4 p1, 0x0

    goto :goto_4

    :cond_a
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    :cond_b
    move v2, v3

    const/4 p1, 0x1

    :goto_4
    if-eqz v2, :cond_c

    const/4 v3, 0x4

    goto :goto_5

    :cond_c
    const/4 v3, 0x3

    :goto_5
    if-eqz v2, :cond_d

    .line 336
    invoke-virtual {v0, p2}, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->isSeamlessAdaptationSupported(Landroidx/media3/common/Format;)Z

    move-result p2

    if-eqz p2, :cond_d

    const/16 p2, 0x10

    goto :goto_6

    :cond_d
    const/16 p2, 0x8

    .line 341
    :goto_6
    iget-boolean v0, v0, Landroidx/media3/exoplayer/mediacodec/MediaCodecInfo;->hardwareAccelerated:Z

    if-eqz v0, :cond_e

    const/16 v0, 0x40

    const/16 v5, 0x40

    goto :goto_7

    :cond_e
    const/4 v5, 0x0

    :goto_7
    if-eqz p1, :cond_f

    const/16 v1, 0x80

    const/16 v6, 0x80

    goto :goto_8

    :cond_f
    const/4 v6, 0x0

    :goto_8
    move v2, v3

    move v3, p2

    .line 346
    invoke-static/range {v2 .. v7}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->create(IIIIII)I

    move-result p1

    return p1
.end method
