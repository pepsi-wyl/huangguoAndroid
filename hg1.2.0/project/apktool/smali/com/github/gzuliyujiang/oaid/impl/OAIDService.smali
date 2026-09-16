.class Lcom/github/gzuliyujiang/oaid/impl/OAIDService;
.super Ljava/lang/Object;
.source "OAIDService.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;
    }
.end annotation


# instance fields
.field private final caller:Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;

.field private final context:Landroid/content/Context;

.field private final getter:Lcom/github/gzuliyujiang/oaid/IGetter;


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;)V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    instance-of v0, p1, Landroid/app/Application;

    if-eqz v0, :cond_0

    .line 45
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->context:Landroid/content/Context;

    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->context:Landroid/content/Context;

    .line 49
    :goto_0
    iput-object p2, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->getter:Lcom/github/gzuliyujiang/oaid/IGetter;

    .line 50
    iput-object p3, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->caller:Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;

    return-void
.end method

.method public static bind(Landroid/content/Context;Landroid/content/Intent;Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;)V
    .locals 1

    .line 40
    new-instance v0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;

    invoke-direct {v0, p0, p2, p3}, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;-><init>(Landroid/content/Context;Lcom/github/gzuliyujiang/oaid/IGetter;Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;)V

    invoke-direct {v0, p1}, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->bind(Landroid/content/Intent;)V

    return-void
.end method

.method private bind(Landroid/content/Intent;)V
    .locals 3

    const-string v0, "Service has been bound: "

    .line 55
    :try_start_0
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->context:Landroid/content/Context;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, p0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    goto :goto_0

    .line 57
    :cond_0
    new-instance p1, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v0, "Service binding failed"

    invoke-direct {p1, v0}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 61
    iget-object v0, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->getter:Lcom/github/gzuliyujiang/oaid/IGetter;

    invoke-interface {v0, p1}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetError(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 4

    const-string v0, "Service has been unbound: "

    const-string v1, "OAID/AAID acquire success: "

    .line 67
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Service has been connected: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 69
    :try_start_0
    iget-object v2, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->caller:Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;

    invoke-interface {v2, p2}, Lcom/github/gzuliyujiang/oaid/impl/OAIDService$RemoteCaller;->callRemoteInterface(Landroid/os/IBinder;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 70
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 73
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 74
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->getter:Lcom/github/gzuliyujiang/oaid/IGetter;

    invoke-interface {v1, p2}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetComplete(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    :try_start_1
    iget-object p2, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->context:Landroid/content/Context;

    invoke-virtual {p2, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 81
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 71
    :cond_0
    :try_start_2
    new-instance p2, Lcom/github/gzuliyujiang/oaid/OAIDException;

    const-string v1, "OAID/AAID acquire failed"

    invoke-direct {p2, v1}, Lcom/github/gzuliyujiang/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p2

    goto :goto_1

    :catch_0
    move-exception p2

    .line 76
    :try_start_3
    invoke-static {p2}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 77
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->getter:Lcom/github/gzuliyujiang/oaid/IGetter;

    invoke-interface {v1, p2}, Lcom/github/gzuliyujiang/oaid/IGetter;->onOAIDGetError(Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 80
    :try_start_4
    iget-object p2, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->context:Landroid/content/Context;

    invoke-virtual {p2, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 81
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 83
    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    :goto_0
    return-void

    .line 80
    :goto_1
    :try_start_5
    iget-object v1, p0, Lcom/github/gzuliyujiang/oaid/impl/OAIDService;->context:Landroid/content/Context;

    invoke-virtual {v1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 81
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_2

    :catch_2
    move-exception p1

    .line 83
    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 85
    :goto_2
    throw p2
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Service has been disconnected: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return-void
.end method
