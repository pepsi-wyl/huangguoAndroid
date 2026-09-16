.class final Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin$onAttachedToActivity$1;
.super Lkotlin/jvm/internal/Lambda;
.source "ScreenBrightnessAndroidPlugin.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lio/flutter/plugin/common/EventChannel$EventSink;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "eventSink",
        "Lio/flutter/plugin/common/EventChannel$EventSink;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $binding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

.field final synthetic this$0:Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;


# direct methods
.method constructor <init>(Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 0

    iput-object p1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin$onAttachedToActivity$1;->this$0:Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;

    iput-object p2, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin$onAttachedToActivity$1;->$binding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 91
    check-cast p1, Lio/flutter/plugin/common/EventChannel$EventSink;

    invoke-virtual {p0, p1}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin$onAttachedToActivity$1;->invoke(Lio/flutter/plugin/common/EventChannel$EventSink;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke(Lio/flutter/plugin/common/EventChannel$EventSink;)V
    .locals 3

    const-string v0, "eventSink"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin$onAttachedToActivity$1;->this$0:Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;

    iget-object v1, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin$onAttachedToActivity$1;->$binding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    invoke-interface {v1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "getActivity(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->access$getSystemBrightness(Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;Landroid/content/Context;)F

    move-result v1

    invoke-static {v0, v1}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->access$setSystemBrightness(Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;F)V

    .line 97
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin$onAttachedToActivity$1;->this$0:Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;

    invoke-static {v0}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->access$getChangedBrightness$p(Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;)Ljava/lang/Float;

    move-result-object v0

    if-nez v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin$onAttachedToActivity$1;->this$0:Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;

    invoke-static {v0}, Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;->access$getSystemBrightness(Lcom/aaassseee/screen_brightness_android/ScreenBrightnessAndroidPlugin;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/flutter/plugin/common/EventChannel$EventSink;->success(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
