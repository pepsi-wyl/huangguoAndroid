.class final Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;
.super Ljava/lang/Object;
.source "RtspClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/rtsp/RtspClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MessageSender"
.end annotation


# instance fields
.field private cSeq:I

.field private lastRequest:Landroidx/media3/exoplayer/rtsp/RtspRequest;

.field final synthetic this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;


# direct methods
.method private constructor <init>(Landroidx/media3/exoplayer/rtsp/RtspClient;)V
    .locals 0

    .line 373
    iput-object p1, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media3/exoplayer/rtsp/RtspClient;Landroidx/media3/exoplayer/rtsp/RtspClient$1;)V
    .locals 0

    .line 373
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;-><init>(Landroidx/media3/exoplayer/rtsp/RtspClient;)V

    return-void
.end method

.method private getRequestWithCommonHeaders(ILjava/lang/String;Ljava/util/Map;Landroid/net/Uri;)Landroidx/media3/exoplayer/rtsp/RtspRequest;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroid/net/Uri;",
            ")",
            "Landroidx/media3/exoplayer/rtsp/RtspRequest;"
        }
    .end annotation

    .line 470
    new-instance v0, Landroidx/media3/exoplayer/rtsp/RtspHeaders$Builder;

    iget-object v1, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v1}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$400(Landroidx/media3/exoplayer/rtsp/RtspClient;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->cSeq:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->cSeq:I

    invoke-direct {v0, v1, p2, v2}, Landroidx/media3/exoplayer/rtsp/RtspHeaders$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 472
    iget-object p2, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {p2}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$500(Landroidx/media3/exoplayer/rtsp/RtspClient;)Landroidx/media3/exoplayer/rtsp/RtspAuthenticationInfo;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 473
    iget-object p2, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {p2}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$600(Landroidx/media3/exoplayer/rtsp/RtspClient;)Landroidx/media3/exoplayer/rtsp/RtspMessageUtil$RtspAuthUserInfo;

    move-result-object p2

    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    :try_start_0
    const-string p2, "Authorization"

    iget-object v1, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    .line 477
    invoke-static {v1}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$500(Landroidx/media3/exoplayer/rtsp/RtspClient;)Landroidx/media3/exoplayer/rtsp/RtspAuthenticationInfo;

    move-result-object v1

    iget-object v2, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v2}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$600(Landroidx/media3/exoplayer/rtsp/RtspClient;)Landroidx/media3/exoplayer/rtsp/RtspMessageUtil$RtspAuthUserInfo;

    move-result-object v2

    invoke-virtual {v1, v2, p4, p1}, Landroidx/media3/exoplayer/rtsp/RtspAuthenticationInfo;->getAuthorizationHeaderValue(Landroidx/media3/exoplayer/rtsp/RtspMessageUtil$RtspAuthUserInfo;Landroid/net/Uri;I)Ljava/lang/String;

    move-result-object v1

    .line 475
    invoke-virtual {v0, p2, v1}, Landroidx/media3/exoplayer/rtsp/RtspHeaders$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Landroidx/media3/exoplayer/rtsp/RtspHeaders$Builder;
    :try_end_0
    .catch Landroidx/media3/common/ParserException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 479
    iget-object v1, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    new-instance v2, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$RtspPlaybackException;

    invoke-direct {v2, p2}, Landroidx/media3/exoplayer/rtsp/RtspMediaSource$RtspPlaybackException;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v1, v2}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$700(Landroidx/media3/exoplayer/rtsp/RtspClient;Ljava/lang/Throwable;)V

    .line 483
    :cond_0
    :goto_0
    invoke-virtual {v0, p3}, Landroidx/media3/exoplayer/rtsp/RtspHeaders$Builder;->addAll(Ljava/util/Map;)Landroidx/media3/exoplayer/rtsp/RtspHeaders$Builder;

    .line 484
    new-instance p2, Landroidx/media3/exoplayer/rtsp/RtspRequest;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/rtsp/RtspHeaders$Builder;->build()Landroidx/media3/exoplayer/rtsp/RtspHeaders;

    move-result-object p3

    const-string v0, ""

    invoke-direct {p2, p4, p1, p3, v0}, Landroidx/media3/exoplayer/rtsp/RtspRequest;-><init>(Landroid/net/Uri;ILandroidx/media3/exoplayer/rtsp/RtspHeaders;Ljava/lang/String;)V

    return-object p2
.end method

