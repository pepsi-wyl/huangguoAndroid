.class public final synthetic Lcom/github/gzuliyujiang/oaid/IRegisterCallback$-CC;
.super Ljava/lang/Object;
.source "IRegisterCallback.java"


# direct methods
.method public static $default$onComplete(Lcom/github/gzuliyujiang/oaid/IRegisterCallback;)V
    .locals 2
    .param p0, "_this"    # Lcom/github/gzuliyujiang/oaid/IRegisterCallback;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 27
    const-string v0, ""

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lcom/github/gzuliyujiang/oaid/IRegisterCallback;->onComplete(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method

.method public static $default$onComplete(Lcom/github/gzuliyujiang/oaid/IRegisterCallback;Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0
    .param p0, "_this"    # Lcom/github/gzuliyujiang/oaid/IRegisterCallback;

    .line 0
    return-void
.end method
