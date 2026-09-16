.class public final Landroidx/media3/extractor/metadata/id3/MlltFrame;
.super Landroidx/media3/extractor/metadata/id3/Id3Frame;
.source "MlltFrame.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Landroidx/media3/extractor/metadata/id3/MlltFrame;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Ljava/lang/String; = "MLLT"


# instance fields
.field public final bytesBetweenReference:I

.field public final bytesDeviations:[I

.field public final millisecondsBetweenReference:I

.field public final millisecondsDeviations:[I

.field public final mpegFramesBetweenReference:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 102
    new-instance v0, Landroidx/media3/extractor/metadata/id3/MlltFrame$1;

    invoke-direct {v0}, Landroidx/media3/extractor/metadata/id3/MlltFrame$1;-><init>()V

    sput-object v0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(III[I[I)V
    .locals 1

    .line 42
    const-string v0, "MLLT"

    invoke-direct {p0, v0}, Landroidx/media3/extractor/metadata/id3/Id3Frame;-><init>(Ljava/lang/String;)V

    .line 43
    iput p1, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->mpegFramesBetweenReference:I

    .line 44
    iput p2, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesBetweenReference:I

    .line 45
    iput p3, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsBetweenReference:I

    .line 46
    iput-object p4, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesDeviations:[I

    .line 47
    iput-object p5, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsDeviations:[I

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 51
    const-string v0, "MLLT"

    invoke-direct {p0, v0}, Landroidx/media3/extractor/metadata/id3/Id3Frame;-><init>(Ljava/lang/String;)V

    .line 52
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->mpegFramesBetweenReference:I

    .line 53
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesBetweenReference:I

    .line 54
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsBetweenReference:I

    .line 55
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    invoke-static {v0}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iput-object v0, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesDeviations:[I

    .line 56
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object p1

    invoke-static {p1}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [I

    iput-object p1, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsDeviations:[I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 64
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 67
    :cond_1
    check-cast p1, Landroidx/media3/extractor/metadata/id3/MlltFrame;

    .line 68
    iget v2, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->mpegFramesBetweenReference:I

    iget v3, p1, Landroidx/media3/extractor/metadata/id3/MlltFrame;->mpegFramesBetweenReference:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesBetweenReference:I

    iget v3, p1, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesBetweenReference:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsBetweenReference:I

    iget v3, p1, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsBetweenReference:I

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesDeviations:[I

    iget-object v3, p1, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesDeviations:[I

    .line 71
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsDeviations:[I

    iget-object p1, p1, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsDeviations:[I

    .line 72
    invoke-static {v2, p1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    const/16 v0, 0x20f

    .line 78
    iget v1, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->mpegFramesBetweenReference:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 79
    iget v1, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesBetweenReference:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 80
    iget v1, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsBetweenReference:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 81
    iget-object v1, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesDeviations:[I

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 82
    iget-object v1, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsDeviations:[I

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 90
    iget p2, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->mpegFramesBetweenReference:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 91
    iget p2, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesBetweenReference:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 92
    iget p2, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsBetweenReference:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 93
    iget-object p2, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->bytesDeviations:[I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 94
    iget-object p2, p0, Landroidx/media3/extractor/metadata/id3/MlltFrame;->millisecondsDeviations:[I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeIntArray([I)V

    return-void
.end method
