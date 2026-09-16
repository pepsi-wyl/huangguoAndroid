.class public final Lio/flutter/util/HandlerCompat;
.super Ljava/lang/Object;
.source "HandlerCompat.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createAsyncHandler(Landroid/os/Looper;)Landroid/os/Handler;
    .locals 2

    .line 32
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 33
    invoke-static {p0}, Landroidx/tracing/Trace$$ExternalSyntheticApiModelOutline0;->m(Landroid/os/Looper;)Landroid/os/Handler;

    move-result-object p0

    return-object p0

    .line 35
    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-object v0
.end method
