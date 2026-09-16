.class public final Landroidx/media3/extractor/avi/AviExtractor;
.super Ljava/lang/Object;
.source "AviExtractor.java"

# interfaces
.implements Landroidx/media3/extractor/Extractor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;,
        Landroidx/media3/extractor/avi/AviExtractor$AviSeekMap;,
        Landroidx/media3/extractor/avi/AviExtractor$Flags;
    }
.end annotation


# static fields
.field private static final AVIIF_KEYFRAME:I = 0x10

.field public static final FLAG_EMIT_RAW_SUBTITLE_DATA:I = 0x1

.field public static final FOURCC_AVI_:I = 0x20495641

.field public static final FOURCC_JUNK:I = 0x4b4e554a

.field public static final FOURCC_LIST:I = 0x5453494c

.field public static final FOURCC_RIFF:I = 0x46464952

.field public static final FOURCC_auds:I = 0x73647561

.field public static final FOURCC_avih:I = 0x68697661

.field public static final FOURCC_hdrl:I = 0x6c726468

.field public static final FOURCC_idx1:I = 0x31786469

.field public static final FOURCC_movi:I = 0x69766f6d

.field public static final FOURCC_strf:I = 0x66727473

.field public static final FOURCC_strh:I = 0x68727473

.field public static final FOURCC_strl:I = 0x6c727473

.field public static final FOURCC_strn:I = 0x6e727473

.field public static final FOURCC_txts:I = 0x73747874

.field public static final FOURCC_vids:I = 0x73646976

.field private static final RELOAD_MINIMUM_SEEK_DISTANCE:J = 0x40000L

.field private static final STATE_FINDING_IDX1_HEADER:I = 0x4

.field private static final STATE_FINDING_MOVI_HEADER:I = 0x3

.field private static final STATE_READING_HDRL_BODY:I = 0x2

.field private static final STATE_READING_HDRL_HEADER:I = 0x1

.field private static final STATE_READING_IDX1_BODY:I = 0x5

.field private static final STATE_READING_SAMPLES:I = 0x6

.field private static final STATE_SKIPPING_TO_HDRL:I = 0x0

.field private static final TAG:Ljava/lang/String; = "AviExtractor"


# instance fields
.field private aviHeader:Landroidx/media3/extractor/avi/AviMainHeaderChunk;

.field private final chunkHeaderHolder:Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

