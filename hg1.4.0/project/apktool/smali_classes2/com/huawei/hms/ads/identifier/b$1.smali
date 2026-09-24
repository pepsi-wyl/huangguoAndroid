.class final Lcom/huawei/hms/ads/identifier/b$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/huawei/hms/ads/identifier/b;->a(Landroid/content/Context;)Lcom/huawei/hms/ads/identifier/AdvertisingIdClient$Info;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/huawei/hms/ads/identifier/d$a;

.field final synthetic b:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/huawei/hms/ads/identifier/d$a;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/huawei/hms/ads/identifier/b$1;->a:Lcom/huawei/hms/ads/identifier/d$a;

    iput-object p2, p0, Lcom/huawei/hms/ads/identifier/b$1;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/huawei/hms/ads/identifier/b$1;->a:Lcom/huawei/hms/ads/identifier/d$a;

    invoke-virtual {v0}, Lcom/huawei/hms/ads/identifier/d$a;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "InfoProviderUtil"

    const-string v1, "within key update interval."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/huawei/hms/ads/identifier/b$1;->a:Lcom/huawei/hms/ads/identifier/d$a;

    invoke-virtual {v0}, Lcom/huawei/hms/ads/identifier/d$a;->b()V

    iget-object v0, p0, Lcom/huawei/hms/ads/identifier/b$1;->b:Landroid/content/Context;

    invoke-static {v0}, Lcom/huawei/hms/ads/identifier/b;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/huawei/hms/ads/identifier/b$1;->a:Lcom/huawei/hms/ads/identifier/d$a;

    invoke-virtual {v1, v0}, Lcom/huawei/hms/ads/identifier/d$a;->a(Ljava/lang/String;)V

    return-void
.end method
