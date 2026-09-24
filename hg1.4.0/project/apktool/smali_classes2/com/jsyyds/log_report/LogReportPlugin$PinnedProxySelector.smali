.class final Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;
.super Ljava/net/ProxySelector;
.source "LogReportPlugin.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jsyyds/log_report/LogReportPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PinnedProxySelector"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0002\u0018\u00002\u00020\u0001B\u0017\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005J&\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0012H\u0016J\u0010\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016H\u0002J\u0018\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\n0\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0002J\u0018\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\n0\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0016R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0001\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0014\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\n0\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;",
        "Ljava/net/ProxySelector;",
        "previous",
        "port",
        "",
        "(Ljava/net/ProxySelector;I)V",
        "getPrevious",
        "()Ljava/net/ProxySelector;",
        "proxies",
        "",
        "Ljava/net/Proxy;",
        "connectFailed",
        "",
        "uri",
        "Ljava/net/URI;",
        "sa",
        "Ljava/net/SocketAddress;",
        "ioe",
        "Ljava/io/IOException;",
        "isLoopback",
        "",
        "host",
        "",
        "passThrough",
        "select",
        "log_report_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final previous:Ljava/net/ProxySelector;

.field private final proxies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/net/ProxySelector;I)V
    .locals 3

    .line 100
    invoke-direct {p0}, Ljava/net/ProxySelector;-><init>()V

    .line 98
    iput-object p1, p0, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->previous:Ljava/net/ProxySelector;

    .line 112
    new-instance p1, Ljava/net/Proxy;

    .line 113
    sget-object v0, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    .line 114
    new-instance v1, Ljava/net/InetSocketAddress;

    const/4 v2, 0x4

    .line 115
    new-array v2, v2, [B

    fill-array-data v2, :array_0

    invoke-static {v2}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v2

    .line 114
    invoke-direct {v1, v2, p2}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    check-cast v1, Ljava/net/SocketAddress;

    .line 112
    invoke-direct {p1, v0, v1}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    .line 111
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->proxies:Ljava/util/List;

    return-void

    :array_0
    .array-data 1
        0x7ft
        0x0t
        0x0t
        0x1t
    .end array-data
.end method

.method private final isLoopback(Ljava/lang/String;)Z
    .locals 1

    .line 137
    const-string v0, "127.0.0.1"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "localhost"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "::1"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "[::1]"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private final passThrough(Ljava/net/URI;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            ")",
            "Ljava/util/List<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation

    .line 134
    iget-object v0, p0, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->previous:Ljava/net/ProxySelector;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    sget-object p1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    :cond_1
    return-object p1
.end method


# virtual methods
.method public connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->previous:Ljava/net/ProxySelector;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Ljava/net/ProxySelector;->connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V

    :cond_0
    return-void
.end method

.method public final getPrevious()Ljava/net/ProxySelector;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->previous:Ljava/net/ProxySelector;

    return-object v0
.end method

.method public select(Ljava/net/URI;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            ")",
            "Ljava/util/List<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 122
    invoke-direct {p0, p1}, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->passThrough(Ljava/net/URI;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 123
    :cond_0
    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    const-string v2, "https"

    invoke-static {v2, v0, v1}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0, p1}, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->passThrough(Ljava/net/URI;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 124
    :cond_1
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-direct {p0, p1}, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->passThrough(Ljava/net/URI;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 125
    :cond_2
    invoke-direct {p0, v0}, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->isLoopback(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0, p1}, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->passThrough(Ljava/net/URI;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 126
    :cond_3
    iget-object p1, p0, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->proxies:Ljava/util/List;

    return-object p1
.end method
