.class public Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;
.super Landroidx/media3/exoplayer/trackselection/MappingTrackSelector;
.source "DefaultTrackSelector.java"

# interfaces
.implements Landroidx/media3/exoplayer/RendererCapabilities$Listener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;,
        Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;,
        Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$ParametersBuilder;,
        Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;,
        Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$OtherTrackScore;,
        Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;,
        Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$ImageTrackInfo;,
        Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TextTrackInfo;,
        Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$AudioTrackInfo;,
        Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$VideoTrackInfo;
    }
.end annotation


# static fields
.field private static final AUDIO_CHANNEL_COUNT_CONSTRAINTS_WARN_MESSAGE:Ljava/lang/String; = "Audio channel count constraints cannot be applied without reference to Context. Build the track selector instance with one of the non-deprecated constructors that take a Context argument."

.field private static final FORMAT_VALUE_ORDERING:Lcom/google/common/collect/Ordering;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Ordering<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final FRACTION_TO_CONSIDER_FULLSCREEN:F = 0.98f

.field protected static final SELECTION_ELIGIBILITY_ADAPTIVE:I = 0x2

.field protected static final SELECTION_ELIGIBILITY_FIXED:I = 0x1

.field protected static final SELECTION_ELIGIBILITY_NO:I = 0x0

.field private static final TAG:Ljava/lang/String; = "DefaultTrackSelector"


# instance fields
.field private audioAttributes:Landroidx/media3/common/AudioAttributes;

.field public final context:Landroid/content/Context;

.field private final deviceIsTV:Z

.field private final lock:Ljava/lang/Object;

.field private parameters:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

.field private spatializer:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

.field private final trackSelectionFactory:Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;


