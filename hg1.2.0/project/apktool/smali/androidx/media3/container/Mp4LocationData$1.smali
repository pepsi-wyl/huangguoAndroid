.class Landroidx/media3/container/Mp4LocationData$1;
.super Ljava/lang/Object;
.source "Mp4LocationData.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/container/Mp4LocationData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Landroidx/media3/container/Mp4LocationData;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroidx/media3/container/Mp4LocationData;
    .locals 2

    .line 98
    new-instance v0, Landroidx/media3/container/Mp4LocationData;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Landroidx/media3/container/Mp4LocationData;-><init>(Landroid/os/Parcel;Landroidx/media3/container/Mp4LocationData$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 94
    invoke-virtual {p0, p1}, Landroidx/media3/container/Mp4LocationData$1;->createFromParcel(Landroid/os/Parcel;)Landroidx/media3/container/Mp4LocationData;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Landroidx/media3/container/Mp4LocationData;
    .locals 0

    .line 103
    new-array p1, p1, [Landroidx/media3/container/Mp4LocationData;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 94
    invoke-virtual {p0, p1}, Landroidx/media3/container/Mp4LocationData$1;->newArray(I)[Landroidx/media3/container/Mp4LocationData;

    move-result-object p1

    return-object p1
.end method
