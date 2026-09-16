.class public Landroidx/webkit/internal/WebMessagePayloadAdapter;
.super Ljava/lang/Object;
.source "WebMessagePayloadAdapter.java"

# interfaces
.implements Lorg/chromium/support_lib_boundary/WebMessagePayloadBoundaryInterface;


# instance fields
.field private final mArrayBuffer:[B

.field private final mString:Ljava/lang/String;

.field private final mType:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 37
    iput v0, p0, Landroidx/webkit/internal/WebMessagePayloadAdapter;->mType:I

    .line 38
    iput-object p1, p0, Landroidx/webkit/internal/WebMessagePayloadAdapter;->mString:Ljava/lang/String;

    const/4 p1, 0x0

    .line 39
    iput-object p1, p0, Landroidx/webkit/internal/WebMessagePayloadAdapter;->mArrayBuffer:[B

    return-void
.end method

.method public constructor <init>([B)V
    .locals 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 43
    iput v0, p0, Landroidx/webkit/internal/WebMessagePayloadAdapter;->mType:I

    const/4 v0, 0x0

    .line 44
    iput-object v0, p0, Landroidx/webkit/internal/WebMessagePayloadAdapter;->mString:Ljava/lang/String;

    .line 45
    iput-object p1, p0, Landroidx/webkit/internal/WebMessagePayloadAdapter;->mArrayBuffer:[B

    return-void
.end method

.method private checkType(I)V
    .locals 3

    .line 79
    iget v0, p0, Landroidx/webkit/internal/WebMessagePayloadAdapter;->mType:I

    if-ne v0, p1, :cond_0

    return-void

    .line 80
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Expected "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", but type is "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Landroidx/webkit/internal/WebMessagePayloadAdapter;->mType:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getAsArrayBuffer()[B
    .locals 1

    const/4 v0, 0x1

    .line 71
    invoke-direct {p0, v0}, Landroidx/webkit/internal/WebMessagePayloadAdapter;->checkType(I)V

    .line 72
    iget-object v0, p0, Landroidx/webkit/internal/WebMessagePayloadAdapter;->mArrayBuffer:[B

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public getAsString()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, v0}, Landroidx/webkit/internal/WebMessagePayloadAdapter;->checkType(I)V

    .line 65
    iget-object v0, p0, Landroidx/webkit/internal/WebMessagePayloadAdapter;->mString:Ljava/lang/String;

    return-object v0
.end method

.method public getSupportedFeatures()[Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 53
    new-array v0, v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .line 58
    iget v0, p0, Landroidx/webkit/internal/WebMessagePayloadAdapter;->mType:I

    return v0
.end method
