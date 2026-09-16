.class public final Landroidx/media3/container/NalUnitUtil$H265SpsData;
.super Ljava/lang/Object;
.source "NalUnitUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/container/NalUnitUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "H265SpsData"
.end annotation


# instance fields
.field public final bitDepthChromaMinus8:I

.field public final bitDepthLumaMinus8:I

.field public final chromaFormatIdc:I

.field public final colorRange:I

.field public final colorSpace:I

.field public final colorTransfer:I

.field public final constraintBytes:[I

.field public final generalLevelIdc:I

.field public final generalProfileCompatibilityFlags:I

.field public final generalProfileIdc:I

.field public final generalProfileSpace:I

.field public final generalTierFlag:Z

.field public final height:I

.field public final maxNumReorderPics:I

.field public final pixelWidthHeightRatio:F

.field public final seqParameterSetId:I

.field public final width:I


# direct methods
.method public constructor <init>(IZIIIII[IIIIIFIIII)V
    .locals 2

    move-object v0, p0

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move v1, p1

    .line 169
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->generalProfileSpace:I

    move v1, p2

    .line 170
    iput-boolean v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->generalTierFlag:Z

    move v1, p3

    .line 171
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->generalProfileIdc:I

    move v1, p4

    .line 172
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->generalProfileCompatibilityFlags:I

    move v1, p5

    .line 173
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->chromaFormatIdc:I

    move v1, p6

    .line 174
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->bitDepthLumaMinus8:I

    move v1, p7

    .line 175
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->bitDepthChromaMinus8:I

    move-object v1, p8

    .line 176
    iput-object v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->constraintBytes:[I

    move v1, p9

    .line 177
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->generalLevelIdc:I

    move v1, p10

    .line 178
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->seqParameterSetId:I

    move v1, p11

    .line 179
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->width:I

    move v1, p12

    .line 180
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->height:I

    move v1, p13

    .line 181
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->pixelWidthHeightRatio:F

    move/from16 v1, p14

    .line 182
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->maxNumReorderPics:I

    move/from16 v1, p15

    .line 183
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->colorSpace:I

    move/from16 v1, p16

    .line 184
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->colorRange:I

    move/from16 v1, p17

    .line 185
    iput v1, v0, Landroidx/media3/container/NalUnitUtil$H265SpsData;->colorTransfer:I

    return-void
.end method
