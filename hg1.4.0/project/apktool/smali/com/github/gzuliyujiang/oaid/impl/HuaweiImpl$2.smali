.class Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$2;
.super Ljava/lang/Object;
.source "HuaweiImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;->postOnMainThread(Lcom/github/gzuliyujiang/oaid/IGetter;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;

.field final synthetic val$getter:Lcom/github/gzuliyujiang/oaid/IGetter;

.field final synthetic val$oaid:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;Lcom/github/gzuliyujiang/oaid/IGetter;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 104
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$2;->this$0:Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl;

    iput-object p2, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$2;->val$getter:Lcom/github/gzuliyujiang/oaid/IGetter;

    iput-object p3, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$2;->val$oaid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 107
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$2;->val$getter:Lcom/github/gzuliyujiang/oaid/IGetter;

    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/HuaweiImpl$2;->val$oaid:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetComplete(Ljava/lang/String;)V

    return-void
.end method
