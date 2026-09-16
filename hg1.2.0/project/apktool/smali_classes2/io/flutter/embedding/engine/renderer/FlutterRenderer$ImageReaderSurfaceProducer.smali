.class final Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;
.super Ljava/lang/Object;
.source "FlutterRenderer.java"

# interfaces
.implements Lio/flutter/view/TextureRegistry$SurfaceProducer;
.implements Lio/flutter/view/TextureRegistry$ImageConsumer;
.implements Lio/flutter/view/TextureRegistry$OnTrimMemoryListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/renderer/FlutterRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ImageReaderSurfaceProducer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;,
        Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;
    }
.end annotation


# static fields
.field private static final CLEANUP_ON_MEMORY_PRESSURE:Z = true

.field private static final MAX_IMAGES:I = 0x5

.field private static final TAG:Ljava/lang/String; = "ImageReaderSurfaceProducer"

.field private static final VERBOSE_LOGS:Z = false


# instance fields
.field private createNewReader:Z

.field private final id:J

.field private ignoringFence:Z

.field private final imageReaderQueue:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;",
            ">;"
        }
    .end annotation
.end field

.field private lastDequeueTime:J

.field private lastDequeuedImage:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;

.field private lastQueueTime:J

.field private lastReaderDequeuedFrom:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

.field private lastScheduleTime:J

.field private lock:Ljava/lang/Object;

.field private numTrims:I

.field private final perImageReaders:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/media/ImageReader;",
            "Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;",
            ">;"
        }
    .end annotation
.end field

.field private released:Z

.field private requestedHeight:I

.field private requestedWidth:I

.field final synthetic this$0:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

.field private trimOnMemoryPressure:Z


# direct methods
.method constructor <init>(Lio/flutter/embedding/engine/renderer/FlutterRenderer;J)V
    .locals 2

    .line 728
    iput-object p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->this$0:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 427
    iput-boolean p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->ignoringFence:Z

    const/4 v0, 0x1

    .line 429
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->trimOnMemoryPressure:Z

    .line 432
    iput v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedWidth:I

    .line 433
    iput v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedHeight:I

    .line 438
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->createNewReader:Z

    const-wide/16 v0, 0x0

    .line 441
    iput-wide v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastDequeueTime:J

    .line 442
    iput-wide v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastQueueTime:J

    .line 443
    iput-wide v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastScheduleTime:J

    .line 444
    iput p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->numTrims:I

    .line 446
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lock:Ljava/lang/Object;

    .line 448
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->imageReaderQueue:Ljava/util/ArrayDeque;

    .line 449
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->perImageReaders:Ljava/util/HashMap;

    const/4 p1, 0x0

    .line 451
    iput-object p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastDequeuedImage:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;

    .line 452
    iput-object p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastReaderDequeuedFrom:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    .line 729
    iput-wide p2, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->id:J

    return-void
.end method

.method static synthetic access$500(Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;)Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;
    .locals 0

    .line 409
    iget-object p0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastReaderDequeuedFrom:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    return-object p0
.end method

.method static synthetic access$600(Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;)Z
    .locals 0

    .line 409
    iget-boolean p0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->released:Z

    return p0
.end method

