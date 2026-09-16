.class public final Landroidx/webkit/UserAgentMetadata;
.super Ljava/lang/Object;
.source "UserAgentMetadata.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/webkit/UserAgentMetadata$Builder;,
        Landroidx/webkit/UserAgentMetadata$BrandVersion;
    }
.end annotation


# static fields
.field public static final BITNESS_DEFAULT:I


# instance fields
.field private final mArchitecture:Ljava/lang/String;

.field private mBitness:I

.field private final mBrandVersionList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/webkit/UserAgentMetadata$BrandVersion;",
            ">;"
        }
    .end annotation
.end field

.field private final mFullVersion:Ljava/lang/String;

.field private mMobile:Z

.field private final mModel:Ljava/lang/String;

.field private final mPlatform:Ljava/lang/String;

.field private final mPlatformVersion:Ljava/lang/String;

.field private mWow64:Z


# direct methods
.method private constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/webkit/UserAgentMetadata$BrandVersion;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZIZ)V"
        }
    .end annotation

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Landroidx/webkit/UserAgentMetadata;->mBrandVersionList:Ljava/util/List;

    .line 60
    iput-object p2, p0, Landroidx/webkit/UserAgentMetadata;->mFullVersion:Ljava/lang/String;

    .line 61
    iput-object p3, p0, Landroidx/webkit/UserAgentMetadata;->mPlatform:Ljava/lang/String;

    .line 62
    iput-object p4, p0, Landroidx/webkit/UserAgentMetadata;->mPlatformVersion:Ljava/lang/String;

    .line 63
    iput-object p5, p0, Landroidx/webkit/UserAgentMetadata;->mArchitecture:Ljava/lang/String;

    .line 64
    iput-object p6, p0, Landroidx/webkit/UserAgentMetadata;->mModel:Ljava/lang/String;

    .line 65
    iput-boolean p7, p0, Landroidx/webkit/UserAgentMetadata;->mMobile:Z

    .line 66
    iput p8, p0, Landroidx/webkit/UserAgentMetadata;->mBitness:I

    .line 67
    iput-boolean p9, p0, Landroidx/webkit/UserAgentMetadata;->mWow64:Z

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIZLandroidx/webkit/UserAgentMetadata$1;)V
    .locals 0

    .line 34
    invoke-direct/range {p0 .. p9}, Landroidx/webkit/UserAgentMetadata;-><init>(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIZ)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 182
    :cond_0
    instance-of v1, p1, Landroidx/webkit/UserAgentMetadata;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 183
    :cond_1
    check-cast p1, Landroidx/webkit/UserAgentMetadata;

    .line 184
    iget-boolean v1, p0, Landroidx/webkit/UserAgentMetadata;->mMobile:Z

    iget-boolean v3, p1, Landroidx/webkit/UserAgentMetadata;->mMobile:Z

    if-ne v1, v3, :cond_2

    iget v1, p0, Landroidx/webkit/UserAgentMetadata;->mBitness:I

    iget v3, p1, Landroidx/webkit/UserAgentMetadata;->mBitness:I

    if-ne v1, v3, :cond_2

    iget-boolean v1, p0, Landroidx/webkit/UserAgentMetadata;->mWow64:Z

    iget-boolean v3, p1, Landroidx/webkit/UserAgentMetadata;->mWow64:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata;->mBrandVersionList:Ljava/util/List;

    iget-object v3, p1, Landroidx/webkit/UserAgentMetadata;->mBrandVersionList:Ljava/util/List;

    .line 185
    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata;->mFullVersion:Ljava/lang/String;

    iget-object v3, p1, Landroidx/webkit/UserAgentMetadata;->mFullVersion:Ljava/lang/String;

    .line 186
    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata;->mPlatform:Ljava/lang/String;

    iget-object v3, p1, Landroidx/webkit/UserAgentMetadata;->mPlatform:Ljava/lang/String;

    .line 187
    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata;->mPlatformVersion:Ljava/lang/String;

    iget-object v3, p1, Landroidx/webkit/UserAgentMetadata;->mPlatformVersion:Ljava/lang/String;

    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata;->mArchitecture:Ljava/lang/String;

    iget-object v3, p1, Landroidx/webkit/UserAgentMetadata;->mArchitecture:Ljava/lang/String;

    .line 188
    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata;->mModel:Ljava/lang/String;

    iget-object p1, p1, Landroidx/webkit/UserAgentMetadata;->mModel:Ljava/lang/String;

    .line 189
    invoke-static {v1, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getArchitecture()Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Landroidx/webkit/UserAgentMetadata;->mArchitecture:Ljava/lang/String;

    return-object v0
.end method

.method public getBitness()I
    .locals 1

    .line 161
    iget v0, p0, Landroidx/webkit/UserAgentMetadata;->mBitness:I

    return v0
.end method

.method public getBrandVersionList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/webkit/UserAgentMetadata$BrandVersion;",
            ">;"
        }
    .end annotation

    .line 81
    iget-object v0, p0, Landroidx/webkit/UserAgentMetadata;->mBrandVersionList:Ljava/util/List;

    return-object v0
