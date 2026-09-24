.class Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$2;
.super Landroid/content/BroadcastReceiver;
.source "AndroidAudioManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->registerNoisyReceiver()V
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

    .line 593
    iput-object p1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$2;->this$0:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 596
    const-string p1, "android.media.AUDIO_BECOMING_NOISY"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 597
    iget-object p1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$2;->this$0:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Object;

    const-string v0, "onBecomingNoisy"

    invoke-virtual {p1, v0, p2}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->invokeMethod(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
