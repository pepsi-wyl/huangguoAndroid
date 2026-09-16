.class public final Landroidx/media3/common/Timeline$Window;
.super Ljava/lang/Object;
.source "Timeline.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/common/Timeline;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Window"
.end annotation


# static fields
.field private static final FAKE_WINDOW_UID:Ljava/lang/Object;

.field private static final FIELD_DEFAULT_POSITION_US:Ljava/lang/String;

.field private static final FIELD_DURATION_US:Ljava/lang/String;

.field private static final FIELD_ELAPSED_REALTIME_EPOCH_OFFSET_MS:Ljava/lang/String;

.field private static final FIELD_FIRST_PERIOD_INDEX:Ljava/lang/String;

.field private static final FIELD_IS_DYNAMIC:Ljava/lang/String;

.field private static final FIELD_IS_PLACEHOLDER:Ljava/lang/String;

.field private static final FIELD_IS_SEEKABLE:Ljava/lang/String;

.field private static final FIELD_LAST_PERIOD_INDEX:Ljava/lang/String;

.field private static final FIELD_LIVE_CONFIGURATION:Ljava/lang/String;

.field private static final FIELD_MEDIA_ITEM:Ljava/lang/String;

.field private static final FIELD_POSITION_IN_FIRST_PERIOD_US:Ljava/lang/String;

.field private static final FIELD_PRESENTATION_START_TIME_MS:Ljava/lang/String;

.field private static final FIELD_WINDOW_START_TIME_MS:Ljava/lang/String;

.field private static final PLACEHOLDER_MEDIA_ITEM:Landroidx/media3/common/MediaItem;

.field public static final SINGLE_WINDOW_UID:Ljava/lang/Object;


# instance fields
.field public defaultPositionUs:J

.field public durationUs:J

.field public elapsedRealtimeEpochOffsetMs:J

.field public firstPeriodIndex:I

.field public isDynamic:Z

.field public isPlaceholder:Z

.field public isSeekable:Z

.field public lastPeriodIndex:I

.field public liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

.field public manifest:Ljava/lang/Object;

.field public mediaItem:Landroidx/media3/common/MediaItem;

.field public positionInFirstPeriodUs:J

.field public presentationStartTimeMs:J

.field public tag:Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public uid:Ljava/lang/Object;

