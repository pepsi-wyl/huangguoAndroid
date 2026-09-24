.class public Lcom/ryanheise/audio_session/AndroidAudioManager;
.super Ljava/lang/Object;
.source "AndroidAudioManager.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;
    }
.end annotation


# static fields
.field private static singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;


# instance fields
.field channel:Lio/flutter/plugin/common/MethodChannel;

.field messenger:Lio/flutter/plugin/common/BinaryMessenger;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    sget-object v0, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    if-nez v0, :cond_0

    .line 43
    new-instance v0, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-direct {v0, p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    .line 44
    :cond_0
    iput-object p2, p0, Lcom/ryanheise/audio_session/AndroidAudioManager;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 45
    new-instance p1, Lio/flutter/plugin/common/MethodChannel;

    const-string v0, "com.ryanheise.android_audio_manager"

    invoke-direct {p1, p2, v0}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 46
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1, p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->add(Lcom/ryanheise/audio_session/AndroidAudioManager;)V

    .line 47
    iget-object p1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager;->channel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1, p0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method

.method static coordinate3fToList(Landroid/media/MicrophoneInfo$Coordinate3F;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/media/MicrophoneInfo$Coordinate3F;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 699
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 700
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/MicrophoneInfo$Coordinate3F;)F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 701
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/MicrophoneInfo$Coordinate3F;)F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 702
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/media/MicrophoneInfo$Coordinate3F;)F

    move-result p0

    float-to-double v1, p0

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method static doubleArrayToList([D)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([D)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 690
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 691
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 692
    aget-wide v2, p0, v1

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static encodeAudioDevice(Landroid/media/AudioDeviceInfo;)Ljava/util/Map;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/media/AudioDeviceInfo;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 722
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 723
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioDeviceInfo;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 726
    :goto_0
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/AudioDeviceInfo;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 727
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioDeviceInfo;)Ljava/lang/CharSequence;

    move-result-object v2

    .line 729
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioDeviceInfo;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 730
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/AudioDeviceInfo;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 731
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioDeviceInfo;)[I

    move-result-object v5

    .line 732
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/AudioDeviceInfo;)[I

    move-result-object v6

    .line 733
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$2(Landroid/media/AudioDeviceInfo;)[I

    move-result-object v7

    .line 734
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$3(Landroid/media/AudioDeviceInfo;)[I

    move-result-object v8

    .line 735
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$4(Landroid/media/AudioDeviceInfo;)[I

    move-result-object v9

    .line 736
    invoke-static {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/AudioDeviceInfo;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/16 v10, 0x16

    new-array v10, v10, [Ljava/lang/Object;

    const-string v11, "id"

    const/4 v12, 0x0

    aput-object v11, v10, v12

    const/4 v11, 0x1

    aput-object v1, v10, v11

    const-string v1, "productName"

    const/4 v11, 0x2

    aput-object v1, v10, v11

    const/4 v1, 0x3

    aput-object v2, v10, v1

    const-string v1, "address"

    const/4 v2, 0x4

    aput-object v1, v10, v2

    const/4 v1, 0x5

    aput-object v0, v10, v1

    const-string v0, "isSource"

    const/4 v1, 0x6

    aput-object v0, v10, v1

    const/4 v0, 0x7

    aput-object v3, v10, v0

    const-string v0, "isSink"

    const/16 v1, 0x8

    aput-object v0, v10, v1

    const/16 v0, 0x9

    aput-object v4, v10, v0

    const-string v0, "sampleRates"

    const/16 v1, 0xa

    aput-object v0, v10, v1

    const/16 v0, 0xb

    aput-object v5, v10, v0

    const-string v0, "channelMasks"

    const/16 v1, 0xc

    aput-object v0, v10, v1

    const/16 v0, 0xd

    aput-object v6, v10, v0

    const-string v0, "channelIndexMasks"

    const/16 v1, 0xe

    aput-object v0, v10, v1

    const/16 v0, 0xf

    aput-object v7, v10, v0

    const-string v0, "channelCounts"

    const/16 v1, 0x10

    aput-object v0, v10, v1

    const/16 v0, 0x11

    aput-object v8, v10, v0

    const-string v0, "encodings"

    const/16 v1, 0x12

    aput-object v0, v10, v1

    const/16 v0, 0x13

    aput-object v9, v10, v0

    const-string v0, "type"

    const/16 v1, 0x14

    aput-object v0, v10, v1

    const/16 v0, 0x15

    aput-object p0, v10, v0

    .line 725
    invoke-static {v10}, Lcom/ryanheise/audio_session/AndroidAudioManager;->mapOf([Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static encodeAudioDevices([Landroid/media/AudioDeviceInfo;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/media/AudioDeviceInfo;",
            ")",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 712
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 713
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 714
    invoke-static {v3}, Lcom/ryanheise/audio_session/AndroidAudioManager;->encodeAudioDevice(Landroid/media/AudioDeviceInfo;)Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static getLong(Ljava/lang/Object;)Ljava/lang/Long;
    .locals 2

    if-eqz p0, :cond_1

    .line 707
    instance-of v0, p0, Ljava/lang/Long;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long v0, p0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    goto :goto_1

    :cond_1
    :goto_0
    check-cast p0, Ljava/lang/Long;

    :goto_1
    return-object p0
.end method

.method static intArrayToList([I)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 682
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 683
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 684
    aget v2, p0, v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static varargs mapOf([Ljava/lang/Object;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 674
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    .line 675
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 676
    aget-object v2, p0, v1

    check-cast v2, Ljava/lang/String;

    add-int/lit8 v3, v1, 0x1

    aget-object v3, p0, v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method static requireApi(I)V
    .locals 3

    .line 669
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, p0, :cond_0

    return-void

    .line 670
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Requires API level "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 239
    iget-object v0, p0, Lcom/ryanheise/audio_session/AndroidAudioManager;->channel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 240
    sget-object v0, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {v0, p0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->remove(Lcom/ryanheise/audio_session/AndroidAudioManager;)V

    .line 241
    sget-object v0, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 242
    sget-object v0, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->dispose()V

    .line 243
    sput-object v1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    .line 245
    :cond_0
    iput-object v1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 246
    iput-object v1, p0, Lcom/ryanheise/audio_session/AndroidAudioManager;->messenger:Lio/flutter/plugin/common/BinaryMessenger;

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 5

    .line 53
    :try_start_0
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    .line 54
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    sparse-switch v1, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v1, "generateAudioSessionId"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x21

    goto/16 :goto_1

    :sswitch_1
    const-string v1, "isVolumeFixed"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x3

    goto/16 :goto_1

    :sswitch_2
    const-string v1, "setMode"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x1e

    goto/16 :goto_1

    :sswitch_3
    const-string v1, "getAvailableCommunicationDevices"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0xf

    goto/16 :goto_1

    :sswitch_4
    const-string v1, "playSoundEffect"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x24

    goto/16 :goto_1

    :sswitch_5
    const-string v1, "setRingerMode"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0xc

    goto/16 :goto_1

    :sswitch_6
    const-string v1, "unloadSoundEffects"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x26

    goto/16 :goto_1

    :sswitch_7
    const-string v1, "abandonAudioFocus"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto/16 :goto_1

    :sswitch_8
    const-string v1, "adjustSuggestedStreamVolume"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x6

    goto/16 :goto_1

    :sswitch_9
    const-string v1, "clearCommunicationDevice"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x12

    goto/16 :goto_1

    :sswitch_a
    const-string v1, "setStreamVolume"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0xd

    goto/16 :goto_1

    :sswitch_b
    const-string v1, "getAllowedCapturePolicy"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x16

    goto/16 :goto_1

    :sswitch_c
    const-string v1, "getProperty"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x27

    goto/16 :goto_1

    :sswitch_d
    const-string v1, "isStreamMute"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0xe

    goto/16 :goto_1

    :sswitch_e
    const-string v1, "adjustVolume"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x5

    goto/16 :goto_1

    :sswitch_f
    const-string v1, "setParameters"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x22

    goto/16 :goto_1

    :sswitch_10
    const-string v1, "getRingerMode"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x7

    goto/16 :goto_1

    :sswitch_11
    const-string v1, "isBluetoothScoAvailableOffCall"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x17

    goto/16 :goto_1

    :sswitch_12
    const-string v1, "getStreamVolume"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0xa

    goto/16 :goto_1

    :sswitch_13
    const-string v1, "stopBluetoothSco"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x19

    goto/16 :goto_1

    :sswitch_14
    const-string v1, "getParameters"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x23

    goto/16 :goto_1

    :sswitch_15
    const-string v1, "dispatchMediaKeyEvent"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    goto/16 :goto_1

    :sswitch_16
    const-string v1, "getMode"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x1f

    goto/16 :goto_1

    :sswitch_17
    const-string v1, "getStreamVolumeDb"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0xb

    goto/16 :goto_1

    :sswitch_18
    const-string v1, "setCommunicationDevice"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x10

    goto/16 :goto_1

    :sswitch_19
    const-string v1, "startBluetoothSco"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x18

    goto/16 :goto_1

    :sswitch_1a
    const-string v1, "isMusicActive"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x20

    goto/16 :goto_1

    :sswitch_1b
    const-string v1, "loadSoundEffects"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x25

    goto/16 :goto_1

    :sswitch_1c
    const-string v1, "getStreamMinVolume"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x9

    goto/16 :goto_1

    :sswitch_1d
    const-string v1, "setBluetoothScoOn"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x1a

    goto/16 :goto_1

    :sswitch_1e
    const-string v1, "setAllowedCapturePolicy"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x15

    goto/16 :goto_1

    :sswitch_1f
    const-string v1, "getMicrophones"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x29

    goto/16 :goto_1

    :sswitch_20
    const-string v1, "adjustStreamVolume"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x4

    goto/16 :goto_1

    :sswitch_21
    const-string v1, "isBluetoothScoOn"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x1b

    goto/16 :goto_1

    :sswitch_22
    const-string v1, "setSpeakerphoneOn"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x13

    goto :goto_1

    :sswitch_23
    const-string v1, "setMicrophoneMute"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x1c

    goto :goto_1

    :sswitch_24
    const-string v1, "requestAudioFocus"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_1

    :sswitch_25
    const-string v1, "isHapticPlaybackSupported"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x2a

    goto :goto_1

    :sswitch_26
    const-string v1, "isSpeakerphoneOn"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x14

    goto :goto_1

    :sswitch_27
    const-string v1, "getStreamMaxVolume"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x8

    goto :goto_1

    :sswitch_28
    const-string v1, "isMicrophoneMute"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x1d

    goto :goto_1

    :sswitch_29
    const-string v1, "getDevices"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x28

    goto :goto_1

    :sswitch_2a
    const-string v1, "getCommunicationDevice"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 p1, 0x11

    goto :goto_1

    :cond_0
    :goto_0
    const/4 p1, -0x1

    :goto_1
    packed-switch p1, :pswitch_data_0

    .line 228
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    goto/16 :goto_2

    .line 224
    :pswitch_0
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->isHapticPlaybackSupported()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 220
    :pswitch_1
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getMicrophones()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 216
    :pswitch_2
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getDevices(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 212
    :pswitch_3
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 208
    :pswitch_4
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->unloadSoundEffects()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 204
    :pswitch_5
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->loadSoundEffects()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 200
    :pswitch_6
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {p1, v1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->playSoundEffect(ILjava/lang/Double;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 196
    :pswitch_7
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getParameters(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 192
    :pswitch_8
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->setParameters(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 188
    :pswitch_9
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->generateAudioSessionId()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 184
    :pswitch_a
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->isMusicActive()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 180
    :pswitch_b
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getMode()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 176
    :pswitch_c
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->setMode(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 172
    :pswitch_d
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->isMicrophoneMute()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 168
    :pswitch_e
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->setMicrophoneMute(Z)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 164
    :pswitch_f
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->isBluetoothScoOn()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 160
    :pswitch_10
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->setBluetoothScoOn(Z)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 156
    :pswitch_11
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->stopBluetoothSco()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 152
    :pswitch_12
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->startBluetoothSco()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 148
    :pswitch_13
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->isBluetoothScoAvailableOffCall()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 144
    :pswitch_14
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getAllowedCapturePolicy()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 140
    :pswitch_15
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->setAllowedCapturePolicy(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 136
    :pswitch_16
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->isSpeakerphoneOn()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 132
    :pswitch_17
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->setSpeakerphoneOn(Z)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 128
    :pswitch_18
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->clearCommunicationDevice()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 124
    :pswitch_19
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getCommunicationDevice()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 120
    :pswitch_1a
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->setCommunicationDevice(Ljava/lang/Integer;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 116
    :pswitch_1b
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getAvailableCommunicationDevices()Ljava/util/List;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 112
    :pswitch_1c
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->isStreamMute(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 108
    :pswitch_1d
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v1, v3, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->setStreamVolume(III)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 104
    :pswitch_1e
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->setRingerMode(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 100
    :pswitch_1f
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v1, v3, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getStreamVolumeDb(III)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 96
    :pswitch_20
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getStreamVolume(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 92
    :pswitch_21
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getStreamMinVolume(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 88
    :pswitch_22
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getStreamMaxVolume(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 84
    :pswitch_23
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->getRingerMode()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 80
    :pswitch_24
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v1, v3, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->adjustSuggestedStreamVolume(III)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 76
    :pswitch_25
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->adjustVolume(II)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto/16 :goto_2

    .line 72
    :pswitch_26
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v1, v3, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->adjustStreamVolume(III)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_2

    .line 68
    :pswitch_27
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->isVolumeFixed()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_2

    .line 64
    :pswitch_28
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->dispatchMediaKeyEvent(Ljava/util/Map;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_2

    .line 60
    :pswitch_29
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->abandonAudioFocus()Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_2

    .line 56
    :pswitch_2a
    sget-object p1, Lcom/ryanheise/audio_session/AndroidAudioManager;->singleton:Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;

    invoke-virtual {p1, v0}, Lcom/ryanheise/audio_session/AndroidAudioManager$Singleton;->requestAudioFocus(Ljava/util/List;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 233
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 234
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Error: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p2, p1, v0, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_2
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x68d7016a -> :sswitch_2a
        -0x653a1759 -> :sswitch_29
        -0x641dbdd3 -> :sswitch_28
        -0x5e4f1038 -> :sswitch_27
        -0x5d286128 -> :sswitch_26
        -0x5adb498e -> :sswitch_25
        -0x59af196f -> :sswitch_24
        -0x543b109b -> :sswitch_23
        -0x4d45b3f0 -> :sswitch_22
        -0x4c9a73e6 -> :sswitch_21
        -0x4759d017 -> :sswitch_20
        -0x410d2cad -> :sswitch_1f
        -0x4054a92e -> :sswitch_1e
        -0x3cb7c6ae -> :sswitch_1d
        -0x3043f9ca -> :sswitch_1c
        -0x2d824707 -> :sswitch_1b
        -0x2963f9ff -> :sswitch_1a
        -0x22a10fed -> :sswitch_19
        -0x1a9241f6 -> :sswitch_18
        -0x16b26e32 -> :sswitch_17
        -0x47d5de7 -> :sswitch_16
        0x9153925 -> :sswitch_15
        0x99879e0 -> :sswitch_14
        0xb21c3b3 -> :sswitch_13
        0x107e1530 -> :sswitch_12
        0x1bf5d05f -> :sswitch_11
        0x252e5a16 -> :sswitch_10
        0x37bcc7ec -> :sswitch_f
        0x38dee389 -> :sswitch_e
        0x3a315283 -> :sswitch_d
        0x40a81b4b -> :sswitch_c
        0x455827c6 -> :sswitch_b
        0x46c7103c -> :sswitch_a
        0x49fcee3f -> :sswitch_9
        0x4afd9d2e -> :sswitch_8
        0x50e69af7 -> :sswitch_7
        0x52277592 -> :sswitch_6
        0x5352a822 -> :sswitch_5
        0x59acfbac -> :sswitch_4
        0x5da380da -> :sswitch_3
        0x764d6925 -> :sswitch_2
        0x766c0cf0 -> :sswitch_1
        0x7ccf63f0 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
