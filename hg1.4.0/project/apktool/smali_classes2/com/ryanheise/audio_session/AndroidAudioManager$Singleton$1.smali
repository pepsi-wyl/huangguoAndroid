.class Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$1;
.super Landroid/media/AudioDeviceCallback;
.source "AndroidAudioManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->initAudioDeviceCallback()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;


# direct methods
.method constructor <init>(Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;)V
    .locals 0

    .line 275
    iput-object p1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$1;->this$0:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-direct {p0}, Landroid/media/AudioDeviceCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioDevicesAdded([Landroid/media/AudioDeviceInfo;)V
    .locals 3

    .line 278
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$1;->this$0:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-static {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager;->encodeAudioDevices([Landroid/media/AudioDeviceInfo;)Ljava/util/List;

    move-result-object p1

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "onAudioDevicesAdded"

    invoke-virtual {v0, p1, v1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->invokeMethod(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public onAudioDevicesRemoved([Landroid/media/AudioDeviceInfo;)V
    .locals 3

    .line 282
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$1;->this$0:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-static {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager;->encodeAudioDevices([Landroid/media/AudioDeviceInfo;)Ljava/util/List;

    move-result-object p1

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string p1, "onAudioDevicesRemoved"

    invoke-virtual {v0, p1, v1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->invokeMethod(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
