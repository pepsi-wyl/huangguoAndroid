.class final Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;
.super Landroidx/media3/exoplayer/source/SampleQueue;
.source "MediaExtractorCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/MediaExtractorCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MediaExtractorSampleQueue"
.end annotation


# instance fields
.field private compatibilityTrackIndex:I

.field private mainTrackIndex:I

.field final synthetic this$0:Landroidx/media3/exoplayer/MediaExtractorCompat;

.field public final trackId:I


# direct methods
.method public constructor <init>(Landroidx/media3/exoplayer/MediaExtractorCompat;Landroidx/media3/exoplayer/upstream/Allocator;I)V
    .locals 0

    .line 681
    iput-object p1, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->this$0:Landroidx/media3/exoplayer/MediaExtractorCompat;

    const/4 p1, 0x0

    .line 684
    invoke-direct {p0, p2, p1, p1}, Landroidx/media3/exoplayer/source/SampleQueue;-><init>(Landroidx/media3/exoplayer/upstream/Allocator;Landroidx/media3/exoplayer/drm/DrmSessionManager;Landroidx/media3/exoplayer/drm/DrmSessionEventListener$EventDispatcher;)V

    .line 685
    iput p3, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->trackId:I

    const/4 p1, -0x1

    .line 686
    iput p1, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->mainTrackIndex:I

    .line 687
    iput p1, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->compatibilityTrackIndex:I

    return-void
.end method


# virtual methods
.method public getAdjustedUpstreamFormat(Landroidx/media3/common/Format;)Landroidx/media3/common/Format;
    .locals 1

    .line 702
    invoke-virtual {p0}, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->getUpstreamFormat()Landroidx/media3/common/Format;

    move-result-object v0

    if-nez v0, :cond_0

    .line 703
    iget-object v0, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->this$0:Landroidx/media3/exoplayer/MediaExtractorCompat;

    invoke-static {v0, p0, p1}, Landroidx/media3/exoplayer/MediaExtractorCompat;->access$600(Landroidx/media3/exoplayer/MediaExtractorCompat;Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;Landroidx/media3/common/Format;)V

    .line 705
    :cond_0
    invoke-super {p0, p1}, Landroidx/media3/exoplayer/source/SampleQueue;->getAdjustedUpstreamFormat(Landroidx/media3/common/Format;)Landroidx/media3/common/Format;

    move-result-object p1

    return-object p1
.end method

.method public sampleMetadata(JIIILandroidx/media3/extractor/TrackOutput$CryptoData;)V
    .locals 8

    const v0, -0x20000001

    and-int v4, p3, v0

    .line 714
    iget p3, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->compatibilityTrackIndex:I

    const/4 v0, -0x1

    if-eq p3, v0, :cond_0

    .line 715
    iget-object p3, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->this$0:Landroidx/media3/exoplayer/MediaExtractorCompat;

    invoke-static {p3}, Landroidx/media3/exoplayer/MediaExtractorCompat;->access$700(Landroidx/media3/exoplayer/MediaExtractorCompat;)Ljava/util/ArrayDeque;

    move-result-object p3

    iget v1, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->compatibilityTrackIndex:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p3, v1}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 717
    :cond_0
    iget p3, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->mainTrackIndex:I

    if-eq p3, v0, :cond_1

    const/4 p3, 0x1

    goto :goto_0

    :cond_1
    const/4 p3, 0x0

    :goto_0
    invoke-static {p3}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 718
    iget-object p3, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->this$0:Landroidx/media3/exoplayer/MediaExtractorCompat;

    invoke-static {p3}, Landroidx/media3/exoplayer/MediaExtractorCompat;->access$700(Landroidx/media3/exoplayer/MediaExtractorCompat;)Ljava/util/ArrayDeque;

    move-result-object p3

    iget v0, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->mainTrackIndex:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V

    move-object v1, p0

    move-wide v2, p1

    move v5, p4

    move v6, p5

    move-object v7, p6

    .line 719
    invoke-super/range {v1 .. v7}, Landroidx/media3/exoplayer/source/SampleQueue;->sampleMetadata(JIIILandroidx/media3/extractor/TrackOutput$CryptoData;)V

    return-void
.end method

.method public setCompatibilityTrackIndex(I)V
    .locals 0

    .line 695
    iput p1, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->compatibilityTrackIndex:I

    return-void
.end method

.method public setMainTrackIndex(I)V
    .locals 0

    .line 691
    iput p1, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->mainTrackIndex:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 724
    iget v0, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->trackId:I

    .line 726
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->mainTrackIndex:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Landroidx/media3/exoplayer/MediaExtractorCompat$MediaExtractorSampleQueue;->compatibilityTrackIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    .line 724
    const-string v0, "trackId: %s, mainTrackIndex: %s, compatibilityTrackIndex: %s"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
