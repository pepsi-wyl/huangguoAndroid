.class final Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;
.super Ljava/lang/Object;
.source "MediaExtractorCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/MediaExtractorCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MediaExtractorTrack"
.end annotation


# instance fields
.field public final compatibilityTrackMimeType:Ljava/lang/String;

.field public final isCompatibilityTrack:Z

.field public final sampleQueue:Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;


# direct methods
.method private constructor <init>(Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;ZLjava/lang/String;)V
    .locals 0

    .line 632
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 633
    iput-object p1, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->sampleQueue:Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;

    .line 634
    iput-boolean p2, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->isCompatibilityTrack:Z

    .line 635
    iput-object p3, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->compatibilityTrackMimeType:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;ZLjava/lang/String;Landroidx/media3/exoplayer/MediaExtractorCompat$1;)V
    .locals 0

    .line 623
    invoke-direct {p0, p1, p2, p3}, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;-><init>(Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;ZLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public createDownstreamMediaFormat(Landroidx/media3/exoplayer/FormatHolder;Landroidx/media3/decoder/DecoderInputBuffer;)Landroid/media/MediaFormat;
    .locals 3

    .line 640
    invoke-virtual {p1}, Landroidx/media3/exoplayer/FormatHolder;->clear()V

    .line 641
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->sampleQueue:Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, p1, p2, v1, v2}, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->read(Landroidx/media3/exoplayer/FormatHolder;Landroidx/media3/decoder/DecoderInputBuffer;IZ)I

    .line 646
    iget-object p2, p1, Landroidx/media3/exoplayer/FormatHolder;->format:Landroidx/media3/common/Format;

    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/media3/common/Format;

    .line 647
    invoke-static {p2}, Landroidx/media3/common/util/MediaFormatUtil;->createMediaFormatFromFormat(Landroidx/media3/common/Format;)Landroid/media/MediaFormat;

    move-result-object p2

    .line 648
    invoke-virtual {p1}, Landroidx/media3/exoplayer/FormatHolder;->clear()V

    .line 649
    iget-object p1, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->compatibilityTrackMimeType:Ljava/lang/String;

    if-eqz p1, :cond_1

    .line 650
    sget p1, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v0, 0x1d

    if-lt p1, v0, :cond_0

    .line 651
    const-string p1, "codecs-string"

    invoke-static {p2, p1}, Landroidx/media3/exoplayer/ExoPlayerImpl$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/MediaFormat;Ljava/lang/String;)V

    .line 653
    :cond_0
    const-string p1, "mime"

    iget-object v0, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->compatibilityTrackMimeType:Ljava/lang/String;

    invoke-virtual {p2, p1, v0}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-object p2
.end method

.method public discardFrontSample()V
    .locals 2

    .line 659
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->sampleQueue:Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->skip(I)V

    .line 660
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->sampleQueue:Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->discardToRead()V

    return-void
.end method

.method public getIdOfBackingTrack()I
    .locals 1

    .line 664
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->sampleQueue:Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;

    iget v0, v0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->trackId:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 669
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->sampleQueue:Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;

    iget-boolean v1, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->isCompatibilityTrack:Z

    .line 671
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v2, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorTrack;->compatibilityTrackMimeType:Ljava/lang/String;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    .line 669
    const-string v0, "MediaExtractorSampleQueue: %s, isCompatibilityTrack: %s, compatibilityTrackMimeType: %s"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
