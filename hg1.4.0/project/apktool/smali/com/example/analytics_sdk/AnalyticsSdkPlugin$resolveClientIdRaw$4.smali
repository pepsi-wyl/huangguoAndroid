.class final Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$4;
.super Lkotlin/jvm/internal/Lambda;
.source "AnalyticsSdkPlugin.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->resolveClientIdRaw()Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0010\u0000\u001a\u0004\u0018\u00010\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
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
.field final synthetic this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;


# direct methods
.method constructor <init>(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)V
    .locals 0

    iput-object p1, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$4;->this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 348
    invoke-virtual {p0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$4;->invoke()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final invoke()Ljava/lang/String;
    .locals 1

    .line 352
    iget-object v0, p0, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$resolveClientIdRaw$4;->this$0:Lcom/example/analytics_sdk/AnalyticsSdkPlugin;

    invoke-static {v0}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin;->access$getContext$p(Lcom/example/analytics_sdk/AnalyticsSdkPlugin;)Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "context"

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->getGUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
