.class public Landroidx/media3/common/TrackSelectionParameters$Builder;
.super Ljava/lang/Object;
.source "TrackSelectionParameters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/common/TrackSelectionParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

.field private disabledTrackTypes:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private forceHighestSupportedBitrate:Z

.field private forceLowestBitrate:Z

.field private ignoredTextSelectionFlags:I

.field private isPrioritizeImageOverVideoEnabled:Z

.field private maxAudioBitrate:I

.field private maxAudioChannelCount:I

.field private maxVideoBitrate:I

.field private maxVideoFrameRate:I

.field private maxVideoHeight:I

.field private maxVideoWidth:I

.field private minVideoBitrate:I

.field private minVideoFrameRate:I

.field private minVideoHeight:I

.field private minVideoWidth:I

.field private overrides:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroidx/media3/common/TrackGroup;",
            "Landroidx/media3/common/TrackSelectionOverride;",
            ">;"
        }
    .end annotation
.end field

.field private preferredAudioLanguages:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private preferredAudioMimeTypes:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private preferredAudioRoleFlags:I

.field private preferredTextLanguages:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private preferredTextRoleFlags:I

.field private preferredVideoMimeTypes:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private preferredVideoRoleFlags:I

.field private selectUndeterminedTextLanguage:Z

.field private viewportHeight:I

.field private viewportOrientationMayChange:Z

.field private viewportWidth:I


