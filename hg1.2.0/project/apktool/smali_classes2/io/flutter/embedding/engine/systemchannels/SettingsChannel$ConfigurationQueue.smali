.class public Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;
.super Ljava/lang/Object;
.source "SettingsChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/SettingsChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ConfigurationQueue"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;
    }
.end annotation


# instance fields
.field private currentConfiguration:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

.field private previousEnqueuedConfiguration:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

.field private final sentQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 176
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->sentQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    return-void
.end method

.method static synthetic access$200(Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;)Ljava/util/concurrent/ConcurrentLinkedQueue;
    .locals 0

    .line 175
    iget-object p0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->sentQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    return-object p0
.end method


# virtual methods
.method public enqueueConfiguration(Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;)Lio/flutter/plugin/common/BasicMessageChannel$Reply;
    .locals 1

    .line 234
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->sentQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 235
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->previousEnqueuedConfiguration:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    .line 236
    iput-object p1, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->previousEnqueuedConfiguration:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 239
    :cond_0
    new-instance p1, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$1;

    invoke-direct {p1, p0, v0}, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$1;-><init>(Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;)V

    :goto_0
    return-object p1
.end method

.method public getConfiguration(I)Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;
    .locals 4

    .line 192
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->currentConfiguration:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    if-nez v0, :cond_0

    .line 193
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->sentQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    iput-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->currentConfiguration:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    .line 198
    :cond_0
    :goto_0
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->currentConfiguration:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    if-eqz v0, :cond_1

    iget v0, v0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;->generationNumber:I

    if-ge v0, p1, :cond_1

    .line 200
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->sentQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    iput-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->currentConfiguration:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    goto :goto_0

    .line 203
    :cond_1
    iget-object v0, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->currentConfiguration:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    const/4 v1, 0x0

    const-string v2, "Cannot find config with generation: "

    const-string v3, "SettingsChannel"

    if-nez v0, :cond_2

    .line 204
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 207
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", after exhausting the queue."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 204
    invoke-static {v3, p1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 210
    :cond_2
    iget v0, v0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;->generationNumber:I

    if-eq v0, p1, :cond_3

    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 214
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", the oldest config is now: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->currentConfiguration:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    iget p1, p1, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;->generationNumber:I

    .line 216
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 211
    invoke-static {v3, p1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 219
    :cond_3
    iget-object p1, p0, Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue;->currentConfiguration:Lio/flutter/embedding/engine/systemchannels/SettingsChannel$ConfigurationQueue$SentConfiguration;

    return-object p1
.end method
