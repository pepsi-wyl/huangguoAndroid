.class public Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;
.super Ljava/lang/Object;
.source "SurfaceTextureWrapper.java"


# instance fields
.field private attached:Z

.field private newFrameAvailable:Z

.field private onFrameConsumed:Ljava/lang/Runnable;

.field private released:Z

.field private surfaceTexture:Landroid/graphics/SurfaceTexture;


# direct methods
.method public constructor <init>(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, v0}, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;-><init>(Landroid/graphics/SurfaceTexture;Ljava/lang/Runnable;)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/SurfaceTexture;Ljava/lang/Runnable;)V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->newFrameAvailable:Z

    .line 41
    iput-object p1, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 42
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->released:Z

    .line 43
    iput-object p2, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->onFrameConsumed:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public attachToGLContext(I)V
    .locals 1

    .line 90
    monitor-enter p0

    .line 91
    :try_start_0
    iget-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->released:Z

    if-eqz v0, :cond_0

    .line 92
    monitor-exit p0

    return-void

    .line 101
    :cond_0
    iget-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->attached:Z

    if-eqz v0, :cond_1

    .line 102
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->detachFromGLContext()V

    .line 104
    :cond_1
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p1}, Landroid/graphics/SurfaceTexture;->attachToGLContext(I)V

    const/4 p1, 0x1

    .line 105
    iput-boolean p1, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->attached:Z

    .line 106
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public detachFromGLContext()V
    .locals 1

    .line 112
    monitor-enter p0

    .line 113
    :try_start_0
    iget-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->attached:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->released:Z

    if-nez v0, :cond_0

    .line 114
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->detachFromGLContext()V

    const/4 v0, 0x0

    .line 115
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->attached:Z

    .line 117
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getTransformMatrix([F)V
    .locals 1

    .line 123
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, p1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    return-void
.end method

.method public markDirty()V
    .locals 1

    .line 52
    monitor-enter p0

    const/4 v0, 0x1

    .line 53
    :try_start_0
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->newFrameAvailable:Z

    .line 54
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public release()V
    .locals 1

    .line 78
    monitor-enter p0

    .line 79
    :try_start_0
    iget-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->released:Z

    if-nez v0, :cond_0

    .line 80
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    const/4 v0, 0x1

    .line 81
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->released:Z

    const/4 v0, 0x0

    .line 82
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->attached:Z

    .line 84
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public shouldUpdate()Z
    .locals 1

    .line 58
    monitor-enter p0

    .line 59
    :try_start_0
    iget-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->newFrameAvailable:Z

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    .line 60
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public surfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    .line 48
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object v0
.end method

.method public updateTexImage()V
    .locals 1

    .line 66
    monitor-enter p0

    const/4 v0, 0x0

    .line 67
    :try_start_0
    iput-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->newFrameAvailable:Z

    .line 68
    iget-boolean v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->released:Z

    if-nez v0, :cond_0

    .line 69
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->surfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 70
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/SurfaceTextureWrapper;->onFrameConsumed:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 71
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 74
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
