.class public final Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;
.super Ljava/lang/Object;
.source "RtspMediaSource.java"

# interfaces
.implements Landroidx/media3/exoplayer/source/MediaSourceFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/rtsp/RtspMediaSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Factory"
.end annotation


# instance fields
.field private debugLoggingEnabled:Z

.field private forceUseRtpTcp:Z

.field private socketFactory:Ljavax/net/SocketFactory;

.field private timeoutMs:J

.field private userAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x1f40

    .line 78
    iput-wide v0, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->timeoutMs:J

    .line 79
    const-string v0, "AndroidXMedia3/1.4.1"

    iput-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->userAgent:Ljava/lang/String;

    .line 80
    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->socketFactory:Ljavax/net/SocketFactory;

    return-void
.end method


# virtual methods
.method public createMediaSource(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/rtsp/RtspMediaSource;
    .locals 7

    .line 182
    iget-object v0, p1, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    new-instance v0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource;

    .line 185
    iget-boolean v1, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->forceUseRtpTcp:Z

    if-eqz v1, :cond_0

    .line 186
    new-instance v1, Landroidx/media3/exoplayer/rtsp/TransferRtpDataChannelFactory;

    iget-wide v2, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->timeoutMs:J

    invoke-direct {v1, v2, v3}, Landroidx/media3/exoplayer/rtsp/TransferRtpDataChannelFactory;-><init>(J)V

    goto :goto_0

    .line 187
    :cond_0
    new-instance v1, Landroidx/media3/exoplayer/rtsp/UdpDataSourceRtpDataChannelFactory;

    iget-wide v2, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->timeoutMs:J

    invoke-direct {v1, v2, v3}, Landroidx/media3/exoplayer/rtsp/UdpDataSourceRtpDataChannelFactory;-><init>(J)V

    :goto_0
    move-object v3, v1

    iget-object v4, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->userAgent:Ljava/lang/String;

    iget-object v5, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->socketFactory:Ljavax/net/SocketFactory;

    iget-boolean v6, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->debugLoggingEnabled:Z

    move-object v1, v0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Landroidx/media3/exoplayer/rtsp/RtspMediaSource;-><init>(Landroidx/media3/common/MediaItem;Landroidx/media3/exoplayer/rtsp/RtpDataChannel$Factory;Ljava/lang/String;Ljavax/net/SocketFactory;Z)V

    return-object v0
.end method

.method public bridge synthetic createMediaSource(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/source/MediaSource;
    .locals 0

    .line 68
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->createMediaSource(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/rtsp/RtspMediaSource;

    move-result-object p1

    return-object p1
.end method

.method public synthetic experimentalParseSubtitlesDuringExtraction(Z)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/exoplayer/source/MediaSource$Factory$-CC;->$default$experimentalParseSubtitlesDuringExtraction(Landroidx/media3/exoplayer/source/MediaSource$Factory;Z)Landroidx/media3/exoplayer/source/MediaSource$Factory;

    move-result-object p1

    return-object p1
.end method

.method public getSupportedTypes()[I
    .locals 1

    const/4 v0, 0x3

    .line 170
    filled-new-array {v0}, [I

    move-result-object v0

    return-object v0
.end method

.method public synthetic setCmcdConfigurationFactory(Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/exoplayer/source/MediaSource$Factory$-CC;->$default$setCmcdConfigurationFactory(Landroidx/media3/exoplayer/source/MediaSource$Factory;Landroidx/media3/exoplayer/upstream/CmcdConfiguration$Factory;)Landroidx/media3/exoplayer/source/MediaSource$Factory;

    move-result-object p1

    return-object p1
.end method

.method public setDebugLoggingEnabled(Z)Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;
    .locals 0

    .line 136
    iput-boolean p1, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->debugLoggingEnabled:Z

    return-object p0
.end method

.method public setDrmSessionManagerProvider(Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;)Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;
    .locals 0

    return-object p0
.end method

.method public bridge synthetic setDrmSessionManagerProvider(Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 0

    .line 68
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->setDrmSessionManagerProvider(Landroidx/media3/exoplayer/drm/DrmSessionManagerProvider;)Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;

    move-result-object p1

    return-object p1
.end method

.method public setForceUseRtpTcp(Z)Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;
    .locals 0

    .line 96
    iput-boolean p1, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->forceUseRtpTcp:Z

    return-object p0
.end method

.method public setLoadErrorHandlingPolicy(Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;)Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;
    .locals 0

    return-object p0
.end method

.method public bridge synthetic setLoadErrorHandlingPolicy(Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 0

    .line 68
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->setLoadErrorHandlingPolicy(Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;)Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;

    move-result-object p1

    return-object p1
.end method

.method public setSocketFactory(Ljavax/net/SocketFactory;)Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;
    .locals 0

    .line 121
    iput-object p1, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->socketFactory:Ljavax/net/SocketFactory;

    return-object p0
.end method

.method public synthetic setSubtitleParserFactory(Landroidx/media3/extractor/text/SubtitleParser$Factory;)Landroidx/media3/exoplayer/source/MediaSource$Factory;
    .locals 0

    invoke-static {p0, p1}, Landroidx/media3/exoplayer/source/MediaSource$Factory$-CC;->$default$setSubtitleParserFactory(Landroidx/media3/exoplayer/source/MediaSource$Factory;Landroidx/media3/extractor/text/SubtitleParser$Factory;)Landroidx/media3/exoplayer/source/MediaSource$Factory;

    move-result-object p1

    return-object p1
.end method

.method public setTimeoutMs(J)Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 151
    :goto_0
    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 152
    iput-wide p1, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->timeoutMs:J

    return-object p0
.end method

.method public setUserAgent(Ljava/lang/String;)Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;
    .locals 0

    .line 108
    iput-object p1, p0, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$Factory;->userAgent:Ljava/lang/String;

    return-object p0
.end method
