.class public final Landroidx/media3/datasource/HttpEngineDataSource;
.super Landroidx/media3/datasource/BaseDataSource;
.source "HttpEngineDataSource.java"

# interfaces
.implements Landroidx/media3/datasource/HttpDataSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;,
        Landroidx/media3/datasource/HttpEngineDataSource$OpenException;,
        Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestCallback;,
        Landroidx/media3/datasource/HttpEngineDataSource$Factory;
    }
.end annotation


# static fields
.field public static final DEFAULT_CONNECT_TIMEOUT_MILLIS:I = 0x1f40

.field public static final DEFAULT_READ_TIMEOUT_MILLIS:I = 0x1f40

.field private static final READ_BUFFER_SIZE_BYTES:I = 0x8000


# instance fields
.field private bytesRemaining:J

.field private final clock:Landroidx/media3/common/util/Clock;

.field private final connectTimeoutMs:I

.field private contentTypePredicate:Lcom/google/common/base/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Predicate<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private volatile currentConnectTimeoutMs:J

.field private currentDataSpec:Landroidx/media3/datasource/DataSpec;

.field private currentUrlRequestWrapper:Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;

.field private final defaultRequestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

.field private exception:Ljava/io/IOException;

.field private final executor:Ljava/util/concurrent/Executor;

.field private finished:Z

.field private final handleSetCookieRequests:Z

.field private final httpEngine:Landroid/net/http/HttpEngine;

.field private final keepPostFor302Redirects:Z

.field private opened:Z

.field private final operation:Landroidx/media3/common/util/ConditionVariable;

.field private readBuffer:Ljava/nio/ByteBuffer;

.field private final readTimeoutMs:I

.field private final requestPriority:I

.field private final requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

.field private final resetTimeoutOnRedirects:Z

.field private responseInfo:Landroid/net/http/UrlResponseInfo;

.field private final userAgent:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/net/http/HttpEngine;Ljava/util/concurrent/Executor;IIIZZLjava/lang/String;Landroidx/media3/datasource/HttpDataSource$RequestProperties;Lcom/google/common/base/Predicate;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/http/HttpEngine;",
            "Ljava/util/concurrent/Executor;",
            "IIIZZ",
            "Ljava/lang/String;",
            "Landroidx/media3/datasource/HttpDataSource$RequestProperties;",
            "Lcom/google/common/base/Predicate<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 377
    invoke-direct {p0, v0}, Landroidx/media3/datasource/BaseDataSource;-><init>(Z)V

    .line 378
    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Landroidx/media3/exoplayer/ExoPlayerImpl$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/net/http/HttpEngine;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->httpEngine:Landroid/net/http/HttpEngine;

    .line 379
    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/Executor;

    iput-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->executor:Ljava/util/concurrent/Executor;

    .line 380
    iput p3, p0, Landroidx/media3/datasource/HttpEngineDataSource;->requestPriority:I

    .line 381
    iput p4, p0, Landroidx/media3/datasource/HttpEngineDataSource;->connectTimeoutMs:I

    .line 382
    iput p5, p0, Landroidx/media3/datasource/HttpEngineDataSource;->readTimeoutMs:I

    .line 383
    iput-boolean p6, p0, Landroidx/media3/datasource/HttpEngineDataSource;->resetTimeoutOnRedirects:Z

    .line 384
    iput-boolean p7, p0, Landroidx/media3/datasource/HttpEngineDataSource;->handleSetCookieRequests:Z

    .line 385
    iput-object p8, p0, Landroidx/media3/datasource/HttpEngineDataSource;->userAgent:Ljava/lang/String;

    .line 386
    iput-object p9, p0, Landroidx/media3/datasource/HttpEngineDataSource;->defaultRequestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    .line 387
    iput-object p10, p0, Landroidx/media3/datasource/HttpEngineDataSource;->contentTypePredicate:Lcom/google/common/base/Predicate;

    .line 388
    iput-boolean p11, p0, Landroidx/media3/datasource/HttpEngineDataSource;->keepPostFor302Redirects:Z

    .line 389
    sget-object p1, Landroidx/media3/common/util/Clock;->DEFAULT:Landroidx/media3/common/util/Clock;

    iput-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->clock:Landroidx/media3/common/util/Clock;

    .line 390
    new-instance p1, Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    invoke-direct {p1}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;-><init>()V

    iput-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    .line 391
    new-instance p1, Landroidx/media3/common/util/ConditionVariable;

    invoke-direct {p1}, Landroidx/media3/common/util/ConditionVariable;-><init>()V

    iput-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->operation:Landroidx/media3/common/util/ConditionVariable;

    return-void
.end method

.method static synthetic access$100(Landroidx/media3/datasource/HttpEngineDataSource;)Landroidx/media3/datasource/DataSpec;
    .locals 0

    .line 70
    iget-object p0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentDataSpec:Landroidx/media3/datasource/DataSpec;

    return-object p0
.end method

