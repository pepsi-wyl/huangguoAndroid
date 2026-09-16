.class public final Landroidx/media3/datasource/StatsDataSource;
.super Ljava/lang/Object;
.source "StatsDataSource.java"

# interfaces
.implements Landroidx/media3/datasource/DataSource;


# instance fields
.field private bytesRead:J

.field private final dataSource:Landroidx/media3/datasource/DataSource;

.field private lastOpenedUri:Landroid/net/Uri;

.field private lastResponseHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/media3/datasource/DataSource;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/datasource/DataSource;

    iput-object p1, p0, Landroidx/media3/datasource/StatsDataSource;->dataSource:Landroidx/media3/datasource/DataSource;

    .line 48
    sget-object p1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    iput-object p1, p0, Landroidx/media3/datasource/StatsDataSource;->lastOpenedUri:Landroid/net/Uri;

    .line 49
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/datasource/StatsDataSource;->lastResponseHeaders:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public addTransferListener(Landroidx/media3/datasource/TransferListener;)V
    .locals 1

    .line 77
    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    iget-object v0, p0, Landroidx/media3/datasource/StatsDataSource;->dataSource:Landroidx/media3/datasource/DataSource;

    invoke-interface {v0, p1}, Landroidx/media3/datasource/DataSource;->addTransferListener(Landroidx/media3/datasource/TransferListener;)V

    return-void
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 114
    iget-object v0, p0, Landroidx/media3/datasource/StatsDataSource;->dataSource:Landroidx/media3/datasource/DataSource;

    invoke-interface {v0}, Landroidx/media3/datasource/DataSource;->close()V

    return-void
.end method

.method public getBytesRead()J
    .locals 2

    .line 59
    iget-wide v0, p0, Landroidx/media3/datasource/StatsDataSource;->bytesRead:J

    return-wide v0
.end method

.method public getLastOpenedUri()Landroid/net/Uri;
    .locals 1

    .line 67
    iget-object v0, p0, Landroidx/media3/datasource/StatsDataSource;->lastOpenedUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getLastResponseHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 72
    iget-object v0, p0, Landroidx/media3/datasource/StatsDataSource;->lastResponseHeaders:Ljava/util/Map;

    return-object v0
.end method

.method public getResponseHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 109
    iget-object v0, p0, Landroidx/media3/datasource/StatsDataSource;->dataSource:Landroidx/media3/datasource/DataSource;

    invoke-interface {v0}, Landroidx/media3/datasource/DataSource;->getResponseHeaders()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    .line 104
    iget-object v0, p0, Landroidx/media3/datasource/StatsDataSource;->dataSource:Landroidx/media3/datasource/DataSource;

    invoke-interface {v0}, Landroidx/media3/datasource/DataSource;->getUri()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public open(Landroidx/media3/datasource/DataSpec;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 84
    iget-object v0, p1, Landroidx/media3/datasource/DataSpec;->uri:Landroid/net/Uri;

    iput-object v0, p0, Landroidx/media3/datasource/StatsDataSource;->lastOpenedUri:Landroid/net/Uri;

    .line 85
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/datasource/StatsDataSource;->lastResponseHeaders:Ljava/util/Map;

    .line 86
    iget-object v0, p0, Landroidx/media3/datasource/StatsDataSource;->dataSource:Landroidx/media3/datasource/DataSource;

    invoke-interface {v0, p1}, Landroidx/media3/datasource/DataSource;->open(Landroidx/media3/datasource/DataSpec;)J

    move-result-wide v0

    .line 87
    invoke-virtual {p0}, Landroidx/media3/datasource/StatsDataSource;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    iput-object p1, p0, Landroidx/media3/datasource/StatsDataSource;->lastOpenedUri:Landroid/net/Uri;

    .line 88
    invoke-virtual {p0}, Landroidx/media3/datasource/StatsDataSource;->getResponseHeaders()Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/datasource/StatsDataSource;->lastResponseHeaders:Ljava/util/Map;

    return-wide v0
.end method

.method public read([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    iget-object v0, p0, Landroidx/media3/datasource/StatsDataSource;->dataSource:Landroidx/media3/datasource/DataSource;

    invoke-interface {v0, p1, p2, p3}, Landroidx/media3/datasource/DataSource;->read([BII)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_0

    .line 96
    iget-wide p2, p0, Landroidx/media3/datasource/StatsDataSource;->bytesRead:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Landroidx/media3/datasource/StatsDataSource;->bytesRead:J

    :cond_0
    return p1
.end method

.method public resetBytesRead()V
    .locals 2

    const-wide/16 v0, 0x0

    .line 54
    iput-wide v0, p0, Landroidx/media3/datasource/StatsDataSource;->bytesRead:J

    return-void
.end method
