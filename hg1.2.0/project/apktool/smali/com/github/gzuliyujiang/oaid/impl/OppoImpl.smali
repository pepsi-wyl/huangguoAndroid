.class Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;
.super Ljava/lang/Object;
.source "OppoImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/IOAID;


# instance fields
.field private final context:Landroid/content/Context;

.field private sign:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    instance-of v0, p1, Landroid/app/Application;

    if-eqz v0, :cond_0

    .line 48
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;->context:Landroid/content/Context;

    goto :goto_0

    .line 50
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;->context:Landroid/content/Context;

    :goto_0
    return-void
.end method


# virtual methods
.method public doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 4

    .line 70
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;->context:Landroid/content/Context;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 73
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "action.com.heytap.openid.OPEN_ID_SERVICE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 74
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.heytap.openid"

    const-string v3, "com.heytap.openid.IdentifyService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 75
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;->context:Landroid/content/Context;

    new-instance v2, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl$1;

    invoke-direct {v2, p0}, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl$1;-><init>(Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;)V

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

    .line 110
    invoke-static {p1}, Lrepeackage/com/heytap/openid/IOpenID$Stub;->asInterface(Landroid/os/IBinder;)Lrepeackage/com/heytap/openid/IOpenID;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 114
    const-string v0, "OUID"

    invoke-interface {p1, p2, p3, v0}, Lrepeackage/com/heytap/openid/IOpenID;->getSerID(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 112
    :cond_0
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string p2, "IOpenID is null"

    invoke-direct {p1, p2}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected realGetOUID(Landroid/os/IBinder;)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;,
            Ljava/security/NoSuchAlgorithmException;,
            Landroid/os/RemoteException;,
            Lcom/github/gzuliyujiang/oaid/OAIDException;
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 93
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;->sign:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 94
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/16 v2, 0x40

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v2, 0x0

    .line 96
    aget-object v1, v1, v2

    invoke-virtual {v1}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v1

    .line 97
    const-string v3, "SHA1"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 98
    invoke-virtual {v3, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    .line 99
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    array-length v4, v1

    :goto_0
    if-ge v2, v4, :cond_0

    aget-byte v5, v1, v2

    and-int/lit16 v5, v5, 0xff

    or-int/lit16 v5, v5, 0x100

    .line 101
    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    const/4 v7, 0x1

    invoke-virtual {v5, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 103
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;->sign:Ljava/lang/String;

    .line 104
    invoke-virtual {p0, p1, v0, v1}, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;->getSerId(Landroid/os/IBinder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 106
    :cond_1
    invoke-virtual {p0, p1, v0, v1}, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;->getSerId(Landroid/os/IBinder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public supported()Z
    .locals 3

    .line 56
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoImpl;->context:Landroid/content/Context;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 60
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v2, "com.heytap.openid"

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

    .line 63
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return v1
.end method
