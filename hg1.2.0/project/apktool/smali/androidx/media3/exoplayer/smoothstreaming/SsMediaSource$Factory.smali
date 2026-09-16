.class public final Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;
.super Ljava/lang/Object;
.source "SsMediaSource.java"

# interfaces
.implements Landroidx/media3/exoplayer/source/MediaSourceFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Factory"
.end annotation


# instance fields
.field private final chunkSourceFactory:Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;

.field private cmcdConfigurationFactory:Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;

.field private compositeSequenceableLoaderFactory:Landroidx/media3/exoplayer/source/CompositeSequenceableLoaderFactory;

.field private drmSessionManagerProvider:Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;

.field private livePresentationDelayMs:J

.field private loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

.field private final manifestDataSourceFactory:Landroidx/media3/datasource/DataSource$Factory;

.field private manifestParser:Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser<",
            "+",
            "Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/media3/datasource/DataSource$Factory;)V
    .locals 1

    .line 114
    new-instance v0, Landroidx/media3/exoplayer/smoothstreaming/DefaultSsChunkSource$Factory;

    invoke-direct {v0, p1}, Landroidx/media3/exoplayer/smoothstreaming/DefaultSsChunkSource$Factory;-><init>(Landroidx/media3/datasource/DataSource$Factory;)V

    invoke-direct {p0, v0, p1}, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;-><init>(Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;Landroidx/media3/datasource/DataSource$Factory;)V

    return-void
.end method

.method public constructor <init>(Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;Landroidx/media3/datasource/DataSource$Factory;)V
    .locals 0

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;

    iput-object p1, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->chunkSourceFactory:Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;

    .line 137
    iput-object p2, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->manifestDataSourceFactory:Landroidx/media3/datasource/DataSource$Factory;

    .line 138
    new-instance p1, Landroidx/media3/exoplayer/drm/DefaultDrmSessionManagerProvider;

    invoke-direct {p1}, Landroidx/media3/exoplayer/drm/DefaultDrmSessionManagerProvider;-><init>()V

    iput-object p1, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->drmSessionManagerProvider:Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;

    .line 139
    new-instance p1, Landroidx/media3/exoplayer/upstream/DefaultLoadErrorHandlingPolicy;

    invoke-direct {p1}, Landroidx/media3/exoplayer/upstream/DefaultLoadErrorHandlingPolicy;-><init>()V

    iput-object p1, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    const-wide/16 p1, 0x7530

    .line 140
    iput-wide p1, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->livePresentationDelayMs:J

    .line 141
    new-instance p1, Landroidx/media3/exoplayer/source/DefaultCompositeSequenceableLoaderFactory;

    invoke-direct {p1}, Landroidx/media3/exoplayer/source/DefaultCompositeSequenceableLoaderFactory;-><init>()V

    iput-object p1, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->compositeSequenceableLoaderFactory:Landroidx/media3/exoplayer/source/CompositeSequenceableLoaderFactory;

    const/4 p1, 0x1

    .line 142
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->experimentalParseSubtitlesDuringExtraction(Z)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;

    return-void
.end method


