.class final Landroidx/media3/exoplayer/WakeLockManager;
.super Ljava/lang/Object;
.source "WakeLockManager.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "WakeLockManager"

.field private static final WAKE_LOCK_TAG:Ljava/lang/String; = "ExoPlayer:WakeLockManager"


# instance fields
.field private final applicationContext:Landroid/content/Context;

.field private enabled:Z

.field private stayAwake:Z

.field private wakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/exoplayer/WakeLockManager;->applicationContext:Landroid/content/Context;

    return-void
.end method

.method private updateWakeLock()V
    .locals 2

    .line 92
    iget-object v0, p0, Landroidx/media3/exoplayer/WakeLockManager;->wakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_0

    return-void

    .line 96
    :cond_0
    iget-boolean v1, p0, Landroidx/media3/exoplayer/WakeLockManager;->enabled:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Landroidx/media3/exoplayer/WakeLockManager;->stayAwake:Z

    if-eqz v1, :cond_1

    .line 97
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    goto :goto_0

    .line 99
    :cond_1
    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :goto_0
    return-void
.end method


# virtual methods
.method public setEnabled(Z)V
    .locals 3

    if-eqz p1, :cond_1

    .line 57
    iget-object v0, p0, Landroidx/media3/exoplayer/WakeLockManager;->wakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v0, :cond_1

    .line 58
    iget-object v0, p0, Landroidx/media3/exoplayer/WakeLockManager;->applicationContext:Landroid/content/Context;

    const-string v1, "power"

    .line 59
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    if-nez v0, :cond_0

    .line 61
    const-string p1, "WakeLockManager"

    const-string v0, "PowerManager is null, therefore not creating the WakeLock."

    invoke-static {p1, v0}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 64
    const-string v2, "ExoPlayer:WakeLockManager"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/exoplayer/WakeLockManager;->wakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v1, 0x0

    .line 65
    invoke-virtual {v0, v1}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    .line 69
    :cond_1
    iput-boolean p1, p0, Landroidx/media3/exoplayer/WakeLockManager;->enabled:Z

    .line 70
    invoke-direct {p0}, Landroidx/media3/exoplayer/WakeLockManager;->updateWakeLock()V

    return-void
.end method

.method public setStayAwake(Z)V
    .locals 0

    .line 83
    iput-boolean p1, p0, Landroidx/media3/exoplayer/WakeLockManager;->stayAwake:Z

    .line 84
    invoke-direct {p0}, Landroidx/media3/exoplayer/WakeLockManager;->updateWakeLock()V

    return-void
.end method
