.class Lcom/github/gzuliyujiang/oaid/impl/GmsImpl$1;
.super Ljava/lang/Object;
.source "GmsImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/gzuliyujiang/oaid/impl/GmsImpl;->doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/gzuliyujiang/oaid/impl/GmsImpl;


# direct methods
.method constructor <init>(Lcom/github/gzuliyujiang/oaid/impl/GmsImpl;)V
    .locals 0

    .line 67
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/GmsImpl$1;->this$0:Lcom/github/gzuliyujiang/oaid/impl/GmsImpl;

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
    invoke-static {p1}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub;->asInterface(Landroid/os/IBinder;)Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;

    move-result-object p1

    const/4 v0, 0x1

    .line 71
    invoke-interface {p1, v0}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;->isLimitAdTrackingEnabled(Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 76
    invoke-interface {p1}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;->getId()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 72
    :cond_0
    const-string p1, "User has disabled advertising identifier"

    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 74
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v0, "AAID acquire failed"

    invoke-direct {p1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
