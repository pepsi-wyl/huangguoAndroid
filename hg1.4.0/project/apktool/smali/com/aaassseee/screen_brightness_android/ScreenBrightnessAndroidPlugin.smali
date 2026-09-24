.class public final Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;
.super Ljava/lang/Object;
.source "ScreenBrightnessAndroidPlugin.kt"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;
.implements Lio/flutter/embedding/engine/plugins/activity/ActivityAware;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000l\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\u0005\u00a2\u0006\u0002\u0010\u0004J\u0010\u0010\u001f\u001a\u00020\u00082\u0006\u0010 \u001a\u00020!H\u0002J\u0010\u0010\u001c\u001a\u00020\u00082\u0006\u0010 \u001a\u00020!H\u0002J\u0010\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020\u0008H\u0002J\u0010\u0010%\u001a\u00020#2\u0006\u0010&\u001a\u00020\'H\u0002J\u0010\u0010(\u001a\u00020#2\u0006\u0010&\u001a\u00020\'H\u0002J\u0010\u0010)\u001a\u00020#2\u0006\u0010&\u001a\u00020\'H\u0002J\u0010\u0010*\u001a\u00020#2\u0006\u0010&\u001a\u00020\'H\u0002J\u0010\u0010+\u001a\u00020#2\u0006\u0010&\u001a\u00020\'H\u0002J\u0010\u0010,\u001a\u00020#2\u0006\u0010&\u001a\u00020\'H\u0002J\u0018\u0010-\u001a\u00020#2\u0006\u0010.\u001a\u00020/2\u0006\u0010&\u001a\u00020\'H\u0002J\u0018\u00100\u001a\u00020#2\u0006\u0010.\u001a\u00020/2\u0006\u0010&\u001a\u00020\'H\u0002J\u0018\u00101\u001a\u00020#2\u0006\u0010.\u001a\u00020/2\u0006\u0010&\u001a\u00020\'H\u0002J\u0010\u00102\u001a\u00020#2\u0006\u00103\u001a\u000204H\u0016J\u0010\u00105\u001a\u00020#2\u0006\u00106\u001a\u000207H\u0016J\u0008\u00108\u001a\u00020#H\u0016J\u0008\u00109\u001a\u00020#H\u0016J\u0010\u0010:\u001a\u00020#2\u0006\u00103\u001a\u000207H\u0016J\u0018\u0010;\u001a\u00020#2\u0006\u0010.\u001a\u00020/2\u0006\u0010&\u001a\u00020\'H\u0016J\u0010\u0010<\u001a\u00020#2\u0006\u00103\u001a\u000204H\u0016J\u0010\u0010=\u001a\u00020\u000f2\u0006\u0010>\u001a\u00020\u0008H\u0002R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0007\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\tR\u000e\u0010\n\u001a\u00020\u000bX\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R+\u0010\u0012\u001a\u00020\u00082\u0006\u0010\u0011\u001a\u00020\u00088B@BX\u0082\u008e\u0002\u00a2\u0006\u0012\n\u0004\u0008\u0017\u0010\u0018\u001a\u0004\u0008\u0013\u0010\u0014\"\u0004\u0008\u0015\u0010\u0016R\u000e\u0010\u0019\u001a\u00020\u001aX\u0082.\u00a2\u0006\u0002\n\u0000R+\u0010\u001b\u001a\u00020\u00082\u0006\u0010\u0011\u001a\u00020\u00088B@BX\u0082\u008e\u0002\u00a2\u0006\u0012\n\u0004\u0008\u001e\u0010\u0018\u001a\u0004\u0008\u001c\u0010\u0014\"\u0004\u0008\u001d\u0010\u0016\u00a8\u0006?"
    }
    d2 = {
        "Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;",
        "Lio/flutter/embedding/engine/plugins/FlutterPlugin;",
        "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;",
        "Lio/flutter/embedding/engine/plugins/activity/ActivityAware;",
        "()V",
        "activity",
        "Landroid/app/Activity;",
        "changedBrightness",
        "",
        "Ljava/lang/Float;",
        "currentBrightnessChangeEventChannel",
        "Lio/flutter/plugin/common/EventChannel;",
        "currentBrightnessChangeStreamHandler",
        "Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;",
        "isAnimate",
        "",
        "isAutoReset",
        "<set-?>",
        "maximumBrightness",
        "getMaximumBrightness",
        "()F",
        "setMaximumBrightness",
        "(F)V",
        "maximumBrightness$delegate",
        "Lkotlin/properties/ReadWriteProperty;",
        "methodChannel",
        "Lio/flutter/plugin/common/MethodChannel;",
        "systemBrightness",
        "getSystemBrightness",
        "setSystemBrightness",
        "systemBrightness$delegate",
        "getScreenMaximumBrightness",
        "context",
        "Landroid/content/Context;",
        "handleCurrentBrightnessChanged",
        "",
        "currentBrightness",
        "handleGetScreenBrightnessMethodCall",
        "result",
        "Lio/flutter/plugin/common/MethodChannel$Result;",
        "handleGetSystemBrightnessMethodCall",
        "handleHasChangedMethodCall",
        "handleIsAnimateMethodCall",
        "handleIsAutoResetMethodCall",
        "handleResetScreenBrightnessMethodCall",
        "handleSetAnimateMethodCall",
        "call",
        "Lio/flutter/plugin/common/MethodCall;",
        "handleSetAutoResetMethodCall",
        "handleSetScreenBrightnessMethodCall",
        "onAttachedToActivity",
        "binding",
        "Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;",
        "onAttachedToEngine",
        "flutterPluginBinding",
        "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;",
        "onDetachedFromActivity",
        "onDetachedFromActivityForConfigChanges",
        "onDetachedFromEngine",
        "onMethodCall",
        "onReattachedToActivityForConfigChanges",
        "setWindowsAttributesBrightness",
        "brightness",
        "screen_brightness_android_release"
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
.field static final synthetic $$delegatedProperties:[Lkotlin/reflect/KProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lkotlin/reflect/KProperty<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private activity:Landroid/app/Activity;

.field private changedBrightness:Ljava/lang/Float;

.field private currentBrightnessChangeEventChannel:Lio/flutter/plugin/common/EventChannel;

.field private currentBrightnessChangeStreamHandler:Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;

.field private isAnimate:Z

.field private isAutoReset:Z

.field private final maximumBrightness$delegate:Lkotlin/properties/ReadWriteProperty;

.field private methodChannel:Lio/flutter/plugin/common/MethodChannel;

.field private final systemBrightness$delegate:Lkotlin/properties/ReadWriteProperty;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v0, 0x2

    new-array v0, v0, [Lkotlin/reflect/KProperty;

    .line 43
    new-instance v1, Lkotlin/jvm/internal/MutablePropertyReference1Impl;

    const-string v2, "systemBrightness"

    const-string v3, "getSystemBrightness()F"

    const-class v4, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;

    const/4 v5, 0x0

    invoke-direct {v1, v4, v2, v3, v5}, Lkotlin/jvm/internal/MutablePropertyReference1Impl;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    check-cast v1, Lkotlin/jvm/internal/MutablePropertyReference1;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->mutableProperty1(Lkotlin/jvm/internal/MutablePropertyReference1;)Lkotlin/reflect/KMutableProperty1;

    move-result-object v1

    aput-object v1, v0, v5

    .line 53
    new-instance v1, Lkotlin/jvm/internal/MutablePropertyReference1Impl;

    const-string v2, "maximumBrightness"

    const-string v3, "getMaximumBrightness()F"

    invoke-direct {v1, v4, v2, v3, v5}, Lkotlin/jvm/internal/MutablePropertyReference1Impl;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    check-cast v1, Lkotlin/jvm/internal/MutablePropertyReference1;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->mutableProperty1(Lkotlin/jvm/internal/MutablePropertyReference1;)Lkotlin/reflect/KMutableProperty1;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sput-object v0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->$$delegatedProperties:[Lkotlin/reflect/KProperty;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    sget-object v0, Lkotlin/properties/Delegates;->INSTANCE:Lkotlin/properties/Delegates;

    invoke-virtual {v0}, Lkotlin/properties/Delegates;->notNull()Lkotlin/properties/ReadWriteProperty;

    move-result-object v0

    iput-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->systemBrightness$delegate:Lkotlin/properties/ReadWriteProperty;

    .line 53
    sget-object v0, Lkotlin/properties/Delegates;->INSTANCE:Lkotlin/properties/Delegates;

    invoke-virtual {v0}, Lkotlin/properties/Delegates;->notNull()Lkotlin/properties/ReadWriteProperty;

    move-result-object v0

    iput-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->maximumBrightness$delegate:Lkotlin/properties/ReadWriteProperty;

    const/4 v0, 0x1

    .line 63
    iput-boolean v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->isAutoReset:Z

    .line 65
    iput-boolean v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->isAnimate:Z

    return-void
.end method

.method public static final synthetic access$getChangedBrightness$p(Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;)Ljava/lang/Float;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->changedBrightness:Ljava/lang/Float;

    return-object p0
.end method

.method public static final synthetic access$getSystemBrightness(Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;)F
    .locals 0

    .line 23
    invoke-direct {p0}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->getSystemBrightness()F

    move-result p0

    return p0
.end method

.method public static final synthetic access$getSystemBrightness(Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;Landroid/content/Context;)F
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->getSystemBrightness(Landroid/content/Context;)F

    move-result p0

    return p0
.end method

.method public static final synthetic access$setSystemBrightness(Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;F)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->setSystemBrightness(F)V

    return-void
.end method

.method private final getMaximumBrightness()F
    .locals 3

    .line 53
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->maximumBrightness$delegate:Lkotlin/properties/ReadWriteProperty;

    sget-object v1, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->$$delegatedProperties:[Lkotlin/reflect/KProperty;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-interface {v0, p0, v1}, Lkotlin/properties/ReadWriteProperty;->getValue(Ljava/lang/Object;Lkotlin/reflect/KProperty;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    return v0
.end method

.method private final getScreenMaximumBrightness(Landroid/content/Context;)F
    .locals 7

    const/high16 v0, 0x437f0000    # 255.0f

    .line 162
    :try_start_0
    const-string v1, "power"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    if-eqz p1, :cond_2

    .line 164
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    const-string v2, "getDeclaredFields(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 165
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 166
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "BRIGHTNESS_ON"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v1, 0x1

    .line 167
    invoke-virtual {v4, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 168
    invoke-virtual {v4, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "null cannot be cast to non-null type kotlin.Int"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-float p1, p1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v0

    .line 163
    :cond_2
    new-instance p1, Ljava/lang/ClassNotFoundException;

    invoke-direct {p1}, Ljava/lang/ClassNotFoundException;-><init>()V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return v0
.end method

.method private final getSystemBrightness()F
    .locals 3

    .line 43
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->systemBrightness$delegate:Lkotlin/properties/ReadWriteProperty;

    sget-object v1, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->$$delegatedProperties:[Lkotlin/reflect/KProperty;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-interface {v0, p0, v1}, Lkotlin/properties/ReadWriteProperty;->getValue(Ljava/lang/Object;Lkotlin/reflect/KProperty;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    return v0
.end method

.method private final getSystemBrightness(Landroid/content/Context;)F
    .locals 1

    .line 121
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    .line 122
    const-string v0, "screen_brightness"

    .line 120
    invoke-static {p1, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result p1

    int-to-float p1, p1

    .line 123
    invoke-direct {p0}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->getMaximumBrightness()F

    move-result v0

    div-float/2addr p1, v0

    return p1
.end method

.method private final handleCurrentBrightnessChanged(F)V
    .locals 3

    .line 236
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->currentBrightnessChangeStreamHandler:Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;

    if-eqz v0, :cond_0

    float-to-double v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;->addCurrentBrightnessToEventSink(D)V

    :cond_0
    return-void
.end method

.method private final handleGetScreenBrightnessMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 5

    .line 131
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 133
    const-string v0, "-10"

    const-string v2, "Unexpected error on activity binding"

    invoke-interface {p1, v0, v2, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 139
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    const-string v3, "getAttributes(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 140
    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    .line 142
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    move-result v2

    const/high16 v4, -0x40800000    # -1.0f

    cmpg-float v2, v2, v4

    if-nez v2, :cond_1

    .line 150
    :try_start_0
    check-cast v0, Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->getSystemBrightness(Landroid/content/Context;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 151
    invoke-interface {p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 153
    invoke-virtual {v0}, Landroid/provider/Settings$SettingNotFoundException;->printStackTrace()V

    .line 154
    const-string v0, "-11"

    const-string v2, "Could not found system setting screen brightness value"

    invoke-interface {p1, v0, v2, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 144
    :cond_1
    invoke-interface {p1, v3}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private final handleGetSystemBrightnessMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    .line 127
    invoke-direct {p0}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->getSystemBrightness()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private final handleHasChangedMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    .line 240
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->changedBrightness:Ljava/lang/Float;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private final handleIsAnimateMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    .line 259
    iget-boolean v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->isAnimate:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private final handleIsAutoResetMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 1

    .line 244
    iget-boolean v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->isAutoReset:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private final handleResetScreenBrightnessMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 3

    .line 217
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 219
    const-string v0, "-10"

    const-string v2, "Unexpected error on activity binding"

    invoke-interface {p1, v0, v2, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_0
    const/high16 v0, -0x40800000    # -1.0f

    .line 224
    invoke-direct {p0, v0}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->setWindowsAttributesBrightness(F)Z

    move-result v0

    if-nez v0, :cond_1

    .line 226
    const-string v0, "-1"

    const-string v2, "Unable to change screen brightness"

    invoke-interface {p1, v0, v2, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 230
    :cond_1
    iput-object v1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->changedBrightness:Ljava/lang/Float;

    .line 231
    invoke-direct {p0}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->getSystemBrightness()F

    move-result v0

    invoke-direct {p0, v0}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->handleCurrentBrightnessChanged(F)V

    .line 232
    invoke-interface {p1, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private final handleSetAnimateMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    .line 263
    const-string v0, "isAnimate"

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Ljava/lang/Boolean;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast p1, Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    move-object p1, v1

    :goto_0
    if-nez p1, :cond_1

    .line 265
    const-string p1, "-2"

    const-string v0, "Unexpected error on null isAnimate"

    invoke-interface {p2, p1, v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 269
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->isAnimate:Z

    .line 270
    invoke-interface {p2, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private final handleSetAutoResetMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    .line 248
    const-string v0, "isAutoReset"

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Ljava/lang/Boolean;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    check-cast p1, Ljava/lang/Boolean;

    goto :goto_0

    :cond_0
    move-object p1, v1

    :goto_0
    if-nez p1, :cond_1

    .line 250
    const-string p1, "-2"

    const-string v0, "Unexpected error on null isAutoReset"

    invoke-interface {p2, p1, v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 254
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->isAutoReset:Z

    .line 255
    invoke-interface {p2, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private final handleSetScreenBrightnessMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 4

    .line 193
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->activity:Landroid/app/Activity;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 195
    const-string p1, "-10"

    const-string v0, "Unexpected error on activity binding"

    invoke-interface {p2, p1, v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 199
    :cond_0
    const-string v0, "brightness"

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_1

    check-cast p1, Ljava/lang/Double;

    goto :goto_0

    :cond_1
    move-object p1, v1

    :goto_0
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    double-to-float p1, v2

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    goto :goto_1

    :cond_2
    move-object p1, v1

    :goto_1
    if-nez p1, :cond_3

    .line 201
    const-string p1, "-2"

    const-string v0, "Unexpected error on null brightness"

    invoke-interface {p2, p1, v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 205
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-direct {p0, v0}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->setWindowsAttributesBrightness(F)Z

    move-result v0

    if-nez v0, :cond_4

    .line 207
    const-string p1, "-1"

    const-string v0, "Unable to change screen brightness"

    invoke-interface {p2, p1, v0, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 211
    :cond_4
    iput-object p1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->changedBrightness:Ljava/lang/Float;

    .line 212
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-direct {p0, p1}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->handleCurrentBrightnessChanged(F)V

    .line 213
    invoke-interface {p2, v1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private final setMaximumBrightness(F)V
    .locals 3

    .line 53
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->maximumBrightness$delegate:Lkotlin/properties/ReadWriteProperty;

    sget-object v1, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->$$delegatedProperties:[Lkotlin/reflect/KProperty;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-interface {v0, p0, v1, p1}, Lkotlin/properties/ReadWriteProperty;->setValue(Ljava/lang/Object;Lkotlin/reflect/KProperty;Ljava/lang/Object;)V

    return-void
.end method

.method private final setSystemBrightness(F)V
    .locals 3

    .line 43
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->systemBrightness$delegate:Lkotlin/properties/ReadWriteProperty;

    sget-object v1, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->$$delegatedProperties:[Lkotlin/reflect/KProperty;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-interface {v0, p0, v1, p1}, Lkotlin/properties/ReadWriteProperty;->setValue(Ljava/lang/Object;Lkotlin/reflect/KProperty;Ljava/lang/Object;)V

    return-void
.end method

.method private final setWindowsAttributesBrightness(F)Z
    .locals 2

    .line 180
    :try_start_0
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const-string v1, "getAttributes(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 181
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 182
    iget-object p1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->activity:Landroid/app/Activity;

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    goto :goto_0

    :catch_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 3

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iput-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->activity:Landroid/app/Activity;

    .line 92
    new-instance v0, Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;

    .line 93
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "getActivity(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Landroid/content/Context;

    .line 91
    new-instance v2, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin$onAttachedToActivity$1;

    invoke-direct {v2, p0, p1}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin$onAttachedToActivity$1;-><init>(Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V

    check-cast v2, Lkotlin/jvm/functions/Function1;

    const/4 p1, 0x0

    .line 92
    invoke-direct {v0, v1, p1, v2}, Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;-><init>(Landroid/content/Context;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    .line 91
    iput-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->currentBrightnessChangeStreamHandler:Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;

    .line 101
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->currentBrightnessChangeEventChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez v0, :cond_0

    const-string v0, "currentBrightnessChangeEventChannel"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    move-object p1, v0

    :goto_0
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->currentBrightnessChangeStreamHandler:Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;

    check-cast v0, Lio/flutter/plugin/common/EventChannel$StreamHandler;

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 4

    const-string v0, "getApplicationContext(...)"

    const-string v1, "flutterPluginBinding"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    new-instance v1, Lio/flutter/plugin/common/MethodChannel;

    .line 69
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v2

    .line 70
    const-string v3, "github.com/aaassseee/screen_brightness"

    .line 68
    invoke-direct {v1, v2, v3}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 72
    move-object v2, p0

    check-cast v2, Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 75
    new-instance v1, Lio/flutter/plugin/common/EventChannel;

    .line 76
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v2

    .line 77
    const-string v3, "github.com/aaassseee/screen_brightness/change"

    .line 75
    invoke-direct {v1, v2, v3}, Lio/flutter/plugin/common/EventChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->currentBrightnessChangeEventChannel:Lio/flutter/plugin/common/EventChannel;

    .line 81
    :try_start_0
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->getScreenMaximumBrightness(Landroid/content/Context;)F

    move-result v1

    invoke-direct {p0, v1}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->setMaximumBrightness(F)V

    .line 82
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->getSystemBrightness(Landroid/content/Context;)F

    move-result p1

    invoke-direct {p0, p1}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->setSystemBrightness(F)V
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 84
    invoke-virtual {p1}, Landroid/provider/Settings$SettingNotFoundException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public onDetachedFromActivity()V
    .locals 2

    const/4 v0, 0x0

    .line 282
    iput-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->activity:Landroid/app/Activity;

    .line 283
    iget-object v1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->currentBrightnessChangeEventChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez v1, :cond_0

    const-string v1, "currentBrightnessChangeEventChannel"

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object v1, v0

    :cond_0
    invoke-virtual {v1, v0}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 284
    iput-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->currentBrightnessChangeStreamHandler:Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;

    return-void
.end method

.method public onDetachedFromActivityForConfigChanges()V
    .locals 1

    const/4 v0, 0x0

    .line 274
    iput-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->activity:Landroid/app/Activity;

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 288
    iget-object p1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string p1, "methodChannel"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v0

    :cond_0
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 289
    iget-object p1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->currentBrightnessChangeEventChannel:Lio/flutter/plugin/common/EventChannel;

    if-nez p1, :cond_1

    const-string p1, "currentBrightnessChangeEventChannel"

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    move-object p1, v0

    :cond_1
    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/EventChannel;->setStreamHandler(Lio/flutter/plugin/common/EventChannel$StreamHandler;)V

    .line 290
    iput-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->currentBrightnessChangeStreamHandler:Lcom/aaassseee/screen_brightness_android/stream_handler/CurrentBrightnessChangeStreamHandler;

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    const-string v0, "call"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "result"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 105
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v1, "setAnimate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    .line 114
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->handleSetAnimateMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto/16 :goto_1

    .line 105
    :sswitch_1
    const-string p1, "getSystemScreenBrightness"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto/16 :goto_0

    .line 106
    :cond_1
    invoke-direct {p0, p2}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->handleGetSystemBrightnessMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto/16 :goto_1

    .line 105
    :sswitch_2
    const-string p1, "getScreenBrightness"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    .line 107
    :cond_2
    invoke-direct {p0, p2}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->handleGetScreenBrightnessMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 105
    :sswitch_3
    const-string v1, "setAutoReset"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    .line 112
    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->handleSetAutoResetMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 105
    :sswitch_4
    const-string v1, "setScreenBrightness"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    .line 108
    :cond_4
    invoke-direct {p0, p1, p2}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->handleSetScreenBrightnessMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 105
    :sswitch_5
    const-string p1, "resetScreenBrightness"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_0

    .line 109
    :cond_5
    invoke-direct {p0, p2}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->handleResetScreenBrightnessMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 105
    :sswitch_6
    const-string p1, "isAnimate"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    goto :goto_0

    .line 113
    :cond_6
    invoke-direct {p0, p2}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->handleIsAnimateMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 105
    :sswitch_7
    const-string p1, "isAutoReset"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    goto :goto_0

    .line 111
    :cond_7
    invoke-direct {p0, p2}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->handleIsAutoResetMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 105
    :sswitch_8
    const-string p1, "hasChanged"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    goto :goto_0

    .line 110
    :cond_8
    invoke-direct {p0, p2}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->handleHasChangedMethodCall(Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_1

    .line 115
    :cond_9
    :goto_0
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    :goto_1
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x5ad0d946 -> :sswitch_8
        -0x577b392a -> :sswitch_7
        -0x55a285a9 -> :sswitch_6
        -0x518eeab4 -> :sswitch_5
        -0x5085d1a1 -> :sswitch_4
        -0x41f74962 -> :sswitch_3
        0xb7d9953 -> :sswitch_2
        0x22602122 -> :sswitch_1
        0x7e2abc1f -> :sswitch_0
    .end sparse-switch
.end method

.method public onReattachedToActivityForConfigChanges(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 1

    const-string v0, "binding"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 278
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->activity:Landroid/app/Activity;

    return-void
.end method
