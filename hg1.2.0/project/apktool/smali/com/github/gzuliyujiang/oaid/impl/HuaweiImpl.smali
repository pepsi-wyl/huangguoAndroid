.class Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;
.super Ljava/lang/Object;
.source "HuaweiImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/IOAID;


# instance fields
.field private final context:Landroid/content/Context;

.field private final uiHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->uiHandler:Landroid/os/Handler;

    .line 40
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->context:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->runOnSubThread(Lcom/github/gzuliyujiang/oaid/IGetter;)V

    return-void
.end method

.method private postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V
    .locals 2

    .line 113
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->uiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$3;-><init>(Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Ljava/lang/String;)V
    .locals 2

    .line 104
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->uiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$2;-><init>(Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;Lcom/github/gzuliyujiang/oaid/IGetter;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private runOnSubThread(Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 2

    .line 86
    :try_start_0
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/huawei/hms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/huawei/hms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v0

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v1, "Advertising identifier info is null"

    invoke-direct {v0, v1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0}, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V

    return-void

    .line 91
    :cond_0
    invoke-virtual {v0}, Lcom/huawei/hms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 93
    new-instance v0, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v1, "User has disabled advertising identifier"

    invoke-direct {v0, v1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0}, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V

    return-void

    .line 96
    :cond_1
    invoke-virtual {v0}, Lcom/huawei/hms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 98
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 99
    new-instance v1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    invoke-direct {v1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v1}, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 2

    .line 70
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->context:Landroid/content/Context;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 73
    :cond_0
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$1;

    invoke-direct {v1, p0, p1}, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$1;-><init>(Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;Lcom/github/gzuliyujiang/oaid/IGetter;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public supported()Z
    .locals 4

    .line 45
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->context:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 49
    :cond_0
    :try_start_0
    invoke-static {v0}, Lcom/huawei/hms/ads/identifier/AdvertisingIdClient;->isAdvertisingIdAvailable(Landroid/content/Context;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    .line 52
    :cond_1
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 53
    const-string v3, "com.huawei.hwid"

    invoke-virtual {v0, v3, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    if-eqz v3, :cond_2

    return v2

    .line 56
    :cond_2
    const-string v3, "com.huawei.hwid.tv"

    invoke-virtual {v0, v3, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    if-eqz v3, :cond_3

    return v2

    .line 59
    :cond_3
    const-string v3, "com.huawei.hms"

    invoke-virtual {v0, v3, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_4

    return v2

    :catch_0
    move-exception v0

    .line 63
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    :cond_4
    return v1
.end method
