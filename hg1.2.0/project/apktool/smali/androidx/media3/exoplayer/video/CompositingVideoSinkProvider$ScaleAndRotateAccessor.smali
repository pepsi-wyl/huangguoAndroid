.class final Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;
.super Ljava/lang/Object;
.source "CompositingVideoSinkProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ScaleAndRotateAccessor"
.end annotation


# static fields
.field private static buildScaleAndRotateTransformationMethod:Ljava/lang/reflect/Method;

.field private static scaleAndRotateTransformationBuilderConstructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "*>;"
        }
    .end annotation
.end field

.field private static setRotationMethod:Ljava/lang/reflect/Method;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1026
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createRotationEffect(F)Landroidx/media3/common/Effect;
    .locals 4

    .line 1033
    :try_start_0
    invoke-static {}, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;->prepare()V

    .line 1034
    sget-object v0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;->scaleAndRotateTransformationBuilderConstructor:Ljava/lang/reflect/Constructor;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1035
    sget-object v2, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;->setRotationMethod:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    aput-object p0, v3, v1

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 1036
    sget-object p0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;->buildScaleAndRotateTransformationMethod:Ljava/lang/reflect/Method;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Landroidx/media3/common/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/media3/common/Effect;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 1038
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static prepare()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "scaleAndRotateTransformationBuilderConstructor",
            "setRotationMethod",
            "buildScaleAndRotateTransformationMethod"
        }
    .end annotation

    .line 1048
    sget-object v0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;->scaleAndRotateTransformationBuilderConstructor:Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_0

    sget-object v0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;->setRotationMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    sget-object v0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;->buildScaleAndRotateTransformationMethod:Ljava/lang/reflect/Method;

    if-nez v0, :cond_1

    .line 1052
    :cond_0
    const-string v0, "androidx.media3.effect.ScaleAndRotateTransformation$Builder"

    .line 1053
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    .line 1054
    new-array v2, v1, [Ljava/lang/Class;

    .line 1055
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    sput-object v2, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;->scaleAndRotateTransformationBuilderConstructor:Ljava/lang/reflect/Constructor;

    const/4 v2, 0x1

    .line 1056
    new-array v2, v2, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v1

    .line 1057
    const-string v3, "setRotationDegrees"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;->setRotationMethod:Ljava/lang/reflect/Method;

    .line 1058
    const-string v2, "build"

    new-array v1, v1, [Ljava/lang/Class;

    .line 1059
    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroidx/media3/exoplayer/video/CompositingVideoSinkProvider$ScaleAndRotateAccessor;->buildScaleAndRotateTransformationMethod:Ljava/lang/reflect/Method;

    :cond_1
    return-void
.end method
