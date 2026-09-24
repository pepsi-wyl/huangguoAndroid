.class Lcom/github/gzuliyujiang/oaid/impl/MsaImpl$1;
.super Ljava/lang/Object;
.source "MsaImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/gzuliyujiang/oaid/impl/MsaImpl;->doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/gzuliyujiang/oaid/impl/MsaImpl;


# direct methods
.method constructor <init>(Lcom/github/gzuliyujiang/oaid/impl/MsaImpl;)V
    .locals 0

    .line 63
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/MsaImpl$1;->this$0:Lcom/github/gzuliyujiang/oaid/impl/MsaImpl;

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

    .line 66
    invoke-static {p1}, Lrepeackage/com/bun/lib/MsaIdInterface$Stub;->asInterface(Landroid/os/IBinder;)Lrepeackage/com/bun/lib/MsaIdInterface;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 70
    invoke-interface {p1}, Lrepeackage/com/bun/lib/MsaIdInterface;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    invoke-interface {p1}, Lrepeackage/com/bun/lib/MsaIdInterface;->getOAID()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 71
    :cond_0
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v0, "MsaIdInterface#isSupported return false"

    invoke-direct {p1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 68
    :cond_1
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v0, "MsaIdInterface is null"

    invoke-direct {p1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
