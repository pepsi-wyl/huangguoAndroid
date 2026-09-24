.class Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;
.super Ljava/lang/Object;
.source "AndroidAudioManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ryanheise/audio_session/AndroidAudioManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Singleton"
.end annotation


# instance fields
.field private applicationContext:Landroid/content/Context;

.field private audioDeviceCallback:Ljava/lang/Object;

.field private audioFocusRequest:Landroidx/media/AudioFocusRequestCompat;

.field private audioManager:Landroid/media/AudioManager;

.field private devices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/media/AudioDeviceInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final handler:Landroid/os/Handler;

.field private instances:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ryanheise/audio_session/AndroidAudioManager;",
            ">;"
        }
    .end annotation
.end field

.field private noisyReceiver:Landroid/content/BroadcastReceiver;

.field private scoReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 265
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 255
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->handler:Landroid/os/Handler;

    .line 256
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->instances:Ljava/util/List;

    .line 263
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->devices:Ljava/util/List;

    .line 266
    iput-object p1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->applicationContext:Landroid/content/Context;

    .line 267
    const-string v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/AudioManager;

    iput-object p1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    .line 268
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x17

    if-lt p1, v0, :cond_0

    .line 269
    invoke-direct {p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->initAudioDeviceCallback()V

    :cond_0
    return-void
.end method

.method private decodeAudioAttributes(Ljava/util/Map;)Landroidx/media/AudioAttributesCompat;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;)",
            "Landroidx/media/AudioAttributesCompat;"
        }
    .end annotation

    .line 633
    new-instance v0, Landroidx/media/AudioAttributesCompat$Builder;

    invoke-direct {v0}, Landroidx/media/AudioAttributesCompat$Builder;-><init>()V

    .line 634
    const-string v1, "contentType"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 635
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/media/AudioAttributesCompat$Builder;->setContentType(I)Landroidx/media/AudioAttributesCompat$Builder;

    .line 637
    :cond_0
    const-string v1, "flags"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 638
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/media/AudioAttributesCompat$Builder;->setFlags(I)Landroidx/media/AudioAttributesCompat$Builder;

    .line 640
    :cond_1
    const-string v1, "usage"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 641
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Landroidx/media/AudioAttributesCompat$Builder;->setUsage(I)Landroidx/media/AudioAttributesCompat$Builder;

    .line 643
    :cond_2
    invoke-virtual {v0}, Landroidx/media/AudioAttributesCompat$Builder;->build()Landroidx/media/AudioAttributesCompat;

    move-result-object p1

    return-object p1
.end method

.method private disposeAudioDeviceCallback()V
    .locals 2

    .line 664
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    iget-object v1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioDeviceCallback:Ljava/lang/Object;

    invoke-static {v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/media/AudioDeviceCallback;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;Landroid/media/AudioDeviceCallback;)V

    return-void
.end method

.method private initAudioDeviceCallback()V
    .locals 3

    .line 275
    new-instance v0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$1;

    invoke-direct {v0, p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$1;-><init>(Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;)V

    iput-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioDeviceCallback:Ljava/lang/Object;

    .line 285
    iget-object v1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/media/AudioDeviceCallback;

    move-result-object v0

    iget-object v2, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->handler:Landroid/os/Handler;

    invoke-static {v1, v0, v2}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;Landroid/media/AudioDeviceCallback;Landroid/os/Handler;)V

    return-void
.end method

