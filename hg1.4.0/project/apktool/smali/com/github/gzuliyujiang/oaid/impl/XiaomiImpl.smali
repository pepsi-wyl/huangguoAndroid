.class Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;
.super Ljava/lang/Object;
.source "XiaomiImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/IOAID;


# instance fields
.field private final context:Landroid/content/Context;

.field private idProviderClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private idProviderImpl:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;->context:Landroid/content/Context;

    .line 42
    :try_start_0
    const-string p1, "com.android.id.impl.IdProviderImpl"

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;->idProviderClass:Ljava/lang/Class;

    .line 43
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;->idProviderImpl:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 45
    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method private getOAID()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;->idProviderClass:Ljava/lang/Class;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "getOAID"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 78
    iget-object v2, p0, Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;->idProviderImpl:Ljava/lang/Object;

    iget-object v3, p0, Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;->context:Landroid/content/Context;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v3, v1, v4

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 3

    const-string v0, "OAID query success: "

    .line 56
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;->context:Landroid/content/Context;

    if-eqz v1, :cond_4

    if-nez p1, :cond_0

    goto :goto_2

    .line 59
    :cond_0
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;->idProviderClass:Ljava/lang/Class;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;->idProviderImpl:Ljava/lang/Object;

    if-nez v1, :cond_1

    goto :goto_1

    .line 64
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;->getOAID()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 65
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_2

    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 69
    invoke-interface {p1, v1}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetComplete(Ljava/lang/String;)V

    goto :goto_0

    .line 66
    :cond_2
    new-instance v0, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v1, "OAID query failed"

    invoke-direct {v0, v1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .line 71
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 72
    invoke-interface {p1, v0}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetError(Ljava/lang/Exception;)V

    :goto_0
    return-void

    .line 60
    :cond_3
    :goto_1
    new-instance v0, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v1, "Xiaomi IdProvider not exists"

    invoke-direct {v0, v1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v0}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetError(Ljava/lang/Exception;)V

    :cond_4
    :goto_2
    return-void
.end method

.method public supported()Z
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/XiaomiImpl;->idProviderImpl:Ljava/lang/Object;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