.method static synthetic access$1000(Landroidx/media3/datasource/HttpEngineDataSource;)Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;
    .locals 0

    .line 70
    iget-object p0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentUrlRequestWrapper:Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;

    return-object p0
.end method

.method static synthetic access$1002(Landroidx/media3/datasource/HttpEngineDataSource;Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;)Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;
    .locals 0

    .line 70
    iput-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentUrlRequestWrapper:Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;

    return-object p1
.end method

.method static synthetic access$1102(Landroidx/media3/datasource/HttpEngineDataSource;Landroid/net/http/UrlResponseInfo;)Landroid/net/http/UrlResponseInfo;
    .locals 0

    .line 70
    iput-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->responseInfo:Landroid/net/http/UrlResponseInfo;

    return-object p1
.end method

.method static synthetic access$1202(Landroidx/media3/datasource/HttpEngineDataSource;Z)Z
    .locals 0

    .line 70
    iput-boolean p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->finished:Z

    return p1
.end method

.method static synthetic access$202(Landroidx/media3/datasource/HttpEngineDataSource;Ljava/io/IOException;)Ljava/io/IOException;
    .locals 0

    .line 70
    iput-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->exception:Ljava/io/IOException;

    return-object p1
.end method

.method static synthetic access$300(Landroidx/media3/datasource/HttpEngineDataSource;)Landroidx/media3/common/util/ConditionVariable;
    .locals 0

    .line 70
    iget-object p0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->operation:Landroidx/media3/common/util/ConditionVariable;

    return-object p0
.end method

.method static synthetic access$400(Landroidx/media3/datasource/HttpEngineDataSource;)Z
    .locals 0

    .line 70
    iget-boolean p0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->resetTimeoutOnRedirects:Z

    return p0
.end method

.method static synthetic access$500(Landroidx/media3/datasource/HttpEngineDataSource;)V
    .locals 0

    .line 70
    invoke-direct {p0}, Landroidx/media3/datasource/HttpEngineDataSource;->resetConnectTimeout()V

    return-void
.end method

.method static synthetic access$600(Landroidx/media3/datasource/HttpEngineDataSource;)Z
    .locals 0

    .line 70
    iget-boolean p0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->keepPostFor302Redirects:Z

    return p0
.end method

.method static synthetic access$700(Landroidx/media3/datasource/HttpEngineDataSource;)Z
    .locals 0

    .line 70
    iget-boolean p0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->handleSetCookieRequests:Z

    return p0
.end method

.method static synthetic access$800(Ljava/util/List;)Ljava/lang/String;
    .locals 0

    .line 70
    invoke-static {p0}, Landroidx/media3/datasource/HttpEngineDataSource;->parseCookies(Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Landroidx/media3/datasource/HttpEngineDataSource;Landroidx/media3/datasource/DataSpec;)Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    invoke-direct {p0, p1}, Landroidx/media3/datasource/HttpEngineDataSource;->buildRequestWrapper(Landroidx/media3/datasource/DataSpec;)Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;

    move-result-object p0

    return-object p0
.end method

.method private blockUntilConnectTimeout()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 774
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->clock:Landroidx/media3/common/util/Clock;

    invoke-interface {v0}, Landroidx/media3/common/util/Clock;->elapsedRealtime()J

    move-result-wide v0

    const/4 v2, 0x0

    :goto_0
    if-nez v2, :cond_0

    .line 776
    iget-wide v3, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentConnectTimeoutMs:J

    cmp-long v5, v0, v3

    if-gez v5, :cond_0

    .line 777
    iget-object v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->operation:Landroidx/media3/common/util/ConditionVariable;

    iget-wide v3, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentConnectTimeoutMs:J

    sub-long/2addr v3, v0

    const-wide/16 v0, 0x5

    add-long/2addr v3, v0

    invoke-virtual {v2, v3, v4}, Landroidx/media3/common/util/ConditionVariable;->block(J)Z

    move-result v2

    .line 778
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->clock:Landroidx/media3/common/util/Clock;

    invoke-interface {v0}, Landroidx/media3/common/util/Clock;->elapsedRealtime()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    return v2
.end method

