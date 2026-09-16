.class final Lio/flutter/plugin/common/BasicMessageChannel$IncomingReplyHandler;
.super Ljava/lang/Object;
.source "BasicMessageChannel.java"

# interfaces
.implements Lio/flutter/plugin/common/BinaryMessenger$BinaryReply;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugin/common/BasicMessageChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "IncomingReplyHandler"
.end annotation


# instance fields
.field private final callback:Lio/flutter/plugin/common/BasicMessageChannel$Reply;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/flutter/plugin/common/BasicMessageChannel$Reply<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lio/flutter/plugin/common/BasicMessageChannel;


# direct methods
.method private constructor <init>(Lio/flutter/plugin/common/BasicMessageChannel;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugin/common/BasicMessageChannel$Reply<",
            "TT;>;)V"
        }
    .end annotation

    .line 237
    iput-object p1, p0, Lio/flutter/plugin/common/BasicMessageChannel$IncomingReplyHandler;->this$0:Lio/flutter/plugin/common/BasicMessageChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 238
    iput-object p2, p0, Lio/flutter/plugin/common/BasicMessageChannel$IncomingReplyHandler;->callback:Lio/flutter/plugin/common/BasicMessageChannel$Reply;

    return-void
.end method

.method synthetic constructor <init>(Lio/flutter/plugin/common/BasicMessageChannel;Lio/flutter/plugin/common/BasicMessageChannel$Reply;Lio/flutter/plugin/common/BasicMessageChannel$1;)V
    .locals 0

    .line 234
    invoke-direct {p0, p1, p2}, Lio/flutter/plugin/common/BasicMessageChannel$IncomingReplyHandler;-><init>(Lio/flutter/plugin/common/BasicMessageChannel;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    return-void
.end method


# virtual methods
.method public reply(Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 244
    :try_start_0
    iget-object v0, p0, Lio/flutter/plugin/common/BasicMessageChannel$IncomingReplyHandler;->callback:Lio/flutter/plugin/common/BasicMessageChannel$Reply;

    iget-object v1, p0, Lio/flutter/plugin/common/BasicMessageChannel$IncomingReplyHandler;->this$0:Lio/flutter/plugin/common/BasicMessageChannel;

    invoke-static {v1}, Lio/flutter/plugin/common/BasicMessageChannel;->access$200(Lio/flutter/plugin/common/BasicMessageChannel;)Lio/flutter/plugin/common/MessageCodec;

    move-result-object v1

    invoke-interface {v1, p1}, Lio/flutter/plugin/common/MessageCodec;->decodeMessage(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 246
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "BasicMessageChannel#"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/flutter/plugin/common/BasicMessageChannel$IncomingReplyHandler;->this$0:Lio/flutter/plugin/common/BasicMessageChannel;

    invoke-static {v1}, Lio/flutter/plugin/common/BasicMessageChannel;->access$300(Lio/flutter/plugin/common/BasicMessageChannel;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Failed to handle message reply"

    invoke-static {v0, v1, p1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
