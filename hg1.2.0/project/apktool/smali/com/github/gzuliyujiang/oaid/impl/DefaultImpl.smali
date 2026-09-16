.class Lcom/github/gzuliyujiang/oaid/impl/DefaultImpl;
.super Ljava/lang/Object;
.source "DefaultImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/IOAID;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 35
    :cond_0
    new-instance v0, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v1, "Unsupported"

    invoke-direct {v0, v1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v0}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetError(Ljava/lang/Exception;)V

    return-void
.end method

.method public supported()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
