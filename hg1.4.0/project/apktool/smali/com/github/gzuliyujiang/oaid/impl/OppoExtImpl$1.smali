.class Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl$1;
.super Ljava/lang/Object;
.source "OppoExtImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;->doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;


# direct methods
.method constructor <init>(Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;)V
    .locals 0

    .line 66
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl$1;->this$0:Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;

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
    :try_start_0
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl$1;->this$0:Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;

    invoke-virtual {v0, p1}, Lcom/github/gzuliyujiang/oaid/impl/OppoExtImpl;->realGetOUID(Landroid/os/IBinder;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lcom/github/gzuliyujiang/oaid/OAIDException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 74
    new-instance v0, Lcom/github/gzuliyujiang/oaid/OAIDException;

    invoke-direct {v0, p1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p1

    goto :goto_0

    :catch_2
    move-exception p1

    .line 72
    :goto_0
    throw p1
.end method