.field public windowStartTimeMs:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 160
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/media3/common/Timeline$Window;->SINGLE_WINDOW_UID:Ljava/lang/Object;

    .line 162
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FAKE_WINDOW_UID:Ljava/lang/Object;

    .line 164
    new-instance v0, Landroidx/media3/common/MediaItem$Builder;

    invoke-direct {v0}, Landroidx/media3/common/MediaItem$Builder;-><init>()V

    const-string v1, "androidx.media3.common.Timeline"

    .line 166
    invoke-virtual {v0, v1}, Landroidx/media3/common/MediaItem$Builder;->setMediaId(Ljava/lang/String;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object v0

    sget-object v1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 167
    invoke-virtual {v0, v1}, Landroidx/media3/common/MediaItem$Builder;->setUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object v0

    .line 168
    invoke-virtual {v0}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->PLACEHOLDER_MEDIA_ITEM:Landroidx/media3/common/MediaItem;

    const/4 v0, 0x1

    .line 415
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_MEDIA_ITEM:Ljava/lang/String;

    const/4 v0, 0x2

    .line 416
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_PRESENTATION_START_TIME_MS:Ljava/lang/String;

    const/4 v0, 0x3

    .line 417
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_WINDOW_START_TIME_MS:Ljava/lang/String;

    const/4 v0, 0x4

    .line 419
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_ELAPSED_REALTIME_EPOCH_OFFSET_MS:Ljava/lang/String;

    const/4 v0, 0x5

    .line 420
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_IS_SEEKABLE:Ljava/lang/String;

    const/4 v0, 0x6

    .line 421
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_IS_DYNAMIC:Ljava/lang/String;

    const/4 v0, 0x7

    .line 422
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_LIVE_CONFIGURATION:Ljava/lang/String;

    const/16 v0, 0x8

    .line 423
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_IS_PLACEHOLDER:Ljava/lang/String;

    const/16 v0, 0x9

    .line 424
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_DEFAULT_POSITION_US:Ljava/lang/String;

    const/16 v0, 0xa

    .line 425
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_DURATION_US:Ljava/lang/String;

    const/16 v0, 0xb

    .line 426
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_FIRST_PERIOD_INDEX:Ljava/lang/String;

    const/16 v0, 0xc

    .line 427
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_LAST_PERIOD_INDEX:Ljava/lang/String;

    const/16 v0, 0xd

    .line 428
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/Timeline$Window;->FIELD_POSITION_IN_FIRST_PERIOD_US:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 257
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 258
    sget-object v0, Landroidx/media3/common/Timeline$Window;->SINGLE_WINDOW_UID:Ljava/lang/Object;

    iput-object v0, p0, Landroidx/media3/common/Timeline$Window;->uid:Ljava/lang/Object;

    .line 259
    sget-object v0, Landroidx/media3/common/Timeline$Window;->PLACEHOLDER_MEDIA_ITEM:Landroidx/media3/common/MediaItem;

    iput-object v0, p0, Landroidx/media3/common/Timeline$Window;->mediaItem:Landroidx/media3/common/MediaItem;

    return-void
.end method

.method public static fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/Timeline$Window;
    .locals 25

    move-object/from16 v0, p0

    .line 487
    sget-object v1, Landroidx/media3/common/Timeline$Window;->FIELD_MEDIA_ITEM:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 490
    invoke-static {v1}, Landroidx/media3/common/MediaItem;->fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/MediaItem;

    move-result-object v1

    goto :goto_0

    :cond_0
    sget-object v1, Landroidx/media3/common/MediaItem;->EMPTY:Landroidx/media3/common/MediaItem;

    :goto_0
    move-object v4, v1

    .line 491
    sget-object v1, Landroidx/media3/common/Timeline$Window;->FIELD_PRESENTATION_START_TIME_MS:Ljava/lang/String;

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 492
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 493
    sget-object v1, Landroidx/media3/common/Timeline$Window;->FIELD_WINDOW_START_TIME_MS:Ljava/lang/String;

    .line 494
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v8

    .line 495
    sget-object v1, Landroidx/media3/common/Timeline$Window;->FIELD_ELAPSED_REALTIME_EPOCH_OFFSET_MS:Ljava/lang/String;

    .line 496
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 497
    sget-object v1, Landroidx/media3/common/Timeline$Window;->FIELD_IS_SEEKABLE:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v0, v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    .line 498
    sget-object v1, Landroidx/media3/common/Timeline$Window;->FIELD_IS_DYNAMIC:Ljava/lang/String;

    invoke-virtual {v0, v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    .line 499
    sget-object v1, Landroidx/media3/common/Timeline$Window;->FIELD_LIVE_CONFIGURATION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 503
    invoke-static {v1}, Landroidx/media3/common/MediaItem$LiveConfiguration;->fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/MediaItem$LiveConfiguration;

    move-result-object v1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    move-object v14, v1

    .line 505
    sget-object v1, Landroidx/media3/common/Timeline$Window;->FIELD_IS_PLACEHOLDER:Ljava/lang/String;

    invoke-virtual {v0, v1, v5}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 506
    sget-object v15, Landroidx/media3/common/Timeline$Window;->FIELD_DEFAULT_POSITION_US:Ljava/lang/String;

    move-wide/from16 v23, v6

    const-wide/16 v5, 0x0

    invoke-virtual {v0, v15, v5, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v15

    .line 507
    sget-object v7, Landroidx/media3/common/Timeline$Window;->FIELD_DURATION_US:Ljava/lang/String;

    invoke-virtual {v0, v7, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v17

    .line 508
    sget-object v2, Landroidx/media3/common/Timeline$Window;->FIELD_FIRST_PERIOD_INDEX:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v19

    .line 509
    sget-object v2, Landroidx/media3/common/Timeline$Window;->FIELD_LAST_PERIOD_INDEX:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v20

    .line 510
    sget-object v2, Landroidx/media3/common/Timeline$Window;->FIELD_POSITION_IN_FIRST_PERIOD_US:Ljava/lang/String;

    .line 511
    invoke-virtual {v0, v2, v5, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v21

    .line 513
    new-instance v0, Landroidx/media3/common/Timeline$Window;

    move-object v2, v0

    invoke-direct {v0}, Landroidx/media3/common/Timeline$Window;-><init>()V

    .line 514
    sget-object v3, Landroidx/media3/common/Timeline$Window;->FAKE_WINDOW_UID:Ljava/lang/Object;

    const/4 v5, 0x0

    move-wide/from16 v6, v23

    invoke-virtual/range {v2 .. v22}, Landroidx/media3/common/Timeline$Window;->set(Ljava/lang/Object;Landroidx/media3/common/MediaItem;Ljava/lang/Object;JJJZZLandroidx/media3/common/MediaItem$LiveConfiguration;JJIIJ)Landroidx/media3/common/Timeline$Window;

    .line 529
    iput-boolean v1, v0, Landroidx/media3/common/Timeline$Window;->isPlaceholder:Z

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 370
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_1

    .line 373
    :cond_1
    check-cast p1, Landroidx/media3/common/Timeline$Window;

    .line 374
    iget-object v2, p0, Landroidx/media3/common/Timeline$Window;->uid:Ljava/lang/Object;

    iget-object v3, p1, Landroidx/media3/common/Timeline$Window;->uid:Ljava/lang/Object;

    invoke-static {v2, v3}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroidx/media3/common/Timeline$Window;->mediaItem:Landroidx/media3/common/MediaItem;

    iget-object v3, p1, Landroidx/media3/common/Timeline$Window;->mediaItem:Landroidx/media3/common/MediaItem;

    .line 375
    invoke-static {v2, v3}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroidx/media3/common/Timeline$Window;->manifest:Ljava/lang/Object;

    iget-object v3, p1, Landroidx/media3/common/Timeline$Window;->manifest:Ljava/lang/Object;

    .line 376
    invoke-static {v2, v3}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroidx/media3/common/Timeline$Window;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    iget-object v3, p1, Landroidx/media3/common/Timeline$Window;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    .line 377
    invoke-static {v2, v3}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->presentationStartTimeMs:J

    iget-wide v4, p1, Landroidx/media3/common/Timeline$Window;->presentationStartTimeMs:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->windowStartTimeMs:J

    iget-wide v4, p1, Landroidx/media3/common/Timeline$Window;->windowStartTimeMs:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->elapsedRealtimeEpochOffsetMs:J

    iget-wide v4, p1, Landroidx/media3/common/Timeline$Window;->elapsedRealtimeEpochOffsetMs:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget-boolean v2, p0, Landroidx/media3/common/Timeline$Window;->isSeekable:Z

    iget-boolean v3, p1, Landroidx/media3/common/Timeline$Window;->isSeekable:Z

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Landroidx/media3/common/Timeline$Window;->isDynamic:Z

    iget-boolean v3, p1, Landroidx/media3/common/Timeline$Window;->isDynamic:Z

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Landroidx/media3/common/Timeline$Window;->isPlaceholder:Z

    iget-boolean v3, p1, Landroidx/media3/common/Timeline$Window;->isPlaceholder:Z

    if-ne v2, v3, :cond_2

    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->defaultPositionUs:J

    iget-wide v4, p1, Landroidx/media3/common/Timeline$Window;->defaultPositionUs:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->durationUs:J

    iget-wide v4, p1, Landroidx/media3/common/Timeline$Window;->durationUs:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget v2, p0, Landroidx/media3/common/Timeline$Window;->firstPeriodIndex:I

    iget v3, p1, Landroidx/media3/common/Timeline$Window;->firstPeriodIndex:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Landroidx/media3/common/Timeline$Window;->lastPeriodIndex:I

    iget v3, p1, Landroidx/media3/common/Timeline$Window;->lastPeriodIndex:I

    if-ne v2, v3, :cond_2

    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->positionInFirstPeriodUs:J

    iget-wide v4, p1, Landroidx/media3/common/Timeline$Window;->positionInFirstPeriodUs:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public getCurrentUnixTimeMs()J
    .locals 2

    .line 356
    iget-wide v0, p0, Landroidx/media3/common/Timeline$Window;->elapsedRealtimeEpochOffsetMs:J

    invoke-static {v0, v1}, Landroidx/media3/common/util/Util;->getNowUnixTimeMs(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDefaultPositionMs()J
    .locals 2

    .line 310
    iget-wide v0, p0, Landroidx/media3/common/Timeline$Window;->defaultPositionUs:J

    invoke-static {v0, v1}, Landroidx/media3/common/util/Util;->usToMs(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDefaultPositionUs()J
    .locals 2

    .line 320
    iget-wide v0, p0, Landroidx/media3/common/Timeline$Window;->defaultPositionUs:J

    return-wide v0
.end method

.method public getDurationMs()J
    .locals 2

    .line 325
    iget-wide v0, p0, Landroidx/media3/common/Timeline$Window;->durationUs:J

    invoke-static {v0, v1}, Landroidx/media3/common/util/Util;->usToMs(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDurationUs()J
    .locals 2

    .line 330
    iget-wide v0, p0, Landroidx/media3/common/Timeline$Window;->durationUs:J

    return-wide v0
.end method

.method public getPositionInFirstPeriodMs()J
    .locals 2

    .line 338
    iget-wide v0, p0, Landroidx/media3/common/Timeline$Window;->positionInFirstPeriodUs:J

    invoke-static {v0, v1}, Landroidx/media3/common/util/Util;->usToMs(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getPositionInFirstPeriodUs()J
    .locals 2

    .line 346
    iget-wide v0, p0, Landroidx/media3/common/Timeline$Window;->positionInFirstPeriodUs:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 6

    .line 395
    iget-object v0, p0, Landroidx/media3/common/Timeline$Window;->uid:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0xd9

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 396
    iget-object v0, p0, Landroidx/media3/common/Timeline$Window;->mediaItem:Landroidx/media3/common/MediaItem;

    invoke-virtual {v0}, Landroidx/media3/common/MediaItem;->hashCode()I

    move-result v0

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 397
    iget-object v0, p0, Landroidx/media3/common/Timeline$Window;->manifest:Ljava/lang/Object;

    const/4 v2, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    .line 398
    iget-object v0, p0, Landroidx/media3/common/Timeline$Window;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Landroidx/media3/common/MediaItem$LiveConfiguration;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    .line 399
    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->presentationStartTimeMs:J

    const/16 v0, 0x20

    ushr-long v4, v2, v0

    xor-long/2addr v2, v4

    long-to-int v3, v2

    add-int/2addr v1, v3

    mul-int/lit8 v1, v1, 0x1f

    .line 400
    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->windowStartTimeMs:J

    ushr-long v4, v2, v0

    xor-long/2addr v2, v4

    long-to-int v3, v2

    add-int/2addr v1, v3

    mul-int/lit8 v1, v1, 0x1f

    .line 401
    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->elapsedRealtimeEpochOffsetMs:J

    ushr-long v4, v2, v0

    xor-long/2addr v2, v4

    long-to-int v3, v2

    add-int/2addr v1, v3

    mul-int/lit8 v1, v1, 0x1f

    .line 404
    iget-boolean v2, p0, Landroidx/media3/common/Timeline$Window;->isSeekable:Z

    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    .line 405
    iget-boolean v2, p0, Landroidx/media3/common/Timeline$Window;->isDynamic:Z

    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    .line 406
    iget-boolean v2, p0, Landroidx/media3/common/Timeline$Window;->isPlaceholder:Z

    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    .line 407
    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->defaultPositionUs:J

    ushr-long v4, v2, v0

    xor-long/2addr v2, v4

    long-to-int v3, v2

    add-int/2addr v1, v3

    mul-int/lit8 v1, v1, 0x1f

    .line 408
    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->durationUs:J

    ushr-long v4, v2, v0

    xor-long/2addr v2, v4

    long-to-int v3, v2

    add-int/2addr v1, v3

    mul-int/lit8 v1, v1, 0x1f

    .line 409
    iget v2, p0, Landroidx/media3/common/Timeline$Window;->firstPeriodIndex:I

    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    .line 410
    iget v2, p0, Landroidx/media3/common/Timeline$Window;->lastPeriodIndex:I

    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    .line 411
    iget-wide v2, p0, Landroidx/media3/common/Timeline$Window;->positionInFirstPeriodUs:J

    ushr-long v4, v2, v0

    xor-long/2addr v2, v4

    long-to-int v0, v2

    add-int/2addr v1, v0

    return v1
.end method

.method public isLive()Z
    .locals 1

    .line 361
    iget-object v0, p0, Landroidx/media3/common/Timeline$Window;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public set(Ljava/lang/Object;Landroidx/media3/common/MediaItem;Ljava/lang/Object;JJJZZLandroidx/media3/common/MediaItem$LiveConfiguration;JJIIJ)Landroidx/media3/common/Timeline$Window;
    .locals 3

    move-object v0, p0

    move-object v1, p2

    move-object v2, p1

    .line 281
    iput-object v2, v0, Landroidx/media3/common/Timeline$Window;->uid:Ljava/lang/Object;

    if-eqz v1, :cond_0

    move-object v2, v1

    goto :goto_0

    .line 282
    :cond_0
    sget-object v2, Landroidx/media3/common/Timeline$Window;->PLACEHOLDER_MEDIA_ITEM:Landroidx/media3/common/MediaItem;

    :goto_0
    iput-object v2, v0, Landroidx/media3/common/Timeline$Window;->mediaItem:Landroidx/media3/common/MediaItem;

    if-eqz v1, :cond_1

    .line 284
    iget-object v2, v1, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    if-eqz v2, :cond_1

    .line 285
    iget-object v1, v1, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    iget-object v1, v1, Landroidx/media3/common/MediaItem$LocalConfiguration;->tag:Ljava/lang/Object;

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    .line 286
    :goto_1
    iput-object v1, v0, Landroidx/media3/common/Timeline$Window;->tag:Ljava/lang/Object;

    move-object v1, p3

    .line 287
    iput-object v1, v0, Landroidx/media3/common/Timeline$Window;->manifest:Ljava/lang/Object;

    move-wide v1, p4

    .line 288
    iput-wide v1, v0, Landroidx/media3/common/Timeline$Window;->presentationStartTimeMs:J

    move-wide v1, p6

    .line 289
    iput-wide v1, v0, Landroidx/media3/common/Timeline$Window;->windowStartTimeMs:J

    move-wide v1, p8

    .line 290
    iput-wide v1, v0, Landroidx/media3/common/Timeline$Window;->elapsedRealtimeEpochOffsetMs:J

    move v1, p10

    .line 291
    iput-boolean v1, v0, Landroidx/media3/common/Timeline$Window;->isSeekable:Z

    move v1, p11

    .line 292
    iput-boolean v1, v0, Landroidx/media3/common/Timeline$Window;->isDynamic:Z

    move-object v1, p12

    .line 293
    iput-object v1, v0, Landroidx/media3/common/Timeline$Window;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    move-wide/from16 v1, p13

    .line 294
    iput-wide v1, v0, Landroidx/media3/common/Timeline$Window;->defaultPositionUs:J

    move-wide/from16 v1, p15

    .line 295
    iput-wide v1, v0, Landroidx/media3/common/Timeline$Window;->durationUs:J

    move/from16 v1, p17

    .line 296
    iput v1, v0, Landroidx/media3/common/Timeline$Window;->firstPeriodIndex:I

    move/from16 v1, p18

    .line 297
    iput v1, v0, Landroidx/media3/common/Timeline$Window;->lastPeriodIndex:I

    move-wide/from16 v1, p19

    .line 298
    iput-wide v1, v0, Landroidx/media3/common/Timeline$Window;->positionInFirstPeriodUs:J

    const/4 v1, 0x0

    .line 299
    iput-boolean v1, v0, Landroidx/media3/common/Timeline$Window;->isPlaceholder:Z

    return-object v0
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 8

    .line 439
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 440
    sget-object v1, Landroidx/media3/common/MediaItem;->EMPTY:Landroidx/media3/common/MediaItem;

    iget-object v2, p0, Landroidx/media3/common/Timeline$Window;->mediaItem:Landroidx/media3/common/MediaItem;

    invoke-virtual {v1, v2}, Landroidx/media3/common/MediaItem;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 441
    sget-object v1, Landroidx/media3/common/Timeline$Window;->FIELD_MEDIA_ITEM:Ljava/lang/String;

    iget-object v2, p0, Landroidx/media3/common/Timeline$Window;->mediaItem:Landroidx/media3/common/MediaItem;

    invoke-virtual {v2}, Landroidx/media3/common/MediaItem;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 443
    :cond_0
    iget-wide v1, p0, Landroidx/media3/common/Timeline$Window;->presentationStartTimeMs:J

    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v5, v1, v3

    if-eqz v5, :cond_1

    .line 444
    sget-object v5, Landroidx/media3/common/Timeline$Window;->FIELD_PRESENTATION_START_TIME_MS:Ljava/lang/String;

    invoke-virtual {v0, v5, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 446
    :cond_1
    iget-wide v1, p0, Landroidx/media3/common/Timeline$Window;->windowStartTimeMs:J

    cmp-long v5, v1, v3

    if-eqz v5, :cond_2

    .line 447
    sget-object v5, Landroidx/media3/common/Timeline$Window;->FIELD_WINDOW_START_TIME_MS:Ljava/lang/String;

    invoke-virtual {v0, v5, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 449
    :cond_2
    iget-wide v1, p0, Landroidx/media3/common/Timeline$Window;->elapsedRealtimeEpochOffsetMs:J

    cmp-long v5, v1, v3

    if-eqz v5, :cond_3

    .line 450
    sget-object v5, Landroidx/media3/common/Timeline$Window;->FIELD_ELAPSED_REALTIME_EPOCH_OFFSET_MS:Ljava/lang/String;

    invoke-virtual {v0, v5, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 452
    :cond_3
    iget-boolean v1, p0, Landroidx/media3/common/Timeline$Window;->isSeekable:Z

    if-eqz v1, :cond_4

    .line 453
    sget-object v2, Landroidx/media3/common/Timeline$Window;->FIELD_IS_SEEKABLE:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 455
    :cond_4
    iget-boolean v1, p0, Landroidx/media3/common/Timeline$Window;->isDynamic:Z

    if-eqz v1, :cond_5

    .line 456
    sget-object v2, Landroidx/media3/common/Timeline$Window;->FIELD_IS_DYNAMIC:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 459
    :cond_5
    iget-object v1, p0, Landroidx/media3/common/Timeline$Window;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    if-eqz v1, :cond_6

    .line 461
    sget-object v2, Landroidx/media3/common/Timeline$Window;->FIELD_LIVE_CONFIGURATION:Ljava/lang/String;

    invoke-virtual {v1}, Landroidx/media3/common/MediaItem$LiveConfiguration;->toBundle()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 463
    :cond_6
    iget-boolean v1, p0, Landroidx/media3/common/Timeline$Window;->isPlaceholder:Z

    if-eqz v1, :cond_7

    .line 464
    sget-object v2, Landroidx/media3/common/Timeline$Window;->FIELD_IS_PLACEHOLDER:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 466
    :cond_7
    iget-wide v1, p0, Landroidx/media3/common/Timeline$Window;->defaultPositionUs:J

    const-wide/16 v5, 0x0

    cmp-long v7, v1, v5

    if-eqz v7, :cond_8

    .line 467
    sget-object v7, Landroidx/media3/common/Timeline$Window;->FIELD_DEFAULT_POSITION_US:Ljava/lang/String;

    invoke-virtual {v0, v7, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 469
    :cond_8
    iget-wide v1, p0, Landroidx/media3/common/Timeline$Window;->durationUs:J

    cmp-long v7, v1, v3

    if-eqz v7, :cond_9

    .line 470
    sget-object v3, Landroidx/media3/common/Timeline$Window;->FIELD_DURATION_US:Ljava/lang/String;

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 472
    :cond_9
    iget v1, p0, Landroidx/media3/common/Timeline$Window;->firstPeriodIndex:I

    if-eqz v1, :cond_a

    .line 473
    sget-object v2, Landroidx/media3/common/Timeline$Window;->FIELD_FIRST_PERIOD_INDEX:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 475
    :cond_a
    iget v1, p0, Landroidx/media3/common/Timeline$Window;->lastPeriodIndex:I

    if-eqz v1, :cond_b

    .line 476
    sget-object v2, Landroidx/media3/common/Timeline$Window;->FIELD_LAST_PERIOD_INDEX:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 478
    :cond_b
    iget-wide v1, p0, Landroidx/media3/common/Timeline$Window;->positionInFirstPeriodUs:J

    cmp-long v3, v1, v5

    if-eqz v3, :cond_c

    .line 479
    sget-object v3, Landroidx/media3/common/Timeline$Window;->FIELD_POSITION_IN_FIRST_PERIOD_US:Ljava/lang/String;

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_c
    return-object v0
.end method
