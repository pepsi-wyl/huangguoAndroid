.class Lio/flutter/embedding/engine/dart/DartMessenger$Reply;
.super Ljava/lang/Object;
.source "DartMessenger.java"

# interfaces
.implements Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/dart/DartMessenger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Reply"
.end annotation


# instance fields
.field private final done:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

.field private final replyId:I


# direct methods
.method constructor <init>(Lio/flutter/embedding/engine/FlutterJNI;I)V
    .locals 2

    .line 423
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 421
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lio/flutter/embedding/engine/dart/DartMessenger$Reply;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 424
    iput-object p1, p0, Lio/flutter/embedding/engine/dart/DartMessenger$Reply;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    .line 425
    iput p2, p0, Lio/flutter/embedding/engine/dart/DartMessenger$Reply;->replyId:I

    return-void
.end method


# virtual methods
.method public reply(Ljava/nio/ByteBuffer;)V
    .locals 3

    .line 430
    iget-object v0, p0, Lio/flutter/embedding/engine/dart/DartMessenger$Reply;->done:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p1, :cond_0

    .line 434
    iget-object p1, p0, Lio/flutter/embedding/engine/dart/DartMessenger$Reply;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    iget v0, p0, Lio/flutter/embedding/engine/dart/DartMessenger$Reply;->replyId:I

    invoke-virtual {p1, v0}, Lio/flutter/embedding/engine/FlutterJNI;->invokePlatformMessageEmptyResponseCallback(I)V

    goto :goto_0

    .line 436
    :cond_0
    iget-object v0, p0, Lio/flutter/embedding/engine/dart/DartMessenger$Reply;->flutterJNI:Lio/flutter/embedding/engine/FlutterJNI;

    iget v1, p0, Lio/flutter/embedding/engine/dart/DartMessenger$Reply;->replyId:I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    invoke-virtual {v0, v1, p1, v2}, Lio/flutter/embedding/engine/FlutterJNI;->invokePlatformMessageResponseCallback(ILjava/nio/ByteBuffer;I)V

    :goto_0
    return-void

    .line 431
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Reply already submitted"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
