.class public final Landroidx/media3/extractor/flac/FlacExtractor;
.super Ljava/lang/Object;
.source "FlacExtractor.java"

# interfaces
.implements Landroidx/media3/extractor/Extractor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/extractor/flac/FlacExtractor$Flags;
    }
.end annotation


# static fields
.field private static final BUFFER_LENGTH:I = 0x8000

.field public static final FACTORY:Landroidx/media3/extractor/ExtractorsFactory;

.field public static final FLAG_DISABLE_ID3_METADATA:I = 0x1

.field private static final SAMPLE_NUMBER_UNKNOWN:I = -0x1

.field private static final STATE_GET_FRAME_START_MARKER:I = 0x4

.field private static final STATE_GET_STREAM_MARKER_AND_INFO_BLOCK_BYTES:I = 0x1

.field private static final STATE_READ_FRAMES:I = 0x5

.field private static final STATE_READ_ID3_METADATA:I = 0x0

.field private static final STATE_READ_METADATA_BLOCKS:I = 0x3

.field private static final STATE_READ_STREAM_MARKER:I = 0x2


# instance fields
.field private binarySearchSeeker:Landroidx/media3/extractor/flac/FlacBinarySearchSeeker;

.field private final buffer:Landroidx/media3/common/util/ParsableByteArray;

.field private currentFrameBytesWritten:I

.field private currentFrameFirstSampleNumber:J

.field private extractorOutput:Landroidx/media3/extractor/ExtractorOutput;

.field private flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

.field private frameStartMarker:I

.field private id3Metadata:Landroidx/media3/common/Metadata;

.field private final id3MetadataDisabled:Z

.field private minFrameSize:I

.field private final sampleNumberHolder:Landroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;

.field private state:I

