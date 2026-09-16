.class public Lcom/github/gzuliyujiang/oaid/impl/QikuImpl;
.super Ljava/lang/Object;
.source "QikuImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/IOAID;


# instance fields
.field private final context:Landroid/content/Context;

.field private mUseQikuId:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p0, Lcom/github/gzuliyujiang/oaid/impl/QikuImpl;->mUseQikuId:Z

    .line 39
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/QikuImpl;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 3

    .line 63
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/QikuImpl;->context:Landroid/content/Context;

    if-eqz v0, :cond_3

    if-nez p1, :cond_0

    goto :goto_0

    .line 66
    :cond_0
    iget-boolean v0, p0, Lcom/github/gzuliyujiang/oaid/impl/QikuImpl;->mUseQikuId:Z

    if-eqz v0, :cond_1

    .line 67
    new-instance v0, Landroid/content/Intent;

    const-string v1, "qiku.service.action.id"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 68
    const-string v1, "com.qiku.id"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/QikuImpl;->context:Landroid/content/Context;

    new-instance v2, Lcom/github/gzuliyujiang/oaid/impl/QikuImpl$1;

    invoke-direct {v2, p0}, Lcom/github/gzuliyujiang/oaid/impl/QikuImpl$1;-><init>(Lcom/github/gzuliyujiang/oaid/impl/QikuImpl;)V

    invoke-static {v1, v0, p1, v2}, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->bind(Landroid/content/Context;Landroid/content/Intent;Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;)V

    goto :goto_0

    .line 81
    :cond_1
    :try_start_0
    new-instance v0, Lrepeackage/com/qiku/id/QikuIdmanager;

    invoke-direct {v0}, Lrepeackage/com/qiku/id/QikuIdmanager;-><init>()V

    invoke-virtual {v0}, Lrepeackage/com/qiku/id/QikuIdmanager;->getOAID()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 82
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_2

    .line 85
    invoke-interface {p1, v0}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetComplete(Ljava/lang/String;)V

    goto :goto_0

    .line 83
    :cond_2
    new-instance v0, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v1, "OAID/AAID acquire failed"

    invoke-direct {v0, v1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .line 87
    invoke-interface {p1, v0}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetError(Ljava/lang/Exception;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public supported()Z
    .locals 3

    .line 44
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/QikuImpl;->context:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 48
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v2, "com.qiku.id"

    invoke-virtual {v0, v2, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    .line 52
    :cond_1
    iput-boolean v1, p0, Lcom/github/gzuliyujiang/oaid/impl/QikuImpl;->mUseQikuId:Z

    .line 53
    new-instance v0, Lrepeackage/com/qiku/id/QikuIdmanager;

    invoke-direct {v0}, Lrepeackage/com/qiku/id/QikuIdmanager;-><init>()V

    invoke-virtual {v0}, Lrepeackage/com/qiku/id/QikuIdmanager;->isSupported()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    .line 56
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return v1
.end method
