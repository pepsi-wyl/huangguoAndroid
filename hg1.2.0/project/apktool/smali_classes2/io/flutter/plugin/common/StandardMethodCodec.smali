.class public final Lio/flutter/plugin/common/StandardMethodCodec;
.super Ljava/lang/Object;
.source "StandardMethodCodec.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodCodec;


# static fields
.field public static final INSTANCE:Lio/flutter/plugin/common/StandardMethodCodec;


# instance fields
.field private final messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 24
    new-instance v0, Lio/flutter/plugin/common/StandardMethodCodec;

    sget-object v1, Lio/flutter/plugin/common/StandardMessageCodec;->INSTANCE:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-direct {v0, v1}, Lio/flutter/plugin/common/StandardMethodCodec;-><init>(Lio/flutter/plugin/common/StandardMessageCodec;)V

    sput-object v0, Lio/flutter/plugin/common/StandardMethodCodec;->INSTANCE:Lio/flutter/plugin/common/StandardMethodCodec;

    return-void
.end method

.method public constructor <init>(Lio/flutter/plugin/common/StandardMessageCodec;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    return-void
.end method


# virtual methods
.method public decodeEnvelope(Ljava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 4

    .line 110
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 111
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    goto :goto_0

    .line 115
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v0

    .line 116
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-nez v1, :cond_1

    return-object v0

    .line 123
    :cond_1
    :goto_0
    iget-object v0, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v0

    .line 124
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    .line 125
    iget-object v2, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v2, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v2

    .line 126
    instance-of v3, v0, Ljava/lang/String;

    if-eqz v3, :cond_3

    if-eqz v1, :cond_2

    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_3

    .line 128
    :cond_2
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result p1

    if-nez p1, :cond_3

    .line 129
    new-instance p1, Lio/flutter/plugin/common/FlutterException;

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/lang/String;

    invoke-direct {p1, v0, v1, v2}, Lio/flutter/plugin/common/FlutterException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    throw p1

    .line 133
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Envelope corrupted"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public decodeMethodCall(Ljava/nio/ByteBuffer;)Lio/flutter/plugin/common/MethodCall;
    .locals 3

    .line 47
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 48
    iget-object v0, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v0

    .line 49
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object v1

    .line 50
    instance-of v2, v0, Ljava/lang/String;

    if-eqz v2, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result p1

    if-nez p1, :cond_0

    .line 51
    new-instance p1, Lio/flutter/plugin/common/MethodCall;

    check-cast v0, Ljava/lang/String;

    invoke-direct {p1, v0, v1}, Lio/flutter/plugin/common/MethodCall;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-object p1

    .line 53
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Method call corrupted"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public encodeErrorEnvelope(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/nio/ByteBuffer;
    .locals 2

    .line 71
    new-instance v0, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;

    invoke-direct {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;-><init>()V

    const/4 v1, 0x1

    .line 72
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->write(I)V

    .line 73
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, v0, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 74
    iget-object p1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {p1, v0, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 75
    instance-of p1, p3, Ljava/lang/Throwable;

    if-eqz p1, :cond_0

    .line 76
    iget-object p1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    check-cast p3, Ljava/lang/Throwable;

    invoke-static {p3}, Lio/flutter/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 78
    :cond_0
    iget-object p1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {p1, v0, p3}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 80
    :goto_0
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result p1

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 81
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->buffer()[B

    move-result-object p2

    const/4 p3, 0x0

    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result v0

    invoke-virtual {p1, p2, p3, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    return-object p1
.end method

.method public encodeErrorEnvelopeWithStacktrace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/nio/ByteBuffer;
    .locals 2

    .line 92
    new-instance v0, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;

    invoke-direct {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;-><init>()V

    const/4 v1, 0x1

    .line 93
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->write(I)V

    .line 94
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v1, v0, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 95
    iget-object p1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {p1, v0, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 96
    instance-of p1, p3, Ljava/lang/Throwable;

    if-eqz p1, :cond_0

    .line 97
    iget-object p1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    check-cast p3, Ljava/lang/Throwable;

    invoke-static {p3}, Lio/flutter/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 99
    :cond_0
    iget-object p1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {p1, v0, p3}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 101
    :goto_0
    iget-object p1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {p1, v0, p4}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 102
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result p1

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 103
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->buffer()[B

    move-result-object p2

    const/4 p3, 0x0

    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result p4

    invoke-virtual {p1, p2, p3, p4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    return-object p1
.end method

.method public encodeMethodCall(Lio/flutter/plugin/common/MethodCall;)Ljava/nio/ByteBuffer;
    .locals 3

    .line 36
    new-instance v0, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;

    invoke-direct {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;-><init>()V

    .line 37
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    iget-object v2, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 38
    iget-object v1, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    invoke-virtual {v1, v0, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 39
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result p1

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 40
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->buffer()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result v0

    invoke-virtual {p1, v1, v2, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    return-object p1
.end method

.method public encodeSuccessEnvelope(Ljava/lang/Object;)Ljava/nio/ByteBuffer;
    .locals 3

    .line 59
    new-instance v0, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;

    invoke-direct {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;-><init>()V

    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->write(I)V

    .line 61
    iget-object v2, p0, Lio/flutter/plugin/common/StandardMethodCodec;->messageCodec:Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-virtual {v2, v0, p1}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    .line 62
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result p1

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 63
    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->buffer()[B

    move-result-object v2

    invoke-virtual {v0}, Lio/flutter/plugin/common/StandardMessageCodec$ExposedByteArrayOutputStream;->size()I

    move-result v0

    invoke-virtual {p1, v2, v1, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    return-object p1
.end method
