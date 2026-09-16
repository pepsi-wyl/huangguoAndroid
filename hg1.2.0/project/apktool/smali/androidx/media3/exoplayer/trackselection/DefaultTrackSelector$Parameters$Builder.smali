.class public final Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
.super Landroidx/media3/common/TrackSelectionParameters$Builder;
.source "DefaultTrackSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private allowAudioMixedChannelCountAdaptiveness:Z

.field private allowAudioMixedDecoderSupportAdaptiveness:Z

.field private allowAudioMixedMimeTypeAdaptiveness:Z

.field private allowAudioMixedSampleRateAdaptiveness:Z

.field private allowAudioNonSeamlessAdaptiveness:Z

.field private allowInvalidateSelectionsOnRendererCapabilitiesChange:Z

.field private allowMultipleAdaptiveSelections:Z

.field private allowVideoMixedDecoderSupportAdaptiveness:Z

.field private allowVideoMixedMimeTypeAdaptiveness:Z

.field private allowVideoNonSeamlessAdaptiveness:Z

.field private constrainAudioChannelCountToDeviceCapabilities:Z

.field private exceedAudioConstraintsIfNecessary:Z

.field private exceedRendererCapabilitiesIfNecessary:Z

.field private exceedVideoConstraintsIfNecessary:Z

.field private final rendererDisabledFlags:Landroid/util/SparseBooleanArray;

.field private final selectionOverrides:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/util/Map<",
            "Landroidx/media3/exoplayer/source/TrackGroupArray;",
            "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;",
            ">;>;"
        }
    .end annotation
.end field

