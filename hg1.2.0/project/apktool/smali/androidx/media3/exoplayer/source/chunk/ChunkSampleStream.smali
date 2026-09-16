.class public Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;
.super Ljava/lang/Object;
.source "ChunkSampleStream.java"

# interfaces
.implements Landroidx/media3/exoplayer/source/SampleStream;
.implements Landroidx/media3/exoplayer/source/SequenceableLoader;
.implements Landroidx/media3/exoplayer/upstream/Loader$Callback;
.implements Landroidx/media3/exoplayer/upstream/Loader$ReleaseCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$EmbeddedSampleStream;,
        Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$ReleaseCallback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Landroidx/media3/exoplayer/source/chunk/ChunkSource;",
        ">",
        "Ljava/lang/Object;",
        "Landroidx/media3/exoplayer/source/SampleStream;",
        "Landroidx/media3/exoplayer/source/SequenceableLoader;",
        "Landroidx/media3/exoplayer/upstream/Loader$Callback<",
        "Landroidx/media3/exoplayer/source/chunk/Chunk;",
        ">;",
        "Landroidx/media3/exoplayer/upstream/Loader$ReleaseCallback;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ChunkSampleStream"


# instance fields
.field private final callback:Landroidx/media3/exoplayer/source/SequenceableLoader$Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/media3/exoplayer/source/SequenceableLoader$Callback<",
            "Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private canceledMediaChunk:Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

.field private final chunkOutput:Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;

.field private final chunkSource:Landroidx/media3/exoplayer/source/chunk/ChunkSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

