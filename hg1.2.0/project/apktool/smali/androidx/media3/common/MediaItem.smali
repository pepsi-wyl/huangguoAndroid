.class public final Landroidx/media3/common/MediaItem;
.super Ljava/lang/Object;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/common/MediaItem$ClippingProperties;,
        Landroidx/media3/common/MediaItem$LocalConfiguration;,
        Landroidx/media3/common/MediaItem$LiveConfiguration;,
        Landroidx/media3/common/MediaItem$RequestMetadata;,
        Landroidx/media3/common/MediaItem$Builder;,
        Landroidx/media3/common/MediaItem$ClippingConfiguration;,
        Landroidx/media3/common/MediaItem$Subtitle;,
        Landroidx/media3/common/MediaItem$SubtitleConfiguration;,
        Landroidx/media3/common/MediaItem$AdsConfiguration;,
        Landroidx/media3/common/MediaItem$DrmConfiguration;
    }
.end annotation


# static fields
.field public static final DEFAULT_MEDIA_ID:Ljava/lang/String; = ""

.field public static final EMPTY:Landroidx/media3/common/MediaItem;

.field private static final FIELD_CLIPPING_PROPERTIES:Ljava/lang/String;

.field private static final FIELD_LIVE_CONFIGURATION:Ljava/lang/String;

.field private static final FIELD_LOCAL_CONFIGURATION:Ljava/lang/String;

.field private static final FIELD_MEDIA_ID:Ljava/lang/String;

.field private static final FIELD_MEDIA_METADATA:Ljava/lang/String;

.field private static final FIELD_REQUEST_METADATA:Ljava/lang/String;


# instance fields
.field public final clippingConfiguration:Landroidx/media3/common/MediaItem$ClippingConfiguration;

.field public final clippingProperties:Landroidx/media3/common/MediaItem$ClippingProperties;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public final liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

.field public final localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

.field public final mediaId:Ljava/lang/String;

.field public final mediaMetadata:Landroidx/media3/common/MediaMetadata;

.field public final playbackProperties:Landroidx/media3/common/MediaItem$LocalConfiguration;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public final requestMetadata:Landroidx/media3/common/MediaItem$RequestMetadata;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 2269
    new-instance v0, Landroidx/media3/common/MediaItem$Builder;

    invoke-direct {v0}, Landroidx/media3/common/MediaItem$Builder;-><init>()V

    invoke-virtual {v0}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/MediaItem;->EMPTY:Landroidx/media3/common/MediaItem;

    const/4 v0, 0x0

    .line 2359
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/MediaItem;->FIELD_MEDIA_ID:Ljava/lang/String;

    const/4 v0, 0x1

    .line 2360
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/MediaItem;->FIELD_LIVE_CONFIGURATION:Ljava/lang/String;

    const/4 v0, 0x2

    .line 2361
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/MediaItem;->FIELD_MEDIA_METADATA:Ljava/lang/String;

    const/4 v0, 0x3

    .line 2362
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/MediaItem;->FIELD_CLIPPING_PROPERTIES:Ljava/lang/String;

    const/4 v0, 0x4

    .line 2363
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/MediaItem;->FIELD_REQUEST_METADATA:Ljava/lang/String;

    const/4 v0, 0x5

    .line 2364
    invoke-static {v0}, Landroidx/media3/common/util/Util;->intToStringMaxRadix(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/media3/common/MediaItem;->FIELD_LOCAL_CONFIGURATION:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Landroidx/media3/common/MediaItem$ClippingProperties;Landroidx/media3/common/MediaItem$LocalConfiguration;Landroidx/media3/common/MediaItem$LiveConfiguration;Landroidx/media3/common/MediaMetadata;Landroidx/media3/common/MediaItem$RequestMetadata;)V
    .locals 0

    .line 2313
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2314
    iput-object p1, p0, Landroidx/media3/common/MediaItem;->mediaId:Ljava/lang/String;

    .line 2315
    iput-object p3, p0, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    .line 2316
    iput-object p3, p0, Landroidx/media3/common/MediaItem;->playbackProperties:Landroidx/media3/common/MediaItem$LocalConfiguration;

    .line 2317
    iput-object p4, p0, Landroidx/media3/common/MediaItem;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    .line 2318
    iput-object p5, p0, Landroidx/media3/common/MediaItem;->mediaMetadata:Landroidx/media3/common/MediaMetadata;

    .line 2319
    iput-object p2, p0, Landroidx/media3/common/MediaItem;->clippingConfiguration:Landroidx/media3/common/MediaItem$ClippingConfiguration;

    .line 2320
    iput-object p2, p0, Landroidx/media3/common/MediaItem;->clippingProperties:Landroidx/media3/common/MediaItem$ClippingProperties;

    .line 2321
    iput-object p6, p0, Landroidx/media3/common/MediaItem;->requestMetadata:Landroidx/media3/common/MediaItem$RequestMetadata;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Landroidx/media3/common/MediaItem$ClippingProperties;Landroidx/media3/common/MediaItem$LocalConfiguration;Landroidx/media3/common/MediaItem$LiveConfiguration;Landroidx/media3/common/MediaMetadata;Landroidx/media3/common/MediaItem$RequestMetadata;Landroidx/media3/common/MediaItem$1;)V
    .locals 0

    .line 45
    invoke-direct/range {p0 .. p6}, Landroidx/media3/common/MediaItem;-><init>(Ljava/lang/String;Landroidx/media3/common/MediaItem$ClippingProperties;Landroidx/media3/common/MediaItem$LocalConfiguration;Landroidx/media3/common/MediaItem$LiveConfiguration;Landroidx/media3/common/MediaMetadata;Landroidx/media3/common/MediaItem$RequestMetadata;)V

    return-void
