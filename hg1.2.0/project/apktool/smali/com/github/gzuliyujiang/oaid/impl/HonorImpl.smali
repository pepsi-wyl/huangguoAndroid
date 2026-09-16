.class Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;
.super Ljava/lang/Object;
.source "HonorImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/IOAID;


# instance fields
.field private final context:Landroid/content/Context;

.field private final uiHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->uiHandler:Landroid/os/Handler;

    .line 38
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->context:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->runOnSubThread(Lcom/github/gzuliyujiang/oaid/IGetter;)V

    return-void
.end method

.method private postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V
    .locals 2

    .line 94
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->uiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl$3;-><init>(Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Ljava/lang/String;)V
    .locals 2

    .line 85
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->uiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl$2;-><init>(Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;Lcom/github/gzuliyujiang/oaid/IGetter;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private runOnSubThread(Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 2

    .line 67
    :try_start_0
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/hihonor/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v0

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v1, "Advertising identifier info is null"

    invoke-direct {v0, v1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0}, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V

    return-void

    .line 72
    :cond_0
    iget-boolean v1, v0, Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;->isLimit:Z

    if-eqz v1, :cond_1

    .line 74
    new-instance v0, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v1, "User has disabled advertising identifier"

    invoke-direct {v0, v1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0}, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V

    return-void

    .line 77
    :cond_1
    iget-object v0, v0, Lcom/hihonor/ads/identifier/AdvertisingIdClient$Info;->id:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 79
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 80
    new-instance v1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    invoke-direct {v1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/Throwable;)V

    invoke-direct {p0, p1, v1}, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 2

    .line 52
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->context:Landroid/content/Context;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 55
    :cond_0
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    new-instance v1, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl$1;

    invoke-direct {v1, p0, p1}, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl$1;-><init>(Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;Lcom/github/gzuliyujiang/oaid/IGetter;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public supported()Z
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HonorImpl;->context:Landroid/content/Context;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 47
    :cond_0
    invoke-static {v0}, Lcom/hihonor/ads/identifier/AdvertisingIdClient;->isAdvertisingIdAvailable(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method
