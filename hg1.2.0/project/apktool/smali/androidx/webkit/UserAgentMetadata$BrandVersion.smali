.class public final Landroidx/webkit/UserAgentMetadata$BrandVersion;
.super Ljava/lang/Object;
.source "UserAgentMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/webkit/UserAgentMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BrandVersion"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/webkit/UserAgentMetadata$BrandVersion$Builder;
    }
.end annotation


# instance fields
.field private final mBrand:Ljava/lang/String;

.field private final mFullVersion:Ljava/lang/String;

.field private final mMajorVersion:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 215
    iput-object p1, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mBrand:Ljava/lang/String;

    .line 216
    iput-object p2, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mMajorVersion:Ljava/lang/String;

    .line 217
    iput-object p3, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mFullVersion:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/webkit/UserAgentMetadata$1;)V
    .locals 0

    .line 207
    invoke-direct {p0, p1, p2, p3}, Landroidx/webkit/UserAgentMetadata$BrandVersion;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 260
    :cond_0
    instance-of v1, p1, Landroidx/webkit/UserAgentMetadata$BrandVersion;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 261
    :cond_1
    check-cast p1, Landroidx/webkit/UserAgentMetadata$BrandVersion;

    .line 262
    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mBrand:Ljava/lang/String;

    iget-object v3, p1, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mBrand:Ljava/lang/String;

    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mMajorVersion:Ljava/lang/String;

    iget-object v3, p1, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mMajorVersion:Ljava/lang/String;

    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mFullVersion:Ljava/lang/String;

    iget-object p1, p1, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mFullVersion:Ljava/lang/String;

    .line 263
    invoke-static {v1, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getBrand()Ljava/lang/String;
    .locals 1

    .line 226
    iget-object v0, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mBrand:Ljava/lang/String;

    return-object v0
.end method

.method public getFullVersion()Ljava/lang/String;
    .locals 1

    .line 244
    iget-object v0, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mFullVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getMajorVersion()Ljava/lang/String;
    .locals 1

    .line 235
    iget-object v0, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mMajorVersion:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 268
    iget-object v0, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mBrand:Ljava/lang/String;

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mMajorVersion:Ljava/lang/String;

    iget-object v2, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mFullVersion:Ljava/lang/String;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 250
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mBrand:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mMajorVersion:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata$BrandVersion;->mFullVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
