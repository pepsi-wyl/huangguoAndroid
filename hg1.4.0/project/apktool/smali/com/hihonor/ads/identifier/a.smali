.class public Lcom/hihonor/ads/identifier/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hihonor/ads/identifier/a$b;,
        Lcom/hihonor/ads/identifier/a$a;
    }
.end annotation


# instance fields
.field public a:Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;

.field public b:Landroid/content/Context;

.field public c:Lcom/hihonor/ads/identifier/a$a;

.field public d:Lcom/hihonor/ads/identifier/a$b;

.field public e:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/hihonor/ads/identifier/a$a;

    invoke-direct {v0, p0}, Lcom/hihonor/ads/identifier/a$a;-><init>(Lcom/hihonor/ads/identifier/a;)V

    iput-object v0, p0, Lcom/hihonor/ads/identifier/a;->c:Lcom/hihonor/ads/identifier/a$a;

    new-instance v0, Lcom/hihonor/ads/identifier/a$b;

    invoke-direct {v0, p0}, Lcom/hihonor/ads/identifier/a$b;-><init>(Lcom/hihonor/ads/identifier/a;)V

    iput-object v0, p0, Lcom/hihonor/ads/identifier/a;->d:Lcom/hihonor/ads/identifier/a$b;

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/hihonor/ads/identifier/a;->e:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    const-string v0, "disconnect"

    const-string v1, "AdvertisingIdPlatform"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v0, p0, Lcom/hihonor/ads/identifier/a;->b:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "OAIDClientImpl#disconnect#Disconnect error::"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public a(Landroid/content/Context;)Z
    .locals 4

    const-string v0, "com.hihonor.id"

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.hihonor.id.HnOaIdService"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, v2, v1}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    xor-int/lit8 v1, p1, 0x1

    :catch_0
    return v1
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    const-string p1, "onServiceConnected "

    const-string v0, "AdvertisingIdPlatform"

    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    new-instance p1, Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;

    invoke-direct {p1}, Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;-><init>()V

    iput-object p1, p0, Lcom/hihonor/ads/identifier/a;->a:Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;

    .line 1
    sget p1, Lcom/hihonor/cloudservice/oaid/b$a;->a:I

    if-nez p2, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const-string p1, "com.hihonor.cloudservice.oaid.IOAIDService"

    invoke-interface {p2, p1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object p1

    if-eqz p1, :cond_1

    instance-of v1, p1, Lcom/hihonor/cloudservice/oaid/b;

    if-eqz v1, :cond_1

    check-cast p1, Lcom/hihonor/cloudservice/oaid/b;

    goto :goto_0

    :cond_1
    new-instance p1, Lcom/hihonor/cloudservice/oaid/b$a$a;

    invoke-direct {p1, p2}, Lcom/hihonor/cloudservice/oaid/b$a$a;-><init>(Landroid/os/IBinder;)V

    .line 2
    :goto_0
    iget-object p2, p0, Lcom/hihonor/ads/identifier/a;->c:Lcom/hihonor/ads/identifier/a$a;

    invoke-interface {p1, p2}, Lcom/hihonor/cloudservice/oaid/b;->b(Lcom/hihonor/cloudservice/oaid/a;)V

    iget-object p2, p0, Lcom/hihonor/ads/identifier/a;->d:Lcom/hihonor/ads/identifier/a$b;

    invoke-interface {p1, p2}, Lcom/hihonor/cloudservice/oaid/b;->a(Lcom/hihonor/cloudservice/oaid/a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "onServiceConnected error:"

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    iget-object p1, p0, Lcom/hihonor/ads/identifier/a;->e:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object p1, p0, Lcom/hihonor/ads/identifier/a;->e:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 4
    invoke-virtual {p0}, Lcom/hihonor/ads/identifier/a;->a()V

    :goto_1
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    const-string p1, "AdvertisingIdPlatform"

    const-string v0, "onServiceDisconnected "

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1
    iget-object p1, p0, Lcom/hihonor/ads/identifier/a;->e:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object p1, p0, Lcom/hihonor/ads/identifier/a;->e:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
