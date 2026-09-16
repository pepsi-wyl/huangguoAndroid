.class Lcom/github/gzuliyujiang/oaid/impl/FreemeImpl$1;
.super Ljava/lang/Object;
.source "FreemeImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/gzuliyujiang/oaid/impl/FreemeImpl;->doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/gzuliyujiang/oaid/impl/FreemeImpl;


# direct methods
.method constructor <init>(Lcom/github/gzuliyujiang/oaid/impl/FreemeImpl;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/FreemeImpl$1;->this$0:Lcom/github/gzuliyujiang/oaid/impl/FreemeImpl;

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

    .line 64
    invoke-static {p1}, Lrepeackage/com/android/creator/IdsSupplier$Stub;->asInterface(Landroid/os/IBinder;)Lrepeackage/com/android/creator/IdsSupplier;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 68
    invoke-interface {p1}, Lrepeackage/com/android/creator/IdsSupplier;->getOAID()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 66
    :cond_0
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v0, "IdsSupplier is null"

    invoke-direct {p1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
