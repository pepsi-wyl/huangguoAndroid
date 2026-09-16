.class Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;
.super Ljava/lang/Object;
.source "HlsSampleStreamWrapper.java"

# interfaces
.implements Landroidx/media3/extractor/TrackOutput;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EmsgUnwrappingTrackOutput"
.end annotation


# static fields
.field private static final EMSG_FORMAT:Landroidx/media3/common/Format;

.field private static final ID3_FORMAT:Landroidx/media3/common/Format;


# instance fields
.field private buffer:[B

.field private bufferPosition:I

.field private final delegate:Landroidx/media3/extractor/TrackOutput;

.field private final delegateFormat:Landroidx/media3/common/Format;

.field private final emsgDecoder:Landroidx/media3/extractor/metadata/emsg/EventMessageDecoder;

.field private format:Landroidx/media3/common/Format;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1797
    new-instance v0, Landroidx/media3/common/Format$Builder;

    invoke-direct {v0}, Landroidx/media3/common/Format$Builder;-><init>()V

    const-string v1, "application/id3"

    .line 1798
    invoke-virtual {v0, v1}, Landroidx/media3/common/Format$Builder;->setSampleMimeType(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/common/Format$Builder;->build()Landroidx/media3/common/Format;

    move-result-object v0

    sput-object v0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->ID3_FORMAT:Landroidx/media3/common/Format;

    .line 1799
    new-instance v0, Landroidx/media3/common/Format$Builder;

    invoke-direct {v0}, Landroidx/media3/common/Format$Builder;-><init>()V

    const-string v1, "application/x-emsg"

    .line 1800
    invoke-virtual {v0, v1}, Landroidx/media3/common/Format$Builder;->setSampleMimeType(Ljava/lang/String;)Landroidx/media3/common/Format$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/common/Format$Builder;->build()Landroidx/media3/common/Format;

    move-result-object v0

    sput-object v0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->EMSG_FORMAT:Landroidx/media3/common/Format;

    return-void
.end method

.method public constructor <init>(Landroidx/media3/extractor/TrackOutput;I)V
    .locals 2

    .line 1811
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1812
    new-instance v0, Landroidx/media3/extractor/metadata/emsg/EventMessageDecoder;

    invoke-direct {v0}, Landroidx/media3/extractor/metadata/emsg/EventMessageDecoder;-><init>()V

    iput-object v0, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->emsgDecoder:Landroidx/media3/extractor/metadata/emsg/EventMessageDecoder;

    .line 1813
    iput-object p1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->delegate:Landroidx/media3/extractor/TrackOutput;

    const/4 p1, 0x1

    if-eq p2, p1, :cond_1

    const/4 p1, 0x3

    if-ne p2, p1, :cond_0

    .line 1819
    sget-object p1, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->EMSG_FORMAT:Landroidx/media3/common/Format;

    iput-object p1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->delegateFormat:Landroidx/media3/common/Format;

    goto :goto_0

    .line 1822
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unknown metadataType: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1816
    :cond_1
    sget-object p1, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->ID3_FORMAT:Landroidx/media3/common/Format;

    iput-object p1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->delegateFormat:Landroidx/media3/common/Format;

    :goto_0
    const/4 p1, 0x0

    .line 1825
    new-array p2, p1, [B

    iput-object p2, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->buffer:[B

    .line 1826
    iput p1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->bufferPosition:I

    return-void
.end method

.method private emsgContainsExpectedWrappedFormat(Landroidx/media3/extractor/metadata/emsg/EventMessage;)Z
    .locals 1

    .line 1897
    invoke-virtual {p1}, Landroidx/media3/extractor/metadata/emsg/EventMessage;->getWrappedMetadataFormat()Landroidx/media3/common/Format;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1898
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->delegateFormat:Landroidx/media3/common/Format;

    iget-object v0, v0, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    iget-object p1, p1, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    .line 1899
    invoke-static {v0, p1}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private ensureBufferCapacity(I)V
    .locals 2

    .line 1903
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->buffer:[B

    array-length v1, v0

    if-ge v1, p1, :cond_0

    .line 1904
    div-int/lit8 v1, p1, 0x2

    add-int/2addr p1, v1

    invoke-static {v0, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p1

    iput-object p1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->buffer:[B

    :cond_0
    return-void
.end method

.method private getSampleAndTrimBuffer(II)Landroidx/media3/common/util/ParsableByteArray;
    .locals 3

    .line 1917
    iget v0, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->bufferPosition:I

    sub-int/2addr v0, p2

    sub-int p1, v0, p1

    .line 1920
    iget-object v1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->buffer:[B

    invoke-static {v1, p1, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    .line 1921
    new-instance v1, Landroidx/media3/common/util/ParsableByteArray;

    invoke-direct {v1, p1}, Landroidx/media3/common/util/ParsableByteArray;-><init>([B)V

    .line 1923
    iget-object p1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->buffer:[B

    const/4 v2, 0x0

    invoke-static {p1, v0, p1, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1924
    iput p2, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->bufferPosition:I

    return-object v1
.end method


# virtual methods
.method public format(Landroidx/media3/common/Format;)V
    .locals 1

    .line 1831
    iput-object p1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->format:Landroidx/media3/common/Format;

    .line 1832
    iget-object p1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->delegate:Landroidx/media3/extractor/TrackOutput;

    iget-object v0, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->delegateFormat:Landroidx/media3/common/Format;

    invoke-interface {p1, v0}, Landroidx/media3/extractor/TrackOutput;->format(Landroidx/media3/common/Format;)V

    return-void
.end method

.method public synthetic sampleData(Landroidx/media3/common/DataReader;IZ)I
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/media3/extractor/TrackOutput$-CC;->$default$sampleData(Landroidx/media3/extractor/TrackOutput;Landroidx/media3/common/DataReader;IZ)I

    move-result p1

    return p1
.end method

.method public sampleData(Landroidx/media3/common/DataReader;IZI)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1839
    iget p4, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->bufferPosition:I

    add-int/2addr p4, p2

    invoke-direct {p0, p4}, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->ensureBufferCapacity(I)V

    .line 1840
    iget-object p4, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->buffer:[B

    iget v0, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->bufferPosition:I

    invoke-interface {p1, p4, v0, p2}, Landroidx/media3/common/DataReader;->read([BII)I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_1

    if-eqz p3, :cond_0

    return p2

    .line 1845
    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    .line 1848
    :cond_1
    iget p2, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->bufferPosition:I

    add-int/2addr p2, p1

    iput p2, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->bufferPosition:I

    return p1
.end method

.method public synthetic sampleData(Landroidx/media3/common/util/ParsableByteArray;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/media3/extractor/TrackOutput$-CC;->$default$sampleData(Landroidx/media3/extractor/TrackOutput;Landroidx/media3/common/util/ParsableByteArray;I)V

    return-void
.end method

.method public sampleData(Landroidx/media3/common/util/ParsableByteArray;II)V
    .locals 1

    .line 1854
    iget p3, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->bufferPosition:I

    add-int/2addr p3, p2

    invoke-direct {p0, p3}, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->ensureBufferCapacity(I)V

    .line 1855
    iget-object p3, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->buffer:[B

    iget v0, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->bufferPosition:I

    invoke-virtual {p1, p3, v0, p2}, Landroidx/media3/common/util/ParsableByteArray;->readBytes([BII)V

    .line 1856
    iget p1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->bufferPosition:I

    add-int/2addr p1, p2

    iput p1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->bufferPosition:I

    return-void
.end method

.method public sampleMetadata(JIIILandroidx/media3/extractor/TrackOutput$CryptoData;)V
    .locals 7

    .line 1866
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->format:Landroidx/media3/common/Format;

    invoke-static {v0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1867
    invoke-direct {p0, p4, p5}, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->getSampleAndTrimBuffer(II)Landroidx/media3/common/util/ParsableByteArray;

    move-result-object p4

    .line 1869
    iget-object p5, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->format:Landroidx/media3/common/Format;

    iget-object p5, p5, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    iget-object v0, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->delegateFormat:Landroidx/media3/common/Format;

    iget-object v0, v0, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-static {p5, v0}, Landroidx/media3/common/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_0

    goto :goto_0

    .line 1872
    :cond_0
    iget-object p5, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->format:Landroidx/media3/common/Format;

    iget-object p5, p5, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    const-string v0, "application/x-emsg"

    invoke-virtual {v0, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    const-string v0, "HlsSampleStreamWrapper"

    if-eqz p5, :cond_2

    .line 1874
    iget-object p5, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->emsgDecoder:Landroidx/media3/extractor/metadata/emsg/EventMessageDecoder;

    invoke-virtual {p5, p4}, Landroidx/media3/extractor/metadata/emsg/EventMessageDecoder;->decode(Landroidx/media3/common/util/ParsableByteArray;)Landroidx/media3/extractor/metadata/emsg/EventMessage;

    move-result-object p4

    .line 1875
    invoke-direct {p0, p4}, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->emsgContainsExpectedWrappedFormat(Landroidx/media3/extractor/metadata/emsg/EventMessage;)Z

    move-result p5

    if-nez p5, :cond_1

    .line 1876
    iget-object p1, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->delegateFormat:Landroidx/media3/common/Format;

    iget-object p1, p1, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    .line 1880
    invoke-virtual {p4}, Landroidx/media3/extractor/metadata/emsg/EventMessage;->getWrappedMetadataFormat()Landroidx/media3/common/Format;

    move-result-object p2

    const/4 p3, 0x2

    new-array p3, p3, [Ljava/lang/Object;

    const/4 p4, 0x0

    aput-object p1, p3, p4

    const/4 p1, 0x1

    aput-object p2, p3, p1

    .line 1878
    const-string p1, "Ignoring EMSG. Expected it to contain wrapped %s but actual wrapped format: %s"

    invoke-static {p1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1876
    invoke-static {v0, p1}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1883
    :cond_1
    new-instance p5, Landroidx/media3/common/util/ParsableByteArray;

    .line 1884
    invoke-virtual {p4}, Landroidx/media3/extractor/metadata/emsg/EventMessage;->getWrappedMetadataBytes()[B

    move-result-object p4

    invoke-static {p4}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, [B

    invoke-direct {p5, p4}, Landroidx/media3/common/util/ParsableByteArray;-><init>([B)V

    move-object p4, p5

    .line 1890
    :goto_0
    invoke-virtual {p4}, Landroidx/media3/common/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    .line 1892
    iget-object p5, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->delegate:Landroidx/media3/extractor/TrackOutput;

    invoke-interface {p5, p4, v4}, Landroidx/media3/extractor/TrackOutput;->sampleData(Landroidx/media3/common/util/ParsableByteArray;I)V

    .line 1893
    iget-object v0, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->delegate:Landroidx/media3/extractor/TrackOutput;

    const/4 v5, 0x0

    move-wide v1, p1

    move v3, p3

    move-object v6, p6

    invoke-interface/range {v0 .. v6}, Landroidx/media3/extractor/TrackOutput;->sampleMetadata(JIIILandroidx/media3/extractor/TrackOutput$CryptoData;)V

    return-void

    .line 1886
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Ignoring sample for unsupported format: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Landroidx/media3/exoplayer/hls/HlsSampleStreamWrapper$EmsgUnwrappingTrackOutput;->format:Landroidx/media3/common/Format;

    iget-object p2, p2, Landroidx/media3/common/Format;->sampleMimeType:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroidx/media3/common/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
