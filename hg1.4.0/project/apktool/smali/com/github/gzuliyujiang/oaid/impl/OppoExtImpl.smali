.class public Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;
.super Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;
.source "OppoExtImpl.java"


# static fields
.field private static final ACTION:Ljava/lang/String; = "action.com.oplus.stdid.ID_SERVICE"

.field private static final CLASS_NAME:Ljava/lang/String; = "com.oplus.stdid.IdentifyService"

.field private static final PACKAGE_NAME:Ljava/lang/String; = "com.coloros.mcs"


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1}, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;-><init>(Landroid/content/Context;)V

    .line 42
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 4

    .line 61
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;->context:Landroid/content/Context;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 64
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "action.com.oplus.stdid.ID_SERVICE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 65
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.coloros.mcs"

    const-string v3, "com.oplus.stdid.IdentifyService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 66
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;->context:Landroid/content/Context;

    new-instance v2, Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl$1;

    invoke-direct {v2, p0}, Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl$1;-><init>(Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;)V

    invoke-static {v1, v0, p1, v2}, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->bind(Landroid/content/Context;Landroid/content/Intent;Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected getSerId(Landroid/os/IBinder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Lcom/github/gzuliyujiang/oaid/OAIDException;
        }
    .end annotation

    .line 81
    invoke-static {p1}, Lrepeackage/com/oplus/stdid/IStdID$Stub;->asInterface(Landroid/os/IBinder;)Lrepeackage/com/oplus/stdid/IStdID;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 85
    const-string v0, "OUID"

    invoke-interface {p1, p2, p3, v0}, Lrepeackage/com/oplus/stdid/IStdID;->getSerID(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 83
    :cond_0
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string p2, "IStdID is null"

    invoke-direct {p1, p2}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public supported()Z
    .locals 3

    .line 47
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;->context:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 51
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v2, "com.coloros.mcs"

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

    .line 54
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return v1
.end method
