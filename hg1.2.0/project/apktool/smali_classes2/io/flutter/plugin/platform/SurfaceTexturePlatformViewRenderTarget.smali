.class public Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;
.super Ljava/lang/Object;
.source "SurfaceTexturePlatformViewRenderTarget.java"

# interfaces
.implements Lio/flutter/plugin/platform/PlatformViewRenderTarget;


# static fields
.field private static final TAG:Ljava/lang/String; = "SurfaceTexturePlatformViewRenderTarget"


# instance fields
.field private bufferHeight:I

.field private bufferWidth:I

.field private shouldRecreateSurfaceForLowMemory:Z

.field private surface:Landroid/view/Surface;

.field private surfaceTexture:Landroid/graphics/SurfaceTexture;

.field private final surfaceTextureEntry:Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;

.field private final trimMemoryListener:Lio/flutter/view/TextureRegistry$OnTrimMemoryListener;


# direct methods
.method public constructor <init>(Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;)V
    .locals 3

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 21
    iput v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->bufferWidth:I

    .line 22
    iput v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->bufferHeight:I

    .line 24
    iput-boolean v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->shouldRecreateSurfaceForLowMemory:Z

    .line 25
    new-instance v0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget$1;

    invoke-direct {v0, p0}, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget$1;-><init>(Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;)V

    iput-object v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->trimMemoryListener:Lio/flutter/view/TextureRegistry$OnTrimMemoryListener;

    .line 61
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_0

    .line 66
    iput-object p1, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surfaceTextureEntry:Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;

    .line 67
    invoke-interface {p1}, Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;->surfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    iput-object v1, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 68
    invoke-interface {p1, v0}, Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;->setOnTrimMemoryListener(Lio/flutter/view/TextureRegistry$OnTrimMemoryListener;)V

    return-void

    .line 62
    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Platform views cannot be displayed below API level 23You can prevent this issue by setting `minSdkVersion: 23` in build.gradle."

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$002(Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;Z)Z
    .locals 0

    .line 14
    iput-boolean p1, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->shouldRecreateSurfaceForLowMemory:Z

    return p1
.end method

.method private recreateSurfaceIfNeeded()V
    .locals 2

    .line 43
    iget-object v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->shouldRecreateSurfaceForLowMemory:Z

    if-nez v1, :cond_0

    return-void

    :cond_0
    if-eqz v0, :cond_1

    .line 48
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    const/4 v0, 0x0

    .line 49
    iput-object v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surface:Landroid/view/Surface;

    .line 51
    :cond_1
    invoke-virtual {p0}, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->createSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surface:Landroid/view/Surface;

    const/4 v0, 0x0

    .line 52
    iput-boolean v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->shouldRecreateSurfaceForLowMemory:Z

    return-void
.end method


# virtual methods
.method protected createSurface()Landroid/view/Surface;
    .locals 2

    .line 56
    new-instance v0, Landroid/view/Surface;

    iget-object v1, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .line 84
    iget v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->bufferHeight:I

    return v0
.end method

.method public getId()J
    .locals 2

    .line 88
    iget-object v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surfaceTextureEntry:Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;

    invoke-interface {v0}, Lio/flutter/view/TextureRegistry$SurfaceTextureEntry;->id()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 1

    .line 105
    invoke-direct {p0}, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->recreateSurfaceIfNeeded()V

    .line 106
    iget-object v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_1

    invoke-static {v0}, Lcom/huawei/hms/ads/identifier/d$$ExternalSyntheticApiModelOutline0;->m(Landroid/graphics/SurfaceTexture;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 109
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surface:Landroid/view/Surface;

    return-object v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 80
    iget v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->bufferWidth:I

    return v0
.end method

.method public isReleased()Z
    .locals 1

    .line 92
    iget-object v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public release()V
    .locals 2

    const/4 v0, 0x0

    .line 97
    iput-object v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 98
    iget-object v1, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surface:Landroid/view/Surface;

    if-eqz v1, :cond_0

    .line 99
    invoke-virtual {v1}, Landroid/view/Surface;->release()V

    .line 100
    iput-object v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surface:Landroid/view/Surface;

    :cond_0
    return-void
.end method

.method public resize(II)V
    .locals 1

    .line 72
    iput p1, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->bufferWidth:I

    .line 73
    iput p2, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->bufferHeight:I

    .line 74
    iget-object v0, p0, Lio/flutter/plugin/platform/SurfaceTexturePlatformViewRenderTarget;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {v0, p1, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    :cond_0
    return-void
.end method

.method public synthetic scheduleFrame()V
    .locals 0

    invoke-static {p0}, Lio/flutter/plugin/platform/PlatformViewRenderTarget$-CC;->$default$scheduleFrame(Lio/flutter/plugin/platform/PlatformViewRenderTarget;)V

    return-void
.end method