.field private chunkReaders:[Landroidx/media3/extractor/avi/ChunkReader;

.field private currentChunkReader:Landroidx/media3/extractor/avi/ChunkReader;

.field private durationUs:J

.field private extractorOutput:Landroidx/media3/extractor/ExtractorOutput;

.field private hdrlSize:I

.field private idx1BodySize:I

.field private moviEnd:J

.field private moviStart:J

.field private final parseSubtitlesDuringExtraction:Z

.field private pendingReposition:J

.field private final scratch:Landroidx/media3/common/util/ParsableByteArray;

.field private seekMapHasBeenOutput:Z

.field private state:I

.field private final subtitleParserFactory:Landroidx/media3/extractor/text/SubtitleParser$Factory;


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    .line 169
    sget-object v1, Landroidx/media3/extractor/text/SubtitleParser$Factory;->UNSUPPORTED:Landroidx/media3/extractor/text/SubtitleParser$Factory;

    invoke-direct {p0, v0, v1}, Landroidx/media3/extractor/avi/AviExtractor;-><init>(ILandroidx/media3/extractor/text/SubtitleParser$Factory;)V

    return-void
.end method

.method public constructor <init>(ILandroidx/media3/extractor/text/SubtitleParser$Factory;)V
    .locals 1

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    iput-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->subtitleParserFactory:Landroidx/media3/extractor/text/SubtitleParser$Factory;

    const/4 p2, 0x1

    and-int/2addr p1, p2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 181
    :goto_0
    iput-boolean p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->parseSubtitlesDuringExtraction:Z

    .line 182
    new-instance p1, Landroidx/media3/common/util/ParsableByteArray;

    const/16 p2, 0xc

    invoke-direct {p1, p2}, Landroidx/media3/common/util/ParsableByteArray;-><init>(I)V

    iput-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    .line 183
    new-instance p1, Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;-><init>(Landroidx/media3/extractor/avi/AviExtractor$1;)V

    iput-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkHeaderHolder:Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

    .line 184
    new-instance p1, Landroidx/media3/extractor/NoOpExtractorOutput;

    invoke-direct {p1}, Landroidx/media3/extractor/NoOpExtractorOutput;-><init>()V

    iput-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->extractorOutput:Landroidx/media3/extractor/ExtractorOutput;

    .line 185
    new-array p1, v0, [Landroidx/media3/extractor/avi/ChunkReader;

    iput-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkReaders:[Landroidx/media3/extractor/avi/ChunkReader;

    const-wide/16 p1, -0x1

    .line 186
    iput-wide p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->moviStart:J

    .line 187
    iput-wide p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->moviEnd:J

    const/4 p1, -0x1

    .line 188
    iput p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->hdrlSize:I

    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 189
    iput-wide p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->durationUs:J

    return-void
.end method

.method static synthetic access$100(Landroidx/media3/extractor/avi/AviExtractor;)[Landroidx/media3/extractor/avi/ChunkReader;
    .locals 0

    .line 53
    iget-object p0, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkReaders:[Landroidx/media3/extractor/avi/ChunkReader;

    return-object p0
.end method

.method private static alignInputToEvenPosition(Landroidx/media3/extractor/ExtractorInput;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 541
    invoke-interface {p0}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    and-long/2addr v0, v2

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    .line 542
    invoke-interface {p0, v0}, Landroidx/media3/extractor/ExtractorInput;->skipFully(I)V

    :cond_0
    return-void
.end method

.method private getChunkReader(I)Landroidx/media3/extractor/avi/ChunkReader;
    .locals 5

    .line 448
    iget-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkReaders:[Landroidx/media3/extractor/avi/ChunkReader;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 449
    invoke-virtual {v3, p1}, Landroidx/media3/extractor/avi/ChunkReader;->handlesChunkId(I)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private parseHdrlBody(Landroidx/media3/common/util/ParsableByteArray;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const v0, 0x6c726468

    .line 370
    invoke-static {v0, p1}, Landroidx/media3/extractor/avi/ListChunk;->parseFrom(ILandroidx/media3/common/util/ParsableByteArray;)Landroidx/media3/extractor/avi/ListChunk;

    move-result-object p1

    .line 371
    invoke-virtual {p1}, Landroidx/media3/extractor/avi/ListChunk;->getType()I

    move-result v1

    const/4 v2, 0x0

    if-ne v1, v0, :cond_4

    .line 375
    const-class v0, Landroidx/media3/extractor/avi/AviMainHeaderChunk;

    invoke-virtual {p1, v0}, Landroidx/media3/extractor/avi/ListChunk;->getChild(Ljava/lang/Class;)Landroidx/media3/extractor/avi/AviChunk;

    move-result-object v0

    check-cast v0, Landroidx/media3/extractor/avi/AviMainHeaderChunk;

    if-eqz v0, :cond_3

    .line 380
    iput-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->aviHeader:Landroidx/media3/extractor/avi/AviMainHeaderChunk;

    .line 382
    iget v1, v0, Landroidx/media3/extractor/avi/AviMainHeaderChunk;->totalFrames:I

    int-to-long v1, v1

    iget v0, v0, Landroidx/media3/extractor/avi/AviMainHeaderChunk;->frameDurationUs:I

    int-to-long v3, v0

    mul-long v1, v1, v3

    iput-wide v1, p0, Landroidx/media3/extractor/avi/AviExtractor;->durationUs:J

    .line 383
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 385
    iget-object p1, p1, Landroidx/media3/extractor/avi/ListChunk;->children:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p1}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/media3/extractor/avi/AviChunk;

    .line 386
    invoke-interface {v3}, Landroidx/media3/extractor/avi/AviChunk;->getType()I

    move-result v4

    const v5, 0x6c727473

    if-ne v4, v5, :cond_0

    .line 387
    check-cast v3, Landroidx/media3/extractor/avi/ListChunk;

    add-int/lit8 v4, v2, 0x1

    .line 391
    invoke-direct {p0, v3, v2}, Landroidx/media3/extractor/avi/AviExtractor;->processStreamList(Landroidx/media3/extractor/avi/ListChunk;I)Landroidx/media3/extractor/avi/ChunkReader;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 393
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    move v2, v4

    goto :goto_0

    .line 397
    :cond_2
    new-array p1, v1, [Landroidx/media3/extractor/avi/ChunkReader;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroidx/media3/extractor/avi/ChunkReader;

    iput-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkReaders:[Landroidx/media3/extractor/avi/ChunkReader;

    .line 398
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->extractorOutput:Landroidx/media3/extractor/ExtractorOutput;

    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorOutput;->endTracks()V

    return-void

    .line 377
    :cond_3
    const-string p1, "AviHeader not found"

    invoke-static {p1, v2}, Landroidx/media3/common/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Landroidx/media3/common/ParserException;

    move-result-object p1

    throw p1

    .line 372
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unexpected header list type "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 373
    invoke-virtual {p1}, Landroidx/media3/extractor/avi/ListChunk;->getType()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 372
    invoke-static {p1, v2}, Landroidx/media3/common/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Landroidx/media3/common/ParserException;

    move-result-object p1

    throw p1
.end method

.method private parseIdx1Body(Landroidx/media3/common/util/ParsableByteArray;)V
    .locals 7

    .line 403
    invoke-direct {p0, p1}, Landroidx/media3/extractor/avi/AviExtractor;->peekSeekOffset(Landroidx/media3/common/util/ParsableByteArray;)J

    move-result-wide v0

    .line 404
    :goto_0
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result v2

    const/16 v3, 0x10

    if-lt v2, v3, :cond_2

    .line 405
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result v2

    .line 406
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result v4

    .line 407
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v5, v0

    .line 408
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    .line 409
    invoke-direct {p0, v2}, Landroidx/media3/extractor/avi/AviExtractor;->getChunkReader(I)Landroidx/media3/extractor/avi/ChunkReader;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    and-int/2addr v4, v3

    if-ne v4, v3, :cond_1

    .line 415
    invoke-virtual {v2, v5, v6}, Landroidx/media3/extractor/avi/ChunkReader;->appendKeyFrameToIndex(J)V

    .line 417
    :cond_1
    invoke-virtual {v2}, Landroidx/media3/extractor/avi/ChunkReader;->incrementIndexChunkCount()V

    goto :goto_0

    .line 419
    :cond_2
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkReaders:[Landroidx/media3/extractor/avi/ChunkReader;

    array-length v0, p1

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_3

    aget-object v2, p1, v1

    .line 420
    invoke-virtual {v2}, Landroidx/media3/extractor/avi/ChunkReader;->compactIndex()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    const/4 p1, 0x1

    .line 422
    iput-boolean p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->seekMapHasBeenOutput:Z

    .line 423
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->extractorOutput:Landroidx/media3/extractor/ExtractorOutput;

    new-instance v0, Landroidx/media3/extractor/avi/AviExtractor$AviSeekMap;

    iget-wide v1, p0, Landroidx/media3/extractor/avi/AviExtractor;->durationUs:J

    invoke-direct {v0, p0, v1, v2}, Landroidx/media3/extractor/avi/AviExtractor$AviSeekMap;-><init>(Landroidx/media3/extractor/avi/AviExtractor;J)V

    invoke-interface {p1, v0}, Landroidx/media3/extractor/ExtractorOutput;->seekMap(Landroidx/media3/extractor/SeekMap;)V

    return-void
.end method

.method private peekSeekOffset(Landroidx/media3/common/util/ParsableByteArray;)J
    .locals 8

    .line 431
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result v0

    const/16 v1, 0x10

    const-wide/16 v2, 0x0

    if-ge v0, v1, :cond_0

    return-wide v2

    .line 435
    :cond_0
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->getPosition()I

    move-result v0

    const/16 v1, 0x8

    .line 436
    invoke-virtual {p1, v1}, Landroidx/media3/common/util/ParsableByteArray;->skipBytes(I)V

    .line 437
    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result v1

    int-to-long v4, v1

    .line 441
    iget-wide v6, p0, Landroidx/media3/extractor/avi/AviExtractor;->moviStart:J

    cmp-long v1, v4, v6

    if-lez v1, :cond_1

    goto :goto_0

    :cond_1
    const-wide/16 v1, 0x8

    add-long v2, v6, v1

    .line 442
    :goto_0
    invoke-virtual {p1, v0}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    return-wide v2
.end method

.method private processStreamList(Landroidx/media3/extractor/avi/ListChunk;I)Landroidx/media3/extractor/avi/ChunkReader;
    .locals 13

    .line 497
    const-class v0, Landroidx/media3/extractor/avi/AviStreamHeaderChunk;

    invoke-virtual {p1, v0}, Landroidx/media3/extractor/avi/ListChunk;->getChild(Ljava/lang/Class;)Landroidx/media3/extractor/avi/AviChunk;

    move-result-object v0

    check-cast v0, Landroidx/media3/extractor/avi/AviStreamHeaderChunk;

    .line 498
    const-class v1, Landroidx/media3/extractor/avi/StreamFormatChunk;

    invoke-virtual {p1, v1}, Landroidx/media3/extractor/avi/ListChunk;->getChild(Ljava/lang/Class;)Landroidx/media3/extractor/avi/AviChunk;

    move-result-object v1

    check-cast v1, Landroidx/media3/extractor/avi/StreamFormatChunk;

    .line 499
    const-string v2, "AviExtractor"

    const/4 v3, 0x0

    if-nez v0, :cond_0

    .line 500
    const-string p1, "Missing Stream Header"

    invoke-static {v2, p1}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :cond_0
    if-nez v1, :cond_1

    .line 504
    const-string p1, "Missing Stream Format"

    invoke-static {v2, p1}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    .line 507
    :cond_1
    invoke-virtual {v0}, Landroidx/media3/extractor/avi/AviStreamHeaderChunk;->getDurationUs()J

    move-result-wide v11

    .line 508
    iget-object v1, v1, Landroidx/media3/extractor/avi/StreamFormatChunk;->format:Landroidx/media3/common/Format;

    .line 509
    invoke-virtual {v1}, Landroidx/media3/common/Format;->buildUpon()Landroidx/media3/common/Format$Builder;

    move-result-object v2

    .line 510
    invoke-virtual {v2, p2}, Landroidx/media3/common/Format$Builder;->setId(I)Landroidx/media3/common/Format$Builder;

    .line 511
    iget v4, v0, Landroidx/media3/extractor/avi/AviStreamHeaderChunk;->suggestedBufferSize:I

    if-eqz v4, :cond_2

    .line 513
    invoke-virtual {v2, v4}, Landroidx/media3/common/Format$Builder;->setMaxInputSize(I)Landroidx/media3/common/Format$Builder;

    .line 515
    :cond_2
    const-class v4, Landroidx/media3/extractor/avi/StreamNameChunk;

    invoke-virtual {p1, v4}, Landroidx/media3/extractor/avi/ListChunk;->getChild(Ljava/lang/Class;)Landroidx/media3/extractor/avi/AviChunk;

    move-result-object p1

    check-cast p1, Landroidx/media3/extractor/avi/StreamNameChunk;

    if-eqz p1, :cond_3

    .line 517
    iget-object p1, p1, Landroidx/media3/extractor/avi/StreamNameChunk;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Landroidx/media3/common/Format$Builder;->setLabel(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;

    .line 519
    :cond_3
    iget-object p1, v1, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-static {p1}, Landroidx/media3/common/MimeTypes;->getTrackType(Ljava/lang/String;)I

    move-result v6

    const/4 p1, 0x1

    if-eq v6, p1, :cond_5

    const/4 p1, 0x2

    if-ne v6, p1, :cond_4

    goto :goto_0

    :cond_4
    return-object v3

    .line 521
    :cond_5
    :goto_0
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->extractorOutput:Landroidx/media3/extractor/ExtractorOutput;

    invoke-interface {p1, p2, v6}, Landroidx/media3/extractor/ExtractorOutput;->track(II)Landroidx/media3/extractor/TrackOutput;

    move-result-object v10

    .line 522
    invoke-virtual {v2}, Landroidx/media3/common/Format$Builder;->build()Landroidx/media3/common/Format;

    move-result-object p1

    invoke-interface {v10, p1}, Landroidx/media3/extractor/TrackOutput;->format(Landroidx/media3/common/Format;)V

    .line 523
    new-instance p1, Landroidx/media3/extractor/avi/ChunkReader;

    iget v9, v0, Landroidx/media3/extractor/avi/AviStreamHeaderChunk;->length:I

    move-object v4, p1

    move v5, p2

    move-wide v7, v11

    invoke-direct/range {v4 .. v10}, Landroidx/media3/extractor/avi/ChunkReader;-><init>(IIJILandroidx/media3/extractor/TrackOutput;)V

    .line 526
    iput-wide v11, p0, Landroidx/media3/extractor/avi/AviExtractor;->durationUs:J

    return-object p1
.end method

.method private readMoviChunks(Landroidx/media3/extractor/ExtractorInput;)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 457
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide v0

    iget-wide v2, p0, Landroidx/media3/extractor/avi/AviExtractor;->moviEnd:J

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    const/4 p1, -0x1

    return p1

    .line 459
    :cond_0
    iget-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->currentChunkReader:Landroidx/media3/extractor/avi/ChunkReader;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 460
    invoke-virtual {v0, p1}, Landroidx/media3/extractor/avi/ChunkReader;->onChunkData(Landroidx/media3/extractor/ExtractorInput;)Z

    move-result p1

    if-eqz p1, :cond_6

    const/4 p1, 0x0

    .line 461
    iput-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->currentChunkReader:Landroidx/media3/extractor/avi/ChunkReader;

    goto :goto_1

    .line 464
    :cond_1
    invoke-static {p1}, Landroidx/media3/extractor/avi/AviExtractor;->alignInputToEvenPosition(Landroidx/media3/extractor/ExtractorInput;)V

    .line 465
    iget-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v0}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object v0

    const/16 v2, 0xc

    invoke-interface {p1, v0, v1, v2}, Landroidx/media3/extractor/ExtractorInput;->peekFully([BII)V

    .line 466
    iget-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v0, v1}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 467
    iget-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v0}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result v0

    const v3, 0x5453494c

    const/16 v4, 0x8

    if-ne v0, v3, :cond_3

    .line 469
    iget-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v0, v4}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 470
    iget-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v0}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result v0

    const v3, 0x69766f6d

    if-ne v0, v3, :cond_2

    goto :goto_0

    :cond_2
    const/16 v2, 0x8

    .line 471
    :goto_0
    invoke-interface {p1, v2}, Landroidx/media3/extractor/ExtractorInput;->skipFully(I)V

    .line 472
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->resetPeekPosition()V

    return v1

    .line 475
    :cond_3
    iget-object v2, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v2}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result v2

    const v3, 0x4b4e554a    # 1.352225E7f

    if-ne v0, v3, :cond_4

    .line 477
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide v3

    int-to-long v5, v2

    add-long/2addr v3, v5

    const-wide/16 v5, 0x8

    add-long/2addr v3, v5

    iput-wide v3, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    return v1

    .line 480
    :cond_4
    invoke-interface {p1, v4}, Landroidx/media3/extractor/ExtractorInput;->skipFully(I)V

    .line 481
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->resetPeekPosition()V

    .line 482
    invoke-direct {p0, v0}, Landroidx/media3/extractor/avi/AviExtractor;->getChunkReader(I)Landroidx/media3/extractor/avi/ChunkReader;

    move-result-object v0

    if-nez v0, :cond_5

    .line 485
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide v3

    int-to-long v5, v2

    add-long/2addr v3, v5

    iput-wide v3, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    return v1

    .line 488
    :cond_5
    invoke-virtual {v0, v2}, Landroidx/media3/extractor/avi/ChunkReader;->onChunkStart(I)V

    .line 489
    iput-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->currentChunkReader:Landroidx/media3/extractor/avi/ChunkReader;

    :cond_6
    :goto_1
    return v1
.end method

.method private resolvePendingReposition(Landroidx/media3/extractor/ExtractorInput;Landroidx/media3/extractor/PositionHolder;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 353
    iget-wide v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_2

    .line 354
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide v0

    .line 355
    iget-wide v4, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    cmp-long v6, v4, v0

    if-ltz v6, :cond_1

    const-wide/32 v6, 0x40000

    add-long/2addr v6, v0

    cmp-long v8, v4, v6

    if-lez v8, :cond_0

    goto :goto_0

    :cond_0
    sub-long/2addr v4, v0

    long-to-int p2, v4

    .line 362
    invoke-interface {p1, p2}, Landroidx/media3/extractor/ExtractorInput;->skipFully(I)V

    goto :goto_1

    .line 357
    :cond_1
    :goto_0
    iput-wide v4, p2, Landroidx/media3/extractor/PositionHolder;->position:J

    const/4 p1, 0x1

    goto :goto_2

    :cond_2
    :goto_1
    const/4 p1, 0x0

    .line 365
    :goto_2
    iput-wide v2, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    return p1
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

    const/4 v0, 0x0

    .line 196
    iput v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    .line 198
    iget-boolean v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->parseSubtitlesDuringExtraction:Z

    if-eqz v0, :cond_0

    .line 199
    new-instance v0, Landroidx/media3/extractor/text/SubtitleTranscodingExtractorOutput;

    iget-object v1, p0, Landroidx/media3/extractor/avi/AviExtractor;->subtitleParserFactory:Landroidx/media3/extractor/text/SubtitleParser$Factory;

    invoke-direct {v0, p1, v1}, Landroidx/media3/extractor/text/SubtitleTranscodingExtractorOutput;-><init>(Landroidx/media3/extractor/ExtractorOutput;Landroidx/media3/extractor/text/SubtitleParser$Factory;)V

    move-object p1, v0

    .line 200
    :cond_0
    iput-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->extractorOutput:Landroidx/media3/extractor/ExtractorOutput;

    const-wide/16 v0, -0x1

    .line 201
    iput-wide v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    return-void
.end method

.method public read(Landroidx/media3/extractor/ExtractorInput;Landroidx/media3/extractor/PositionHolder;)I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 217
    invoke-direct {p0, p1, p2}, Landroidx/media3/extractor/avi/AviExtractor;->resolvePendingReposition(Landroidx/media3/extractor/ExtractorInput;Landroidx/media3/extractor/PositionHolder;)Z

    move-result p2

    const/4 v0, 0x1

    if-eqz p2, :cond_0

    return v0

    .line 220
    :cond_0
    iget p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    const/4 v1, 0x0

    const/4 v2, 0x6

    const/4 v3, 0x4

    const/16 v4, 0xc

    const/4 v5, 0x0

    packed-switch p2, :pswitch_data_0

    .line 314
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1}, Ljava/lang/AssertionError;-><init>()V

    throw p1

    .line 312
    :pswitch_0
    invoke-direct {p0, p1}, Landroidx/media3/extractor/avi/AviExtractor;->readMoviChunks(Landroidx/media3/extractor/ExtractorInput;)I

    move-result p1

    return p1

    .line 305
    :pswitch_1
    new-instance p2, Landroidx/media3/common/util/ParsableByteArray;

    iget v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->idx1BodySize:I

    invoke-direct {p2, v0}, Landroidx/media3/common/util/ParsableByteArray;-><init>(I)V

    .line 306
    invoke-virtual {p2}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object v0

    iget v1, p0, Landroidx/media3/extractor/avi/AviExtractor;->idx1BodySize:I

    invoke-interface {p1, v0, v5, v1}, Landroidx/media3/extractor/ExtractorInput;->readFully([BII)V

    .line 307
    invoke-direct {p0, p2}, Landroidx/media3/extractor/avi/AviExtractor;->parseIdx1Body(Landroidx/media3/common/util/ParsableByteArray;)V

    .line 308
    iput v2, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    .line 309
    iget-wide p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->moviStart:J

    iput-wide p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    return v5

    .line 292
    :pswitch_2
    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p2}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object p2

    const/16 v0, 0x8

    invoke-interface {p1, p2, v5, v0}, Landroidx/media3/extractor/ExtractorInput;->readFully([BII)V

    .line 293
    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p2, v5}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 294
    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p2}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result p2

    .line 295
    iget-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v0}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result v0

    const v1, 0x31786469

    if-ne p2, v1, :cond_1

    const/4 p1, 0x5

    .line 297
    iput p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    .line 298
    iput v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->idx1BodySize:I

    goto :goto_0

    .line 301
    :cond_1
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide p1

    int-to-long v0, v0

    add-long/2addr p1, v0

    iput-wide p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    :goto_0
    return v5

    .line 253
    :pswitch_3
    iget-wide v6, p0, Landroidx/media3/extractor/avi/AviExtractor;->moviStart:J

    const-wide/16 v8, -0x1

    cmp-long p2, v6, v8

    if-eqz p2, :cond_2

    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide v6

    iget-wide v8, p0, Landroidx/media3/extractor/avi/AviExtractor;->moviStart:J

    cmp-long p2, v6, v8

    if-eqz p2, :cond_2

    .line 254
    iput-wide v8, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    return v5

    .line 257
    :cond_2
    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p2}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object p2

    invoke-interface {p1, p2, v5, v4}, Landroidx/media3/extractor/ExtractorInput;->peekFully([BII)V

    .line 258
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->resetPeekPosition()V

    .line 259
    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p2, v5}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 260
    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkHeaderHolder:Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

    iget-object v1, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p2, v1}, Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;->populateFrom(Landroidx/media3/common/util/ParsableByteArray;)V

    .line 261
    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p2}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result p2

    .line 262
    iget-object v1, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkHeaderHolder:Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

    iget v1, v1, Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;->chunkType:I

    const v6, 0x46464952

    if-ne v1, v6, :cond_3

    .line 265
    invoke-interface {p1, v4}, Landroidx/media3/extractor/ExtractorInput;->skipFully(I)V

    return v5

    .line 268
    :cond_3
    iget-object v1, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkHeaderHolder:Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

    iget v1, v1, Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;->chunkType:I

    const v4, 0x5453494c

    const-wide/16 v6, 0x8

    if-ne v1, v4, :cond_7

    const v1, 0x69766f6d

    if-eq p2, v1, :cond_4

    goto :goto_1

    .line 273
    :cond_4
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide v8

    iput-wide v8, p0, Landroidx/media3/extractor/avi/AviExtractor;->moviStart:J

    .line 275
    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkHeaderHolder:Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

    iget p2, p2, Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;->size:I

    int-to-long v10, p2

    add-long/2addr v8, v10

    add-long/2addr v8, v6

    iput-wide v8, p0, Landroidx/media3/extractor/avi/AviExtractor;->moviEnd:J

    .line 276
    iget-boolean p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->seekMapHasBeenOutput:Z

    if-nez p2, :cond_6

    .line 277
    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->aviHeader:Landroidx/media3/extractor/avi/AviMainHeaderChunk;

    invoke-static {p2}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroidx/media3/extractor/avi/AviMainHeaderChunk;

    invoke-virtual {p2}, Landroidx/media3/extractor/avi/AviMainHeaderChunk;->hasIndex()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 278
    iput v3, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    .line 279
    iget-wide p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->moviEnd:J

    iput-wide p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    return v5

    .line 282
    :cond_5
    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->extractorOutput:Landroidx/media3/extractor/ExtractorOutput;

    new-instance v1, Landroidx/media3/extractor/SeekMap$Unseekable;

    iget-wide v3, p0, Landroidx/media3/extractor/avi/AviExtractor;->durationUs:J

    invoke-direct {v1, v3, v4}, Landroidx/media3/extractor/SeekMap$Unseekable;-><init>(J)V

    invoke-interface {p2, v1}, Landroidx/media3/extractor/ExtractorOutput;->seekMap(Landroidx/media3/extractor/SeekMap;)V

    .line 283
    iput-boolean v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->seekMapHasBeenOutput:Z

    .line 288
    :cond_6
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide p1

    const-wide/16 v0, 0xc

    add-long/2addr p1, v0

    iput-wide p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    .line 289
    iput v2, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    return v5

    .line 270
    :cond_7
    :goto_1
    invoke-interface {p1}, Landroidx/media3/extractor/ExtractorInput;->getPosition()J

    move-result-wide p1

    iget-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkHeaderHolder:Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

    iget v0, v0, Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;->size:I

    int-to-long v0, v0

    add-long/2addr p1, v0

    add-long/2addr p1, v6

    iput-wide p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    return v5

    .line 246
    :pswitch_4
    iget p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->hdrlSize:I

    sub-int/2addr p2, v3

    .line 247
    new-instance v0, Landroidx/media3/common/util/ParsableByteArray;

    invoke-direct {v0, p2}, Landroidx/media3/common/util/ParsableByteArray;-><init>(I)V

    .line 248
    invoke-virtual {v0}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object v1

    invoke-interface {p1, v1, v5, p2}, Landroidx/media3/extractor/ExtractorInput;->readFully([BII)V

    .line 249
    invoke-direct {p0, v0}, Landroidx/media3/extractor/avi/AviExtractor;->parseHdrlBody(Landroidx/media3/common/util/ParsableByteArray;)V

    const/4 p1, 0x3

    .line 250
    iput p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    return v5

    .line 233
    :pswitch_5
    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p2}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object p2

    invoke-interface {p1, p2, v5, v4}, Landroidx/media3/extractor/ExtractorInput;->readFully([BII)V

    .line 234
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p1, v5}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 235
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkHeaderHolder:Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p1, p2}, Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;->populateWithListHeaderFrom(Landroidx/media3/common/util/ParsableByteArray;)V

    .line 236
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkHeaderHolder:Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

    iget p1, p1, Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;->listType:I

    const p2, 0x6c726468

    if-ne p1, p2, :cond_8

    .line 241
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkHeaderHolder:Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

    iget p1, p1, Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;->size:I

    iput p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->hdrlSize:I

    const/4 p1, 0x2

    .line 242
    iput p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    return v5

    .line 237
    :cond_8
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "hdrl expected, found: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkHeaderHolder:Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;

    iget p2, p2, Landroidx/media3/extractor/avi/AviExtractor$ChunkHeaderHolder;->listType:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1}, Landroidx/media3/common/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Landroidx/media3/common/ParserException;

    move-result-object p1

    throw p1

    .line 224
    :pswitch_6
    invoke-virtual {p0, p1}, Landroidx/media3/extractor/avi/AviExtractor;->sniff(Landroidx/media3/extractor/ExtractorInput;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 225
    invoke-interface {p1, v4}, Landroidx/media3/extractor/ExtractorInput;->skipFully(I)V

    .line 230
    iput v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    return v5

    .line 227
    :cond_9
    const-string p1, "AVI Header List not found"

    invoke-static {p1, v1}, Landroidx/media3/common/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Landroidx/media3/common/ParserException;

    move-result-object p1

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public release()V
    .locals 0

    return-void
.end method

.method public seek(JJ)V
    .locals 3

    const-wide/16 p3, -0x1

    .line 320
    iput-wide p3, p0, Landroidx/media3/extractor/avi/AviExtractor;->pendingReposition:J

    const/4 p3, 0x0

    .line 321
    iput-object p3, p0, Landroidx/media3/extractor/avi/AviExtractor;->currentChunkReader:Landroidx/media3/extractor/avi/ChunkReader;

    .line 322
    iget-object p3, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkReaders:[Landroidx/media3/extractor/avi/ChunkReader;

    array-length p4, p3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p4, :cond_0

    aget-object v2, p3, v1

    .line 323
    invoke-virtual {v2, p1, p2}, Landroidx/media3/extractor/avi/ChunkReader;->seekToPosition(J)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 p3, 0x0

    cmp-long v1, p1, p3

    if-nez v1, :cond_2

    .line 326
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->chunkReaders:[Landroidx/media3/extractor/avi/ChunkReader;

    array-length p1, p1

    if-nez p1, :cond_1

    .line 328
    iput v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    goto :goto_1

    :cond_1
    const/4 p1, 0x3

    .line 330
    iput p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    :goto_1
    return-void

    :cond_2
    const/4 p1, 0x6

    .line 334
    iput p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->state:I

    return-void
.end method

.method public sniff(Landroidx/media3/extractor/ExtractorInput;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 206
    iget-object v0, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {v0}, Landroidx/media3/common/util/ParsableByteArray;->getData()[B

    move-result-object v0

    const/16 v1, 0xc

    const/4 v2, 0x0

    invoke-interface {p1, v0, v2, v1}, Landroidx/media3/extractor/ExtractorInput;->peekFully([BII)V

    .line 207
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p1, v2}, Landroidx/media3/common/util/ParsableByteArray;->setPosition(I)V

    .line 208
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result p1

    const v0, 0x46464952

    if-eq p1, v0, :cond_0

    return v2

    .line 211
    :cond_0
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroidx/media3/common/util/ParsableByteArray;->skipBytes(I)V

    .line 212
    iget-object p1, p0, Landroidx/media3/extractor/avi/AviExtractor;->scratch:Landroidx/media3/common/util/ParsableByteArray;

    invoke-virtual {p1}, Landroidx/media3/common/util/ParsableByteArray;->readLittleEndianInt()I

    move-result p1

    const v0, 0x20495641

    if-ne p1, v0, :cond_1

    const/4 v2, 0x1

    :cond_1
    return v2
.end method
