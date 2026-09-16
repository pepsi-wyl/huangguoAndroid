.class public final Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;
.super Ljava/lang/Object;
.source "FlutterVolumeControllerPlugin.kt"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/embedding/engine/plugins/activity/ActivityAware;
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nFlutterVolumeControllerPlugin.kt\nKotlin\n*S Kotlin\n*F\n+ 1 FlutterVolumeControllerPlugin.kt\ncom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,207:1\n1282#2,2:208\n*S KotlinDebug\n*F\n+ 1 FlutterVolumeControllerPlugin.kt\ncom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin\n*L\n204#1:208,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\u0005\u00a2\u0006\u0002\u0010\u0004J\n\u0010\u000f\u001a\u0004\u0018\u00010\u0010H\u0002J\u0010\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0016J\u0010\u0010\u0015\u001a\u00020\u00122\u0006\u0010\u0016\u001a\u00020\u0017H\u0016J\u0008\u0010\u0018\u001a\u00020\u0012H\u0016J\u0008\u0010\u0019\u001a\u00020\u0012H\u0016J\u0010\u0010\u001a\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0017H\u0016J\u0018\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fH\u0016J\u0010\u0010 \u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014H\u0016R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006!"
    }
    d2 = {
        "Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;",
        "Lio/flutter/embedding/engine/plugins/FlutterPlugin;",
        "Lio/flutter/embedding/engine/plugins/activity/ActivityAware;",
        "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;",
        "()V",
        "activity",
        "Landroid/app/Activity;",
        "eventChannel",
        "Lio/flutter/plugin/common/EventChannel;",
        "methodChannel",
        "Lio/flutter/plugin/common/MethodChannel;",
        "volumeController",
        "Lcom/yosemiteyss/flutter_volume_controller/VolumeController;",
        "volumeStreamHandler",
        "Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;",
        "getActivityAudioStream",
        "Lcom/yosemiteyss/flutter_volume_controller/AudioStream;",
        "onAttachedToActivity",
        "",
        "binding",
        "Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;",
        "onAttachedToEngine",
        "flutterPluginBinding",
        "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;",
        "onDetachedFromActivity",
        "onDetachedFromActivityForConfigChanges",
        "onDetachedFromEngine",
        "onMethodCall",
        "call",
        "Lio/flutter/plugin/common/MethodCall;",
        "result",
        "Lio/flutter/plugin/common/MethodChannel$Result;",
        "onReattachedToActivityForConfigChanges",
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
.field private activity:Landroid/app/Activity;

.field private eventChannel:Lio/flutter/plugin/common/EventChannel;

.field private methodChannel:Lio/flutter/plugin/common/MethodChannel;

.field private volumeController:Lcom/yosemiteyss/flutter_volume_controller/VolumeController;

.field private volumeStreamHandler:Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic access$getActivity$p(Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;)Landroid/app/Activity;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method private final getActivityAudioStream()Lcom/yosemiteyss/flutter_volume_controller/AudioStream;
    .locals 6

    .line 204
    invoke-static {}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object v0

    .line 208
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 204
    iget-object v4, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->activity:Landroid/app/Activity;

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->getStreamType()I

    move-result v5

    invoke-virtual {v4}, Landroid/app/Activity;->getVolumeControlStream()I

    move-result v4

    if-ne v5, v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_1
    return-object v3
.end method


# virtual methods
.method public onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 1

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 185
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->activity:Landroid/app/Activity;

    .line 186
    invoke-static {p1}, Lio/flutter/embedding/engine/plugins/lifecycle/FlutterLifecycleAdapter;->getActivityLifecycle(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)Landroidx/lifecycle/Lifecycle;

    move-result-object p1

    .line 187
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->volumeStreamHandler:Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;

    if-nez v0, :cond_0

    const-string v0, "volumeStreamHandler"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    check-cast v0, Landroidx/lifecycle/LifecycleObserver;

    invoke-virtual {p1, v0}, Landroidx/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 5

    const-string v0, "flutterPluginBinding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    .line 31
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v1

    const-string v2, "com.yosemiteyss.flutter_volume_controller/method"

    .line 30
    invoke-direct {v0, v1, v2}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    .line 33
    move-object v1, p0

    check-cast v1, Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 30
    iput-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 36
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    .line 37
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v1

    const-string v2, "com.yosemiteyss.flutter_volume_controller/event"

    .line 36
    invoke-direct {v0, v1, v2}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    .line 39
    new-instance v1, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;

    .line 40
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "getApplicationContext(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    new-instance v4, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin$onAttachedToEngine$2$1;

    invoke-direct {v4, p0}, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin$onAttachedToEngine$2$1;-><init>(Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;)V

    check-cast v4, Lkotlin/jvm/functions/Function1;

    invoke-direct {v1, v2, v4}, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;-><init>(Landroid/content/Context;Lkotlin/jvm/functions/Function1;)V

    iput-object v1, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->volumeStreamHandler:Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;

    .line 45
    check-cast v1, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 36
    iput-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    .line 48
    new-instance v0, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1}, Lcom/yosemiteyss/flutter_volume_controller/ExtensionsKt;->getAudioManager(Landroid/content/Context;)Landroid/media/AudioManager;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;-><init>(Landroid/media/AudioManager;)V

    iput-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->volumeController:Lcom/yosemiteyss/flutter_volume_controller/VolumeController;

    return-void
