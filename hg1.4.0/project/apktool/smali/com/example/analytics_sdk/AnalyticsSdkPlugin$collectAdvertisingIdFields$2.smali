.class public final Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;
.super Ljava/lang/Object;
.source "AnalyticsSdkPlugin.kt"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/IGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->collectAdvertisingIdFields(Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0012\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016J\u0018\u0010\u0006\u001a\u00020\u00032\u000e\u0010\u0007\u001a\n\u0018\u00010\u0008j\u0004\u0018\u0001`\tH\u0016\u00a8\u0006\n"
    }
    d2 = {
        "com/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2",
        "Lcom/github/gzuliyujiang/oaid/IGetter;",
        "onOAIDGetComplete",
        "",
        "result",
        "",
        "onOAIDGetError",
        "error",
        "Ljava/lang/Exception;",
        "Lkotlin/Exception;",
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


# instance fields
.field final synthetic $completed:Lkotlin/jvm/internal/Ref$BooleanRef;

.field final synthetic $fields:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $lock:Ljava/lang/Object;

.field final synthetic $onReady:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
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
.end field

.field final synthetic this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;


# direct methods
.method constructor <init>(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;)V
    .locals 0
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
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$lock:Ljava/lang/Object;

    iput-object p2, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$completed:Lkotlin/jvm/internal/Ref$BooleanRef;

    iput-object p3, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$fields:Ljava/util/Map;

    iput-object p4, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;

    iput-object p5, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$onReady:Lkotlin/jvm/functions/Function1;

    .line 324
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onOAIDGetComplete(Ljava/lang/String;)V
    .locals 6

    .line 326
    iget-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$lock:Ljava/lang/Object;

    iget-object v1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$completed:Lkotlin/jvm/internal/Ref$BooleanRef;

    iget-object v2, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$fields:Ljava/util/Map;

    iget-object v3, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;

    iget-object v4, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$onReady:Lkotlin/jvm/functions/Function1;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->access$collectAdvertisingIdFields$finishAaid(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;Ljava/lang/String;)V

    return-void
.end method

.method public onOAIDGetError(Ljava/lang/Exception;)V
    .locals 6

    .line 330
    iget-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$lock:Ljava/lang/Object;

    iget-object v1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$completed:Lkotlin/jvm/internal/Ref$BooleanRef;

    iget-object v2, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$fields:Ljava/util/Map;

    iget-object v3, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;

    iget-object v4, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$collectAdvertisingIdFields$2;->$onReady:Lkotlin/jvm/functions/Function1;

    const-string v5, ""

    invoke-static/range {v0 .. v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->access$collectAdvertisingIdFields$finishAaid(Ljava/lang/Object;Lkotlin/jvm/internal/Ref$BooleanRef;Ljava/util/Map;Lcom/example/analytics_sdk/AnalyticsSdkPlugin;Lkotlin/jvm/functions/Function1;Ljava/lang/String;)V

    return-void
.end method
