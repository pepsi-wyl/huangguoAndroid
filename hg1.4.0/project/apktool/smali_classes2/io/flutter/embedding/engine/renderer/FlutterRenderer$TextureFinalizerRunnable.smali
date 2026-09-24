.class final Lio/flutter/embedding/engine/renderer/FlutterRenderer$TextureFinalizerRunnable;
.super Ljava/lang/Object;
.source "FlutterRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/renderer/FlutterRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TextureFinalizerRunnable"
.end annotation


# instance fields
.field private final flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

.field private final id:J


# direct methods
.method constructor <init>(JLio/flutter/embedding/engine/FlutterJNI;)V
    .locals 0

    .line 388
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 389
    iput-wide p1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$TextureFinalizerRunnable;->id:J

    .line 390
    iput-object p3, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$TextureFinalizerRunnable;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 395
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$TextureFinalizerRunnable;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    invoke-virtual {v0}, Lio/flutter/embedding/engine/FlutterJNI;->isAttached()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 398
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Releasing a Texture ("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$TextureFinalizerRunnable;->id:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ")."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "FlutterRenderer"

    invoke-static {v1, v0}, Lio/flutter/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    iget-object v0, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$TextureFinalizerRunnable;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    iget-wide v1, p0, Lio/flutter/embedding/engine/renderer/FlutterRenderer$TextureFinalizerRunnable;->id:J

    invoke-virtual {v0, v1, v2}, Lio/flutter/embedding/engine/FlutterJNI;->unregisterTexture(J)V

    return-void
.end method
