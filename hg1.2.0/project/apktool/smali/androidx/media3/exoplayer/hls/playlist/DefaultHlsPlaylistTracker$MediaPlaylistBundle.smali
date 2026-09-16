.class final Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;
.super Ljava/lang/Object;
.source "DefaultHlsPlaylistTracker.java"

# interfaces
.implements Landroidx/media3/exoplayer/upstream/Loader$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MediaPlaylistBundle"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/media3/exoplayer/upstream/Loader$Callback<",
        "Landroidx/media3/exoplayer/upstream/ParsingLoadable<",
        "Landroidx/media3/exoplayer/hls/playlist/HlsPlaylist;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final BLOCK_MSN_PARAM:Ljava/lang/String; = "_HLS_msn"

.field private static final BLOCK_PART_PARAM:Ljava/lang/String; = "_HLS_part"

.field private static final SKIP_PARAM:Ljava/lang/String; = "_HLS_skip"


# instance fields
.field private activeForPlayback:Z

.field private earliestNextLoadTimeMs:J

.field private excludeUntilMs:J

.field private lastSnapshotChangeMs:J

.field private lastSnapshotLoadMs:J

.field private loadPending:Z

.field private final mediaPlaylistDataSource:Landroidx/media3/datasource/DataSource;

.field private final mediaPlaylistLoader:Landroidx/media3/exoplayer/upstream/Loader;

.field private playlistError:Ljava/io/IOException;

.field private playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

.field private final playlistUrl:Landroid/net/Uri;

.field final synthetic this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;


