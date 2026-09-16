.class public final Landroidx/media3/extractor/HevcConfig;
.super Ljava/lang/Object;
.source "HevcConfig.java"


# static fields
.field private static final SPS_NAL_UNIT_TYPE:I = 0x21


# instance fields
.field public final bitdepthChroma:I

.field public final bitdepthLuma:I

.field public final codecs:Ljava/lang/String;

.field public final colorRange:I

.field public final colorSpace:I

.field public final colorTransfer:I

.field public final height:I

.field public final initializationData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field public final maxNumReorderPics:I

.field public final nalUnitLengthFieldLength:I

.field public final pixelWidthHeightRatio:F

.field public final width:I


# direct methods
.method private constructor <init>(Ljava/util/List;IIIIIIIIFILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[B>;IIIIIIIIFI",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    iput-object p1, p0, Landroidx/media3/extractor/HevcConfig;->initializationData:Ljava/util/List;

    .line 210
    iput p2, p0, Landroidx/media3/extractor/HevcConfig;->nalUnitLengthFieldLength:I

    .line 211
    iput p3, p0, Landroidx/media3/extractor/HevcConfig;->width:I

    .line 212
    iput p4, p0, Landroidx/media3/extractor/HevcConfig;->height:I

    .line 213
    iput p5, p0, Landroidx/media3/extractor/HevcConfig;->bitdepthLuma:I

    .line 214
    iput p6, p0, Landroidx/media3/extractor/HevcConfig;->bitdepthChroma:I

    .line 215
    iput p7, p0, Landroidx/media3/extractor/HevcConfig;->colorSpace:I

    .line 216
    iput p8, p0, Landroidx/media3/extractor/HevcConfig;->colorRange:I

    .line 217
    iput p9, p0, Landroidx/media3/extractor/HevcConfig;->colorTransfer:I

    .line 218
    iput p10, p0, Landroidx/media3/extractor/HevcConfig;->pixelWidthHeightRatio:F

    .line 219
    iput p11, p0, Landroidx/media3/extractor/HevcConfig;->maxNumReorderPics:I

    .line 220
    iput-object p12, p0, Landroidx/media3/extractor/HevcConfig;->codecs:Ljava/lang/String;

    return-void
.end method

.method public static parse(Landroidx/media3/common/util/ParsableByteArray;)Landroidx/media3/extractor/HevcConfig;
    .locals 33
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/common/ParserException;
        }
    .end annotation

    move-object/from16 v0, p0

    const/16 v1, 0x15

    .line 43
    :try_start_0
    invoke-virtual {v0, v1}, Landroidx/media3/common/util/ParsableByteArray;->skipBytes(I)V

    .line 44
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedByte()I

    move-result v1

    and-int/lit8 v1, v1, 0x3

    .line 47
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedByte()I

    move-result v2

    .line 49
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    const/4 v7, 0x1

    if-ge v5, v2, :cond_1

    .line 51
    invoke-virtual {v0, v7}, Landroidx/media3/common/util/ParsableByteArray;->skipBytes(I)V

    .line 52
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedShort()I

    move-result v7

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v7, :cond_0

    .line 54
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedShort()I

    move-result v9

    add-int/lit8 v10, v9, 0x4

    add-int/2addr v6, v10

    .line 56
    invoke-virtual {v0, v9}, Landroidx/media3/common/util/ParsableByteArray;->skipBytes(I)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 61
    :cond_1
    invoke-virtual {v0, v3}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 62
    new-array v3, v6, [B

    const/4 v5, -0x1

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    move-object/from16 v22, v9

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v13, -0x1

    const/4 v14, -0x1

    const/4 v15, -0x1

    const/16 v16, -0x1

    const/16 v17, -0x1

    const/16 v18, -0x1

    const/16 v19, -0x1

    const/high16 v20, 0x3f800000    # 1.0f

    const/16 v21, -0x1

    :goto_2
    if-ge v5, v2, :cond_4

    .line 76
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedByte()I

    move-result v9

    and-int/lit8 v9, v9, 0x3f

    .line 77
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedShort()I

    move-result v10

    const/4 v11, 0x0

    :goto_3
    if-ge v11, v10, :cond_3

    .line 79
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/common/util/ParsableByteArray;->readUnsignedShort()I

    move-result v12

    .line 80
    sget-object v7, Landroidx/media3/container/NalUnitUtil;->NAL_START_CODE:[B

    sget-object v4, Landroidx/media3/container/NalUnitUtil;->NAL_START_CODE:[B

    array-length v4, v4

    move/from16 v23, v2

    const/4 v2, 0x0

    invoke-static {v7, v2, v3, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 86
    sget-object v4, Landroidx/media3/container/NalUnitUtil;->NAL_START_CODE:[B

    array-length v4, v4

    add-int/2addr v8, v4

    .line 88
    invoke-virtual/range {p0 .. p0}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result v7

    .line 87
    invoke-static {v4, v7, v3, v8, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/16 v4, 0x21

    if-ne v9, v4, :cond_2

    if-nez v11, :cond_2

    add-int v4, v8, v12

    .line 91
    invoke-static {v3, v8, v4}, Landroidx/media3/container/NalUnitUtil;->parseH265SpsNalUnit([BII)Landroidx/media3/container/NalUnitUtil$H265SpsData;

    move-result-object v4

    .line 93
    iget v13, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->width:I

    .line 94
    iget v14, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->height:I

    .line 95
    iget v7, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->bitDepthLumaMinus8:I

    add-int/lit8 v15, v7, 0x8

    .line 96
    iget v7, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->bitDepthChromaMinus8:I

    add-int/lit8 v16, v7, 0x8

    .line 97
    iget v7, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->colorSpace:I

    .line 98
    iget v2, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->colorRange:I

    move/from16 v17, v2

    .line 99
    iget v2, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->colorTransfer:I

    move/from16 v18, v2

    .line 100
    iget v2, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->pixelWidthHeightRatio:F

    move/from16 v19, v2

    .line 101
    iget v2, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->maxNumReorderPics:I

    move/from16 v20, v2

    .line 103
    iget v2, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->generalProfileSpace:I

    move/from16 v21, v7

    iget-boolean v7, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->generalTierFlag:Z

    move/from16 v30, v9

    iget v9, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->generalProfileIdc:I

    move/from16 v31, v10

    iget v10, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->generalProfileCompatibilityFlags:I

    move/from16 v22, v13

    iget-object v13, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->constraintBytes:[I

    iget v4, v4, Landroidx/media3/container/NalUnitUtil$H265SpsData;->generalLevelIdc:I

    move/from16 v24, v2

    move/from16 v25, v7

    move/from16 v26, v9

    move/from16 v27, v10

    move-object/from16 v28, v13

    move/from16 v29, v4

    .line 104
    invoke-static/range {v24 .. v29}, Landroidx/media3/common/util/CodecSpecificDataUtil;->buildHevcCodecString(IZII[II)Ljava/lang/String;

    move-result-object v2

    move/from16 v13, v22

    move-object/from16 v22, v2

    move/from16 v32, v18

    move/from16 v18, v17

    move/from16 v17, v21

    move/from16 v21, v20

    move/from16 v20, v19

    move/from16 v19, v32

    goto :goto_4

    :cond_2
    move/from16 v30, v9

    move/from16 v31, v10

    :goto_4
    add-int/2addr v8, v12

    .line 113
    invoke-virtual {v0, v12}, Landroidx/media3/common/util/ParsableByteArray;->skipBytes(I)V

    add-int/lit8 v11, v11, 0x1

    move/from16 v2, v23

    move/from16 v9, v30

    move/from16 v10, v31

    const/4 v7, 0x1

    goto/16 :goto_3

    :cond_3
    move/from16 v23, v2

    add-int/lit8 v5, v5, 0x1

    const/4 v7, 0x1

    goto/16 :goto_2

    :cond_4
    if-nez v6, :cond_5

    .line 118
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_5

    :cond_5
    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :goto_5
    move-object v11, v0

    .line 119
    new-instance v0, Landroidx/media3/extractor/HevcConfig;

    const/4 v2, 0x1

    add-int/lit8 v12, v1, 0x1

    move-object v10, v0

    invoke-direct/range {v10 .. v22}, Landroidx/media3/extractor/HevcConfig;-><init>(Ljava/util/List;IIIIIIIIFILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 133
    const-string v1, "Error parsing HEVC config"

    invoke-static {v1, v0}, Landroidx/media3/common/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Landroidx/media3/common/ParserException;

    move-result-object v0

    throw v0
.end method
