.class final Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectSdkInitPlatformFields$1;
.super Lkotlin/jvm/internal/Lambda;
.source "AnalyticsSdkPlugin.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->collectSdkInitPlatformFields(Lio/flutter/plugin/common/MethodChannel$Result;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "+",
        "Ljava/lang/Object;",
        ">;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0000\u0010\u0000\u001a\u00020\u00012\u0012\u0010\u0002\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u0003H\n\u00a2\u0006\u0002\u0008\u0006"
    }
    d2 = {
        "<anonymous>",
        "",
        "advertisingIdFields",
        "",
        "",
        "",
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
.field final synthetic $result:Lio/flutter/plugin/common/MethodChannel$Result;

.field final synthetic this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;


# direct methods
.method constructor <init>(Lio/flutter/plugin/common/MethodChannel$Result;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)V
    .locals 0

    iput-object p1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectSdkInitPlatformFields$1;->$result:Lio/flutter/plugin/common/MethodChannel$Result;

    iput-object p2, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectSdkInitPlatformFields$1;->this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 91
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectSdkInitPlatformFields$1;->invoke(Ljava/util/Map;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method public final invoke(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "advertisingIdFields"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 92
    iget-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectSdkInitPlatformFields$1;->$result:Lio/flutter/plugin/common/MethodChannel$Result;

    iget-object v1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectSdkInitPlatformFields$1;->this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;

    invoke-static {v1, p1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->access$getSdkInitPlatformFields(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method
