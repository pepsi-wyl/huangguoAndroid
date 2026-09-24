.class public Lio/flutter/plugin/common/ErrorLogResult;
.super Ljava/lang/Object;
.source "ErrorLogResult.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$Result;


# instance fields
.field private level:I

.field private tag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 19
    sget v0, Lio/flutter/Log;->WARN:I

    invoke-direct {p0, p1, v0}, Lio/flutter/plugin/common/ErrorLogResult;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lio/flutter/plugin/common/ErrorLogResult;->tag:Ljava/lang/String;

    .line 24
    iput p2, p0, Lio/flutter/plugin/common/ErrorLogResult;->level:I

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    if-eqz p3, :cond_0

    .line 33
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, " details: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    .line 34
    :goto_0
    iget p3, p0, Lio/flutter/plugin/common/ErrorLogResult;->level:I

    sget v0, Lio/flutter/Log;->WARN:I

    if-ge p3, v0, :cond_1

    goto :goto_1

    .line 35
    :cond_1
    iget p3, p0, Lio/flutter/plugin/common/ErrorLogResult;->level:I

    iget-object v0, p0, Lio/flutter/plugin/common/ErrorLogResult;->tag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, v0, p1}, Lio/flutter/Log;->println(ILjava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public notImplemented()V
    .locals 3

    .line 41
    iget v0, p0, Lio/flutter/plugin/common/ErrorLogResult;->level:I

    sget v1, Lio/flutter/Log;->WARN:I

    if-ge v0, v1, :cond_0

    goto :goto_0

    .line 42
    :cond_0
    iget v0, p0, Lio/flutter/plugin/common/ErrorLogResult;->level:I

    iget-object v1, p0, Lio/flutter/plugin/common/ErrorLogResult;->tag:Ljava/lang/String;

    const-string v2, "method not implemented"

    invoke-static {v0, v1, v2}, Lio/flutter/Log;->println(ILjava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public success(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method
