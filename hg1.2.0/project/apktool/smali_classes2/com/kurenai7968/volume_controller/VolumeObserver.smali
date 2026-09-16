.class public final Lcom/kurenai7968/volume_controller/VolumeObserver;
.super Ljava/lang/Object;
.source "VolumeObserve.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0006\u0010\u0007\u001a\u00020\u0008J\u0016\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\rR\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/kurenai7968/volume_controller/VolumeObserver;",
        "",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "audioManager",
        "Landroid/media/AudioManager;",
        "getVolume",
        "",
        "setVolumeByPercentage",
        "",
        "volume",
        "showSystemUI",
        "",
        "volume_controller_release"
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
.field private audioManager:Landroid/media/AudioManager;

.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeObserver;->context:Landroid/content/Context;

    .line 15
    const-string v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type android.media.AudioManager"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Landroid/media/AudioManager;

    iput-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeObserver;->audioManager:Landroid/media/AudioManager;

    return-void
.end method


# virtual methods
.method public final getVolume()D
    .locals 4

    .line 33
    iget-object v0, p0, Lcom/kurenai7968/volume_controller/VolumeObserver;->audioManager:Landroid/media/AudioManager;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    .line 34
    iget-object v2, p0, Lcom/kurenai7968/volume_controller/VolumeObserver;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v2, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v1

    int-to-double v2, v0

    int-to-double v0, v1

    div-double/2addr v2, v0

    const/16 v0, 0x2710

    int-to-double v0, v0

    mul-double v2, v2, v0

    .line 35
    invoke-static {v2, v3}, Ljava/lang/Math;->rint(D)D

    move-result-wide v2

    div-double/2addr v2, v0

    return-wide v2
.end method

.method public final setVolumeByPercentage(DZ)V
    .locals 5

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    cmpl-double v2, p1, v0

    if-lez v2, :cond_0

    goto :goto_0

    :cond_0
    move-wide v0, p1

    :goto_0
    const-wide/16 v2, 0x0

    cmpg-double v4, p1, v2

    if-gez v4, :cond_1

    move-wide v0, v2

    .line 26
    :cond_1
    iget-object p1, p0, Lcom/kurenai7968/volume_controller/VolumeObserver;->audioManager:Landroid/media/AudioManager;

    const/4 p2, 0x3

    invoke-virtual {p1, p2}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result p1

    int-to-double v2, p1

    mul-double v0, v0, v2

    .line 27
    invoke-static {v0, v1}, Ljava/lang/Math;->rint(D)D

    move-result-wide v0

    double-to-int p1, v0

    .line 29
    iget-object v0, p0, Lcom/kurenai7968/volume_controller/VolumeObserver;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p2, p1, p3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    return-void
.end method