.method private registerNoisyReceiver()V
    .locals 4

    .line 592
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->noisyReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    return-void

    .line 593
    :cond_0
    new-instance v0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$2;

    invoke-direct {v0, p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$2;-><init>(Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;)V

    iput-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->noisyReceiver:Landroid/content/BroadcastReceiver;

    .line 601
    iget-object v1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->applicationContext:Landroid/content/Context;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.media.AUDIO_BECOMING_NOISY"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x2

    invoke-static {v1, v0, v2, v3}, Landroidx/core/content/ContextCompat;->registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    return-void
.end method

.method private registerScoReceiver()V
    .locals 4

    .line 611
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->scoReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    return-void

    .line 612
    :cond_0
    new-instance v0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$3;

    invoke-direct {v0, p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$3;-><init>(Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;)V

    iput-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->scoReceiver:Landroid/content/BroadcastReceiver;

    .line 623
    iget-object v1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->applicationContext:Landroid/content/Context;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.media.ACTION_SCO_AUDIO_STATE_UPDATED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x2

    invoke-static {v1, v0, v2, v3}, Landroidx/core/content/ContextCompat;->registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    return-void
.end method

.method private unregisterNoisyReceiver()V
    .locals 2

    .line 605
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->noisyReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->applicationContext:Landroid/content/Context;

    if-nez v1, :cond_0

    goto :goto_0

    .line 606
    :cond_0
    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 607
    iput-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->noisyReceiver:Landroid/content/BroadcastReceiver;

    :cond_1
    :goto_0
    return-void
.end method

.method private unregisterScoReceiver()V
    .locals 2

    .line 627
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->scoReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->applicationContext:Landroid/content/Context;

    if-nez v1, :cond_0

    goto :goto_0

    .line 628
    :cond_0
    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 629
    iput-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->scoReceiver:Landroid/content/BroadcastReceiver;

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public abandonAudioFocus()Z
    .locals 4

    .line 327
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->applicationContext:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 328
    :cond_0
    invoke-direct {p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->unregisterNoisyReceiver()V

    .line 329
    invoke-direct {p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->unregisterScoReceiver()V

    .line 330
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioFocusRequest:Landroidx/media/AudioFocusRequestCompat;

    const/4 v2, 0x1

    if-nez v0, :cond_1

    return v2

    .line 333
    :cond_1
    iget-object v3, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v3, v0}, Landroidx/media/AudioManagerCompat;->abandonAudioFocusRequest(Landroid/media/AudioManager;Landroidx/media/AudioFocusRequestCompat;)I

    move-result v0

    const/4 v3, 0x0

    .line 334
    iput-object v3, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioFocusRequest:Landroidx/media/AudioFocusRequestCompat;

    if-ne v0, v2, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public add(Lcom/ryanheise/audio_session/AndroidAudioManager;)V
    .locals 1

    .line 289
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->instances:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public adjustStreamVolume(III)Ljava/lang/Object;
    .locals 1

    .line 360
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1, p2, p3}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public adjustSuggestedStreamVolume(III)Ljava/lang/Object;
    .locals 1

    .line 368
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1, p2, p3}, Landroid/media/AudioManager;->adjustSuggestedStreamVolume(III)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public adjustVolume(II)Ljava/lang/Object;
    .locals 1

    .line 364
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1, p2}, Landroid/media/AudioManager;->adjustVolume(II)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public clearCommunicationDevice()Ljava/lang/Object;
    .locals 1

    const/16 v0, 0x1f

    .line 430
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 431
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public dispatchMediaKeyEvent(Ljava/util/Map;)Ljava/lang/Object;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 340
    new-instance v13, Landroid/view/KeyEvent;

    const-string v0, "downTime"

    .line 341
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-string v0, "eventTime"

    .line 342
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->getLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    const-string v0, "action"

    .line 343
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const-string v0, "keyCode"

    .line 344
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const-string v0, "repeatCount"

    .line 345
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const-string v0, "metaState"

    .line 346
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const-string v0, "deviceId"

    .line 347
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const-string v0, "scanCode"

    .line 348
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const-string v0, "flags"

    .line 349
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v11

    const-string v0, "source"

    .line 350
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v12

    move-object v0, v13

    invoke-direct/range {v0 .. v12}, Landroid/view/KeyEvent;-><init>(JJIIIIIIII)V

    .line 351
    iget-object p1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {p1, v13}, Landroid/media/AudioManager;->dispatchMediaKeyEvent(Landroid/view/KeyEvent;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public dispose()V
    .locals 2

    .line 654
    invoke-virtual {p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->abandonAudioFocus()Z

    .line 655
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 656
    invoke-direct {p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->disposeAudioDeviceCallback()V

    :cond_0
    const/4 v0, 0x0

    .line 658
    iput-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->applicationContext:Landroid/content/Context;

    .line 659
    iput-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    return-void
.end method

.method public generateAudioSessionId()Ljava/lang/Object;
    .locals 1

    const/16 v0, 0x15

    .line 494
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 495
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->generateAudioSessionId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getAllowedCapturePolicy()Ljava/lang/Object;
    .locals 1

    const/16 v0, 0x1d

    .line 451
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 452
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getAvailableCommunicationDevices()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const/16 v0, 0x1f

    .line 405
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 406
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/AudioManager;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->devices:Ljava/util/List;

    .line 407
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 408
    iget-object v1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->devices:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/media/AudioDeviceInfo;

    move-result-object v2

    .line 409
    invoke-static {v2}, Lcom/ryanheise/audio_session/AndroidAudioManager;->encodeAudioDevice(Landroid/media/AudioDeviceInfo;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getCommunicationDevice()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const/16 v0, 0x1f

    .line 425
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 426
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;)Landroid/media/AudioDeviceInfo;

    move-result-object v0

    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->encodeAudioDevice(Landroid/media/AudioDeviceInfo;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getDevices(I)Ljava/lang/Object;
    .locals 18

    const/16 v0, 0x17

    .line 525
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 526
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v1, p0

    .line 527
    iget-object v2, v1, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    move/from16 v3, p1

    invoke-static {v2, v3}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;I)[Landroid/media/AudioDeviceInfo;

    move-result-object v2

    const/4 v4, 0x0

    .line 528
    :goto_0
    array-length v5, v2

    if-ge v4, v5, :cond_1

    .line 529
    aget-object v5, v2, v4

    .line 531
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1c

    if-lt v6, v7, :cond_0

    .line 532
    invoke-static {v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioDeviceInfo;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_0
    const/4 v6, 0x0

    .line 535
    :goto_1
    invoke-static {v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/AudioDeviceInfo;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 536
    invoke-static {v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioDeviceInfo;)Ljava/lang/CharSequence;

    move-result-object v8

    .line 538
    invoke-static {v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioDeviceInfo;)Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    .line 539
    invoke-static {v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/AudioDeviceInfo;)Z

    move-result v10

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    .line 540
    invoke-static {v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioDeviceInfo;)[I

    move-result-object v11

    invoke-static {v11}, Lcom/ryanheise/audio_session/AndroidAudioManager;->intArrayToList([I)Ljava/util/ArrayList;

    move-result-object v11

    .line 541
    invoke-static {v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/AudioDeviceInfo;)[I

    move-result-object v12

    invoke-static {v12}, Lcom/ryanheise/audio_session/AndroidAudioManager;->intArrayToList([I)Ljava/util/ArrayList;

    move-result-object v12

    .line 542
    invoke-static {v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/media/AudioDeviceInfo;)[I

    move-result-object v13

    invoke-static {v13}, Lcom/ryanheise/audio_session/AndroidAudioManager;->intArrayToList([I)Ljava/util/ArrayList;

    move-result-object v13

    .line 543
    invoke-static {v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$3(Landroid/media/AudioDeviceInfo;)[I

    move-result-object v14

    invoke-static {v14}, Lcom/ryanheise/audio_session/AndroidAudioManager;->intArrayToList([I)Ljava/util/ArrayList;

    move-result-object v14

    .line 544
    invoke-static {v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$4(Landroid/media/AudioDeviceInfo;)[I

    move-result-object v15

    invoke-static {v15}, Lcom/ryanheise/audio_session/AndroidAudioManager;->intArrayToList([I)Ljava/util/ArrayList;

    move-result-object v15

    .line 545
    invoke-static {v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioDeviceInfo;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v3, 0x16

    new-array v3, v3, [Ljava/lang/Object;

    const-string v16, "id"

    const/16 v17, 0x0

    aput-object v16, v3, v17

    const/16 v16, 0x1

    aput-object v7, v3, v16

    const-string v7, "productName"

    const/16 v16, 0x2

    aput-object v7, v3, v16

    const/4 v7, 0x3

    aput-object v8, v3, v7

    const-string v7, "address"

    const/4 v8, 0x4

    aput-object v7, v3, v8

    const/4 v7, 0x5

    aput-object v6, v3, v7

    const-string v6, "isSource"

    const/4 v7, 0x6

    aput-object v6, v3, v7

    const/4 v6, 0x7

    aput-object v9, v3, v6

    const-string v6, "isSink"

    const/16 v7, 0x8

    aput-object v6, v3, v7

    const/16 v6, 0x9

    aput-object v10, v3, v6

    const-string v6, "sampleRates"

    const/16 v7, 0xa

    aput-object v6, v3, v7

    const/16 v6, 0xb

    aput-object v11, v3, v6

    const-string v6, "channelMasks"

    const/16 v7, 0xc

    aput-object v6, v3, v7

    const/16 v6, 0xd

    aput-object v12, v3, v6

    const-string v6, "channelIndexMasks"

    const/16 v7, 0xe

    aput-object v6, v3, v7

    const/16 v6, 0xf

    aput-object v13, v3, v6

    const-string v6, "channelCounts"

    const/16 v7, 0x10

    aput-object v6, v3, v7

    const/16 v6, 0x11

    aput-object v14, v3, v6

    const-string v6, "encodings"

    const/16 v7, 0x12

    aput-object v6, v3, v7

    const/16 v6, 0x13

    aput-object v15, v3, v6

    const-string v6, "type"

    const/16 v7, 0x14

    aput-object v6, v3, v7

    const/16 v6, 0x15

    aput-object v5, v3, v6

    .line 534
    invoke-static {v3}, Lcom/ryanheise/audio_session/AndroidAudioManager;->mapOf([Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    :cond_1
    return-object v0
.end method

.method public getMicrophones()Ljava/lang/Object;
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x1c

    .line 552
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 553
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v2, p0

    .line 554
    iget-object v3, v2, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v3}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;)Ljava/util/List;

    move-result-object v3

    .line 555
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/media/MicrophoneInfo;

    move-result-object v4

    .line 556
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 557
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/MicrophoneInfo;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x2

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/util/Pair;

    .line 558
    new-instance v11, Ljava/util/ArrayList;

    iget-object v12, v7, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v12, Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    float-to-double v12, v12

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v12

    iget-object v7, v7, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    float-to-double v13, v7

    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    new-array v10, v10, [Ljava/lang/Double;

    aput-object v12, v10, v9

    aput-object v7, v10, v8

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v11, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v5, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 560
    :cond_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 561
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/MicrophoneInfo;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/util/Pair;

    .line 562
    new-instance v12, Ljava/util/ArrayList;

    iget-object v13, v11, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v13, Ljava/lang/Integer;

    iget-object v11, v11, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v11, Ljava/lang/Integer;

    new-array v14, v10, [Ljava/lang/Integer;

    aput-object v13, v14, v9

    aput-object v11, v14, v8

    invoke-static {v14}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-direct {v12, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v6, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 565
    :cond_1
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/MicrophoneInfo;)Ljava/lang/String;

    move-result-object v7

    .line 566
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/media/MicrophoneInfo;)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 567
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$3(Landroid/media/MicrophoneInfo;)I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 568
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/MicrophoneInfo;)Ljava/lang/String;

    move-result-object v13

    .line 569
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$4(Landroid/media/MicrophoneInfo;)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    .line 570
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$5(Landroid/media/MicrophoneInfo;)I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    .line 571
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/MicrophoneInfo;)I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    .line 572
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/MicrophoneInfo;)Landroid/media/MicrophoneInfo$Coordinate3F;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/ryanheise/audio_session/AndroidAudioManager;->coordinate3fToList(Landroid/media/MicrophoneInfo$Coordinate3F;)Ljava/util/ArrayList;

    move-result-object v17

    .line 573
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/MicrophoneInfo;)Landroid/media/MicrophoneInfo$Coordinate3F;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/ryanheise/audio_session/AndroidAudioManager;->coordinate3fToList(Landroid/media/MicrophoneInfo$Coordinate3F;)Ljava/util/ArrayList;

    move-result-object v18

    .line 576
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/MicrophoneInfo;)F

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v19

    .line 577
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/MicrophoneInfo;)F

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v20

    .line 578
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/media/MicrophoneInfo;)F

    move-result v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v21

    .line 579
    invoke-static {v4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/MicrophoneInfo;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v0, 0x1e

    new-array v0, v0, [Ljava/lang/Object;

    const-string v22, "description"

    aput-object v22, v0, v9

    aput-object v7, v0, v8

    const-string v7, "id"

    aput-object v7, v0, v10

    const/4 v7, 0x3

    aput-object v11, v0, v7

    const-string v7, "type"

    const/4 v8, 0x4

    aput-object v7, v0, v8

    const/4 v7, 0x5

    aput-object v12, v0, v7

    const-string v7, "address"

    const/4 v8, 0x6

    aput-object v7, v0, v8

    const/4 v7, 0x7

    aput-object v13, v0, v7

    const-string v7, "location"

    const/16 v8, 0x8

    aput-object v7, v0, v8

    const/16 v7, 0x9

    aput-object v14, v0, v7

    const-string v7, "group"

    const/16 v8, 0xa

    aput-object v7, v0, v8

    const/16 v7, 0xb

    aput-object v15, v0, v7

    const-string v7, "indexInTheGroup"

    const/16 v8, 0xc

    aput-object v7, v0, v8

    const/16 v7, 0xd

    aput-object v16, v0, v7

    const-string v7, "position"

    const/16 v8, 0xe

    aput-object v7, v0, v8

    const/16 v7, 0xf

    aput-object v17, v0, v7

    const-string v7, "orientation"

    const/16 v8, 0x10

    aput-object v7, v0, v8

    const/16 v7, 0x11

    aput-object v18, v0, v7

    const-string v7, "frequencyResponse"

    const/16 v8, 0x12

    aput-object v7, v0, v8

    const/16 v7, 0x13

    aput-object v5, v0, v7

    const-string v5, "channelMapping"

    const/16 v7, 0x14

    aput-object v5, v0, v7

    const/16 v5, 0x15

    aput-object v6, v0, v5

    const-string v5, "sensitivity"

    const/16 v6, 0x16

    aput-object v5, v0, v6

    const/16 v5, 0x17

    aput-object v19, v0, v5

    const-string v5, "maxSpl"

    const/16 v6, 0x18

    aput-object v5, v0, v6

    const/16 v5, 0x19

    aput-object v20, v0, v5

    const-string v5, "minSpl"

    const/16 v6, 0x1a

    aput-object v5, v0, v6

    const/16 v5, 0x1b

    aput-object v21, v0, v5

    const-string v5, "directionality"

    const/16 v6, 0x1c

    aput-object v5, v0, v6

    const/16 v5, 0x1d

    aput-object v4, v0, v5

    .line 564
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->mapOf([Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/16 v0, 0x1c

    goto/16 :goto_0

    :cond_2
    return-object v1
.end method

.method public getMode()Ljava/lang/Object;
    .locals 1

    .line 487
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->getMode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getParameters(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 502
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->getParameters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 521
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getRingerMode()Ljava/lang/Object;
    .locals 1

    .line 372
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getStreamMaxVolume(I)Ljava/lang/Object;
    .locals 1

    .line 375
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getStreamMinVolume(I)Ljava/lang/Object;
    .locals 1

    const/16 v0, 0x1c

    .line 379
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 380
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v0, p1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getStreamVolume(I)Ljava/lang/Object;
    .locals 1

    .line 383
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public getStreamVolumeDb(III)Ljava/lang/Object;
    .locals 1

    const/16 v0, 0x1c

    .line 387
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 388
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v0, p1, p2, p3}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;III)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    return-object p1
.end method

.method public varargs invokeMethod(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 4

    .line 647
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->instances:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ryanheise/audio_session/AndroidAudioManager;

    .line 648
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 649
    iget-object v1, v1, Lcom/ryanheise/audio_session/AndroidAudioManager;->channel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {v1, p1, v2}, Lio/flutter/plugin/common/MethodChannel;->invokeMethod(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public isBluetoothScoAvailableOffCall()Ljava/lang/Object;
    .locals 1

    .line 455
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoAvailableOffCall()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public isBluetoothScoOn()Ljava/lang/Object;
    .locals 1

    .line 473
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 297
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->instances:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isHapticPlaybackSupported()Ljava/lang/Object;
    .locals 1

    const/16 v0, 0x1d

    .line 587
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 588
    invoke-static {}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$2()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public isMicrophoneMute()Ljava/lang/Object;
    .locals 1

    .line 480
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isMicrophoneMute()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public isMusicActive()Ljava/lang/Object;
    .locals 1

    .line 490
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isMusicActive()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public isSpeakerphoneOn()Ljava/lang/Object;
    .locals 1

    .line 441
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public isStreamMute(I)Ljava/lang/Object;
    .locals 1

    const/16 v0, 0x17

    .line 400
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 401
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v0, p1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;I)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public isVolumeFixed()Ljava/lang/Object;
    .locals 1

    const/16 v0, 0x15

    .line 356
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 357
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isVolumeFixed()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$requestAudioFocus$0$com-ryanheise-audio_session-AndroidAudioManager$Singleton(I)V
    .locals 2

    .line 0
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 307
    invoke-virtual {p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->abandonAudioFocus()Z

    .line 308
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "onAudioFocusChanged"

    invoke-virtual {p0, p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->invokeMethod(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public loadSoundEffects()Ljava/lang/Object;
    .locals 1

    .line 513
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->loadSoundEffects()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public playSoundEffect(ILjava/lang/Double;)Ljava/lang/Object;
    .locals 3

    if-eqz p2, :cond_0

    .line 506
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    double-to-float p2, v1

    invoke-virtual {v0, p1, p2}, Landroid/media/AudioManager;->playSoundEffect(IF)V

    goto :goto_0

    .line 508
    :cond_0
    iget-object p2, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {p2, p1}, Landroid/media/AudioManager;->playSoundEffect(I)V

    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public remove(Lcom/ryanheise/audio_session/AndroidAudioManager;)V
    .locals 1

    .line 293
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->instances:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public requestAudioFocus(Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;)Z"
        }
    .end annotation

    .line 301
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioFocusRequest:Landroidx/media/AudioFocusRequestCompat;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    .line 304
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    .line 305
    new-instance v2, Landroidx/media/AudioFocusRequestCompat$Builder;

    const-string v3, "gainType"

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v2, v3}, Landroidx/media/AudioFocusRequestCompat$Builder;-><init>(I)V

    .line 306
    new-instance v3, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$$ExternalSyntheticLambda32;

    invoke-direct {v3, p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton$$ExternalSyntheticLambda32;-><init>(Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;)V

    invoke-virtual {v2, v3}, Landroidx/media/AudioFocusRequestCompat$Builder;->setOnAudioFocusChangeListener(Landroid/media/AudioManager$OnAudioFocusChangeListener;)Landroidx/media/AudioFocusRequestCompat$Builder;

    .line 310
    const-string v3, "audioAttributes"

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 311
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-direct {p0, v3}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->decodeAudioAttributes(Ljava/util/Map;)Landroidx/media/AudioAttributesCompat;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/media/AudioFocusRequestCompat$Builder;->setAudioAttributes(Landroidx/media/AudioAttributesCompat;)Landroidx/media/AudioFocusRequestCompat$Builder;

    .line 313
    :cond_1
    const-string v3, "willPauseWhenDucked"

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 314
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v2, p1}, Landroidx/media/AudioFocusRequestCompat$Builder;->setWillPauseWhenDucked(Z)Landroidx/media/AudioFocusRequestCompat$Builder;

    .line 316
    :cond_2
    invoke-virtual {v2}, Landroidx/media/AudioFocusRequestCompat$Builder;->build()Landroidx/media/AudioFocusRequestCompat;

    move-result-object p1

    iput-object p1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioFocusRequest:Landroidx/media/AudioFocusRequestCompat;

    .line 317
    iget-object v2, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v2, p1}, Landroidx/media/AudioManagerCompat;->requestAudioFocus(Landroid/media/AudioManager;Landroidx/media/AudioFocusRequestCompat;)I

    move-result p1

    if-ne p1, v1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_4

    .line 320
    invoke-direct {p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->registerNoisyReceiver()V

    .line 321
    invoke-direct {p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->registerScoReceiver()V

    :cond_4
    return v1
.end method

.method public setAllowedCapturePolicy(I)Ljava/lang/Object;
    .locals 1

    const/16 v0, 0x1d

    .line 445
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 446
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {v0, p1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;I)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public setBluetoothScoOn(Z)Ljava/lang/Object;
    .locals 1

    .line 468
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public setCommunicationDevice(Ljava/lang/Integer;)Z
    .locals 4

    const/16 v0, 0x1f

    .line 415
    invoke-static {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager;->requireApi(I)V

    .line 416
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->devices:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/media/AudioDeviceInfo;

    move-result-object v1

    .line 417
    invoke-static {v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/AudioDeviceInfo;)I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 418
    iget-object p1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-static {p1, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioManager;Landroid/media/AudioDeviceInfo;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public setMicrophoneMute(Z)Ljava/lang/Object;
    .locals 1

    .line 476
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setMicrophoneMute(Z)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public setMode(I)Ljava/lang/Object;
    .locals 1

    .line 483
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setMode(I)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public setParameters(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 498
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public setRingerMode(I)Ljava/lang/Object;
    .locals 1

    .line 391
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setRingerMode(I)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public setSpeakerphoneOn(Z)Ljava/lang/Object;
    .locals 1

    .line 436
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public setStreamVolume(III)Ljava/lang/Object;
    .locals 1

    .line 395
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1, p2, p3}, Landroid/media/AudioManager;->setStreamVolume(III)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public startBluetoothSco()Ljava/lang/Object;
    .locals 1

    .line 459
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->startBluetoothSco()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public stopBluetoothSco()Ljava/lang/Object;
    .locals 1

    .line 464
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->stopBluetoothSco()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public unloadSoundEffects()Ljava/lang/Object;
    .locals 1

    .line 517
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->unloadSoundEffects()V

    const/4 v0, 0x0

    return-object v0
.end method
