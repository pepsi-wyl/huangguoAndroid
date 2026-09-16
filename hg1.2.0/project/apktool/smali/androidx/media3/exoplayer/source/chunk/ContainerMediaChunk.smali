.class public Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;
.super Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;
.source "ContainerMediaChunk.java"


# instance fields
.field private final chunkCount:I

.field private final chunkExtractor:Landroidx/media3/exoplayer/source/chunk/ChunkExtractor;

.field private volatile loadCanceled:Z

.field private loadCompleted:Z

.field private nextLoadPosition:J

.field private final sampleOffsetUs:J


# direct methods
.method public constructor <init>(Landroidx/media3/datasource/DataSource;Landroidx/media3/datasource/DataSpec;Landroidx/media3/common/Format;ILjava/lang/Object;JJJJJIJLandroidx/media3/exoplayer/source/chunk/ChunkExtractor;)V
    .locals 3

    move-object v0, p0

    .line 79
    invoke-direct/range {p0 .. p15}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunk;-><init>(Landroidx/media3/datasource/DataSource;Landroidx/media3/datasource/DataSpec;Landroidx/media3/common/Format;ILjava/lang/Object;JJJJJ)V

    move/from16 v1, p16

    .line 90
    iput v1, v0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->chunkCount:I

    move-wide/from16 v1, p17

    .line 91
    iput-wide v1, v0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->sampleOffsetUs:J

    move-object/from16 v1, p19

    .line 92
    iput-object v1, v0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->chunkExtractor:Landroidx/media3/exoplayer/source/chunk/ChunkExtractor;

    return-void
.end method

