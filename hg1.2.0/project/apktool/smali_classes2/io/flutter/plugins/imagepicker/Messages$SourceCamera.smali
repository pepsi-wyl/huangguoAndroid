.class public final enum Lio/flutter/plugins/imagepicker/Messages$SourceCamera;
.super Ljava/lang/Enum;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SourceCamera"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/imagepicker/Messages$SourceCamera;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

.field public static final enum FRONT:Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

.field public static final enum REAR:Lio/flutter/plugins/imagepicker/Messages$SourceCamera;


# instance fields
.field final index:I


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/imagepicker/Messages$SourceCamera;
    .locals 3

    const/4 v0, 0x2

    .line 67
    new-array v0, v0, [Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    sget-object v1, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->REAR:Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->FRONT:Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 68
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    const-string v1, "REAR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->REAR:Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    .line 69
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    const-string v1, "FRONT"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->FRONT:Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    .line 67
    invoke-static {}, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->$values()[Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->$VALUES:[Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 73
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 74
    iput p3, p0, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->index:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/imagepicker/Messages$SourceCamera;
    .locals 1

    .line 67
    const-class v0, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/imagepicker/Messages$SourceCamera;
    .locals 1

    .line 67
    sget-object v0, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->$VALUES:[Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    invoke-virtual {v0}, [Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    return-object v0
.end method
