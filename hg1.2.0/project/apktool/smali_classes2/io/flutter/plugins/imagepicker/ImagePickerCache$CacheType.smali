.class public final enum Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;
.super Ljava/lang/Enum;
.source "ImagePickerCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/ImagePickerCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CacheType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

.field public static final enum IMAGE:Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

.field public static final enum VIDEO:Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;


# direct methods
.method private static synthetic $values()[Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;
    .locals 3

    const/4 v0, 0x2

    .line 20
    new-array v0, v0, [Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    sget-object v1, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;->IMAGE:Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;->VIDEO:Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 21
    new-instance v0, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    const-string v1, "IMAGE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;->IMAGE:Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    .line 22
    new-instance v0, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    const-string v1, "VIDEO"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;->VIDEO:Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    .line 20
    invoke-static {}, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;->$values()[Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    move-result-object v0

    sput-object v0, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;->$VALUES:[Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;
    .locals 1

    .line 20
    const-class v0, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    return-object p0
.end method

.method public static values()[Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;
    .locals 1

    .line 20
    sget-object v0, Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;->$VALUES:[Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    invoke-virtual {v0}, [Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/plugins/imagepicker/ImagePickerCache$CacheType;

    return-object v0
.end method