.method private maybeWriteEmptySamples(Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;)V
    .locals 12

    .line 155
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->trackFormat:Landroidx/media3/common/Format;

    iget-object v0, v0, Landroidx/media3/common/Format;->containerMimeType:Ljava/lang/String;

    invoke-static {v0}, Landroidx/media3/common/MimeTypes;->isImage(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 158
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->trackFormat:Landroidx/media3/common/Format;

    iget v0, v0, Landroidx/media3/common/Format;->tileCountHorizontal:I

    const/4 v1, 0x1

    if-gt v0, v1, :cond_1

    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->trackFormat:Landroidx/media3/common/Format;

    iget v0, v0, Landroidx/media3/common/Format;->tileCountVertical:I

    if-le v0, v1, :cond_3

    :cond_1
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->trackFormat:Landroidx/media3/common/Format;

    iget v0, v0, Landroidx/media3/common/Format;->tileCountHorizontal:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_3

    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->trackFormat:Landroidx/media3/common/Format;

    iget v0, v0, Landroidx/media3/common/Format;->tileCountVertical:I

    if-ne v0, v2, :cond_2

    goto :goto_1

    :cond_2
    const/4 v0, 0x4

    const/4 v2, 0x0

    .line 164
    invoke-virtual {p1, v2, v0}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;->track(II)Landroidx/media3/extractor/TrackOutput;

    move-result-object p1

    .line 165
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->trackFormat:Landroidx/media3/common/Format;

    iget v0, v0, Landroidx/media3/common/Format;->tileCountHorizontal:I

    iget-object v3, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->trackFormat:Landroidx/media3/common/Format;

    iget v3, v3, Landroidx/media3/common/Format;->tileCountVertical:I

    mul-int v0, v0, v3

    .line 166
    iget-wide v3, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->endTimeUs:J

    iget-wide v5, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->startTimeUs:J

    sub-long/2addr v3, v5

    int-to-long v5, v0

    div-long v10, v3, v5

    :goto_0
    if-ge v1, v0, :cond_3

    int-to-long v3, v1

    mul-long v4, v3, v10

    .line 170
    new-instance v3, Landroidx/media3/common/util/ParsableByteArray;

    invoke-direct {v3}, Landroidx/media3/common/util/ParsableByteArray;-><init>()V

    invoke-interface {p1, v3, v2}, Landroidx/media3/extractor/TrackOutput;->sampleData(Landroidx/media3/common/util/ParsableByteArray;I)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, p1

    .line 171
    invoke-interface/range {v3 .. v9}, Landroidx/media3/extractor/TrackOutput;->sampleMetadata(JIIILandroidx/media3/extractor/TrackOutput$CryptoData;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public final cancelLoad()V
    .locals 1

    const/4 v0, 0x1

    .line 109
    iput-boolean v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->loadCanceled:Z

    return-void
.end method

.method public getNextChunkIndex()J
    .locals 4

    .line 97
    iget-wide v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->chunkIndex:J

    iget v2, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->chunkCount:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method protected getTrackOutputProvider(Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;)Landroidx/media3/exoplayer/source/chunk/ChunkExtractor$TrackOutputProvider;
    .locals 0

    return-object p1
.end method

.method public isLoadCompleted()Z
    .locals 1

    .line 102
    iget-boolean v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->loadCompleted:Z

    return v0
.end method

.method public final load()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 115
    invoke-virtual {p0}, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->getOutput()Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;

    move-result-object v0

    .line 116
    iget-wide v1, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->nextLoadPosition:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_2

    .line 118
    iget-wide v1, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->sampleOffsetUs:J

    invoke-virtual {v0, v1, v2}, Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;->setSampleOffsetUs(J)V

    .line 119
    iget-object v3, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->chunkExtractor:Landroidx/media3/exoplayer/source/chunk/ChunkExtractor;

    .line 120
    invoke-virtual {p0, v0}, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->getTrackOutputProvider(Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;)Landroidx/media3/exoplayer/source/chunk/ChunkExtractor$TrackOutputProvider;

    move-result-object v4

    .line 121
    iget-wide v1, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->clippedStartTimeUs:J

    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v7, v1, v5

    if-nez v7, :cond_0

    move-wide v1, v5

    goto :goto_0

    :cond_0
    iget-wide v1, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->clippedStartTimeUs:J

    iget-wide v7, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->sampleOffsetUs:J

    sub-long/2addr v1, v7

    .line 122
    :goto_0
    iget-wide v7, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->clippedEndTimeUs:J

    cmp-long v9, v7, v5

    if-nez v9, :cond_1

    goto :goto_1

    :cond_1
    iget-wide v5, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->clippedEndTimeUs:J

    iget-wide v7, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->sampleOffsetUs:J

    sub-long/2addr v5, v7

    :goto_1
    move-wide v7, v5

    move-wide v5, v1

    .line 119
    invoke-interface/range {v3 .. v8}, Landroidx/media3/exoplayer/source/chunk/ChunkExtractor;->init(Landroidx/media3/exoplayer/source/chunk/ChunkExtractor$TrackOutputProvider;JJ)V

    .line 126
    :cond_2
    :try_start_0
    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->dataSpec:Landroidx/media3/datasource/DataSpec;

    iget-wide v2, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->nextLoadPosition:J

    invoke-virtual {v1, v2, v3}, Landroidx/media3/datasource/DataSpec;->subrange(J)Landroidx/media3/datasource/DataSpec;

    move-result-object v1

    .line 127
    new-instance v8, Landroidx/media3/extractor/DefaultExtractorInput;

    iget-object v3, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->dataSource:Landroidx/media3/datasource/StatsDataSource;

    iget-wide v4, v1, Landroidx/media3/datasource/DataSpec;->position:J

    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->dataSource:Landroidx/media3/datasource/StatsDataSource;

    .line 129
    invoke-virtual {v2, v1}, Landroidx/media3/datasource/StatsDataSource;->open(Landroidx/media3/datasource/DataSpec;)J

    move-result-wide v6

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Landroidx/media3/extractor/DefaultExtractorInput;-><init>(Landroidx/media3/common/DataReader;JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 132
    :goto_2
    :try_start_1
    iget-boolean v1, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->loadCanceled:Z

    if-nez v1, :cond_3

    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->chunkExtractor:Landroidx/media3/exoplayer/source/chunk/ChunkExtractor;

    invoke-interface {v1, v8}, Landroidx/media3/exoplayer/source/chunk/ChunkExtractor;->read(Landroidx/media3/extractor/ExtractorInput;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_2

    .line 133
    :cond_3
    invoke-direct {p0, v0}, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->maybeWriteEmptySamples(Landroidx/media3/exoplayer/source/chunk/BaseMediaChunkOutput;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 135
    :try_start_2
    invoke-interface {v8}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide v0

    iget-object v2, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->dataSpec:Landroidx/media3/datasource/DataSpec;

    iget-wide v2, v2, Landroidx/media3/datasource/DataSpec;->position:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->nextLoadPosition:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 138
    iget-object v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->dataSource:Landroidx/media3/datasource/StatsDataSource;

    invoke-static {v0}, Landroidx/media3/datasource/DataSourceUtil;->closeQuietly(Landroidx/media3/datasource/DataSource;)V

    .line 140
    iget-boolean v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->loadCanceled:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->loadCompleted:Z

    return-void

    :catchall_0
    move-exception v0

    .line 135
    :try_start_3
    invoke-interface {v8}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide v1

    iget-object v3, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->dataSpec:Landroidx/media3/datasource/DataSpec;

    iget-wide v3, v3, Landroidx/media3/datasource/DataSpec;->position:J

    sub-long/2addr v1, v3

    iput-wide v1, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->nextLoadPosition:J

    .line 136
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v0

    .line 138
    iget-object v1, p0, Landroidx/media3/exoplayer/source/chunk/ContainerMediaChunk;->dataSource:Landroidx/media3/datasource/StatsDataSource;

    invoke-static {v1}, Landroidx/media3/datasource/DataSourceUtil;->closeQuietly(Landroidx/media3/datasource/DataSource;)V

    .line 139
    throw v0
.end method
