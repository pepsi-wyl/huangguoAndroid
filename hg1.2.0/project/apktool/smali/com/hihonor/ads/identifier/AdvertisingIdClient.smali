.class public Lcom/hihonor/ads/identifier/AdvertisingIdClient;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAdvertisingIdInfo(Landroid/content/Context;)Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;
    .locals 8

    const-string v0, "AdvertisingIdPlatform"

    const-string v1, "getAdvertisingIdInfo cache isLimit="

    const-string v2, "getAdvertisingIdInfo error="

    new-instance v3, Lcom/hihonor/ads/identifier/a;

    invoke-direct {v3}, Lcom/hihonor/ads/identifier/a;-><init>()V

    .line 1
    iput-object p0, v3, Lcom/hihonor/ads/identifier/a;->b:Landroid/content/Context;

    invoke-virtual {v3, p0}, Lcom/hihonor/ads/identifier/a;->a(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_1

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "oaid_limit_state"

    invoke-static {v4, v5}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "oaid"

    invoke-static {v5, v6}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {v4}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v4

    new-instance v6, Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;

    invoke-direct {v6}, Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;-><init>()V

    iput-boolean v4, v6, Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;->isLimit:Z

    iput-object v5, v6, Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;->id:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "id "

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "getAdvertisingIdInfo cache error="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :try_start_1
    const-string v1, "bindService start"

    .line 2
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v4, "com.hihonor.id.HnOaIdService"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v4, "com.hihonor.id"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v4, 0x1

    invoke-virtual {p0, v1, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 3
    iget-object p0, v3, Lcom/hihonor/ads/identifier/a;->e:Ljava/util/concurrent/CountDownLatch;

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x7d0

    invoke-virtual {p0, v4, v5, v1}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-virtual {v3}, Lcom/hihonor/ads/identifier/a;->a()V

    iget-object v6, v3, Lcom/hihonor/ads/identifier/a;->a:Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;

    goto :goto_0

    :catchall_1
    move-exception p0

    goto :goto_1

    :catch_0
    move-exception p0

    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-virtual {v3}, Lcom/hihonor/ads/identifier/a;->a()V

    const/4 v6, 0x0

    :goto_0
    return-object v6

    :goto_1
    invoke-virtual {v3}, Lcom/hihonor/ads/identifier/a;->a()V

    throw p0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Service not found or advertisingId not available"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static isAdvertisingIdAvailable(Landroid/content/Context;)Z
    .locals 1

    new-instance v0, Lcom/hihonor/ads/identifier/a;

    invoke-direct {v0}, Lcom/hihonor/ads/identifier/a;-><init>()V

    invoke-virtual {v0, p0}, Lcom/hihonor/ads/identifier/a;->a(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method
