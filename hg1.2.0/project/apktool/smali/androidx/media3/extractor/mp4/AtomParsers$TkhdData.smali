.class final Landroidx/media3/extractor/mp4/AtomParsers$TkhdData;
.super Ljava/lang/Object;
.source "AtomParsers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/extractor/mp4/AtomParsers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TkhdData"
.end annotation


# instance fields
.field private final duration:J

.field private final id:I

.field private final rotationDegrees:I


# direct methods
.method public constructor <init>(IJI)V
    .locals 0

    .line 2193
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2194
    iput p1, p0, Landroidx/media3/extractor/mp4/AtomParsers$TkhdData;->id:I

    .line 2195
    iput-wide p2, p0, Landroidx/media3/extractor/mp4/AtomParsers$TkhdData;->duration:J

    .line 2196
    iput p4, p0, Landroidx/media3/extractor/mp4/AtomParsers$TkhdData;->rotationDegrees:I

    return-void
.end method

.method static synthetic access$000(Landroidx/media3/extractor/mp4/AtomParsers$TkhdData;)J
    .locals 2

    .line 2187
    iget-wide v0, p0, Landroidx/media3/extractor/mp4/AtomParsers$TkhdData;->duration:J

    return-wide v0
.end method

.method static synthetic access$100(Landroidx/media3/extractor/mp4/AtomParsers$TkhdData;)I
    .locals 0

    .line 2187
    iget p0, p0, Landroidx/media3/extractor/mp4/AtomParsers$TkhdData;->id:I

    return p0
.end method

.method static synthetic access$200(Landroidx/media3/extractor/mp4/AtomParsers$TkhdData;)I
    .locals 0

    .line 2187
    iget p0, p0, Landroidx/media3/extractor/mp4/AtomParsers$TkhdData;->rotationDegrees:I

    return p0
.end method
