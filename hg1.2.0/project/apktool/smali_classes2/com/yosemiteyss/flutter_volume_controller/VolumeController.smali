.class public final Lcom/yosemiteyss/flutter_volume_controller/VolumeController;
.super Ljava/lang/Object;
.source "VolumeController.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\n\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008J\u000e\u0010\t\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u0008J%\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\n2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0002\u0010\u000fJ%\u0010\u0010\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\n2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0002\u0010\u000fJ\u001e\u0010\u0011\u001a\u00020\u000c2\u0006\u0010\u0012\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008J\u001e\u0010\u0013\u001a\u00020\u000c2\u0006\u0010\u0014\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008J\u0016\u0010\u0015\u001a\u00020\u000c2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/yosemiteyss/flutter_volume_controller/VolumeController;",
        "",
        "audioManager",
        "Landroid/media/AudioManager;",
        "(Landroid/media/AudioManager;)V",
        "getMute",
        "",
        "audioStream",
        "Lcom/yosemiteyss/flutter_volume_controller/AudioStream;",
        "getVolume",
        "",
        "lowerVolume",
        "",
        "step",
        "showSystemUI",
        "(Ljava/lang/Double;ZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V",
        "raiseVolume",
        "setMute",
        "isMuted",
        "setVolume",
        "volume",
        "toggleMute",
        "flutter_volume_controller_release"
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
.field private final audioManager:Landroid/media/AudioManager;


# direct methods
.method public constructor <init>(Landroid/media/AudioManager;)V
    .locals 1

    const-string v0, "audioManager"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->audioManager:Landroid/media/AudioManager;

    return-void
.end method


# virtual methods
.method public final getMute(Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)Z
    .locals 2

    const-string v0, "audioStream"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 48
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {p1}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result p1

    invoke-static {v0, p1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;I)Z

    move-result p1

    goto :goto_0

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {p1}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final getVolume(Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)D
    .locals 2

    const-string v0, "audioStream"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->audioManager:Landroid/media/AudioManager;

    invoke-static {v0, p1}, Lcom/yosemiteyss/flutter_volume_controller/ExtensionsKt;->getVolume(Landroid/media/AudioManager;Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)D

    move-result-wide v0

    return-wide v0
.end method

.method public final lowerVolume(Ljava/lang/Double;ZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V
    .locals 4

    const-string v0, "audioStream"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p1, :cond_0

    .line 35
    iget-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->audioManager:Landroid/media/AudioManager;

    .line 36
    invoke-virtual {p3}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result p3

    const/4 v0, -0x1

    .line 35
    invoke-virtual {p1, p3, v0, p2}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {p0, p3}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->getVolume(Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)D

    move-result-wide v0

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    sub-double/2addr v0, v2

    .line 42
    invoke-virtual {p0, v0, v1, p2, p3}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->setVolume(DZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V

    :goto_0
    return-void
.end method

.method public final raiseVolume(Ljava/lang/Double;ZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V
    .locals 4

    const-string v0, "audioStream"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p1, :cond_0

    .line 22
    iget-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->audioManager:Landroid/media/AudioManager;

    .line 23
    invoke-virtual {p3}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result p3

    const/4 v0, 0x1

    .line 22
    invoke-virtual {p1, p3, v0, p2}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p0, p3}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->getVolume(Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)D

    move-result-wide v0

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    add-double/2addr v0, v2

    .line 29
    invoke-virtual {p0, v0, v1, p2, p3}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->setVolume(DZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V

    :goto_0
    return-void
.end method

.method public final setMute(ZZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V
    .locals 2

    const-string v0, "audioStream"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_1

    .line 57
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->audioManager:Landroid/media/AudioManager;

    .line 58
    invoke-virtual {p3}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result p3

    if-eqz p1, :cond_0

    const/16 p1, -0x64

    goto :goto_0

    :cond_0
    const/16 p1, 0x64

    .line 57
    :goto_0
    invoke-virtual {v0, p3, p1, p2}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    goto :goto_1

    .line 63
    :cond_1
    iget-object p2, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {p3}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result p3

    invoke-virtual {p2, p3, p1}, Landroid/media/AudioManager;->setStreamMute(IZ)V

    :goto_1
    return-void
.end method

.method public final setVolume(DZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V
    .locals 4

    const-string v0, "audioStream"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 12
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {p4}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    .line 13
    iget-object v1, p0, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->audioManager:Landroid/media/AudioManager;

    .line 14
    invoke-virtual {p4}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result p4

    int-to-double v2, v0

    mul-double v2, v2, p1

    double-to-int p1, v2

    .line 13
    invoke-virtual {v1, p4, p1, p3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    return-void
.end method

.method public final toggleMute(ZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V
    .locals 1

    const-string v0, "audioStream"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    invoke-virtual {p0, p2}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->getMute(Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 69
    invoke-virtual {p0, v0, p1, p2}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->setMute(ZZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V

    return-void
.end method
