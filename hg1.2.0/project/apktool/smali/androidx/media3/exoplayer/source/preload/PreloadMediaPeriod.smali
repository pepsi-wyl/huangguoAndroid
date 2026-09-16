.class final Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;
.super Ljava/lang/Object;
.source "PreloadMediaPeriod.java"

# interfaces
.implements Landroidx/media3/exoplayer/source/MediaPeriod;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;
    }
.end annotation


# instance fields
.field private callback:Landroidx/media3/exoplayer/source/MediaPeriod$Callback;

.field public final mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

.field private preloadTrackSelectionHolder:Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

.field private prepareInternalCalled:Z

.field private prepared:Z


# direct methods
.method public constructor <init>(Landroidx/media3/exoplayer/source/MediaPeriod;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    return-void
.end method

.method static synthetic access$000(Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;)Landroidx/media3/exoplayer/source/MediaPeriod$Callback;
    .locals 0

    .line 34
    iget-object p0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->callback:Landroidx/media3/exoplayer/source/MediaPeriod$Callback;

    return-object p0
.end method

.method static synthetic access$102(Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->prepared:Z

    return p1
.end method

.method private static isSameAdaptionSet(Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;)Z
    .locals 4

    .line 208
    invoke-interface {p0}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getTrackGroup()Landroidx/media3/common/TrackGroup;

    move-result-object v0

    invoke-interface {p1}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getTrackGroup()Landroidx/media3/common/TrackGroup;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 209
    invoke-interface {p0}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->length()I

    move-result v0

    invoke-interface {p1}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->length()I

    move-result v2

    if-eq v0, v2, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    .line 212
    :goto_0
    invoke-interface {p0}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 213
    invoke-interface {p0, v0}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getIndexInTrackGroup(I)I

    move-result v2

    invoke-interface {p1, v0}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getIndexInTrackGroup(I)I

    move-result v3

    if-eq v2, v3, :cond_1

    return v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x1

    return p0

    :cond_3
    :goto_1
    return v1
.end method

.method private static maybeUpdatePreloadTrackSelectionHolderForReselection([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;)Z
    .locals 9

    .line 169
    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    iget-object v0, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->selections:[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 171
    :goto_0
    array-length v4, p0

    if-ge v2, v4, :cond_6

    .line 172
    aget-object v4, p0, v2

    .line 173
    aget-object v5, v0, v2

    if-nez v4, :cond_0

    if-nez v5, :cond_0

    goto :goto_3

    .line 177
    :cond_0
    iget-object v6, p1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->mayRetainStreamFlags:[Z

    aput-boolean v1, v6, v2

    const/4 v6, 0x1

    if-nez v4, :cond_1

    .line 180
    iget-object v3, p1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->selections:[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;

    const/4 v4, 0x0

    aput-object v4, v3, v2

    :goto_1
    const/4 v3, 0x1

    goto :goto_3

    :cond_1
    if-nez v5, :cond_2

    .line 184
    iget-object v3, p1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->selections:[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;

    aput-object v4, v3, v2

    goto :goto_1

    .line 186
    :cond_2
    invoke-static {v4, v5}, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->isSameAdaptionSet(Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 188
    iget-object v3, p1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->selections:[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;

    aput-object v4, v3, v2

    goto :goto_1

    .line 190
    :cond_3
    invoke-interface {v4}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getTrackGroup()Landroidx/media3/common/TrackGroup;

    move-result-object v7

    iget v7, v7, Landroidx/media3/common/TrackGroup;->type:I

    const/4 v8, 0x2

    if-eq v7, v8, :cond_5

    .line 191
    invoke-interface {v4}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getTrackGroup()Landroidx/media3/common/TrackGroup;

    move-result-object v7

    iget v7, v7, Landroidx/media3/common/TrackGroup;->type:I

    if-eq v7, v6, :cond_5

    .line 192
    invoke-interface {v4}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getSelectedIndexInTrackGroup()I

    move-result v7

    .line 193
    invoke-interface {v5}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getSelectedIndexInTrackGroup()I

    move-result v5

    if-ne v7, v5, :cond_4

    goto :goto_2

    .line 199
    :cond_4
    iget-object v3, p1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->selections:[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;

    aput-object v4, v3, v2

    goto :goto_1

    .line 196
    :cond_5
    :goto_2
    iget-object v4, p1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->mayRetainStreamFlags:[Z

    aput-boolean v6, v4, v2

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_6
    return v3
.end method

.method private prepareInternal(J)V
    .locals 2

    const/4 v0, 0x1

    .line 75
    iput-boolean v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->prepareInternalCalled:Z

    .line 76
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    new-instance v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$1;

    invoke-direct {v1, p0}, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$1;-><init>(Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;)V

    invoke-interface {v0, v1, p1, p2}, Landroidx/media3/exoplayer/source/MediaPeriod;->prepare(Landroidx/media3/exoplayer/source/MediaPeriod$Callback;J)V

    return-void
.end method

.method private selectTracksInternal([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;[Z[Landroidx/media3/exoplayer/source/SampleStream;[ZJ)J
    .locals 14

    move-object v0, p0

    move-object/from16 v4, p3

    .line 119
    iget-object v1, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->preloadTrackSelectionHolder:Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    if-nez v1, :cond_0

    .line 121
    iget-object v1, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-wide/from16 v6, p5

    invoke-interface/range {v1 .. v7}, Landroidx/media3/exoplayer/source/MediaPeriod;->selectTracks([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;[Z[Landroidx/media3/exoplayer/source/SampleStream;[ZJ)J

    move-result-wide v1

    return-wide v1

    .line 124
    :cond_0
    array-length v2, v4

    iget-object v1, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->streams:[Landroidx/media3/exoplayer/source/SampleStream;

    array-length v1, v1

    const/4 v3, 0x1

    const/4 v5, 0x0

    if-ne v2, v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 125
    iget-object v1, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->preloadTrackSelectionHolder:Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    iget-wide v1, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->trackSelectionPositionUs:J

    const/4 v6, 0x0

    cmp-long v7, p5, v1

    if-eqz v7, :cond_4

    const/4 v1, 0x0

    .line 128
    :goto_1
    iget-object v2, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->preloadTrackSelectionHolder:Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    iget-object v2, v2, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->streams:[Landroidx/media3/exoplayer/source/SampleStream;

    array-length v2, v2

    if-ge v1, v2, :cond_3

    .line 129
    iget-object v2, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->preloadTrackSelectionHolder:Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    iget-object v2, v2, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->streams:[Landroidx/media3/exoplayer/source/SampleStream;

    aget-object v2, v2, v1

    if-eqz v2, :cond_2

    .line 130
    iget-object v2, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->preloadTrackSelectionHolder:Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    iget-object v2, v2, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->streams:[Landroidx/media3/exoplayer/source/SampleStream;

    aget-object v2, v2, v1

    aput-object v2, v4, v1

    .line 131
    aput-boolean v5, p2, v1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 134
    :cond_3
    iput-object v6, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->preloadTrackSelectionHolder:Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    .line 135
    iget-object v1, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-wide/from16 v6, p5

    invoke-interface/range {v1 .. v7}, Landroidx/media3/exoplayer/source/MediaPeriod;->selectTracks([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;[Z[Landroidx/media3/exoplayer/source/SampleStream;[ZJ)J

    move-result-wide v1

    return-wide v1

    .line 138
    :cond_4
    iget-object v1, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->preloadTrackSelectionHolder:Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    .line 139
    iget-wide v7, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->trackSelectionPositionUs:J

    .line 140
    iget-object v2, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->streamResetFlags:[Z

    move-object v9, p1

    .line 141
    invoke-static {p1, v1}, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->maybeUpdatePreloadTrackSelectionHolderForReselection([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 143
    array-length v2, v2

    new-array v2, v2, [Z

    .line 144
    iget-object v7, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    iget-object v8, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->selections:[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;

    iget-object v9, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->mayRetainStreamFlags:[Z

    iget-object v10, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->streams:[Landroidx/media3/exoplayer/source/SampleStream;

    iget-wide v12, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->trackSelectionPositionUs:J

    move-object v11, v2

    .line 145
    invoke-interface/range {v7 .. v13}, Landroidx/media3/exoplayer/source/MediaPeriod;->selectTracks([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;[Z[Landroidx/media3/exoplayer/source/SampleStream;[ZJ)J

    move-result-wide v7

    const/4 v9, 0x0

    .line 152
    :goto_2
    iget-object v10, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->mayRetainStreamFlags:[Z

    array-length v10, v10

    if-ge v9, v10, :cond_6

    .line 153
    iget-object v10, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->mayRetainStreamFlags:[Z

    aget-boolean v10, v10, v9

    if-eqz v10, :cond_5

    .line 154
    aput-boolean v3, v2, v9

    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 158
    :cond_6
    iget-object v3, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->streams:[Landroidx/media3/exoplayer/source/SampleStream;

    iget-object v1, v1, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;->streams:[Landroidx/media3/exoplayer/source/SampleStream;

    array-length v1, v1

    invoke-static {v3, v5, v4, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 159
    array-length v1, v2

    move-object/from16 v3, p4

    invoke-static {v2, v5, v3, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 161
    iput-object v6, v0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->preloadTrackSelectionHolder:Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    return-wide v7
.end method


# virtual methods
.method public continueLoading(Landroidx/media3/exoplayer/LoadingInfo;)Z
    .locals 1

    .line 274
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/source/MediaPeriod;->continueLoading(Landroidx/media3/exoplayer/LoadingInfo;)Z

    move-result p1

    return p1
.end method

.method public discardBuffer(JZ)V
    .locals 1

    .line 244
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    invoke-interface {v0, p1, p2, p3}, Landroidx/media3/exoplayer/source/MediaPeriod;->discardBuffer(JZ)V

    return-void
.end method

.method public getAdjustedSeekPositionUs(JLandroidx/media3/exoplayer/SeekParameters;)J
    .locals 1

    .line 259
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    invoke-interface {v0, p1, p2, p3}, Landroidx/media3/exoplayer/source/MediaPeriod;->getAdjustedSeekPositionUs(JLandroidx/media3/exoplayer/SeekParameters;)J

    move-result-wide p1

    return-wide p1
.end method

.method public getBufferedPositionUs()J
    .locals 2

    .line 264
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    invoke-interface {v0}, Landroidx/media3/exoplayer/source/MediaPeriod;->getBufferedPositionUs()J

    move-result-wide v0

    return-wide v0
.end method

.method public getNextLoadPositionUs()J
    .locals 2

    .line 269
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    invoke-interface {v0}, Landroidx/media3/exoplayer/source/MediaPeriod;->getNextLoadPositionUs()J

    move-result-wide v0

    return-wide v0
.end method

.method public synthetic getStreamKeys(Ljava/util/List;)Ljava/util/List;
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/exoplayer/source/MediaPeriod$-CC;->$default$getStreamKeys(Landroidx/media3/exoplayer/source/MediaPeriod;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getTrackGroups()Landroidx/media3/exoplayer/source/TrackGroupArray;
    .locals 1

    .line 99
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    invoke-interface {v0}, Landroidx/media3/exoplayer/source/MediaPeriod;->getTrackGroups()Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-result-object v0

    return-object v0
.end method

.method public isLoading()Z
    .locals 1

    .line 279
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    invoke-interface {v0}, Landroidx/media3/exoplayer/source/MediaPeriod;->isLoading()Z

    move-result v0

    return v0
.end method

.method public maybeThrowPrepareError()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    invoke-interface {v0}, Landroidx/media3/exoplayer/source/MediaPeriod;->maybeThrowPrepareError()V

    return-void
.end method

.method preload(Landroidx/media3/exoplayer/source/MediaPeriod$Callback;J)V
    .locals 1

    .line 53
    iput-object p1, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->callback:Landroidx/media3/exoplayer/source/MediaPeriod$Callback;

    .line 54
    iget-boolean v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->prepared:Z

    if-eqz v0, :cond_0

    .line 55
    invoke-interface {p1, p0}, Landroidx/media3/exoplayer/source/MediaPeriod$Callback;->onPrepared(Landroidx/media3/exoplayer/source/MediaPeriod;)V

    .line 57
    :cond_0
    iget-boolean p1, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->prepareInternalCalled:Z

    if-nez p1, :cond_1

    .line 58
    invoke-direct {p0, p2, p3}, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->prepareInternal(J)V

    :cond_1
    return-void
.end method

.method public prepare(Landroidx/media3/exoplayer/source/MediaPeriod$Callback;J)V
    .locals 1

    .line 64
    iput-object p1, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->callback:Landroidx/media3/exoplayer/source/MediaPeriod$Callback;

    .line 65
    iget-boolean v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->prepared:Z

    if-eqz v0, :cond_0

    .line 66
    invoke-interface {p1, p0}, Landroidx/media3/exoplayer/source/MediaPeriod$Callback;->onPrepared(Landroidx/media3/exoplayer/source/MediaPeriod;)V

    return-void

    .line 69
    :cond_0
    iget-boolean p1, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->prepareInternalCalled:Z

    if-nez p1, :cond_1

    .line 70
    invoke-direct {p0, p2, p3}, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->prepareInternal(J)V

    :cond_1
    return-void
.end method

.method public readDiscontinuity()J
    .locals 2

    .line 249
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    invoke-interface {v0}, Landroidx/media3/exoplayer/source/MediaPeriod;->readDiscontinuity()J

    move-result-wide v0

    return-wide v0
.end method

.method public reevaluateBuffer(J)V
    .locals 1

    .line 284
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    invoke-interface {v0, p1, p2}, Landroidx/media3/exoplayer/source/MediaPeriod;->reevaluateBuffer(J)V

    return-void
.end method

.method public seekToUs(J)J
    .locals 1

    .line 254
    iget-object v0, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->mediaPeriod:Landroidx/media3/exoplayer/source/MediaPeriod;

    invoke-interface {v0, p1, p2}, Landroidx/media3/exoplayer/source/MediaPeriod;->seekToUs(J)J

    move-result-wide p1

    return-wide p1
.end method

.method public selectTracks([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;[Z[Landroidx/media3/exoplayer/source/SampleStream;[ZJ)J
    .locals 0

    .line 109
    invoke-direct/range {p0 .. p6}, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->selectTracksInternal([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;[Z[Landroidx/media3/exoplayer/source/SampleStream;[ZJ)J

    move-result-wide p1

    return-wide p1
.end method

.method selectTracksForPreloading([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;J)J
    .locals 11

    .line 222
    array-length v0, p1

    new-array v0, v0, [Landroidx/media3/exoplayer/source/SampleStream;

    .line 223
    array-length v1, p1

    new-array v8, v1, [Z

    .line 224
    array-length v1, p1

    new-array v9, v1, [Z

    move-object v1, p0

    move-object v2, p1

    move-object v3, v9

    move-object v4, v0

    move-object v5, v8

    move-wide v6, p2

    .line 226
    invoke-direct/range {v1 .. v7}, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->selectTracksInternal([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;[Z[Landroidx/media3/exoplayer/source/SampleStream;[ZJ)J

    move-result-wide p2

    .line 232
    new-instance v10, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    move-object v1, v10

    move-wide v6, p2

    invoke-direct/range {v1 .. v7}, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;-><init>([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;[Z[Landroidx/media3/exoplayer/source/SampleStream;[ZJ)V

    iput-object v10, p0, Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod;->preloadTrackSelectionHolder:Landroidx/media3/exoplayer/source/preload/PreloadMediaPeriod$PreloadTrackSelectionHolder;

    return-wide p2
.end method
