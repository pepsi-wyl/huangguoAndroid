.class Lcom/github/gzuliyujiang/oaid/DeviceID$1;
.super Ljava/lang/Object;
.source "DeviceID.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/IGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/gzuliyujiang/oaid/DeviceID;->getOAIDOrOtherId(Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$application:Landroid/app/Application;

.field final synthetic val$callback:Lcom/github/gzuliyujiang/oaid/IRegisterCallback;

.field final synthetic val$tryWidevine:Z


# direct methods
.method constructor <init>(Lcom/github/gzuliyujiang/oaid/IRegisterCallback;Landroid/app/Application;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 123
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/DeviceID$1;->val$callback:Lcom/github/gzuliyujiang/oaid/IRegisterCallback;

    iput-object p2, p0, Lcom/github/gzuliyujiang/oaid/DeviceID$1;->val$application:Landroid/app/Application;

    iput-boolean p3, p0, Lcom/github/gzuliyujiang/oaid/DeviceID$1;->val$tryWidevine:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onOAIDGetComplete(Ljava/lang/String;)V
    .locals 2

    .line 126
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 127
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v0, "OAID is empty"

    invoke-direct {p1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/github/gzuliyujiang/oaid/DeviceID$1;->onOAIDGetError(Ljava/lang/Exception;)V

    return-void

    .line 130
    :cond_0
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    invoke-static {v0, p1}, Lcom/github/gzuliyujiang/oaid/DeviceID;->access$002(Lcom/github/gzuliyujiang/oaid/DeviceID;Ljava/lang/String;)Ljava/lang/String;

    .line 131
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    invoke-static {v0, p1}, Lcom/github/gzuliyujiang/oaid/DeviceID;->access$102(Lcom/github/gzuliyujiang/oaid/DeviceID;Ljava/lang/String;)Ljava/lang/String;

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Client id is OAID/AAID: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 133
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/DeviceID$1;->val$callback:Lcom/github/gzuliyujiang/oaid/IRegisterCallback;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    .line 134
    invoke-interface {v0, p1, v1}, Lcom/github/gzuliyujiang/oaid/IRegisterCallback;->onComplete(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_1
    return-void
.end method

.method public onOAIDGetError(Ljava/lang/Exception;)V
    .locals 3

    .line 140
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/DeviceID$1;->val$application:Landroid/app/Application;

    iget-boolean v1, p0, Lcom/github/gzuliyujiang/oaid/DeviceID$1;->val$tryWidevine:Z

    iget-object v2, p0, Lcom/github/gzuliyujiang/oaid/DeviceID$1;->val$callback:Lcom/github/gzuliyujiang/oaid/IRegisterCallback;

    invoke-static {p1, v0, v1, v2}, Lcom/github/gzuliyujiang/oaid/DeviceID;->access$200(Ljava/lang/Exception;Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V

    return-void
.end method
