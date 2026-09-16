.class Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$3;
.super Ljava/lang/Object;
.source "HuaweiImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;

.field final synthetic val$e:Lcom/github/gzuliyujiang/oaid/OAIDException;

.field final synthetic val$getter:Lcom/github/gzuliyujiang/oaid/IGetter;


# direct methods
.method constructor <init>(Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/OAIDException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 113
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$3;->this$0:Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;

    iput-object p2, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$3;->val$getter:Lcom/github/gzuliyujiang/oaid/IGetter;

    iput-object p3, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$3;->val$e:Lcom/github/gzuliyujiang/oaid/OAIDException;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 116
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$3;->val$getter:Lcom/github/gzuliyujiang/oaid/IGetter;

    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$3;->val$e:Lcom/github/gzuliyujiang/oaid/OAIDException;

    invoke-interface {v0, v1}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetError(Ljava/lang/Exception;)V

    return-void
.end method
