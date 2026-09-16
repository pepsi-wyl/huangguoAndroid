.class final Landroidx/media3/exoplayer/WifiLockManager;
.super Ljava/lang/Object;
.source "WifiLockManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "WifiLockManager"

.field private static final WIFI_LOCK_TAG:Ljava/lang/String; = "ExoPlayer:WifiLockManager"


# instance fields
.field private final applicationContext:Landroid/content/Context;

.field private enabled:Z

.field private stayAwake:Z

.field private wifiLock:Landroid/net/wifi/WifiManager$WifiLock;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/exoplayer/WifiLockManager;->applicationContext:Landroid/content/Context;

    return-void
.end method

.method private updateWifiLock()V
    .locals 2

    .line 86
    iget-object v0, p0, Landroidx/media3/exoplayer/WifiLockManager;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    if-nez v0, :cond_0

    return-void

    .line 90
    :cond_0
    iget-boolean v1, p0, Landroidx/media3/exoplayer/WifiLockManager;->enabled:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Landroidx/media3/exoplayer/WifiLockManager;->stayAwake:Z

    if-eqz v1, :cond_1

    .line 91
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    goto :goto_0

    .line 93
    :cond_1
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    :goto_0
    return-void
.end method


# virtual methods
.method public setEnabled(Z)V
    .locals 3

    if-eqz p1, :cond_1

    .line 55
    iget-object v0, p0, Landroidx/media3/exoplayer/WifiLockManager;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    if-nez v0, :cond_1

    .line 56
    iget-object v0, p0, Landroidx/media3/exoplayer/WifiLockManager;->applicationContext:Landroid/content/Context;

    .line 58
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    if-nez v0, :cond_0

    .line 60
    const-string p1, "WifiLockManager"

    const-string v0, "WifiManager is null, therefore not creating the WifiLock."

    invoke-static {p1, v0}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v1, 0x3

    .line 63
    const-string v2, "ExoPlayer:WifiLockManager"

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/exoplayer/WifiLockManager;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    const/4 v1, 0x0

    .line 64
    invoke-virtual {v0, v1}, Landroid/net/wifi/WifiManager$WifiLock;->setReferenceCounted(Z)V

    .line 67
    :cond_1
    iput-boolean p1, p0, Landroidx/media3/exoplayer/WifiLockManager;->enabled:Z

    .line 68
    invoke-direct {p0}, Landroidx/media3/exoplayer/WifiLockManager;->updateWifiLock()V

    return-void
.end method

.method public setStayAwake(Z)V
    .locals 0

    .line 81
    iput-boolean p1, p0, Landroidx/media3/exoplayer/WifiLockManager;->stayAwake:Z

    .line 82
    invoke-direct {p0}, Landroidx/media3/exoplayer/WifiLockManager;->updateWifiLock()V

    return-void
.end method