.method private sendRequest(Landroidx/media3/exoplayer/rtsp/RtspRequest;)V
    .locals 2

    .line 488
    iget-object v0, p1, Landroidx/media3/exoplayer/rtsp/RtspRequest;->headers:Landroidx/media3/exoplayer/rtsp/RtspHeaders;

    const-string v1, "CSeq"

    invoke-virtual {v0, v1}, Landroidx/media3/exoplayer/rtsp/RtspHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 489
    iget-object v1, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v1}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$800(Landroidx/media3/exoplayer/rtsp/RtspClient;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 490
    iget-object v1, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v1}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$800(Landroidx/media3/exoplayer/rtsp/RtspClient;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 491
    invoke-static {p1}, Landroidx/media3/exoplayer/rtsp/RtspMessageUtil;->serializeRequest(Landroidx/media3/exoplayer/rtsp/RtspRequest;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    .line 492
    iget-object v1, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v1, v0}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$900(Landroidx/media3/exoplayer/rtsp/RtspClient;Ljava/util/List;)V

    .line 493
    iget-object v1, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v1}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$1000(Landroidx/media3/exoplayer/rtsp/RtspClient;)Landroidx/media3/exoplayer/rtsp/RtspMessageChannel;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroidx/media3/exoplayer/rtsp/RtspMessageChannel;->send(Ljava/util/List;)V

    .line 494
    iput-object p1, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->lastRequest:Landroidx/media3/exoplayer/rtsp/RtspRequest;

    return-void
.end method

