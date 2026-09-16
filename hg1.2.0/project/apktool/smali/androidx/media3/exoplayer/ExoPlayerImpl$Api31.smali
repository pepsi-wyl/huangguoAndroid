.class final Landroidx/media3/exoplayer/ExoPlayerImpl$Api31;
.super Ljava/lang/Object;
.source "ExoPlayerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/ExoPlayerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Api31"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 3424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static registerMediaMetricsListener(Landroid/content/Context;Landroidx/media3/exoplayer/ExoPlayerImpl;ZLjava/lang/String;)Landroidx/media3/exoplayer/analytics/PlayerId;
    .locals 0

    .line 3429
    invoke-static {p0}, Landroidx/media3/exoplayer/analytics/MediaMetricsListener;->create(Landroid/content/Context;)Landroidx/media3/exoplayer/analytics/MediaMetricsListener;

    move-result-object p0

    if-nez p0, :cond_0

    .line 3431
    const-string p0, "ExoPlayerImpl"

    const-string p1, "MediaMetricsService unavailable."

    invoke-static {p0, p1}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 3432
    new-instance p0, Landroidx/media3/exoplayer/analytics/PlayerId;

    invoke-static {}, Landroidx/media3/exoplayer/ExoPlayerImpl$$ExternalSyntheticApiModelOutline0;->m()Landroid/media/metrics/LogSessionId;

    move-result-object p1

    invoke-direct {p0, p1, p3}, Landroidx/media3/exoplayer/analytics/PlayerId;-><init>(Landroid/media/metrics/LogSessionId;Ljava/lang/String;)V

    return-object p0

    :cond_0
    if-eqz p2, :cond_1

    .line 3435
    invoke-virtual {p1, p0}, Landroidx/media3/exoplayer/ExoPlayerImpl;->addAnalyticsListener(Landroidx/media3/exoplayer/analytics/AnalyticsListener;)V

    .line 3437
    :cond_1
    new-instance p1, Landroidx/media3/exoplayer/analytics/PlayerId;

    invoke-virtual {p0}, Landroidx/media3/exoplayer/analytics/MediaMetricsListener;->getLogSessionId()Landroid/media/metrics/LogSessionId;

    move-result-object p0

    invoke-direct {p1, p0, p3}, Landroidx/media3/exoplayer/analytics/PlayerId;-><init>(Landroid/media/metrics/LogSessionId;Ljava/lang/String;)V

    return-object p1
.end method
