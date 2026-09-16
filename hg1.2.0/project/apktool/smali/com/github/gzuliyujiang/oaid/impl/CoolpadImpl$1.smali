.class Lcom/github/gzuliyujiang/oaid/impl/CoolpadImpl$1;
.super Ljava/lang/Object;
.source "CoolpadImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/gzuliyujiang/oaid/impl/CoolpadImpl;->doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/gzuliyujiang/oaid/impl/CoolpadImpl;


# direct methods
.method constructor <init>(Lcom/github/gzuliyujiang/oaid/impl/CoolpadImpl;)V
    .locals 0

    .line 67
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/CoolpadImpl$1;->this$0:Lcom/github/gzuliyujiang/oaid/impl/CoolpadImpl;

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

    .line 70
    invoke-static {p1}, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub;->asInterface(Landroid/os/IBinder;)Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 74
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/CoolpadImpl$1;->this$0:Lcom/github/gzuliyujiang/oaid/impl/CoolpadImpl;

    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/impl/CoolpadImpl;->access$000(Lcom/github/gzuliyujiang/oaid/impl/CoolpadImpl;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;->getOAID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 72
    :cond_0
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v0, "IDeviceIdManager is null"

    invoke-direct {p1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