.method private cleanup()V
    .locals 5

    .line 681
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 682
    :try_start_0
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->perImageReaders:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    .line 683
    iget-object v4, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastReaderDequeuedFrom:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    if-ne v4, v2, :cond_0

    .line 684
    iput-object v3, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastReaderDequeuedFrom:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    .line 686
    :cond_0
    invoke-virtual {v2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;->close()V

    goto :goto_0

    .line 688
    :cond_1
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->perImageReaders:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 689
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastDequeuedImage:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;

    if-eqz v1, :cond_2

    .line 690
    iget-object v1, v1, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;->image:Landroid/media/Image;

    invoke-virtual {v1}, Landroid/media/Image;->close()V

    .line 691
    iput-object v3, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastDequeuedImage:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;

    .line 693
    :cond_2
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastReaderDequeuedFrom:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    if-eqz v1, :cond_3

    .line 694
    invoke-virtual {v1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;->close()V

    .line 695
    iput-object v3, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastReaderDequeuedFrom:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    .line 697
    :cond_3
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->imageReaderQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->clear()V

    .line 698
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private createImageReader()Landroid/media/ImageReader;
    .locals 2

    .line 865
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    .line 866
    invoke-direct {p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->createImageReader33()Landroid/media/ImageReader;

    move-result-object v0

    return-object v0

    .line 867
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_1

    .line 868
    invoke-direct {p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->createImageReader29()Landroid/media/ImageReader;

    move-result-object v0

    return-object v0

    .line 870
    :cond_1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "ImageReaderPlatformViewRenderTarget requires API version 29+"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private createImageReader29()Landroid/media/ImageReader;
    .locals 6

    .line 854
    iget v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedWidth:I

    iget v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedHeight:I

    const/4 v3, 0x5

    const-wide/16 v4, 0x100

    const/16 v2, 0x22

    .line 855
    invoke-static/range {v0 .. v5}, Lcom/huawei/hms/ads/identifier/d$$ExternalSyntheticApiModelOutline0;->m(IIIIJ)Landroid/media/ImageReader;

    move-result-object v0

    return-object v0
.end method

.method private createImageReader33()Landroid/media/ImageReader;
    .locals 3

    .line 836
    invoke-static {}, Lcom/huawei/hms/ads/identifier/d$$ExternalSyntheticApiModelOutline0;->m()V

    iget v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedWidth:I

    iget v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedHeight:I

    invoke-static {v0, v1}, Lcom/huawei/hms/ads/identifier/d$$ExternalSyntheticApiModelOutline0;->m(II)Landroid/media/ImageReader$Builder;

    move-result-object v0

    const/4 v1, 0x5

    .line 838
    invoke-static {v0, v1}, Lcom/huawei/hms/ads/identifier/d$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/ImageReader$Builder;I)Landroid/media/ImageReader$Builder;

    const/16 v1, 0x22

    .line 845
    invoke-static {v0, v1}, Lcom/huawei/hms/ads/identifier/d$$ExternalSyntheticApiModelOutline0;->m$1(Landroid/media/ImageReader$Builder;I)Landroid/media/ImageReader$Builder;

    const-wide/16 v1, 0x100

    .line 847
    invoke-static {v0, v1, v2}, Lcom/huawei/hms/ads/identifier/d$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/ImageReader$Builder;J)Landroid/media/ImageReader$Builder;

    .line 848
    invoke-static {v0}, Lcom/huawei/hms/ads/identifier/d$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/ImageReader$Builder;)Landroid/media/ImageReader;

    move-result-object v0

    return-object v0
.end method

.method private getActiveReader()Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;
    .locals 2

    .line 805
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 806
    :try_start_0
    iget-boolean v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->createNewReader:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 807
    iput-boolean v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->createNewReader:Z

    .line 809
    invoke-direct {p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->createImageReader()Landroid/media/ImageReader;

    move-result-object v1

    .line 815
    invoke-virtual {p0, v1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->getOrCreatePerImageReader(Landroid/media/ImageReader;)Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 817
    :cond_0
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->imageReaderQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peekLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 818
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private maybeWaitOnFence(Landroid/media/Image;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 715
    :cond_0
    iget-boolean v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->ignoringFence:Z

    if-eqz v0, :cond_1

    return-void

    .line 718
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_2

    .line 720
    invoke-direct {p0, p1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->waitOnFence(Landroid/media/Image;)V

    return-void

    :cond_2
    const/4 p1, 0x1

    .line 724
    iput-boolean p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->ignoringFence:Z

    .line 725
    const-string p1, "ImageReaderSurfaceProducer"

    const-string v0, "ImageTextureEntry can\'t wait on the fence on Android < 33"

    invoke-static {p1, v0}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private releaseInternal()V
    .locals 1

    .line 676
    invoke-direct {p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->cleanup()V

    const/4 v0, 0x1

    .line 677
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->released:Z

    return-void
.end method

.method private waitOnFence(Landroid/media/Image;)V
    .locals 0

    .line 704
    :try_start_0
    invoke-static {p1}, Lcom/huawei/hms/ads/identifier/d$$ExternalSyntheticApiModelOutline0;->m(Landroid/media/Image;)Landroid/hardware/SyncFence;

    move-result-object p1

    .line 705
    invoke-static {p1}, Lcom/huawei/hms/ads/identifier/d$$ExternalSyntheticApiModelOutline0;->m(Landroid/hardware/SyncFence;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method


# virtual methods
.method public acquireLatestImage()Landroid/media/Image;
    .locals 2

    .line 796
    invoke-virtual {p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->dequeueImage()Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 800
    :cond_0
    iget-object v1, v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;->image:Landroid/media/Image;

    invoke-direct {p0, v1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->maybeWaitOnFence(Landroid/media/Image;)V

    .line 801
    iget-object v0, v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;->image:Landroid/media/Image;

    return-object v0
.end method

.method deltaMillis(J)D
    .locals 2

    long-to-double p1, p1

    const-wide v0, 0x412e848000000000L    # 1000000.0

    div-double/2addr p1, v0

    return-wide p1
.end method

.method dequeueImage()Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;
    .locals 5

    .line 604
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 605
    :try_start_0
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->imageReaderQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    move-object v3, v2

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    .line 606
    invoke-virtual {v3}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;->dequeueImage()Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;

    move-result-object v4

    if-nez v4, :cond_0

    move-object v3, v4

    goto :goto_0

    .line 634
    :cond_0
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastDequeuedImage:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;

    if-eqz v1, :cond_1

    .line 646
    iget-object v1, v1, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;->image:Landroid/media/Image;

    invoke-virtual {v1}, Landroid/media/Image;->close()V

    .line 647
    iput-object v2, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastDequeuedImage:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;

    .line 651
    :cond_1
    iput-object v4, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastDequeuedImage:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;

    .line 652
    iput-object v3, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lastReaderDequeuedFrom:Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    move-object v3, v4

    .line 655
    :cond_2
    invoke-virtual {p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->pruneImageReaderQueue()V

    .line 656
    monitor-exit v0

    return-object v3

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public disableFenceForTest()V
    .locals 1

    const/4 v0, 0x1

    .line 877
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->ignoringFence:Z

    return-void
.end method

.method protected finalize()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 824
    :try_start_0
    iget-boolean v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->released:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 830
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void

    .line 827
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->releaseInternal()V

    .line 828
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->this$0:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    invoke-static {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->access$300(Lio/flutter/embedding/engine/renderer/FlutterRenderer;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lio/flutter/embedding/engine/renderer/FlutterRenderer$TextureFinalizerRunnable;

    iget-wide v2, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->id:J

    iget-object v4, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->this$0:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    invoke-static {v4}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->access$200(Lio/flutter/embedding/engine/renderer/FlutterRenderer;)Lio/flutter/embedding/engine/FlutterJNI;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$TextureFinalizerRunnable;-><init>(JLio/flutter/embedding/engine/FlutterJNI;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 830
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void

    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 831
    throw v0
.end method

.method public getHeight()I
    .locals 1

    .line 768
    iget v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedHeight:I

    return v0
.end method

.method getOrCreatePerImageReader(Landroid/media/ImageReader;)Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;
    .locals 2

    .line 541
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->perImageReaders:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    if-nez v0, :cond_0

    .line 543
    new-instance v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    invoke-direct {v0, p0, p1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;-><init>(Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;Landroid/media/ImageReader;)V

    .line 544
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->perImageReaders:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 545
    iget-object p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->imageReaderQueue:Ljava/util/ArrayDeque;

    invoke-virtual {p1, v0}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object v0
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 1

    .line 773
    invoke-direct {p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->getActiveReader()Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    move-result-object v0

    .line 777
    iget-object v0, v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;->reader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 763
    iget v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedWidth:I

    return v0
.end method

.method public id()J
    .locals 2

    .line 734
    iget-wide v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->id:J

    return-wide v0
.end method

.method public numImageReaders()I
    .locals 2

    .line 882
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 883
    :try_start_0
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->imageReaderQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->size()I

    move-result v1

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 884
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public numImages()I
    .locals 4

    .line 897
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 898
    :try_start_0
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->imageReaderQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    .line 899
    invoke-static {v3}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;->access$700(Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;)Ljava/util/ArrayDeque;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->size()I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_0

    .line 901
    :cond_0
    monitor-exit v0

    return v2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public numTrims()I
    .locals 2

    .line 889
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 890
    :try_start_0
    iget v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->numTrims:I

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 891
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method onImage(Landroid/media/ImageReader;Landroid/media/Image;)V
    .locals 1

    .line 574
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 575
    :try_start_0
    invoke-virtual {p0, p1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->getOrCreatePerImageReader(Landroid/media/ImageReader;)Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    move-result-object p1

    .line 576
    invoke-virtual {p1, p2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;->queueImage(Landroid/media/Image;)Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImage;

    move-result-object p1

    .line 577
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_0

    return-void

    .line 599
    :cond_0
    iget-object p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->this$0:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    invoke-static {p1}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->access$400(Lio/flutter/embedding/engine/renderer/FlutterRenderer;)V

    return-void

    :catchall_0
    move-exception p1

    .line 577
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public onTrimMemory(I)V
    .locals 2

    .line 662
    iget-boolean v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->trimOnMemoryPressure:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/16 v0, 0x28

    if-ge p1, v0, :cond_1

    return-void

    .line 668
    :cond_1
    iget-object p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->lock:Ljava/lang/Object;

    monitor-enter p1

    .line 669
    :try_start_0
    iget v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->numTrims:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->numTrims:I

    .line 670
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 671
    invoke-direct {p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->cleanup()V

    .line 672
    iput-boolean v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->createNewReader:Z

    return-void

    :catchall_0
    move-exception v0

    .line 670
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method pruneImageReaderQueue()V
    .locals 3

    .line 556
    :goto_0
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->imageReaderQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    .line 557
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->imageReaderQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peekFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;

    .line 558
    invoke-virtual {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;->canPrune()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 562
    :cond_0
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->imageReaderQueue:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    .line 563
    iget-object v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->perImageReaders:Ljava/util/HashMap;

    iget-object v2, v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;->reader:Landroid/media/ImageReader;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 564
    invoke-virtual {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer$PerImageReader;->close()V

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public release()V
    .locals 3

    .line 739
    iget-boolean v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->released:Z

    if-eqz v0, :cond_0

    return-void

    .line 742
    :cond_0
    invoke-direct {p0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->releaseInternal()V

    .line 743
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->this$0:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    iget-wide v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->id:J

    invoke-static {v0, v1, v2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->access$100(Lio/flutter/embedding/engine/renderer/FlutterRenderer;J)V

    return-void
.end method

.method public scheduleFrame()V
    .locals 1

    .line 790
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->this$0:Lio/flutter/embedding/engine/renderer/FlutterRenderer;

    invoke-static {v0}, Lio/flutter/embedding/engine/renderer/FlutterRenderer;->access$400(Lio/flutter/embedding/engine/renderer/FlutterRenderer;)V

    return-void
.end method

.method public setSize(II)V
    .locals 2

    const/4 v0, 0x1

    .line 749
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 750
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 752
    iget v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedWidth:I

    if-ne v1, p1, :cond_0

    iget v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedHeight:I

    if-ne v1, p2, :cond_0

    return-void

    .line 756
    :cond_0
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->createNewReader:Z

    .line 757
    iput p2, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedHeight:I

    .line 758
    iput p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$ImageReaderSurfaceProducer;->requestedWidth:I

    return-void
.end method
