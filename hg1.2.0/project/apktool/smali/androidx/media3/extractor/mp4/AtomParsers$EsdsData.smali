.class final Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;
.super Ljava/lang/Object;
.source "AtomParsers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/extractor/mp4/AtomParsers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EsdsData"
.end annotation


# instance fields
.field private final bitrate:J

.field private final initializationData:[B

.field private final mimeType:Ljava/lang/String;

.field private final peakBitrate:J


# direct methods
.method public constructor <init>(Ljava/lang/String;[BJJ)V
    .locals 0

    .line 2228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2229
    iput-object p1, p0, Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;->mimeType:Ljava/lang/String;

    .line 2230
    iput-object p2, p0, Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;->initializationData:[B

    .line 2231
    iput-wide p3, p0, Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;->bitrate:J

    .line 2232
    iput-wide p5, p0, Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;->peakBitrate:J

    return-void
.end method

.method static synthetic access$300(Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;)Ljava/lang/String;
    .locals 0

    .line 2218
    iget-object p0, p0, Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;->mimeType:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;)[B
    .locals 0

    .line 2218
    iget-object p0, p0, Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;->initializationData:[B

    return-object p0
.end method

.method static synthetic access$500(Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;)J
    .locals 2

    .line 2218
    iget-wide v0, p0, Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;->peakBitrate:J

    return-wide v0
.end method

.method static synthetic access$600(Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;)J
    .locals 2

    .line 2218
    iget-wide v0, p0, Landroidx/media3/extractor/mp4/AtomParsers$EsdsData;->bitrate:J

    return-wide v0
.end method
