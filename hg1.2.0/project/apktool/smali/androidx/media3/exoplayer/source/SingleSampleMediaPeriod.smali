.class final Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;
.super Ljava/lang/Object;
.source "SingleSampleMediaPeriod.java"

# interfaces
.implements Landroidx/media3/exoplayer/source/MediaPeriod;
.implements Landroidx/media3/exoplayer/upstream/Loader$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SampleStreamImpl;,
        Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/media3/exoplayer/source/MediaPeriod;",
        "Landroidx/media3/exoplayer/upstream/Loader$Callback<",
        "Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;",
        ">;"
    }
.end annotation


# static fields
.field private static final INITIAL_SAMPLE_SIZE:I = 0x400

.field private static final TAG:Ljava/lang/String; = "SingleSampleMediaPeriod"


# instance fields
.field private final dataSourceFactory:Landroidx/media3/datasource/DataSource$Factory;

.field private final dataSpec:Landroidx/media3/datasource/DataSpec;

.field private final durationUs:J

.field private final eventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

.field final format:Landroidx/media3/common/Format;

.field private final loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

.field final loader:Landroidx/media3/exoplayer/upstream/Loader;

.field loadingFinished:Z

.field sampleData:[B

.field sampleSize:I

.field private final sampleStreams:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SampleStreamImpl;",
            ">;"
        }
    .end annotation
.end field

.field private final tracks:Landroidx/media3/exoplayer/source/TrackGroupArray;

.field private final transferListener:Landroidx/media3/datasource/TransferListener;

.field final treatLoadErrorsAsEndOfStream:Z