.field private final streamMarkerAndInfoBlock:[B

.field private trackOutput:Landroidx/media3/extractor/TrackOutput;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    new-instance v0, Landroidx/media3/extractor/flac/FlacExtractor$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Landroidx/media3/extractor/flac/FlacExtractor$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Landroidx/media3/extractor/flac/FlacExtractor;->FACTORY:Landroidx/media3/extractor/ExtractorsFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 129
    invoke-direct {p0, v0}, Landroidx/media3/extractor/flac/FlacExtractor;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 3

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x2a

    .line 139
    new-array v0, v0, [B

    iput-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->streamMarkerAndInfoBlock:[B

    .line 141
    new-instance v0, Landroidx/media3/common/util/ParsableByteArray;

    const v1, 0x8000

    new-array v1, v1, [B

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/media3/common/util/ParsableByteArray;-><init>([BI)V

    iput-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    const/4 v0, 0x1

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 142
    :goto_0
    iput-boolean v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->id3MetadataDisabled:Z

    .line 143
    new-instance p1, Landroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;

    invoke-direct {p1}, Landroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;-><init>()V

    iput-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->sampleNumberHolder:Landroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;

    .line 144
    iput v2, p0, Landroidx/media3/extractor/flac/FlacExtractor;->state:I

    return-void
.end method

.method private findFrame(Landroidx/media3/common/util/ParsableByteArray;Z)J
    .locals 4

    .line 347
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result v0

    .line 350
    :goto_0
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->limit()I

    move-result v1

    add-int/lit8 v1, v1, -0x10

    if-gt v0, v1, :cond_1

    .line 351
    invoke-virtual {p1, v0}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 352
    iget-object v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    iget v2, p0, Landroidx/media3/extractor/flac/FlacExtractor;->frameStartMarker:I

    iget-object v3, p0, Landroidx/media3/extractor/flac/FlacExtractor;->sampleNumberHolder:Landroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;

    invoke-static {p1, v1, v2, v3}, Landroidx/media3/extractor/FlacFrameReader;->checkAndReadFrameHeader(Landroidx/media3/common/util/ParsableByteArray;Landroidx/media3/extractor/FlacStreamMetadata;ILandroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 354
    invoke-virtual {p1, v0}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 355
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->sampleNumberHolder:Landroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;

    iget-wide p1, p1, Landroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;->sampleNumber:J

    return-wide p1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_5

    .line 380
    :goto_1
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->limit()I

    move-result p2

    iget v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->minFrameSize:I

    sub-int/2addr p2, v1

    if-gt v0, p2, :cond_4

    .line 381
    invoke-virtual {p1, v0}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 384
    :try_start_0
    iget-object p2, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    iget v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->frameStartMarker:I

    iget-object v2, p0, Landroidx/media3/extractor/flac/FlacExtractor;->sampleNumberHolder:Landroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;

    .line 385
    invoke-static {p1, p2, v1, v2}, Landroidx/media3/extractor/FlacFrameReader;->checkAndReadFrameHeader(Landroidx/media3/common/util/ParsableByteArray;Landroidx/media3/extractor/FlacStreamMetadata;ILandroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;)Z

    move-result p2
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    const/4 p2, 0x0

    .line 391
    :goto_2
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result v1

    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->limit()I

    move-result v2

    if-le v1, v2, :cond_2

    goto :goto_3

    :cond_2
    if-eqz p2, :cond_3

    .line 398
    invoke-virtual {p1, v0}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 399
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->sampleNumberHolder:Landroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;

    iget-wide p1, p1, Landroidx/media3/extractor/FlacFrameReader$SampleNumberHolder;->sampleNumber:J

    return-wide p1

    :cond_3
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 404
    :cond_4
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->limit()I

    move-result p2

    invoke-virtual {p1, p2}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    goto :goto_4

    .line 406
    :cond_5
    invoke-virtual {p1, v0}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    :goto_4
    const-wide/16 p1, -0x1

    return-wide p1
.end method

.method private getFrameStartMarker(Landroidx/media3/extractor/ExtractorInput;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 240
    invoke-static {p1}, Landroidx/media3/extractor/FlacMetadataReader;->getFrameStartMarker(Landroidx/media3/extractor/ExtractorInput;)I

    move-result v0

    iput v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->frameStartMarker:I

    .line 241
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->extractorOutput:Landroidx/media3/extractor/ExtractorOutput;

    invoke-static {v0}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/extractor/ExtractorOutput;

    .line 244
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide v1

    .line 245
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->getLength()J

    move-result-wide v3

    .line 243
    invoke-direct {p0, v1, v2, v3, v4}, Landroidx/media3/extractor/flac/FlacExtractor;->getSeekMap(JJ)Landroidx/media3/extractor/SeekMap;

    move-result-object p1

    .line 242
    invoke-interface {v0, p1}, Landroidx/media3/extractor/ExtractorOutput;->seekMap(Landroidx/media3/extractor/SeekMap;)V

    const/4 p1, 0x5

    .line 247
    iput p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->state:I

    return-void
.end method

.method private getSeekMap(JJ)Landroidx/media3/extractor/SeekMap;
    .locals 9

    .line 320
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    iget-object v0, v0, Landroidx/media3/extractor/FlacStreamMetadata;->seekTable:Landroidx/media3/extractor/FlacStreamMetadata$SeekTable;

    if-eqz v0, :cond_0

    .line 322
    new-instance v0, Landroidx/media3/extractor/FlacSeekTableSeekMap;

    iget-object v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    invoke-direct {v0, v1, p1, p2}, Landroidx/media3/extractor/FlacSeekTableSeekMap;-><init>(Landroidx/media3/extractor/FlacStreamMetadata;J)V

    return-object v0

    :cond_0
    const-wide/16 v0, -0x1

    cmp-long v2, p3, v0

    if-eqz v2, :cond_1

    .line 323
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    iget-wide v0, v0, Landroidx/media3/extractor/FlacStreamMetadata;->totalSamples:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    .line 324
    new-instance v0, Landroidx/media3/extractor/flac/FlacBinarySearchSeeker;

    iget-object v3, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    iget v4, p0, Landroidx/media3/extractor/flac/FlacExtractor;->frameStartMarker:I

    move-object v2, v0

    move-wide v5, p1

    move-wide v7, p3

    invoke-direct/range {v2 .. v8}, Landroidx/media3/extractor/flac/FlacBinarySearchSeeker;-><init>(Landroidx/media3/extractor/FlacStreamMetadata;IJJ)V

    iput-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->binarySearchSeeker:Landroidx/media3/extractor/flac/FlacBinarySearchSeeker;

    .line 327
    invoke-virtual {v0}, Landroidx/media3/extractor/flac/FlacBinarySearchSeeker;->getSeekMap()Landroidx/media3/extractor/SeekMap;

    move-result-object v0

    return-object v0

    .line 329
    :cond_1
    new-instance v0, Landroidx/media3/extractor/SeekMap$Unseekable;

    iget-object v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    invoke-virtual {v1}, Landroidx/media3/extractor/FlacStreamMetadata;->getDurationUs()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Landroidx/media3/extractor/SeekMap$Unseekable;-><init>(J)V

    return-object v0
.end method

.method private getStreamMarkerAndInfoBlockBytes(Landroidx/media3/extractor/ExtractorInput;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->streamMarkerAndInfoBlock:[B

    const/4 v1, 0x0

    array-length v2, v0

    invoke-interface {p1, v0, v1, v2}, Landroidx/media3/extractor/ExtractorInput;->peekFully([BII)V

    .line 212
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->resetPeekPosition()V

    const/4 p1, 0x2

    .line 213
    iput p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->state:I

    return-void
.end method

.method static synthetic lambda$static$0()[Landroidx/media3/extractor/Extractor;
    .locals 3

    const/4 v0, 0x1

    .line 58
    new-array v0, v0, [Landroidx/media3/extractor/Extractor;

    new-instance v1, Landroidx/media3/extractor/flac/FlacExtractor;

    invoke-direct {v1}, Landroidx/media3/extractor/flac/FlacExtractor;-><init>()V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    return-object v0
.end method

.method private outputSampleMetadata()V
    .locals 11

    .line 413
    iget-wide v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->currentFrameFirstSampleNumber:J

    const-wide/32 v2, 0xf4240

    mul-long v0, v0, v2

    iget-object v2, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    .line 416
    invoke-static {v2}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/extractor/FlacStreamMetadata;

    iget v2, v2, Landroidx/media3/extractor/FlacStreamMetadata;->sampleRate:I

    int-to-long v2, v2

    div-long v5, v0, v2

    .line 417
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->trackOutput:Landroidx/media3/extractor/TrackOutput;

    invoke-static {v0}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroidx/media3/extractor/TrackOutput;

    iget v8, p0, Landroidx/media3/extractor/flac/FlacExtractor;->currentFrameBytesWritten:I

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v7, 0x1

    .line 418
    invoke-interface/range {v4 .. v10}, Landroidx/media3/extractor/TrackOutput;->sampleMetadata(JIIILandroidx/media3/extractor/TrackOutput$CryptoData;)V

    return-void
.end method

.method private readFrames(Landroidx/media3/extractor/ExtractorInput;Landroidx/media3/extractor/PositionHolder;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 252
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->trackOutput:Landroidx/media3/extractor/TrackOutput;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->binarySearchSeeker:Landroidx/media3/extractor/flac/FlacBinarySearchSeeker;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/media3/extractor/flac/FlacBinarySearchSeeker;->isSeeking()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 257
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->binarySearchSeeker:Landroidx/media3/extractor/flac/FlacBinarySearchSeeker;

    invoke-virtual {v0, p1, p2}, Landroidx/media3/extractor/flac/FlacBinarySearchSeeker;->handlePendingSeek(Landroidx/media3/extractor/ExtractorInput;Landroidx/media3/extractor/PositionHolder;)I

    move-result p1

    return p1

    .line 261
    :cond_0
    iget-wide v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->currentFrameFirstSampleNumber:J

    const-wide/16 v2, -0x1

    const/4 p2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    .line 262
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    .line 263
    invoke-static {p1, v0}, Landroidx/media3/extractor/FlacFrameReader;->getFirstSampleNumber(Landroidx/media3/extractor/ExtractorInput;Landroidx/media3/extractor/FlacStreamMetadata;)J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->currentFrameFirstSampleNumber:J

    return p2

    .line 268
    :cond_1
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v0}, Landroidx/media3/common/util/ParsableByteArray;->limit()I

    move-result v0

    const v1, 0x8000

    if-ge v0, v1, :cond_4

    .line 271
    iget-object v4, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    .line 273
    invoke-virtual {v4}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object v4

    sub-int/2addr v1, v0

    .line 272
    invoke-interface {p1, v4, v0, v1}, Landroidx/media3/extractor/ExtractorInput;->read([BII)I

    move-result p1

    const/4 v1, -0x1

    if-ne p1, v1, :cond_2

    const/4 v4, 0x1

    goto :goto_0

    :cond_2
    const/4 v4, 0x0

    :goto_0
    if-nez v4, :cond_3

    .line 278
    iget-object v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    add-int/2addr v0, p1

    invoke-virtual {v1, v0}, Landroidx/media3/common/util/ParsableByteArray;->setLimit(I)V

    goto :goto_1

    .line 279
    :cond_3
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result p1

    if-nez p1, :cond_5

    .line 280
    invoke-direct {p0}, Landroidx/media3/extractor/flac/FlacExtractor;->outputSampleMetadata()V

    return v1

    :cond_4
    const/4 v4, 0x0

    .line 286
    :cond_5
    :goto_1
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result p1

    .line 289
    iget v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->currentFrameBytesWritten:I

    iget v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->minFrameSize:I

    if-ge v0, v1, :cond_6

    .line 290
    iget-object v5, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    sub-int/2addr v1, v0

    invoke-virtual {v5}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {v5, v0}, Landroidx/media3/common/util/ParsableByteArray;->skipBytes(I)V

    .line 293
    :cond_6
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-direct {p0, v0, v4}, Landroidx/media3/extractor/flac/FlacExtractor;->findFrame(Landroidx/media3/common/util/ParsableByteArray;Z)J

    move-result-wide v0

    .line 294
    iget-object v4, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v4}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result v4

    sub-int/2addr v4, p1

    .line 295
    iget-object v5, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v5, p1}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 296
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->trackOutput:Landroidx/media3/extractor/TrackOutput;

    iget-object v5, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-interface {p1, v5, v4}, Landroidx/media3/extractor/TrackOutput;->sampleData(Landroidx/media3/common/util/ParsableByteArray;I)V

    .line 297
    iget p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->currentFrameBytesWritten:I

    add-int/2addr p1, v4

    iput p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->currentFrameBytesWritten:I

    cmp-long p1, v0, v2

    if-eqz p1, :cond_7

    .line 301
    invoke-direct {p0}, Landroidx/media3/extractor/flac/FlacExtractor;->outputSampleMetadata()V

    .line 302
    iput p2, p0, Landroidx/media3/extractor/flac/FlacExtractor;->currentFrameBytesWritten:I

    .line 303
    iput-wide v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->currentFrameFirstSampleNumber:J

    .line 306
    :cond_7
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result p1

    const/16 v0, 0x10

    if-ge p1, v0, :cond_8

    .line 309
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result p1

    .line 310
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    .line 311
    invoke-virtual {v0}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object v0

    iget-object v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v1}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result v1

    iget-object v2, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v2}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object v2

    .line 310
    invoke-static {v0, v1, v2, p2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 312
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v0, p2}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 313
    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v0, p1}, Landroidx/media3/common/util/ParsableByteArray;->setLimit(I)V

    :cond_8
    return p2
.end method

.method private readId3Metadata(Landroidx/media3/extractor/ExtractorInput;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 206
    iget-boolean v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->id3MetadataDisabled:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-static {p1, v0}, Landroidx/media3/extractor/FlacMetadataReader;->readId3Metadata(Landroidx/media3/extractor/ExtractorInput;Z)Landroidx/media3/common/Metadata;

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->id3Metadata:Landroidx/media3/common/Metadata;

    .line 207
    iput v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->state:I

    return-void
.end method

.method private readMetadataBlocks(Landroidx/media3/extractor/ExtractorInput;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 223
    new-instance v0, Landroidx/media3/extractor/FlacMetadataReader$FlacStreamMetadataHolder;

    iget-object v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    invoke-direct {v0, v1}, Landroidx/media3/extractor/FlacMetadataReader$FlacStreamMetadataHolder;-><init>(Landroidx/media3/extractor/FlacStreamMetadata;)V

    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_0

    .line 226
    invoke-static {p1, v0}, Landroidx/media3/extractor/FlacMetadataReader;->readMetadataBlock(Landroidx/media3/extractor/ExtractorInput;Landroidx/media3/extractor/FlacMetadataReader$FlacStreamMetadataHolder;)Z

    move-result v1

    .line 228
    iget-object v2, v0, Landroidx/media3/extractor/FlacMetadataReader$FlacStreamMetadataHolder;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    invoke-static {v2}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/media3/extractor/FlacStreamMetadata;

    iput-object v2, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    goto :goto_0

    .line 231
    :cond_0
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    invoke-static {p1}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    iget p1, p1, Landroidx/media3/extractor/FlacStreamMetadata;->minFrameSize:I

    const/4 v0, 0x6

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->minFrameSize:I

    .line 233
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->trackOutput:Landroidx/media3/extractor/TrackOutput;

    invoke-static {p1}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/media3/extractor/TrackOutput;

    iget-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->flacStreamMetadata:Landroidx/media3/extractor/FlacStreamMetadata;

    iget-object v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->streamMarkerAndInfoBlock:[B

    iget-object v2, p0, Landroidx/media3/extractor/flac/FlacExtractor;->id3Metadata:Landroidx/media3/common/Metadata;

    .line 234
    invoke-virtual {v0, v1, v2}, Landroidx/media3/extractor/FlacStreamMetadata;->getFormat([BLandroidx/media3/common/Metadata;)Landroidx/media3/common/Format;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/media3/extractor/TrackOutput;->format(Landroidx/media3/common/Format;)V

    const/4 p1, 0x4

    .line 236
    iput p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->state:I

    return-void
.end method

.method private readStreamMarker(Landroidx/media3/extractor/ExtractorInput;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 217
    invoke-static {p1}, Landroidx/media3/extractor/FlacMetadataReader;->readStreamMarker(Landroidx/media3/extractor/ExtractorInput;)V

    const/4 p1, 0x3

    .line 218
    iput p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->state:I

    return-void
.end method


# virtual methods
.method public synthetic getSniffFailureDetails()Ljava/util/List;
    .locals 1

    invoke-static {p0}, Landroidx/media3/extractor/Extractor$-CC;->$default$getSniffFailureDetails(Landroidx/media3/extractor/Extractor;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public synthetic getUnderlyingImplementation()Landroidx/media3/extractor/Extractor;
    .locals 1

    invoke-static {p0}, Landroidx/media3/extractor/Extractor$-CC;->$default$getUnderlyingImplementation(Landroidx/media3/extractor/Extractor;)Landroidx/media3/extractor/Extractor;

    move-result-object v0

    return-object v0
.end method

.method public init(Landroidx/media3/extractor/ExtractorOutput;)V
    .locals 2

    .line 155
    iput-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->extractorOutput:Landroidx/media3/extractor/ExtractorOutput;

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 156
    invoke-interface {p1, v0, v1}, Landroidx/media3/extractor/ExtractorOutput;->track(II)Landroidx/media3/extractor/TrackOutput;

    move-result-object v0

    iput-object v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->trackOutput:Landroidx/media3/extractor/TrackOutput;

    .line 157
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorOutput;->endTracks()V

    return-void
.end method

.method public read(Landroidx/media3/extractor/ExtractorInput;Landroidx/media3/extractor/PositionHolder;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 163
    iget v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->state:I

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    const/4 v2, 0x1

    if-eq v0, v2, :cond_4

    const/4 v2, 0x2

    if-eq v0, v2, :cond_3

    const/4 v2, 0x3

    if-eq v0, v2, :cond_2

    const/4 v2, 0x4

    if-eq v0, v2, :cond_1

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    .line 180
    invoke-direct {p0, p1, p2}, Landroidx/media3/extractor/flac/FlacExtractor;->readFrames(Landroidx/media3/extractor/ExtractorInput;Landroidx/media3/extractor/PositionHolder;)I

    move-result p1

    return p1

    .line 182
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1

    .line 177
    :cond_1
    invoke-direct {p0, p1}, Landroidx/media3/extractor/flac/FlacExtractor;->getFrameStartMarker(Landroidx/media3/extractor/ExtractorInput;)V

    return v1

    .line 174
    :cond_2
    invoke-direct {p0, p1}, Landroidx/media3/extractor/flac/FlacExtractor;->readMetadataBlocks(Landroidx/media3/extractor/ExtractorInput;)V

    return v1

    .line 171
    :cond_3
    invoke-direct {p0, p1}, Landroidx/media3/extractor/flac/FlacExtractor;->readStreamMarker(Landroidx/media3/extractor/ExtractorInput;)V

    return v1

    .line 168
    :cond_4
    invoke-direct {p0, p1}, Landroidx/media3/extractor/flac/FlacExtractor;->getStreamMarkerAndInfoBlockBytes(Landroidx/media3/extractor/ExtractorInput;)V

    return v1

    .line 165
    :cond_5
    invoke-direct {p0, p1}, Landroidx/media3/extractor/flac/FlacExtractor;->readId3Metadata(Landroidx/media3/extractor/ExtractorInput;)V

    return v1
.end method

.method public release()V
    .locals 0

    return-void
.end method

.method public seek(JJ)V
    .locals 4

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-nez v3, :cond_0

    .line 189
    iput v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->state:I

    goto :goto_0

    .line 190
    :cond_0
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->binarySearchSeeker:Landroidx/media3/extractor/flac/FlacBinarySearchSeeker;

    if-eqz p1, :cond_1

    .line 191
    invoke-virtual {p1, p3, p4}, Landroidx/media3/extractor/flac/FlacBinarySearchSeeker;->setSeekTargetUs(J)V

    :cond_1
    :goto_0
    cmp-long p1, p3, v1

    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    const-wide/16 v1, -0x1

    .line 193
    :goto_1
    iput-wide v1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->currentFrameFirstSampleNumber:J

    .line 194
    iput v0, p0, Landroidx/media3/extractor/flac/FlacExtractor;->currentFrameBytesWritten:I

    .line 195
    iget-object p1, p0, Landroidx/media3/extractor/flac/FlacExtractor;->buffer:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p1, v0}, Landroidx/media3/common/util/ParsableByteArray;->reset(I)V

    return-void
.end method

.method public sniff(Landroidx/media3/extractor/ExtractorInput;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 149
    invoke-static {p1, v0}, Landroidx/media3/extractor/FlacMetadataReader;->peekId3Metadata(Landroidx/media3/extractor/ExtractorInput;Z)Landroidx/media3/common/Metadata;

    .line 150
    invoke-static {p1}, Landroidx/media3/extractor/FlacMetadataReader;->checkAndPeekStreamMarker(Landroidx/media3/extractor/ExtractorInput;)Z

    move-result p1

    return p1
.end method