.field private final embeddedTrackFormats:[Landroidx/media3/common/Format;

.field private final embeddedTrackTypes:[I

.field private final embeddedTracksSelected:[Z

.field private lastSeekPositionUs:J

.field private final loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

.field private final loader:Landroidx/media3/exoplayer/upstream/Loader;

.field private loadingChunk:Landroidx/media3/exoplayer/source/chunk/Chunk;

.field loadingFinished:Z

.field private final mediaChunks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;",
            ">;"
        }
    .end annotation
.end field

.field private final mediaSourceEventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

.field private final nextChunkHolder:Landroidx/media3/exoplayer/source/chunk/ChunkHolder;

.field private nextNotifyPrimaryFormatMediaChunkIndex:I

.field private pendingResetPositionUs:J

.field private primaryDownstreamTrackFormat:Landroidx/media3/common/Format;

.field private final primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

.field public final primaryTrackType:I

.field private final readOnlyMediaChunks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;",
            ">;"
        }
    .end annotation
.end field

.field private releaseCallback:Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$ReleaseCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$ReleaseCallback<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I[I[Landroidx/media3/common/Format;Landroidx/media3/exoplayer/source/chunk/ChunkSource;Landroidx/media3/exoplayer/source/SequenceableLoader$Callback;Landroidx/media3/exoplayer/upstream/Allocator;JLandroidx/media3/exoplayer/drm/DrmSessionManager;Landroidx/media3/exoplayer/drm/DrmSessionEventListener$EventDispatcher;Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[I[",
            "Landroidx/media3/common/Format;",
            "TT;",
            "Landroidx/media3/exoplayer/source/SequenceableLoader$Callback<",
            "Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream<",
            "TT;>;>;",
            "Landroidx/media3/exoplayer/upstream/Allocator;",
            "J",
            "Landroidx/media3/exoplayer/drm/DrmSessionManager;",
            "Landroidx/media3/exoplayer/drm/DrmSessionEventListener$EventDispatcher;",
            "Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;",
            "Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;",
            ")V"
        }
    .end annotation

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    iput p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primaryTrackType:I

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 131
    new-array p2, v0, [I

    :cond_0
    iput-object p2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedTrackTypes:[I

    if-nez p3, :cond_1

    .line 132
    new-array p3, v0, [Landroidx/media3/common/Format;

    :cond_1
    iput-object p3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedTrackFormats:[Landroidx/media3/common/Format;

    .line 133
    iput-object p4, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkSource:Landroidx/media3/exoplayer/source/chunk/ChunkSource;

    .line 134
    iput-object p5, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->callback:Landroidx/media3/exoplayer/source/SequenceableLoader$Callback;

    .line 135
    iput-object p12, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaSourceEventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    .line 136
    iput-object p11, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    .line 137
    new-instance p3, Landroidx/media3/exoplayer/upstream/Loader;

    const-string p4, "ChunkSampleStream"

    invoke-direct {p3, p4}, Landroidx/media3/exoplayer/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object p3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    .line 138
    new-instance p3, Landroidx/media3/exoplayer/source/chunk/ChunkHolder;

    invoke-direct {p3}, Landroidx/media3/exoplayer/source/chunk/ChunkHolder;-><init>()V

    iput-object p3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextChunkHolder:Landroidx/media3/exoplayer/source/chunk/ChunkHolder;

    .line 139
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    .line 140
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p3

    iput-object p3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->readOnlyMediaChunks:Ljava/util/List;

    .line 142
    array-length p2, p2

    .line 143
    new-array p3, p2, [Landroidx/media3/exoplayer/source/SampleQueue;

    iput-object p3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    .line 144
    new-array p3, p2, [Z

    iput-object p3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedTracksSelected:[Z

    add-int/lit8 p3, p2, 0x1

    .line 145
    new-array p4, p3, [I

    .line 146
    new-array p3, p3, [Landroidx/media3/exoplayer/source/SampleQueue;

    .line 149
    invoke-static {p6, p9, p10}, Landroidx/media3/exoplayer/source/SampleQueue;->createWithDrm(Landroidx/media3/exoplayer/upstream/Allocator;Landroidx/media3/exoplayer/drm/DrmSessionManager;Landroidx/media3/exoplayer/drm/DrmSessionEventListener$EventDispatcher;)Landroidx/media3/exoplayer/source/SampleQueue;

    move-result-object p5

    iput-object p5, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    .line 150
    aput p1, p4, v0

    .line 151
    aput-object p5, p3, v0

    :goto_0
    if-ge v0, p2, :cond_2

    .line 154
    invoke-static {p6}, Landroidx/media3/exoplayer/source/SampleQueue;->createWithoutDrm(Landroidx/media3/exoplayer/upstream/Allocator;)Landroidx/media3/exoplayer/source/SampleQueue;

    move-result-object p1

    .line 155
    iget-object p5, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    aput-object p1, p5, v0

    add-int/lit8 p5, v0, 0x1

    .line 156
    aput-object p1, p3, p5

    .line 157
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedTrackTypes:[I

    aget p1, p1, v0

    aput p1, p4, p5

    move v0, p5

    goto :goto_0

    .line 160
    :cond_2
    new-instance p1, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;

    invoke-direct {p1, p4, p3}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;-><init>([I[Landroidx/media3/exoplayer/source/SampleQueue;)V

    iput-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkOutput:Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;

    .line 161
    iput-wide p7, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    .line 162
    iput-wide p7, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->lastSeekPositionUs:J

    return-void
.end method

.method static synthetic access$000(Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;)Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;
    .locals 0

    .line 58
    iget-object p0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->canceledMediaChunk:Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    return-object p0
.end method

.method static synthetic access$100(Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;)[Z
    .locals 0

    .line 58
    iget-object p0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedTracksSelected:[Z

    return-object p0
.end method

.method static synthetic access$200(Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;)[I
    .locals 0

    .line 58
    iget-object p0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedTrackTypes:[I

    return-object p0
.end method

.method static synthetic access$300(Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;)[Landroidx/media3/common/Format;
    .locals 0

    .line 58
    iget-object p0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedTrackFormats:[Landroidx/media3/common/Format;

    return-object p0
.end method

.method static synthetic access$400(Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;)J
    .locals 2

    .line 58
    iget-wide v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->lastSeekPositionUs:J

    return-wide v0
.end method

.method static synthetic access$500(Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;)Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;
    .locals 0

    .line 58
    iget-object p0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaSourceEventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    return-object p0
.end method

.method private discardDownstreamMediaChunks(I)V
    .locals 2

    const/4 v0, 0x0

    .line 731
    invoke-direct {p0, p1, v0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleIndexToMediaChunkIndex(II)I

    move-result p1

    .line 733
    iget v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextNotifyPrimaryFormatMediaChunkIndex:I

    .line 734
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    if-lez p1, :cond_0

    .line 736
    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-static {v1, v0, p1}, Landroidx/media3/common/util/Util;->removeRange(Ljava/util/List;II)V

    .line 737
    iget v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextNotifyPrimaryFormatMediaChunkIndex:I

    sub-int/2addr v0, p1

    iput v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextNotifyPrimaryFormatMediaChunkIndex:I

    :cond_0
    return-void
.end method

.method private discardUpstream(I)V
    .locals 7

    .line 674
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 676
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    const/4 v1, -0x1

    if-ge p1, v0, :cond_1

    .line 679
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->haveReadFromMediaChunk(I)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    :goto_1
    if-ne p1, v1, :cond_2

    return-void

    .line 690
    :cond_2
    invoke-direct {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->getLastMediaChunk()Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    move-result-object v0

    iget-wide v5, v0, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->endTimeUs:J

    .line 691
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->discardUpstreamMediaChunksFromIndex(I)Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    move-result-object p1

    .line 692
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 693
    iget-wide v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->lastSeekPositionUs:J

    iput-wide v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    :cond_3
    const/4 v0, 0x0

    .line 695
    iput-boolean v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingFinished:Z

    .line 696
    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaSourceEventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    iget v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primaryTrackType:I

    iget-wide v3, p1, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->startTimeUs:J

    invoke-virtual/range {v1 .. v6}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->upstreamDiscarded(IJJ)V

    return-void
.end method

.method private discardUpstreamMediaChunksFromIndex(I)Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;
    .locals 3

    .line 798
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    .line 799
    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {v1, p1, v2}, Landroidx/media3/common/util/Util;->removeRange(Ljava/util/List;II)V

    .line 800
    iget p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextNotifyPrimaryFormatMediaChunkIndex:I

    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    .line 801
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextNotifyPrimaryFormatMediaChunkIndex:I

    .line 802
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->getFirstSampleIndex(I)I

    move-result v2

    invoke-virtual {p1, v2}, Landroidx/media3/exoplayer/source/SampleQueue;->discardUpstreamSamples(I)V

    .line 803
    :goto_0
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 804
    aget-object p1, p1, v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->getFirstSampleIndex(I)I

    move-result v2

    invoke-virtual {p1, v2}, Landroidx/media3/exoplayer/source/SampleQueue;->discardUpstreamSamples(I)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private getLastMediaChunk()Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;
    .locals 2

    .line 787
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    return-object v0
.end method

.method private haveReadFromMediaChunk(I)Z
    .locals 5

    .line 713
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    .line 714
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/source/SampleQueue;->getReadIndex()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->getFirstSampleIndex(I)I

    move-result v2

    const/4 v3, 0x1

    if-le v0, v2, :cond_0

    return v3

    :cond_0
    const/4 v0, 0x0

    .line 717
    :cond_1
    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    array-length v4, v2

    if-ge v0, v4, :cond_2

    .line 718
    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroidx/media3/exoplayer/source/SampleQueue;->getReadIndex()I

    move-result v2

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->getFirstSampleIndex(I)I

    move-result v4

    if-le v2, v4, :cond_1

    return v3

    :cond_2
    return v1
.end method

.method private isMediaChunk(Landroidx/media3/exoplayer/source/chunk/Chunk;)Z
    .locals 0

    .line 701
    instance-of p1, p1, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    return p1
.end method

.method private maybeNotifyPrimaryTrackFormatChanged()V
    .locals 3

    .line 742
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/source/SampleQueue;->getReadIndex()I

    move-result v0

    .line 743
    iget v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextNotifyPrimaryFormatMediaChunkIndex:I

    add-int/lit8 v1, v1, -0x1

    .line 744
    invoke-direct {p0, v0, v1}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleIndexToMediaChunkIndex(II)I

    move-result v0

    .line 746
    :goto_0
    iget v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextNotifyPrimaryFormatMediaChunkIndex:I

    if-gt v1, v0, :cond_0

    add-int/lit8 v2, v1, 0x1

    .line 747
    iput v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextNotifyPrimaryFormatMediaChunkIndex:I

    invoke-direct {p0, v1}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->maybeNotifyPrimaryTrackFormatChanged(I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private maybeNotifyPrimaryTrackFormatChanged(I)V
    .locals 8

    .line 752
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    .line 753
    iget-object v7, p1, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->trackFormat:Landroidx/media3/common/Format;

    .line 754
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primaryDownstreamTrackFormat:Landroidx/media3/common/Format;

    invoke-virtual {v7, v0}, Landroidx/media3/common/Format;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 755
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaSourceEventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    iget v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primaryTrackType:I

    iget v3, p1, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->trackSelectionReason:I

    iget-object v4, p1, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->trackSelectionData:Ljava/lang/Object;

    iget-wide v5, p1, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->startTimeUs:J

    move-object v2, v7

    invoke-virtual/range {v0 .. v6}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->downstreamFormatChanged(ILandroidx/media3/common/Format;ILjava/lang/Object;J)V

    .line 762
    :cond_0
    iput-object v7, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primaryDownstreamTrackFormat:Landroidx/media3/common/Format;

    return-void
.end method

.method private primarySampleIndexToMediaChunkIndex(II)I
    .locals 2

    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 778
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p2, v0, :cond_1

    .line 779
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->getFirstSampleIndex(I)I

    move-result v0

    if-le v0, p1, :cond_0

    add-int/lit8 p2, p2, -0x1

    return p2

    .line 783
    :cond_1
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    return p1
.end method

.method private resetSampleQueues()V
    .locals 4

    .line 705
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/source/SampleQueue;->reset()V

    .line 706
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 707
    invoke-virtual {v3}, Landroidx/media3/exoplayer/source/SampleQueue;->reset()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public continueLoading(Landroidx/media3/exoplayer/LoadingInfo;)Z
    .locals 25

    move-object/from16 v0, p0

    .line 566
    iget-boolean v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingFinished:Z

    const/4 v2, 0x0

    if-nez v1, :cond_8

    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v1}, Landroidx/media3/exoplayer/upstream/Loader;->isLoading()Z

    move-result v1

    if-nez v1, :cond_8

    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v1}, Landroidx/media3/exoplayer/upstream/Loader;->hasFatalError()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_3

    .line 570
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isPendingReset()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 574
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    .line 575
    iget-wide v4, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    goto :goto_0

    .line 577
    :cond_1
    iget-object v3, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->readOnlyMediaChunks:Ljava/util/List;

    .line 578
    invoke-direct/range {p0 .. p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->getLastMediaChunk()Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    move-result-object v4

    iget-wide v4, v4, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->endTimeUs:J

    :goto_0
    move-object v10, v3

    move-wide v8, v4

    .line 580
    iget-object v6, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkSource:Landroidx/media3/exoplayer/source/chunk/ChunkSource;

    iget-object v11, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextChunkHolder:Landroidx/media3/exoplayer/source/chunk/ChunkHolder;

    move-object/from16 v7, p1

    invoke-interface/range {v6 .. v11}, Landroidx/media3/exoplayer/source/chunk/ChunkSource;->getNextChunk(Landroidx/media3/exoplayer/LoadingInfo;JLjava/util/List;Landroidx/media3/exoplayer/source/chunk/ChunkHolder;)V

    .line 581
    iget-object v3, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextChunkHolder:Landroidx/media3/exoplayer/source/chunk/ChunkHolder;

    iget-boolean v3, v3, Landroidx/media3/exoplayer/source/chunk/ChunkHolder;->endOfStream:Z

    .line 582
    iget-object v4, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextChunkHolder:Landroidx/media3/exoplayer/source/chunk/ChunkHolder;

    iget-object v4, v4, Landroidx/media3/exoplayer/source/chunk/ChunkHolder;->chunk:Landroidx/media3/exoplayer/source/chunk/Chunk;

    .line 583
    iget-object v5, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextChunkHolder:Landroidx/media3/exoplayer/source/chunk/ChunkHolder;

    invoke-virtual {v5}, Landroidx/media3/exoplayer/source/chunk/ChunkHolder;->clear()V

    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    const/4 v7, 0x1

    if-eqz v3, :cond_2

    .line 586
    iput-wide v5, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    .line 587
    iput-boolean v7, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingFinished:Z

    return v7

    :cond_2
    if-nez v4, :cond_3

    return v2

    .line 595
    :cond_3
    iput-object v4, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingChunk:Landroidx/media3/exoplayer/source/chunk/Chunk;

    .line 596
    invoke-direct {v0, v4}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isMediaChunk(Landroidx/media3/exoplayer/source/chunk/Chunk;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 597
    move-object v3, v4

    check-cast v3, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    if-eqz v1, :cond_5

    .line 603
    iget-wide v8, v3, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->startTimeUs:J

    iget-wide v10, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    cmp-long v1, v8, v10

    if-eqz v1, :cond_4

    .line 604
    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {v1, v10, v11}, Landroidx/media3/exoplayer/source/SampleQueue;->setStartTimeUs(J)V

    .line 605
    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    array-length v8, v1

    :goto_1
    if-ge v2, v8, :cond_4

    aget-object v9, v1, v2

    .line 606
    iget-wide v10, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    invoke-virtual {v9, v10, v11}, Landroidx/media3/exoplayer/source/SampleQueue;->setStartTimeUs(J)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 609
    :cond_4
    iput-wide v5, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    .line 611
    :cond_5
    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkOutput:Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;

    invoke-virtual {v3, v1}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->init(Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;)V

    .line 612
    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 613
    :cond_6
    instance-of v1, v4, Landroidx/media3/exoplayer/source/chunk/InitializationChunk;

    if-eqz v1, :cond_7

    .line 614
    move-object v1, v4

    check-cast v1, Landroidx/media3/exoplayer/source/chunk/InitializationChunk;

    iget-object v2, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkOutput:Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;

    invoke-virtual {v1, v2}, Landroidx/media3/exoplayer/source/chunk/InitializationChunk;->init(Landroidx/media3/exoplayer/source/chunk/ChunkExtractor$TrackOutputProvider;)V

    .line 616
    :cond_7
    :goto_2
    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    iget-object v2, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    iget v3, v4, Landroidx/media3/exoplayer/source/chunk/Chunk;->type:I

    .line 618
    invoke-interface {v2, v3}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->getMinimumLoadableRetryCount(I)I

    move-result v2

    .line 617
    invoke-virtual {v1, v4, v0, v2}, Landroidx/media3/exoplayer/upstream/Loader;->startLoading(Landroidx/media3/exoplayer/upstream/Loader$Loadable;Landroidx/media3/exoplayer/upstream/Loader$Callback;I)J

    move-result-wide v12

    .line 619
    iget-object v14, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaSourceEventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    new-instance v15, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v9, v4, Landroidx/media3/exoplayer/source/chunk/Chunk;->loadTaskId:J

    iget-object v11, v4, Landroidx/media3/exoplayer/source/chunk/Chunk;->dataSpec:Landroidx/media3/datasource/DataSpec;

    move-object v8, v15

    invoke-direct/range {v8 .. v13}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;J)V

    iget v1, v4, Landroidx/media3/exoplayer/source/chunk/Chunk;->type:I

    iget v2, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primaryTrackType:I

    iget-object v3, v4, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackFormat:Landroidx/media3/common/Format;

    iget v5, v4, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackSelectionReason:I

    iget-object v6, v4, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackSelectionData:Ljava/lang/Object;

    iget-wide v8, v4, Landroidx/media3/exoplayer/source/chunk/Chunk;->startTimeUs:J

    iget-wide v10, v4, Landroidx/media3/exoplayer/source/chunk/Chunk;->endTimeUs:J

    move/from16 v16, v1

    move/from16 v17, v2

    move-object/from16 v18, v3

    move/from16 v19, v5

    move-object/from16 v20, v6

    move-wide/from16 v21, v8

    move-wide/from16 v23, v10

    invoke-virtual/range {v14 .. v24}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadStarted(Landroidx/media3/exoplayer/source/LoadEventInfo;IILandroidx/media3/common/Format;ILjava/lang/Object;JJ)V

    return v7

    :cond_8
    :goto_3
    return v2
.end method

.method public discardBuffer(JZ)V
    .locals 4

    .line 173
    invoke-virtual {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isPendingReset()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 176
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/source/SampleQueue;->getFirstIndex()I

    move-result v0

    .line 177
    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, p2, p3, v2}, Landroidx/media3/exoplayer/source/SampleQueue;->discardTo(JZZ)V

    .line 178
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {p1}, Landroidx/media3/exoplayer/source/SampleQueue;->getFirstIndex()I

    move-result p1

    if-le p1, v0, :cond_1

    .line 180
    iget-object p2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {p2}, Landroidx/media3/exoplayer/source/SampleQueue;->getFirstTimestampUs()J

    move-result-wide v0

    const/4 p2, 0x0

    .line 181
    :goto_0
    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    array-length v3, v2

    if-ge p2, v3, :cond_1

    .line 182
    aget-object v2, v2, p2

    iget-object v3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedTracksSelected:[Z

    aget-boolean v3, v3, p2

    invoke-virtual {v2, v0, v1, p3, v3}, Landroidx/media3/exoplayer/source/SampleQueue;->discardTo(JZZ)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 185
    :cond_1
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->discardDownstreamMediaChunks(I)V

    return-void
.end method

.method public getAdjustedSeekPositionUs(JLandroidx/media3/exoplayer/SeekParameters;)J
    .locals 1

    .line 251
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkSource:Landroidx/media3/exoplayer/source/chunk/ChunkSource;

    invoke-interface {v0, p1, p2, p3}, Landroidx/media3/exoplayer/source/chunk/ChunkSource;->getAdjustedSeekPositionUs(JLandroidx/media3/exoplayer/SeekParameters;)J

    move-result-wide p1

    return-wide p1
.end method

.method public getBufferedPositionUs()J
    .locals 4

    .line 224
    iget-boolean v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingFinished:Z

    if-eqz v0, :cond_0

    const-wide/high16 v0, -0x8000000000000000L

    return-wide v0

    .line 226
    :cond_0
    invoke-virtual {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isPendingReset()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 227
    iget-wide v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    return-wide v0

    .line 229
    :cond_1
    iget-wide v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->lastSeekPositionUs:J

    .line 230
    invoke-direct {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->getLastMediaChunk()Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    move-result-object v2

    .line 232
    invoke-virtual {v2}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->isLoadCompleted()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 234
    :cond_2
    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_3

    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_4

    .line 236
    iget-wide v2, v2, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->endTimeUs:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 238
    :cond_4
    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {v2}, Landroidx/media3/exoplayer/source/SampleQueue;->getLargestQueuedTimestampUs()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public getChunkSource()Landroidx/media3/exoplayer/source/chunk/ChunkSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 213
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkSource:Landroidx/media3/exoplayer/source/chunk/ChunkSource;

    return-object v0
.end method

.method public getNextLoadPositionUs()J
    .locals 2

    .line 638
    invoke-virtual {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isPendingReset()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 639
    iget-wide v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    return-wide v0

    .line 641
    :cond_0
    iget-boolean v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingFinished:Z

    if-eqz v0, :cond_1

    const-wide/high16 v0, -0x8000000000000000L

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->getLastMediaChunk()Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    move-result-object v0

    iget-wide v0, v0, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->endTimeUs:J

    :goto_0
    return-wide v0
.end method

.method public isLoading()Z
    .locals 1

    .line 633
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    return v0
.end method

.method isPendingReset()Z
    .locals 5

    .line 726
    iget-wide v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isReady()Z
    .locals 2

    .line 368
    invoke-virtual {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isPendingReset()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    iget-boolean v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingFinished:Z

    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/source/SampleQueue;->isReady(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public maybeThrowError()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 373
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->maybeThrowError()V

    .line 374
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/source/SampleQueue;->maybeThrowError()V

    .line 375
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-nez v0, :cond_0

    .line 376
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkSource:Landroidx/media3/exoplayer/source/chunk/ChunkSource;

    invoke-interface {v0}, Landroidx/media3/exoplayer/source/chunk/ChunkSource;->maybeThrowError()V

    :cond_0
    return-void
.end method

.method public onLoadCanceled(Landroidx/media3/exoplayer/source/chunk/Chunk;JJZ)V
    .locals 15

    move-object v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    .line 448
    iput-object v2, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingChunk:Landroidx/media3/exoplayer/source/chunk/Chunk;

    .line 449
    iput-object v2, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->canceledMediaChunk:Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    .line 450
    new-instance v2, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v4, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->loadTaskId:J

    iget-object v6, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 454
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/source/chunk/Chunk;->getUri()Landroid/net/Uri;

    move-result-object v7

    .line 455
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/source/chunk/Chunk;->getResponseHeaders()Ljava/util/Map;

    move-result-object v8

    .line 458
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/source/chunk/Chunk;->bytesLoaded()J

    move-result-wide v13

    move-object v3, v2

    move-wide/from16 v9, p2

    move-wide/from16 v11, p4

    invoke-direct/range {v3 .. v14}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 459
    iget-object v3, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    iget-wide v4, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->loadTaskId:J

    invoke-interface {v3, v4, v5}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->onLoadTaskConcluded(J)V

    .line 460
    iget-object v3, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaSourceEventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    iget v5, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->type:I

    iget v6, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primaryTrackType:I

    iget-object v7, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackFormat:Landroidx/media3/common/Format;

    iget v8, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackSelectionReason:I

    iget-object v9, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackSelectionData:Ljava/lang/Object;

    iget-wide v10, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->startTimeUs:J

    iget-wide v12, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->endTimeUs:J

    move-object v4, v2

    invoke-virtual/range {v3 .. v13}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadCanceled(Landroidx/media3/exoplayer/source/LoadEventInfo;IILandroidx/media3/common/Format;ILjava/lang/Object;JJ)V

    if-nez p6, :cond_2

    .line 470
    invoke-virtual {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isPendingReset()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 471
    invoke-direct {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->resetSampleQueues()V

    goto :goto_0

    .line 472
    :cond_0
    invoke-direct/range {p0 .. p1}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isMediaChunk(Landroidx/media3/exoplayer/source/chunk/Chunk;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 474
    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-direct {p0, v1}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->discardUpstreamMediaChunksFromIndex(I)Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    .line 475
    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 476
    iget-wide v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->lastSeekPositionUs:J

    iput-wide v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    .line 479
    :cond_1
    :goto_0
    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->callback:Landroidx/media3/exoplayer/source/SequenceableLoader$Callback;

    invoke-interface {v1, p0}, Landroidx/media3/exoplayer/source/SequenceableLoader$Callback;->onContinueLoadingRequested(Landroidx/media3/exoplayer/source/SequenceableLoader;)V

    :cond_2
    return-void
.end method

.method public bridge synthetic onLoadCanceled(Landroidx/media3/exoplayer/upstream/Loader$Loadable;JJZ)V
    .locals 0

    .line 57
    check-cast p1, Landroidx/media3/exoplayer/source/chunk/Chunk;

    invoke-virtual/range {p0 .. p6}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->onLoadCanceled(Landroidx/media3/exoplayer/source/chunk/Chunk;JJZ)V

    return-void
.end method

.method public onLoadCompleted(Landroidx/media3/exoplayer/source/chunk/Chunk;JJ)V
    .locals 15

    move-object v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    .line 421
    iput-object v2, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingChunk:Landroidx/media3/exoplayer/source/chunk/Chunk;

    .line 422
    iget-object v2, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkSource:Landroidx/media3/exoplayer/source/chunk/ChunkSource;

    invoke-interface {v2, v1}, Landroidx/media3/exoplayer/source/chunk/ChunkSource;->onChunkLoadCompleted(Landroidx/media3/exoplayer/source/chunk/Chunk;)V

    .line 423
    new-instance v2, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v4, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->loadTaskId:J

    iget-object v6, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 427
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/source/chunk/Chunk;->getUri()Landroid/net/Uri;

    move-result-object v7

    .line 428
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/source/chunk/Chunk;->getResponseHeaders()Ljava/util/Map;

    move-result-object v8

    .line 431
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/source/chunk/Chunk;->bytesLoaded()J

    move-result-wide v13

    move-object v3, v2

    move-wide/from16 v9, p2

    move-wide/from16 v11, p4

    invoke-direct/range {v3 .. v14}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 432
    iget-object v3, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    iget-wide v4, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->loadTaskId:J

    invoke-interface {v3, v4, v5}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->onLoadTaskConcluded(J)V

    .line 433
    iget-object v3, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaSourceEventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    iget v5, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->type:I

    iget v6, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primaryTrackType:I

    iget-object v7, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackFormat:Landroidx/media3/common/Format;

    iget v8, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackSelectionReason:I

    iget-object v9, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackSelectionData:Ljava/lang/Object;

    iget-wide v10, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->startTimeUs:J

    iget-wide v12, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->endTimeUs:J

    move-object v4, v2

    invoke-virtual/range {v3 .. v13}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadCompleted(Landroidx/media3/exoplayer/source/LoadEventInfo;IILandroidx/media3/common/Format;ILjava/lang/Object;JJ)V

    .line 442
    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->callback:Landroidx/media3/exoplayer/source/SequenceableLoader$Callback;

    invoke-interface {v1, p0}, Landroidx/media3/exoplayer/source/SequenceableLoader$Callback;->onContinueLoadingRequested(Landroidx/media3/exoplayer/source/SequenceableLoader;)V

    return-void
.end method

.method public bridge synthetic onLoadCompleted(Landroidx/media3/exoplayer/upstream/Loader$Loadable;JJ)V
    .locals 0

    .line 57
    check-cast p1, Landroidx/media3/exoplayer/source/chunk/Chunk;

    invoke-virtual/range {p0 .. p5}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->onLoadCompleted(Landroidx/media3/exoplayer/source/chunk/Chunk;JJ)V

    return-void
.end method

.method public onLoadError(Landroidx/media3/exoplayer/source/chunk/Chunk;JJLjava/io/IOException;I)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;
    .locals 30

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 490
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/source/chunk/Chunk;->bytesLoaded()J

    move-result-wide v12

    .line 491
    invoke-direct/range {p0 .. p1}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isMediaChunk(Landroidx/media3/exoplayer/source/chunk/Chunk;)Z

    move-result v14

    .line 492
    iget-object v2, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v15, 0x1

    add-int/lit8 v10, v2, -0x1

    const-wide/16 v2, 0x0

    const/4 v11, 0x0

    cmp-long v4, v12, v2

    if-eqz v4, :cond_1

    if-eqz v14, :cond_1

    .line 494
    invoke-direct {v0, v10}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->haveReadFromMediaChunk(I)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v8, 0x1

    .line 495
    :goto_1
    new-instance v9, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v3, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->loadTaskId:J

    iget-object v5, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 499
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/source/chunk/Chunk;->getUri()Landroid/net/Uri;

    move-result-object v6

    .line 500
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/source/chunk/Chunk;->getResponseHeaders()Ljava/util/Map;

    move-result-object v7

    move-object v2, v9

    move v15, v8

    move/from16 v17, v14

    move-object v14, v9

    move-wide/from16 v8, p2

    move/from16 v29, v10

    move-wide/from16 v10, p4

    invoke-direct/range {v2 .. v13}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 504
    new-instance v2, Landroidx/media3/exoplayer/source/MediaLoadData;

    iget v3, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->type:I

    iget v4, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primaryTrackType:I

    iget-object v5, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackFormat:Landroidx/media3/common/Format;

    iget v6, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackSelectionReason:I

    iget-object v7, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackSelectionData:Ljava/lang/Object;

    iget-wide v8, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->startTimeUs:J

    .line 511
    invoke-static {v8, v9}, Landroidx/media3/common/util/Util;->usToMs(J)J

    move-result-wide v24

    iget-wide v8, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->endTimeUs:J

    .line 512
    invoke-static {v8, v9}, Landroidx/media3/common/util/Util;->usToMs(J)J

    move-result-wide v26

    move-object/from16 v18, v2

    move/from16 v19, v3

    move/from16 v20, v4

    move-object/from16 v21, v5

    move/from16 v22, v6

    move-object/from16 v23, v7

    invoke-direct/range {v18 .. v27}, Landroidx/media3/exoplayer/source/MediaLoadData;-><init>(IILandroidx/media3/common/Format;ILjava/lang/Object;JJ)V

    .line 513
    new-instance v3, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;

    move-object/from16 v4, p6

    move/from16 v5, p7

    invoke-direct {v3, v14, v2, v4, v5}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;-><init>(Landroidx/media3/exoplayer/source/LoadEventInfo;Landroidx/media3/exoplayer/source/MediaLoadData;Ljava/io/IOException;I)V

    .line 517
    iget-object v2, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkSource:Landroidx/media3/exoplayer/source/chunk/ChunkSource;

    iget-object v5, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    invoke-interface {v2, v1, v15, v3, v5}, Landroidx/media3/exoplayer/source/chunk/ChunkSource;->onChunkLoadError(Landroidx/media3/exoplayer/source/chunk/Chunk;ZLandroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;)Z

    move-result v2

    if-eqz v2, :cond_4

    if-eqz v15, :cond_3

    .line 520
    sget-object v2, Landroidx/media3/exoplayer/upstream/Loader;->DONT_RETRY:Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    if-eqz v17, :cond_5

    move/from16 v6, v29

    .line 522
    invoke-direct {v0, v6}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->discardUpstreamMediaChunksFromIndex(I)Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    move-result-object v6

    if-ne v6, v1, :cond_2

    const/4 v11, 0x1

    goto :goto_2

    :cond_2
    const/4 v11, 0x0

    .line 523
    :goto_2
    invoke-static {v11}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 524
    iget-object v6, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 525
    iget-wide v6, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->lastSeekPositionUs:J

    iput-wide v6, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    goto :goto_3

    .line 529
    :cond_3
    const-string v2, "ChunkSampleStream"

    const-string v6, "Ignoring attempt to cancel non-cancelable load."

    invoke-static {v2, v6}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    const/4 v2, 0x0

    :cond_5
    :goto_3
    if-nez v2, :cond_7

    .line 535
    iget-object v2, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    invoke-interface {v2, v3}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->getRetryDelayMsFor(Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;)J

    move-result-wide v2

    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v8, v2, v6

    if-eqz v8, :cond_6

    const/4 v6, 0x0

    .line 538
    invoke-static {v6, v2, v3}, Landroidx/media3/exoplayer/upstream/Loader;->createRetryAction(ZJ)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    move-result-object v2

    goto :goto_4

    .line 539
    :cond_6
    sget-object v2, Landroidx/media3/exoplayer/upstream/Loader;->DONT_RETRY_FATAL:Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    .line 542
    :cond_7
    :goto_4
    invoke-virtual {v2}, Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;->isRetry()Z

    move-result v3

    const/4 v6, 0x1

    xor-int/2addr v3, v6

    .line 543
    iget-object v6, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaSourceEventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    iget v7, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->type:I

    iget v8, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primaryTrackType:I

    iget-object v9, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackFormat:Landroidx/media3/common/Format;

    iget v10, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackSelectionReason:I

    iget-object v11, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->trackSelectionData:Ljava/lang/Object;

    iget-wide v12, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->startTimeUs:J

    iget-wide v4, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->endTimeUs:J

    move-object/from16 v16, v6

    move-object/from16 v17, v14

    move/from16 v18, v7

    move/from16 v19, v8

    move-object/from16 v20, v9

    move/from16 v21, v10

    move-object/from16 v22, v11

    move-wide/from16 v23, v12

    move-wide/from16 v25, v4

    move-object/from16 v27, p6

    move/from16 v28, v3

    invoke-virtual/range {v16 .. v28}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadError(Landroidx/media3/exoplayer/source/LoadEventInfo;IILandroidx/media3/common/Format;ILjava/lang/Object;JJLjava/io/IOException;Z)V

    if-eqz v3, :cond_8

    const/4 v3, 0x0

    .line 555
    iput-object v3, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingChunk:Landroidx/media3/exoplayer/source/chunk/Chunk;

    .line 556
    iget-object v3, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    iget-wide v4, v1, Landroidx/media3/exoplayer/source/chunk/Chunk;->loadTaskId:J

    invoke-interface {v3, v4, v5}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->onLoadTaskConcluded(J)V

    .line 557
    iget-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->callback:Landroidx/media3/exoplayer/source/SequenceableLoader$Callback;

    invoke-interface {v1, v0}, Landroidx/media3/exoplayer/source/SequenceableLoader$Callback;->onContinueLoadingRequested(Landroidx/media3/exoplayer/source/SequenceableLoader;)V

    :cond_8
    return-object v2
.end method

.method public bridge synthetic onLoadError(Landroidx/media3/exoplayer/upstream/Loader$Loadable;JJLjava/io/IOException;I)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;
    .locals 0

    .line 57
    check-cast p1, Landroidx/media3/exoplayer/source/chunk/Chunk;

    invoke-virtual/range {p0 .. p7}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->onLoadError(Landroidx/media3/exoplayer/source/chunk/Chunk;JJLjava/io/IOException;I)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    move-result-object p1

    return-object p1
.end method

.method public onLoaderReleased()V
    .locals 4

    .line 354
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/source/SampleQueue;->release()V

    .line 355
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 356
    invoke-virtual {v3}, Landroidx/media3/exoplayer/source/SampleQueue;->release()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 358
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkSource:Landroidx/media3/exoplayer/source/chunk/ChunkSource;

    invoke-interface {v0}, Landroidx/media3/exoplayer/source/chunk/ChunkSource;->release()V

    .line 359
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->releaseCallback:Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$ReleaseCallback;

    if-eqz v0, :cond_1

    .line 360
    invoke-interface {v0, p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$ReleaseCallback;->onSampleStreamReleased(Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;)V

    :cond_1
    return-void
.end method

.method public readData(Landroidx/media3/exoplayer/FormatHolder;Landroidx/media3/decoder/DecoderInputBuffer;I)I
    .locals 3

    .line 383
    invoke-virtual {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isPendingReset()Z

    move-result v0

    const/4 v1, -0x3

    if-eqz v0, :cond_0

    return v1

    .line 386
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->canceledMediaChunk:Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    if-eqz v0, :cond_1

    const/4 v2, 0x0

    .line 387
    invoke-virtual {v0, v2}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->getFirstSampleIndex(I)I

    move-result v0

    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    .line 388
    invoke-virtual {v2}, Landroidx/media3/exoplayer/source/SampleQueue;->getReadIndex()I

    move-result v2

    if-gt v0, v2, :cond_1

    return v1

    .line 393
    :cond_1
    invoke-direct {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->maybeNotifyPrimaryTrackFormatChanged()V

    .line 395
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    iget-boolean v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingFinished:Z

    invoke-virtual {v0, p1, p2, p3, v1}, Landroidx/media3/exoplayer/source/SampleQueue;->read(Landroidx/media3/exoplayer/FormatHolder;Landroidx/media3/decoder/DecoderInputBuffer;IZ)I

    move-result p1

    return p1
.end method

.method public reevaluateBuffer(J)V
    .locals 3

    .line 647
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->hasFatalError()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isPendingReset()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 651
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 652
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingChunk:Landroidx/media3/exoplayer/source/chunk/Chunk;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/source/chunk/Chunk;

    .line 653
    invoke-direct {p0, v0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isMediaChunk(Landroidx/media3/exoplayer/source/chunk/Chunk;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    .line 654
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-direct {p0, v1}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->haveReadFromMediaChunk(I)Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 658
    :cond_1
    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkSource:Landroidx/media3/exoplayer/source/chunk/ChunkSource;

    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->readOnlyMediaChunks:Ljava/util/List;

    invoke-interface {v1, p1, p2, v0, v2}, Landroidx/media3/exoplayer/source/chunk/ChunkSource;->shouldCancelLoad(JLandroidx/media3/exoplayer/source/chunk/Chunk;Ljava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 659
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {p1}, Landroidx/media3/exoplayer/upstream/Loader;->cancelLoading()V

    .line 660
    invoke-direct {p0, v0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isMediaChunk(Landroidx/media3/exoplayer/source/chunk/Chunk;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 661
    check-cast v0, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    iput-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->canceledMediaChunk:Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    :cond_2
    return-void

    .line 667
    :cond_3
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->chunkSource:Landroidx/media3/exoplayer/source/chunk/ChunkSource;

    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->readOnlyMediaChunks:Ljava/util/List;

    invoke-interface {v0, p1, p2, v1}, Landroidx/media3/exoplayer/source/chunk/ChunkSource;->getPreferredQueueSize(JLjava/util/List;)I

    move-result p1

    .line 668
    iget-object p2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge p1, p2, :cond_4

    .line 669
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->discardUpstream(I)V

    :cond_4
    :goto_0
    return-void
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x0

    .line 330
    invoke-virtual {p0, v0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->release(Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$ReleaseCallback;)V

    return-void
.end method

.method public release(Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$ReleaseCallback;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$ReleaseCallback<",
            "TT;>;)V"
        }
    .end annotation

    .line 343
    iput-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->releaseCallback:Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$ReleaseCallback;

    .line 345
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {p1}, Landroidx/media3/exoplayer/source/SampleQueue;->preRelease()V

    .line 346
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 347
    invoke-virtual {v2}, Landroidx/media3/exoplayer/source/SampleQueue;->preRelease()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 349
    :cond_0
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {p1, p0}, Landroidx/media3/exoplayer/upstream/Loader;->release(Landroidx/media3/exoplayer/upstream/Loader$ReleaseCallback;)V

    return-void
.end method

.method public seekToUs(J)V
    .locals 9

    .line 260
    iput-wide p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->lastSeekPositionUs:J

    .line 261
    invoke-virtual {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isPendingReset()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 263
    iput-wide p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 269
    :goto_0
    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 270
    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    .line 271
    iget-wide v3, v2, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->startTimeUs:J

    cmp-long v5, v3, p1

    if-nez v5, :cond_1

    .line 272
    iget-wide v3, v2, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->clippedStartTimeUs:J

    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v8, v3, v6

    if-nez v8, :cond_1

    goto :goto_2

    :cond_1
    if-lez v5, :cond_2

    goto :goto_1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    const/4 v2, 0x0

    :goto_2
    const/4 v1, 0x1

    if-eqz v2, :cond_4

    .line 287
    iget-object v3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {v2, v0}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->getFirstSampleIndex(I)I

    move-result v2

    invoke-virtual {v3, v2}, Landroidx/media3/exoplayer/source/SampleQueue;->seekTo(I)Z

    move-result v2

    goto :goto_4

    .line 289
    :cond_4
    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    .line 291
    invoke-virtual {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->getNextLoadPositionUs()J

    move-result-wide v3

    cmp-long v5, p1, v3

    if-gez v5, :cond_5

    const/4 v3, 0x1

    goto :goto_3

    :cond_5
    const/4 v3, 0x0

    .line 290
    :goto_3
    invoke-virtual {v2, p1, p2, v3}, Landroidx/media3/exoplayer/source/SampleQueue;->seekTo(JZ)Z

    move-result v2

    :goto_4
    if-eqz v2, :cond_6

    .line 296
    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    .line 298
    invoke-virtual {v2}, Landroidx/media3/exoplayer/source/SampleQueue;->getReadIndex()I

    move-result v2

    .line 297
    invoke-direct {p0, v2, v0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleIndexToMediaChunkIndex(II)I

    move-result v2

    iput v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextNotifyPrimaryFormatMediaChunkIndex:I

    .line 300
    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    array-length v3, v2

    :goto_5
    if-ge v0, v3, :cond_9

    aget-object v4, v2, v0

    .line 301
    invoke-virtual {v4, p1, p2, v1}, Landroidx/media3/exoplayer/source/SampleQueue;->seekTo(JZ)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 305
    :cond_6
    iput-wide p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->pendingResetPositionUs:J

    .line 306
    iput-boolean v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingFinished:Z

    .line 307
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->mediaChunks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 308
    iput v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->nextNotifyPrimaryFormatMediaChunkIndex:I

    .line 309
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {p1}, Landroidx/media3/exoplayer/upstream/Loader;->isLoading()Z

    move-result p1

    if-eqz p1, :cond_8

    .line 311
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {p1}, Landroidx/media3/exoplayer/source/SampleQueue;->discardToEnd()V

    .line 312
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    array-length p2, p1

    :goto_6
    if-ge v0, p2, :cond_7

    aget-object v1, p1, v0

    .line 313
    invoke-virtual {v1}, Landroidx/media3/exoplayer/source/SampleQueue;->discardToEnd()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 315
    :cond_7
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {p1}, Landroidx/media3/exoplayer/upstream/Loader;->cancelLoading()V

    goto :goto_7

    .line 317
    :cond_8
    iget-object p1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {p1}, Landroidx/media3/exoplayer/upstream/Loader;->clearFatalError()V

    .line 318
    invoke-direct {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->resetSampleQueues()V

    :cond_9
    :goto_7
    return-void
.end method

.method public selectEmbeddedTrack(JI)Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$EmbeddedSampleStream;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI)",
            "Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream<",
            "TT;>.EmbeddedSampleStream;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 199
    :goto_0
    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 200
    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedTrackTypes:[I

    aget v1, v1, v0

    if-ne v1, p3, :cond_0

    .line 201
    iget-object p3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedTracksSelected:[Z

    aget-boolean p3, p3, v0

    const/4 v1, 0x1

    xor-int/2addr p3, v1

    invoke-static {p3}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 202
    iget-object p3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedTracksSelected:[Z

    aput-boolean v1, p3, v0

    .line 203
    iget-object p3, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    aget-object p3, p3, v0

    invoke-virtual {p3, p1, p2, v1}, Landroidx/media3/exoplayer/source/SampleQueue;->seekTo(JZ)Z

    .line 204
    new-instance p1, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$EmbeddedSampleStream;

    iget-object p2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->embeddedSampleQueues:[Landroidx/media3/exoplayer/source/SampleQueue;

    aget-object p2, p2, v0

    invoke-direct {p1, p0, p0, p2, v0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream$EmbeddedSampleStream;-><init>(Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;Landroidx/media3/exoplayer/source/SampleQueue;I)V

    return-object p1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 208
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method

.method public skipData(J)I
    .locals 3

    .line 400
    invoke-virtual {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->isPendingReset()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 403
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    iget-boolean v2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->loadingFinished:Z

    invoke-virtual {v0, p1, p2, v2}, Landroidx/media3/exoplayer/source/SampleQueue;->getSkipCount(JZ)I

    move-result p1

    .line 404
    iget-object p2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->canceledMediaChunk:Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;

    if-eqz p2, :cond_1

    .line 408
    invoke-virtual {p2, v1}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;->getFirstSampleIndex(I)I

    move-result p2

    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    .line 409
    invoke-virtual {v0}, Landroidx/media3/exoplayer/source/SampleQueue;->getReadIndex()I

    move-result v0

    sub-int/2addr p2, v0

    .line 410
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 412
    :cond_1
    iget-object p2, p0, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->primarySampleQueue:Landroidx/media3/exoplayer/source/SampleQueue;

    invoke-virtual {p2, p1}, Landroidx/media3/exoplayer/source/SampleQueue;->skip(I)V

    .line 413
    invoke-direct {p0}, Landroidx/media3/exoplayer/source/chunk/ChunkSampleStream;->maybeNotifyPrimaryTrackFormatChanged()V

    return p1
.end method