.field private tunnelingEnabled:Z


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 859
    invoke-direct {p0}, Landroidx/media3/common/TrackSelectionParameters$Builder;-><init>()V

    .line 860
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    .line 861
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->rendererDisabledFlags:Landroid/util/SparseBooleanArray;

    .line 862
    invoke-direct {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 871
    invoke-direct {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;-><init>(Landroid/content/Context;)V

    .line 872
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    .line 873
    new-instance p1, Landroid/util/SparseBooleanArray;

    invoke-direct {p1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->rendererDisabledFlags:Landroid/util/SparseBooleanArray;

    .line 874
    invoke-direct {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->init()V

    return-void
.end method

.method private constructor <init>(Landroid/os/Bundle;)V
    .locals 3

    .line 913
    invoke-direct {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;-><init>(Landroid/os/Bundle;)V

    .line 914
    invoke-direct {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->init()V

    .line 915
    sget-object v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    .line 919
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$200()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->exceedVideoConstraintsIfNecessary:Z

    .line 918
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 917
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setExceedVideoConstraintsIfNecessary(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 923
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$300()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowVideoMixedMimeTypeAdaptiveness:Z

    .line 922
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 921
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setAllowVideoMixedMimeTypeAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 927
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$400()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowVideoNonSeamlessAdaptiveness:Z

    .line 926
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 925
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setAllowVideoNonSeamlessAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 931
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$500()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowVideoMixedDecoderSupportAdaptiveness:Z

    .line 930
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 929
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setAllowVideoMixedDecoderSupportAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 936
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$600()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->exceedAudioConstraintsIfNecessary:Z

    .line 935
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 934
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setExceedAudioConstraintsIfNecessary(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 940
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$700()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowAudioMixedMimeTypeAdaptiveness:Z

    .line 939
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 938
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setAllowAudioMixedMimeTypeAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 944
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$800()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowAudioMixedSampleRateAdaptiveness:Z

    .line 943
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 942
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setAllowAudioMixedSampleRateAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 948
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$900()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowAudioMixedChannelCountAdaptiveness:Z

    .line 947
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 946
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setAllowAudioMixedChannelCountAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 952
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$1000()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowAudioMixedDecoderSupportAdaptiveness:Z

    .line 951
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 950
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setAllowAudioMixedDecoderSupportAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 956
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$1100()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowAudioNonSeamlessAdaptiveness:Z

    .line 955
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 954
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setAllowAudioNonSeamlessAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 960
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$1200()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->constrainAudioChannelCountToDeviceCapabilities:Z

    .line 959
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 958
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setConstrainAudioChannelCountToDeviceCapabilities(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 965
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$1300()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->exceedRendererCapabilitiesIfNecessary:Z

    .line 964
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 963
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setExceedRendererCapabilitiesIfNecessary(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 968
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$1400()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->tunnelingEnabled:Z

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 967
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setTunnelingEnabled(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 971
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$1500()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowMultipleAdaptiveSelections:Z

    .line 970
    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 969
    invoke-virtual {p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setAllowMultipleAdaptiveSelections(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 975
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$1600()Ljava/lang/String;

    move-result-object v1

    iget-boolean v0, v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowInvalidateSelectionsOnRendererCapabilitiesChange:Z

    .line 974
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 973
    invoke-virtual {p0, v0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setAllowInvalidateSelectionsOnRendererCapabilitiesChange(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    .line 978
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    .line 979
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setSelectionOverridesFromBundle(Landroid/os/Bundle;)V

    .line 982
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$1700()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object p1

    .line 981
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->makeSparseBooleanArrayFromTrueKeys([I)Landroid/util/SparseBooleanArray;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->rendererDisabledFlags:Landroid/util/SparseBooleanArray;

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Bundle;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$1;)V
    .locals 0

    .line 827
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;-><init>(Landroid/os/Bundle;)V

    return-void
.end method

.method private constructor <init>(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)V
    .locals 1

    .line 882
    invoke-direct {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;-><init>(Landroidx/media3/common/TrackSelectionParameters;)V

    .line 884
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->exceedVideoConstraintsIfNecessary:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedVideoConstraintsIfNecessary:Z

    .line 885
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowVideoMixedMimeTypeAdaptiveness:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoMixedMimeTypeAdaptiveness:Z

    .line 886
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowVideoNonSeamlessAdaptiveness:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoNonSeamlessAdaptiveness:Z

    .line 887
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowVideoMixedDecoderSupportAdaptiveness:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoMixedDecoderSupportAdaptiveness:Z

    .line 890
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->exceedAudioConstraintsIfNecessary:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedAudioConstraintsIfNecessary:Z

    .line 891
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowAudioMixedMimeTypeAdaptiveness:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedMimeTypeAdaptiveness:Z

    .line 892
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowAudioMixedSampleRateAdaptiveness:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedSampleRateAdaptiveness:Z

    .line 893
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowAudioMixedChannelCountAdaptiveness:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedChannelCountAdaptiveness:Z

    .line 895
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowAudioMixedDecoderSupportAdaptiveness:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedDecoderSupportAdaptiveness:Z

    .line 897
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowAudioNonSeamlessAdaptiveness:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioNonSeamlessAdaptiveness:Z

    .line 898
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->constrainAudioChannelCountToDeviceCapabilities:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->constrainAudioChannelCountToDeviceCapabilities:Z

    .line 901
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->exceedRendererCapabilitiesIfNecessary:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedRendererCapabilitiesIfNecessary:Z

    .line 902
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->tunnelingEnabled:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->tunnelingEnabled:Z

    .line 903
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowMultipleAdaptiveSelections:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowMultipleAdaptiveSelections:Z

    .line 904
    iget-boolean v0, p1, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->allowInvalidateSelectionsOnRendererCapabilitiesChange:Z

    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowInvalidateSelectionsOnRendererCapabilitiesChange:Z

    .line 907
    invoke-static {p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$000(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)Landroid/util/SparseArray;

    move-result-object v0

    invoke-static {v0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->cloneSelectionOverrides(Landroid/util/SparseArray;)Landroid/util/SparseArray;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    .line 908
    invoke-static {p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$100(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)Landroid/util/SparseBooleanArray;

    move-result-object p1

    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->clone()Landroid/util/SparseBooleanArray;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->rendererDisabledFlags:Landroid/util/SparseBooleanArray;

    return-void
.end method

.method synthetic constructor <init>(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$1;)V
    .locals 0

    .line 827
    invoke-direct {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;-><init>(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;)V

    return-void
.end method

.method static synthetic access$2200(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedVideoConstraintsIfNecessary:Z

    return p0
.end method

.method static synthetic access$2300(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoMixedMimeTypeAdaptiveness:Z

    return p0
.end method

.method static synthetic access$2400(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoNonSeamlessAdaptiveness:Z

    return p0
.end method

.method static synthetic access$2500(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoMixedDecoderSupportAdaptiveness:Z

    return p0
.end method

.method static synthetic access$2600(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedAudioConstraintsIfNecessary:Z

    return p0
.end method

.method static synthetic access$2700(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedMimeTypeAdaptiveness:Z

    return p0
.end method

.method static synthetic access$2800(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedSampleRateAdaptiveness:Z

    return p0
.end method

.method static synthetic access$2900(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedChannelCountAdaptiveness:Z

    return p0
.end method

.method static synthetic access$3000(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedDecoderSupportAdaptiveness:Z

    return p0
.end method

.method static synthetic access$3100(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioNonSeamlessAdaptiveness:Z

    return p0
.end method

.method static synthetic access$3200(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->constrainAudioChannelCountToDeviceCapabilities:Z

    return p0
.end method

.method static synthetic access$3300(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedRendererCapabilitiesIfNecessary:Z

    return p0
.end method

.method static synthetic access$3400(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->tunnelingEnabled:Z

    return p0
.end method

.method static synthetic access$3500(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowMultipleAdaptiveSelections:Z

    return p0
.end method

.method static synthetic access$3600(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Z
    .locals 0

    .line 827
    iget-boolean p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowInvalidateSelectionsOnRendererCapabilitiesChange:Z

    return p0
.end method

.method static synthetic access$3700(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Landroid/util/SparseArray;
    .locals 0

    .line 827
    iget-object p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    return-object p0
.end method

.method static synthetic access$3800(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;)Landroid/util/SparseBooleanArray;
    .locals 0

    .line 827
    iget-object p0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->rendererDisabledFlags:Landroid/util/SparseBooleanArray;

    return-object p0
.end method

.method private static cloneSelectionOverrides(Landroid/util/SparseArray;)Landroid/util/SparseArray;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Ljava/util/Map<",
            "Landroidx/media3/exoplayer/source/TrackGroupArray;",
            "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;",
            ">;>;)",
            "Landroid/util/SparseArray<",
            "Ljava/util/Map<",
            "Landroidx/media3/exoplayer/source/TrackGroupArray;",
            "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;",
            ">;>;"
        }
    .end annotation

    .line 1687
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    const/4 v1, 0x0

    .line 1689
    :goto_0
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 1690
    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    new-instance v3, Ljava/util/HashMap;

    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private init()V
    .locals 2

    const/4 v0, 0x1

    .line 1664
    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedVideoConstraintsIfNecessary:Z

    const/4 v1, 0x0

    .line 1665
    iput-boolean v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoMixedMimeTypeAdaptiveness:Z

    .line 1666
    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoNonSeamlessAdaptiveness:Z

    .line 1667
    iput-boolean v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoMixedDecoderSupportAdaptiveness:Z

    .line 1669
    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedAudioConstraintsIfNecessary:Z

    .line 1670
    iput-boolean v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedMimeTypeAdaptiveness:Z

    .line 1671
    iput-boolean v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedSampleRateAdaptiveness:Z

    .line 1672
    iput-boolean v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedChannelCountAdaptiveness:Z

    .line 1673
    iput-boolean v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedDecoderSupportAdaptiveness:Z

    .line 1674
    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioNonSeamlessAdaptiveness:Z

    .line 1675
    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->constrainAudioChannelCountToDeviceCapabilities:Z

    .line 1677
    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedRendererCapabilitiesIfNecessary:Z

    .line 1678
    iput-boolean v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->tunnelingEnabled:Z

    .line 1679
    iput-boolean v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowMultipleAdaptiveSelections:Z

    .line 1680
    iput-boolean v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowInvalidateSelectionsOnRendererCapabilitiesChange:Z

    return-void
.end method

.method private makeSparseBooleanArrayFromTrueKeys([I)Landroid/util/SparseBooleanArray;
    .locals 5

    if-nez p1, :cond_0

    .line 1730
    new-instance p1, Landroid/util/SparseBooleanArray;

    invoke-direct {p1}, Landroid/util/SparseBooleanArray;-><init>()V

    return-object p1

    .line 1732
    :cond_0
    new-instance v0, Landroid/util/SparseBooleanArray;

    array-length v1, p1

    invoke-direct {v0, v1}, Landroid/util/SparseBooleanArray;-><init>(I)V

    .line 1733
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget v3, p1, v2

    const/4 v4, 0x1

    .line 1734
    invoke-virtual {v0, v3, v4}, Landroid/util/SparseBooleanArray;->append(IZ)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private setSelectionOverridesFromBundle(Landroid/os/Bundle;)V
    .locals 6

    .line 1699
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$1900()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v0

    .line 1702
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$2000()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    if-nez v1, :cond_0

    .line 1705
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    goto :goto_0

    .line 1706
    :cond_0
    new-instance v2, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v2, v1}, Landroidx/media3/common/util/BundleCollectionUtil;->fromBundleList(Lcom/google/common/base/Function;Ljava/util/List;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    .line 1710
    :goto_0
    invoke-static {}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;->access$2100()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object p1

    if-nez p1, :cond_1

    .line 1713
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    goto :goto_1

    .line 1714
    :cond_1
    new-instance v2, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {v2, p1}, Landroidx/media3/common/util/BundleCollectionUtil;->fromBundleSparseArray(Lcom/google/common/base/Function;Landroid/util/SparseArray;)Landroid/util/SparseArray;

    move-result-object p1

    :goto_1
    if-eqz v0, :cond_3

    .line 1717
    array-length v2, v0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-eq v2, v3, :cond_2

    goto :goto_3

    :cond_2
    const/4 v2, 0x0

    .line 1720
    :goto_2
    array-length v3, v0

    if-ge v2, v3, :cond_3

    .line 1721
    aget v3, v0, v2

    .line 1722
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/media3/exoplayer/source/TrackGroupArray;

    .line 1723
    invoke-virtual {p1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;

    .line 1724
    invoke-virtual {p0, v3, v4, v5}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setSelectionOverride(ILandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_3
    :goto_3
    return-void
.end method


# virtual methods
.method public bridge synthetic addOverride(Landroidx/media3/common/TrackSelectionOverride;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->addOverride(Landroidx/media3/common/TrackSelectionOverride;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addOverride(Landroidx/media3/common/TrackSelectionOverride;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1425
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->addOverride(Landroidx/media3/common/TrackSelectionOverride;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic build()Landroidx/media3/common/TrackSelectionParameters;
    .locals 1

    .line 827
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->build()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    move-result-object v0

    return-object v0
.end method

.method public build()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;
    .locals 2

    .line 1659
    new-instance v0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters;-><init>(Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$1;)V

    return-object v0
.end method

.method public bridge synthetic clearOverride(Landroidx/media3/common/TrackGroup;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->clearOverride(Landroidx/media3/common/TrackGroup;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public clearOverride(Landroidx/media3/common/TrackGroup;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1432
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->clearOverride(Landroidx/media3/common/TrackGroup;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic clearOverrides()Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 1

    .line 827
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->clearOverrides()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearOverrides()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1453
    invoke-super {p0}, Landroidx/media3/common/TrackSelectionParameters$Builder;->clearOverrides()Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic clearOverridesOfType(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->clearOverridesOfType(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public clearOverridesOfType(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1446
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->clearOverridesOfType(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public clearSelectionOverride(ILandroidx/media3/exoplayer/source/TrackGroupArray;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1606
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    .line 1607
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_1

    .line 1608
    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1612
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1613
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 1614
    iget-object p2, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->remove(I)V

    :cond_1
    :goto_0
    return-object p0
.end method

.method public clearSelectionOverrides()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1648
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    .line 1652
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    return-object p0
.end method

.method public clearSelectionOverrides(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1629
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    .line 1630
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_1

    .line 1631
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1635
    :cond_0
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    :cond_1
    :goto_0
    return-object p0
.end method

.method public bridge synthetic clearVideoSizeConstraints()Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 1

    .line 827
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->clearVideoSizeConstraints()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearVideoSizeConstraints()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1004
    invoke-super {p0}, Landroidx/media3/common/TrackSelectionParameters$Builder;->clearVideoSizeConstraints()Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic clearViewportSizeConstraints()Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 1

    .line 827
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->clearViewportSizeConstraints()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearViewportSizeConstraints()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1125
    invoke-super {p0}, Landroidx/media3/common/TrackSelectionParameters$Builder;->clearViewportSizeConstraints()Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method protected bridge synthetic set(Landroidx/media3/common/TrackSelectionParameters;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->set(Landroidx/media3/common/TrackSelectionParameters;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method protected set(Landroidx/media3/common/TrackSelectionParameters;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 988
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->set(Landroidx/media3/common/TrackSelectionParameters;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public setAllowAudioMixedChannelCountAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1256
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedChannelCountAdaptiveness:Z

    return-object p0
.end method

.method public setAllowAudioMixedDecoderSupportAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1272
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedDecoderSupportAdaptiveness:Z

    return-object p0
.end method

.method public setAllowAudioMixedMimeTypeAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1224
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedMimeTypeAdaptiveness:Z

    return-object p0
.end method

.method public setAllowAudioMixedSampleRateAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1240
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioMixedSampleRateAdaptiveness:Z

    return-object p0
.end method

.method public setAllowAudioNonSeamlessAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1301
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowAudioNonSeamlessAdaptiveness:Z

    return-object p0
.end method

.method public setAllowInvalidateSelectionsOnRendererCapabilitiesChange(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1417
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowInvalidateSelectionsOnRendererCapabilitiesChange:Z

    return-object p0
.end method

.method public setAllowMultipleAdaptiveSelections(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1523
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowMultipleAdaptiveSelections:Z

    return-object p0
.end method

.method public setAllowVideoMixedDecoderSupportAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1110
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoMixedDecoderSupportAdaptiveness:Z

    return-object p0
.end method

.method public setAllowVideoMixedMimeTypeAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1079
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoMixedMimeTypeAdaptiveness:Z

    return-object p0
.end method

.method public setAllowVideoNonSeamlessAdaptiveness(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1094
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->allowVideoNonSeamlessAdaptiveness:Z

    return-object p0
.end method

.method public setConstrainAudioChannelCountToDeviceCapabilities(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1332
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->constrainAudioChannelCountToDeviceCapabilities:Z

    return-object p0
.end method

.method public setDisabledTextTrackSelectionFlags(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1388
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setIgnoredTextSelectionFlags(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setDisabledTrackTypes(Ljava/util/Set;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setDisabledTrackTypes(Ljava/util/Set;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setDisabledTrackTypes(Ljava/util/Set;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1465
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setDisabledTrackTypes(Ljava/util/Set;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public setExceedAudioConstraintsIfNecessary(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1206
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedAudioConstraintsIfNecessary:Z

    return-object p0
.end method

.method public setExceedRendererCapabilitiesIfNecessary(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1491
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedRendererCapabilitiesIfNecessary:Z

    return-object p0
.end method

.method public setExceedVideoConstraintsIfNecessary(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1061
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->exceedVideoConstraintsIfNecessary:Z

    return-object p0
.end method

.method public bridge synthetic setForceHighestSupportedBitrate(Z)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setForceHighestSupportedBitrate(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setForceHighestSupportedBitrate(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1403
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setForceHighestSupportedBitrate(Z)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setForceLowestBitrate(Z)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setForceLowestBitrate(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setForceLowestBitrate(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1396
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setForceLowestBitrate(Z)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setIgnoredTextSelectionFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setIgnoredTextSelectionFlags(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setIgnoredTextSelectionFlags(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1370
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setIgnoredTextSelectionFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setMaxAudioBitrate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setMaxAudioBitrate(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setMaxAudioBitrate(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1191
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setMaxAudioBitrate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setMaxAudioChannelCount(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setMaxAudioChannelCount(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setMaxAudioChannelCount(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1184
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setMaxAudioChannelCount(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setMaxVideoBitrate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setMaxVideoBitrate(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setMaxVideoBitrate(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1025
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setMaxVideoBitrate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setMaxVideoFrameRate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setMaxVideoFrameRate(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setMaxVideoFrameRate(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1018
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setMaxVideoFrameRate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setMaxVideoSize(II)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1, p2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setMaxVideoSize(II)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setMaxVideoSize(II)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1011
    invoke-super {p0, p1, p2}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setMaxVideoSize(II)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setMaxVideoSizeSd()Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 1

    .line 827
    invoke-virtual {p0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setMaxVideoSizeSd()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setMaxVideoSizeSd()Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 997
    invoke-super {p0}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setMaxVideoSizeSd()Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setMinVideoBitrate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setMinVideoBitrate(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setMinVideoBitrate(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1046
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setMinVideoBitrate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setMinVideoFrameRate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setMinVideoFrameRate(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setMinVideoFrameRate(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1039
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setMinVideoFrameRate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setMinVideoSize(II)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1, p2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setMinVideoSize(II)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setMinVideoSize(II)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1032
    invoke-super {p0, p1, p2}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setMinVideoSize(II)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setOverrideForType(Landroidx/media3/common/TrackSelectionOverride;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setOverrideForType(Landroidx/media3/common/TrackSelectionOverride;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setOverrideForType(Landroidx/media3/common/TrackSelectionOverride;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1439
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setOverrideForType(Landroidx/media3/common/TrackSelectionOverride;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredAudioLanguage(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredAudioLanguage(Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPreferredAudioLanguage(Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1163
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredAudioLanguage(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredAudioLanguages([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredAudioLanguages([Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public varargs setPreferredAudioLanguages([Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1170
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredAudioLanguages([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredAudioMimeType(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredAudioMimeType(Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPreferredAudioMimeType(Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1279
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredAudioMimeType(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredAudioMimeTypes([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredAudioMimeTypes([Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public varargs setPreferredAudioMimeTypes([Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1286
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredAudioMimeTypes([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredAudioRoleFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredAudioRoleFlags(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPreferredAudioRoleFlags(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1177
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredAudioRoleFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredTextLanguage(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredTextLanguage(Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPreferredTextLanguage(Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1349
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredTextLanguage(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredTextLanguageAndRoleFlagsToCaptioningManagerSettings(Landroid/content/Context;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredTextLanguageAndRoleFlagsToCaptioningManagerSettings(Landroid/content/Context;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPreferredTextLanguageAndRoleFlagsToCaptioningManagerSettings(Landroid/content/Context;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1342
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredTextLanguageAndRoleFlagsToCaptioningManagerSettings(Landroid/content/Context;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredTextLanguages([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredTextLanguages([Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public varargs setPreferredTextLanguages([Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1356
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredTextLanguages([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredTextRoleFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredTextRoleFlags(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPreferredTextRoleFlags(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1363
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredTextRoleFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredVideoMimeType(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredVideoMimeType(Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPreferredVideoMimeType(Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1140
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredVideoMimeType(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredVideoMimeTypes([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredVideoMimeTypes([Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public varargs setPreferredVideoMimeTypes([Ljava/lang/String;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1147
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredVideoMimeTypes([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setPreferredVideoRoleFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setPreferredVideoRoleFlags(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setPreferredVideoRoleFlags(I)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1154
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredVideoRoleFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public setRendererDisabled(IZ)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 1

    .line 1539
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->rendererDisabledFlags:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v0

    if-ne v0, p2, :cond_0

    return-object p0

    :cond_0
    if-eqz p2, :cond_1

    .line 1545
    iget-object p2, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->rendererDisabledFlags:Landroid/util/SparseBooleanArray;

    const/4 v0, 0x1

    invoke-virtual {p2, p1, v0}, Landroid/util/SparseBooleanArray;->put(IZ)V

    goto :goto_0

    .line 1547
    :cond_1
    iget-object p2, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->rendererDisabledFlags:Landroid/util/SparseBooleanArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseBooleanArray;->delete(I)V

    :goto_0
    return-object p0
.end method

.method public bridge synthetic setSelectUndeterminedTextLanguage(Z)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setSelectUndeterminedTextLanguage(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setSelectUndeterminedTextLanguage(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1377
    invoke-super {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setSelectUndeterminedTextLanguage(Z)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public setSelectionOverride(ILandroidx/media3/exoplayer/source/TrackGroupArray;Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$SelectionOverride;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1581
    iget-object v0, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    .line 1582
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-nez v0, :cond_0

    .line 1584
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1585
    iget-object v1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->selectionOverrides:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 1587
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1, p3}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return-object p0

    .line 1591
    :cond_1
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public bridge synthetic setTrackTypeDisabled(IZ)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1, p2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setTrackTypeDisabled(IZ)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTrackTypeDisabled(IZ)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1472
    invoke-super {p0, p1, p2}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setTrackTypeDisabled(IZ)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public setTunnelingEnabled(Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1511
    iput-boolean p1, p0, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->tunnelingEnabled:Z

    return-object p0
.end method

.method public bridge synthetic setViewportSize(IIZ)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1, p2, p3}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setViewportSize(IIZ)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setViewportSize(IIZ)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1133
    invoke-super {p0, p1, p2, p3}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setViewportSize(IIZ)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method

.method public bridge synthetic setViewportSizeToPhysicalDisplaySize(Landroid/content/Context;Z)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 827
    invoke-virtual {p0, p1, p2}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;->setViewportSizeToPhysicalDisplaySize(Landroid/content/Context;Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setViewportSizeToPhysicalDisplaySize(Landroid/content/Context;Z)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector$Parameters$Builder;
    .locals 0

    .line 1118
    invoke-super {p0, p1, p2}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setViewportSizeToPhysicalDisplaySize(Landroid/content/Context;Z)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-object p0
.end method
