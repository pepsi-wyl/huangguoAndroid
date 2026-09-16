.class Lcom/github/gzuliyujiang/oaid/impl/LenovoImpl;
.super Ljava/lang/Object;
.source "LenovoImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/IOAID;


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/LenovoImpl;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 3

    .line 57
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/LenovoImpl;->context:Landroid/content/Context;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 60
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 61
    const-string v1, "com.zui.deviceidservice"

    const-string v2, "com.zui.deviceidservice.DeviceidService"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 62
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/LenovoImpl;->context:Landroid/content/Context;

    new-instance v2, Lcom/github/gzuliyujiang/oaid/impl/LenovoImpl$1;

    invoke-direct {v2, p0}, Lcom/github/gzuliyujiang/oaid/impl/LenovoImpl$1;-><init>(Lcom/github/gzuliyujiang/oaid/impl/LenovoImpl;)V

    invoke-static {v1, v0, p1, v2}, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->bind(Landroid/content/Context;Landroid/content/Intent;Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public supported()Z
    .locals 3

    .line 43
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/LenovoImpl;->context:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 47
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v2, "com.zui.deviceidservice"

    invoke-virtual {v0, v2, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    :catch_0
    move-exception v0

    .line 50
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return v1
.end method
