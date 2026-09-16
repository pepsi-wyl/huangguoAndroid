.class Lcom/github/gzuliyujiang/oaid/impl/AsusImpl$1;
.super Ljava/lang/Object;
.source "AsusImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/gzuliyujiang/oaid/impl/AsusImpl;->doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/gzuliyujiang/oaid/impl/AsusImpl;


# direct methods
.method constructor <init>(Lcom/github/gzuliyujiang/oaid/impl/AsusImpl;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/AsusImpl$1;->this$0:Lcom/github/gzuliyujiang/oaid/impl/AsusImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public callRemoteInterface(Landroid/os/IBinder;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/github/gzuliyujiang/oaid/OAIDException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 65
    invoke-static {p1}, Lrepeackage/com/asus/msa/SupplementaryDID/IDidAidlInterface$Stub;->asInterface(Landroid/os/IBinder;)Lrepeackage/com/asus/msa/SupplementaryDID/IDidAidlInterface;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 69
    invoke-interface {p1}, Lrepeackage/com/asus/msa/SupplementaryDID/IDidAidlInterface;->isSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 72
    invoke-interface {p1}, Lrepeackage/com/asus/msa/SupplementaryDID/IDidAidlInterface;->getOAID()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 70
    :cond_0
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v0, "IDidAidlInterface#isSupport return false"

    invoke-direct {p1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 67
    :cond_1
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v0, "IDidAidlInterface is null"

    invoke-direct {p1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
