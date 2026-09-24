.class public Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;
.super Ljava/lang/Object;
.source "VideoThumbnailPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# static fields
.field private static final TAG:Ljava/lang/String; = "ThumbnailPlugin"


# instance fields
.field private channel:Lio/flutter/plugin/common/MethodChannel;

.field private context:Landroid/content/Context;

.field private executor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private buildThumbnailData(Ljava/lang/String;Ljava/util/Map;IIIII)[B
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;IIIII)[B"
        }
    .end annotation

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p4

    move v4, p5

    move v5, p6

    .line 120
    invoke-virtual/range {v0 .. v5}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->createVideoThumbnail(Ljava/lang/String;Ljava/util/Map;III)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 122
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 124
    new-instance p2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 125
    invoke-static {p3}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->intToFormat(I)Landroid/graphics/Bitmap$CompressFormat;

    move-result-object p3

    invoke-virtual {p1, p3, p7, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 126
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 127
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    return-object p1
.end method

.method private buildThumbnailFile(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;IIIII)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "IIIII)",
            "Ljava/lang/String;"
        }
    .end annotation

    move-object v0, p1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    .line 135
    invoke-direct/range {v1 .. v8}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->buildThumbnailData(Ljava/lang/String;Ljava/util/Map;IIIII)[B

    move-result-object v1

    .line 136
    invoke-static {p4}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->formatExt(I)Ljava/lang/String;

    move-result-object v2

    .line 137
    const-string v3, "."

    invoke-virtual {p1, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    .line 138
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x1

    add-int/2addr v3, v5

    const/4 v6, 0x0

    invoke-virtual {p1, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 139
    const-string v4, "/"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    const-string v7, "file://"

    invoke-virtual {p1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-nez p3, :cond_2

    if-nez v0, :cond_2

    move-object v7, p0

    .line 142
    iget-object v0, v7, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_2
    move-object v7, p0

    move-object v0, p3

    :goto_2
    if-eqz v0, :cond_5

    .line 146
    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    move-object v3, v0

    goto :goto_3

    .line 150
    :cond_3
    invoke-virtual {v3, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    .line 152
    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 153
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/2addr v2, v5

    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 155
    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 161
    :cond_5
    :goto_3
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 162
    invoke-virtual {v0, v1}, Ljava/io/FileOutputStream;->write([B)V

    .line 163
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 164
    const-string v0, "ThumbnailPlugin"

    const-string v2, "buildThumbnailFile( written:%d )"

    new-array v4, v5, [Ljava/lang/Object;

    array-length v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v6

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    move-exception v0

    .line 166
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 167
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static formatExt(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    .line 108
    const-string p0, "jpg"

    return-object p0

    .line 112
    :cond_0
    const-string p0, "webp"

    return-object p0

    .line 110
    :cond_1
    const-string p0, "png"

    return-object p0
.end method

.method private static intToFormat(I)Landroid/graphics/Bitmap$CompressFormat;
    .locals 1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    .line 96
    sget-object p0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    return-object p0

    .line 100
    :cond_0
    invoke-static {}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m()Landroid/graphics/Bitmap$CompressFormat;

    move-result-object p0

    return-object p0

    .line 98
    :cond_1
    sget-object p0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    return-object p0
.end method

.method static synthetic lambda$onResult$1(ZLio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/Exception;Ljava/lang/Object;)V
    .locals 0

    if-nez p0, :cond_0

    .line 175
    invoke-interface {p1}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    return-void

    :cond_0
    if-eqz p2, :cond_1

    .line 180
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    .line 181
    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    const-string p3, "exception"

    invoke-interface {p1, p3, p0, p2}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 185
    :cond_1
    invoke-interface {p1, p3}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method

.method private onResult(Lio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/Object;ZLjava/lang/Exception;)V
    .locals 1

    .line 173
    new-instance v0, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin$$ExternalSyntheticLambda3;

    invoke-direct {v0, p3, p1, p4, p2}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin$$ExternalSyntheticLambda3;-><init>(ZLio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/Exception;Ljava/lang/Object;)V

    invoke-static {v0}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static runOnUiThread(Ljava/lang/Runnable;)V
    .locals 2

    .line 190
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private static setDataSource(Ljava/lang/String;Landroid/media/MediaMetadataRetriever;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 251
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 252
    new-instance p0, Ljava/io/FileInputStream;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 253
    :try_start_0
    invoke-virtual {p0}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/io/FileDescriptor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 254
    invoke-virtual {p0}, Ljava/io/FileInputStream;->close()V

    return-void

    :catchall_0
    move-exception p1

    .line 252
    :try_start_1
    invoke-virtual {p0}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p1
.end method


# virtual methods
.method public createVideoThumbnail(Ljava/lang/String;Ljava/util/Map;III)Landroid/graphics/Bitmap;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;III)",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    .line 204
    new-instance v6, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v6}, Landroid/media/MediaMetadataRetriever;-><init>()V

    const/4 v7, 0x0

    .line 206
    :try_start_0
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    invoke-static {p1, v6}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->setDataSource(Ljava/lang/String;Landroid/media/MediaMetadataRetriever;)V

    goto :goto_1

    .line 208
    :cond_0
    const-string v0, "file://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p2, 0x7

    .line 209
    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v6}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->setDataSource(Ljava/lang/String;Landroid/media/MediaMetadataRetriever;)V

    goto :goto_1

    :cond_1
    if-eqz p2, :cond_2

    goto :goto_0

    .line 211
    :cond_2
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    :goto_0
    invoke-virtual {v6, p1, p2}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;Ljava/util/Map;)V

    :goto_1
    const/4 p1, 0x3

    const-wide/16 v0, 0x3e8

    if-nez p3, :cond_4

    if-eqz p4, :cond_3

    goto :goto_2

    :cond_3
    int-to-long p2, p5

    mul-long p2, p2, v0

    .line 235
    invoke-virtual {v6, p2, p3, p1}, Landroid/media/MediaMetadataRetriever;->getFrameAtTime(JI)Landroid/graphics/Bitmap;

    move-result-object p1

    goto/16 :goto_3

    .line 215
    :cond_4
    :goto_2
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1b

    if-lt p2, v2, :cond_5

    if-eqz p3, :cond_5

    if-eqz p4, :cond_5

    int-to-long p1, p5

    mul-long v1, p1, v0

    const/4 v3, 0x3

    move-object v0, v6

    move v4, p4

    move v5, p3

    .line 217
    invoke-static/range {v0 .. v5}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/MediaMetadataRetriever;JIII)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_3

    :cond_5
    int-to-long v2, p5

    mul-long v2, v2, v0

    .line 220
    invoke-virtual {v6, v2, v3, p1}, Landroid/media/MediaMetadataRetriever;->getFrameAtTime(JI)Landroid/graphics/Bitmap;

    move-result-object v7

    if-eqz v7, :cond_8

    .line 222
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    .line 223
    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p5

    if-nez p4, :cond_6

    int-to-float p4, p3

    int-to-float v0, p5

    div-float/2addr p4, v0

    int-to-float v0, p2

    mul-float p4, p4, v0

    .line 225
    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p4

    :cond_6
    if-nez p3, :cond_7

    int-to-float p3, p4

    int-to-float v0, p2

    div-float/2addr p3, v0

    int-to-float v0, p5

    mul-float p3, p3, v0

    .line 228
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    .line 230
    :cond_7
    const-string v0, "ThumbnailPlugin"

    const-string v1, "original w:%d, h:%d => %d, %d"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 p5, 0x1

    aput-object p2, v2, p5

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v3, 0x2

    aput-object p2, v2, v3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v2, p1

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    invoke-static {v7, p4, p3, p5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :cond_8
    move-object p1, v7

    .line 241
    :goto_3
    :try_start_1
    invoke-virtual {v6}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_8

    :catch_0
    move-exception p2

    goto :goto_4

    :catch_1
    move-exception p2

    .line 243
    :goto_4
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_8

    :catchall_0
    move-exception p1

    goto :goto_9

    :catch_2
    move-exception p1

    goto :goto_5

    :catch_3
    move-exception p1

    .line 238
    :goto_5
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 241
    :try_start_3
    invoke-virtual {v6}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    goto :goto_7

    :catch_4
    move-exception p1

    goto :goto_6

    :catch_5
    move-exception p1

    .line 243
    :goto_6
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_7
    move-object p1, v7

    :goto_8
    return-object p1

    .line 241
    :goto_9
    :try_start_4
    invoke-virtual {v6}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_7
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6

    goto :goto_b

    :catch_6
    move-exception p2

    goto :goto_a

    :catch_7
    move-exception p2

    .line 243
    :goto_a
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    .line 245
    :goto_b
    throw p1
.end method

.method synthetic lambda$onMethodCall$0$com-rocksti-get_thumbnail_video-VideoThumbnailPlugin(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;IIIIILio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 15

    .line 0
    move-object/from16 v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 75
    :try_start_0
    const-string v3, "file"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_0

    .line 76
    const-string v0, "path"

    move-object/from16 v3, p2

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Ljava/lang/String;

    move-object v5, p0

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move/from16 v9, p5

    move/from16 v10, p6

    move/from16 v11, p7

    move/from16 v12, p8

    move/from16 v13, p9

    .line 77
    invoke-direct/range {v5 .. v13}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->buildThumbnailFile(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;IIIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 80
    :cond_0
    const-string v3, "data"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    move-object v5, p0

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    move/from16 v12, p9

    .line 81
    invoke-direct/range {v5 .. v12}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->buildThumbnailData(Ljava/lang/String;Ljava/util/Map;IIIII)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    move-object v0, v1

    :goto_1
    move-object v3, p0

    move-object/from16 v4, p10

    move-object v14, v1

    move-object v1, v0

    move-object v0, v14

    goto :goto_2

    :catch_0
    move-exception v0

    move-object v3, p0

    move-object/from16 v4, p10

    .line 88
    :goto_2
    invoke-direct {p0, v4, v1, v2, v0}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->onResult(Lio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/Object;ZLjava/lang/Exception;)V

    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 2

    .line 40
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->context:Landroid/content/Context;

    .line 41
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->executor:Ljava/util/concurrent/ExecutorService;

    .line 42
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    const-string v1, "video_thumbnail"

    invoke-direct {v0, p1, v1}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 43
    invoke-virtual {v0, p0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 48
    iget-object p1, p0, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 49
    iput-object v0, p0, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->channel:Lio/flutter/plugin/common/MethodChannel;

    .line 50
    iget-object p1, p0, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 51
    iput-object v0, p0, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->executor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 13

    .line 56
    invoke-virtual {p1}, Lio/flutter/plugin/common/MethodCall;->arguments()Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Ljava/util/Map;

    .line 59
    const-string v0, "headers"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Ljava/util/Map;

    .line 61
    const-string v0, "video"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    .line 62
    const-string v0, "format"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 63
    const-string v0, "maxh"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 64
    const-string v0, "maxw"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 65
    const-string v0, "timeMs"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 66
    const-string v0, "quality"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 67
    iget-object v3, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    .line 69
    iget-object p1, p0, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin$$ExternalSyntheticLambda2;

    move-object v1, v0

    move-object v2, p0

    move-object v12, p2

    invoke-direct/range {v1 .. v12}, Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin$$ExternalSyntheticLambda2;-><init>(Lcom/rocksti/get_thumbnail_video/VideoThumbnailPlugin;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;IIIIILio/flutter/plugin/common/MethodChannel$Result;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