# direct methods
.method public constructor <init>(Landroidx/media3/datasource/DataSpec;Landroidx/media3/datasource/DataSource$Factory;Landroidx/media3/datasource/TransferListener;Landroidx/media3/common/Format;JLandroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;Z)V
    .locals 0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 85
    iput-object p2, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->dataSourceFactory:Landroidx/media3/datasource/DataSource$Factory;

    .line 86
    iput-object p3, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->transferListener:Landroidx/media3/datasource/TransferListener;

    .line 87
    iput-object p4, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->format:Landroidx/media3/common/Format;

    .line 88
    iput-wide p5, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->durationUs:J

    .line 89
    iput-object p7, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    .line 90
    iput-object p8, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->eventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    .line 91
    iput-boolean p9, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->treatLoadErrorsAsEndOfStream:Z

    .line 92
    new-instance p1, Landroidx/media3/exoplayer/source/TrackGroupArray;

    new-instance p2, Landroidx/media3/common/TrackGroup;

    const/4 p3, 0x1

    new-array p5, p3, [Landroidx/media3/common/Format;

    const/4 p6, 0x0

    aput-object p4, p5, p6

    invoke-direct {p2, p5}, Landroidx/media3/common/TrackGroup;-><init>([Landroidx/media3/common/Format;)V

    new-array p3, p3, [Landroidx/media3/common/TrackGroup;

    aput-object p2, p3, p6

    invoke-direct {p1, p3}, Landroidx/media3/exoplayer/source/TrackGroupArray;-><init>([Landroidx/media3/common/TrackGroup;)V

    iput-object p1, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->tracks:Landroidx/media3/exoplayer/source/TrackGroupArray;

    .line 93
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->sampleStreams:Ljava/util/ArrayList;

    .line 94
    new-instance p1, Landroidx/media3/exoplayer/upstream/Loader;

    const-string p2, "SingleSampleMediaPeriod"

    invoke-direct {p1, p2}, Landroidx/media3/exoplayer/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    return-void
.end method

.method static synthetic access$300(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;)Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;
    .locals 0

    .line 49
    iget-object p0, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->eventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    return-object p0
.end method


# virtual methods
.method public continueLoading(Landroidx/media3/exoplayer/LoadingInfo;)Z
    .locals 22

    move-object/from16 v0, p0

    .line 150
    iget-boolean v1, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadingFinished:Z

    if-nez v1, :cond_2

    iget-object v1, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v1}, Landroidx/media3/exoplayer/upstream/Loader;->isLoading()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v1}, Landroidx/media3/exoplayer/upstream/Loader;->hasFatalError()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 153
    :cond_0
    iget-object v1, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->dataSourceFactory:Landroidx/media3/datasource/DataSource$Factory;

    invoke-interface {v1}, Landroidx/media3/datasource/DataSource$Factory;->createDataSource()Landroidx/media3/datasource/DataSource;

    move-result-object v1

    .line 154
    iget-object v2, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->transferListener:Landroidx/media3/datasource/TransferListener;

    if-eqz v2, :cond_1

    .line 155
    invoke-interface {v1, v2}, Landroidx/media3/datasource/DataSource;->addTransferListener(Landroidx/media3/datasource/TransferListener;)V

    .line 157
    :cond_1
    new-instance v2, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;

    iget-object v3, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->dataSpec:Landroidx/media3/datasource/DataSpec;

    invoke-direct {v2, v3, v1}, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;-><init>(Landroidx/media3/datasource/DataSpec;Landroidx/media3/datasource/DataSource;)V

    .line 158
    iget-object v1, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    iget-object v3, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    const/4 v4, 0x1

    .line 162
    invoke-interface {v3, v4}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->getMinimumLoadableRetryCount(I)I

    move-result v3

    .line 159
    invoke-virtual {v1, v2, v0, v3}, Landroidx/media3/exoplayer/upstream/Loader;->startLoading(Landroidx/media3/exoplayer/upstream/Loader$Loadable;Landroidx/media3/exoplayer/upstream/Loader$Callback;I)J

    move-result-wide v9

    .line 163
    iget-object v11, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->eventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    new-instance v12, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v6, v2, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->loadTaskId:J

    iget-object v8, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->dataSpec:Landroidx/media3/datasource/DataSpec;

    move-object v5, v12

    invoke-direct/range {v5 .. v10}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;J)V

    iget-object v15, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->format:Landroidx/media3/common/Format;

    const-wide/16 v18, 0x0

    iget-wide v1, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->durationUs:J

    const/4 v13, 0x1

    const/4 v14, -0x1

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-wide/from16 v20, v1

    invoke-virtual/range {v11 .. v21}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadStarted(Landroidx/media3/exoplayer/source/LoadEventInfo;IILandroidx/media3/common/Format;ILjava/lang/Object;JJ)V

    return v4

    :cond_2
    :goto_0
    const/4 v1, 0x0

    return v1
.end method

.method public discardBuffer(JZ)V
    .locals 0

    return-void
.end method

.method public getAdjustedSeekPositionUs(JLandroidx/media3/exoplayer/SeekParameters;)J
    .locals 0

    return-wide p1
.end method

.method public getBufferedPositionUs()J
    .locals 2

    .line 192
    iget-boolean v0, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadingFinished:Z

    if-eqz v0, :cond_0

    const-wide/high16 v0, -0x8000000000000000L

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method public getNextLoadPositionUs()J
    .locals 2

    .line 187
    iget-boolean v0, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadingFinished:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const-wide/high16 v0, -0x8000000000000000L

    :goto_1
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

    .line 113
    iget-object v0, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->tracks:Landroidx/media3/exoplayer/source/TrackGroupArray;

    return-object v0
.end method

.method public isLoading()Z
    .locals 1

    .line 177
    iget-object v0, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    return v0
.end method

.method public maybeThrowPrepareError()V
    .locals 0

    return-void
.end method

.method public onLoadCanceled(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;JJZ)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 241
    invoke-static/range {p1 .. p1}, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->access$100(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;)Landroidx/media3/datasource/StatsDataSource;

    move-result-object v2

    .line 242
    new-instance v15, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v4, v1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->loadTaskId:J

    iget-object v6, v1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 246
    invoke-virtual {v2}, Landroidx/media3/datasource/StatsDataSource;->getLastOpenedUri()Landroid/net/Uri;

    move-result-object v7

    .line 247
    invoke-virtual {v2}, Landroidx/media3/datasource/StatsDataSource;->getLastResponseHeaders()Ljava/util/Map;

    move-result-object v8

    .line 250
    invoke-virtual {v2}, Landroidx/media3/datasource/StatsDataSource;->getBytesRead()J

    move-result-wide v13

    move-object v3, v15

    move-wide/from16 v9, p2

    move-wide/from16 v11, p4

    invoke-direct/range {v3 .. v14}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 251
    iget-object v2, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    iget-wide v3, v1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->loadTaskId:J

    invoke-interface {v2, v3, v4}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->onLoadTaskConcluded(J)V

    .line 252
    iget-object v3, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->eventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    const-wide/16 v10, 0x0

    iget-wide v12, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->durationUs:J

    const/4 v5, 0x1

    const/4 v6, -0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v4, v15

    invoke-virtual/range {v3 .. v13}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadCanceled(Landroidx/media3/exoplayer/source/LoadEventInfo;IILandroidx/media3/common/Format;ILjava/lang/Object;JJ)V

    return-void
.end method

.method public bridge synthetic onLoadCanceled(Landroidx/media3/exoplayer/upstream/Loader$Loadable;JJZ)V
    .locals 0

    .line 49
    check-cast p1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;

    invoke-virtual/range {p0 .. p6}, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->onLoadCanceled(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;JJZ)V

    return-void
.end method

.method public onLoadCompleted(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;JJ)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 213
    invoke-static/range {p1 .. p1}, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->access$100(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;)Landroidx/media3/datasource/StatsDataSource;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/media3/datasource/StatsDataSource;->getBytesRead()J

    move-result-wide v2

    long-to-int v3, v2

    iput v3, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->sampleSize:I

    .line 214
    invoke-static/range {p1 .. p1}, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->access$200(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;)[B

    move-result-object v2

    invoke-static {v2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    iput-object v2, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->sampleData:[B

    const/4 v2, 0x1

    .line 215
    iput-boolean v2, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadingFinished:Z

    .line 216
    invoke-static/range {p1 .. p1}, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->access$100(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;)Landroidx/media3/datasource/StatsDataSource;

    move-result-object v2

    .line 217
    new-instance v15, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v4, v1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->loadTaskId:J

    iget-object v6, v1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 221
    invoke-virtual {v2}, Landroidx/media3/datasource/StatsDataSource;->getLastOpenedUri()Landroid/net/Uri;

    move-result-object v7

    .line 222
    invoke-virtual {v2}, Landroidx/media3/datasource/StatsDataSource;->getLastResponseHeaders()Ljava/util/Map;

    move-result-object v8

    iget v2, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->sampleSize:I

    int-to-long v13, v2

    move-object v3, v15

    move-wide/from16 v9, p2

    move-wide/from16 v11, p4

    invoke-direct/range {v3 .. v14}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 226
    iget-object v2, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    iget-wide v3, v1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->loadTaskId:J

    invoke-interface {v2, v3, v4}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->onLoadTaskConcluded(J)V

    .line 227
    iget-object v3, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->eventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    iget-object v7, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->format:Landroidx/media3/common/Format;

    const-wide/16 v10, 0x0

    iget-wide v12, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->durationUs:J

    const/4 v5, 0x1

    const/4 v6, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v4, v15

    invoke-virtual/range {v3 .. v13}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadCompleted(Landroidx/media3/exoplayer/source/LoadEventInfo;IILandroidx/media3/common/Format;ILjava/lang/Object;JJ)V

    return-void
.end method

.method public bridge synthetic onLoadCompleted(Landroidx/media3/exoplayer/upstream/Loader$Loadable;JJ)V
    .locals 0

    .line 49
    check-cast p1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;

    invoke-virtual/range {p0 .. p5}, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->onLoadCompleted(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;JJ)V

    return-void
.end method

.method public onLoadError(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;JJLjava/io/IOException;I)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;
    .locals 36

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v13, p6

    move/from16 v2, p7

    .line 270
    invoke-static/range {p1 .. p1}, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->access$100(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;)Landroidx/media3/datasource/StatsDataSource;

    move-result-object v3

    .line 271
    new-instance v4, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v5, v1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->loadTaskId:J

    iget-object v7, v1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 275
    invoke-virtual {v3}, Landroidx/media3/datasource/StatsDataSource;->getLastOpenedUri()Landroid/net/Uri;

    move-result-object v18

    .line 276
    invoke-virtual {v3}, Landroidx/media3/datasource/StatsDataSource;->getLastResponseHeaders()Ljava/util/Map;

    move-result-object v19

    .line 279
    invoke-virtual {v3}, Landroidx/media3/datasource/StatsDataSource;->getBytesRead()J

    move-result-wide v24

    move-object v14, v4

    move-wide v15, v5

    move-object/from16 v17, v7

    move-wide/from16 v20, p2

    move-wide/from16 v22, p4

    invoke-direct/range {v14 .. v25}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 280
    new-instance v3, Landroidx/media3/exoplayer/source/MediaLoadData;

    iget-object v5, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->format:Landroidx/media3/common/Format;

    iget-wide v6, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->durationUs:J

    .line 288
    invoke-static {v6, v7}, Landroidx/media3/common/util/Util;->usToMs(J)J

    move-result-wide v34

    const/16 v27, 0x1

    const/16 v28, -0x1

    const/16 v30, 0x0

    const/16 v31, 0x0

    const-wide/16 v32, 0x0

    move-object/from16 v26, v3

    move-object/from16 v29, v5

    invoke-direct/range {v26 .. v35}, Landroidx/media3/exoplayer/source/MediaLoadData;-><init>(IILandroidx/media3/common/Format;ILjava/lang/Object;JJ)V

    .line 289
    iget-object v5, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    new-instance v6, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;

    invoke-direct {v6, v4, v3, v13, v2}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;-><init>(Landroidx/media3/exoplayer/source/LoadEventInfo;Landroidx/media3/exoplayer/source/MediaLoadData;Ljava/io/IOException;I)V

    .line 290
    invoke-interface {v5, v6}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->getRetryDelayMsFor(Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;)J

    move-result-wide v5

    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    const/4 v3, 0x0

    const/4 v9, 0x1

    cmp-long v10, v5, v7

    if-eqz v10, :cond_1

    .line 292
    iget-object v7, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    .line 295
    invoke-interface {v7, v9}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->getMinimumLoadableRetryCount(I)I

    move-result v7

    if-lt v2, v7, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v2, 0x1

    .line 298
    :goto_1
    iget-boolean v7, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->treatLoadErrorsAsEndOfStream:Z

    if-eqz v7, :cond_2

    if-eqz v2, :cond_2

    .line 299
    const-string v2, "SingleSampleMediaPeriod"

    const-string v3, "Loading failed, treating as end-of-stream."

    invoke-static {v2, v3, v13}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 300
    iput-boolean v9, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadingFinished:Z

    .line 301
    sget-object v2, Landroidx/media3/exoplayer/upstream/Loader;->DONT_RETRY:Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    :goto_2
    move-object v15, v2

    goto :goto_3

    :cond_2
    if-eqz v10, :cond_3

    .line 305
    invoke-static {v3, v5, v6}, Landroidx/media3/exoplayer/upstream/Loader;->createRetryAction(ZJ)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    move-result-object v2

    goto :goto_2

    .line 306
    :cond_3
    sget-object v2, Landroidx/media3/exoplayer/upstream/Loader;->DONT_RETRY_FATAL:Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    goto :goto_2

    .line 308
    :goto_3
    invoke-virtual {v15}, Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;->isRetry()Z

    move-result v2

    xor-int/lit8 v16, v2, 0x1

    .line 309
    iget-object v2, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->eventDispatcher:Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    iget-object v6, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->format:Landroidx/media3/common/Format;

    const-wide/16 v9, 0x0

    iget-wide v11, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->durationUs:J

    const/4 v5, 0x1

    const/4 v7, -0x1

    const/4 v8, 0x0

    const/4 v14, 0x0

    move-object v3, v4

    move v4, v5

    move v5, v7

    move v7, v8

    move-object v8, v14

    move-object/from16 v13, p6

    move/from16 v14, v16

    invoke-virtual/range {v2 .. v14}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadError(Landroidx/media3/exoplayer/source/LoadEventInfo;IILandroidx/media3/common/Format;ILjava/lang/Object;JJLjava/io/IOException;Z)V

    if-eqz v16, :cond_4

    .line 321
    iget-object v2, v0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    iget-wide v3, v1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;->loadTaskId:J

    invoke-interface {v2, v3, v4}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->onLoadTaskConcluded(J)V

    :cond_4
    return-object v15
.end method

.method public bridge synthetic onLoadError(Landroidx/media3/exoplayer/upstream/Loader$Loadable;JJLjava/io/IOException;I)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;
    .locals 0

    .line 49
    check-cast p1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;

    invoke-virtual/range {p0 .. p7}, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->onLoadError(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SourceLoadable;JJLjava/io/IOException;I)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    move-result-object p1

    return-object p1
.end method

.method public prepare(Landroidx/media3/exoplayer/source/MediaPeriod$Callback;J)V
    .locals 0

    .line 103
    invoke-interface {p1, p0}, Landroidx/media3/exoplayer/source/MediaPeriod$Callback;->onPrepared(Landroidx/media3/exoplayer/source/MediaPeriod;)V

    return-void
.end method

.method public readDiscontinuity()J
    .locals 2

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    return-wide v0
.end method

.method public reevaluateBuffer(J)V
    .locals 0

    return-void
.end method

.method public release()V
    .locals 1

    .line 98
    iget-object v0, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->loader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->release()V

    return-void
.end method

.method public seekToUs(J)J
    .locals 2

    const/4 v0, 0x0

    .line 197
    :goto_0
    iget-object v1, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->sampleStreams:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 198
    iget-object v1, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->sampleStreams:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SampleStreamImpl;

    invoke-virtual {v1}, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SampleStreamImpl;->reset()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-wide p1
.end method

.method public selectTracks([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;[Z[Landroidx/media3/exoplayer/source/SampleStream;[ZJ)J
    .locals 4

    const/4 v0, 0x0

    .line 123
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_3

    .line 124
    aget-object v1, p3, v0

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    aget-object v3, p1, v0

    if-eqz v3, :cond_0

    aget-boolean v3, p2, v0

    if-nez v3, :cond_1

    .line 125
    :cond_0
    iget-object v3, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->sampleStreams:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 126
    aput-object v2, p3, v0

    .line 128
    :cond_1
    aget-object v1, p3, v0

    if-nez v1, :cond_2

    aget-object v1, p1, v0

    if-eqz v1, :cond_2

    .line 129
    new-instance v1, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SampleStreamImpl;

    invoke-direct {v1, p0, v2}, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$SampleStreamImpl;-><init>(Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod$1;)V

    .line 130
    iget-object v2, p0, Landroidx/media3/exoplayer/source/SingleSampleMediaPeriod;->sampleStreams:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    aput-object v1, p3, v0

    const/4 v1, 0x1

    .line 132
    aput-boolean v1, p4, v0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-wide p5
.end method