.method private buildRequestBuilder(Landroidx/media3/datasource/DataSpec;Landroid/net/http/UrlRequest$Callback;)Landroid/net/http/UrlRequest$Builder;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 721
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->httpEngine:Landroid/net/http/HttpEngine;

    iget-object v1, p1, Landroidx/media3/datasource/DataSpec;->uri:Landroid/net/Uri;

    .line 723
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->executor:Ljava/util/concurrent/Executor;

    invoke-static {v0, v1, v2, p2}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/HttpEngine;Ljava/lang/String;Ljava/util/concurrent/Executor;Landroid/net/http/UrlRequest$Callback;)Landroid/net/http/UrlRequest$Builder;

    move-result-object p2

    iget v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->requestPriority:I

    .line 724
    invoke-static {p2, v0}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlRequest$Builder;I)Landroid/net/http/UrlRequest$Builder;

    move-result-object p2

    const/4 v0, 0x1

    .line 725
    invoke-static {p2, v0}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlRequest$Builder;Z)Landroid/net/http/UrlRequest$Builder;

    move-result-object p2

    .line 728
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 729
    iget-object v1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->defaultRequestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    if-eqz v1, :cond_0

    .line 730
    invoke-virtual {v1}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;->getSnapshot()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 732
    :cond_0
    iget-object v1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    invoke-virtual {v1}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;->getSnapshot()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 733
    iget-object v1, p1, Landroidx/media3/datasource/DataSpec;->httpRequestHeaders:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 735
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 736
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 737
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 738
    invoke-static {p2, v3, v2}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlRequest$Builder;Ljava/lang/String;Ljava/lang/String;)Landroid/net/http/UrlRequest$Builder;

    goto :goto_0

    .line 741
    :cond_1
    iget-object v1, p1, Landroidx/media3/datasource/DataSpec;->httpBody:[B

    if-eqz v1, :cond_3

    const-string v1, "Content-Type"

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    .line 742
    :cond_2
    new-instance p2, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;

    const/16 v0, 0x3ec

    const/4 v1, 0x0

    const-string v2, "HTTP request with non-empty body must set Content-Type"

    invoke-direct {p2, v2, p1, v0, v1}, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;-><init>(Ljava/lang/String;Landroidx/media3/datasource/DataSpec;II)V

    throw p2

    .line 749
    :cond_3
    :goto_1
    iget-wide v0, p1, Landroidx/media3/datasource/DataSpec;->position:J

    iget-wide v2, p1, Landroidx/media3/datasource/DataSpec;->length:J

    invoke-static {v0, v1, v2, v3}, Landroidx/media3/datasource/HttpUtil;->buildRangeRequestHeader(JJ)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 751
    const-string v1, "Range"

    invoke-static {p2, v1, v0}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlRequest$Builder;Ljava/lang/String;Ljava/lang/String;)Landroid/net/http/UrlRequest$Builder;

    .line 753
    :cond_4
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->userAgent:Ljava/lang/String;

    if-eqz v0, :cond_5

    .line 754
    const-string v1, "User-Agent"

    invoke-static {p2, v1, v0}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlRequest$Builder;Ljava/lang/String;Ljava/lang/String;)Landroid/net/http/UrlRequest$Builder;

    .line 763
    :cond_5
    invoke-virtual {p1}, Landroidx/media3/datasource/DataSpec;->getHttpMethodString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlRequest$Builder;Ljava/lang/String;)Landroid/net/http/UrlRequest$Builder;

    .line 764
    iget-object v0, p1, Landroidx/media3/datasource/DataSpec;->httpBody:[B

    if-eqz v0, :cond_6

    .line 765
    new-instance v0, Landroidx/media3/datasource/ByteArrayUploadDataProvider;

    iget-object p1, p1, Landroidx/media3/datasource/DataSpec;->httpBody:[B

    invoke-direct {v0, p1}, Landroidx/media3/datasource/ByteArrayUploadDataProvider;-><init>([B)V

    iget-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->executor:Ljava/util/concurrent/Executor;

    invoke-static {p2, v0, p1}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlRequest$Builder;Landroid/net/http/UploadDataProvider;Ljava/util/concurrent/Executor;)Landroid/net/http/UrlRequest$Builder;

    :cond_6
    return-object p2
.end method

.method private buildRequestWrapper(Landroidx/media3/datasource/DataSpec;)Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 715
    new-instance v0, Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestCallback;-><init>(Landroidx/media3/datasource/HttpEngineDataSource;Landroidx/media3/datasource/HttpEngineDataSource$1;)V

    .line 716
    new-instance v1, Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;

    invoke-direct {p0, p1, v0}, Landroidx/media3/datasource/HttpEngineDataSource;->buildRequestBuilder(Landroidx/media3/datasource/DataSpec;Landroid/net/http/UrlRequest$Callback;)Landroid/net/http/UrlRequest$Builder;

    move-result-object p1

    invoke-static {p1}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlRequest$Builder;)Landroid/net/http/UrlRequest;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;-><init>(Landroid/net/http/UrlRequest;Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestCallback;)V

    return-object v1
.end method

.method private static copyByteBuffer(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I
    .locals 3

    .line 948
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 949
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    .line 950
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 951
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 952
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    return v0
.end method

.method private static getFirstHeader(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 941
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_0

    .line 942
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method private getOrCreateReadBuffer()Ljava/nio/ByteBuffer;
    .locals 2

    .line 915
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->readBuffer:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    const v0, 0x8000

    .line 916
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->readBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    .line 917
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 919
    :cond_0
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->readBuffer:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method private static isCompressed(Landroid/net/http/UrlResponseInfo;)Z
    .locals 3

    .line 923
    invoke-static {p0}, Landroidx/media3/exoplayer/ExoPlayerImpl$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlResponseInfo;)Landroid/net/http/HeaderBlock;

    move-result-object p0

    invoke-static {p0}, Landroidx/media3/exoplayer/ExoPlayerImpl$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/HeaderBlock;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 924
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "Content-Encoding"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 925
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-string v0, "identity"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private static parseCookies(Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    if-eqz p0, :cond_1

    .line 933
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 936
    :cond_0
    const-string v0, ";"

    invoke-static {v0, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private readInternal(Ljava/nio/ByteBuffer;Landroidx/media3/datasource/DataSpec;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    .line 877
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentUrlRequestWrapper:Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;

    invoke-static {v0}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;

    invoke-virtual {v0, p1}, Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;->read(Ljava/nio/ByteBuffer;)V

    const/4 v0, 0x2

    const/4 v1, 0x0

    .line 879
    :try_start_0
    iget-object v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->operation:Landroidx/media3/common/util/ConditionVariable;

    iget v3, p0, Landroidx/media3/datasource/HttpEngineDataSource;->readTimeoutMs:I

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Landroidx/media3/common/util/ConditionVariable;->block(J)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 880
    :cond_0
    new-instance v2, Ljava/net/SocketTimeoutException;

    invoke-direct {v2}, Ljava/net/SocketTimeoutException;-><init>()V

    throw v2
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v2

    .line 893
    iget-object v3, p0, Landroidx/media3/datasource/HttpEngineDataSource;->readBuffer:Ljava/nio/ByteBuffer;

    if-ne p1, v3, :cond_1

    .line 894
    iput-object v1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->readBuffer:Ljava/nio/ByteBuffer;

    .line 896
    :cond_1
    new-instance p1, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    const/16 v1, 0x7d2

    invoke-direct {p1, v2, p2, v1, v0}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    iput-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->exception:Ljava/io/IOException;

    goto :goto_0

    :catch_1
    nop

    .line 885
    iget-object v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->readBuffer:Ljava/nio/ByteBuffer;

    if-ne p1, v2, :cond_2

    .line 886
    iput-object v1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->readBuffer:Ljava/nio/ByteBuffer;

    .line 888
    :cond_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    .line 889
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    iput-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->exception:Ljava/io/IOException;

    .line 904
    :goto_0
    iget-object p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->exception:Ljava/io/IOException;

    if-eqz p1, :cond_4

    .line 905
    instance-of v1, p1, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    if-eqz v1, :cond_3

    .line 906
    check-cast p1, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    throw p1

    .line 908
    :cond_3
    invoke-static {p1, p2, v0}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;->createForIOException(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;I)Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    move-result-object p1

    throw p1

    :cond_4
    return-void
.end method

.method private readResponseBody()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 851
    sget-object v0, Landroidx/media3/common/util/Util;->EMPTY_BYTE_ARRAY:[B

    .line 852
    invoke-direct {p0}, Landroidx/media3/datasource/HttpEngineDataSource;->getOrCreateReadBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 853
    :cond_0
    :goto_0
    iget-boolean v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->finished:Z

    if-nez v2, :cond_1

    .line 854
    iget-object v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->operation:Landroidx/media3/common/util/ConditionVariable;

    invoke-virtual {v2}, Landroidx/media3/common/util/ConditionVariable;->close()Z

    .line 855
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 856
    iget-object v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentDataSpec:Landroidx/media3/datasource/DataSpec;

    invoke-static {v2}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/datasource/DataSpec;

    invoke-direct {p0, v1, v2}, Landroidx/media3/datasource/HttpEngineDataSource;->readInternal(Ljava/nio/ByteBuffer;Landroidx/media3/datasource/DataSpec;)V

    .line 857
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 858
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-lez v2, :cond_0

    .line 859
    array-length v2, v0

    .line 860
    array-length v3, v0

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    add-int/2addr v3, v4

    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    .line 861
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    invoke-virtual {v1, v0, v2, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private resetConnectTimeout()V
    .locals 4

    .line 784
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->clock:Landroidx/media3/common/util/Clock;

    invoke-interface {v0}, Landroidx/media3/common/util/Clock;->elapsedRealtime()J

    move-result-wide v0

    iget v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->connectTimeoutMs:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentConnectTimeoutMs:J

    return-void
.end method

.method private skipFully(JLandroidx/media3/datasource/DataSpec;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    return-void

    .line 804
    :cond_0
    invoke-direct {p0}, Landroidx/media3/datasource/HttpEngineDataSource;->getOrCreateReadBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    :goto_0
    cmp-long v3, p1, v0

    if-lez v3, :cond_5

    const/16 v3, 0xe

    .line 809
    :try_start_0
    iget-object v4, p0, Landroidx/media3/datasource/HttpEngineDataSource;->operation:Landroidx/media3/common/util/ConditionVariable;

    invoke-virtual {v4}, Landroidx/media3/common/util/ConditionVariable;->close()Z

    .line 810
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 811
    invoke-direct {p0, v2, p3}, Landroidx/media3/datasource/HttpEngineDataSource;->readInternal(Ljava/nio/ByteBuffer;Landroidx/media3/datasource/DataSpec;)V

    .line 812
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v4

    if-nez v4, :cond_2

    .line 815
    iget-boolean v4, p0, Landroidx/media3/datasource/HttpEngineDataSource;->finished:Z

    if-nez v4, :cond_1

    .line 822
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 823
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    invoke-static {v4}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 824
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    int-to-long v4, v4

    invoke-static {v4, v5, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v5, v4

    .line 825
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    add-int/2addr v4, v5

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    int-to-long v3, v5

    sub-long/2addr p1, v3

    goto :goto_0

    .line 816
    :cond_1
    new-instance p1, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;

    const/16 p2, 0x7d8

    invoke-direct {p1, p3, p2, v3}, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;-><init>(Landroidx/media3/datasource/DataSpec;II)V

    throw p1

    .line 813
    :cond_2
    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    throw p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 830
    instance-of p2, p1, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    if-nez p2, :cond_4

    .line 833
    new-instance p2, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;

    .line 836
    instance-of v0, p1, Ljava/net/SocketTimeoutException;

    if-eqz v0, :cond_3

    const/16 v0, 0x7d2

    goto :goto_1

    :cond_3
    const/16 v0, 0x7d1

    .line 838
    :goto_1
    invoke-direct {p2, p1, p3, v0, v3}, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw p2

    .line 831
    :cond_4
    check-cast p1, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    throw p1

    :cond_5
    return-void
.end method


# virtual methods
.method public clearAllRequestProperties()V
    .locals 1

    .line 411
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    invoke-virtual {v0}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;->clear()V

    return-void
.end method

.method public clearRequestProperty(Ljava/lang/String;)V
    .locals 1

    .line 405
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    invoke-virtual {v0, p1}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;->remove(Ljava/lang/String;)V

    return-void
.end method

.method public declared-synchronized close()V
    .locals 3

    monitor-enter p0

    .line 687
    :try_start_0
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentUrlRequestWrapper:Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 688
    invoke-virtual {v0}, Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;->close()V

    .line 689
    iput-object v1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentUrlRequestWrapper:Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;

    .line 691
    :cond_0
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->readBuffer:Ljava/nio/ByteBuffer;

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 692
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 694
    :cond_1
    iput-object v1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentDataSpec:Landroidx/media3/datasource/DataSpec;

    .line 695
    iput-object v1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->responseInfo:Landroid/net/http/UrlResponseInfo;

    .line 696
    iput-object v1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->exception:Ljava/io/IOException;

    .line 697
    iput-boolean v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->finished:Z

    .line 698
    iget-boolean v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->opened:Z

    if-eqz v0, :cond_2

    .line 699
    iput-boolean v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->opened:Z

    .line 700
    invoke-virtual {p0}, Landroidx/media3/datasource/HttpEngineDataSource;->transferEnded()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 702
    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getCurrentUrlRequestCallback()Landroid/net/http/UrlRequest$Callback;
    .locals 1

    .line 709
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentUrlRequestWrapper:Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 711
    :cond_0
    invoke-virtual {v0}, Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;->getUrlRequestCallback()Landroid/net/http/UrlRequest$Callback;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getResponseCode()I
    .locals 1

    .line 417
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->responseInfo:Landroid/net/http/UrlResponseInfo;

    if-eqz v0, :cond_1

    invoke-static {v0}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlResponseInfo;)I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 419
    :cond_0
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->responseInfo:Landroid/net/http/UrlResponseInfo;

    invoke-static {v0}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlResponseInfo;)I

    move-result v0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, -0x1

    :goto_1
    return v0
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

    .line 425
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->responseInfo:Landroid/net/http/UrlResponseInfo;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-static {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlResponseInfo;)Landroid/net/http/HeaderBlock;

    move-result-object v0

    invoke-static {v0}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/HeaderBlock;)Ljava/util/Map;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    .line 432
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->responseInfo:Landroid/net/http/UrlResponseInfo;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-static {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlResponseInfo;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public open(Landroidx/media3/datasource/DataSpec;)J
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v7, p1

    .line 438
    invoke-static/range {p1 .. p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    iget-boolean v0, v1, Landroidx/media3/datasource/HttpEngineDataSource;->opened:Z

    const/4 v2, 0x1

    xor-int/2addr v0, v2

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 441
    iget-object v0, v1, Landroidx/media3/datasource/HttpEngineDataSource;->operation:Landroidx/media3/common/util/ConditionVariable;

    invoke-virtual {v0}, Landroidx/media3/common/util/ConditionVariable;->close()Z

    .line 442
    invoke-direct/range {p0 .. p0}, Landroidx/media3/datasource/HttpEngineDataSource;->resetConnectTimeout()V

    .line 443
    iput-object v7, v1, Landroidx/media3/datasource/HttpEngineDataSource;->currentDataSpec:Landroidx/media3/datasource/DataSpec;

    .line 446
    :try_start_0
    invoke-direct/range {p0 .. p1}, Landroidx/media3/datasource/HttpEngineDataSource;->buildRequestWrapper(Landroidx/media3/datasource/DataSpec;)Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;

    move-result-object v0

    .line 447
    iput-object v0, v1, Landroidx/media3/datasource/HttpEngineDataSource;->currentUrlRequestWrapper:Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 456
    invoke-virtual {v0}, Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;->start()V

    .line 458
    invoke-virtual/range {p0 .. p1}, Landroidx/media3/datasource/HttpEngineDataSource;->transferInitializing(Landroidx/media3/datasource/DataSpec;)V

    .line 460
    :try_start_1
    invoke-direct/range {p0 .. p0}, Landroidx/media3/datasource/HttpEngineDataSource;->blockUntilConnectTimeout()Z

    move-result v3

    .line 461
    iget-object v4, v1, Landroidx/media3/datasource/HttpEngineDataSource;->exception:Ljava/io/IOException;

    if-eqz v4, :cond_1

    .line 463
    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 464
    invoke-static {v2}, Lcom/google/common/base/Ascii;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "err_cleartext_not_permitted"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 465
    new-instance v0, Landroidx/media3/datasource/HttpDataSource$CleartextNotPermittedException;

    invoke-direct {v0, v4, v7}, Landroidx/media3/datasource/HttpDataSource$CleartextNotPermittedException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;)V

    throw v0

    .line 467
    :cond_0
    new-instance v2, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;

    .line 471
    invoke-virtual {v0}, Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;->getStatus()I

    move-result v0

    const/16 v3, 0x7d1

    invoke-direct {v2, v4, v7, v3, v0}, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw v2
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    :cond_1
    if-eqz v3, :cond_d

    .line 493
    iget-object v0, v1, Landroidx/media3/datasource/HttpEngineDataSource;->responseInfo:Landroid/net/http/UrlResponseInfo;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/net/http/UrlResponseInfo;

    move-result-object v0

    .line 494
    invoke-static {v0}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlResponseInfo;)I

    move-result v3

    .line 495
    invoke-static {v0}, Landroidx/media3/exoplayer/ExoPlayerImpl$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlResponseInfo;)Landroid/net/http/HeaderBlock;

    move-result-object v4

    invoke-static {v4}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/HeaderBlock;)Ljava/util/Map;

    move-result-object v6

    .line 496
    const-string v4, "Content-Range"

    const/16 v5, 0xc8

    const-wide/16 v8, 0x0

    const-wide/16 v10, -0x1

    if-lt v3, v5, :cond_9

    const/16 v12, 0x12b

    if-le v3, v12, :cond_2

    goto :goto_2

    .line 529
    :cond_2
    iget-object v12, v1, Landroidx/media3/datasource/HttpEngineDataSource;->contentTypePredicate:Lcom/google/common/base/Predicate;

    if-eqz v12, :cond_4

    .line 531
    const-string v13, "Content-Type"

    invoke-static {v6, v13}, Landroidx/media3/datasource/HttpEngineDataSource;->getFirstHeader(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_4

    .line 532
    invoke-interface {v12, v13}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    goto :goto_0

    .line 533
    :cond_3
    new-instance v0, Landroidx/media3/datasource/HttpDataSource$InvalidContentTypeException;

    invoke-direct {v0, v13, v7}, Landroidx/media3/datasource/HttpDataSource$InvalidContentTypeException;-><init>(Ljava/lang/String;Landroidx/media3/datasource/DataSpec;)V

    throw v0

    :cond_4
    :goto_0
    if-ne v3, v5, :cond_5

    .line 540
    iget-wide v12, v7, Landroidx/media3/datasource/DataSpec;->position:J

    cmp-long v3, v12, v8

    if-eqz v3, :cond_5

    iget-wide v8, v7, Landroidx/media3/datasource/DataSpec;->position:J

    .line 543
    :cond_5
    invoke-static {v0}, Landroidx/media3/datasource/HttpEngineDataSource;->isCompressed(Landroid/net/http/UrlResponseInfo;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 544
    iget-wide v12, v7, Landroidx/media3/datasource/DataSpec;->length:J

    cmp-long v0, v12, v10

    if-eqz v0, :cond_6

    .line 545
    iget-wide v3, v7, Landroidx/media3/datasource/DataSpec;->length:J

    iput-wide v3, v1, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    goto :goto_1

    .line 547
    :cond_6
    const-string v0, "Content-Length"

    .line 549
    invoke-static {v6, v0}, Landroidx/media3/datasource/HttpEngineDataSource;->getFirstHeader(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 550
    invoke-static {v6, v4}, Landroidx/media3/datasource/HttpEngineDataSource;->getFirstHeader(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 548
    invoke-static {v0, v3}, Landroidx/media3/datasource/HttpUtil;->getContentLength(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v3

    cmp-long v0, v3, v10

    if-eqz v0, :cond_7

    sub-long v10, v3, v8

    .line 552
    :cond_7
    iput-wide v10, v1, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    goto :goto_1

    .line 557
    :cond_8
    iget-wide v3, v7, Landroidx/media3/datasource/DataSpec;->length:J

    iput-wide v3, v1, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    .line 560
    :goto_1
    iput-boolean v2, v1, Landroidx/media3/datasource/HttpEngineDataSource;->opened:Z

    .line 561
    invoke-virtual/range {p0 .. p1}, Landroidx/media3/datasource/HttpEngineDataSource;->transferStarted(Landroidx/media3/datasource/DataSpec;)V

    .line 563
    invoke-direct {v1, v8, v9, v7}, Landroidx/media3/datasource/HttpEngineDataSource;->skipFully(JLandroidx/media3/datasource/DataSpec;)V

    .line 564
    iget-wide v2, v1, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    return-wide v2

    :cond_9
    :goto_2
    const/16 v5, 0x1a0

    if-ne v3, v5, :cond_b

    .line 499
    invoke-static {v6, v4}, Landroidx/media3/datasource/HttpEngineDataSource;->getFirstHeader(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroidx/media3/datasource/HttpUtil;->getDocumentSize(Ljava/lang/String;)J

    move-result-wide v12

    .line 500
    iget-wide v14, v7, Landroidx/media3/datasource/DataSpec;->position:J

    cmp-long v4, v14, v12

    if-nez v4, :cond_b

    .line 501
    iput-boolean v2, v1, Landroidx/media3/datasource/HttpEngineDataSource;->opened:Z

    .line 502
    invoke-virtual/range {p0 .. p1}, Landroidx/media3/datasource/HttpEngineDataSource;->transferStarted(Landroidx/media3/datasource/DataSpec;)V

    .line 503
    iget-wide v2, v7, Landroidx/media3/datasource/DataSpec;->length:J

    cmp-long v0, v2, v10

    if-eqz v0, :cond_a

    iget-wide v8, v7, Landroidx/media3/datasource/DataSpec;->length:J

    :cond_a
    return-wide v8

    .line 509
    :cond_b
    :try_start_2
    invoke-direct/range {p0 .. p0}, Landroidx/media3/datasource/HttpEngineDataSource;->readResponseBody()[B

    move-result-object v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :goto_3
    move-object v8, v2

    goto :goto_4

    .line 511
    :catch_0
    sget-object v2, Landroidx/media3/common/util/Util;->EMPTY_BYTE_ARRAY:[B

    goto :goto_3

    :goto_4
    if-ne v3, v5, :cond_c

    .line 517
    new-instance v2, Landroidx/media3/datasource/DataSourceException;

    const/16 v4, 0x7d8

    invoke-direct {v2, v4}, Landroidx/media3/datasource/DataSourceException;-><init>(I)V

    goto :goto_5

    :cond_c
    const/4 v2, 0x0

    :goto_5
    move-object v5, v2

    .line 519
    new-instance v9, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;

    .line 521
    invoke-static {v0}, Landroidx/media3/common/util/Util$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/http/UrlResponseInfo;)Ljava/lang/String;

    move-result-object v4

    move-object v2, v9

    move-object/from16 v7, p1

    invoke-direct/range {v2 .. v8}, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;-><init>(ILjava/lang/String;Ljava/io/IOException;Ljava/util/Map;Landroidx/media3/datasource/DataSpec;[B)V

    throw v9

    .line 474
    :cond_d
    :try_start_3
    new-instance v2, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;

    new-instance v3, Ljava/net/SocketTimeoutException;

    invoke-direct {v3}, Ljava/net/SocketTimeoutException;-><init>()V

    .line 478
    invoke-virtual {v0}, Landroidx/media3/datasource/HttpEngineDataSource$UrlRequestWrapper;->getStatus()I

    move-result v0

    const/16 v4, 0x7d2

    invoke-direct {v2, v3, v7, v4, v0}, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw v2
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1

    .line 481
    :catch_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 485
    new-instance v0, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;

    new-instance v2, Ljava/io/InterruptedIOException;

    invoke-direct {v2}, Ljava/io/InterruptedIOException;-><init>()V

    const/16 v3, 0x3ec

    const/4 v4, -0x1

    invoke-direct {v0, v2, v7, v3, v4}, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw v0

    :catch_2
    move-exception v0

    .line 449
    instance-of v2, v0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    if-eqz v2, :cond_e

    .line 450
    check-cast v0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    throw v0

    .line 452
    :cond_e
    new-instance v2, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;

    const/16 v3, 0x7d0

    const/4 v4, 0x0

    invoke-direct {v2, v0, v7, v3, v4}, Landroidx/media3/datasource/HttpEngineDataSource$OpenException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw v2
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    .line 641
    iget-boolean v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->opened:Z

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 643
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 646
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 648
    :cond_0
    iget-wide v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    const/4 v0, -0x1

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-nez v6, :cond_1

    return v0

    .line 651
    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    .line 653
    iget-object v3, p0, Landroidx/media3/datasource/HttpEngineDataSource;->readBuffer:Ljava/nio/ByteBuffer;

    const-wide/16 v6, -0x1

    if-eqz v3, :cond_3

    .line 655
    invoke-static {v3, p1}, Landroidx/media3/datasource/HttpEngineDataSource;->copyByteBuffer(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    move-result v3

    if-eqz v3, :cond_3

    .line 657
    iget-wide v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    cmp-long p1, v0, v6

    if-eqz p1, :cond_2

    int-to-long v4, v3

    sub-long/2addr v0, v4

    .line 658
    iput-wide v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    .line 660
    :cond_2
    invoke-virtual {p0, v3}, Landroidx/media3/datasource/HttpEngineDataSource;->bytesTransferred(I)V

    return v3

    .line 666
    :cond_3
    iget-object v3, p0, Landroidx/media3/datasource/HttpEngineDataSource;->operation:Landroidx/media3/common/util/ConditionVariable;

    invoke-virtual {v3}, Landroidx/media3/common/util/ConditionVariable;->close()Z

    .line 667
    iget-object v3, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentDataSpec:Landroidx/media3/datasource/DataSpec;

    invoke-static {v3}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/media3/datasource/DataSpec;

    invoke-direct {p0, p1, v3}, Landroidx/media3/datasource/HttpEngineDataSource;->readInternal(Ljava/nio/ByteBuffer;Landroidx/media3/datasource/DataSpec;)V

    .line 669
    iget-boolean v3, p0, Landroidx/media3/datasource/HttpEngineDataSource;->finished:Z

    if-eqz v3, :cond_4

    .line 670
    iput-wide v4, p0, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    return v0

    .line 675
    :cond_4
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-le v2, v0, :cond_5

    const/4 v1, 0x1

    :cond_5
    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 676
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p1

    sub-int/2addr v2, p1

    .line 677
    iget-wide v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    cmp-long p1, v0, v6

    if-eqz p1, :cond_6

    int-to-long v3, v2

    sub-long/2addr v0, v3

    .line 678
    iput-wide v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    .line 680
    :cond_6
    invoke-virtual {p0, v2}, Landroidx/media3/datasource/HttpEngineDataSource;->bytesTransferred(I)V

    return v2

    .line 644
    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Passed buffer is not a direct ByteBuffer"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public read([BII)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    .line 570
    iget-boolean v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->opened:Z

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    const/4 v0, 0x0

    if-nez p3, :cond_0

    return v0

    .line 574
    :cond_0
    iget-wide v1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    const/4 v3, -0x1

    const-wide/16 v4, 0x0

    cmp-long v6, v1, v4

    if-nez v6, :cond_1

    return v3

    .line 578
    :cond_1
    invoke-direct {p0}, Landroidx/media3/datasource/HttpEngineDataSource;->getOrCreateReadBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 579
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-nez v2, :cond_3

    .line 581
    iget-object v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->operation:Landroidx/media3/common/util/ConditionVariable;

    invoke-virtual {v2}, Landroidx/media3/common/util/ConditionVariable;->close()Z

    .line 582
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 584
    iget-object v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->currentDataSpec:Landroidx/media3/datasource/DataSpec;

    invoke-static {v2}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/datasource/DataSpec;

    invoke-direct {p0, v1, v2}, Landroidx/media3/datasource/HttpEngineDataSource;->readInternal(Ljava/nio/ByteBuffer;Landroidx/media3/datasource/DataSpec;)V

    .line 586
    iget-boolean v2, p0, Landroidx/media3/datasource/HttpEngineDataSource;->finished:Z

    if-eqz v2, :cond_2

    .line 587
    iput-wide v4, p0, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    return v3

    .line 592
    :cond_2
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 593
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    invoke-static {v2}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    :cond_3
    const/4 v2, 0x3

    .line 598
    new-array v2, v2, [J

    .line 601
    iget-wide v3, p0, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    const-wide/16 v5, -0x1

    cmp-long v7, v3, v5

    if-eqz v7, :cond_4

    goto :goto_0

    :cond_4
    const-wide v3, 0x7fffffffffffffffL

    :goto_0
    aput-wide v3, v2, v0

    .line 602
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    int-to-long v3, v0

    const/4 v0, 0x1

    aput-wide v3, v2, v0

    const/4 v0, 0x2

    int-to-long v3, p3

    aput-wide v3, v2, v0

    .line 600
    invoke-static {v2}, Lcom/google/common/primitives/Longs;->min([J)J

    move-result-wide v2

    long-to-int p3, v2

    .line 605
    invoke-virtual {v1, p1, p2, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 607
    iget-wide p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    cmp-long v0, p1, v5

    if-eqz v0, :cond_5

    int-to-long v0, p3

    sub-long/2addr p1, v0

    .line 608
    iput-wide p1, p0, Landroidx/media3/datasource/HttpEngineDataSource;->bytesRemaining:J

    .line 610
    :cond_5
    invoke-virtual {p0, p3}, Landroidx/media3/datasource/HttpEngineDataSource;->bytesTransferred(I)V

    return p3
.end method

.method public setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 399
    iget-object v0, p0, Landroidx/media3/datasource/HttpEngineDataSource;->requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
