.class Lcom/github/gzuliyujiang/oaid/impl/NubiaImpl;
.super Ljava/lang/Object;
.source "NubiaImpl.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/IOAID;


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/NubiaImpl;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 7

    const-string v0, "OAID query success: "

    const-string v1, "OAID query failed: "

    .line 46
    iget-object v2, p0, Lcom/github/gzuliyujiang/oaid/impl/NubiaImpl;->context:Landroid/content/Context;

    if-eqz v2, :cond_7

    if-nez p1, :cond_0

    goto/16 :goto_1

    .line 49
    :cond_0
    invoke-virtual {p0}, Lcom/github/gzuliyujiang/oaid/impl/NubiaImpl;->supported()Z

    move-result v2

    if-nez v2, :cond_1

    .line 51
    const-string v0, "Only supports Android 10.0 and above for Nubia"

    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 52
    new-instance v1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    invoke-direct {v1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v1}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetError(Ljava/lang/Exception;)V

    return-void

    .line 57
    :cond_1
    :try_start_0
    const-string v2, "content://cn.nubia.identity/identity"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 58
    iget-object v3, p0, Lcom/github/gzuliyujiang/oaid/impl/NubiaImpl;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/ContentResolver;->acquireContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    move-result-object v2

    if-nez v2, :cond_2

    return-void

    .line 62
    :cond_2
    const-string v3, "getOAID"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v4}, Landroid/content/ContentProviderClient;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v3

    .line 63
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x18

    if-lt v5, v6, :cond_3

    .line 64
    invoke-virtual {v2}, Landroid/content/ContentProviderClient;->release()Z

    goto :goto_0

    .line 66
    :cond_3
    invoke-virtual {v2}, Landroid/content/ContentProviderClient;->release()Z

    :goto_0
    if-eqz v3, :cond_6

    .line 71
    const-string v2, "code"

    const/4 v5, -0x1

    invoke-virtual {v3, v2, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-nez v2, :cond_4

    .line 72
    const-string v2, "id"

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_4
    if-eqz v4, :cond_5

    .line 74
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_5

    .line 77
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 78
    invoke-interface {p1, v4}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetComplete(Ljava/lang/String;)V

    goto :goto_1

    .line 75
    :cond_5
    new-instance v0, Lcom/github/gzuliyujiang/oaid/OAIDException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "message"

    invoke-virtual {v3, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_6
    new-instance v0, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v1, "OAID query failed: bundle is null"

    invoke-direct {v0, v1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    .line 80
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 81
    invoke-interface {p1, v0}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetError(Ljava/lang/Exception;)V

    :cond_7
    :goto_1
    return-void
.end method

.method public supported()Z
    .locals 2

    .line 41
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
