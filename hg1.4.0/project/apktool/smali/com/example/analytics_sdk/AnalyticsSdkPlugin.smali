.class public final Lcom/example/analytics_sdk/AnalyticsSdkPlugin;
.super Ljava/lang/Object;
.source "AnalyticsSdkPlugin.kt"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;
.implements Lio/flutter/plugin/common/EventChannel$StreamHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/example/analytics_sdk/AnalyticsSdkPlugin$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAnalyticsSdkPlugin.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AnalyticsSdkPlugin.kt\ncom/example/analytics_sdk/AnalyticsSdkPlugin\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,532:1\n1747#2,3:533\n1#3:536\n*S KotlinDebug\n*F\n+ 1 AnalyticsSdkPlugin.kt\ncom/example/analytics_sdk/AnalyticsSdkPlugin\n*L\n520#1:533,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u0000 E2\u00020\u00012\u00020\u00022\u00020\u0003:\u0001EB\u0005\u00a2\u0006\u0002\u0010\u0004J\u0014\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0016H\u0002J(\u0010\u0018\u001a\u00020\u00192\u001e\u0010\u001a\u001a\u001a\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012\u0012\u0004\u0012\u00020\u00190\u001bH\u0002J\u0010\u0010\u001c\u001a\u00020\u00192\u0006\u0010\u001d\u001a\u00020\u001eH\u0002J\u0014\u0010\u001f\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0008\u0010 \u001a\u00020\u0013H\u0002J(\u0010!\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u00122\u0012\u0010\"\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0008\u0010#\u001a\u00020\u0013H\u0002J\u0014\u0010$\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0008\u0010%\u001a\u00020&H\u0002J\u0012\u0010\'\u001a\u00020\u00132\u0008\u0010(\u001a\u0004\u0018\u00010\u0013H\u0002J\u0008\u0010)\u001a\u00020\u0013H\u0002J\u0008\u0010*\u001a\u00020+H\u0002J\u0014\u0010,\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0010\u0010-\u001a\u00020\u00192\u0006\u0010.\u001a\u00020/H\u0016J\u0012\u00100\u001a\u00020\u00192\u0008\u00101\u001a\u0004\u0018\u00010\u0014H\u0016J\u0010\u00102\u001a\u00020\u00192\u0006\u00103\u001a\u00020/H\u0016J\u001c\u00104\u001a\u00020\u00192\u0008\u00101\u001a\u0004\u0018\u00010\u00142\u0008\u00105\u001a\u0004\u0018\u00010\u000eH\u0016J\u0018\u00106\u001a\u00020\u00192\u0006\u00107\u001a\u0002082\u0006\u0010\u001d\u001a\u00020\u001eH\u0016J\u0008\u00109\u001a\u00020\u0019H\u0002J\u0008\u0010:\u001a\u00020\u0013H\u0002J\u0010\u0010;\u001a\u00020\u00132\u0006\u0010<\u001a\u00020=H\u0002J\u0008\u0010>\u001a\u00020&H\u0002J\u0014\u0010?\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0012\u0010@\u001a\u00020\u00192\u0008\u00105\u001a\u0004\u0018\u00010\u000eH\u0002J\u0008\u0010A\u001a\u00020\u0019H\u0002J\u0014\u0010B\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0014\u0010C\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00140\u0012H\u0002J\u0012\u0010D\u001a\u00020\u00132\u0008\u0010(\u001a\u0004\u0018\u00010\u0013H\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006F"
    }
    d2 = {
        "Lcom/example/analytics_sdk/AnalyticsSdkPlugin;",
        "Lio/flutter/embedding/engine/plugins/FlutterPlugin;",
        "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;",
        "Lio/flutter/plugin/common/EventChannel$StreamHandler;",
        "()V",
        "channel",
        "Lio/flutter/plugin/common/MethodChannel;",
        "context",
        "Landroid/content/Context;",
        "mainHandler",
        "Landroid/os/Handler;",
        "proximityChannel",
        "Lio/flutter/plugin/common/EventChannel;",
        "proximityEventSink",
        "Lio/flutter/plugin/common/EventChannel$EventSink;",
        "proximityListener",
        "Landroid/hardware/SensorEventListener;",
        "androidIdFields",
        "",
        "",
        "",
        "bytesToGb",
        "",
        "bytes",
        "collectAdvertisingIdFields",
        "",
        "onReady",
        "Lkotlin/Function1;",
        "collectSdkInitPlatformFields",
        "result",
        "Lio/flutter/plugin/common/MethodChannel$Result;",
        "debugStateFields",
        "deviceId",
        "getSdkInitPlatformFields",
        "advertisingIdFields",
        "guid",
        "hardwareCapabilityFields",
        "hasBaseband",
        "",
        "hashIdentifier",
        "value",
        "installSource",
        "isRooted",
        "",
        "networkStateFields",
        "onAttachedToEngine",
        "flutterPluginBinding",
        "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;",
        "onCancel",
        "arguments",
        "onDetachedFromEngine",
        "binding",
        "onListen",
        "events",
        "onMethodCall",
        "call",
        "Lio/flutter/plugin/common/MethodCall;",
        "registerDeviceIdentifier",
        "resolveClientIdRaw",
        "resolveNetworkType",
        "manager",
        "Landroid/telephony/TelephonyManager;",
        "rootedState",
        "sensorFields",
        "startProximityEvents",
        "stopProximityEvents",
        "storageFields",
        "telephonyFields",
        "unknownIfBlank",
        "Companion",
        "analytics_sdk_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final Companion:Lcom/example/analytics_sdk/AnalyticsSdkPlugin$Companion;

.field private static final LOG_CHUNK_SIZE:I = 0x3e8

.field private static final LOG_TAG:Ljava/lang/String; = "AnalyticsSdk"

.field private static final NETWORK_TYPE_LTE_CA:I = 0x13


# instance fields
.field private channel:Lio/flutter/plugin/common/MethodChannel;

.field private context:Landroid/content/Context;

.field private final mainHandler:Landroid/os/Handler;

.field private proximityChannel:Lio/flutter/plugin/common/EventChannel;

.field private proximityEventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

.field private proximityListener:Landroid/hardware/SensorEventListener;


# direct methods
.method public static synthetic $r8$lambda$Z5v7X7gEoZvq-6TastyOCc2A3yc(Lkotlin/jvm/functions/Function1;Ljava/util/Map;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->collectAdvertisingIdFields$finishAaid$lambda$2$lambda$1(Lkotlin/jvm/functions/Function1;Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic $r8$lambda$qc0wUv7_glI0dyZaMrnUKUW1g80(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->collectAdvertisingIdFields$lambda$3(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->Companion:Lcom/example/analytics_sdk/AnalyticsSdkPlugin$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->mainHandler:Landroid/os/Handler;

    return-void
.end method

.method public static final synthetic access$collectAdvertisingIdFields$finishAaid(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;Ljava/lang/String;)V
    .locals 0

    .line 33
    invoke-static/range {p0 .. p5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->collectAdvertisingIdFields$finishAaid(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;Ljava/lang/String;)V

    return-void
.end method

.method public static final synthetic access$getContext$p(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)Landroid/content/Context;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    return-object p0
.end method

.method public static final synthetic access$getMainHandler$p(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)Landroid/os/Handler;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->mainHandler:Landroid/os/Handler;

    return-object p0
.end method

.method public static final synthetic access$getProximityEventSink$p(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)Lio/flutter/plugin/common/EventChannel$EventSink;
    .locals 0

    .line 33
    iget-object p0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->proximityEventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-object p0
.end method

.method public static final synthetic access$getSdkInitPlatformFields(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Ljava/util/Map;)Ljava/util/Map;
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->getSdkInitPlatformFields(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method private final androidIdFields()Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 263
    const-string v0, "android_id_status"

    const-string v1, "android_id_o"

    const-string v2, "android_id"

    const-string v3, ""

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x3

    .line 265
    :try_start_0
    iget-object v8, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    const/4 v9, 0x0

    if-nez v8, :cond_0

    const-string v8, "context"

    invoke-static {v8}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v8, v9

    :cond_0
    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    .line 264
    invoke-static {v8, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_1

    check-cast v8, Ljava/lang/CharSequence;

    invoke-static {v8}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    :cond_1
    if-nez v9, :cond_2

    move-object v9, v3

    .line 268
    :cond_2
    move-object v8, v9

    check-cast v8, Ljava/lang/CharSequence;

    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-lez v8, :cond_3

    .line 270
    new-array v8, v7, [Lkotlin/Pair;

    invoke-direct {p0, v9}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->hashIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v2, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v10

    aput-object v10, v8, v6

    .line 271
    invoke-static {v1, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v9

    aput-object v9, v8, v5

    .line 272
    const-string v9, "available"

    invoke-static {v0, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v9

    aput-object v9, v8, v4

    .line 269
    invoke-static {v8}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0

    .line 276
    :cond_3
    new-array v8, v7, [Lkotlin/Pair;

    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v9

    aput-object v9, v8, v6

    .line 277
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v9

    aput-object v9, v8, v5

    .line 278
    const-string v9, "unavailable"

    invoke-static {v0, v9}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v9

    aput-object v9, v8, v4

    .line 275
    invoke-static {v8}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 283
    :catchall_0
    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    .line 284
    invoke-static {v1, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    .line 285
    const-string v3, "unknown"

    invoke-static {v0, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    new-array v3, v7, [Lkotlin/Pair;

    aput-object v2, v3, v6

    aput-object v1, v3, v5

    aput-object v0, v3, v4

    .line 282
    invoke-static {v3}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private final bytesToGb(J)J
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_0

    const-wide/16 p1, -0x1

    return-wide p1

    :cond_0
    const-wide/32 v0, 0x40000000

    .line 524
    div-long/2addr p1, v0

    return-wide p1
.end method

.method private final collectAdvertisingIdFields(Lkotlin/jvm/functions/Function1;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 291
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->resolveClientIdRaw()Ljava/lang/String;

    move-result-object v0

    .line 292
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->guid()Ljava/lang/String;

    move-result-object v1

    .line 294
    const-string v2, "oaid"

    invoke-direct {p0, v0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->hashIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    .line 295
    const-string v3, "oaid_o"

    invoke-static {v3, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    .line 296
    const-string v3, "aaid"

    const-string v4, ""

    invoke-static {v3, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v3

    .line 297
    const-string v5, "aaid_o"

    invoke-static {v5, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v4

    .line 298
    const-string v5, "guid"

    invoke-direct {p0, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->hashIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v5

    .line 299
    const-string v6, "guid_o"

    invoke-static {v6, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v6, 0x6

    new-array v6, v6, [Lkotlin/Pair;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    const/4 v2, 0x1

    aput-object v0, v6, v2

    const/4 v0, 0x2

    aput-object v3, v6, v0

    const/4 v0, 0x3

    aput-object v4, v6, v0

    const/4 v0, 0x4

    aput-object v5, v6, v0

    const/4 v0, 0x5

    aput-object v1, v6, v0

    .line 293
    invoke-static {v6}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    .line 301
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 302
    new-instance v2, Lkotlin/jvm/internal/Ref$BooleanRef;

    invoke-direct {v2}, Lkotlin/jvm/internal/Ref$BooleanRef;-><init>()V

    .line 319
    iget-object v3, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->mainHandler:Landroid/os/Handler;

    new-instance v4, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticLambda4;

    move-object v7, v4

    move-object v8, v1

    move-object v9, v2

    move-object v10, v0

    move-object v11, p0

    move-object v12, p1

    invoke-direct/range {v7 .. v12}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticLambda4;-><init>(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;)V

    const-wide/16 v5, 0x5dc

    invoke-virtual {v3, v4, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 324
    :try_start_0
    iget-object v3, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v3, :cond_0

    const-string v3, "context"

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v3, 0x0

    :cond_0
    new-instance v4, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;

    move-object v7, v4

    move-object v8, v1

    move-object v9, v2

    move-object v10, v0

    move-object v11, p0

    move-object v12, p1

    invoke-direct/range {v7 .. v12}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;-><init>(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;)V

    check-cast v4, Lcom/github/gzuliyujiang/oaid/IGetter;

    invoke-static {v3, v4}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getByGms(Landroid/content/Context;Lcom/github/gzuliyujiang/oaid/IGetter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 334
    :catchall_0
    const-string v12, ""

    move-object v7, v1

    move-object v8, v2

    move-object v9, v0

    move-object v10, p0

    move-object v11, p1

    invoke-static/range {v7 .. v12}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->collectAdvertisingIdFields$finishAaid(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private static final collectAdvertisingIdFields$finishAaid(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/jvm/internal/Ref$BooleanRef;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/example/analytics_sdk/AnalyticsSdkPlugin;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;",
            "Lkotlin/Unit;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    .line 305
    check-cast p5, Ljava/lang/CharSequence;

    invoke-static {p5}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p5

    goto :goto_0

    :cond_0
    move-object p5, v0

    :goto_0
    if-nez p5, :cond_1

    const-string p5, ""

    .line 306
    :cond_1
    monitor-enter p0

    .line 307
    :try_start_0
    iget-boolean v1, p1, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v0, 0x1

    .line 310
    iput-boolean v0, p1, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 311
    const-string p1, "aaid"

    invoke-direct {p3, p5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->hashIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    const-string p1, "aaid_o"

    invoke-interface {p2, p1, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    invoke-static {p2}, Lkotlin/collections/MapsKt;->toMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 306
    :goto_1
    monitor-exit p0

    if-eqz v0, :cond_3

    .line 316
    iget-object p0, p3, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->mainHandler:Landroid/os/Handler;

    new-instance p1, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticLambda3;

    invoke-direct {p1, p4, v0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticLambda3;-><init>(Lkotlin/jvm/functions/Function1;Ljava/util/Map;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_3
    return-void

    :catchall_0
    move-exception p1

    .line 306
    monitor-exit p0

    throw p1
.end method

.method private static final collectAdvertisingIdFields$finishAaid$lambda$2$lambda$1(Lkotlin/jvm/functions/Function1;Ljava/util/Map;)V
    .locals 1

    const-string v0, "$onReady"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 316
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static final collectAdvertisingIdFields$lambda$3(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;)V
    .locals 7

    const-string v0, "$lock"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$completed"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$fields"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "this$0"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$onReady"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 320
    const-string v6, ""

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-static/range {v1 .. v6}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->collectAdvertisingIdFields$finishAaid(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;Ljava/lang/String;)V

    return-void
.end method

.method private final collectSdkInitPlatformFields(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    .line 91
    new-instance v0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectSdkInitPlatformFields$1;

    invoke-direct {v0, p1, p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectSdkInitPlatformFields$1;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-direct {p0, v0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->collectAdvertisingIdFields(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method private final debugStateFields()Ljava/util/Map;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 376
    const-string v0, "context"

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "developer_options_enabled"

    invoke-static {v2, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v3

    .line 377
    const-string v4, "adb_enabled"

    invoke-static {v4, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v5

    .line 378
    const-string v6, "usb_debug_enabled"

    invoke-static {v6, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v7, 0x3

    new-array v7, v7, [Lkotlin/Pair;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    const/4 v3, 0x1

    aput-object v5, v7, v3

    const/4 v5, 0x2

    aput-object v1, v7, v5

    .line 375
    invoke-static {v7}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v1

    const/4 v5, 0x0

    .line 382
    :try_start_0
    iget-object v7, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v7, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v7, v5

    :cond_0
    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    .line 383
    const-string v9, "development_settings_enabled"

    .line 381
    invoke-static {v7, v9, v8}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    if-ne v7, v3, :cond_1

    const/4 v7, 0x1

    goto :goto_0

    :cond_1
    const/4 v7, 0x0

    .line 386
    :goto_0
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 391
    :catchall_0
    :try_start_1
    iget-object v2, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v2, :cond_2

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    move-object v5, v2

    :goto_1
    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 390
    invoke-static {v0, v4, v8}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v3, :cond_3

    const/4 v8, 0x1

    .line 395
    :cond_3
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 396
    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 397
    invoke-interface {v1, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    return-object v1
.end method

.method private final deviceId()Ljava/lang/String;
    .locals 1

    .line 357
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->resolveClientIdRaw()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->hashIdentifier(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final getSdkInitPlatformFields(Ljava/util/Map;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 99
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    .line 101
    iget-object v1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v1, :cond_0

    const-string v1, "context"

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_0
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getPackageName(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "package_name"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    const-string v2, "getID(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "timezone"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->unknownIfBlank(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "brand"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->unknownIfBlank(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "manufacturer"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->unknownIfBlank(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "model"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v1, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    const-string v2, "SUPPORTED_ABIS"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, [Ljava/lang/Object;

    invoke-static {v1}, Lkotlin/collections/ArraysKt;->firstOrNull([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->unknownIfBlank(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "abi"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v1, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->unknownIfBlank(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "build_hardware"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->unknownIfBlank(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "build_product"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v1, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->unknownIfBlank(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "build_fingerprint"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->telephonyFields()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 112
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->hardwareCapabilityFields()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 113
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->storageFields()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 114
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->networkStateFields()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 115
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->androidIdFields()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 116
    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 117
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->debugStateFields()Ljava/util/Map;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 118
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->sensorFields()Ljava/util/Map;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 120
    const-string p1, "install_source"

    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->installSource()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->rootedState()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v1, "is_rooted"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->hasBaseband()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v1, "has_baseband"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private final guid()Ljava/lang/String;
    .locals 3

    .line 339
    const-string v0, ""

    .line 340
    :try_start_0
    iget-object v1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const-string v1, "context"

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v2

    :cond_0
    invoke-static {v1}, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->getGUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    move-object v0, v2

    :catchall_0
    :goto_0
    return-object v0
.end method

.method private final hardwareCapabilityFields()Ljava/util/Map;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 129
    const-string v0, "context"

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "cpu_cores"

    invoke-static {v2, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v3

    .line 130
    const-string v4, "device_memory_gb"

    invoke-static {v4, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v5

    .line 131
    const-string v6, "touch_support"

    invoke-static {v6, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v7

    .line 132
    const-string v8, "max_touch_points"

    invoke-static {v8, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v9, 0x4

    new-array v9, v9, [Lkotlin/Pair;

    const/4 v10, 0x0

    aput-object v3, v9, v10

    const/4 v3, 0x1

    aput-object v5, v9, v3

    const/4 v5, 0x2

    aput-object v7, v9, v5

    const/4 v7, 0x3

    aput-object v1, v9, v7

    .line 128
    invoke-static {v9}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v1

    .line 136
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v7

    invoke-static {v7, v3}, Lkotlin/ranges/RangesKt;->coerceAtLeast(II)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    const/4 v2, 0x0

    .line 141
    :try_start_1
    iget-object v7, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v7, :cond_0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v7, v2

    :cond_0
    const-string v9, "activity"

    invoke-virtual {v7, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    instance-of v9, v7, Landroid/app/ActivityManager;

    if-eqz v9, :cond_1

    check-cast v7, Landroid/app/ActivityManager;

    goto :goto_0

    :cond_1
    move-object v7, v2

    :goto_0
    if-eqz v7, :cond_2

    .line 143
    new-instance v9, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v9}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 144
    invoke-virtual {v7, v9}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 145
    iget-wide v11, v9, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    invoke-direct {p0, v11, v12}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->bytesToGb(J)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v1, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 151
    :catchall_1
    :cond_2
    :try_start_2
    iget-object v4, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v4, :cond_3

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    move-object v2, v4

    :goto_1
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 152
    const-string v2, "android.hardware.touchscreen"

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    .line 153
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    const-string v4, "android.hardware.touchscreen.multitouch.jazzhand"

    .line 155
    invoke-virtual {v0, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v10, 0x5

    goto :goto_3

    .line 159
    :cond_4
    const-string v4, "android.hardware.touchscreen.multitouch.distinct"

    .line 158
    invoke-virtual {v0, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    :goto_2
    const/4 v10, 0x2

    goto :goto_3

    .line 161
    :cond_5
    const-string v4, "android.hardware.touchscreen.multitouch"

    invoke-virtual {v0, v4}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_2

    :cond_6
    if-eqz v2, :cond_7

    const/4 v10, 0x1

    .line 163
    :cond_7
    :goto_3
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :catchall_2
    return-object v1
.end method

.method private final hasBaseband()I
    .locals 4

    const/4 v0, -0x1

    .line 491
    :try_start_0
    invoke-static {}, Landroid/os/Build;->getRadioVersion()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_1

    const-string v1, ""

    .line 492
    :cond_1
    move-object v2, v1

    check-cast v2, Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-nez v2, :cond_2

    goto :goto_1

    :cond_2
    const-string v2, "unknown"

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v0, 0x1

    :catchall_0
    :goto_1
    return v0
.end method

.method private final hashIdentifier(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-eqz p1, :cond_0

    .line 361
    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p1}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const-string v0, ""

    if-nez p1, :cond_1

    move-object p1, v0

    .line 362
    :cond_1
    move-object v1, p1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_2

    return-object v0

    .line 363
    :cond_2
    const-string v0, "MD5"

    invoke-static {p1, v0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->calculateHash(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "calculateHash(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p1
.end method

.method private final installSource()Ljava/lang/String;
    .locals 5

    .line 476
    const-string v0, ""

    .line 477
    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v2, 0x1e

    const/4 v3, 0x0

    const-string v4, "context"

    if-lt v1, v2, :cond_2

    .line 478
    :try_start_1
    iget-object v1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v1, :cond_0

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v3

    :cond_0
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v2, :cond_1

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v3, v2

    :goto_0
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/content/pm/PackageManager;Ljava/lang/String;)Landroid/content/pm/InstallSourceInfo;

    move-result-object v1

    .line 479
    invoke-static {v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/content/pm/InstallSourceInfo;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_5

    goto :goto_2

    .line 482
    :cond_2
    iget-object v1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v1, :cond_3

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v3

    :cond_3
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v2, :cond_4

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    move-object v3, v2

    :goto_1
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_5

    goto :goto_2

    :cond_5
    move-object v0, v1

    :catchall_0
    :goto_2
    return-object v0
.end method

.method private final isRooted()Z
    .locals 14

    .line 507
    sget-object v0, Landroid/os/Build;->TAGS:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    .line 508
    :cond_0
    check-cast v0, Ljava/lang/CharSequence;

    const-string v1, "test-keys"

    check-cast v1, Ljava/lang/CharSequence;

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v0, v1, v4, v2, v3}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    return v1

    .line 517
    :cond_1
    const-string v12, "/system/bin/failsafe/su"

    .line 518
    const-string v13, "/data/local/su"

    const-string v5, "/system/app/Superuser.apk"

    const-string v6, "/sbin/su"

    const-string v7, "/system/bin/su"

    const-string v8, "/system/xbin/su"

    const-string v9, "/data/local/xbin/su"

    const-string v10, "/data/local/bin/su"

    const-string v11, "/system/sd/xbin/su"

    filled-new-array/range {v5 .. v13}, [Ljava/lang/String;

    move-result-object v0

    .line 509
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 520
    check-cast v0, Ljava/lang/Iterable;

    .line 533
    instance-of v2, v0, Ljava/util/Collection;

    if-eqz v2, :cond_2

    move-object v2, v0

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    .line 534
    :cond_2
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 520
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v4, 0x1

    :cond_4
    :goto_0
    return v4
.end method

.method private final networkStateFields()Ljava/util/Map;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const/4 v0, -0x1

    .line 243
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "vpn_enabled"

    invoke-static {v1, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    .line 244
    const-string v3, "proxy_enabled"

    invoke-static {v3, v0}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    const/4 v4, 0x2

    new-array v4, v4, [Lkotlin/Pair;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v2, 0x1

    aput-object v0, v4, v2

    .line 242
    invoke-static {v4}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    const/4 v4, 0x0

    .line 247
    :try_start_0
    iget-object v6, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v6, :cond_0

    const-string v6, "context"

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v6, v4

    :cond_0
    const-string v7, "connectivity"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    instance-of v7, v6, Landroid/net/ConnectivityManager;

    if-eqz v7, :cond_1

    check-cast v6, Landroid/net/ConnectivityManager;

    goto :goto_0

    :cond_1
    move-object v6, v4

    :goto_0
    if-eqz v6, :cond_2

    .line 248
    invoke-static {v6}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/net/ConnectivityManager;)Landroid/net/Network;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v6

    goto :goto_1

    :cond_2
    move-object v6, v4

    :goto_1
    if-nez v6, :cond_3

    return-object v0

    :cond_3
    const/4 v7, 0x4

    .line 251
    invoke-virtual {v6, v7}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 255
    :catchall_0
    :try_start_1
    const-string v1, "http.proxyHost"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_4
    if-nez v4, :cond_5

    const-string v4, ""

    .line 256
    :cond_5
    check-cast v4, Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_6

    const/4 v5, 0x1

    :cond_6
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    return-object v0
.end method

.method private final registerDeviceIdentifier()V
    .locals 3

    .line 367
    iget-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "context"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    instance-of v2, v0, Landroid/app/Application;

    if-eqz v2, :cond_1

    move-object v1, v0

    check-cast v1, Landroid/app/Application;

    :cond_1
    if-nez v1, :cond_2

    return-void

    .line 370
    :cond_2
    :try_start_0
    invoke-static {v1}, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->register(Landroid/app/Application;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-void
.end method

.method private final resolveClientIdRaw()Ljava/lang/String;
    .locals 4

    .line 348
    sget-object v0, Lcom/example/analytics_sdk/ClientIdentifierResolver;->INSTANCE:Lcom/example/analytics_sdk/ClientIdentifierResolver;

    const/4 v1, 0x4

    .line 349
    new-array v1, v1, [Lkotlin/jvm/functions/Function0;

    .line 348
    new-instance v2, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$1;

    invoke-direct {v2, p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$1;-><init>(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$2;

    invoke-direct {v2, p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$2;-><init>(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$3;

    invoke-direct {v2, p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$3;-><init>(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v2, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$4;

    invoke-direct {v2, p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$4;-><init>(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)V

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/example/analytics_sdk/ClientIdentifierResolver;->resolve([Lkotlin/jvm/functions/Function0;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final resolveNetworkType(Landroid/telephony/TelephonyManager;)Ljava/lang/String;
    .locals 1

    .line 198
    const-string v0, "unknown"

    .line 199
    :try_start_0
    invoke-virtual {p1}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    .line 221
    :pswitch_1
    const-string p1, "cellular_5g"

    goto :goto_0

    .line 220
    :pswitch_2
    const-string p1, "cellular_4g"

    goto :goto_0

    .line 216
    :pswitch_3
    const-string p1, "cellular_3g"

    goto :goto_0

    .line 205
    :pswitch_4
    const-string p1, "cellular_2g"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    move-object v0, p1

    :catchall_0
    :goto_1
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private final rootedState()I
    .locals 1

    .line 500
    :try_start_0
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->isRooted()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method private final sensorFields()Ljava/util/Map;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const/4 v0, -0x1

    .line 405
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "sensor_count_supported"

    invoke-static {v2, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v3

    .line 406
    const-string v4, "has_accelerometer"

    invoke-static {v4, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v5

    .line 407
    const-string v6, "has_gyroscope"

    invoke-static {v6, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v7

    .line 408
    const-string v8, "has_magnetometer"

    invoke-static {v8, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v9

    .line 409
    const-string v10, "has_light_sensor"

    invoke-static {v10, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v11

    .line 410
    const-string v12, "has_proximity_sensor"

    invoke-static {v12, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v13, 0x6

    new-array v13, v13, [Lkotlin/Pair;

    const/4 v14, 0x0

    aput-object v3, v13, v14

    const/4 v3, 0x1

    aput-object v5, v13, v3

    const/4 v5, 0x2

    aput-object v7, v13, v5

    const/4 v7, 0x3

    aput-object v9, v13, v7

    const/4 v7, 0x4

    aput-object v11, v13, v7

    const/4 v9, 0x5

    aput-object v1, v13, v9

    .line 404
    invoke-static {v13}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v1

    move-object/from16 v11, p0

    .line 413
    :try_start_0
    iget-object v13, v11, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    const/4 v15, 0x0

    if-nez v13, :cond_0

    const-string v13, "context"

    invoke-static {v13}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v13, v15

    :cond_0
    const-string v14, "sensor"

    invoke-virtual {v13, v14}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    instance-of v14, v13, Landroid/hardware/SensorManager;

    if-eqz v14, :cond_1

    move-object v15, v13

    check-cast v15, Landroid/hardware/SensorManager;

    :cond_1
    if-nez v15, :cond_2

    return-object v1

    .line 415
    :cond_2
    invoke-virtual {v15, v0}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    invoke-virtual {v15, v3}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 419
    invoke-virtual {v15, v7}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    goto :goto_1

    :cond_4
    const/4 v0, 0x0

    :goto_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    invoke-virtual {v15, v5}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_5

    const/4 v0, 0x1

    goto :goto_2

    :cond_5
    const/4 v0, 0x0

    :goto_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    invoke-virtual {v15, v9}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_3

    :cond_6
    const/4 v0, 0x0

    :goto_3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v10, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v0, 0x8

    .line 425
    invoke-virtual {v15, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_7

    const/4 v14, 0x1

    goto :goto_4

    :cond_7
    const/4 v14, 0x0

    :goto_4
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v12, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    return-object v1
.end method

.method private final startProximityEvents(Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 5

    const/4 v0, 0x0

    .line 433
    :try_start_0
    iget-object v1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v1, :cond_0

    const-string v1, "context"

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v0

    :cond_0
    const-string v2, "sensor"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/hardware/SensorManager;

    if-eqz v2, :cond_1

    check-cast v1, Landroid/hardware/SensorManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_1
    move-object v1, v0

    .line 434
    :goto_0
    const-string v2, "proximity_unavailable"

    if-nez v1, :cond_3

    if-eqz p1, :cond_2

    .line 435
    :try_start_1
    const-string v1, "SensorManager unavailable"

    invoke-interface {p1, v2, v1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    return-void

    :cond_3
    const/16 v3, 0x8

    .line 438
    invoke-virtual {v1, v3}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v3

    if-nez v3, :cond_5

    if-eqz p1, :cond_4

    .line 440
    const-string v1, "Proximity sensor unavailable"

    invoke-interface {p1, v2, v1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_4
    return-void

    .line 443
    :cond_5
    new-instance v2, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1;

    invoke-direct {v2, v3, p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$startProximityEvents$listener$1;-><init>(Landroid/hardware/Sensor;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)V

    .line 455
    move-object v4, v2

    check-cast v4, Landroid/hardware/SensorEventListener;

    iput-object v4, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->proximityListener:Landroid/hardware/SensorEventListener;

    .line 456
    check-cast v2, Landroid/hardware/SensorEventListener;

    const/4 v4, 0x3

    invoke-virtual {v1, v2, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v1

    if-eqz p1, :cond_7

    .line 458
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_6

    const-string v1, "Proximity listener failed"

    :cond_6
    const-string v2, "proximity_error"

    invoke-interface {p1, v2, v1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_7
    :goto_1
    return-void
.end method

.method private final stopProximityEvents()V
    .locals 3

    const/4 v0, 0x0

    .line 464
    :try_start_0
    iget-object v1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v1, :cond_0

    const-string v1, "context"

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v0

    :cond_0
    const-string v2, "sensor"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Landroid/hardware/SensorManager;

    if-eqz v2, :cond_1

    check-cast v1, Landroid/hardware/SensorManager;

    goto :goto_0

    :cond_1
    move-object v1, v0

    .line 465
    :goto_0
    iget-object v2, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->proximityListener:Landroid/hardware/SensorEventListener;

    if-eqz v1, :cond_2

    if-eqz v2, :cond_2

    .line 467
    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 471
    :catchall_0
    :cond_2
    iput-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->proximityListener:Landroid/hardware/SensorEventListener;

    .line 472
    iput-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->proximityEventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    return-void
.end method

.method private final storageFields()Ljava/util/Map;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 230
    const-string v0, "available_storage"

    const-string v1, "storage"

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    .line 231
    :try_start_0
    new-instance v5, Landroid/os/StatFs;

    iget-object v6, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    if-nez v6, :cond_0

    const-string v6, "context"

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v6, 0x0

    :cond_0
    invoke-virtual {v6}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    iget-object v6, v6, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-direct {v5, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 233
    new-array v6, v4, [Lkotlin/Pair;

    invoke-virtual {v5}, Landroid/os/StatFs;->getTotalBytes()J

    move-result-wide v7

    invoke-direct {p0, v7, v8}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->bytesToGb(J)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-static {v1, v7}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v7

    aput-object v7, v6, v3

    .line 234
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBytes()J

    move-result-wide v7

    invoke-direct {p0, v7, v8}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->bytesToGb(J)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v0, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v5

    aput-object v5, v6, v2

    .line 232
    invoke-static {v6}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    const/4 v5, -0x1

    .line 237
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v1, v6}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v0, v5}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    new-array v4, v4, [Lkotlin/Pair;

    aput-object v1, v4, v3

    aput-object v0, v4, v2

    invoke-static {v4}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private final telephonyFields()Ljava/util/Map;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 173
    const-string v0, "network_type"

    const-string v1, "unknown"

    invoke-static {v0, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v2

    .line 174
    const-string v3, "carrier"

    const-string v4, ""

    invoke-static {v3, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v5

    .line 175
    const-string v6, "mcc"

    invoke-static {v6, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v7

    .line 176
    const-string v8, "mnc"

    invoke-static {v8, v1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    const/4 v9, -0x1

    .line 177
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v11, "has_sim"

    invoke-static {v11, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v10

    const/4 v12, 0x5

    new-array v13, v12, [Lkotlin/Pair;

    const/4 v14, 0x0

    aput-object v2, v13, v14

    const/4 v2, 0x1

    aput-object v5, v13, v2

    const/4 v5, 0x2

    aput-object v7, v13, v5

    const/4 v5, 0x3

    aput-object v1, v13, v5

    const/4 v1, 0x4

    aput-object v10, v13, v1

    .line 172
    invoke-static {v13}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v1

    .line 180
    :try_start_0
    iget-object v7, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    const/4 v10, 0x0

    if-nez v7, :cond_0

    const-string v7, "context"

    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v7, v10

    :cond_0
    const-string v13, "phone"

    invoke-virtual {v7, v13}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    instance-of v13, v7, Landroid/telephony/TelephonyManager;

    if-eqz v13, :cond_1

    move-object v10, v7

    check-cast v10, Landroid/telephony/TelephonyManager;

    :cond_1
    if-nez v10, :cond_2

    return-object v1

    .line 182
    :cond_2
    invoke-virtual {v10}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_3

    move-object v7, v4

    :cond_3
    invoke-interface {v1, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    invoke-virtual {v10}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_4

    goto :goto_0

    :cond_4
    move-object v4, v3

    .line 184
    :goto_0
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v7, "substring(...)"

    if-lt v3, v5, :cond_5

    :try_start_1
    invoke-virtual {v4, v14, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    :cond_5
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v5, :cond_6

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1, v8, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    :cond_6
    invoke-direct {p0, v10}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->resolveNetworkType(Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    invoke-virtual {v10}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v0

    if-eq v0, v2, :cond_8

    if-eq v0, v12, :cond_7

    goto :goto_1

    :cond_7
    const/4 v9, 0x1

    goto :goto_1

    :cond_8
    const/4 v9, 0x0

    .line 190
    :goto_1
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 187
    invoke-interface {v1, v11, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    return-object v1
.end method

.method private final unknownIfBlank(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-eqz p1, :cond_0

    .line 528
    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {p1}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    const-string p1, ""

    .line 529
    :cond_1
    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_2

    const-string p1, "unknown"

    :cond_2
    return-object p1
.end method


# virtual methods
.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 3

    const-string v0, "flutterPluginBinding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "getApplicationContext(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->context:Landroid/content/Context;

    .line 54
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->registerDeviceIdentifier()V

    .line 55
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v1

    const-string v2, "analytics_sdk"

    invoke-direct {v0, v1, v2}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 56
    move-object v1, p0

    check-cast v1, Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 57
    new-instance v0, Lio/flutter/plugin/common/EventChannel;

    .line 58
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    .line 59
    const-string v1, "analytics_sdk/proximity"

    .line 57
    invoke-direct {v0, p1, v1}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->proximityChannel:Lio/flutter/plugin/common/EventChannel;

    .line 61
    move-object p1, p0

    check-cast p1, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    return-void
.end method

.method public onCancel(Ljava/lang/Object;)V
    .locals 0

    .line 87
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->stopProximityEvents()V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->stopProximityEvents()V

    .line 75
    iget-object p1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->proximityChannel:Lio/flutter/plugin/common/EventChannel;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 76
    :cond_0
    iput-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->proximityChannel:Lio/flutter/plugin/common/EventChannel;

    .line 77
    iget-object p1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    if-nez p1, :cond_1

    const-string p1, "channel"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v0

    :cond_1
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method

.method public onListen(Ljava/lang/Object;Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 0

    .line 81
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->stopProximityEvents()V

    .line 82
    iput-object p2, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->proximityEventSink:Lio/flutter/plugin/common/EventChannel$EventSink;

    .line 83
    invoke-direct {p0, p2}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->startProximityEvents(Lio/flutter/plugin/common/EventChannel$EventSink;)V

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    const-string v0, "call"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "result"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x6c2b09a0

    if-eq v0, v1, :cond_3

    const v1, -0x4208d879

    if-eq v0, v1, :cond_1

    const v1, 0x529446af

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "getPlatformVersion"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 66
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Android "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_1

    .line 65
    :cond_1
    const-string v0, "getDeviceId"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    .line 67
    :cond_2
    invoke-direct {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->deviceId()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_1

    .line 65
    :cond_3
    const-string v0, "getSdkInitPlatformFields"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    goto :goto_0

    .line 68
    :cond_4
    invoke-direct {p0, p2}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->collectSdkInitPlatformFields(Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 69
    :cond_5
    :goto_0
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    :goto_1
    return-void
.end method