.end method

.method public static fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/MediaItem;
    .locals 8

    .line 2418
    sget-object v0, Landroidx/media3/common/MediaItem;->FIELD_MEDIA_ID:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/String;

    .line 2419
    sget-object v0, Landroidx/media3/common/MediaItem;->FIELD_LIVE_CONFIGURATION:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2422
    sget-object v0, Landroidx/media3/common/MediaItem$LiveConfiguration;->UNSET:Landroidx/media3/common/MediaItem$LiveConfiguration;

    goto :goto_0

    .line 2424
    :cond_0
    invoke-static {v0}, Landroidx/media3/common/MediaItem$LiveConfiguration;->fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/MediaItem$LiveConfiguration;

    move-result-object v0

    :goto_0
    move-object v5, v0

    .line 2426
    sget-object v0, Landroidx/media3/common/MediaItem;->FIELD_MEDIA_METADATA:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_1

    .line 2429
    sget-object v0, Landroidx/media3/common/MediaMetadata;->EMPTY:Landroidx/media3/common/MediaMetadata;

    goto :goto_1

    .line 2431
    :cond_1
    invoke-static {v0}, Landroidx/media3/common/MediaMetadata;->fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/MediaMetadata;

    move-result-object v0

    :goto_1
    move-object v6, v0

    .line 2433
    sget-object v0, Landroidx/media3/common/MediaItem;->FIELD_CLIPPING_PROPERTIES:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_2

    .line 2436
    sget-object v0, Landroidx/media3/common/MediaItem$ClippingProperties;->UNSET:Landroidx/media3/common/MediaItem$ClippingProperties;

    goto :goto_2

    .line 2438
    :cond_2
    invoke-static {v0}, Landroidx/media3/common/MediaItem$ClippingConfiguration;->fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/MediaItem$ClippingProperties;

    move-result-object v0

    :goto_2
    move-object v3, v0

    .line 2440
    sget-object v0, Landroidx/media3/common/MediaItem;->FIELD_REQUEST_METADATA:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_3

    .line 2443
    sget-object v0, Landroidx/media3/common/MediaItem$RequestMetadata;->EMPTY:Landroidx/media3/common/MediaItem$RequestMetadata;

    goto :goto_3

    .line 2445
    :cond_3
    invoke-static {v0}, Landroidx/media3/common/MediaItem$RequestMetadata;->fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/MediaItem$RequestMetadata;

    move-result-object v0

    :goto_3
    move-object v7, v0

    .line 2447
    sget-object v0, Landroidx/media3/common/MediaItem;->FIELD_LOCAL_CONFIGURATION:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    if-nez p0, :cond_4

    const/4 p0, 0x0

    goto :goto_4

    .line 2452
    :cond_4
    invoke-static {p0}, Landroidx/media3/common/MediaItem$LocalConfiguration;->fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/MediaItem$LocalConfiguration;

    move-result-object p0

    :goto_4
    move-object v4, p0

    .line 2454
    new-instance p0, Landroidx/media3/common/MediaItem;

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Landroidx/media3/common/MediaItem;-><init>(Ljava/lang/String;Landroidx/media3/common/MediaItem$ClippingProperties;Landroidx/media3/common/MediaItem$LocalConfiguration;Landroidx/media3/common/MediaItem$LiveConfiguration;Landroidx/media3/common/MediaMetadata;Landroidx/media3/common/MediaItem$RequestMetadata;)V

    return-object p0
