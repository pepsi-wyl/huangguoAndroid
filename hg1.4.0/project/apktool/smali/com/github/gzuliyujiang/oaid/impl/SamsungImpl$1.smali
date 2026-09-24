.class Lcom/github/gzuliyujiang/oaid/impl/SamsungImpl$1;
.super Ljava/lang/Object;
.source "SamsungImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/gzuliyujiang/oaid/impl/SamsungImpl;->doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/gzuliyujiang/oaid/impl/SamsungImpl;


# direct methods
.method constructor <init>(Lcom/github/gzuliyujiang/oaid/impl/SamsungImpl;)V
    .locals 0

    .line 60
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/SamsungImpl$1;->this$0:Lcom/github/gzuliyujiang/oaid/impl/SamsungImpl;

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

    .line 63
    invoke-static {p1}, Lrepeackage/com/samsung/android/deviceidservice/IDeviceIdService$Stub;->asInterface(Landroid/os/IBinder;)Lrepeackage/com/samsung/android/deviceidservice/IDeviceIdService;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 67
    invoke-interface {p1}, Lrepeackage/com/samsung/android/deviceidservice/IDeviceIdService;->getOAID()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 65
    :cond_0
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v0, "IDeviceIdService is null"

    invoke-direct {p1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
