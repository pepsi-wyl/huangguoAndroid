.class public final Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;
.super Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$SegmentBase;
.source "HlsMediaPlaylist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Segment"
.end annotation


# instance fields
.field public final parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Part;",
            ">;"
        }
    .end annotation
.end field

.field public final title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;JJLjava/lang/String;Ljava/lang/String;)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide/from16 v12, p2

    move-wide/from16 v14, p4

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    const/16 v16, 0x0

    .line 134
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v17

    const/4 v2, 0x0

    .line 121
    const-string v3, ""

    const-wide/16 v4, 0x0

    const/4 v6, -0x1

    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    const/4 v9, 0x0

    invoke-direct/range {v0 .. v17}, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;-><init>(Ljava/lang/String;Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;Ljava/lang/String;JIJLandroidx/media3/common/DrmInitData;Ljava/lang/String;Ljava/lang/String;JJZLjava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;Ljava/lang/String;JIJLandroidx/media3/common/DrmInitData;Ljava/lang/String;Ljava/lang/String;JJZLjava/util/List;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;",
            "Ljava/lang/String;",
            "JIJ",
            "Landroidx/media3/common/DrmInitData;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "JJZ",
            "Ljava/util/List<",
            "Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Part;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v15, p0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-wide/from16 v3, p4

    move/from16 v5, p6

    move-wide/from16 v6, p7

    move-object/from16 v8, p9

    move-object/from16 v9, p10

    move-object/from16 v10, p11

    move-wide/from16 v11, p12

    move-wide/from16 v13, p14

    move/from16 v15, p16

    const/16 v16, 0x0

    .line 168
    invoke-direct/range {v0 .. v16}, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$SegmentBase;-><init>(Ljava/lang/String;Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;JIJLandroidx/media3/common/DrmInitData;Ljava/lang/String;Ljava/lang/String;JJZLandroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$1;)V

    move-object/from16 v1, p3

    .line 180
    iput-object v1, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->title:Ljava/lang/String;

    .line 181
    invoke-static/range {p17 .. p17}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    iput-object v1, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->parts:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public copyWith(JI)Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;
    .locals 20

    move-object/from16 v0, p0

    .line 185
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move-wide/from16 v2, p1

    .line 187
    :goto_0
    iget-object v4, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->parts:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 188
    iget-object v4, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->parts:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Part;

    move/from16 v7, p3

    .line 189
    invoke-virtual {v4, v2, v3, v7}, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Part;->copyWith(JI)Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Part;

    move-result-object v5

    invoke-interface {v8, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    iget-wide v4, v4, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Part;->durationUs:J

    add-long/2addr v2, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    move/from16 v7, p3

    .line 192
    new-instance v19, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;

    move-object/from16 v1, v19

    iget-object v2, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->url:Ljava/lang/String;

    iget-object v3, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->initializationSegment:Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;

    iget-object v4, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->title:Ljava/lang/String;

    iget-wide v5, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->durationUs:J

    iget-object v10, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->drmInitData:Landroidx/media3/common/DrmInitData;

    iget-object v11, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->fullSegmentEncryptionKeyUri:Ljava/lang/String;

    iget-object v12, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->encryptionIV:Ljava/lang/String;

    iget-wide v13, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->byteRangeOffset:J

    move-object v9, v8

    iget-wide v7, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->byteRangeLength:J

    move-wide v15, v7

    iget-boolean v7, v0, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;->hasGapTag:Z

    move/from16 v17, v7

    move/from16 v7, p3

    move-object/from16 v18, v9

    move-wide/from16 v8, p1

    invoke-direct/range {v1 .. v18}, Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;-><init>(Ljava/lang/String;Landroidx/media3/exoplayer/hls/playlist/HlsMediaPlaylist$Segment;Ljava/lang/String;JIJLandroidx/media3/common/DrmInitData;Ljava/lang/String;Ljava/lang/String;JJZLjava/util/List;)V

    return-object v19
.end method