.end method

.method public static fromUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem;
    .locals 1

    .line 64
    new-instance v0, Landroidx/media3/common/MediaItem$Builder;

    invoke-direct {v0}, Landroidx/media3/common/MediaItem$Builder;-><init>()V

    invoke-virtual {v0, p0}, Landroidx/media3/common/MediaItem$Builder;->setUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object p0

    return-object p0
.end method

.method public static fromUri(Ljava/lang/String;)Landroidx/media3/common/MediaItem;
    .locals 1

    .line 54
    new-instance v0, Landroidx/media3/common/MediaItem$Builder;

    invoke-direct {v0}, Landroidx/media3/common/MediaItem$Builder;-><init>()V

    invoke-virtual {v0, p0}, Landroidx/media3/common/MediaItem$Builder;->setUri(Ljava/lang/String;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object p0

    return-object p0
.end method

.method private toBundle(Z)Landroid/os/Bundle;
    .locals 3

    .line 2368
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 2369
    iget-object v1, p0, Landroidx/media3/common/MediaItem;->mediaId:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2370
    sget-object v1, Landroidx/media3/common/MediaItem;->FIELD_MEDIA_ID:Ljava/lang/String;

    iget-object v2, p0, Landroidx/media3/common/MediaItem;->mediaId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 2372
    :cond_0
    iget-object v1, p0, Landroidx/media3/common/MediaItem;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    sget-object v2, Landroidx/media3/common/MediaItem$LiveConfiguration;->UNSET:Landroidx/media3/common/MediaItem$LiveConfiguration;

    invoke-virtual {v1, v2}, Landroidx/media3/common/MediaItem$LiveConfiguration;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 2373
    sget-object v1, Landroidx/media3/common/MediaItem;->FIELD_LIVE_CONFIGURATION:Ljava/lang/String;

    iget-object v2, p0, Landroidx/media3/common/MediaItem;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    invoke-virtual {v2}, Landroidx/media3/common/MediaItem$LiveConfiguration;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 2375
    :cond_1
    iget-object v1, p0, Landroidx/media3/common/MediaItem;->mediaMetadata:Landroidx/media3/common/MediaMetadata;

    sget-object v2, Landroidx/media3/common/MediaMetadata;->EMPTY:Landroidx/media3/common/MediaMetadata;

    invoke-virtual {v1, v2}, Landroidx/media3/common/MediaMetadata;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 2376
    sget-object v1, Landroidx/media3/common/MediaItem;->FIELD_MEDIA_METADATA:Ljava/lang/String;

    iget-object v2, p0, Landroidx/media3/common/MediaItem;->mediaMetadata:Landroidx/media3/common/MediaMetadata;

    invoke-virtual {v2}, Landroidx/media3/common/MediaMetadata;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 2378
    :cond_2
    iget-object v1, p0, Landroidx/media3/common/MediaItem;->clippingConfiguration:Landroidx/media3/common/MediaItem$ClippingConfiguration;

    sget-object v2, Landroidx/media3/common/MediaItem$ClippingConfiguration;->UNSET:Landroidx/media3/common/MediaItem$ClippingConfiguration;

    invoke-virtual {v1, v2}, Landroidx/media3/common/MediaItem$ClippingConfiguration;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 2379
    sget-object v1, Landroidx/media3/common/MediaItem;->FIELD_CLIPPING_PROPERTIES:Ljava/lang/String;

    iget-object v2, p0, Landroidx/media3/common/MediaItem;->clippingConfiguration:Landroidx/media3/common/MediaItem$ClippingConfiguration;

    invoke-virtual {v2}, Landroidx/media3/common/MediaItem$ClippingConfiguration;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 2381
    :cond_3
    iget-object v1, p0, Landroidx/media3/common/MediaItem;->requestMetadata:Landroidx/media3/common/MediaItem$RequestMetadata;

    sget-object v2, Landroidx/media3/common/MediaItem$RequestMetadata;->EMPTY:Landroidx/media3/common/MediaItem$RequestMetadata;

    invoke-virtual {v1, v2}, Landroidx/media3/common/MediaItem$RequestMetadata;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 2382
    sget-object v1, Landroidx/media3/common/MediaItem;->FIELD_REQUEST_METADATA:Ljava/lang/String;

    iget-object v2, p0, Landroidx/media3/common/MediaItem;->requestMetadata:Landroidx/media3/common/MediaItem$RequestMetadata;

    invoke-virtual {v2}, Landroidx/media3/common/MediaItem$RequestMetadata;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_4
    if-eqz p1, :cond_5

    .line 2384
    iget-object p1, p0, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    if-eqz p1, :cond_5

    .line 2385
    sget-object v1, Landroidx/media3/common/MediaItem;->FIELD_LOCAL_CONFIGURATION:Ljava/lang/String;

    invoke-virtual {p1}, Landroidx/media3/common/MediaItem$LocalConfiguration;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_5
    return-object v0
.end method


# virtual methods
.method public buildUpon()Landroidx/media3/common/MediaItem$Builder;
    .locals 2

    .line 2326
    new-instance v0, Landroidx/media3/common/MediaItem$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/media3/common/MediaItem$Builder;-><init>(Landroidx/media3/common/MediaItem;Landroidx/media3/common/MediaItem$1;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 2334
    :cond_0
    instance-of v1, p1, Landroidx/media3/common/MediaItem;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2338
    :cond_1
    check-cast p1, Landroidx/media3/common/MediaItem;

    .line 2340
    iget-object v1, p0, Landroidx/media3/common/MediaItem;->mediaId:Ljava/lang/String;

    iget-object v3, p1, Landroidx/media3/common/MediaItem;->mediaId:Ljava/lang/String;

    invoke-static {v1, v3}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/media3/common/MediaItem;->clippingConfiguration:Landroidx/media3/common/MediaItem$ClippingConfiguration;

    iget-object v3, p1, Landroidx/media3/common/MediaItem;->clippingConfiguration:Landroidx/media3/common/MediaItem$ClippingConfiguration;

    .line 2341
    invoke-virtual {v1, v3}, Landroidx/media3/common/MediaItem$ClippingConfiguration;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    iget-object v3, p1, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    .line 2342
    invoke-static {v1, v3}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/media3/common/MediaItem;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    iget-object v3, p1, Landroidx/media3/common/MediaItem;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    .line 2343
    invoke-static {v1, v3}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/media3/common/MediaItem;->mediaMetadata:Landroidx/media3/common/MediaMetadata;

    iget-object v3, p1, Landroidx/media3/common/MediaItem;->mediaMetadata:Landroidx/media3/common/MediaMetadata;

    .line 2344
    invoke-static {v1, v3}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/media3/common/MediaItem;->requestMetadata:Landroidx/media3/common/MediaItem$RequestMetadata;

    iget-object p1, p1, Landroidx/media3/common/MediaItem;->requestMetadata:Landroidx/media3/common/MediaItem$RequestMetadata;

    .line 2345
    invoke-static {v1, p1}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 2350
    iget-object v0, p0, Landroidx/media3/common/MediaItem;->mediaId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 2351
    iget-object v1, p0, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroidx/media3/common/MediaItem$LocalConfiguration;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 2352
    iget-object v1, p0, Landroidx/media3/common/MediaItem;->liveConfiguration:Landroidx/media3/common/MediaItem$LiveConfiguration;

    invoke-virtual {v1}, Landroidx/media3/common/MediaItem$LiveConfiguration;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 2353
    iget-object v1, p0, Landroidx/media3/common/MediaItem;->clippingConfiguration:Landroidx/media3/common/MediaItem$ClippingConfiguration;

    invoke-virtual {v1}, Landroidx/media3/common/MediaItem$ClippingConfiguration;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 2354
    iget-object v1, p0, Landroidx/media3/common/MediaItem;->mediaMetadata:Landroidx/media3/common/MediaMetadata;

    invoke-virtual {v1}, Landroidx/media3/common/MediaMetadata;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 2355
    iget-object v1, p0, Landroidx/media3/common/MediaItem;->requestMetadata:Landroidx/media3/common/MediaItem$RequestMetadata;

    invoke-virtual {v1}, Landroidx/media3/common/MediaItem$RequestMetadata;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 1

    const/4 v0, 0x0

    .line 2398
    invoke-direct {p0, v0}, Landroidx/media3/common/MediaItem;->toBundle(Z)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public toBundleIncludeLocalConfiguration()Landroid/os/Bundle;
    .locals 1

    const/4 v0, 0x1

    .line 2407
    invoke-direct {p0, v0}, Landroidx/media3/common/MediaItem;->toBundle(Z)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method
