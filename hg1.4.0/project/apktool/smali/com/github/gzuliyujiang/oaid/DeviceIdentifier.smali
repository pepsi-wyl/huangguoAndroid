.class public final Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;
.super Ljava/lang/Object;
.source "DeviceIdentifier.java"


# static fields
.field private static volatile androidId:Ljava/lang/String; = null

.field private static volatile canvasFingerprint:Ljava/lang/String; = null

.field private static volatile clientId:Ljava/lang/String; = null

.field private static volatile guid:Ljava/lang/String; = null

.field private static volatile imei:Ljava/lang/String; = null

.field private static volatile oaid:Ljava/lang/String; = null

.field private static volatile pseudoId:Ljava/lang/String; = null

.field private static volatile registered:Z = false

.field private static volatile widevineId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$002(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 29
    sput-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->oaid:Ljava/lang/String;

    return-object p0
.end method

.method public static getAndroidID(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 199
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->androidId:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 200
    const-class v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;

    monitor-enter v0

    .line 201
    :try_start_0
    sget-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->androidId:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 202
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getAndroidID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->androidId:Ljava/lang/String;

    .line 204
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 206
    :cond_1
    :goto_0
    sget-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->androidId:Ljava/lang/String;

    if-nez p0, :cond_2

    .line 207
    const-string p0, ""

    sput-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->androidId:Ljava/lang/String;

    .line 209
    :cond_2
    sget-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->androidId:Ljava/lang/String;

    return-object p0
.end method

.method public static getCanvasFingerprint()Ljava/lang/String;
    .locals 2

    .line 283
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->canvasFingerprint:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 284
    const-class v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;

    monitor-enter v0

    .line 285
    :try_start_0
    sget-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->canvasFingerprint:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 286
    invoke-static {}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getCanvasFingerprint()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->canvasFingerprint:Ljava/lang/String;

    .line 288
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 290
    :cond_1
    :goto_0
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->canvasFingerprint:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 291
    const-string v0, ""

    sput-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->canvasFingerprint:Ljava/lang/String;

    .line 293
    :cond_2
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->canvasFingerprint:Ljava/lang/String;

    return-object v0
.end method

.method public static getClientId()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 107
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->getClientId(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getClientId(Z)Ljava/lang/String;
    .locals 2

    .line 121
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->clientId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 122
    const-class v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;

    monitor-enter v0

    .line 123
    :try_start_0
    sget-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->clientId:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    if-eqz p0, :cond_0

    .line 124
    invoke-static {}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getClientId()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getClientIdMD5()Ljava/lang/String;

    move-result-object p0

    :goto_0
    sput-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->clientId:Ljava/lang/String;

    .line 126
    :cond_1
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 128
    :cond_2
    :goto_1
    sget-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->clientId:Ljava/lang/String;

    if-nez p0, :cond_3

    .line 129
    const-string p0, ""

    sput-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->clientId:Ljava/lang/String;

    .line 131
    :cond_3
    sget-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->clientId:Ljava/lang/String;

    return-object p0
.end method

.method public static getGUID(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 266
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->guid:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 267
    const-class v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;

    monitor-enter v0

    .line 268
    :try_start_0
    sget-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->guid:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 269
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getGUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->guid:Ljava/lang/String;

    .line 271
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 273
    :cond_1
    :goto_0
    sget-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->guid:Ljava/lang/String;

    if-nez p0, :cond_2

    .line 274
    const-string p0, ""

    sput-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->guid:Ljava/lang/String;

    .line 276
    :cond_2
    sget-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->guid:Ljava/lang/String;

    return-object p0
.end method

.method public static getIMEI(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 147
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->imei:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 148
    const-class v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;

    monitor-enter v0

    .line 149
    :try_start_0
    sget-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->imei:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 150
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getUniqueID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->imei:Ljava/lang/String;

    .line 152
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 154
    :cond_1
    :goto_0
    sget-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->imei:Ljava/lang/String;

    if-nez p0, :cond_2

    .line 155
    const-string p0, ""

    sput-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->imei:Ljava/lang/String;

    .line 157
    :cond_2
    sget-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->imei:Ljava/lang/String;

    return-object p0
.end method

.method public static getOAID(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 166
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->oaid:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 167
    const-class v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;

    monitor-enter v0

    .line 168
    :try_start_0
    sget-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->oaid:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 169
    invoke-static {}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getOAID()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->oaid:Ljava/lang/String;

    .line 170
    sget-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->oaid:Ljava/lang/String;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->oaid:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 171
    :cond_0
    new-instance v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier$1;

    invoke-direct {v1}, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier$1;-><init>()V

    invoke-static {p0, v1}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getOAID(Landroid/content/Context;Lcom/github/gzuliyujiang/oaid/IGetter;)V

    .line 184
    :cond_1
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 186
    :cond_2
    :goto_0
    sget-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->oaid:Ljava/lang/String;

    if-nez p0, :cond_3

    .line 187
    const-string p0, ""

    sput-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->oaid:Ljava/lang/String;

    .line 189
    :cond_3
    sget-object p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->oaid:Ljava/lang/String;

    return-object p0
.end method

.method public static getPseudoID()Ljava/lang/String;
    .locals 2

    .line 238
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->pseudoId:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 239
    const-class v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;

    monitor-enter v0

    .line 240
    :try_start_0
    sget-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->pseudoId:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 241
    invoke-static {}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getPseudoID()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->pseudoId:Ljava/lang/String;

    .line 243
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 245
    :cond_1
    :goto_0
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->pseudoId:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 246
    const-string v0, ""

    sput-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->pseudoId:Ljava/lang/String;

    .line 248
    :cond_2
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->pseudoId:Ljava/lang/String;

    return-object v0
.end method

.method public static getWidevineID()Ljava/lang/String;
    .locals 2

    .line 218
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->widevineId:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 219
    const-class v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;

    monitor-enter v0

    .line 220
    :try_start_0
    sget-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->widevineId:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 222
    invoke-static {}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getWidevineID()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->widevineId:Ljava/lang/String;

    .line 224
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 226
    :cond_1
    :goto_0
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->widevineId:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 227
    const-string v0, ""

    sput-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->widevineId:Ljava/lang/String;

    .line 229
    :cond_2
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->widevineId:Ljava/lang/String;

    return-object v0
.end method

.method public static register(Landroid/app/Application;)V
    .locals 1

    const/4 v0, 0x0

    .line 52
    invoke-static {p0, v0}, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->register(Landroid/app/Application;Lcom/github/gzuliyujiang/oaid/IRegisterCallback;)V

    return-void
.end method

.method public static register(Landroid/app/Application;Lcom/github/gzuliyujiang/oaid/IRegisterCallback;)V
    .locals 1

    const/4 v0, 0x0

    .line 76
    invoke-static {p0, v0, p1}, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->register(Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V

    return-void
.end method

.method public static register(Landroid/app/Application;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 64
    invoke-static {p0, p1, v0}, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->register(Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V

    return-void
.end method

.method public static register(Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V
    .locals 2

    .line 89
    sget-boolean v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->registered:Z

    if-nez v0, :cond_2

    if-nez p0, :cond_0

    goto :goto_0

    .line 92
    :cond_0
    const-class v0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;

    monitor-enter v0

    .line 93
    :try_start_0
    sget-boolean v1, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->registered:Z

    if-nez v1, :cond_1

    .line 94
    invoke-static {p0, p1, p2}, Lcom/github/gzuliyujiang/oaid/DeviceID;->register(Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V

    const/4 p0, 0x1

    .line 95
    sput-boolean p0, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->registered:Z

    .line 97
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_2
    :goto_0
    return-void
.end method
