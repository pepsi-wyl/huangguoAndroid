.class public final Landroidx/media3/extractor/ts/H264Reader;
.super Ljava/lang/Object;
.source "H264Reader.java"

# interfaces
.implements Landroidx/media3/extractor/ts/ElementaryStreamReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/extractor/ts/H264Reader$SampleReader;
    }
.end annotation


# instance fields
.field private final allowNonIdrKeyframes:Z

.field private final detectAccessUnits:Z

.field private formatId:Ljava/lang/String;

.field private hasOutputFormat:Z

.field private output:Landroidx/media3/extractor/TrackOutput;

.field private pesTimeUs:J

.field private final pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

.field private final prefixFlags:[Z

.field private randomAccessIndicator:Z

.field private sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

.field private final sei:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

.field private final seiReader:Landroidx/media3/extractor/ts/SeiReader;

.field private final seiWrapper:Landroidx/media3/common/util/ParsableByteArray;

.field private final sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

.field private totalBytesWritten:J


# direct methods
.method public constructor <init>(Landroidx/media3/extractor/ts/SeiReader;ZZ)V
    .locals 0

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Landroidx/media3/extractor/ts/H264Reader;->seiReader:Landroidx/media3/extractor/ts/SeiReader;

    .line 82
    iput-boolean p2, p0, Landroidx/media3/extractor/ts/H264Reader;->allowNonIdrKeyframes:Z

    .line 83
    iput-boolean p3, p0, Landroidx/media3/extractor/ts/H264Reader;->detectAccessUnits:Z

    const/4 p1, 0x3

    .line 84
    new-array p1, p1, [Z

    iput-object p1, p0, Landroidx/media3/extractor/ts/H264Reader;->prefixFlags:[Z

    .line 85
    new-instance p1, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    const/4 p2, 0x7

    const/16 p3, 0x80

    invoke-direct {p1, p2, p3}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;-><init>(II)V

    iput-object p1, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    .line 86
    new-instance p1, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    const/16 p2, 0x8

    invoke-direct {p1, p2, p3}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;-><init>(II)V

    iput-object p1, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    .line 87
    new-instance p1, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    const/4 p2, 0x6

    invoke-direct {p1, p2, p3}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;-><init>(II)V

    iput-object p1, p0, Landroidx/media3/extractor/ts/H264Reader;->sei:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 88
    iput-wide p1, p0, Landroidx/media3/extractor/ts/H264Reader;->pesTimeUs:J

    .line 89
    new-instance p1, Landroidx/media3/common/util/ParsableByteArray;

    invoke-direct {p1}, Landroidx/media3/common/util/ParsableByteArray;-><init>()V

    iput-object p1, p0, Landroidx/media3/extractor/ts/H264Reader;->seiWrapper:Landroidx/media3/common/util/ParsableByteArray;

    return-void
.end method

.method private assertTracksCreated()V
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "output",
            "sampleReader"
        }
    .end annotation

    .line 266
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->output:Landroidx/media3/extractor/TrackOutput;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkStateNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    invoke-static {v0}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private endNalUnit(JIIJ)V
    .locals 7
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "output",
            "sampleReader"
        }
    .end annotation

    .line 199
    iget-boolean v0, p0, Landroidx/media3/extractor/ts/H264Reader;->hasOutputFormat:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->needsSpsPps()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 200
    :cond_0
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p4}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->endNalUnit(I)Z

    .line 201
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p4}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->endNalUnit(I)Z

    .line 202
    iget-boolean v0, p0, Landroidx/media3/extractor/ts/H264Reader;->hasOutputFormat:Z

    const/4 v1, 0x3

    if-nez v0, :cond_1

    .line 203
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->isCompleted()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->isCompleted()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 204
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 205
    iget-object v2, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget-object v2, v2, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    iget-object v3, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget v3, v3, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalLength:I

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    iget-object v2, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget-object v2, v2, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    iget-object v3, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget v3, v3, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalLength:I

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 207
    iget-object v2, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget-object v2, v2, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    iget-object v3, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget v3, v3, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalLength:I

    invoke-static {v2, v1, v3}, Landroidx/media3/container/NalUnitUtil;->parseSpsNalUnit([BII)Landroidx/media3/container/NalUnitUtil$SpsData;

    move-result-object v2

    .line 208
    iget-object v3, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget-object v3, v3, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    iget-object v4, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget v4, v4, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalLength:I

    invoke-static {v3, v1, v4}, Landroidx/media3/container/NalUnitUtil;->parsePpsNalUnit([BII)Landroidx/media3/container/NalUnitUtil$PpsData;

    move-result-object v1

    .line 209
    iget v3, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->profileIdc:I

    iget v4, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->constraintsFlagsAndReservedZero2Bits:I

    iget v5, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->levelIdc:I

    .line 210
    invoke-static {v3, v4, v5}, Landroidx/media3/common/util/CodecSpecificDataUtil;->buildAvcCodecString(III)Ljava/lang/String;

    move-result-object v3

    .line 214
    iget-object v4, p0, Landroidx/media3/extractor/ts/H264Reader;->output:Landroidx/media3/extractor/TrackOutput;

    new-instance v5, Landroidx/media3/common/Format$Builder;

    invoke-direct {v5}, Landroidx/media3/common/Format$Builder;-><init>()V

    iget-object v6, p0, Landroidx/media3/extractor/ts/H264Reader;->formatId:Ljava/lang/String;

    .line 216
    invoke-virtual {v5, v6}, Landroidx/media3/common/Format$Builder;->setId(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;

    move-result-object v5

    const-string v6, "video/avc"

    .line 217
    invoke-virtual {v5, v6}, Landroidx/media3/common/Format$Builder;->setSampleMimeType(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;

    move-result-object v5

    .line 218
    invoke-virtual {v5, v3}, Landroidx/media3/common/Format$Builder;->setCodecs(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;

    move-result-object v3

    iget v5, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->width:I

    .line 219
    invoke-virtual {v3, v5}, Landroidx/media3/common/Format$Builder;->setWidth(I)Landroidx/media3/common/Format$Builder;

    move-result-object v3

    iget v5, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->height:I

    .line 220
    invoke-virtual {v3, v5}, Landroidx/media3/common/Format$Builder;->setHeight(I)Landroidx/media3/common/Format$Builder;

    move-result-object v3

    new-instance v5, Landroidx/media3/common/ColorInfo$Builder;

    invoke-direct {v5}, Landroidx/media3/common/ColorInfo$Builder;-><init>()V

    iget v6, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->colorSpace:I

    .line 223
    invoke-virtual {v5, v6}, Landroidx/media3/common/ColorInfo$Builder;->setColorSpace(I)Landroidx/media3/common/ColorInfo$Builder;

    move-result-object v5

    iget v6, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->colorRange:I

    .line 224
    invoke-virtual {v5, v6}, Landroidx/media3/common/ColorInfo$Builder;->setColorRange(I)Landroidx/media3/common/ColorInfo$Builder;

    move-result-object v5

    iget v6, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->colorTransfer:I

    .line 225
    invoke-virtual {v5, v6}, Landroidx/media3/common/ColorInfo$Builder;->setColorTransfer(I)Landroidx/media3/common/ColorInfo$Builder;

    move-result-object v5

    iget v6, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->bitDepthLumaMinus8:I

    add-int/lit8 v6, v6, 0x8

    .line 226
    invoke-virtual {v5, v6}, Landroidx/media3/common/ColorInfo$Builder;->setLumaBitdepth(I)Landroidx/media3/common/ColorInfo$Builder;

    move-result-object v5

    iget v6, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->bitDepthChromaMinus8:I

    add-int/lit8 v6, v6, 0x8

    .line 227
    invoke-virtual {v5, v6}, Landroidx/media3/common/ColorInfo$Builder;->setChromaBitdepth(I)Landroidx/media3/common/ColorInfo$Builder;

    move-result-object v5

    .line 228
    invoke-virtual {v5}, Landroidx/media3/common/ColorInfo$Builder;->build()Landroidx/media3/common/ColorInfo;

    move-result-object v5

    .line 221
    invoke-virtual {v3, v5}, Landroidx/media3/common/Format$Builder;->setColorInfo(Landroidx/media3/common/ColorInfo;)Landroidx/media3/common/Format$Builder;

    move-result-object v3

    iget v5, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->pixelWidthHeightRatio:F

    .line 229
    invoke-virtual {v3, v5}, Landroidx/media3/common/Format$Builder;->setPixelWidthHeightRatio(F)Landroidx/media3/common/Format$Builder;

    move-result-object v3

    .line 230
    invoke-virtual {v3, v0}, Landroidx/media3/common/Format$Builder;->setInitializationData(Ljava/util/List;)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    iget v3, v2, Landroidx/media3/container/NalUnitUtil$SpsData;->maxNumReorderFrames:I

    .line 231
    invoke-virtual {v0, v3}, Landroidx/media3/common/Format$Builder;->setMaxNumReorderSamples(I)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    .line 232
    invoke-virtual {v0}, Landroidx/media3/common/Format$Builder;->build()Landroidx/media3/common/Format;

    move-result-object v0

    .line 214
    invoke-interface {v4, v0}, Landroidx/media3/extractor/TrackOutput;->format(Landroidx/media3/common/Format;)V

    const/4 v0, 0x1

    .line 233
    iput-boolean v0, p0, Landroidx/media3/extractor/ts/H264Reader;->hasOutputFormat:Z

    .line 234
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    invoke-virtual {v0, v2}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->putSps(Landroidx/media3/container/NalUnitUtil$SpsData;)V

    .line 235
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    invoke-virtual {v0, v1}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->putPps(Landroidx/media3/container/NalUnitUtil$PpsData;)V

    .line 236
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->reset()V

    .line 237
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->reset()V

    goto :goto_0

    .line 239
    :cond_1
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->isCompleted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 240
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget-object v0, v0, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    iget-object v2, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget v2, v2, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalLength:I

    invoke-static {v0, v1, v2}, Landroidx/media3/container/NalUnitUtil;->parseSpsNalUnit([BII)Landroidx/media3/container/NalUnitUtil$SpsData;

    move-result-object v0

    .line 241
    iget-object v1, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    invoke-virtual {v1, v0}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->putSps(Landroidx/media3/container/NalUnitUtil$SpsData;)V

    .line 242
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->reset()V

    goto :goto_0

    .line 243
    :cond_2
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->isCompleted()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 244
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget-object v0, v0, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    iget-object v2, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget v2, v2, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalLength:I

    invoke-static {v0, v1, v2}, Landroidx/media3/container/NalUnitUtil;->parsePpsNalUnit([BII)Landroidx/media3/container/NalUnitUtil$PpsData;

    move-result-object v0

    .line 245
    iget-object v1, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    invoke-virtual {v1, v0}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->putPps(Landroidx/media3/container/NalUnitUtil$PpsData;)V

    .line 246
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->reset()V

    .line 249
    :cond_3
    :goto_0
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sei:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p4}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->endNalUnit(I)Z

    move-result p4

    if-eqz p4, :cond_4

    .line 250
    iget-object p4, p0, Landroidx/media3/extractor/ts/H264Reader;->sei:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget-object p4, p4, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sei:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget v0, v0, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalLength:I

    invoke-static {p4, v0}, Landroidx/media3/container/NalUnitUtil;->unescapeStream([BI)I

    move-result p4

    .line 251
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->seiWrapper:Landroidx/media3/common/util/ParsableByteArray;

    iget-object v1, p0, Landroidx/media3/extractor/ts/H264Reader;->sei:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    iget-object v1, v1, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->nalData:[B

    invoke-virtual {v0, v1, p4}, Landroidx/media3/common/util/ParsableByteArray;->reset([BI)V

    .line 252
    iget-object p4, p0, Landroidx/media3/extractor/ts/H264Reader;->seiWrapper:Landroidx/media3/common/util/ParsableByteArray;

    const/4 v0, 0x4

    invoke-virtual {p4, v0}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 253
    iget-object p4, p0, Landroidx/media3/extractor/ts/H264Reader;->seiReader:Landroidx/media3/extractor/ts/SeiReader;

    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->seiWrapper:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p4, p5, p6, v0}, Landroidx/media3/extractor/ts/SeiReader;->consume(JLandroidx/media3/common/util/ParsableByteArray;)V

    .line 255
    :cond_4
    iget-object p4, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    iget-boolean p5, p0, Landroidx/media3/extractor/ts/H264Reader;->hasOutputFormat:Z

    invoke-virtual {p4, p1, p2, p3, p5}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->endNalUnit(JIZ)Z

    move-result p1

    if-eqz p1, :cond_5

    const/4 p1, 0x0

    .line 260
    iput-boolean p1, p0, Landroidx/media3/extractor/ts/H264Reader;->randomAccessIndicator:Z

    :cond_5
    return-void
.end method

.method private nalUnitData([BII)V
    .locals 1
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "sampleReader"
        }
    .end annotation

    .line 189
    iget-boolean v0, p0, Landroidx/media3/extractor/ts/H264Reader;->hasOutputFormat:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->needsSpsPps()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 190
    :cond_0
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->appendToNalUnit([BII)V

    .line 191
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->appendToNalUnit([BII)V

    .line 193
    :cond_1
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sei:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->appendToNalUnit([BII)V

    .line 194
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->appendToNalUnit([BII)V

    return-void
.end method

.method private startNalUnit(JIJ)V
    .locals 8
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "sampleReader"
        }
    .end annotation

    .line 179
    iget-boolean v0, p0, Landroidx/media3/extractor/ts/H264Reader;->hasOutputFormat:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->needsSpsPps()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 180
    :cond_0
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p3}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->startNalUnit(I)V

    .line 181
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p3}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->startNalUnit(I)V

    .line 183
    :cond_1
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sei:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0, p3}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->startNalUnit(I)V

    .line 184
    iget-object v1, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    iget-boolean v7, p0, Landroidx/media3/extractor/ts/H264Reader;->randomAccessIndicator:Z

    move-wide v2, p1

    move v4, p3

    move-wide v5, p4

    invoke-virtual/range {v1 .. v7}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->startNalUnit(JIJZ)V

    return-void
.end method


# virtual methods
.method public consume(Landroidx/media3/common/util/ParsableByteArray;)V
    .locals 14

    .line 123
    invoke-direct {p0}, Landroidx/media3/extractor/ts/H264Reader;->assertTracksCreated()V

    .line 125
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result v0

    .line 126
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->limit()I

    move-result v1

    .line 127
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object v2

    .line 130
    iget-wide v3, p0, Landroidx/media3/extractor/ts/H264Reader;->totalBytesWritten:J

    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v3, v5

    iput-wide v3, p0, Landroidx/media3/extractor/ts/H264Reader;->totalBytesWritten:J

    .line 131
    iget-object v3, p0, Landroidx/media3/extractor/ts/H264Reader;->output:Landroidx/media3/extractor/TrackOutput;

    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    invoke-interface {v3, p1, v4}, Landroidx/media3/extractor/TrackOutput;->sampleData(Landroidx/media3/common/util/ParsableByteArray;I)V

    .line 135
    :goto_0
    iget-object p1, p0, Landroidx/media3/extractor/ts/H264Reader;->prefixFlags:[Z

    invoke-static {v2, v0, v1, p1}, Landroidx/media3/container/NalUnitUtil;->findNalUnit([BII[Z)I

    move-result p1

    if-ne p1, v1, :cond_0

    .line 139
    invoke-direct {p0, v2, v0, v1}, Landroidx/media3/extractor/ts/H264Reader;->nalUnitData([BII)V

    return-void

    .line 144
    :cond_0
    invoke-static {v2, p1}, Landroidx/media3/container/NalUnitUtil;->getNalUnitType([BI)I

    move-result v6

    sub-int v3, p1, v0

    if-lez v3, :cond_1

    .line 150
    invoke-direct {p0, v2, v0, p1}, Landroidx/media3/extractor/ts/H264Reader;->nalUnitData([BII)V

    :cond_1
    sub-int v10, v1, p1

    .line 153
    iget-wide v4, p0, Landroidx/media3/extractor/ts/H264Reader;->totalBytesWritten:J

    int-to-long v7, v10

    sub-long/2addr v4, v7

    if-gez v3, :cond_2

    neg-int v0, v3

    move v11, v0

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    const/4 v11, 0x0

    .line 160
    :goto_1
    iget-wide v12, p0, Landroidx/media3/extractor/ts/H264Reader;->pesTimeUs:J

    move-object v7, p0

    move-wide v8, v4

    .line 157
    invoke-direct/range {v7 .. v13}, Landroidx/media3/extractor/ts/H264Reader;->endNalUnit(JIIJ)V

    .line 163
    iget-wide v7, p0, Landroidx/media3/extractor/ts/H264Reader;->pesTimeUs:J

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Landroidx/media3/extractor/ts/H264Reader;->startNalUnit(JIJ)V

    add-int/lit8 v0, p1, 0x3

    goto :goto_0
.end method

.method public createTracks(Landroidx/media3/extractor/ExtractorOutput;Landroidx/media3/extractor/ts/TsPayloadReader$TrackIdGenerator;)V
    .locals 4

    .line 108
    invoke-virtual {p2}, Landroidx/media3/extractor/ts/TsPayloadReader$TrackIdGenerator;->generateNewId()V

    .line 109
    invoke-virtual {p2}, Landroidx/media3/extractor/ts/TsPayloadReader$TrackIdGenerator;->getFormatId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->formatId:Ljava/lang/String;

    .line 110
    invoke-virtual {p2}, Landroidx/media3/extractor/ts/TsPayloadReader$TrackIdGenerator;->getTrackId()I

    move-result v0

    const/4 v1, 0x2

    invoke-interface {p1, v0, v1}, Landroidx/media3/extractor/ExtractorOutput;->track(II)Landroidx/media3/extractor/TrackOutput;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->output:Landroidx/media3/extractor/TrackOutput;

    .line 111
    new-instance v1, Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    iget-boolean v2, p0, Landroidx/media3/extractor/ts/H264Reader;->allowNonIdrKeyframes:Z

    iget-boolean v3, p0, Landroidx/media3/extractor/ts/H264Reader;->detectAccessUnits:Z

    invoke-direct {v1, v0, v2, v3}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;-><init>(Landroidx/media3/extractor/TrackOutput;ZZ)V

    iput-object v1, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    .line 112
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->seiReader:Landroidx/media3/extractor/ts/SeiReader;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/extractor/ts/SeiReader;->createTracks(Landroidx/media3/extractor/ExtractorOutput;Landroidx/media3/extractor/ts/TsPayloadReader$TrackIdGenerator;)V

    return-void
.end method

.method public packetFinished(Z)V
    .locals 2

    .line 171
    invoke-direct {p0}, Landroidx/media3/extractor/ts/H264Reader;->assertTracksCreated()V

    if-eqz p1, :cond_0

    .line 173
    iget-object p1, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    iget-wide v0, p0, Landroidx/media3/extractor/ts/H264Reader;->totalBytesWritten:J

    invoke-virtual {p1, v0, v1}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->end(J)V

    :cond_0
    return-void
.end method

.method public packetStarted(JI)V
    .locals 0

    .line 117
    iput-wide p1, p0, Landroidx/media3/extractor/ts/H264Reader;->pesTimeUs:J

    .line 118
    iget-boolean p1, p0, Landroidx/media3/extractor/ts/H264Reader;->randomAccessIndicator:Z

    and-int/lit8 p2, p3, 0x2

    if-eqz p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    or-int/2addr p1, p2

    iput-boolean p1, p0, Landroidx/media3/extractor/ts/H264Reader;->randomAccessIndicator:Z

    return-void
.end method

.method public seek()V
    .locals 2

    const-wide/16 v0, 0x0

    .line 94
    iput-wide v0, p0, Landroidx/media3/extractor/ts/H264Reader;->totalBytesWritten:J

    const/4 v0, 0x0

    .line 95
    iput-boolean v0, p0, Landroidx/media3/extractor/ts/H264Reader;->randomAccessIndicator:Z

    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 96
    iput-wide v0, p0, Landroidx/media3/extractor/ts/H264Reader;->pesTimeUs:J

    .line 97
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->prefixFlags:[Z

    invoke-static {v0}, Landroidx/media3/container/NalUnitUtil;->clearPrefixFlags([Z)V

    .line 98
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->reset()V

    .line 99
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->pps:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->reset()V

    .line 100
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sei:Landroidx/media3/extractor/ts/NalUnitTargetBuffer;

    invoke-virtual {v0}, Landroidx/media3/extractor/ts/NalUnitTargetBuffer;->reset()V

    .line 101
    iget-object v0, p0, Landroidx/media3/extractor/ts/H264Reader;->sampleReader:Landroidx/media3/extractor/ts/H264Reader$SampleReader;

    if-eqz v0, :cond_0

    .line 102
    invoke-virtual {v0}, Landroidx/media3/extractor/ts/H264Reader$SampleReader;->reset()V

    :cond_0
    return-void
.end method