# virtual methods
.method public createMediaSource(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource;
    .locals 15

    move-object v0, p0

    move-object/from16 v2, p1

    .line 306
    iget-object v1, v2, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    iget-object v1, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->manifestParser:Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;

    if-nez v1, :cond_0

    .line 309
    new-instance v1, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifestParser;

    invoke-direct {v1}, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifestParser;-><init>()V

    .line 311
    :cond_0
    iget-object v3, v2, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    iget-object v3, v3, Landroidx/media3/common/MediaItem$LocalConfiguration;->streamKeys:Ljava/util/List;

    .line 312
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 313
    new-instance v4, Landroidx/media3/exoplayer/offline/FilteringManifestParser;

    invoke-direct {v4, v1, v3}, Landroidx/media3/exoplayer/offline/FilteringManifestParser;-><init>(Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;Ljava/util/List;)V

    move-object v5, v4

    goto :goto_0

    :cond_1
    move-object v5, v1

    .line 317
    :goto_0
    iget-object v1, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->cmcdConfigurationFactory:Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;

    if-nez v1, :cond_2

    const/4 v1, 0x0

    goto :goto_1

    .line 319
    :cond_2
    invoke-interface {v1, v2}, Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;->createCmcdConfiguration(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/upstream/CmcdConfiguration;

    move-result-object v1

    :goto_1
    move-object v8, v1

    .line 321
    new-instance v14, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource;

    iget-object v4, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->manifestDataSourceFactory:Landroidx/media3/datasource/DataSource$Factory;

    iget-object v6, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->chunkSourceFactory:Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;

    iget-object v7, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->compositeSequenceableLoaderFactory:Landroidx/media3/exoplayer/source/CompositeSequenceableLoaderFactory;

    iget-object v1, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->drmSessionManagerProvider:Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;

    .line 329
    invoke-interface {v1, v2}, Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;->get(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/drm/DrmSessionManager;

    move-result-object v9

    iget-object v10, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    iget-wide v11, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->livePresentationDelayMs:J

    const/4 v13, 0x0

    const/4 v3, 0x0

    move-object v1, v14

    move-object/from16 v2, p1

    invoke-direct/range {v1 .. v13}, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource;-><init>(Landroidx/media3/common/MediaItem;Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;Landroidx/media3/datasource/DataSource$Factory;Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;Landroidx/media3/exoplayer/source/CompositeSequenceableLoaderFactory;Landroidx/media3/exoplayer/upstream/CmcdConfiguration;Landroidx/media3/exoplayer/drm/DrmSessionManager;Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;JLandroidx/media3/exoplayer/smoothstreaming/SsMediaSource$1;)V

    return-object v14
.end method

.method public createMediaSource(Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource;
    .locals 1

    .line 251
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-static {v0}, Landroidx/media3/common/MediaItem;->fromUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->createMediaSource(Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource;

    move-result-object p1

    return-object p1
.end method

.method public createMediaSource(Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource;
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 264
    iget-boolean v3, v1, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;->isLive:Z

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    invoke-static {v3}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 266
    iget-object v3, v2, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    if-eqz v3, :cond_0

    .line 267
    iget-object v3, v2, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    iget-object v3, v3, Landroidx/media3/common/MediaItem$LocalConfiguration;->streamKeys:Ljava/util/List;

    goto :goto_0

    .line 268
    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v3

    .line 269
    :goto_0
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 270
    invoke-virtual {v1, v3}, Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;->copy(Ljava/util/List;)Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;

    move-result-object v1

    :cond_1
    move-object v7, v1

    .line 272
    iget-object v1, v2, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v4, 0x0

    .line 275
    :goto_1
    invoke-virtual/range {p2 .. p2}, Landroidx/media3/common/MediaItem;->buildUpon()Landroidx/media3/common/MediaItem$Builder;

    move-result-object v1

    const-string v3, "application/vnd.ms-sstr+xml"

    .line 276
    invoke-virtual {v1, v3}, Landroidx/media3/common/MediaItem$Builder;->setMimeType(Ljava/lang/String;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object v1

    if-eqz v4, :cond_3

    .line 277
    iget-object v2, v2, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    iget-object v2, v2, Landroidx/media3/common/MediaItem$LocalConfiguration;->uri:Landroid/net/Uri;

    goto :goto_2

    :cond_3
    sget-object v2, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    :goto_2
    invoke-virtual {v1, v2}, Landroidx/media3/common/MediaItem$Builder;->setUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object v1

    .line 278
    invoke-virtual {v1}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object v6

    .line 281
    iget-object v1, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->cmcdConfigurationFactory:Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;

    if-nez v1, :cond_4

    const/4 v1, 0x0

    goto :goto_3

    .line 283
    :cond_4
    invoke-interface {v1, v6}, Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;->createCmcdConfiguration(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/upstream/CmcdConfiguration;

    move-result-object v1

    :goto_3
    move-object v12, v1

    .line 284
    new-instance v1, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource;

    iget-object v10, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->chunkSourceFactory:Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;

    iget-object v11, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->compositeSequenceableLoaderFactory:Landroidx/media3/exoplayer/source/CompositeSequenceableLoaderFactory;

    iget-object v2, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->drmSessionManagerProvider:Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;

    .line 292
    invoke-interface {v2, v6}, Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;->get(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/drm/DrmSessionManager;

    move-result-object v13

    iget-object v14, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    iget-wide v2, v0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->livePresentationDelayMs:J

    const/16 v17, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v5, v1

    move-wide v15, v2

    invoke-direct/range {v5 .. v17}, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource;-><init>(Landroidx/media3/common/MediaItem;Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;Landroidx/media3/datasource/DataSource$Factory;Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;Landroidx/media3/exoplayer/source/CompositeSequenceableLoaderFactory;Landroidx/media3/exoplayer/upstream/CmcdConfiguration;Landroidx/media3/exoplayer/drm/DrmSessionManager;Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;JLandroidx/media3/exoplayer/smoothstreaming/SsMediaSource$1;)V

    return-object v1
.end method

.method public bridge synthetic createMediaSource(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/source/MediaSource;
    .locals 0

    .line 85
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->createMediaSource(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource;

    move-result-object p1

    return-object p1
.end method

.method public experimentalParseSubtitlesDuringExtraction(Z)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 169
    iget-object v0, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->chunkSourceFactory:Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;->experimentalParseSubtitlesDuringExtraction(Z)Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;

    return-object p0
.end method

.method public bridge synthetic experimentalParseSubtitlesDuringExtraction(Z)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 85
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->experimentalParseSubtitlesDuringExtraction(Z)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;

    move-result-object p1

    return-object p1
.end method

.method public getSupportedTypes()[I
    .locals 1

    const/4 v0, 0x1

    .line 336
    filled-new-array {v0}, [I

    move-result-object v0

    return-object v0
.end method

.method public setCmcdConfigurationFactory(Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;
    .locals 0

    .line 225
    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;

    iput-object p1, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->cmcdConfigurationFactory:Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;

    return-object p0
.end method

.method public bridge synthetic setCmcdConfigurationFactory(Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 0

    .line 85
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->setCmcdConfigurationFactory(Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;

    move-result-object p1

    return-object p1
.end method

.method public setCompositeSequenceableLoaderFactory(Landroidx/media3/exoplayer/source/CompositeSequenceableLoaderFactory;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;
    .locals 1

    .line 213
    const-string v0, "SsMediaSource.Factory#setCompositeSequenceableLoaderFactory no longer handles null by instantiating a new DefaultCompositeSequenceableLoaderFactory. Explicitly construct and pass an instance in order to retain the old behavior."

    .line 214
    invoke-static {p1, v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/source/CompositeSequenceableLoaderFactory;

    iput-object p1, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->compositeSequenceableLoaderFactory:Landroidx/media3/exoplayer/source/CompositeSequenceableLoaderFactory;

    return-object p0
.end method

.method public setDrmSessionManagerProvider(Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;
    .locals 1

    .line 233
    const-string v0, "MediaSource.Factory#setDrmSessionManagerProvider no longer handles null by instantiating a new DefaultDrmSessionManagerProvider. Explicitly construct and pass an instance in order to retain the old behavior."

    .line 234
    invoke-static {p1, v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;

    iput-object p1, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->drmSessionManagerProvider:Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;

    return-object p0
.end method

.method public bridge synthetic setDrmSessionManagerProvider(Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 0

    .line 85
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->setDrmSessionManagerProvider(Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;

    move-result-object p1

    return-object p1
.end method

.method public setLivePresentationDelayMs(J)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;
    .locals 0

    .line 184
    iput-wide p1, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->livePresentationDelayMs:J

    return-object p0
.end method

.method public setLoadErrorHandlingPolicy(Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;
    .locals 1

    .line 148
    const-string v0, "MediaSource.Factory#setLoadErrorHandlingPolicy no longer handles null by instantiating a new DefaultLoadErrorHandlingPolicy. Explicitly construct and pass an instance in order to retain the old behavior."

    .line 149
    invoke-static {p1, v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    iput-object p1, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->loadErrorHandlingPolicy:Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    return-object p0
.end method

.method public bridge synthetic setLoadErrorHandlingPolicy(Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 0

    .line 85
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->setLoadErrorHandlingPolicy(Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;

    move-result-object p1

    return-object p1
.end method

.method public setManifestParser(Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser<",
            "+",
            "Landroidx/media3/exoplayer/smoothstreaming/manifest/SsManifest;",
            ">;)",
            "Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;"
        }
    .end annotation

    .line 197
    iput-object p1, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->manifestParser:Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;

    return-object p0
.end method

.method public setSubtitleParserFactory(Landroidx/media3/extractor/text/SubtitleParser$Factory;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;
    .locals 1

    .line 160
    iget-object v0, p0, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->chunkSourceFactory:Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;

    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/extractor/text/SubtitleParser$Factory;

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;->setSubtitleParserFactory(Landroidx/media3/extractor/text/SubtitleParser$Factory;)Landroidx/media3/exoplayer/smoothstreaming/SsChunkSource$Factory;

    return-object p0
.end method

.method public bridge synthetic setSubtitleParserFactory(Landroidx/media3/extractor/text/SubtitleParser$Factory;)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 0

    .line 85
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;->setSubtitleParserFactory(Landroidx/media3/extractor/text/SubtitleParser$Factory;)Landroidx/media3/exoplayer/smoothstreaming/SsMediaSource$Factory;

    move-result-object p1

    return-object p1
.end method