.end method

.method public onDetachedFromActivity()V
    .locals 1

    const/4 v0, 0x0

    .line 200
    iput-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->activity:Landroid/app/Activity;

    return-void
.end method

.method public onDetachedFromActivityForConfigChanges()V
    .locals 1

    const/4 v0, 0x0

    .line 192
    iput-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->activity:Landroid/app/Activity;

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 180
    iget-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string p1, "methodChannel"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v0

    :cond_0
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 181
    iget-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->eventChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez p1, :cond_1

    const-string p1, "eventChannel"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v0

    :cond_1
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 7

    const-string v0, "call"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "result"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const-string v2, "step"

    const-string v3, "showSystemUI"

    const-string v4, "volumeController"

    const-string v5, "audioStream"

    const/4 v6, 0x0

    sparse-switch v1, :sswitch_data_0

    goto/16 :goto_2

    :sswitch_0
    const-string v1, "setMute"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 121
    :cond_0
    :try_start_0
    const-string v0, "isMuted"

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 122
    invoke-virtual {p1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 123
    invoke-virtual {p1, v5}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    .line 125
    iget-object v2, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->volumeController:Lcom/yosemiteyss/flutter_volume_controller/VolumeController;

    if-nez v2, :cond_1

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v6

    .line 126
    :cond_1
    invoke-static {}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object v3

    aget-object p1, v3, p1

    .line 125
    invoke-virtual {v2, v0, v1, p1}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->setMute(ZZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V

    .line 128
    invoke-interface {p2, v6}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_3

    :catch_0
    move-exception p1

    .line 130
    const-string v0, "Failed to set mute"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v1, "1006"

    invoke-interface {p2, v1, v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 52
    :sswitch_1
    const-string v1, "getVolume"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_2

    .line 55
    :cond_2
    :try_start_1
    invoke-virtual {p1, v5}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    .line 56
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->volumeController:Lcom/yosemiteyss/flutter_volume_controller/VolumeController;

    if-nez v0, :cond_3

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    move-object v6, v0

    :goto_0
    invoke-static {}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object v0

    aget-object p1, v0, p1

    invoke-virtual {v6, p1}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->getVolume(Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)D

    move-result-wide v0

    .line 57
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_3

    :catch_1
    move-exception p1

    .line 59
    const-string v0, "Failed to get volume"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v1, "1000"

    invoke-interface {p2, v1, v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 52
    :sswitch_2
    const-string v1, "setAndroidAudioStream"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto/16 :goto_2

    .line 148
    :cond_4
    :try_start_2
    invoke-virtual {p1, v5}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    .line 149
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->volumeStreamHandler:Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;

    if-nez v0, :cond_5

    const-string v0, "volumeStreamHandler"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v6

    :cond_5
    invoke-static {}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object v1

    aget-object p1, v1, p1

    invoke-virtual {v0, p1}, Lcom/yosemiteyss/flutter_volume_controller/VolumeStreamHandler;->setActivityAudioStream(Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)V

    .line 150
    invoke-interface {p2, v6}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_3

    :catch_2
    move-exception p1

    .line 154
    const-string v0, "Failed to set audio stream"

    .line 155
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    .line 152
    const-string v1, "1008"

    invoke-interface {p2, v1, v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 52
    :sswitch_3
    const-string v1, "setVolume"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto/16 :goto_2

    .line 65
    :cond_6
    :try_start_3
    const-string v0, "volume"

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 66
    invoke-virtual {p1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 67
    invoke-virtual {p1, v5}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    .line 69
    iget-object v3, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->volumeController:Lcom/yosemiteyss/flutter_volume_controller/VolumeController;

    if-nez v3, :cond_7

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v3, v6

    .line 70
    :cond_7
    invoke-static {}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object v4

    aget-object p1, v4, p1

    .line 69
    invoke-virtual {v3, v0, v1, v2, p1}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->setVolume(DZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V

    .line 72
    invoke-interface {p2, v6}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_3

    :catch_3
    move-exception p1

    .line 74
    const-string v0, "Failed to set volume"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v1, "1001"

    invoke-interface {p2, v1, v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 52
    :sswitch_4
    const-string v1, "getMute"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto/16 :goto_2

    .line 110
    :cond_8
    :try_start_4
    invoke-virtual {p1, v5}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    .line 112
    iget-object v0, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->volumeController:Lcom/yosemiteyss/flutter_volume_controller/VolumeController;

    if-nez v0, :cond_9

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_9
    move-object v6, v0

    :goto_1
    invoke-static {}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object v0

    aget-object p1, v0, p1

    invoke-virtual {v6, p1}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->getMute(Lcom/yosemiteyss/flutter_volume_controller/AudioStream;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    .line 111
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto/16 :goto_3

    :catch_4
    move-exception p1

    .line 115
    const-string v0, "Failed to get mute"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v1, "1005"

    invoke-interface {p2, v1, v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 52
    :sswitch_5
    const-string v1, "raiseVolume"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    goto/16 :goto_2

    .line 80
    :cond_a
    :try_start_5
    invoke-virtual {p1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    .line 81
    invoke-virtual {p1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 82
    invoke-virtual {p1, v5}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    .line 84
    iget-object v2, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->volumeController:Lcom/yosemiteyss/flutter_volume_controller/VolumeController;

    if-nez v2, :cond_b

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v6

    .line 85
    :cond_b
    invoke-static {}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object v3

    aget-object p1, v3, p1

    .line 84
    invoke-virtual {v2, v0, v1, p1}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->raiseVolume(Ljava/lang/Double;ZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V

    .line 87
    invoke-interface {p2, v6}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto/16 :goto_3

    :catch_5
    move-exception p1

    .line 89
    const-string v0, "Failed to raise volume"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v1, "1002"

    invoke-interface {p2, v1, v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 52
    :sswitch_6
    const-string v1, "toggleMute"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    goto/16 :goto_2

    .line 136
    :cond_c
    :try_start_6
    invoke-virtual {p1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 137
    invoke-virtual {p1, v5}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    .line 139
    iget-object v1, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->volumeController:Lcom/yosemiteyss/flutter_volume_controller/VolumeController;

    if-nez v1, :cond_d

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v6

    :cond_d
    invoke-static {}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object v2

    aget-object p1, v2, p1

    invoke-virtual {v1, v0, p1}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->toggleMute(ZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V

    .line 140
    invoke-interface {p2, v6}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    goto/16 :goto_3

    :catch_6
    move-exception p1

    .line 142
    const-string v0, "Failed to toggle mute"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v1, "1007"

    invoke-interface {p2, v1, v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 52
    :sswitch_7
    const-string v1, "lowerVolume"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    goto :goto_2

    .line 95
    :cond_e
    :try_start_7
    invoke-virtual {p1, v2}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    .line 96
    invoke-virtual {p1, v3}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 97
    invoke-virtual {p1, v5}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    .line 99
    iget-object v2, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->volumeController:Lcom/yosemiteyss/flutter_volume_controller/VolumeController;

    if-nez v2, :cond_f

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v2, v6

    .line 100
    :cond_f
    invoke-static {}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object v3

    aget-object p1, v3, p1

    .line 99
    invoke-virtual {v2, v0, v1, p1}, Lcom/yosemiteyss/flutter_volume_controller/VolumeController;->lowerVolume(Ljava/lang/Double;ZLcom/yosemiteyss/flutter_volume_controller/AudioStream;)V

    .line 102
    invoke-interface {p2, v6}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_3

    :catch_7
    move-exception p1

    .line 104
    const-string v0, "Failed to lower volume"

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v1, "1003"

    invoke-interface {p2, v1, v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    .line 52
    :sswitch_8
    const-string p1, "getAndroidAudioStream"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_10

    goto :goto_2

    .line 162
    :cond_10
    :try_start_8
    invoke-direct {p0}, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->getActivityAudioStream()Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object p1

    if-eqz p1, :cond_11

    .line 163
    invoke-virtual {p1}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->ordinal()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    :cond_11
    invoke-interface {p2, v6}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_8

    goto :goto_3

    :catch_8
    move-exception p1

    .line 167
    const-string v0, "Failed to get audio stream"

    .line 168
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    .line 165
    const-string v1, "1010"

    invoke-interface {p2, v1, v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    .line 174
    :cond_12
    :goto_2
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    :goto_3
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x659c1903 -> :sswitch_8
        -0x34700685 -> :sswitch_7
        -0x32d24873 -> :sswitch_6
        -0x3036a5da -> :sswitch_5
        -0x47d4571 -> :sswitch_4
        0x27f73e1c -> :sswitch_3
        0x318f6909 -> :sswitch_2
        0x34c20a10 -> :sswitch_1
        0x764d819b -> :sswitch_0
    .end sparse-switch
.end method

.method public onReattachedToActivityForConfigChanges(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 1

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 196
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lcom/yosemiteyss/flutter_volume_controller/FlutterVolumeControllerPlugin;->activity:Landroid/app/Activity;

    return-void
.end method