# direct methods
.method public static synthetic $r8$lambda$xSqYhF9RuDotO9TC1HyBFBSO7Fw(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;Landroidx/media3/common/Format;)Z
    .locals 0

    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->isAudioFormatWithinAudioChannelCountConstraints(Landroidx/media3/common/Format;)Z

    move-result p0

    return p0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 2337
    new-instance v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda0;-><init>()V

    .line 2338
    invoke-static {v0}, Lcom/google/common/collect/Ordering;->from(Ljava/util/Comparator;)Lcom/google/common/collect/Ordering;

    move-result-object v0

    sput-object v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->FORMAT_VALUE_ORDERING:Lcom/google/common/collect/Ordering;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 2363
    new-instance v0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$Factory;

    invoke-direct {v0}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$Factory;-><init>()V

    invoke-direct {p0, p1, v0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;-><init>(Landroid/content/Context;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/media3/common/TrackSelectionParameters;)V
    .locals 1

    .line 2379
    new-instance v0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$Factory;

    invoke-direct {v0}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$Factory;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;-><init>(Landroid/content/Context;Landroidx/media3/common/TrackSelectionParameters;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/media3/common/TrackSelectionParameters;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;)V
    .locals 0

    .line 2403
    invoke-direct {p0, p2, p3, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;-><init>(Landroidx/media3/common/TrackSelectionParameters;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;)V
    .locals 1

    .line 2371
    invoke-static {p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->getDefaults(Landroid/content/Context;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;-><init>(Landroid/content/Context;Landroidx/media3/common/TrackSelectionParameters;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;)V

    return-void
.end method

.method public constructor <init>(Landroidx/media3/common/TrackSelectionParameters;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 2391
    invoke-direct {p0, p1, p2, v0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;-><init>(Landroidx/media3/common/TrackSelectionParameters;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;Landroid/content/Context;)V

    return-void
.end method

.method private constructor <init>(Landroidx/media3/common/TrackSelectionParameters;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;Landroid/content/Context;)V
    .locals 1

    .line 2419
    invoke-direct {p0}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector;-><init>()V

    .line 2420
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->lock:Ljava/lang/Object;

    if-eqz p3, :cond_0

    .line 2421
    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->context:Landroid/content/Context;

    .line 2422
    iput-object p2, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->trackSelectionFactory:Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;

    .line 2423
    instance-of p2, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    if-eqz p2, :cond_1

    .line 2424
    check-cast p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->parameters:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    goto :goto_2

    :cond_1
    if-nez p3, :cond_2

    .line 2427
    sget-object p2, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    goto :goto_1

    :cond_2
    invoke-static {p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->getDefaults(Landroid/content/Context;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    move-result-object p2

    .line 2428
    :goto_1
    invoke-virtual {p2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->buildUpon()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->set(Landroidx/media3/common/TrackSelectionParameters;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->build()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->parameters:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    .line 2430
    :goto_2
    sget-object p1, Landroidx/media3/common/AudioAttributes;->DEFAULT:Landroidx/media3/common/AudioAttributes;

    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->audioAttributes:Landroidx/media3/common/AudioAttributes;

    if-eqz p3, :cond_3

    .line 2431
    invoke-static {p3}, Landroidx/media3/common/util/Util;->isTv(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_3

    const/4 p1, 0x1

    goto :goto_3

    :cond_3
    const/4 p1, 0x0

    :goto_3
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->deviceIsTV:Z

    if-nez p1, :cond_4

    if-eqz p3, :cond_4

    .line 2432
    sget p1, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 p2, 0x20

    if-lt p1, p2, :cond_4

    .line 2433
    invoke-static {p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->tryCreateInstance(Landroid/content/Context;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->spatializer:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

    .line 2435
    :cond_4
    iget-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->parameters:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    iget-boolean p1, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->constrainAudioChannelCountToDeviceCapabilities:Z

    if-eqz p1, :cond_5

    if-nez p3, :cond_5

    .line 2436
    const-string p1, "DefaultTrackSelector"

    const-string p2, "Audio channel count constraints cannot be applied without reference to Context. Build the track selector instance with one of the non-deprecated constructors that take a Context argument."

    invoke-static {p1, p2}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    return-void
.end method

.method static synthetic access$4100(Landroidx/media3/common/TrackGroup;IIZ)I
    .locals 0

    .line 121
    invoke-static {p0, p1, p2, p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->getMaxVideoPixelsToRetainForViewport(Landroidx/media3/common/TrackGroup;IIZ)I

    move-result p0

    return p0
.end method

.method static synthetic access$4200(II)I
    .locals 0

    .line 121
    invoke-static {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->getRoleFlagMatchScore(II)I

    move-result p0

    return p0
.end method

.method static synthetic access$4300(Ljava/lang/String;)I
    .locals 0

    .line 121
    invoke-static {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->getVideoCodecPreferenceScore(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static synthetic access$4400()Lcom/google/common/collect/Ordering;
    .locals 1

    .line 121
    sget-object v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->FORMAT_VALUE_ORDERING:Lcom/google/common/collect/Ordering;

    return-object v0
.end method

.method static synthetic access$4500(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;ILandroidx/media3/common/Format;)Z
    .locals 0

    .line 121
    invoke-static {p0, p1, p2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->rendererSupportsOffload(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;ILandroidx/media3/common/Format;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$4600(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;)V
    .locals 0

    .line 121
    invoke-direct {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->maybeInvalidateForAudioChannelCountConstraints()V

    return-void
.end method

.method private static applyLegacyRendererOverrides(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;)V
    .locals 6

    .line 3099
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 3101
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getTrackGroups(I)Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-result-object v2

    .line 3102
    invoke-virtual {p1, v1, v2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->hasSelectionOverride(ILandroidx/media3/exoplayer/source/TrackGroupArray;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_2

    .line 3106
    :cond_0
    invoke-virtual {p1, v1, v2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->getSelectionOverride(ILandroidx/media3/exoplayer/source/TrackGroupArray;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 3108
    iget-object v4, v3, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;->tracks:[I

    array-length v4, v4

    if-eqz v4, :cond_1

    .line 3109
    new-instance v4, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    iget v5, v3, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;->groupIndex:I

    .line 3111
    invoke-virtual {v2, v5}, Landroidx/media3/exoplayer/source/TrackGroupArray;->get(I)Landroidx/media3/common/TrackGroup;

    move-result-object v2

    iget-object v5, v3, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;->tracks:[I

    iget v3, v3, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;->type:I

    invoke-direct {v4, v2, v5, v3}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;-><init>(Landroidx/media3/common/TrackGroup;[II)V

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    .line 3115
    :goto_1
    aput-object v4, p2, v1

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private static applyTrackSelectionOverrides(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;Landroidx/media3/common/TrackSelectionParameters;[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;)V
    .locals 5

    .line 3035
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererCount()I

    move-result v0

    .line 3038
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_0

    .line 3041
    invoke-virtual {p0, v3}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getTrackGroups(I)Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-result-object v4

    .line 3040
    invoke-static {v4, p1, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->collectTrackSelectionOverrides(Landroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/common/TrackSelectionParameters;Ljava/util/Map;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 3044
    :cond_0
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getUnmappedTrackGroups()Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-result-object v3

    .line 3043
    invoke-static {v3, p1, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->collectTrackSelectionOverrides(Landroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/common/TrackSelectionParameters;Ljava/util/Map;)V

    :goto_1
    if-ge v2, v0, :cond_3

    .line 3048
    invoke-virtual {p0, v2}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererType(I)I

    move-result p1

    .line 3049
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/common/TrackSelectionOverride;

    if-nez p1, :cond_1

    goto :goto_3

    .line 3056
    :cond_1
    iget-object v3, p1, Landroidx/media3/common/TrackSelectionOverride;->trackIndices:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 3057
    invoke-virtual {p0, v2}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getTrackGroups(I)Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-result-object v3

    iget-object v4, p1, Landroidx/media3/common/TrackSelectionOverride;->mediaTrackGroup:Landroidx/media3/common/TrackGroup;

    invoke-virtual {v3, v4}, Landroidx/media3/exoplayer/source/TrackGroupArray;->indexOf(Landroidx/media3/common/TrackGroup;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_2

    .line 3059
    new-instance v3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    iget-object v4, p1, Landroidx/media3/common/TrackSelectionOverride;->mediaTrackGroup:Landroidx/media3/common/TrackGroup;

    iget-object p1, p1, Landroidx/media3/common/TrackSelectionOverride;->trackIndices:Lcom/google/common/collect/ImmutableList;

    .line 3061
    invoke-static {p1}, Lcom/google/common/primitives/Ints;->toArray(Ljava/util/Collection;)[I

    move-result-object p1

    invoke-direct {v3, v4, p1}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;-><init>(Landroidx/media3/common/TrackGroup;[I)V

    goto :goto_2

    :cond_2
    const/4 v3, 0x0

    .line 3065
    :goto_2
    aput-object v3, p2, v2

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method private static collectTrackSelectionOverrides(Landroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/common/TrackSelectionParameters;Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/source/TrackGroupArray;",
            "Landroidx/media3/common/TrackSelectionParameters;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/media3/common/TrackSelectionOverride;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 3079
    :goto_0
    iget v1, p0, Landroidx/media3/exoplayer/source/TrackGroupArray;->length:I

    if-ge v0, v1, :cond_3

    .line 3080
    invoke-virtual {p0, v0}, Landroidx/media3/exoplayer/source/TrackGroupArray;->get(I)Landroidx/media3/common/TrackGroup;

    move-result-object v1

    .line 3081
    iget-object v2, p1, Landroidx/media3/common/TrackSelectionParameters;->overrides:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2, v1}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/common/TrackSelectionOverride;

    if-nez v1, :cond_0

    goto :goto_1

    .line 3085
    :cond_0
    invoke-virtual {v1}, Landroidx/media3/common/TrackSelectionOverride;->getType()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/common/TrackSelectionOverride;

    if-eqz v2, :cond_1

    .line 3087
    iget-object v2, v2, Landroidx/media3/common/TrackSelectionOverride;->trackIndices:Lcom/google/common/collect/ImmutableList;

    .line 3088
    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, v1, Landroidx/media3/common/TrackSelectionOverride;->trackIndices:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 3089
    :cond_1
    invoke-virtual {v1}, Landroidx/media3/common/TrackSelectionOverride;->getType()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p2, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method protected static getFormatLanguageScore(Landroidx/media3/common/Format;Ljava/lang/String;Z)I
    .locals 1

    .line 3329
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/media3/common/Format;->language:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x4

    return p0

    .line 3333
    :cond_0
    invoke-static {p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->normalizeUndeterminedLanguageToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 3334
    iget-object p0, p0, Landroidx/media3/common/Format;->language:Ljava/lang/String;

    invoke-static {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->normalizeUndeterminedLanguageToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_5

    if-nez p1, :cond_1

    goto :goto_1

    .line 3339
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_4

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    goto :goto_0

    .line 3343
    :cond_2
    const-string p2, "-"

    invoke-static {p0, p2}, Landroidx/media3/common/util/Util;->splitAtFirst(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    aget-object p0, p0, v0

    .line 3344
    invoke-static {p1, p2}, Landroidx/media3/common/util/Util;->splitAtFirst(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    aget-object p1, p1, v0

    .line 3345
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 p0, 0x2

    return p0

    :cond_3
    return v0

    :cond_4
    :goto_0
    const/4 p0, 0x3

    return p0

    :cond_5
    :goto_1
    if-eqz p2, :cond_6

    if-nez p0, :cond_6

    const/4 v0, 0x1

    :cond_6
    return v0
.end method

.method private static getMaxVideoPixelsToRetainForViewport(Landroidx/media3/common/TrackGroup;IIZ)I
    .locals 8

    const v0, 0x7fffffff

    if-eq p1, v0, :cond_2

    if-ne p2, v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    .line 3358
    :goto_0
    iget v2, p0, Landroidx/media3/common/TrackGroup;->length:I

    if-ge v1, v2, :cond_2

    .line 3359
    invoke-virtual {p0, v1}, Landroidx/media3/common/TrackGroup;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object v2

    .line 3362
    iget v3, v2, Landroidx/media3/common/Format;->width:I

    if-lez v3, :cond_1

    iget v3, v2, Landroidx/media3/common/Format;->height:I

    if-lez v3, :cond_1

    .line 3363
    iget v3, v2, Landroidx/media3/common/Format;->width:I

    iget v4, v2, Landroidx/media3/common/Format;->height:I

    .line 3364
    invoke-static {p3, p1, p2, v3, v4}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->getMaxVideoSizeInViewport(ZIIII)Landroid/graphics/Point;

    move-result-object v3

    .line 3366
    iget v4, v2, Landroidx/media3/common/Format;->width:I

    iget v5, v2, Landroidx/media3/common/Format;->height:I

    mul-int v4, v4, v5

    .line 3367
    iget v5, v2, Landroidx/media3/common/Format;->width:I

    iget v6, v3, Landroid/graphics/Point;->x:I

    int-to-float v6, v6

    const v7, 0x3f7ae148    # 0.98f

    mul-float v6, v6, v7

    float-to-int v6, v6

    if-lt v5, v6, :cond_1

    iget v2, v2, Landroidx/media3/common/Format;->height:I

    iget v3, v3, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    mul-float v3, v3, v7

    float-to-int v3, v3

    if-lt v2, v3, :cond_1

    if-ge v4, v0, :cond_1

    move v0, v4

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return v0
.end method

.method private static getMaxVideoSizeInViewport(ZIIII)Landroid/graphics/Point;
    .locals 3

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    const/4 v0, 0x0

    if-le p3, p4, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-le p1, p2, :cond_1

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :goto_1
    if-eq v1, p0, :cond_2

    goto :goto_2

    :cond_2
    move v2, p2

    move p2, p1

    move p1, v2

    :goto_2
    mul-int p0, p3, p1

    mul-int v0, p4, p2

    if-lt p0, v0, :cond_3

    .line 3396
    new-instance p0, Landroid/graphics/Point;

    invoke-static {v0, p3}, Landroidx/media3/common/util/Util;->ceilDivide(II)I

    move-result p1

    invoke-direct {p0, p2, p1}, Landroid/graphics/Point;-><init>(II)V

    return-object p0

    .line 3399
    :cond_3
    new-instance p2, Landroid/graphics/Point;

    invoke-static {p0, p4}, Landroidx/media3/common/util/Util;->ceilDivide(II)I

    move-result p0

    invoke-direct {p2, p0, p1}, Landroid/graphics/Point;-><init>(II)V

    return-object p2
.end method

.method private static getRoleFlagMatchScore(II)I
    .locals 0

    if-eqz p0, :cond_0

    if-ne p0, p1, :cond_0

    const p0, 0x7fffffff

    return p0

    :cond_0
    and-int/2addr p0, p1

    .line 3408
    invoke-static {p0}, Ljava/lang/Integer;->bitCount(I)I

    move-result p0

    return p0
.end method

.method private static getVideoCodecPreferenceScore(Ljava/lang/String;)I
    .locals 7

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 3419
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x4

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, -0x1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v1, "video/x-vnd.on2.vp9"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v6, 0x4

    goto :goto_0

    :sswitch_1
    const-string v1, "video/avc"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v6, 0x3

    goto :goto_0

    :sswitch_2
    const-string v1, "video/hevc"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v6, 0x2

    goto :goto_0

    :sswitch_3
    const-string v1, "video/av01"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto :goto_0

    :cond_4
    const/4 v6, 0x1

    goto :goto_0

    :sswitch_4
    const-string v1, "video/dolby-vision"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto :goto_0

    :cond_5
    const/4 v6, 0x0

    :goto_0
    packed-switch v6, :pswitch_data_0

    return v0

    :pswitch_0
    return v4

    :pswitch_1
    return v5

    :pswitch_2
    return v3

    :pswitch_3
    return v2

    :pswitch_4
    const/4 p0, 0x5

    return p0

    :sswitch_data_0
    .sparse-switch
        -0x6e5534ef -> :sswitch_4
        -0x631b55f6 -> :sswitch_3
        -0x63185e82 -> :sswitch_2
        0x4f62373a -> :sswitch_1
        0x5f50bed9 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private isAudioFormatWithinAudioChannelCountConstraints(Landroidx/media3/common/Format;)Z
    .locals 3

    .line 2816
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 2817
    :try_start_0
    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->parameters:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    iget-boolean v1, v1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->constrainAudioChannelCountToDeviceCapabilities:Z

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->deviceIsTV:Z

    if-nez v1, :cond_2

    iget v1, p1, Landroidx/media3/common/Format;->channelCount:I

    const/4 v2, 0x2

    if-le v1, v2, :cond_2

    .line 2820
    invoke-static {p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->isDolbyAudio(Landroidx/media3/common/Format;)Z

    move-result v1

    const/16 v2, 0x20

    if-eqz v1, :cond_0

    sget v1, Landroidx/media3/common/util/Util;->SDK_INT:I

    if-lt v1, v2, :cond_2

    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->spatializer:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

    if-eqz v1, :cond_2

    .line 2823
    invoke-virtual {v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->isSpatializationSupported()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    sget v1, Landroidx/media3/common/util/Util;->SDK_INT:I

    if-lt v1, v2, :cond_1

    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->spatializer:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

    if-eqz v1, :cond_1

    .line 2826
    invoke-virtual {v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->isSpatializationSupported()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->spatializer:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

    .line 2827
    invoke-virtual {v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->isAvailable()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->spatializer:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

    .line 2828
    invoke-virtual {v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->spatializer:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

    iget-object v2, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->audioAttributes:Landroidx/media3/common/AudioAttributes;

    .line 2829
    invoke-virtual {v1, v2, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->canBeSpatialized(Landroidx/media3/common/AudioAttributes;Landroidx/media3/common/Format;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    :goto_1
    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    .line 2830
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private static isDolbyAudio(Landroidx/media3/common/Format;)Z
    .locals 4

    .line 3436
    iget-object v0, p0, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 3439
    :cond_0
    iget-object p0, p0, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v2, 0x1

    const/4 v3, -0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "audio/eac3"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x3

    goto :goto_0

    :sswitch_1
    const-string v0, "audio/ac4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v3, 0x2

    goto :goto_0

    :sswitch_2
    const-string v0, "audio/ac3"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v3, 0x1

    goto :goto_0

    :sswitch_3
    const-string v0, "audio/eac3-joc"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto :goto_0

    :cond_4
    const/4 v3, 0x0

    :goto_0
    packed-switch v3, :pswitch_data_0

    return v1

    :pswitch_0
    return v2

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7e929daa -> :sswitch_3
        0xb269698 -> :sswitch_2
        0xb269699 -> :sswitch_1
        0x59ae0c65 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected static isSupported(IZ)Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3299
    invoke-static {p0, p1}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->isFormatSupported(IZ)Z

    move-result p0

    return p0
.end method

.method static synthetic lambda$selectImageTrack$4(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;ILandroidx/media3/common/TrackGroup;[I)Ljava/util/List;
    .locals 0

    .line 2897
    invoke-static {p1, p2, p0, p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$ImageTrackInfo;->createForTrackGroup(ILandroidx/media3/common/TrackGroup;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;[I)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$selectTextTrack$3(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;Ljava/lang/String;ILandroidx/media3/common/TrackGroup;[I)Ljava/util/List;
    .locals 0

    .line 2864
    invoke-static {p2, p3, p0, p4, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TextTrackInfo;->createForTrackGroup(ILandroidx/media3/common/TrackGroup;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;[ILjava/lang/String;)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$selectVideoTrack$1(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;[IILandroidx/media3/common/TrackGroup;[I)Ljava/util/List;
    .locals 0

    .line 2745
    aget p1, p1, p2

    invoke-static {p2, p3, p0, p4, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$VideoTrackInfo;->createForTrackGroup(ILandroidx/media3/common/TrackGroup;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;[II)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$static$0(Ljava/lang/Integer;Ljava/lang/Integer;)I
    .locals 2

    .line 2340
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 2341
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-ne p0, v1, :cond_2

    const/4 v1, 0x0

    goto :goto_0

    .line 2342
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sub-int v1, p0, p1

    :cond_2
    :goto_0
    return v1
.end method

.method private static maybeConfigureRendererForOffload(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[I[Landroidx/media3/exoplayer/RendererConfiguration;[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;)V
    .locals 7

    const/4 v0, -0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 3228
    :goto_0
    invoke-virtual {p1}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererCount()I

    move-result v4

    const/4 v5, 0x1

    if-ge v2, v4, :cond_2

    .line 3229
    invoke-virtual {p1, v2}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererType(I)I

    move-result v4

    .line 3230
    aget-object v6, p4, v2

    if-eq v4, v5, :cond_0

    if-eqz v6, :cond_0

    goto :goto_2

    :cond_0
    if-ne v4, v5, :cond_1

    if-eqz v6, :cond_1

    .line 3237
    invoke-interface {v6}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->length()I

    move-result v4

    if-ne v4, v5, :cond_1

    .line 3239
    invoke-virtual {p1, v2}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getTrackGroups(I)Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-result-object v4

    invoke-interface {v6}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getTrackGroup()Landroidx/media3/common/TrackGroup;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroidx/media3/exoplayer/source/TrackGroupArray;->indexOf(Landroidx/media3/common/TrackGroup;)I

    move-result v4

    .line 3241
    aget-object v5, p2, v2

    aget-object v4, v5, v4

    .line 3242
    invoke-interface {v6, v1}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getIndexInTrackGroup(I)I

    move-result v5

    aget v4, v4, v5

    .line 3244
    invoke-interface {v6}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getSelectedFormat()Landroidx/media3/common/Format;

    move-result-object v5

    .line 3243
    invoke-static {p0, v4, v5}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->rendererSupportsOffload(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;ILandroidx/media3/common/Format;)Z

    move-result v4

    if-eqz v4, :cond_1

    add-int/lit8 v3, v3, 0x1

    move v0, v2

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    if-ne v3, v5, :cond_5

    .line 3251
    new-instance p1, Landroidx/media3/exoplayer/RendererConfiguration;

    .line 3253
    iget-object p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iget-boolean p0, p0, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->isGaplessSupportRequired:Z

    if-eqz p0, :cond_3

    const/4 p0, 0x1

    goto :goto_1

    :cond_3
    const/4 p0, 0x2

    .line 3255
    :goto_1
    aget-object p2, p3, v0

    if-eqz p2, :cond_4

    iget-boolean p2, p2, Landroidx/media3/exoplayer/RendererConfiguration;->tunneling:Z

    if-eqz p2, :cond_4

    const/4 v1, 0x1

    :cond_4
    invoke-direct {p1, p0, v1}, Landroidx/media3/exoplayer/RendererConfiguration;-><init>(IZ)V

    .line 3258
    aput-object p1, p3, v0

    :cond_5
    :goto_2
    return-void
.end method

.method private static maybeConfigureRenderersForTunneling(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[I[Landroidx/media3/exoplayer/RendererConfiguration;[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;)V
    .locals 10

    const/4 v0, -0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/4 v4, -0x1

    .line 3141
    :goto_0
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererCount()I

    move-result v5

    const/4 v6, 0x1

    if-ge v2, v5, :cond_5

    .line 3142
    invoke-virtual {p0, v2}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererType(I)I

    move-result v5

    .line 3143
    aget-object v7, p3, v2

    if-eq v5, v6, :cond_0

    const/4 v8, 0x2

    if-ne v5, v8, :cond_4

    :cond_0
    if-eqz v7, :cond_4

    .line 3146
    aget-object v8, p1, v2

    .line 3147
    invoke-virtual {p0, v2}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getTrackGroups(I)Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-result-object v9

    .line 3146
    invoke-static {v8, v9, v7}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->rendererSupportsTunneling([[ILandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;)Z

    move-result v7

    if-eqz v7, :cond_4

    if-ne v5, v6, :cond_2

    if-eq v4, v0, :cond_1

    goto :goto_1

    :cond_1
    move v4, v2

    goto :goto_2

    :cond_2
    if-eq v3, v0, :cond_3

    :goto_1
    const/4 p0, 0x0

    goto :goto_3

    :cond_3
    move v3, v2

    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_5
    const/4 p0, 0x1

    :goto_3
    if-eq v4, v0, :cond_6

    if-eq v3, v0, :cond_6

    const/4 p1, 0x1

    goto :goto_4

    :cond_6
    const/4 p1, 0x0

    :goto_4
    and-int/2addr p0, p1

    if-eqz p0, :cond_7

    .line 3168
    new-instance p0, Landroidx/media3/exoplayer/RendererConfiguration;

    invoke-direct {p0, v1, v6}, Landroidx/media3/exoplayer/RendererConfiguration;-><init>(IZ)V

    .line 3170
    aput-object p0, p2, v4

    .line 3171
    aput-object p0, p2, v3

    :cond_7
    return-void
.end method

.method private maybeInvalidateForAudioChannelCountConstraints()V
    .locals 3

    .line 3006
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 3007
    :try_start_0
    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->parameters:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    iget-boolean v1, v1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->constrainAudioChannelCountToDeviceCapabilities:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->deviceIsTV:Z

    if-nez v1, :cond_0

    sget v1, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v2, 0x20

    if-lt v1, v2, :cond_0

    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->spatializer:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

    if-eqz v1, :cond_0

    .line 3012
    invoke-virtual {v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->isSpatializationSupported()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 3013
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 3015
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->invalidate()V

    :cond_1
    return-void

    :catchall_0
    move-exception v1

    .line 3013
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private maybeInvalidateForRendererCapabilitiesChange(Landroidx/media3/exoplayer/Renderer;)V
    .locals 2

    .line 3021
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 3022
    :try_start_0
    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->parameters:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    iget-boolean v1, v1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowInvalidateSelectionsOnRendererCapabilitiesChange:Z

    .line 3023
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 3025
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->invalidateForRendererCapabilitiesChange(Landroidx/media3/exoplayer/Renderer;)V

    :cond_0
    return-void

    :catchall_0
    move-exception p1

    .line 3023
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected static normalizeUndeterminedLanguageToNull(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 3310
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "und"

    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 p0, 0x0

    :cond_1
    return-object p0
.end method

.method private static rendererSupportsOffload(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;ILandroidx/media3/common/Format;)Z
    .locals 2

    .line 3272
    invoke-static {p1}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->getAudioOffloadSupport(I)I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 3275
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iget-boolean v0, v0, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->isSpeedChangeSupportRequired:Z

    if-eqz v0, :cond_1

    .line 3276
    invoke-static {p1}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->getAudioOffloadSupport(I)I

    move-result v0

    and-int/lit16 v0, v0, 0x800

    if-nez v0, :cond_1

    return v1

    .line 3282
    :cond_1
    iget-object p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iget-boolean p0, p0, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->isGaplessSupportRequired:Z

    const/4 v0, 0x1

    if-eqz p0, :cond_7

    .line 3283
    iget p0, p2, Landroidx/media3/common/Format;->encoderDelay:I

    if-nez p0, :cond_3

    iget p0, p2, Landroidx/media3/common/Format;->encoderPadding:I

    if-eqz p0, :cond_2

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 3285
    :goto_1
    invoke-static {p1}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->getAudioOffloadSupport(I)I

    move-result p1

    and-int/lit16 p1, p1, 0x400

    if-eqz p1, :cond_4

    const/4 p1, 0x1

    goto :goto_2

    :cond_4
    const/4 p1, 0x0

    :goto_2
    if-eqz p0, :cond_5

    if-eqz p1, :cond_6

    :cond_5
    const/4 v1, 0x1

    :cond_6
    return v1

    :cond_7
    return v0
.end method

.method private static rendererSupportsTunneling([[ILandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p2, :cond_0

    return v0

    .line 3191
    :cond_0
    invoke-interface {p2}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getTrackGroup()Landroidx/media3/common/TrackGroup;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroidx/media3/exoplayer/source/TrackGroupArray;->indexOf(Landroidx/media3/common/TrackGroup;)I

    move-result p1

    const/4 v1, 0x0

    .line 3192
    :goto_0
    invoke-interface {p2}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 3194
    aget-object v2, p0, p1

    invoke-interface {p2, v1}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;->getIndexInTrackGroup(I)I

    move-result v3

    aget v2, v2, v3

    .line 3195
    invoke-static {v2}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->getTunnelingSupport(I)I

    move-result v2

    const/16 v3, 0x20

    if-eq v2, v3, :cond_1

    return v0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method private selectTracksForType(ILandroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo$Factory;Ljava/util/Comparator;)Landroid/util/Pair;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo<",
            "TT;>;>(I",
            "Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;",
            "[[[I",
            "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo$Factory<",
            "TT;>;",
            "Ljava/util/Comparator<",
            "Ljava/util/List<",
            "TT;>;>;)",
            "Landroid/util/Pair<",
            "Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p2

    .line 2953
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2954
    invoke-virtual/range {p2 .. p2}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererCount()I

    move-result v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_7

    .line 2956
    invoke-virtual {v0, v4}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererType(I)I

    move-result v5

    move/from16 v6, p1

    if-ne v6, v5, :cond_6

    .line 2957
    invoke-virtual {v0, v4}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getTrackGroups(I)Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-result-object v5

    const/4 v7, 0x0

    .line 2958
    :goto_1
    iget v8, v5, Landroidx/media3/exoplayer/source/TrackGroupArray;->length:I

    if-ge v7, v8, :cond_6

    .line 2959
    invoke-virtual {v5, v7}, Landroidx/media3/exoplayer/source/TrackGroupArray;->get(I)Landroidx/media3/common/TrackGroup;

    move-result-object v8

    .line 2960
    aget-object v9, p3, v4

    aget-object v9, v9, v7

    move-object/from16 v10, p4

    .line 2961
    invoke-interface {v10, v4, v8, v9}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo$Factory;->create(ILandroidx/media3/common/TrackGroup;[I)Ljava/util/List;

    move-result-object v9

    .line 2962
    iget v11, v8, Landroidx/media3/common/TrackGroup;->length:I

    new-array v11, v11, [Z

    const/4 v12, 0x0

    .line 2963
    :goto_2
    iget v13, v8, Landroidx/media3/common/TrackGroup;->length:I

    if-ge v12, v13, :cond_5

    .line 2964
    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;

    .line 2965
    invoke-virtual {v13}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;->getSelectionEligibility()I

    move-result v14

    .line 2966
    aget-boolean v15, v11, v12

    if-nez v15, :cond_4

    if-nez v14, :cond_0

    goto :goto_6

    :cond_0
    const/4 v15, 0x1

    if-ne v14, v15, :cond_1

    .line 2971
    invoke-static {v13}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v13

    move/from16 v17, v2

    goto :goto_5

    .line 2973
    :cond_1
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 2974
    invoke-interface {v14, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v16, v12, 0x1

    move/from16 v3, v16

    .line 2975
    :goto_3
    iget v15, v8, Landroidx/media3/common/TrackGroup;->length:I

    if-ge v3, v15, :cond_3

    .line 2976
    invoke-interface {v9, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;

    .line 2977
    invoke-virtual {v15}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;->getSelectionEligibility()I

    move-result v0

    move/from16 v17, v2

    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 2978
    invoke-virtual {v13, v15}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;->isCompatibleForAdaptationWith(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2979
    invoke-interface {v14, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x1

    .line 2980
    aput-boolean v0, v11, v3

    goto :goto_4

    :cond_2
    const/4 v0, 0x1

    :goto_4
    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p2

    move/from16 v2, v17

    goto :goto_3

    :cond_3
    move/from16 v17, v2

    move-object v13, v14

    .line 2985
    :goto_5
    invoke-virtual {v1, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :cond_4
    :goto_6
    move/from16 v17, v2

    :goto_7
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p2

    move/from16 v2, v17

    goto :goto_2

    :cond_5
    move/from16 v17, v2

    add-int/lit8 v7, v7, 0x1

    move-object/from16 v0, p2

    goto/16 :goto_1

    :cond_6
    move-object/from16 v10, p4

    move/from16 v17, v2

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p2

    move/from16 v2, v17

    goto/16 :goto_0

    .line 2990
    :cond_7
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    return-object v0

    :cond_8
    move-object/from16 v0, p5

    .line 2993
    invoke-static {v1, v0}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 2994
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [I

    const/4 v2, 0x0

    .line 2995
    :goto_8
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_9

    .line 2996
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;

    iget v3, v3, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;->trackIndex:I

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_9
    const/4 v2, 0x0

    .line 2998
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;

    .line 2999
    new-instance v2, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    iget-object v3, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;->trackGroup:Landroidx/media3/common/TrackGroup;

    invoke-direct {v2, v3, v1}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;-><init>(Landroidx/media3/common/TrackGroup;[I)V

    iget v0, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo;->rendererIndex:I

    .line 3001
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2999
    invoke-static {v2, v0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v0

    return-object v0
.end method

.method private setParametersInternal(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)V
    .locals 2

    .line 2513
    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2515
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 2516
    :try_start_0
    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->parameters:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    invoke-virtual {v1, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    .line 2517
    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->parameters:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    .line 2518
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 2521
    iget-boolean p1, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->constrainAudioChannelCountToDeviceCapabilities:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->context:Landroid/content/Context;

    if-nez p1, :cond_0

    .line 2522
    const-string p1, "DefaultTrackSelector"

    const-string v0, "Audio channel count constraints cannot be applied without reference to Context. Build the track selector instance with one of the non-deprecated constructors that take a Context argument."

    invoke-static {p1, v0}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2524
    :cond_0
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->invalidate()V

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    .line 2518
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method


# virtual methods
.method public buildUponParameters()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 1

    .line 2504
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->getParameters()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->buildUpon()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getParameters()Landroidx/media3/common/TrackSelectionParameters;
    .locals 1

    .line 120
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->getParameters()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    move-result-object v0

    return-object v0
.end method

.method public getParameters()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;
    .locals 2

    .line 2452
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 2453
    :try_start_0
    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->parameters:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 2454
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getRendererCapabilitiesListener()Landroidx/media3/exoplayer/RendererCapabilities$Listener;
    .locals 0

    return-object p0
.end method

.method public isSetParametersSupported()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$selectAudioTrack$2$androidx-media3-exoplayer-trackselection-DefaultTrackSelector(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;Z[IILandroidx/media3/common/TrackGroup;[I)Ljava/util/List;
    .locals 7

    .line 2787
    new-instance v5, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda1;

    invoke-direct {v5, p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda1;-><init>(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;)V

    aget v6, p3, p4

    move v0, p4

    move-object v1, p5

    move-object v2, p1

    move-object v3, p6

    move v4, p2

    invoke-static/range {v0 .. v6}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$AudioTrackInfo;->createForTrackGroup(ILandroidx/media3/common/TrackGroup;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;[IZLcom/google/common/base/Predicate;I)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    return-object p1
.end method

.method public onRendererCapabilitiesChanged(Landroidx/media3/exoplayer/Renderer;)V
    .locals 0

    .line 2538
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->maybeInvalidateForRendererCapabilitiesChange(Landroidx/media3/exoplayer/Renderer;)V

    return-void
.end method

.method public release()V
    .locals 3

    .line 2442
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 2443
    :try_start_0
    sget v1, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v2, 0x20

    if-lt v1, v2, :cond_0

    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->spatializer:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

    if-eqz v1, :cond_0

    .line 2444
    invoke-virtual {v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->release()V

    .line 2446
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2447
    invoke-super {p0}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector;->release()V

    return-void

    :catchall_0
    move-exception v1

    .line 2446
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method protected selectAllTracks(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[I[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 2653
    invoke-virtual {p1}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererCount()I

    move-result v0

    .line 2654
    new-array v1, v0, [Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    .line 2659
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->selectVideoTrack(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[I[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)Landroid/util/Pair;

    move-result-object v2

    .line 2667
    iget-boolean v3, p4, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->isPrioritizeImageOverVideoEnabled:Z

    const/4 v4, 0x0

    if-nez v3, :cond_1

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    move-object v3, v4

    goto :goto_1

    .line 2668
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2, p4}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->selectImageTrack(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)Landroid/util/Pair;

    move-result-object v3

    :goto_1
    if-eqz v3, :cond_2

    .line 2672
    iget-object v2, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v3, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    aput-object v3, v1, v2

    goto :goto_2

    :cond_2
    if-eqz v2, :cond_3

    .line 2674
    iget-object v3, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v2, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    aput-object v2, v1, v3

    .line 2679
    :cond_3
    :goto_2
    invoke-virtual {p0, p1, p2, p3, p4}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->selectAudioTrack(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[I[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)Landroid/util/Pair;

    move-result-object p3

    if-eqz p3, :cond_4

    .line 2685
    iget-object v2, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v3, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    aput-object v3, v1, v2

    :cond_4
    const/4 v2, 0x0

    if-nez p3, :cond_5

    goto :goto_3

    .line 2692
    :cond_5
    iget-object v3, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    iget-object v3, v3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;->group:Landroidx/media3/common/TrackGroup;

    iget-object p3, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    iget-object p3, p3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;->tracks:[I

    aget p3, p3, v2

    invoke-virtual {v3, p3}, Landroidx/media3/common/TrackGroup;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object p3

    iget-object v4, p3, Landroidx/media3/common/Format;->language:Ljava/lang/String;

    .line 2695
    :goto_3
    invoke-virtual {p0, p1, p2, p4, v4}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->selectTextTrack(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;Ljava/lang/String;)Landroid/util/Pair;

    move-result-object p3

    if-eqz p3, :cond_6

    .line 2697
    iget-object v3, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object p3, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast p3, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    aput-object p3, v1, v3

    :cond_6
    :goto_4
    if-ge v2, v0, :cond_8

    .line 2701
    invoke-virtual {p1, v2}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererType(I)I

    move-result p3

    const/4 v3, 0x2

    if-eq p3, v3, :cond_7

    const/4 v3, 0x1

    if-eq p3, v3, :cond_7

    const/4 v3, 0x3

    if-eq p3, v3, :cond_7

    const/4 v3, 0x4

    if-eq p3, v3, :cond_7

    .line 2708
    invoke-virtual {p1, v2}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getTrackGroups(I)Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-result-object v3

    aget-object v4, p2, v2

    .line 2707
    invoke-virtual {p0, p3, v3, v4, p4}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->selectOtherTrack(ILandroidx/media3/exoplayer/source/TrackGroupArray;[[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    move-result-object p3

    aput-object p3, v1, v2

    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_8
    return-object v1
.end method

.method protected selectAudioTrack(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[I[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)Landroid/util/Pair;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;",
            "[[[I[I",
            "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;",
            ")",
            "Landroid/util/Pair<",
            "Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 2774
    :goto_0
    invoke-virtual {p1}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    const/4 v2, 0x2

    .line 2775
    invoke-virtual {p1, v1}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererType(I)I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 2776
    invoke-virtual {p1, v1}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getTrackGroups(I)Landroidx/media3/exoplayer/source/TrackGroupArray;

    move-result-object v2

    iget v2, v2, Landroidx/media3/exoplayer/source/TrackGroupArray;->length:I

    if-lez v2, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2782
    :cond_1
    :goto_1
    new-instance v5, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda4;

    invoke-direct {v5, p0, p4, v0, p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda4;-><init>(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;Z[I)V

    new-instance v6, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda5;

    invoke-direct {v6}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda5;-><init>()V

    const/4 v2, 0x1

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    invoke-direct/range {v1 .. v6}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->selectTracksForType(ILandroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo$Factory;Ljava/util/Comparator;)Landroid/util/Pair;

    move-result-object p1

    return-object p1
.end method

.method protected selectImageTrack(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)Landroid/util/Pair;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;",
            "[[[I",
            "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;",
            ")",
            "Landroid/util/Pair<",
            "Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 2889
    iget-object v0, p3, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iget v0, v0, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->audioOffloadMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 2892
    :cond_0
    new-instance v4, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda2;

    invoke-direct {v4, p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda2;-><init>(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)V

    new-instance v5, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda3;

    invoke-direct {v5}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda3;-><init>()V

    const/4 v1, 0x4

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->selectTracksForType(ILandroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo$Factory;Ljava/util/Comparator;)Landroid/util/Pair;

    move-result-object p1

    return-object p1
.end method

.method protected selectOtherTrack(ILandroidx/media3/exoplayer/source/TrackGroupArray;[[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 2919
    iget-object p1, p4, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iget p1, p1, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->audioOffloadMode:I

    const/4 v0, 0x2

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    return-object v1

    :cond_0
    const/4 p1, 0x0

    move-object v2, v1

    move-object v4, v2

    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 2925
    :goto_0
    iget v5, p2, Landroidx/media3/exoplayer/source/TrackGroupArray;->length:I

    if-ge v0, v5, :cond_4

    .line 2926
    invoke-virtual {p2, v0}, Landroidx/media3/exoplayer/source/TrackGroupArray;->get(I)Landroidx/media3/common/TrackGroup;

    move-result-object v5

    .line 2927
    aget-object v6, p3, v0

    const/4 v7, 0x0

    .line 2928
    :goto_1
    iget v8, v5, Landroidx/media3/common/TrackGroup;->length:I

    if-ge v7, v8, :cond_3

    .line 2929
    aget v8, v6, v7

    iget-boolean v9, p4, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->exceedRendererCapabilitiesIfNecessary:Z

    invoke-static {v8, v9}, Landroidx/media3/exoplayer/RendererCapabilities$-CC;->isFormatSupported(IZ)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 2931
    invoke-virtual {v5, v7}, Landroidx/media3/common/TrackGroup;->getFormat(I)Landroidx/media3/common/Format;

    move-result-object v8

    .line 2932
    new-instance v9, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$OtherTrackScore;

    aget v10, v6, v7

    invoke-direct {v9, v8, v10}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$OtherTrackScore;-><init>(Landroidx/media3/common/Format;I)V

    if-eqz v4, :cond_1

    .line 2933
    invoke-virtual {v9, v4}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$OtherTrackScore;->compareTo(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$OtherTrackScore;)I

    move-result v8

    if-lez v8, :cond_2

    :cond_1
    move-object v2, v5

    move v3, v7

    move-object v4, v9

    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    if-nez v2, :cond_5

    goto :goto_2

    .line 2943
    :cond_5
    new-instance v1, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    filled-new-array {v3}, [I

    move-result-object p1

    invoke-direct {v1, v2, p1}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;-><init>(Landroidx/media3/common/TrackGroup;[I)V

    :goto_2
    return-object v1
.end method

.method protected selectTextTrack(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;Ljava/lang/String;)Landroid/util/Pair;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;",
            "[[[I",
            "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;",
            "Ljava/lang/String;",
            ")",
            "Landroid/util/Pair<",
            "Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 2856
    iget-object v0, p3, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iget v0, v0, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->audioOffloadMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 2859
    :cond_0
    new-instance v4, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda8;

    invoke-direct {v4, p3, p4}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda8;-><init>(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;Ljava/lang/String;)V

    new-instance v5, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda9;

    invoke-direct {v5}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda9;-><init>()V

    const/4 v1, 0x3

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->selectTracksForType(ILandroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo$Factory;Ljava/util/Comparator;)Landroid/util/Pair;

    move-result-object p1

    return-object p1
.end method

.method protected final selectTracks(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[I[ILandroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;Landroidx/media3/common/Timeline;)Landroid/util/Pair;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;",
            "[[[I[I",
            "Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;",
            "Landroidx/media3/common/Timeline;",
            ")",
            "Landroid/util/Pair<",
            "[",
            "Landroidx/media3/exoplayer/RendererConfiguration;",
            "[",
            "Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 2553
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 2554
    :try_start_0
    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->parameters:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    .line 2555
    iget-boolean v2, v1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->constrainAudioChannelCountToDeviceCapabilities:Z

    if-eqz v2, :cond_0

    sget v2, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v3, 0x20

    if-lt v2, v3, :cond_0

    iget-object v2, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->spatializer:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;

    if-eqz v2, :cond_0

    .line 2560
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-static {v3}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Looper;

    invoke-virtual {v2, p0, v3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SpatializerWrapperV32;->ensureInitialized(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;Landroid/os/Looper;)V

    .line 2562
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2563
    invoke-virtual {p1}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererCount()I

    move-result v0

    .line 2565
    invoke-virtual {p0, p1, p2, p3, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->selectAllTracks(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[I[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;

    move-result-object p3

    .line 2571
    invoke-static {p1, v1, p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->applyTrackSelectionOverrides(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;Landroidx/media3/common/TrackSelectionParameters;[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;)V

    .line 2572
    invoke-static {p1, v1, p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->applyLegacyRendererOverrides(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x0

    if-ge v3, v0, :cond_3

    .line 2576
    invoke-virtual {p1, v3}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererType(I)I

    move-result v5

    .line 2577
    invoke-virtual {v1, v3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->getRendererDisabled(I)Z

    move-result v6

    if-nez v6, :cond_1

    iget-object v6, v1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->disabledTrackTypes:Lcom/google/common/collect/ImmutableSet;

    .line 2578
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v6, v5}, Lcom/google/common/collect/ImmutableSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 2579
    :cond_1
    aput-object v4, p3, v3

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2584
    :cond_3
    iget-object v3, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->trackSelectionFactory:Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;

    .line 2586
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->getBandwidthMeter()Landroidx/media3/exoplayer/upstream/BandwidthMeter;

    move-result-object v5

    .line 2585
    invoke-interface {v3, p3, v5, p4, p5}, Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;->createTrackSelections([Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;Landroidx/media3/exoplayer/upstream/BandwidthMeter;Landroidx/media3/exoplayer/source/MediaSource$MediaPeriodId;Landroidx/media3/common/Timeline;)[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;

    move-result-object p3

    .line 2591
    new-array p4, v0, [Landroidx/media3/exoplayer/RendererConfiguration;

    :goto_1
    if-ge v2, v0, :cond_7

    .line 2593
    invoke-virtual {p1, v2}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererType(I)I

    move-result p5

    .line 2595
    invoke-virtual {v1, v2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->getRendererDisabled(I)Z

    move-result v3

    if-nez v3, :cond_6

    iget-object v3, v1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->disabledTrackTypes:Lcom/google/common/collect/ImmutableSet;

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p5

    invoke-virtual {v3, p5}, Lcom/google/common/collect/ImmutableSet;->contains(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_4

    goto :goto_2

    .line 2598
    :cond_4
    invoke-virtual {p1, v2}, Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;->getRendererType(I)I

    move-result p5

    const/4 v3, -0x2

    if-eq p5, v3, :cond_5

    aget-object p5, p3, v2

    if-eqz p5, :cond_6

    .line 2600
    :cond_5
    sget-object p5, Landroidx/media3/exoplayer/RendererConfiguration;->DEFAULT:Landroidx/media3/exoplayer/RendererConfiguration;

    goto :goto_3

    :cond_6
    :goto_2
    move-object p5, v4

    :goto_3
    aput-object p5, p4, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2604
    :cond_7
    iget-boolean p5, v1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->tunnelingEnabled:Z

    if-eqz p5, :cond_8

    .line 2605
    invoke-static {p1, p2, p4, p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->maybeConfigureRenderersForTunneling(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[I[Landroidx/media3/exoplayer/RendererConfiguration;[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;)V

    .line 2610
    :cond_8
    iget-object p5, v1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iget p5, p5, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->audioOffloadMode:I

    if-eqz p5, :cond_9

    .line 2611
    invoke-static {v1, p1, p2, p4, p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->maybeConfigureRendererForOffload(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[I[Landroidx/media3/exoplayer/RendererConfiguration;[Landroidx/media3/exoplayer/trackselection/ExoTrackSelection;)V

    .line 2619
    :cond_9
    invoke-static {p4, p3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    .line 2562
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected selectVideoTrack(Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[I[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)Landroid/util/Pair;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;",
            "[[[I[I",
            "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;",
            ")",
            "Landroid/util/Pair<",
            "Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Definition;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/exoplayer/ExoPlaybackException;
        }
    .end annotation

    .line 2737
    iget-object v0, p4, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iget v0, v0, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->audioOffloadMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 2740
    :cond_0
    new-instance v4, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda6;

    invoke-direct {v4, p4, p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda6;-><init>(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;[I)V

    new-instance v5, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda7;

    invoke-direct {v5}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$$ExternalSyntheticLambda7;-><init>()V

    const/4 v1, 0x2

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->selectTracksForType(ILandroidx/media3/exoplayer/trackselection/MappingTrackSelector$MappedTrackInfo;[[[ILandroidx/media3/exoplayer/trackselection/DefaultTrackSelector$TrackInfo$Factory;Ljava/util/Comparator;)Landroid/util/Pair;

    move-result-object p1

    return-object p1
.end method

.method public setAudioAttributes(Landroidx/media3/common/AudioAttributes;)V
    .locals 2

    .line 2475
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 2476
    :try_start_0
    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->audioAttributes:Landroidx/media3/common/AudioAttributes;

    invoke-virtual {v1, p1}, Landroidx/media3/common/AudioAttributes;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    .line 2477
    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->audioAttributes:Landroidx/media3/common/AudioAttributes;

    .line 2478
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 2480
    invoke-direct {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->maybeInvalidateForAudioChannelCountConstraints()V

    :cond_0
    return-void

    :catchall_0
    move-exception p1

    .line 2478
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public setParameters(Landroidx/media3/common/TrackSelectionParameters;)V
    .locals 3

    .line 2464
    instance-of v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    if-eqz v0, :cond_0

    .line 2465
    move-object v0, p1

    check-cast v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    invoke-direct {p0, v0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->setParametersInternal(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)V

    .line 2468
    :cond_0
    new-instance v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->getParameters()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;-><init>(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$1;)V

    invoke-virtual {v0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->set(Landroidx/media3/common/TrackSelectionParameters;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->build()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    move-result-object p1

    .line 2469
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->setParametersInternal(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)V

    return-void
.end method

.method public setParameters(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)V
    .locals 0

    .line 2499
    invoke-virtual {p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->build()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    move-result-object p1

    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->setParametersInternal(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)V

    return-void
.end method

.method public setParameters(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$ParametersBuilder;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2490
    invoke-virtual {p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$ParametersBuilder;->build()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    move-result-object p1

    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;->setParametersInternal(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)V

    return-void
.end method
