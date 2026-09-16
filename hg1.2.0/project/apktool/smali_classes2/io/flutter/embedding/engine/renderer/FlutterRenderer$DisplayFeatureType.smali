.class public final enum Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;
.super Ljava/lang/Enum;
.source "FlutterRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/renderer/FlutterRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DisplayFeatureType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

.field public static final enum CUTOUT:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

.field public static final enum FOLD:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

.field public static final enum HINGE:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

.field public static final enum UNKNOWN:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;


# instance fields
.field public final encodedValue:I


# direct methods
.method private static synthetic $values()[Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;
    .locals 3

    const/4 v0, 0x4

    .line 1319
    new-array v0, v0, [Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    sget-object v1, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->UNKNOWN:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->FOLD:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->HINGE:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->CUTOUT:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1324
    new-instance v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->UNKNOWN:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    .line 1330
    new-instance v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    const-string v1, "FOLD"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->FOLD:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    .line 1336
    new-instance v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    const-string v1, "HINGE"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->HINGE:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    .line 1342
    new-instance v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    const-string v1, "CUTOUT"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->CUTOUT:Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    .line 1319
    invoke-static {}, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->$values()[Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    move-result-object v0

    sput-object v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->$VALUES:[Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1346
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 1347
    iput p3, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->encodedValue:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;
    .locals 1

    .line 1319
    const-class v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    return-object p0
.end method

.method public static values()[Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;
    .locals 1

    .line 1319
    sget-object v0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->$VALUES:[Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    invoke-virtual {v0}, [Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/embedding/engine/renderer/FlutterRenderer$DisplayFeatureType;

    return-object v0
.end method