.method private sendResponse(Landroidx/media3/exoplayer/rtsp/RtspResponse;)V
    .locals 1

    .line 498
    invoke-static {p1}, Landroidx/media3/exoplayer/rtsp/RtspMessageUtil;->serializeResponse(Landroidx/media3/exoplayer/rtsp/RtspResponse;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    .line 499
    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v0, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$900(Landroidx/media3/exoplayer/rtsp/RtspClient;Ljava/util/List;)V

    .line 500
    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v0}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$1000(Landroidx/media3/exoplayer/rtsp/RtspClient;)Landroidx/media3/exoplayer/rtsp/RtspMessageChannel;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/rtsp/RtspMessageChannel;->send(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public retryLastRequest()V
    .locals 5

    .line 433
    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->lastRequest:Landroidx/media3/exoplayer/rtsp/RtspRequest;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->lastRequest:Landroidx/media3/exoplayer/rtsp/RtspRequest;

    iget-object v0, v0, Landroidx/media3/exoplayer/rtsp/RtspRequest;->headers:Landroidx/media3/exoplayer/rtsp/RtspHeaders;

    invoke-virtual {v0}, Landroidx/media3/exoplayer/rtsp/RtspHeaders;->asMultiMap()Lcom/google/common/collect/ImmutableListMultimap;

    move-result-object v0

    .line 436
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 437
    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 438
    const-string v4, "CSeq"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "User-Agent"

    .line 439
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "Session"

    .line 440
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "Authorization"

    .line 441
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_0

    .line 446
    :cond_1
    invoke-interface {v0, v3}, Lcom/google/common/collect/Multimap;->get(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v4

    invoke-static {v4}, Lcom/google/common/collect/Iterables;->getLast(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 449
    :cond_2
    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->lastRequest:Landroidx/media3/exoplayer/rtsp/RtspRequest;

    iget v0, v0, Landroidx/media3/exoplayer/rtsp/RtspRequest;->method:I

    iget-object v2, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    .line 451
    invoke-static {v2}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$300(Landroidx/media3/exoplayer/rtsp/RtspClient;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->lastRequest:Landroidx/media3/exoplayer/rtsp/RtspRequest;

    iget-object v3, v3, Landroidx/media3/exoplayer/rtsp/RtspRequest;->uri:Landroid/net/Uri;

    .line 450
    invoke-direct {p0, v0, v2, v1, v3}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->getRequestWithCommonHeaders(ILjava/lang/String;Ljava/util/Map;Landroid/net/Uri;)Landroidx/media3/exoplayer/rtsp/RtspRequest;

    move-result-object v0

    .line 449
    invoke-direct {p0, v0}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->sendRequest(Landroidx/media3/exoplayer/rtsp/RtspRequest;)V

    return-void
.end method

.method public sendDescribeRequest(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x2

    .line 387
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    .line 386
    invoke-direct {p0, v0, p2, v1, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->getRequestWithCommonHeaders(ILjava/lang/String;Ljava/util/Map;Landroid/net/Uri;)Landroidx/media3/exoplayer/rtsp/RtspRequest;

    move-result-object p1

    .line 385
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->sendRequest(Landroidx/media3/exoplayer/rtsp/RtspRequest;)V

    return-void
.end method

.method public sendMethodNotAllowedResponse(I)V
    .locals 4

    .line 456
    new-instance v0, Landroidx/media3/exoplayer/rtsp/RtspResponse;

    new-instance v1, Landroidx/media3/exoplayer/rtsp/RtspHeaders$Builder;

    iget-object v2, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    .line 458
    invoke-static {v2}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$400(Landroidx/media3/exoplayer/rtsp/RtspClient;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v3}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$300(Landroidx/media3/exoplayer/rtsp/RtspClient;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, p1}, Landroidx/media3/exoplayer/rtsp/RtspHeaders$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v1}, Landroidx/media3/exoplayer/rtsp/RtspHeaders$Builder;->build()Landroidx/media3/exoplayer/rtsp/RtspHeaders;

    move-result-object v1

    const/16 v2, 0x195

    invoke-direct {v0, v2, v1}, Landroidx/media3/exoplayer/rtsp/RtspResponse;-><init>(ILandroidx/media3/exoplayer/rtsp/RtspHeaders;)V

    .line 456
    invoke-direct {p0, v0}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->sendResponse(Landroidx/media3/exoplayer/rtsp/RtspResponse;)V

    .line 462
    iget v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->cSeq:I

    add-int/lit8 p1, p1, 0x1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->cSeq:I

    return-void
.end method

.method public sendOptionsRequest(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x4

    .line 381
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    .line 380
    invoke-direct {p0, v0, p2, v1, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->getRequestWithCommonHeaders(ILjava/lang/String;Ljava/util/Map;Landroid/net/Uri;)Landroidx/media3/exoplayer/rtsp/RtspRequest;

    move-result-object p1

    .line 379
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->sendRequest(Landroidx/media3/exoplayer/rtsp/RtspRequest;)V

    return-void
.end method

.method public sendPauseRequest(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 3

    .line 425
    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v0}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$100(Landroidx/media3/exoplayer/rtsp/RtspClient;)I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    const/4 v0, 0x5

    .line 428
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    .line 427
    invoke-direct {p0, v0, p2, v1, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->getRequestWithCommonHeaders(ILjava/lang/String;Ljava/util/Map;Landroid/net/Uri;)Landroidx/media3/exoplayer/rtsp/RtspRequest;

    move-result-object p1

    .line 426
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->sendRequest(Landroidx/media3/exoplayer/rtsp/RtspRequest;)V

    .line 429
    iget-object p1, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {p1, v2}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$202(Landroidx/media3/exoplayer/rtsp/RtspClient;Z)Z

    return-void
.end method

.method public sendPlayRequest(Landroid/net/Uri;JLjava/lang/String;)V
    .locals 3

    .line 401
    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v0}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$100(Landroidx/media3/exoplayer/rtsp/RtspClient;)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v0}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$100(Landroidx/media3/exoplayer/rtsp/RtspClient;)I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    invoke-static {v1}, Landroidx/media3/common/util/Assertions;->checkState(Z)V

    .line 402
    const-string v0, "Range"

    .line 407
    invoke-static {p2, p3}, Landroidx/media3/exoplayer/rtsp/RtspSessionTiming;->getOffsetStartTimeTiming(J)Ljava/lang/String;

    move-result-object p2

    .line 406
    invoke-static {v0, p2}, Lcom/google/common/collect/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;

    move-result-object p2

    const/4 p3, 0x6

    .line 403
    invoke-direct {p0, p3, p4, p2, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->getRequestWithCommonHeaders(ILjava/lang/String;Ljava/util/Map;Landroid/net/Uri;)Landroidx/media3/exoplayer/rtsp/RtspRequest;

    move-result-object p1

    .line 402
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->sendRequest(Landroidx/media3/exoplayer/rtsp/RtspRequest;)V

    return-void
.end method

.method public sendSetupRequest(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 391
    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$102(Landroidx/media3/exoplayer/rtsp/RtspClient;I)I

    .line 392
    const-string v0, "Transport"

    .line 396
    invoke-static {v0, p2}, Lcom/google/common/collect/ImmutableMap;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap;

    move-result-object p2

    const/16 v0, 0xa

    .line 393
    invoke-direct {p0, v0, p3, p2, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->getRequestWithCommonHeaders(ILjava/lang/String;Ljava/util/Map;Landroid/net/Uri;)Landroidx/media3/exoplayer/rtsp/RtspRequest;

    move-result-object p1

    .line 392
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->sendRequest(Landroidx/media3/exoplayer/rtsp/RtspRequest;)V

    return-void
.end method

.method public sendTeardownRequest(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 2

    .line 412
    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v0}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$100(Landroidx/media3/exoplayer/rtsp/RtspClient;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    invoke-static {v0}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$100(Landroidx/media3/exoplayer/rtsp/RtspClient;)I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 418
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->this$0:Landroidx/media3/exoplayer/rtsp/RtspClient;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroidx/media3/exoplayer/rtsp/RtspClient;->access$102(Landroidx/media3/exoplayer/rtsp/RtspClient;I)I

    const/16 v0, 0xc

    .line 421
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    .line 420
    invoke-direct {p0, v0, p2, v1, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->getRequestWithCommonHeaders(ILjava/lang/String;Ljava/util/Map;Landroid/net/Uri;)Landroidx/media3/exoplayer/rtsp/RtspRequest;

    move-result-object p1

    .line 419
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/rtsp/RtspClient$MessageSender;->sendRequest(Landroidx/media3/exoplayer/rtsp/RtspRequest;)V

    :cond_1
    :goto_0
    return-void
.end method
