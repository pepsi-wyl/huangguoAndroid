.class final Lio/flutter/plugins/videoplayer/RtspVideoAsset;
.super Lio/flutter/plugins/videoplayer/VideoAsset;
.source "RtspVideoAsset.java"


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lio/flutter/plugins/videoplayer/VideoAsset;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method getMediaItem()Landroidx/media3/common/MediaItem;
    .locals 2

    .line 23
    new-instance v0, Landroidx/media3/common/MediaItem$Builder;

    invoke-direct {v0}, Landroidx/media3/common/MediaItem$Builder;-><init>()V

    iget-object v1, p0, Lio/flutter/plugins/videoplayer/RtspVideoAsset;->assetUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroidx/media3/common/MediaItem$Builder;->setUri(Ljava/lang/String;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object v0

    return-object v0
.end method

.method getMediaSourceFactory(Landroid/content/Context;)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 0

    .line 30
    new-instance p1, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;

    invoke-direct {p1}, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;-><init>()V

    return-object p1
.end method