# direct methods
.method public constructor <init>(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;Landroid/net/Uri;)V
    .locals 1

    .line 557
    iput-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 558
    iput-object p2, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    .line 559
    new-instance p2, Landroidx/media3/exoplayer/upstream/Loader;

    const-string v0, "DefaultHlsPlaylistTracker:MediaPlaylist"

    invoke-direct {p2, v0}, Landroidx/media3/exoplayer/upstream/Loader;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoader:Landroidx/media3/exoplayer/upstream/Loader;

    .line 560
    invoke-static {p1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$700(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/hls/HlsDataSourceFactory;

    move-result-object p1

    const/4 p2, 0x4

    invoke-interface {p1, p2}, Landroidx/media3/exoplayer/hls/HlsDataSourceFactory;->createDataSource(I)Landroidx/media3/datasource/DataSource;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistDataSource:Landroidx/media3/datasource/DataSource;

    return-void
.end method

.method static synthetic access$000(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;J)Z
    .locals 0

    .line 538
    invoke-direct {p0, p1, p2}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->excludePlaylist(J)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;Landroidx/media3/exoplayer/source/LoadEventInfo;)V
    .locals 0

    .line 538
    invoke-direct {p0, p1, p2}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->processLoadedPlaylist(Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;Landroidx/media3/exoplayer/source/LoadEventInfo;)V

    return-void
.end method

.method static synthetic access$300(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;)J
    .locals 2

    .line 538
    iget-wide v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->excludeUntilMs:J

    return-wide v0
.end method

.method static synthetic access$400(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;)Landroid/net/Uri;
    .locals 0

    .line 538
    iget-object p0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$500(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;Landroid/net/Uri;)V
    .locals 0

    .line 538
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->loadPlaylistInternal(Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$600(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;)Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;
    .locals 0

    .line 538
    iget-object p0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    return-object p0
.end method

.method private excludePlaylist(J)Z
    .locals 2

    .line 844
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    add-long/2addr v0, p1

    iput-wide v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->excludeUntilMs:J

    .line 845
    iget-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    iget-object p2, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {p2}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$1700(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {p1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$1800(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private getMediaPlaylistUriForReload()Landroid/net/Uri;
    .locals 8

    .line 809
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    if-eqz v0, :cond_5

    iget-object v0, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->serverControl:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;

    iget-wide v0, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;->skipUntilUs:J

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-object v0, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->serverControl:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;

    iget-boolean v0, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;->canBlockReload:Z

    if-nez v0, :cond_0

    goto :goto_1

    .line 814
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 815
    iget-object v1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-object v1, v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->serverControl:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;

    iget-boolean v1, v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;->canBlockReload:Z

    if-eqz v1, :cond_2

    .line 816
    iget-object v1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-wide v4, v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->mediaSequence:J

    iget-object v1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-object v1, v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->segments:Ljava/util/List;

    .line 817
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    int-to-long v6, v1

    add-long/2addr v4, v6

    .line 818
    const-string v1, "_HLS_msn"

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 819
    iget-object v1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-wide v4, v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->partTargetDurationUs:J

    cmp-long v1, v4, v2

    if-eqz v1, :cond_2

    .line 820
    iget-object v1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-object v1, v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->trailingParts:Ljava/util/List;

    .line 821
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    .line 822
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    invoke-static {v1}, Lcom/google/common/collect/Iterables;->getLast(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Part;

    iget-boolean v1, v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Part;->isPreload:Z

    if-eqz v1, :cond_1

    add-int/lit8 v4, v4, -0x1

    .line 826
    :cond_1
    const-string v1, "_HLS_part"

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v1, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 829
    :cond_2
    iget-object v1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-object v1, v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->serverControl:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;

    iget-wide v4, v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;->skipUntilUs:J

    cmp-long v1, v4, v2

    if-eqz v1, :cond_4

    .line 831
    iget-object v1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-object v1, v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->serverControl:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;

    iget-boolean v1, v1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;->canSkipDateRanges:Z

    if-eqz v1, :cond_3

    const-string v1, "v2"

    goto :goto_0

    :cond_3
    const-string v1, "YES"

    .line 830
    :goto_0
    const-string v2, "_HLS_skip"

    invoke-virtual {v0, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 833
    :cond_4
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0

    .line 812
    :cond_5
    :goto_1
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    return-object v0
.end method

.method private loadPlaylistImmediately(Landroid/net/Uri;)V
    .locals 8

    .line 731
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    .line 732
    invoke-static {v0}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$1300(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/hls/playlist/HlsPlaylistParserFactory;

    move-result-object v0

    iget-object v1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$1200(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/hls/playlist/HlsMultivariantPlaylist;

    move-result-object v1

    iget-object v2, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    invoke-interface {v0, v1, v2}, Landroidx/media3/exoplayer/hls/playlist/HlsPlaylistParserFactory;->createPlaylistParser(Landroidx/media3/exoplayer/hls/playlist/HlsMultivariantPlaylist;Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;)Landroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;

    move-result-object v0

    .line 733
    new-instance v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;

    iget-object v2, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistDataSource:Landroidx/media3/datasource/DataSource;

    const/4 v3, 0x4

    invoke-direct {v1, v2, p1, v3, v0}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;-><init>(Landroidx/media3/datasource/DataSource;Landroid/net/Uri;ILandroidx/media3/exoplayer/upstream/ParsingLoadable$Parser;)V

    .line 739
    iget-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoader:Landroidx/media3/exoplayer/upstream/Loader;

    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    .line 743
    invoke-static {v0}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$900(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    move-result-object v0

    iget v2, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->type:I

    invoke-interface {v0, v2}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->getMinimumLoadableRetryCount(I)I

    move-result v0

    .line 740
    invoke-virtual {p1, v1, p0, v0}, Landroidx/media3/exoplayer/upstream/Loader;->startLoading(Landroidx/media3/exoplayer/upstream/Loader$Loadable;Landroidx/media3/exoplayer/upstream/Loader$Callback;I)J

    move-result-wide v6

    .line 744
    iget-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {p1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$800(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    move-result-object p1

    new-instance v0, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v3, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->loadTaskId:J

    iget-object v5, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->dataSpec:Landroidx/media3/datasource/DataSpec;

    move-object v2, v0

    invoke-direct/range {v2 .. v7}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;J)V

    iget v1, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->type:I

    invoke-virtual {p1, v0, v1}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadStarted(Landroidx/media3/exoplayer/source/LoadEventInfo;I)V

    return-void
.end method

.method private loadPlaylistInternal(Landroid/net/Uri;)V
    .locals 6

    const-wide/16 v0, 0x0

    .line 711
    iput-wide v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->excludeUntilMs:J

    .line 712
    iget-boolean v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->loadPending:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->isLoading()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->hasFatalError()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 716
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 717
    iget-wide v2, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->earliestNextLoadTimeMs:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    const/4 v2, 0x1

    .line 718
    iput-boolean v2, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->loadPending:Z

    .line 719
    iget-object v2, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v2}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$1100(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroid/os/Handler;

    move-result-object v2

    new-instance v3, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle$$ExternalSyntheticLambda0;-><init>(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;Landroid/net/Uri;)V

    iget-wide v4, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->earliestNextLoadTimeMs:J

    sub-long/2addr v4, v0

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 726
    :cond_1
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->loadPlaylistImmediately(Landroid/net/Uri;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private processLoadedPlaylist(Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;Landroidx/media3/exoplayer/source/LoadEventInfo;)V
    .locals 11

    .line 752
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    .line 753
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 754
    iput-wide v1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->lastSnapshotLoadMs:J

    .line 755
    iget-object v3, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v3, v0, p1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$1400(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;)Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    move-result-object v3

    iput-object v3, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    const/4 v4, 0x0

    if-eq v3, v0, :cond_0

    .line 757
    iput-object v4, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistError:Ljava/io/IOException;

    .line 758
    iput-wide v1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->lastSnapshotChangeMs:J

    .line 759
    iget-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    iget-object v4, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    invoke-static {p1, v4, v3}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$1500(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;Landroid/net/Uri;Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;)V

    goto :goto_1

    .line 760
    :cond_0
    iget-boolean v3, v3, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->hasEndTag:Z

    if-nez v3, :cond_3

    .line 763
    iget-wide v5, p1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->mediaSequence:J

    iget-object p1, p1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    int-to-long v7, p1

    add-long/2addr v5, v7

    iget-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-wide v7, p1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->mediaSequence:J

    const/4 p1, 0x1

    cmp-long v3, v5, v7

    if-gez v3, :cond_1

    .line 769
    new-instance v4, Landroidx/media3/exoplayer/hls/playlist/HlsPlaylistTracker$PlaylistResetException;

    iget-object v3, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    invoke-direct {v4, v3}, Landroidx/media3/exoplayer/hls/playlist/HlsPlaylistTracker$PlaylistResetException;-><init>(Landroid/net/Uri;)V

    const/4 v3, 0x1

    goto :goto_0

    .line 770
    :cond_1
    iget-wide v5, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->lastSnapshotChangeMs:J

    sub-long v5, v1, v5

    long-to-double v5, v5

    iget-object v3, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-wide v7, v3, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->targetDurationUs:J

    .line 771
    invoke-static {v7, v8}, Landroidx/media3/common/util/Util;->usToMs(J)J

    move-result-wide v7

    long-to-double v7, v7

    iget-object v3, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    .line 772
    invoke-static {v3}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$1600(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)D

    move-result-wide v9

    mul-double v7, v7, v9

    const/4 v3, 0x0

    cmpl-double v9, v5, v7

    if-lez v9, :cond_2

    .line 774
    new-instance v4, Landroidx/media3/exoplayer/hls/playlist/HlsPlaylistTracker$PlaylistStuckException;

    iget-object v5, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    invoke-direct {v4, v5}, Landroidx/media3/exoplayer/hls/playlist/HlsPlaylistTracker$PlaylistStuckException;-><init>(Landroid/net/Uri;)V

    :cond_2
    :goto_0
    if-eqz v4, :cond_3

    .line 777
    iput-object v4, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistError:Ljava/io/IOException;

    .line 778
    iget-object v5, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    iget-object v6, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    new-instance v7, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;

    new-instance v8, Landroidx/media3/exoplayer/source/MediaLoadData;

    const/4 v9, 0x4

    invoke-direct {v8, v9}, Landroidx/media3/exoplayer/source/MediaLoadData;-><init>(I)V

    invoke-direct {v7, p2, v8, v4, p1}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;-><init>(Landroidx/media3/exoplayer/source/LoadEventInfo;Landroidx/media3/exoplayer/source/MediaLoadData;Ljava/io/IOException;I)V

    invoke-static {v5, v6, v7, v3}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$1000(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;Landroid/net/Uri;Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;Z)Z

    .line 789
    :cond_3
    :goto_1
    iget-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-object p1, p1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->serverControl:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;

    iget-boolean p1, p1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$ServerControl;->canBlockReload:Z

    if-nez p1, :cond_5

    .line 793
    iget-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    if-eq p1, v0, :cond_4

    .line 794
    iget-wide v3, p1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->targetDurationUs:J

    goto :goto_2

    .line 795
    :cond_4
    iget-wide v3, p1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->targetDurationUs:J

    const-wide/16 v5, 0x2

    div-long/2addr v3, v5

    goto :goto_2

    :cond_5
    const-wide/16 v3, 0x0

    .line 798
    :goto_2
    invoke-static {v3, v4}, Landroidx/media3/common/util/Util;->usToMs(J)J

    move-result-wide v3

    add-long/2addr v1, v3

    iget-wide p1, p2, Landroidx/media3/exoplayer/source/LoadEventInfo;->loadDurationMs:J

    sub-long/2addr v1, p1

    iput-wide v1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->earliestNextLoadTimeMs:J

    .line 802
    iget-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-boolean p1, p1, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->hasEndTag:Z

    if-nez p1, :cond_7

    iget-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    iget-object p2, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    .line 803
    invoke-static {p2}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$1700(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    iget-boolean p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->activeForPlayback:Z

    if-eqz p1, :cond_7

    .line 804
    :cond_6
    invoke-direct {p0}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->getMediaPlaylistUriForReload()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->loadPlaylistInternal(Landroid/net/Uri;)V

    :cond_7
    return-void
.end method


# virtual methods
.method public getPlaylistSnapshot()Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;
    .locals 1

    .line 565
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    return-object v0
.end method

.method public isActiveForPlayback()Z
    .locals 1

    .line 592
    iget-boolean v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->activeForPlayback:Z

    return v0
.end method

.method public isSnapshotValid()Z
    .locals 9

    .line 569
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 572
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 573
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-wide v4, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->durationUs:J

    invoke-static {v4, v5}, Landroidx/media3/common/util/Util;->usToMs(J)J

    move-result-wide v4

    const-wide/16 v6, 0x7530

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    .line 574
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget-boolean v0, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->hasEndTag:Z

    const/4 v6, 0x1

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget v0, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->playlistType:I

    const/4 v7, 0x2

    if-eq v0, v7, :cond_1

    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistSnapshot:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    iget v0, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;->playlistType:I

    if-eq v0, v6, :cond_1

    iget-wide v7, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->lastSnapshotLoadMs:J

    add-long/2addr v7, v4

    cmp-long v0, v7, v2

    if-lez v0, :cond_2

    :cond_1
    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method synthetic lambda$loadPlaylistInternal$0$androidx-media3-exoplayer-hls-playlist-DefaultHlsPlaylistTracker$MediaPlaylistBundle(Landroid/net/Uri;)V
    .locals 1

    .line 0
    const/4 v0, 0x0

    .line 721
    iput-boolean v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->loadPending:Z

    .line 722
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->loadPlaylistImmediately(Landroid/net/Uri;)V

    return-void
.end method

.method public loadPlaylist(Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 581
    invoke-direct {p0}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->getMediaPlaylistUriForReload()Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    :goto_0
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->loadPlaylistInternal(Landroid/net/Uri;)V

    return-void
.end method

.method public maybeThrowPlaylistRefreshError()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 585
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->maybeThrowError()V

    .line 586
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistError:Ljava/io/IOException;

    if-nez v0, :cond_0

    return-void

    .line 587
    :cond_0
    throw v0
.end method

.method public bridge synthetic onLoadCanceled(Landroidx/media3/exoplayer/upstream/Loader$Loadable;JJZ)V
    .locals 0

    .line 538
    check-cast p1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;

    invoke-virtual/range {p0 .. p6}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->onLoadCanceled(Landroidx/media3/exoplayer/upstream/ParsingLoadable;JJZ)V

    return-void
.end method

.method public onLoadCanceled(Landroidx/media3/exoplayer/upstream/ParsingLoadable;JJZ)V
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/upstream/ParsingLoadable<",
            "Landroidx/media3/exoplayer/hls/playlist/HlsPlaylist;",
            ">;JJZ)V"
        }
    .end annotation

    move-object v0, p0

    move-object/from16 v1, p1

    .line 637
    new-instance v14, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v3, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->loadTaskId:J

    iget-object v5, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 641
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->getUri()Landroid/net/Uri;

    move-result-object v6

    .line 642
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->getResponseHeaders()Ljava/util/Map;

    move-result-object v7

    .line 645
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->bytesLoaded()J

    move-result-wide v12

    move-object v2, v14

    move-wide/from16 v8, p2

    move-wide/from16 v10, p4

    invoke-direct/range {v2 .. v13}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 646
    iget-object v2, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v2}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$900(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    move-result-object v2

    iget-wide v3, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->loadTaskId:J

    invoke-interface {v2, v3, v4}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->onLoadTaskConcluded(J)V

    .line 647
    iget-object v1, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v1}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$800(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v14, v2}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadCanceled(Landroidx/media3/exoplayer/source/LoadEventInfo;I)V

    return-void
.end method

.method public bridge synthetic onLoadCompleted(Landroidx/media3/exoplayer/upstream/Loader$Loadable;JJ)V
    .locals 0

    .line 538
    check-cast p1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;

    invoke-virtual/range {p0 .. p5}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->onLoadCompleted(Landroidx/media3/exoplayer/upstream/ParsingLoadable;JJ)V

    return-void
.end method

.method public onLoadCompleted(Landroidx/media3/exoplayer/upstream/ParsingLoadable;JJ)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/upstream/ParsingLoadable<",
            "Landroidx/media3/exoplayer/hls/playlist/HlsPlaylist;",
            ">;JJ)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 608
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->getResult()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/exoplayer/hls/playlist/HlsPlaylist;

    .line 609
    new-instance v15, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v4, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->loadTaskId:J

    iget-object v6, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 613
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->getUri()Landroid/net/Uri;

    move-result-object v7

    .line 614
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->getResponseHeaders()Ljava/util/Map;

    move-result-object v8

    .line 617
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->bytesLoaded()J

    move-result-wide v13

    move-object v3, v15

    move-wide/from16 v9, p2

    move-wide/from16 v11, p4

    invoke-direct/range {v3 .. v14}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 618
    instance-of v3, v2, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    const/4 v4, 0x4

    if-eqz v3, :cond_0

    .line 619
    check-cast v2, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;

    invoke-direct {v0, v2, v15}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->processLoadedPlaylist(Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;Landroidx/media3/exoplayer/source/LoadEventInfo;)V

    .line 620
    iget-object v2, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v2}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$800(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    move-result-object v2

    invoke-virtual {v2, v15, v4}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadCompleted(Landroidx/media3/exoplayer/source/LoadEventInfo;I)V

    goto :goto_0

    .line 622
    :cond_0
    const-string v2, "Loaded playlist has unexpected type."

    const/4 v3, 0x0

    .line 623
    invoke-static {v2, v3}, Landroidx/media3/common/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Landroidx/media3/common/ParserException;

    move-result-object v2

    iput-object v2, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistError:Ljava/io/IOException;

    .line 625
    iget-object v2, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v2}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$800(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    move-result-object v2

    iget-object v3, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistError:Ljava/io/IOException;

    const/4 v5, 0x1

    invoke-virtual {v2, v15, v4, v3, v5}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadError(Landroidx/media3/exoplayer/source/LoadEventInfo;ILjava/io/IOException;Z)V

    .line 628
    :goto_0
    iget-object v2, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v2}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$900(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    move-result-object v2

    iget-wide v3, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->loadTaskId:J

    invoke-interface {v2, v3, v4}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->onLoadTaskConcluded(J)V

    return-void
.end method

.method public bridge synthetic onLoadError(Landroidx/media3/exoplayer/upstream/Loader$Loadable;JJLjava/io/IOException;I)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;
    .locals 0

    .line 538
    check-cast p1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;

    invoke-virtual/range {p0 .. p7}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->onLoadError(Landroidx/media3/exoplayer/upstream/ParsingLoadable;JJLjava/io/IOException;I)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    move-result-object p1

    return-object p1
.end method

.method public onLoadError(Landroidx/media3/exoplayer/upstream/ParsingLoadable;JJLjava/io/IOException;I)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/upstream/ParsingLoadable<",
            "Landroidx/media3/exoplayer/hls/playlist/HlsPlaylist;",
            ">;JJ",
            "Ljava/io/IOException;",
            "I)",
            "Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p6

    .line 657
    new-instance v15, Landroidx/media3/exoplayer/source/LoadEventInfo;

    iget-wide v4, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->loadTaskId:J

    iget-object v6, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 661
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->getUri()Landroid/net/Uri;

    move-result-object v7

    .line 662
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->getResponseHeaders()Ljava/util/Map;

    move-result-object v8

    .line 665
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->bytesLoaded()J

    move-result-wide v13

    move-object v3, v15

    move-wide/from16 v9, p2

    move-wide/from16 v11, p4

    invoke-direct/range {v3 .. v14}, Landroidx/media3/exoplayer/source/LoadEventInfo;-><init>(JLandroidx/media3/datasource/DataSpec;Landroid/net/Uri;Ljava/util/Map;JJJ)V

    .line 666
    invoke-virtual/range {p1 .. p1}, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->getUri()Landroid/net/Uri;

    move-result-object v3

    const-string v4, "_HLS_msn"

    invoke-virtual {v3, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 667
    :goto_0
    instance-of v6, v2, Landroidx/media3/exoplayer/hls/playlist/HlsPlaylistParser$DeltaUpdateException;

    if-nez v3, :cond_1

    if-eqz v6, :cond_3

    .line 670
    :cond_1
    instance-of v3, v2, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;

    if-eqz v3, :cond_2

    .line 671
    move-object v3, v2

    check-cast v3, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;

    iget v3, v3, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;->responseCode:I

    goto :goto_1

    :cond_2
    const v3, 0x7fffffff

    :goto_1
    if-nez v6, :cond_7

    const/16 v6, 0x190

    if-eq v3, v6, :cond_7

    const/16 v6, 0x1f7

    if-ne v3, v6, :cond_3

    goto :goto_3

    .line 684
    :cond_3
    new-instance v3, Landroidx/media3/exoplayer/source/MediaLoadData;

    iget v6, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->type:I

    invoke-direct {v3, v6}, Landroidx/media3/exoplayer/source/MediaLoadData;-><init>(I)V

    .line 685
    new-instance v6, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;

    move/from16 v7, p7

    invoke-direct {v6, v15, v3, v2, v7}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;-><init>(Landroidx/media3/exoplayer/source/LoadEventInfo;Landroidx/media3/exoplayer/source/MediaLoadData;Ljava/io/IOException;I)V

    .line 687
    iget-object v3, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    iget-object v7, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->playlistUrl:Landroid/net/Uri;

    .line 688
    invoke-static {v3, v7, v6, v5}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$1000(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;Landroid/net/Uri;Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;Z)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 691
    iget-object v3, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v3}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$900(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    move-result-object v3

    invoke-interface {v3, v6}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->getRetryDelayMsFor(Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy$LoadErrorInfo;)J

    move-result-wide v6

    const-wide v8, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v3, v6, v8

    if-eqz v3, :cond_4

    .line 694
    invoke-static {v5, v6, v7}, Landroidx/media3/exoplayer/upstream/Loader;->createRetryAction(ZJ)Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    move-result-object v3

    goto :goto_2

    .line 695
    :cond_4
    sget-object v3, Landroidx/media3/exoplayer/upstream/Loader;->DONT_RETRY_FATAL:Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    goto :goto_2

    .line 697
    :cond_5
    sget-object v3, Landroidx/media3/exoplayer/upstream/Loader;->DONT_RETRY:Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    .line 700
    :goto_2
    invoke-virtual {v3}, Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;->isRetry()Z

    move-result v5

    xor-int/2addr v4, v5

    .line 701
    iget-object v5, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v5}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$800(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    move-result-object v5

    iget v6, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->type:I

    invoke-virtual {v5, v15, v6, v2, v4}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadError(Landroidx/media3/exoplayer/source/LoadEventInfo;ILjava/io/IOException;Z)V

    if-eqz v4, :cond_6

    .line 703
    iget-object v2, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v2}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$900(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;

    move-result-object v2

    iget-wide v4, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->loadTaskId:J

    invoke-interface {v2, v4, v5}, Landroidx/media3/exoplayer/upstream/LoadErrorHandlingPolicy;->onLoadTaskConcluded(J)V

    :cond_6
    return-object v3

    .line 677
    :cond_7
    :goto_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iput-wide v6, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->earliestNextLoadTimeMs:J

    .line 678
    invoke-virtual {v0, v5}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->loadPlaylist(Z)V

    .line 679
    iget-object v3, v0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->this$0:Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;

    invoke-static {v3}, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;->access$800(Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker;)Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    move-result-object v3

    invoke-static {v3}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;

    iget v1, v1, Landroidx/media3/exoplayer/upstream/ParsingLoadable;->type:I

    .line 680
    invoke-virtual {v3, v15, v1, v2, v4}, Landroidx/media3/exoplayer/source/MediaSourceEventListener$EventDispatcher;->loadError(Landroidx/media3/exoplayer/source/LoadEventInfo;ILjava/io/IOException;Z)V

    .line 681
    sget-object v1, Landroidx/media3/exoplayer/upstream/Loader;->DONT_RETRY:Landroidx/media3/exoplayer/upstream/Loader$LoadErrorAction;

    return-object v1
.end method

.method public release()V
    .locals 1

    .line 600
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->mediaPlaylistLoader:Landroidx/media3/exoplayer/upstream/Loader;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/upstream/Loader;->release()V

    return-void
.end method

.method public setActiveForPlayback(Z)V
    .locals 0

    .line 596
    iput-boolean p1, p0, Landroidx/media3/exoplayer/hls/playlist/DefaultHlsPlaylistTracker$MediaPlaylistBundle;->activeForPlayback:Z

    return-void
.end method
