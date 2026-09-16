.class public final enum Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;
.super Ljava/lang/Enum;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CacheRetrievalType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

.field public static final enum IMAGE:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

.field public static final enum VIDEO:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;


# instance fields
.field final index:I


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;
    .locals 3

    const/4 v0, 0x2

    .line 89
    new-array v0, v0, [Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    sget-object v1, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;->IMAGE:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;->VIDEO:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 90
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    const-string v1, "IMAGE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;->IMAGE:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    .line 91
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    const-string v1, "VIDEO"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;->VIDEO:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    .line 89
    invoke-static {}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;->$values()[Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;->$VALUES:[Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 95
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 96
    iput p3, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;->index:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;
    .locals 1

    .line 89
    const-class v0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;
    .locals 1

    .line 89
    sget-object v0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;->$VALUES:[Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    invoke-virtual {v0}, [Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    return-object v0
.end method
