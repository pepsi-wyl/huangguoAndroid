.class public final enum Lio/flutter/plugins/imagepicker/Messages$SourceType;
.super Ljava/lang/Enum;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SourceType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/imagepicker/Messages$SourceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/imagepicker/Messages$SourceType;

.field public static final enum CAMERA:Lio/flutter/plugins/imagepicker/Messages$SourceType;

.field public static final enum GALLERY:Lio/flutter/plugins/imagepicker/Messages$SourceType;


# instance fields
.field final index:I


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/imagepicker/Messages$SourceType;
    .locals 3

    const/4 v0, 0x2

    .line 78
    new-array v0, v0, [Lio/flutter/plugins/imagepicker/Messages$SourceType;

    sget-object v1, Lio/flutter/plugins/imagepicker/Messages$SourceType;->CAMERA:Lio/flutter/plugins/imagepicker/Messages$SourceType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/imagepicker/Messages$SourceType;->GALLERY:Lio/flutter/plugins/imagepicker/Messages$SourceType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 79
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$SourceType;

    const-string v1, "CAMERA"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/imagepicker/Messages$SourceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/imagepicker/Messages$SourceType;->CAMERA:Lio/flutter/plugins/imagepicker/Messages$SourceType;

    .line 80
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$SourceType;

    const-string v1, "GALLERY"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/imagepicker/Messages$SourceType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/imagepicker/Messages$SourceType;->GALLERY:Lio/flutter/plugins/imagepicker/Messages$SourceType;

    .line 78
    invoke-static {}, Lio/flutter/plugins/imagepicker/Messages$SourceType;->$values()[Lio/flutter/plugins/imagepicker/Messages$SourceType;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/imagepicker/Messages$SourceType;->$VALUES:[Lio/flutter/plugins/imagepicker/Messages$SourceType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 84
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 85
    iput p3, p0, Lio/flutter/plugins/imagepicker/Messages$SourceType;->index:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/imagepicker/Messages$SourceType;
    .locals 1

    .line 78
    const-class v0, Lio/flutter/plugins/imagepicker/Messages$SourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/imagepicker/Messages$SourceType;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/imagepicker/Messages$SourceType;
    .locals 1

    .line 78
    sget-object v0, Lio/flutter/plugins/imagepicker/Messages$SourceType;->$VALUES:[Lio/flutter/plugins/imagepicker/Messages$SourceType;

    invoke-virtual {v0}, [Lio/flutter/plugins/imagepicker/Messages$SourceType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/imagepicker/Messages$SourceType;

    return-object v0
.end method
