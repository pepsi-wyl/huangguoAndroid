.class public final Landroidx/media3/exoplayer/smoothstreaming/offline/SsDownloader;
.super Landroidx/media3/exoplayer/offline/SegmentDownloader;
.source "SsDownloader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/media3/exoplayer/offline/SegmentDownloader<",
        "Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroidx/media3/common/MediaItem;Landroidx/media3/datasource/cache/CacheDataSource$Factory;)V
    .locals 1

    .line 73
    new-instance v0, Landroidx/media3/exoplayer/dash/offline/DashDownloader$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Landroidx/media3/exoplayer/dash/offline/DashDownloader$$ExternalSyntheticLambda0;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Landroidx/media3/exoplayer/smoothstreaming/offline/SsDownloader;-><init>(Landroidx/media3/common/MediaItem;Landroidx/media3/datasource/cache/CacheDataSource$Factory;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method public constructor <init>(Landroidx/media3/common/MediaItem;Landroidx/media3/datasource/cache/CacheDataSource$Factory;Ljava/util/concurrent/Executor;)V
    .locals 7

    .line 90
    invoke-virtual {p1}, Landroidx/media3/common/MediaItem;->buildUpon()Landroidx/media3/common/MediaItem$Builder;

    move-result-object v0

    iget-object p1, p1, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    .line 93
    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/common/MediaItem$LocalConfiguration;

    iget-object p1, p1, Landroidx/media3/common/MediaItem$LocalConfiguration;->uri:Landroid/net/Uri;

    .line 92
    invoke-static {p1}, Landroidx/media3/common/util/Util;->fixSmoothStreamingIsmManifestUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p1

    .line 91
    invoke-virtual {v0, p1}, Landroidx/media3/common/MediaItem$Builder;->setUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object p1

    .line 94
    invoke-virtual {p1}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object v1

    new-instance v2, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifestParser;

    invoke-direct {v2}, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifestParser;-><init>()V

    const-wide/16 v5, 0x4e20

    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    .line 88
    invoke-direct/range {v0 .. v6}, Landroidx/media3/exoplayer/smoothstreaming/offline/SsDownloader;-><init>(Landroidx/media3/common/MediaItem;Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;Landroidx/media3/datasource/cache/CacheDataSource$Factory;Ljava/util/concurrent/Executor;J)V

    return-void
.end method

.method public constructor <init>(Landroidx/media3/common/MediaItem;Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;Landroidx/media3/datasource/cache/CacheDataSource$Factory;Ljava/util/concurrent/Executor;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/common/MediaItem;",
            "Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser<",
            "Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;",
            ">;",
            "Landroidx/media3/datasource/cache/CacheDataSource$Factory;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-wide/16 v5, 0x4e20

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 111
    invoke-direct/range {v0 .. v6}, Landroidx/media3/exoplayer/smoothstreaming/offline/SsDownloader;-><init>(Landroidx/media3/common/MediaItem;Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;Landroidx/media3/datasource/cache/CacheDataSource$Factory;Ljava/util/concurrent/Executor;J)V

    return-void
.end method

.method public constructor <init>(Landroidx/media3/common/MediaItem;Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;Landroidx/media3/datasource/cache/CacheDataSource$Factory;Ljava/util/concurrent/Executor;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/common/MediaItem;",
            "Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser<",
            "Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;",
            ">;",
            "Landroidx/media3/datasource/cache/CacheDataSource$Factory;",
            "Ljava/util/concurrent/Executor;",
            "J)V"
        }
    .end annotation

    .line 139
    invoke-direct/range {p0 .. p6}, Landroidx/media3/exoplayer/offline/SegmentDownloader;-><init>(Landroidx/media3/common/MediaItem;Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;Landroidx/media3/datasource/cache/CacheDataSource$Factory;Ljava/util/concurrent/Executor;J)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic getSegments(Landroidx/media3/datasource/DataSource;Landroidx/media3/exoplayer/offline/FilterableManifest;Z)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 62
    check-cast p2, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;

    invoke-virtual {p0, p1, p2, p3}, Landroidx/media3/exoplayer/smoothstreaming/offline/SsDownloader;->getSegments(Landroidx/media3/datasource/DataSource;Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;Z)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected getSegments(Landroidx/media3/datasource/DataSource;Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;Z)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/datasource/DataSource;",
            "Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;",
            "Z)",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/offline/SegmentDownloader$Segment;",
            ">;"
        }
    .end annotation

    .line 150
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 151
    iget-object p2, p2, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;->streamElements:[Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest$StreamElement;

    array-length p3, p2

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p3, :cond_2

    aget-object v2, p2, v1

    const/4 v3, 0x0

    .line 152
    :goto_1
    iget-object v4, v2, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest$StreamElement;->formats:[Landroidx/media3/common/Format;

    array-length v4, v4

    if-ge v3, v4, :cond_1

    const/4 v4, 0x0

    .line 153
    :goto_2
    iget v5, v2, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest$StreamElement;->chunkCount:I

    if-ge v4, v5, :cond_0

    .line 154
    new-instance v5, Landroidx/media3/exoplayer/offline/SegmentDownloader$Segment;

    .line 156
    invoke-virtual {v2, v4}, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest$StreamElement;->getStartTimeUs(I)J

    move-result-wide v6

    new-instance v8, Landroidx/media3/datasource/DataSpec;

    .line 157
    invoke-virtual {v2, v3, v4}, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest$StreamElement;->buildRequestUri(II)Landroid/net/Uri;

    move-result-object v9

    invoke-direct {v8, v9}, Landroidx/media3/datasource/DataSpec;-><init>(Landroid/net/Uri;)V

    invoke-direct {v5, v6, v7, v8}, Landroidx/media3/exoplayer/offline/SegmentDownloader$Segment;-><init>(JLandroidx/media3/datasource/DataSpec;)V

    .line 154
    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-object p1
.end method
