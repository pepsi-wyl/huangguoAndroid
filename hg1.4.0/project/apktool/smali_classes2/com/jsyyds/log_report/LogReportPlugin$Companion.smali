.class final Lcom/jsyyds/log_report/LogReportPlugin$Companion;
.super Ljava/lang/Object;
.source "LogReportPlugin.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jsyyds/log_report/LogReportPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0082\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nJ\u0006\u0010\u000b\u001a\u00020\u0008R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/jsyyds/log_report/LogReportPlugin$Companion;",
        "",
        "()V",
        "CHANNEL",
        "",
        "installed",
        "Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;",
        "install",
        "",
        "port",
        "",
        "uninstall",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/jsyyds/log_report/LogReportPlugin$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final declared-synchronized install(I)V
    .locals 2

    monitor-enter p0

    .line 75
    :try_start_0
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v0

    .line 77
    instance-of v1, v0, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;

    invoke-virtual {v0}, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->getPrevious()Ljava/net/ProxySelector;

    move-result-object v0

    .line 78
    :cond_0
    new-instance v1, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;

    invoke-direct {v1, v0, p1}, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;-><init>(Ljava/net/ProxySelector;I)V

    .line 79
    invoke-static {v1}, Lcom/jsyyds/log_report/LogReportPlugin;->access$setInstalled$cp(Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;)V

    .line 80
    check-cast v1, Ljava/net/ProxySelector;

    invoke-static {v1}, Ljava/net/ProxySelector;->setDefault(Ljava/net/ProxySelector;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized uninstall()V
    .locals 2

    monitor-enter p0

    .line 85
    :try_start_0
    invoke-static {}, Lcom/jsyyds/log_report/LogReportPlugin;->access$getInstalled$cp()Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 86
    :try_start_1
    invoke-static {v1}, Lcom/jsyyds/log_report/LogReportPlugin;->access$setInstalled$cp(Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;)V

    .line 88
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v1

    if-ne v1, v0, :cond_1

    .line 89
    invoke-virtual {v0}, Lcom/jsyyds/log_report/LogReportPlugin$PinnedProxySelector;->getPrevious()Ljava/net/ProxySelector;

    move-result-object v0

    invoke-static {v0}, Ljava/net/ProxySelector;->setDefault(Ljava/net/ProxySelector;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
