.class public final Landroidx/media3/extractor/text/CueDecoder;
.super Ljava/lang/Object;
.source "CueDecoder.java"


# static fields
.field static final BUNDLE_FIELD_CUES:Ljava/lang/String; = "c"

.field static final BUNDLE_FIELD_DURATION_US:Ljava/lang/String; = "d"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode(J[B)Landroidx/media3/extractor/text/CuesWithTiming;
    .locals 6

    const/4 v4, 0x0

    .line 46
    array-length v5, p3

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Landroidx/media3/extractor/text/CueDecoder;->decode(J[BII)Landroidx/media3/extractor/text/CuesWithTiming;

    move-result-object p1

    return-object p1
.end method

.method public decode(J[BII)Landroidx/media3/extractor/text/CuesWithTiming;
    .locals 6

    .line 60
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 61
    invoke-virtual {v0, p3, p4, p5}, Landroid/os/Parcel;->unmarshall([BII)V

    const/4 p3, 0x0

    .line 62
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 63
    const-class p3, Landroid/os/Bundle;

    invoke-virtual {p3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p3

    invoke-virtual {v0, p3}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object p3

    .line 64
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 65
    const-string p4, "c"

    .line 66
    invoke-virtual {p3, p4}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    invoke-static {p4}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/util/ArrayList;

    .line 67
    new-instance p5, Landroidx/media3/extractor/text/CuesWithTiming;

    new-instance v0, Landroidx/media3/common/text/CueGroup$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Landroidx/media3/common/text/CueGroup$$ExternalSyntheticLambda0;-><init>()V

    .line 68
    invoke-static {v0, p4}, Landroidx/media3/common/util/BundleCollectionUtil;->fromBundleList(Lcom/google/common/base/Function;Ljava/util/List;)Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    const-string p4, "d"

    .line 70
    invoke-virtual {p3, p4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    move-object v0, p5

    move-wide v2, p1

    invoke-direct/range {v0 .. v5}, Landroidx/media3/extractor/text/CuesWithTiming;-><init>(Ljava/util/List;JJ)V

    return-object p5
.end method
