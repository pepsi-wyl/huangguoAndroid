.class public final synthetic Lio/flutter/plugin/common/BinaryMessenger$-CC;
.super Ljava/lang/Object;
.source "BinaryMessenger.java"


# direct methods
.method public static $default$disableBufferingIncomingMessages(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 2
    .param p0, "_this"    # Lio/flutter/plugin/common/BinaryMessenger;

    .line 169
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "disableBufferingIncomingMessages not implemented."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static $default$enableBufferingIncomingMessages(Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 2
    .param p0, "_this"    # Lio/flutter/plugin/common/BinaryMessenger;

    .line 160
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "enableBufferingIncomingMessages not implemented."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static $default$makeBackgroundTaskQueue(Lio/flutter/plugin/common/BinaryMessenger;)Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;
    .locals 1
    .param p0, "_this"    # Lio/flutter/plugin/common/BinaryMessenger;

    .line 68
    new-instance v0, Lio/flutter/plugin/common/BinaryMessenger$TaskQueueOptions;

    invoke-direct {v0}, Lio/flutter/plugin/common/BinaryMessenger$TaskQueueOptions;-><init>()V

    invoke-interface {p0, v0}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue(Lio/flutter/plugin/common/BinaryMessenger$TaskQueueOptions;)Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v0

    return-object v0
.end method

.method public static $default$makeBackgroundTaskQueue(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugin/common/BinaryMessenger$TaskQueueOptions;)Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;
    .locals 1
    .param p0, "_this"    # Lio/flutter/plugin/common/BinaryMessenger;

    .line 81
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "makeBackgroundTaskQueue not implemented."

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static $default$setMessageHandler(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V
    .locals 0
    .param p0, "_this"    # Lio/flutter/plugin/common/BinaryMessenger;

    .line 0
    if-nez p3, :cond_0

    .line 149
    invoke-interface {p0, p1, p2}, Lio/flutter/plugin/common/BinaryMessenger;->setMessageHandler(Ljava/lang/String;Lio/flutter/plugin/common/BinaryMessenger$BinaryMessageHandler;)V

    return-void

    .line 146
    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "setMessageHandler called with nonnull taskQueue is not supported."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
