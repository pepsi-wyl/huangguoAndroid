.class public final Landroidx/media3/common/AdPlaybackState$AdGroup;
.super Ljava/lang/Object;
.source "AdPlaybackState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/common/AdPlaybackState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AdGroup"
.end annotation


# static fields
.field private static final FIELD_CONTENT_RESUME_OFFSET_US:Ljava/lang/String;

.field private static final FIELD_COUNT:Ljava/lang/String;

.field private static final FIELD_DURATIONS_US:Ljava/lang/String;

.field private static final FIELD_IS_SERVER_SIDE_INSERTED:Ljava/lang/String;

.field static final FIELD_MEDIA_ITEMS:Ljava/lang/String;

.field private static final FIELD_ORIGINAL_COUNT:Ljava/lang/String;

.field private static final FIELD_STATES:Ljava/lang/String;

.field private static final FIELD_TIME_US:Ljava/lang/String;

.field private static final FIELD_URIS:Ljava/lang/String;


# instance fields
.field public final contentResumeOffsetUs:J

.field public final count:I

.field public final durationsUs:[J

.field public final isServerSideInserted:Z

.field public final mediaItems:[Landroidx/media3/common/MediaItem;

.field public final originalCount:I

.field public final states:[I

.field public final timeUs:J

.field public final uris:[Landroid/net/Uri;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 494
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_TIME_US:Ljava/lang/String;

    const/4 v0, 0x1

    .line 495
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_COUNT:Ljava/lang/String;

    const/4 v0, 0x2

    .line 496
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_URIS:Ljava/lang/String;

    const/4 v0, 0x3

    .line 497
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_STATES:Ljava/lang/String;

    const/4 v0, 0x4

    .line 498
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_DURATIONS_US:Ljava/lang/String;

    const/4 v0, 0x5

    .line 499
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_CONTENT_RESUME_OFFSET_US:Ljava/lang/String;

    const/4 v0, 0x6

    .line 500
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_IS_SERVER_SIDE_INSERTED:Ljava/lang/String;

    const/4 v0, 0x7

    .line 501
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_ORIGINAL_COUNT:Ljava/lang/String;

    const/16 v0, 0x8

    .line 502
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_MEDIA_ITEMS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(J)V
    .locals 12

    const/4 v0, 0x0

    .line 109
    new-array v6, v0, [I

    new-array v7, v0, [Landroidx/media3/common/MediaItem;

    new-array v8, v0, [J

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    const/4 v4, -0x1

    const/4 v5, -0x1

    move-object v1, p0

    move-wide v2, p1

    invoke-direct/range {v1 .. v11}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-void
.end method

.method private constructor <init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V
    .locals 3

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    array-length v0, p5

    array-length v1, p6

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 131
    iput-wide p1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    .line 132
    iput p3, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    .line 133
    iput p4, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    .line 134
    iput-object p5, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    .line 135
    iput-object p6, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    .line 136
    iput-object p7, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    .line 137
    iput-wide p8, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    .line 138
    iput-boolean p10, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    .line 139
    array-length p1, p6

    new-array p1, p1, [Landroid/net/Uri;

    iput-object p1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->uris:[Landroid/net/Uri;

    .line 140
    :goto_1
    iget-object p1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->uris:[Landroid/net/Uri;

    array-length p2, p1

    if-ge v2, p2, :cond_2

    .line 141
    aget-object p2, p6, v2

    if-nez p2, :cond_1

    const/4 p2, 0x0

    goto :goto_2

    :cond_1
    iget-object p2, p2, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/media3/common/MediaItem$LocalConfiguration;

    iget-object p2, p2, Landroidx/media3/common/MediaItem$LocalConfiguration;->uri:Landroid/net/Uri;

    :goto_2
    aput-object p2, p1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method synthetic constructor <init>(JII[I[Landroidx/media3/common/MediaItem;[JJZLandroidx/media3/common/AdPlaybackState$1;)V
    .locals 0

    .line 60
    invoke-direct/range {p0 .. p10}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-void
.end method

.method static synthetic access$000(Landroidx/media3/common/AdPlaybackState$AdGroup;)Z
    .locals 0

    .line 60
    invoke-direct {p0}, Landroidx/media3/common/AdPlaybackState$AdGroup;->isLivePostrollPlaceholder()Z

    move-result p0

    return p0
.end method

.method private static copyDurationsUsWithSpaceForAdCount([JI)[J
    .locals 3

    .line 487
    array-length v0, p0

    .line 488
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 489
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object p0

    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 490
    invoke-static {p0, v0, p1, v1, v2}, Ljava/util/Arrays;->fill([JIIJ)V

    return-object p0
.end method

.method private static copyStatesWithSpaceForAdCount([II)[I
    .locals 2

    .line 478
    array-length v0, p0

    .line 479
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 480
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object p0

    const/4 v1, 0x0

    .line 481
    invoke-static {p0, v0, p1, v1}, Ljava/util/Arrays;->fill([IIII)V

    return-object p0
.end method

.method public static fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 12

    .line 526
    sget-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_TIME_US:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 527
    sget-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_COUNT:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 528
    sget-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_ORIGINAL_COUNT:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 529
    sget-object v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_URIS:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 531
    sget-object v1, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_MEDIA_ITEMS:Ljava/lang/String;

    .line 532
    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 535
    sget-object v6, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_STATES:Ljava/lang/String;

    invoke-virtual {p0, v6}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v6

    .line 536
    sget-object v7, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_DURATIONS_US:Ljava/lang/String;

    invoke-virtual {p0, v7}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v7

    .line 537
    sget-object v8, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_CONTENT_RESUME_OFFSET_US:Ljava/lang/String;

    invoke-virtual {p0, v8}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v9

    .line 538
    sget-object v8, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_IS_SERVER_SIDE_INSERTED:Ljava/lang/String;

    invoke-virtual {p0, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v11

    .line 539
    new-instance p0, Landroidx/media3/common/AdPlaybackState$AdGroup;

    const/4 v8, 0x0

    if-nez v6, :cond_0

    .line 543
    new-array v6, v8, [I

    .line 544
    :cond_0
    invoke-static {v1, v0}, Landroidx/media3/common/AdPlaybackState$AdGroup;->getMediaItemsFromBundleArrays(Ljava/util/ArrayList;Ljava/util/ArrayList;)[Landroidx/media3/common/MediaItem;

    move-result-object v0

    if-nez v7, :cond_1

    .line 545
    new-array v1, v8, [J

    move-object v8, v1

    goto :goto_0

    :cond_1
    move-object v8, v7

    :goto_0
    move-object v1, p0

    move-object v7, v0

    invoke-direct/range {v1 .. v11}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object p0
.end method

.method private getMediaItemsArrayBundles()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation

    .line 551
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 552
    iget-object v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    if-nez v4, :cond_0

    const/4 v4, 0x0

    goto :goto_1

    .line 553
    :cond_0
    invoke-virtual {v4}, Landroidx/media3/common/MediaItem;->toBundleIncludeLocalConfiguration()Landroid/os/Bundle;

    move-result-object v4

    :goto_1
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private static getMediaItemsFromBundleArrays(Ljava/util/ArrayList;Ljava/util/ArrayList;)[Landroidx/media3/common/MediaItem;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/os/Bundle;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;)[",
            "Landroidx/media3/common/MediaItem;"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-eqz p0, :cond_2

    .line 562
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Landroidx/media3/common/MediaItem;

    .line 563
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 564
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    if-nez v2, :cond_0

    move-object v2, v0

    goto :goto_1

    .line 565
    :cond_0
    invoke-static {v2}, Landroidx/media3/common/MediaItem;->fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/MediaItem;

    move-result-object v2

    :goto_1
    aput-object v2, p1, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p1

    :cond_2
    if-eqz p1, :cond_5

    .line 569
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [Landroidx/media3/common/MediaItem;

    .line 570
    :goto_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 571
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    if-nez v2, :cond_3

    move-object v2, v0

    goto :goto_3

    .line 572
    :cond_3
    invoke-static {v2}, Landroidx/media3/common/MediaItem;->fromUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem;

    move-result-object v2

    :goto_3
    aput-object v2, p0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_4
    return-object p0

    .line 576
    :cond_5
    new-array p0, v1, [Landroidx/media3/common/MediaItem;

    return-object p0
.end method

.method private isLivePostrollPlaceholder()Z
    .locals 5

    .line 195
    iget-boolean v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    iget v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
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

    .line 203
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 206
    :cond_1
    check-cast p1, Landroidx/media3/common/AdPlaybackState$AdGroup;

    .line 207
    iget-wide v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget-wide v4, p1, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    iget v3, p1, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    iget v3, p1, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    iget-object v3, p1, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    .line 210
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    iget-object v3, p1, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    .line 211
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    iget-object v3, p1, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    .line 212
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([J[J)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-wide v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    iget-wide v4, p1, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_2

    iget-boolean v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    iget-boolean p1, p1, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    if-ne v2, p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public getFirstAdIndexToPlay()I
    .locals 1

    const/4 v0, -0x1

    .line 150
    invoke-virtual {p0, v0}, Landroidx/media3/common/AdPlaybackState$AdGroup;->getNextAdIndexToPlay(I)I

    move-result v0

    return v0
.end method

.method public getNextAdIndexToPlay(I)I
    .locals 3

    const/4 v0, 0x1

    add-int/2addr p1, v0

    .line 163
    :goto_0
    iget-object v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    array-length v2, v1

    if-ge p1, v2, :cond_1

    .line 164
    iget-boolean v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    if-nez v2, :cond_1

    aget v1, v1, p1

    if-eqz v1, :cond_1

    if-ne v1, v0, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return p1
.end method

.method public hasUnplayedAds()Z
    .locals 4

    .line 183
    iget v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    return v2

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 186
    :goto_0
    iget v3, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    if-ge v1, v3, :cond_3

    .line 187
    iget-object v3, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    aget v3, v3, v1

    if-eqz v3, :cond_2

    if-ne v3, v2, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return v2

    :cond_3
    return v0
.end method

.method public hashCode()I
    .locals 6

    .line 219
    iget v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    mul-int/lit8 v0, v0, 0x1f

    .line 220
    iget v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 221
    iget-wide v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    const/16 v3, 0x20

    ushr-long v4, v1, v3

    xor-long/2addr v1, v4

    long-to-int v2, v1

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 222
    iget-object v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 223
    iget-object v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 224
    iget-object v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([J)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 225
    iget-wide v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    ushr-long v3, v1, v3

    xor-long/2addr v1, v3

    long-to-int v2, v1

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 226
    iget-boolean v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    add-int/2addr v0, v1

    return v0
.end method

.method public shouldPlayAdGroup()Z
    .locals 2

    .line 176
    iget v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Landroidx/media3/common/AdPlaybackState$AdGroup;->getFirstAdIndexToPlay()I

    move-result v0

    iget v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    if-ge v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 4

    .line 508
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 509
    sget-object v1, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_TIME_US:Ljava/lang/String;

    iget-wide v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 510
    sget-object v1, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_COUNT:Ljava/lang/String;

    iget v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 511
    sget-object v1, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_ORIGINAL_COUNT:Ljava/lang/String;

    iget v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 512
    sget-object v1, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_URIS:Ljava/lang/String;

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->uris:[Landroid/net/Uri;

    .line 513
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 512
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 514
    sget-object v1, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_MEDIA_ITEMS:Ljava/lang/String;

    invoke-direct {p0}, Landroidx/media3/common/AdPlaybackState$AdGroup;->getMediaItemsArrayBundles()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 515
    sget-object v1, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_STATES:Ljava/lang/String;

    iget-object v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 516
    sget-object v1, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_DURATIONS_US:Ljava/lang/String;

    iget-object v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    .line 517
    sget-object v1, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_CONTENT_RESUME_OFFSET_US:Ljava/lang/String;

    iget-wide v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 518
    sget-object v1, Landroidx/media3/common/AdPlaybackState$AdGroup;->FIELD_IS_SERVER_SIDE_INSERTED:Ljava/lang/String;

    iget-boolean v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-object v0
.end method

.method public withAdCount(I)Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 12

    .line 247
    iget-object v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    invoke-static {v0, p1}, Landroidx/media3/common/AdPlaybackState$AdGroup;->copyStatesWithSpaceForAdCount([II)[I

    move-result-object v6

    .line 248
    iget-object v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    invoke-static {v0, p1}, Landroidx/media3/common/AdPlaybackState$AdGroup;->copyDurationsUsWithSpaceForAdCount([JI)[J

    move-result-object v8

    .line 249
    iget-object v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, [Landroidx/media3/common/MediaItem;

    .line 250
    new-instance v0, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget-wide v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget v5, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    iget-wide v9, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    iget-boolean v11, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    move-object v1, v0

    move v4, p1

    invoke-direct/range {v1 .. v11}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object v0
.end method

.method public withAdDurationsUs([J)Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 11

    .line 335
    array-length v0, p1

    iget-object v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 336
    array-length v0, v1

    invoke-static {p1, v0}, Landroidx/media3/common/AdPlaybackState$AdGroup;->copyDurationsUsWithSpaceForAdCount([JI)[J

    move-result-object p1

    goto :goto_0

    .line 337
    :cond_0
    iget v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    array-length v0, p1

    array-length v2, v1

    if-le v0, v2, :cond_1

    .line 338
    array-length v0, v1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object p1

    :cond_1
    :goto_0
    move-object v7, p1

    .line 340
    new-instance p1, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget-wide v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget v3, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    iget v4, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    iget-object v5, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    iget-object v6, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    iget-wide v8, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    iget-boolean v10, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    move-object v0, p1

    invoke-direct/range {v0 .. v10}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object p1
.end method

.method public withAdMediaItem(Landroidx/media3/common/MediaItem;I)Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 13

    .line 276
    iget-object v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    add-int/lit8 v1, p2, 0x1

    invoke-static {v0, v1}, Landroidx/media3/common/AdPlaybackState$AdGroup;->copyStatesWithSpaceForAdCount([II)[I

    move-result-object v7

    .line 278
    iget-object v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    array-length v1, v0

    array-length v2, v7

    if-ne v1, v2, :cond_0

    goto :goto_0

    .line 280
    :cond_0
    array-length v1, v7

    invoke-static {v0, v1}, Landroidx/media3/common/AdPlaybackState$AdGroup;->copyDurationsUsWithSpaceForAdCount([JI)[J

    move-result-object v0

    :goto_0
    move-object v9, v0

    .line 281
    iget-object v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    array-length v1, v7

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, [Landroidx/media3/common/MediaItem;

    .line 282
    aput-object p1, v8, p2

    const/4 p1, 0x1

    .line 283
    aput p1, v7, p2

    .line 284
    new-instance p1, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget-wide v3, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget v5, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    iget v6, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    iget-wide v10, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    iget-boolean v12, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    move-object v2, p1

    invoke-direct/range {v2 .. v12}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object p1
.end method

.method public withAdState(II)Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    .line 305
    iget v3, v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v3, v4, :cond_1

    if-ge v2, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v3, 0x1

    :goto_1
    invoke-static {v3}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 306
    iget-object v3, v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    add-int/lit8 v4, v2, 0x1

    invoke-static {v3, v4}, Landroidx/media3/common/AdPlaybackState$AdGroup;->copyStatesWithSpaceForAdCount([II)[I

    move-result-object v12

    .line 307
    aget v3, v12, v2

    if-eqz v3, :cond_2

    if-eq v3, v6, :cond_2

    if-ne v3, v1, :cond_3

    :cond_2
    const/4 v5, 0x1

    :cond_3
    invoke-static {v5}, Landroidx/media3/common/util/Assertions;->checkArgument(Z)V

    .line 312
    iget-object v3, v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    array-length v4, v3

    array-length v5, v12

    if-ne v4, v5, :cond_4

    goto :goto_2

    .line 314
    :cond_4
    array-length v4, v12

    invoke-static {v3, v4}, Landroidx/media3/common/AdPlaybackState$AdGroup;->copyDurationsUsWithSpaceForAdCount([JI)[J

    move-result-object v3

    :goto_2
    move-object v14, v3

    .line 317
    iget-object v3, v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    array-length v4, v3

    array-length v5, v12

    if-ne v4, v5, :cond_5

    goto :goto_3

    .line 319
    :cond_5
    array-length v4, v12

    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Landroidx/media3/common/MediaItem;

    :goto_3
    move-object v13, v3

    .line 320
    aput v1, v12, v2

    .line 321
    new-instance v1, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget-wide v8, v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget v10, v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    iget v11, v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    iget-wide v2, v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    iget-boolean v4, v0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    move-object v7, v1

    move-wide v15, v2

    move/from16 v17, v4

    invoke-direct/range {v7 .. v17}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object v1
.end method

.method public withAdUri(Landroid/net/Uri;I)Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 267
    invoke-static {p1}, Landroidx/media3/common/MediaItem;->fromUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Landroidx/media3/common/AdPlaybackState$AdGroup;->withAdMediaItem(Landroidx/media3/common/MediaItem;I)Landroidx/media3/common/AdPlaybackState$AdGroup;

    move-result-object p1

    return-object p1
.end method

.method public withAllAdsReset()Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 12

    .line 453
    iget v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-object p0

    .line 456
    :cond_0
    iget-object v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    array-length v4, v0

    .line 457
    invoke-static {v0, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v6

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v4, :cond_4

    .line 459
    aget v2, v6, v1

    const/4 v3, 0x3

    if-eq v2, v3, :cond_1

    const/4 v3, 0x2

    if-eq v2, v3, :cond_1

    const/4 v3, 0x4

    if-ne v2, v3, :cond_3

    .line 462
    :cond_1
    iget-object v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    aget-object v2, v2, v1

    if-nez v2, :cond_2

    const/4 v2, 0x0

    goto :goto_1

    :cond_2
    const/4 v2, 0x1

    :goto_1
    aput v2, v6, v1

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 465
    :cond_4
    new-instance v0, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget-wide v2, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget v5, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    iget-object v7, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    iget-object v8, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    iget-wide v9, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    iget-boolean v11, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    move-object v1, v0

    invoke-direct/range {v1 .. v11}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object v0
.end method

.method public withAllAdsSkipped()Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 14

    .line 418
    iget v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 419
    new-instance v0, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget-wide v4, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget v7, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    new-array v8, v2, [I

    new-array v9, v2, [Landroidx/media3/common/MediaItem;

    new-array v10, v2, [J

    iget-wide v11, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    iget-boolean v13, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    const/4 v6, 0x0

    move-object v3, v0

    invoke-direct/range {v3 .. v13}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object v0

    .line 429
    :cond_0
    iget-object v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    array-length v6, v0

    .line 430
    invoke-static {v0, v6}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v8

    :goto_0
    if-ge v2, v6, :cond_3

    .line 432
    aget v0, v8, v2

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    if-nez v0, :cond_2

    :cond_1
    const/4 v0, 0x2

    .line 433
    aput v0, v8, v2

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 436
    :cond_3
    new-instance v0, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget-wide v4, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget v7, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    iget-object v9, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    iget-object v10, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    iget-wide v11, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    iget-boolean v13, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    move-object v3, v0

    invoke-direct/range {v3 .. v13}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object v0
.end method

.method public withContentResumeOffsetUs(J)Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 12

    .line 354
    new-instance v11, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget-wide v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget v3, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    iget v4, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    iget-object v5, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    iget-object v6, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    iget-object v7, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    iget-boolean v10, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    move-object v0, v11

    move-wide v8, p1

    invoke-direct/range {v0 .. v10}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object v11
.end method

.method public withIsServerSideInserted(Z)Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 12

    .line 368
    new-instance v11, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget-wide v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget v3, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    iget v4, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    iget-object v5, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    iget-object v6, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    iget-object v7, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    iget-wide v8, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    move-object v0, v11

    move v10, p1

    invoke-direct/range {v0 .. v10}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object v11
.end method

.method public withLastAdRemoved()Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 13

    .line 394
    iget-object v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    array-length v1, v0

    add-int/lit8 v5, v1, -0x1

    .line 395
    invoke-static {v0, v5}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v7

    .line 396
    iget-object v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    invoke-static {v0, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, [Landroidx/media3/common/MediaItem;

    .line 397
    iget-object v0, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    .line 398
    array-length v1, v0

    if-le v1, v5, :cond_0

    .line 399
    invoke-static {v0, v5}, Ljava/util/Arrays;->copyOf([JI)[J

    move-result-object v0

    :cond_0
    move-object v9, v0

    .line 401
    new-instance v0, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget-wide v3, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget v6, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    .line 408
    invoke-static {v9}, Landroidx/media3/common/util/Util;->sum([J)J

    move-result-wide v10

    iget-boolean v12, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    move-object v2, v0

    invoke-direct/range {v2 .. v12}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object v0
.end method

.method public withOriginalAdCount(I)Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 12

    .line 381
    new-instance v11, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget-wide v1, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->timeUs:J

    iget v3, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    iget-object v5, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    iget-object v6, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    iget-object v7, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    iget-wide v8, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    iget-boolean v10, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    move-object v0, v11

    move v4, p1

    invoke-direct/range {v0 .. v10}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object v11
.end method

.method public withTimeUs(J)Landroidx/media3/common/AdPlaybackState$AdGroup;
    .locals 12

    .line 233
    new-instance v11, Landroidx/media3/common/AdPlaybackState$AdGroup;

    iget v3, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->count:I

    iget v4, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->originalCount:I

    iget-object v5, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->states:[I

    iget-object v6, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->mediaItems:[Landroidx/media3/common/MediaItem;

    iget-object v7, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->durationsUs:[J

    iget-wide v8, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->contentResumeOffsetUs:J

    iget-boolean v10, p0, Landroidx/media3/common/AdPlaybackState$AdGroup;->isServerSideInserted:Z

    move-object v0, v11

    move-wide v1, p1

    invoke-direct/range {v0 .. v10}, Landroidx/media3/common/AdPlaybackState$AdGroup;-><init>(JII[I[Landroidx/media3/common/MediaItem;[JJZ)V

    return-object v11
.end method
