.class public Lcom/hihonor/ads/identifier/a$a;
.super Lcom/hihonor/cloudservice/oaid/a$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hihonor/ads/identifier/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Lcom/hihonor/ads/identifier/a;


# direct methods
.method public constructor <init>(Lcom/hihonor/ads/identifier/a;)V
    .locals 0

    iput-object p1, p0, Lcom/hihonor/ads/identifier/a$a;->a:Lcom/hihonor/ads/identifier/a;

    invoke-direct {p0}, Lcom/hihonor/cloudservice/oaid/a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(IJZFDLjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public a(ILandroid/os/Bundle;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OAIDCallBack handleResult retCode="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " retInfo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AdvertisingIdPlatform"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/hihonor/ads/identifier/a$a;->a:Lcom/hihonor/ads/identifier/a;

    .line 1
    iget-object p1, p1, Lcom/hihonor/ads/identifier/a;->a:Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;

    if-eqz p1, :cond_2

    const-string p1, "oa_id_flag"

    .line 2
    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/hihonor/ads/identifier/a$a;->a:Lcom/hihonor/ads/identifier/a;

    .line 3
    iget-object p2, p2, Lcom/hihonor/ads/identifier/a;->a:Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;

    .line 4
    iput-object p1, p2, Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;->id:Ljava/lang/String;

    const-string p1, "OAIDCallBack handleResult success"

    invoke-static {v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_1
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "OAIDCallBack handleResult error retCode=$ "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/hihonor/ads/identifier/a$a;->a:Lcom/hihonor/ads/identifier/a;

    .line 5
    iget-object p1, p1, Lcom/hihonor/ads/identifier/a;->e:Ljava/util/concurrent/CountDownLatch;

    .line 6
    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
