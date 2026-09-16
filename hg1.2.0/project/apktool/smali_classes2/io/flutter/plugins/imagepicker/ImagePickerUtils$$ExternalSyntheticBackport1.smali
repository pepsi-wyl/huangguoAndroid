.class public final synthetic Lio/flutter/plugins/imagepicker/ImagePickerUtils$$ExternalSyntheticBackport1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"


# direct methods
.method public static synthetic m(J)I
    .locals 4

    .line 0
    long-to-int v0, p0

    int-to-long v1, v0

    cmp-long v3, p0, v1

    if-nez v3, :cond_0

    return v0

    :cond_0
    new-instance p0, Ljava/lang/ArithmeticException;

    invoke-direct {p0}, Ljava/lang/ArithmeticException;-><init>()V

    throw p0
.end method