# direct methods
.method public constructor <init>()V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7fffffff

    .line 122
    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoWidth:I

    .line 123
    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoHeight:I

    .line 124
    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoFrameRate:I

    .line 125
    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoBitrate:I

    .line 126
    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportWidth:I

    .line 127
    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportHeight:I

    const/4 v1, 0x1

    .line 128
    iput-boolean v1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportOrientationMayChange:Z

    .line 129
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    iput-object v1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredVideoMimeTypes:Lcom/google/common/collect/ImmutableList;

    const/4 v1, 0x0

    .line 130
    iput v1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredVideoRoleFlags:I

    .line 132
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v2

    iput-object v2, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioLanguages:Lcom/google/common/collect/ImmutableList;

    .line 133
    iput v1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioRoleFlags:I

    .line 134
    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxAudioChannelCount:I

    .line 135
    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxAudioBitrate:I

    .line 136
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioMimeTypes:Lcom/google/common/collect/ImmutableList;

    .line 137
    sget-object v0, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->DEFAULT:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    .line 139
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextLanguages:Lcom/google/common/collect/ImmutableList;

    .line 140
    iput v1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextRoleFlags:I

    .line 141
    iput v1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->ignoredTextSelectionFlags:I

    .line 142
    iput-boolean v1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->selectUndeterminedTextLanguage:Z

    .line 144
    iput-boolean v1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->isPrioritizeImageOverVideoEnabled:Z

    .line 146
    iput-boolean v1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->forceLowestBitrate:Z

    .line 147
    iput-boolean v1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->forceHighestSupportedBitrate:Z

    .line 148
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->overrides:Ljava/util/HashMap;

    .line 149
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->disabledTrackTypes:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 159
    invoke-direct {p0}, Landroidx/media3/common/TrackSelectionParameters$Builder;-><init>()V

    .line 160
    invoke-virtual {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredTextLanguageAndRoleFlagsToCaptioningManagerSettings(Landroid/content/Context;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    const/4 v0, 0x1

    .line 161
    invoke-virtual {p0, p1, v0}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setViewportSizeToPhysicalDisplaySize(Landroid/content/Context;Z)Landroidx/media3/common/TrackSelectionParameters$Builder;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Bundle;)V
    .locals 6

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$000()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v1, v1, Landroidx/media3/common/TrackSelectionParameters;->maxVideoWidth:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoWidth:I

    .line 176
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$100()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v1, v1, Landroidx/media3/common/TrackSelectionParameters;->maxVideoHeight:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoHeight:I

    .line 178
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$200()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v1, v1, Landroidx/media3/common/TrackSelectionParameters;->maxVideoFrameRate:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoFrameRate:I

    .line 180
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$300()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v1, v1, Landroidx/media3/common/TrackSelectionParameters;->maxVideoBitrate:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoBitrate:I

    .line 181
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$400()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v1, v1, Landroidx/media3/common/TrackSelectionParameters;->minVideoWidth:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoWidth:I

    .line 183
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$500()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v1, v1, Landroidx/media3/common/TrackSelectionParameters;->minVideoHeight:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoHeight:I

    .line 185
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$600()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v1, v1, Landroidx/media3/common/TrackSelectionParameters;->minVideoFrameRate:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoFrameRate:I

    .line 187
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$700()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v1, v1, Landroidx/media3/common/TrackSelectionParameters;->minVideoBitrate:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoBitrate:I

    .line 188
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$800()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v1, v1, Landroidx/media3/common/TrackSelectionParameters;->viewportWidth:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportWidth:I

    .line 189
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$900()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v1, v1, Landroidx/media3/common/TrackSelectionParameters;->viewportHeight:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportHeight:I

    .line 192
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$1000()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget-boolean v1, v1, Landroidx/media3/common/TrackSelectionParameters;->viewportOrientationMayChange:Z

    .line 191
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportOrientationMayChange:Z

    .line 196
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$1100()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 195
    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredVideoMimeTypes:Lcom/google/common/collect/ImmutableList;

    .line 199
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$1200()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v2, v2, Landroidx/media3/common/TrackSelectionParameters;->preferredVideoRoleFlags:I

    .line 198
    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredVideoRoleFlags:I

    .line 202
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$1300()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    new-array v2, v1, [Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 203
    invoke-static {v0}, Landroidx/media3/common/TrackSelectionParameters$Builder;->normalizeLanguageCodes([Ljava/lang/String;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioLanguages:Lcom/google/common/collect/ImmutableList;

    .line 206
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$1400()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v2, v2, Landroidx/media3/common/TrackSelectionParameters;->preferredAudioRoleFlags:I

    .line 205
    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioRoleFlags:I

    .line 209
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$1500()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v2, v2, Landroidx/media3/common/TrackSelectionParameters;->maxAudioChannelCount:I

    .line 208
    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxAudioChannelCount:I

    .line 211
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$1600()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v2, v2, Landroidx/media3/common/TrackSelectionParameters;->maxAudioBitrate:I

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxAudioBitrate:I

    .line 214
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$1700()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    new-array v2, v1, [Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 213
    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioMimeTypes:Lcom/google/common/collect/ImmutableList;

    .line 215
    invoke-static {p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->getAudioOffloadPreferencesFromBundle(Landroid/os/Bundle;)Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    .line 219
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$1800()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    new-array v2, v1, [Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 218
    invoke-static {v0}, Landroidx/media3/common/TrackSelectionParameters$Builder;->normalizeLanguageCodes([Ljava/lang/String;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextLanguages:Lcom/google/common/collect/ImmutableList;

    .line 222
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$1900()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v2, v2, Landroidx/media3/common/TrackSelectionParameters;->preferredTextRoleFlags:I

    .line 221
    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextRoleFlags:I

    .line 225
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$2000()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget v2, v2, Landroidx/media3/common/TrackSelectionParameters;->ignoredTextSelectionFlags:I

    .line 224
    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->ignoredTextSelectionFlags:I

    .line 229
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$2100()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget-boolean v2, v2, Landroidx/media3/common/TrackSelectionParameters;->selectUndeterminedTextLanguage:Z

    .line 228
    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->selectUndeterminedTextLanguage:Z

    .line 234
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$2200()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget-boolean v2, v2, Landroidx/media3/common/TrackSelectionParameters;->isPrioritizeImageOverVideoEnabled:Z

    .line 233
    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->isPrioritizeImageOverVideoEnabled:Z

    .line 239
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$2300()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget-boolean v2, v2, Landroidx/media3/common/TrackSelectionParameters;->forceLowestBitrate:Z

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->forceLowestBitrate:Z

    .line 242
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$2400()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters;->DEFAULT_WITHOUT_CONTEXT:Landroidx/media3/common/TrackSelectionParameters;

    iget-boolean v2, v2, Landroidx/media3/common/TrackSelectionParameters;->forceHighestSupportedBitrate:Z

    .line 241
    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->forceHighestSupportedBitrate:Z

    .line 245
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$2500()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    if-nez v0, :cond_0

    .line 248
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    goto :goto_0

    .line 249
    :cond_0
    new-instance v2, Landroidx/media3/common/TrackSelectionParameters$Builder$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Landroidx/media3/common/TrackSelectionParameters$Builder$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v2, v0}, Landroidx/media3/common/util/BundleCollectionUtil;->fromBundleList(Lcom/google/common/base/Function;Ljava/util/List;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    .line 251
    :goto_0
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->overrides:Ljava/util/HashMap;

    const/4 v2, 0x0

    .line 252
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 253
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/media3/common/TrackSelectionOverride;

    .line 254
    iget-object v4, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->overrides:Ljava/util/HashMap;

    iget-object v5, v3, Landroidx/media3/common/TrackSelectionOverride;->mediaTrackGroup:Landroidx/media3/common/TrackGroup;

    invoke-virtual {v4, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 257
    :cond_1
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$2600()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object p1

    new-array v0, v1, [I

    invoke-static {p1, v0}, Lcom/google/common/base/MoreObjects;->firstNonNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [I

    .line 258
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->disabledTrackTypes:Ljava/util/HashSet;

    .line 259
    array-length v0, p1

    :goto_2
    if-ge v1, v0, :cond_2

    aget v2, p1, v1

    .line 260
    iget-object v3, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->disabledTrackTypes:Ljava/util/HashSet;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    return-void
.end method

.method protected constructor <init>(Landroidx/media3/common/TrackSelectionParameters;)V
    .locals 0

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    invoke-direct {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->init(Landroidx/media3/common/TrackSelectionParameters;)V

    return-void
.end method

.method static synthetic access$3500(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoWidth:I

    return p0
.end method

.method static synthetic access$3600(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoHeight:I

    return p0
.end method

.method static synthetic access$3700(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoFrameRate:I

    return p0
.end method

.method static synthetic access$3800(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoBitrate:I

    return p0
.end method

.method static synthetic access$3900(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoWidth:I

    return p0
.end method

.method static synthetic access$4000(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoHeight:I

    return p0
.end method

.method static synthetic access$4100(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoFrameRate:I

    return p0
.end method

.method static synthetic access$4200(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoBitrate:I

    return p0
.end method

.method static synthetic access$4300(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportWidth:I

    return p0
.end method

.method static synthetic access$4400(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportHeight:I

    return p0
.end method

.method static synthetic access$4500(Landroidx/media3/common/TrackSelectionParameters$Builder;)Z
    .locals 0

    .line 79
    iget-boolean p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportOrientationMayChange:Z

    return p0
.end method

.method static synthetic access$4600(Landroidx/media3/common/TrackSelectionParameters$Builder;)Lcom/google/common/collect/ImmutableList;
    .locals 0

    .line 79
    iget-object p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredVideoMimeTypes:Lcom/google/common/collect/ImmutableList;

    return-object p0
.end method

.method static synthetic access$4700(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredVideoRoleFlags:I

    return p0
.end method

.method static synthetic access$4800(Landroidx/media3/common/TrackSelectionParameters$Builder;)Lcom/google/common/collect/ImmutableList;
    .locals 0

    .line 79
    iget-object p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioLanguages:Lcom/google/common/collect/ImmutableList;

    return-object p0
.end method

.method static synthetic access$4900(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioRoleFlags:I

    return p0
.end method

.method static synthetic access$5000(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxAudioChannelCount:I

    return p0
.end method

.method static synthetic access$5100(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxAudioBitrate:I

    return p0
.end method

.method static synthetic access$5200(Landroidx/media3/common/TrackSelectionParameters$Builder;)Lcom/google/common/collect/ImmutableList;
    .locals 0

    .line 79
    iget-object p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioMimeTypes:Lcom/google/common/collect/ImmutableList;

    return-object p0
.end method

.method static synthetic access$5300(Landroidx/media3/common/TrackSelectionParameters$Builder;)Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;
    .locals 0

    .line 79
    iget-object p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    return-object p0
.end method

.method static synthetic access$5400(Landroidx/media3/common/TrackSelectionParameters$Builder;)Lcom/google/common/collect/ImmutableList;
    .locals 0

    .line 79
    iget-object p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextLanguages:Lcom/google/common/collect/ImmutableList;

    return-object p0
.end method

.method static synthetic access$5500(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextRoleFlags:I

    return p0
.end method

.method static synthetic access$5600(Landroidx/media3/common/TrackSelectionParameters$Builder;)I
    .locals 0

    .line 79
    iget p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->ignoredTextSelectionFlags:I

    return p0
.end method

.method static synthetic access$5700(Landroidx/media3/common/TrackSelectionParameters$Builder;)Z
    .locals 0

    .line 79
    iget-boolean p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->selectUndeterminedTextLanguage:Z

    return p0
.end method

.method static synthetic access$5800(Landroidx/media3/common/TrackSelectionParameters$Builder;)Z
    .locals 0

    .line 79
    iget-boolean p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->isPrioritizeImageOverVideoEnabled:Z

    return p0
.end method

.method static synthetic access$5900(Landroidx/media3/common/TrackSelectionParameters$Builder;)Z
    .locals 0

    .line 79
    iget-boolean p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->forceLowestBitrate:Z

    return p0
.end method

.method static synthetic access$6000(Landroidx/media3/common/TrackSelectionParameters$Builder;)Z
    .locals 0

    .line 79
    iget-boolean p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->forceHighestSupportedBitrate:Z

    return p0
.end method

.method static synthetic access$6100(Landroidx/media3/common/TrackSelectionParameters$Builder;)Ljava/util/HashMap;
    .locals 0

    .line 79
    iget-object p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->overrides:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$6200(Landroidx/media3/common/TrackSelectionParameters$Builder;)Ljava/util/HashSet;
    .locals 0

    .line 79
    iget-object p0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->disabledTrackTypes:Ljava/util/HashSet;

    return-object p0
.end method

.method private static getAudioOffloadPreferencesFromBundle(Landroid/os/Bundle;)Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;
    .locals 3

    .line 265
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$2700()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 267
    invoke-static {v0}, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->fromBundle(Landroid/os/Bundle;)Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    move-result-object p0

    goto :goto_0

    .line 281
    :cond_0
    new-instance v0, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;

    invoke-direct {v0}, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;-><init>()V

    .line 271
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$3000()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->DEFAULT:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iget v2, v2, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->audioOffloadMode:I

    .line 270
    invoke-virtual {p0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 269
    invoke-virtual {v0, v1}, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;->setAudioOffloadMode(I)Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;

    move-result-object v0

    .line 275
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$2900()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->DEFAULT:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iget-boolean v2, v2, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->isGaplessSupportRequired:Z

    .line 274
    invoke-virtual {p0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 273
    invoke-virtual {v0, v1}, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;->setIsGaplessSupportRequired(Z)Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;

    move-result-object v0

    .line 279
    invoke-static {}, Landroidx/media3/common/TrackSelectionParameters;->access$2800()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->DEFAULT:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iget-boolean v2, v2, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;->isSpeedChangeSupportRequired:Z

    .line 278
    invoke-virtual {p0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    .line 277
    invoke-virtual {v0, p0}, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;->setIsSpeedChangeSupportRequired(Z)Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;

    move-result-object p0

    .line 281
    invoke-virtual {p0}, Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences$Builder;->build()Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private init(Landroidx/media3/common/TrackSelectionParameters;)V
    .locals 2
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "preferredVideoMimeTypes",
            "preferredAudioLanguages",
            "preferredAudioMimeTypes",
            "audioOffloadPreferences",
            "preferredTextLanguages",
            "overrides",
            "disabledTrackTypes"
        }
    .end annotation

    .line 296
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->maxVideoWidth:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoWidth:I

    .line 297
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->maxVideoHeight:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoHeight:I

    .line 298
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->maxVideoFrameRate:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoFrameRate:I

    .line 299
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->maxVideoBitrate:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoBitrate:I

    .line 300
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->minVideoWidth:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoWidth:I

    .line 301
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->minVideoHeight:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoHeight:I

    .line 302
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->minVideoFrameRate:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoFrameRate:I

    .line 303
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->minVideoBitrate:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoBitrate:I

    .line 304
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->viewportWidth:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportWidth:I

    .line 305
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->viewportHeight:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportHeight:I

    .line 306
    iget-boolean v0, p1, Landroidx/media3/common/TrackSelectionParameters;->viewportOrientationMayChange:Z

    iput-boolean v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportOrientationMayChange:Z

    .line 307
    iget-object v0, p1, Landroidx/media3/common/TrackSelectionParameters;->preferredVideoMimeTypes:Lcom/google/common/collect/ImmutableList;

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredVideoMimeTypes:Lcom/google/common/collect/ImmutableList;

    .line 308
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->preferredVideoRoleFlags:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredVideoRoleFlags:I

    .line 310
    iget-object v0, p1, Landroidx/media3/common/TrackSelectionParameters;->preferredAudioLanguages:Lcom/google/common/collect/ImmutableList;

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioLanguages:Lcom/google/common/collect/ImmutableList;

    .line 311
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->preferredAudioRoleFlags:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioRoleFlags:I

    .line 312
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->maxAudioChannelCount:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxAudioChannelCount:I

    .line 313
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->maxAudioBitrate:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxAudioBitrate:I

    .line 314
    iget-object v0, p1, Landroidx/media3/common/TrackSelectionParameters;->preferredAudioMimeTypes:Lcom/google/common/collect/ImmutableList;

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioMimeTypes:Lcom/google/common/collect/ImmutableList;

    .line 315
    iget-object v0, p1, Landroidx/media3/common/TrackSelectionParameters;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    .line 317
    iget-object v0, p1, Landroidx/media3/common/TrackSelectionParameters;->preferredTextLanguages:Lcom/google/common/collect/ImmutableList;

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextLanguages:Lcom/google/common/collect/ImmutableList;

    .line 318
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->preferredTextRoleFlags:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextRoleFlags:I

    .line 319
    iget v0, p1, Landroidx/media3/common/TrackSelectionParameters;->ignoredTextSelectionFlags:I

    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->ignoredTextSelectionFlags:I

    .line 320
    iget-boolean v0, p1, Landroidx/media3/common/TrackSelectionParameters;->selectUndeterminedTextLanguage:Z

    iput-boolean v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->selectUndeterminedTextLanguage:Z

    .line 322
    iget-boolean v0, p1, Landroidx/media3/common/TrackSelectionParameters;->isPrioritizeImageOverVideoEnabled:Z

    iput-boolean v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->isPrioritizeImageOverVideoEnabled:Z

    .line 324
    iget-boolean v0, p1, Landroidx/media3/common/TrackSelectionParameters;->forceLowestBitrate:Z

    iput-boolean v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->forceLowestBitrate:Z

    .line 325
    iget-boolean v0, p1, Landroidx/media3/common/TrackSelectionParameters;->forceHighestSupportedBitrate:Z

    iput-boolean v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->forceHighestSupportedBitrate:Z

    .line 326
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p1, Landroidx/media3/common/TrackSelectionParameters;->disabledTrackTypes:Lcom/google/common/collect/ImmutableSet;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->disabledTrackTypes:Ljava/util/HashSet;

    .line 327
    new-instance v0, Ljava/util/HashMap;

    iget-object p1, p1, Landroidx/media3/common/TrackSelectionParameters;->overrides:Lcom/google/common/collect/ImmutableMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->overrides:Ljava/util/HashMap;

    return-void
.end method

.method private static normalizeLanguageCodes([Ljava/lang/String;)Lcom/google/common/collect/ImmutableList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/common/collect/ImmutableList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 848
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v0

    .line 849
    invoke-static {p0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 850
    invoke-static {v3}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Landroidx/media3/common/util/Util;->normalizeLanguageCode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 852
    :cond_0
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public addOverride(Landroidx/media3/common/TrackSelectionOverride;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 2

    .line 768
    iget-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->overrides:Ljava/util/HashMap;

    iget-object v1, p1, Landroidx/media3/common/TrackSelectionOverride;->mediaTrackGroup:Landroidx/media3/common/TrackGroup;

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public build()Landroidx/media3/common/TrackSelectionParameters;
    .locals 1

    .line 844
    new-instance v0, Landroidx/media3/common/TrackSelectionParameters;

    invoke-direct {v0, p0}, Landroidx/media3/common/TrackSelectionParameters;-><init>(Landroidx/media3/common/TrackSelectionParameters$Builder;)V

    return-object v0
.end method

.method public clearOverride(Landroidx/media3/common/TrackGroup;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 1

    .line 783
    iget-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->overrides:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public clearOverrides()Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 1

    .line 803
    iget-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->overrides:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-object p0
.end method

.method public clearOverridesOfType(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 2

    .line 790
    iget-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->overrides:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 791
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 792
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/media3/common/TrackSelectionOverride;

    .line 793
    invoke-virtual {v1}, Landroidx/media3/common/TrackSelectionOverride;->getType()I

    move-result v1

    if-ne v1, p1, :cond_0

    .line 794
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public clearVideoSizeConstraints()Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 1

    const v0, 0x7fffffff

    .line 357
    invoke-virtual {p0, v0, v0}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setMaxVideoSize(II)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method public clearViewportSizeConstraints()Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 2

    const v0, 0x7fffffff

    const/4 v1, 0x1

    .line 461
    invoke-virtual {p0, v0, v0, v1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setViewportSize(IIZ)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method protected set(Landroidx/media3/common/TrackSelectionParameters;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 334
    invoke-direct {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->init(Landroidx/media3/common/TrackSelectionParameters;)V

    return-object p0
.end method

.method public setAudioOffloadPreferences(Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 616
    iput-object p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->audioOffloadPreferences:Landroidx/media3/common/TrackSelectionParameters$AudioOffloadPreferences;

    return-object p0
.end method

.method public setDisabledTrackTypes(Ljava/util/Set;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/media3/common/TrackSelectionParameters$Builder;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 819
    iget-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->disabledTrackTypes:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 820
    iget-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->disabledTrackTypes:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    return-object p0
.end method

.method public setForceHighestSupportedBitrate(Z)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 761
    iput-boolean p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->forceHighestSupportedBitrate:Z

    return-object p0
.end method

.method public setForceLowestBitrate(Z)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 747
    iput-boolean p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->forceLowestBitrate:Z

    return-object p0
.end method

.method public setIgnoredTextSelectionFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 700
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->ignoredTextSelectionFlags:I

    return-object p0
.end method

.method public setMaxAudioBitrate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 580
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxAudioBitrate:I

    return-object p0
.end method

.method public setMaxAudioChannelCount(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 568
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxAudioChannelCount:I

    return-object p0
.end method

.method public setMaxVideoBitrate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 394
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoBitrate:I

    return-object p0
.end method

.method public setMaxVideoFrameRate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 382
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoFrameRate:I

    return-object p0
.end method

.method public setMaxVideoSize(II)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 369
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoWidth:I

    .line 370
    iput p2, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->maxVideoHeight:I

    return-object p0
.end method

.method public setMaxVideoSizeSd()Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 2

    const/16 v0, 0x4ff

    const/16 v1, 0x2cf

    .line 347
    invoke-virtual {p0, v0, v1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setMaxVideoSize(II)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object v0

    return-object v0
.end method

.method public setMinVideoBitrate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 432
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoBitrate:I

    return-object p0
.end method

.method public setMinVideoFrameRate(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 420
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoFrameRate:I

    return-object p0
.end method

.method public setMinVideoSize(II)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 407
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoWidth:I

    .line 408
    iput p2, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->minVideoHeight:I

    return-object p0
.end method

.method public setOverrideForType(Landroidx/media3/common/TrackSelectionOverride;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 2

    .line 775
    invoke-virtual {p1}, Landroidx/media3/common/TrackSelectionOverride;->getType()I

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/media3/common/TrackSelectionParameters$Builder;->clearOverridesOfType(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    .line 776
    iget-object v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->overrides:Ljava/util/HashMap;

    iget-object v1, p1, Landroidx/media3/common/TrackSelectionOverride;->mediaTrackGroup:Landroidx/media3/common/TrackGroup;

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public setPreferredAudioLanguage(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 530
    new-array p1, p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredAudioLanguages([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    goto :goto_0

    .line 531
    :cond_0
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredAudioLanguages([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public varargs setPreferredAudioLanguages([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 544
    invoke-static {p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->normalizeLanguageCodes([Ljava/lang/String;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioLanguages:Lcom/google/common/collect/ImmutableList;

    return-object p0
.end method

.method public setPreferredAudioMimeType(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 592
    new-array p1, p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredAudioMimeTypes([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    goto :goto_0

    :cond_0
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredAudioMimeTypes([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public varargs setPreferredAudioMimeTypes([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 604
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioMimeTypes:Lcom/google/common/collect/ImmutableList;

    return-object p0
.end method

.method public setPreferredAudioRoleFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 556
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredAudioRoleFlags:I

    return-object p0
.end method

.method public setPreferredTextLanguage(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 661
    new-array p1, p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredTextLanguages([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    goto :goto_0

    .line 662
    :cond_0
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredTextLanguages([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public setPreferredTextLanguageAndRoleFlagsToCaptioningManagerSettings(Landroid/content/Context;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 2

    .line 634
    sget v0, Landroidx/media3/common/util/Util;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-nez v0, :cond_0

    return-object p0

    .line 639
    :cond_0
    const-string v0, "captioning"

    .line 640
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/CaptioningManager;

    if-eqz p1, :cond_2

    .line 641
    invoke-virtual {p1}, Landroid/view/accessibility/CaptioningManager;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/16 v0, 0x440

    .line 644
    iput v0, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextRoleFlags:I

    .line 645
    invoke-virtual {p1}, Landroid/view/accessibility/CaptioningManager;->getLocale()Ljava/util/Locale;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 647
    invoke-static {p1}, Landroidx/media3/common/util/Util;->getLocaleLanguageTag(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextLanguages:Lcom/google/common/collect/ImmutableList;

    :cond_2
    :goto_0
    return-object p0
.end method

.method public varargs setPreferredTextLanguages([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 675
    invoke-static {p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->normalizeLanguageCodes([Ljava/lang/String;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextLanguages:Lcom/google/common/collect/ImmutableList;

    return-object p0
.end method

.method public setPreferredTextRoleFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 687
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredTextRoleFlags:I

    return-object p0
.end method

.method public setPreferredVideoMimeType(Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 491
    new-array p1, p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredVideoMimeTypes([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    goto :goto_0

    :cond_0
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setPreferredVideoMimeTypes([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public varargs setPreferredVideoMimeTypes([Ljava/lang/String;)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 503
    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredVideoMimeTypes:Lcom/google/common/collect/ImmutableList;

    return-object p0
.end method

.method public setPreferredVideoRoleFlags(I)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 515
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->preferredVideoRoleFlags:I

    return-object p0
.end method

.method public setPrioritizeImageOverVideoEnabled(Z)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 731
    iput-boolean p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->isPrioritizeImageOverVideoEnabled:Z

    return-object p0
.end method

.method public setSelectUndeterminedTextLanguage(Z)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 715
    iput-boolean p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->selectUndeterminedTextLanguage:Z

    return-object p0
.end method

.method public setTrackTypeDisabled(IZ)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    if-eqz p2, :cond_0

    .line 835
    iget-object p2, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->disabledTrackTypes:Ljava/util/HashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 837
    :cond_0
    iget-object p2, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->disabledTrackTypes:Ljava/util/HashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    :goto_0
    return-object p0
.end method

.method public setViewportSize(IIZ)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 0

    .line 477
    iput p1, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportWidth:I

    .line 478
    iput p2, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportHeight:I

    .line 479
    iput-boolean p3, p0, Landroidx/media3/common/TrackSelectionParameters$Builder;->viewportOrientationMayChange:Z

    return-object p0
.end method

.method public setViewportSizeToPhysicalDisplaySize(Landroid/content/Context;Z)Landroidx/media3/common/TrackSelectionParameters$Builder;
    .locals 1

    .line 449
    invoke-static {p1}, Landroidx/media3/common/util/Util;->getCurrentDisplayModeSize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object p1

    .line 450
    iget v0, p1, Landroid/graphics/Point;->x:I

    iget p1, p1, Landroid/graphics/Point;->y:I

    invoke-virtual {p0, v0, p1, p2}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setViewportSize(IIZ)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    return-object p1
.end method
