.class public final Lcom/github/gzuliyujiang/oaid/DeviceID;
.super Ljava/lang/Object;
.source "DeviceID.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;
    }
.end annotation


# instance fields
.field private application:Landroid/app/Application;

.field private clientId:Ljava/lang/String;

.field private oaid:Ljava/lang/String;

.field private tryWidevine:Z


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 596
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/github/gzuliyujiang/oaid/DeviceID$1;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Lcom/github/gzuliyujiang/oaid/DeviceID;-><init>()V

    return-void
.end method

.method static synthetic access$002(Lcom/github/gzuliyujiang/oaid/DeviceID;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/DeviceID;->clientId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$102(Lcom/github/gzuliyujiang/oaid/DeviceID;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/github/gzuliyujiang/oaid/DeviceID;->oaid:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Ljava/lang/Exception;Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V
    .locals 0

    .line 51
    invoke-static {p0, p1, p2, p3}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getOtherId(Ljava/lang/Exception;Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V

    return-void
.end method

.method public static calculateHash(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 551
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_0

    return-object v1

    .line 555
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    .line 556
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    .line 557
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 558
    array-length v0, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_1

    aget-byte v4, p0, v3

    .line 559
    const-string v5, "%02x"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v4

    aput-object v4, v6, v2

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 561
    :cond_1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 563
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return-object v1
.end method

.method public static getAndroidID(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 341
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    .line 344
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v1, "android_id"

    invoke-static {p0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 345
    const-string v1, "9774d56d682e549c"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    move-object v0, p0

    :cond_2
    :goto_0
    return-object v0
.end method

.method public static getByGms(Landroid/content/Context;Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 2

    .line 275
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/impl/OAIDFactory;->ofGms(Landroid/content/Context;)Lcom/github/gzuliyujiang/oaid/IOAID;

    move-result-object p0

    .line 276
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OAID implements class: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 277
    invoke-interface {p0, p1}, Lcom/github/gzuliyujiang/oaid/IOAID;->doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V

    return-void
.end method

.method public static getByManufacturer(Landroid/content/Context;Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 2

    .line 251
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/impl/OAIDFactory;->ofManufacturer(Landroid/content/Context;)Lcom/github/gzuliyujiang/oaid/IOAID;

    move-result-object p0

    .line 252
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OAID implements class: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 253
    invoke-interface {p0, p1}, Lcom/github/gzuliyujiang/oaid/IOAID;->doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V

    return-void
.end method

.method public static getByMsa(Landroid/content/Context;Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 2

    .line 263
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/impl/OAIDFactory;->ofMsa(Landroid/content/Context;)Lcom/github/gzuliyujiang/oaid/IOAID;

    move-result-object p0

    .line 264
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OAID implements class: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 265
    invoke-interface {p0, p1}, Lcom/github/gzuliyujiang/oaid/IOAID;->doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V

    return-void
.end method

.method public static getCanvasFingerprint()Ljava/lang/String;
    .locals 10

    .line 574
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v7, 0xc8

    const/16 v8, 0x64

    invoke-static {v7, v8, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 575
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v2, -0x1

    .line 576
    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 577
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    const/high16 v3, -0x1000000

    .line 578
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v3, 0x41900000    # 18.0f

    .line 579
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 580
    sget-object v3, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    const/high16 v3, 0x41200000    # 10.0f

    const/high16 v4, 0x42480000    # 50.0f

    .line 581
    const-string v5, "\u7fa1\u6c11@\u674e\u88d5\u6c5f"

    invoke-virtual {v0, v5, v3, v4, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    const/16 v0, 0x4e20

    .line 582
    new-array v9, v0, [I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, 0x0

    move-object v2, v9

    move v4, v7

    .line 583
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 584
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 585
    aget v3, v9, v2

    .line 586
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 588
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SHA-1"

    invoke-static {v0, v1}, Lcom/github/gzuliyujiang/oaid/DeviceID;->calculateHash(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getClientId()Ljava/lang/String;
    .locals 1

    .line 182
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    iget-object v0, v0, Lcom/github/gzuliyujiang/oaid/DeviceID;->clientId:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 184
    const-string v0, ""

    :cond_0
    return-object v0
.end method

.method public static getClientIdMD5()Ljava/lang/String;
    .locals 2

    .line 196
    invoke-static {}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getClientId()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MD5"

    invoke-static {v0, v1}, Lcom/github/gzuliyujiang/oaid/DeviceID;->calculateHash(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getClientIdSHA1()Ljava/lang/String;
    .locals 2

    .line 206
    invoke-static {}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getClientId()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SHA-1"

    invoke-static {v0, v1}, Lcom/github/gzuliyujiang/oaid/DeviceID;->calculateHash(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getGUID(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 431
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getUuidFromSystemSettings(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 432
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 433
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getUuidFromExternalStorage(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 435
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 436
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getUuidFromSharedPreferences(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 438
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 439
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 440
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Generate uuid by random: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 441
    invoke-static {p0, v0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->saveUuidToSharedPreferences(Landroid/content/Context;Ljava/lang/String;)V

    .line 442
    invoke-static {p0, v0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->saveUuidToSystemSettings(Landroid/content/Context;Ljava/lang/String;)V

    .line 443
    invoke-static {p0, v0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->saveUuidToExternalStorage(Landroid/content/Context;Ljava/lang/String;)V

    :cond_2
    return-object v0
.end method

.method private static getGuidFile(Landroid/content/Context;)Ljava/io/File;
    .locals 2

    .line 513
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_0

    goto :goto_0

    .line 515
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_1

    goto :goto_1

    :cond_1
    if-eqz p0, :cond_2

    .line 518
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, v0}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_2

    .line 521
    :goto_0
    const-string p0, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 522
    new-instance p0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    const-string v1, "Android/.GUID_uuid"

    invoke-direct {p0, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object p0

    :cond_2
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getIMEI(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 314
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    .line 318
    :cond_0
    :try_start_0
    const-string v1, "phone"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 319
    invoke-static {p0}, Landroidx/tracing/Trace$$ExternalSyntheticApiModelOutline0;->m(Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object v1

    .line 320
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 321
    invoke-static {p0}, Landroidx/tracing/Trace$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-object v1

    :catch_0
    move-exception p0

    .line 328
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    goto :goto_0

    :catch_1
    move-exception p0

    .line 325
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    :goto_0
    return-object v0
.end method

.method public static getOAID()Ljava/lang/String;
    .locals 1

    .line 215
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    iget-object v0, v0, Lcom/github/gzuliyujiang/oaid/DeviceID;->oaid:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 217
    const-string v0, ""

    :cond_0
    return-object v0
.end method

.method public static getOAID(Landroid/content/Context;Lcom/github/gzuliyujiang/oaid/IGetter;)V
    .locals 2

    .line 229
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/impl/OAIDFactory;->create(Landroid/content/Context;)Lcom/github/gzuliyujiang/oaid/IOAID;

    move-result-object p0

    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "OAID implements class: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 231
    invoke-interface {p0, p1}, Lcom/github/gzuliyujiang/oaid/IOAID;->doGet(Lcom/github/gzuliyujiang/oaid/IGetter;)V

    return-void
.end method

.method private static getOAIDOrOtherId(Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V
    .locals 1

    .line 123
    new-instance v0, Lcom/github/gzuliyujiang/oaid/DeviceID$1;

    invoke-direct {v0, p2, p0, p1}, Lcom/github/gzuliyujiang/oaid/DeviceID$1;-><init>(Lcom/github/gzuliyujiang/oaid/IRegisterCallback;Landroid/app/Application;Z)V

    invoke-static {p0, v0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getOAID(Landroid/content/Context;Lcom/github/gzuliyujiang/oaid/IGetter;)V

    return-void
.end method

.method private static getOtherId(Ljava/lang/Exception;Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V
    .locals 1

    if-eqz p2, :cond_1

    .line 148
    invoke-static {}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getWidevineID()Ljava/lang/String;

    move-result-object p2

    .line 149
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 150
    sget-object p1, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    iput-object p2, p1, Lcom/github/gzuliyujiang/oaid/DeviceID;->clientId:Ljava/lang/String;

    .line 151
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Client id is WidevineID: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    if-eqz p3, :cond_0

    .line 153
    invoke-interface {p3, p2, p0}, Lcom/github/gzuliyujiang/oaid/IRegisterCallback;->onComplete(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_0
    return-void

    .line 158
    :cond_1
    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getAndroidID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    .line 159
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 160
    sget-object p1, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    iput-object p2, p1, Lcom/github/gzuliyujiang/oaid/DeviceID;->clientId:Ljava/lang/String;

    .line 161
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Client id is AndroidID: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    if-eqz p3, :cond_2

    .line 163
    invoke-interface {p3, p2, p0}, Lcom/github/gzuliyujiang/oaid/IRegisterCallback;->onComplete(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_2
    return-void

    .line 167
    :cond_3
    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getGUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 168
    sget-object p2, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    iput-object p1, p2, Lcom/github/gzuliyujiang/oaid/DeviceID;->clientId:Ljava/lang/String;

    .line 169
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Client id is GUID: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    if-eqz p3, :cond_4

    .line 171
    invoke-interface {p3, p1, p0}, Lcom/github/gzuliyujiang/oaid/IRegisterCallback;->onComplete(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_4
    return-void
.end method

.method public static getPseudoID()Ljava/lang/String;
    .locals 2

    .line 392
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 393
    sget-object v1, Landroid/os/Build;->BOARD:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 395
    sget-object v1, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 400
    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 401
    sget-object v1, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 402
    sget-object v1, Landroid/os/Build;->HOST:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 403
    sget-object v1, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 404
    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 405
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 406
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 407
    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 408
    sget-object v1, Landroid/os/Build;->BOOTLOADER:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 409
    sget-object v1, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 410
    sget-object v1, Landroid/os/Build;->TAGS:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 411
    sget-object v1, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 412
    sget-object v1, Landroid/os/Build;->USER:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 413
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUniqueID(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 293
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    const-string v2, ""

    if-lt v0, v1, :cond_0

    .line 295
    const-string p0, "IMEI/MEID not allowed on Android 10+"

    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return-object v2

    :cond_0
    if-nez p0, :cond_1

    return-object v2

    .line 301
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_2

    const-string v0, "android.permission.READ_PHONE_STATE"

    .line 302
    invoke-static {p0, v0}, Landroidx/activity/ComponentDialog$$ExternalSyntheticApiModelOutline0;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_2

    .line 304
    const-string p0, "android.permission.READ_PHONE_STATE not granted"

    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return-object v2

    .line 308
    :cond_2
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getIMEI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getUuidFromExternalStorage(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 474
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    .line 478
    :cond_0
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getGuidFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 480
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 481
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 482
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 480
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v1

    :try_start_4
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception p0

    .line 483
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 486
    :cond_1
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "Get uuid from external storage: "

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return-object v0
.end method

.method private static getUuidFromSharedPreferences(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 537
    const-string v0, ""

    if-nez p0, :cond_0

    return-object v0

    .line 540
    :cond_0
    const-string v1, "GUID"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 541
    const-string v1, "uuid"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 542
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Get uuid from shared preferences: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return-object p0
.end method

.method private static getUuidFromSystemSettings(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    if-nez p0, :cond_0

    .line 450
    const-string p0, ""

    return-object p0

    .line 452
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "GUID_uuid"

    invoke-static {p0, v0}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 453
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Get uuid from system settings: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return-object p0
.end method

.method public static getWidevineID()Ljava/lang/String;
    .locals 10
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 359
    const-string v0, ""

    const/4 v1, 0x0

    .line 363
    :try_start_0
    new-instance v2, Ljava/util/UUID;

    const-wide v3, -0x121074568629b532L    # -3.563403477674908E221

    const-wide v5, -0x5c37d8232ae2de13L

    invoke-direct {v2, v3, v4, v5, v6}, Ljava/util/UUID;-><init>(JJ)V

    .line 364
    new-instance v3, Landroid/media/MediaDrm;

    invoke-direct {v3, v2}, Landroid/media/MediaDrm;-><init>(Ljava/util/UUID;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 365
    :try_start_1
    const-string v1, "deviceUniqueId"

    invoke-virtual {v3, v1}, Landroid/media/MediaDrm;->getPropertyByteArray(Ljava/lang/String;)[B

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_0

    .line 379
    invoke-virtual {v3}, Landroid/media/MediaDrm;->release()V

    return-object v0

    .line 369
    :cond_0
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 370
    array-length v4, v1

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v4, :cond_1

    aget-byte v7, v1, v6

    .line 371
    const-string v8, "%02x"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v7

    aput-object v7, v9, v5

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 373
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 379
    invoke-virtual {v3}, Landroid/media/MediaDrm;->release()V

    return-object v0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catchall_1
    move-exception v2

    move-object v3, v1

    move-object v1, v2

    .line 375
    :goto_1
    :try_start_3
    invoke-static {v1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v3, :cond_2

    .line 379
    invoke-virtual {v3}, Landroid/media/MediaDrm;->release()V

    :cond_2
    return-object v0

    :catchall_2
    move-exception v0

    if-eqz v3, :cond_3

    invoke-virtual {v3}, Landroid/media/MediaDrm;->release()V

    .line 381
    :cond_3
    throw v0
.end method

.method public static register(Landroid/app/Application;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 65
    invoke-static {p0, v0, v1}, Lcom/github/gzuliyujiang/oaid/DeviceID;->register(Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V

    return-void
.end method

.method public static register(Landroid/app/Application;Lcom/github/gzuliyujiang/oaid/IRegisterCallback;)V
    .locals 1

    const/4 v0, 0x0

    .line 89
    invoke-static {p0, v0, p1}, Lcom/github/gzuliyujiang/oaid/DeviceID;->register(Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V

    return-void
.end method

.method public static register(Landroid/app/Application;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 77
    invoke-static {p0, p1, v0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->register(Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V

    return-void
.end method

.method public static register(Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V
    .locals 2

    if-nez p0, :cond_1

    if-eqz p2, :cond_0

    .line 104
    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "application is nulll"

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    const-string p1, ""

    invoke-interface {p2, p1, p0}, Lcom/github/gzuliyujiang/oaid/IRegisterCallback;->onComplete(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_0
    return-void

    .line 108
    :cond_1
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    iput-object p0, v0, Lcom/github/gzuliyujiang/oaid/DeviceID;->application:Landroid/app/Application;

    .line 109
    sget-object v0, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    iput-boolean p1, v0, Lcom/github/gzuliyujiang/oaid/DeviceID;->tryWidevine:Z

    .line 110
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getUniqueID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 111
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 112
    sget-object p0, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    iput-object v0, p0, Lcom/github/gzuliyujiang/oaid/DeviceID;->clientId:Ljava/lang/String;

    .line 113
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Client id is IMEI/MEID: "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object p1, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    iget-object p1, p1, Lcom/github/gzuliyujiang/oaid/DeviceID;->clientId:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    if-eqz p2, :cond_2

    const/4 p0, 0x0

    .line 115
    invoke-interface {p2, v0, p0}, Lcom/github/gzuliyujiang/oaid/IRegisterCallback;->onComplete(Ljava/lang/String;Ljava/lang/Exception;)V

    :cond_2
    return-void

    .line 119
    :cond_3
    invoke-static {p0, p1, p2}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getOAIDOrOtherId(Landroid/app/Application;ZLcom/github/gzuliyujiang/oaid/IRegisterCallback;)V

    return-void
.end method

.method private static saveUuidToExternalStorage(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    const-string v0, "Save uuid to external storage: "

    if-nez p0, :cond_0

    return-void

    .line 494
    :cond_0
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/DeviceID;->getGuidFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    if-nez p0, :cond_1

    .line 496
    const-string p0, "UUID file in external storage is null"

    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return-void

    .line 499
    :cond_1
    :try_start_0
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/FileWriter;

    invoke-direct {v2, p0}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 500
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2

    .line 501
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z

    .line 503
    :cond_2
    invoke-virtual {v1, p1}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 504
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->flush()V

    .line 505
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 506
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 499
    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    :try_start_4
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception p0

    .line 507
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    :goto_1
    return-void
.end method

.method private static saveUuidToSharedPreferences(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    .line 531
    :cond_0
    const-string v0, "GUID"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 532
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "uuid"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 533
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Save uuid to shared preferences: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    return-void
.end method

.method private static saveUuidToSystemSettings(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    const-string v0, "Save uuid to system settings: "

    if-nez p0, :cond_0

    return-void

    .line 461
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_2

    invoke-static {p0}, Landroidx/tracing/Trace$$ExternalSyntheticApiModelOutline0;->m(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 469
    :cond_1
    const-string p0, "android.permission.WRITE_SETTINGS not granted"

    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    goto :goto_1

    .line 463
    :cond_2
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v1, "GUID_uuid"

    invoke-static {p0, v1, p1}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 464
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 466
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    :goto_1
    return-void
.end method

.method public static supportedOAID(Landroid/content/Context;)Z
    .locals 0

    .line 241
    invoke-static {p0}, Lcom/github/gzuliyujiang/oaid/impl/OAIDFactory;->create(Landroid/content/Context;)Lcom/github/gzuliyujiang/oaid/IOAID;

    move-result-object p0

    invoke-interface {p0}, Lcom/github/gzuliyujiang/oaid/IOAID;->supported()Z

    move-result p0

    return p0
.end method
