.class final enum Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;
.super Ljava/lang/Enum;
.source "VideoAsset.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/videoplayer/VideoAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "StreamingFormat"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

.field public static final enum DYNAMIC_ADAPTIVE:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

.field public static final enum HTTP_LIVE:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

.field public static final enum SMOOTH:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

.field public static final enum UNKNOWN:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;
    .locals 3

    const/4 v0, 0x4

    .line 84
    new-array v0, v0, [Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    sget-object v1, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->UNKNOWN:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->SMOOTH:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->DYNAMIC_ADAPTIVE:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->HTTP_LIVE:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 86
    new-instance v0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->UNKNOWN:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    .line 89
    new-instance v0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    const-string v1, "SMOOTH"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->SMOOTH:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    .line 92
    new-instance v0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    const-string v1, "DYNAMIC_ADAPTIVE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->DYNAMIC_ADAPTIVE:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    .line 95
    new-instance v0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    const-string v1, "HTTP_LIVE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->HTTP_LIVE:Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    .line 84
    invoke-static {}, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->$values()[Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->$VALUES:[Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 84
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;
    .locals 1

    .line 84
    const-class v0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;
    .locals 1

    .line 84
    sget-object v0, Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->$VALUES:[Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    invoke-virtual {v0}, [Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/videoplayer/VideoAsset$StreamingFormat;

    return-object v0
.end method
