.class final Lio/flutter/plugins/videoplayer/HttpVideoAsset;
.super Lio/flutter/plugins/videoplayer/VideoAsset;
.source "HttpVideoAsset.java"


# static fields
.field private static final DEFAULT_USER_AGENT:Ljava/lang/String; = "IjkPlayer"

.field private static final HEADER_USER_AGENT:Ljava/lang/String; = "User-Agent"


# instance fields
.field private final httpHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final streamingFormat:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;


# direct methods
.method constructor <init>(Ljava/lang/String;Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1}, Lio/flutter/plugins/videoplayer/VideoAsset;-><init>(Ljava/lang/String;)V

    .line 34
    iput-object p2, p0, Lio/flutter/plugins/videoplayer/HttpVideoAsset;->streamingFormat:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    .line 35
    iput-object p3, p0, Lio/flutter/plugins/videoplayer/HttpVideoAsset;->httpHeaders:Ljava/util/Map;

    return-void
.end method

.method private static unstableUpdateDataSourceFactory(Landroidx/media3/datasource/DefaultHttpDataSource$Factory;Ljava/util/Map;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/datasource/DefaultHttpDataSource$Factory;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 92
    invoke-virtual {p0, p2}, Landroidx/media3/datasource/DefaultHttpDataSource$Factory;->setUserAgent(Ljava/lang/String;)Landroidx/media3/datasource/DefaultHttpDataSource$Factory;

    move-result-object p2

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroidx/media3/datasource/DefaultHttpDataSource$Factory;->setAllowCrossProtocolRedirects(Z)Landroidx/media3/datasource/DefaultHttpDataSource$Factory;

    .line 93
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_0

    .line 94
    invoke-virtual {p0, p1}, Landroidx/media3/datasource/DefaultHttpDataSource$Factory;->setDefaultRequestProperties(Ljava/util/Map;)Landroidx/media3/datasource/DefaultHttpDataSource$Factory;

    :cond_0
    return-void
.end method


# virtual methods
.method getMediaItem()Landroidx/media3/common/MediaItem;
    .locals 3

    .line 41
    new-instance v0, Landroidx/media3/common/MediaItem$Builder;

    invoke-direct {v0}, Landroidx/media3/common/MediaItem$Builder;-><init>()V

    iget-object v1, p0, Lio/flutter/plugins/videoplayer/HttpVideoAsset;->assetUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroidx/media3/common/MediaItem$Builder;->setUri(Ljava/lang/String;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object v0

    .line 43
    sget-object v1, Lio/flutter/plugins/videoplayer/HttpVideoAsset$1;->$SwitchMap$io$flutter$plugins$videoplayer$VideoAsset$StreamingFormat:[I

    iget-object v2, p0, Lio/flutter/plugins/videoplayer/HttpVideoAsset;->streamingFormat:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    invoke-virtual {v2}, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 51
    :cond_0
    const-string v1, "application/x-mpegURL"

    goto :goto_0

    .line 49
    :cond_1
    const-string v1, "application/dash+xml"

    goto :goto_0

    .line 46
    :cond_2
    const-string v1, "application/vnd.ms-sstr+xml"

    :goto_0
    if-eqz v1, :cond_3

    .line 55
    invoke-virtual {v0, v1}, Landroidx/media3/common/MediaItem$Builder;->setMimeType(Ljava/lang/String;)Landroidx/media3/common/MediaItem$Builder;

    .line 57
    :cond_3
    invoke-virtual {v0}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object v0

    return-object v0
.end method

.method getMediaSourceFactory(Landroid/content/Context;)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 1

    .line 62
    new-instance v0, Landroidx/media3/datasource/DefaultHttpDataSource$Factory;

    invoke-direct {v0}, Landroidx/media3/datasource/DefaultHttpDataSource$Factory;-><init>()V

    invoke-virtual {p0, p1, v0}, Lio/flutter/plugins/videoplayer/HttpVideoAsset;->getMediaSourceFactory(Landroid/content/Context;Landroidx/media3/datasource/DefaultHttpDataSource$Factory;)Landroidx/media3/exoplayer/source/MediaSource$Factory;

    move-result-object p1

    return-object p1
.end method

.method getMediaSourceFactory(Landroid/content/Context;Landroidx/media3/datasource/DefaultHttpDataSource$Factory;)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 2

    .line 78
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/HttpVideoAsset;->httpHeaders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/flutter/plugins/videoplayer/HttpVideoAsset;->httpHeaders:Ljava/util/Map;

    const-string v1, "User-Agent"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/HttpVideoAsset;->httpHeaders:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    .line 81
    :cond_0
    const-string v0, "IjkPlayer"

    :goto_0
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/HttpVideoAsset;->httpHeaders:Ljava/util/Map;

    invoke-static {p2, v1, v0}, Lio/flutter/plugins/videoplayer/HttpVideoAsset;->unstableUpdateDataSourceFactory(Landroidx/media3/datasource/DefaultHttpDataSource$Factory;Ljava/util/Map;Ljava/lang/String;)V

    .line 82
    new-instance v0, Landroidx/media3/datasource/DefaultDataSource$Factory;

    invoke-direct {v0, p1, p2}, Landroidx/media3/datasource/DefaultDataSource$Factory;-><init>(Landroid/content/Context;Landroidx/media3/datasource/DataSource$Factory;)V

    .line 83
    new-instance p2, Landroidx/media3/exoplayer/source/DefaultMediaSourceFactory;

    invoke-direct {p2, p1}, Landroidx/media3/exoplayer/source/DefaultMediaSourceFactory;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Landroidx/media3/exoplayer/source/DefaultMediaSourceFactory;->setDataSourceFactory(Landroidx/media3/datasource/DataSource$Factory;)Landroidx/media3/exoplayer/source/DefaultMediaSourceFactory;

    move-result-object p1

    return-object p1
.end method