.end method

.method public getFullVersion()Ljava/lang/String;
    .locals 1

    .line 92
    iget-object v0, p0, Landroidx/webkit/UserAgentMetadata;->mFullVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    .line 137
    iget-object v0, p0, Landroidx/webkit/UserAgentMetadata;->mModel:Ljava/lang/String;

    return-object v0
.end method

.method public getPlatform()Ljava/lang/String;
    .locals 1

    .line 103
    iget-object v0, p0, Landroidx/webkit/UserAgentMetadata;->mPlatform:Ljava/lang/String;

    return-object v0
.end method

.method public getPlatformVersion()Ljava/lang/String;
    .locals 1

    .line 115
    iget-object v0, p0, Landroidx/webkit/UserAgentMetadata;->mPlatformVersion:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 11

    .line 194
    iget-object v0, p0, Landroidx/webkit/UserAgentMetadata;->mBrandVersionList:Ljava/util/List;

    iget-object v1, p0, Landroidx/webkit/UserAgentMetadata;->mFullVersion:Ljava/lang/String;

    iget-object v2, p0, Landroidx/webkit/UserAgentMetadata;->mPlatform:Ljava/lang/String;

    iget-object v3, p0, Landroidx/webkit/UserAgentMetadata;->mPlatformVersion:Ljava/lang/String;

    iget-object v4, p0, Landroidx/webkit/UserAgentMetadata;->mArchitecture:Ljava/lang/String;

    iget-object v5, p0, Landroidx/webkit/UserAgentMetadata;->mModel:Ljava/lang/String;

    iget-boolean v6, p0, Landroidx/webkit/UserAgentMetadata;->mMobile:Z

    .line 195
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    iget v7, p0, Landroidx/webkit/UserAgentMetadata;->mBitness:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget-boolean v8, p0, Landroidx/webkit/UserAgentMetadata;->mWow64:Z

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    const/16 v9, 0x9

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v0, v9, v10

    const/4 v0, 0x1

    aput-object v1, v9, v0

    const/4 v0, 0x2

    aput-object v2, v9, v0

    const/4 v0, 0x3

    aput-object v3, v9, v0

    const/4 v0, 0x4

    aput-object v4, v9, v0

    const/4 v0, 0x5

    aput-object v5, v9, v0

    const/4 v0, 0x6

    aput-object v6, v9, v0

    const/4 v0, 0x7

    aput-object v7, v9, v0

    const/16 v0, 0x8

    aput-object v8, v9, v0

    .line 194
    invoke-static {v9}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isMobile()Z
    .locals 1

    .line 148
    iget-boolean v0, p0, Landroidx/webkit/UserAgentMetadata;->mMobile:Z

    return v0
.end method

.method public isWow64()Z
    .locals 1

    .line 173
    iget-boolean v0, p0, Landroidx/webkit/UserAgentMetadata;->mWow64:Z

    return v0
.end method
