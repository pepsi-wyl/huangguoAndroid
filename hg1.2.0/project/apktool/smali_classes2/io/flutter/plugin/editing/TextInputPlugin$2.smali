.class Lio/flutter/plugin/editing/TextInputPlugin$2;
.super Ljava/lang/Object;
.source "TextInputPlugin.java"

# interfaces
.implements Lio/flutter/plugin/editing/TextInputPlugin$MinMax;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugin/editing/TextInputPlugin;->saveEditableSizeAndTransform(DD[D)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/plugin/editing/TextInputPlugin;

.field final synthetic val$isAffine:Z

.field final synthetic val$matrix:[D

.field final synthetic val$minMax:[D


# direct methods
.method constructor <init>(Lio/flutter/plugin/editing/TextInputPlugin;Z[D[D)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 495
    iput-object p1, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->this$0:Lio/flutter/plugin/editing/TextInputPlugin;

    iput-boolean p2, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$isAffine:Z

    iput-object p3, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$matrix:[D

    iput-object p4, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$minMax:[D

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public inspect(DD)V
    .locals 10

    .line 498
    iget-boolean v0, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$isAffine:Z

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    const/4 v3, 0x3

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$matrix:[D

    aget-wide v4, v0, v3

    mul-double v4, v4, p1

    const/4 v6, 0x7

    aget-wide v6, v0, v6

    mul-double v6, v6, p3

    add-double/2addr v4, v6

    const/16 v6, 0xf

    aget-wide v6, v0, v6

    add-double/2addr v4, v6

    div-double/2addr v1, v4

    .line 499
    :goto_0
    iget-object v0, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$matrix:[D

    const/4 v4, 0x0

    aget-wide v5, v0, v4

    mul-double v5, v5, p1

    const/4 v7, 0x4

    aget-wide v7, v0, v7

    mul-double v7, v7, p3

    add-double/2addr v5, v7

    const/16 v7, 0xc

    aget-wide v7, v0, v7

    add-double/2addr v5, v7

    mul-double v5, v5, v1

    const/4 v7, 0x1

    .line 500
    aget-wide v8, v0, v7

    mul-double v8, v8, p1

    const/4 p1, 0x5

    aget-wide p1, v0, p1

    mul-double p1, p1, p3

    add-double/2addr v8, p1

    const/16 p1, 0xd

    aget-wide p1, v0, p1

    add-double/2addr v8, p1

    mul-double v8, v8, v1

    .line 502
    iget-object p1, p0, Lio/flutter/plugin/editing/TextInputPlugin$2;->val$minMax:[D

    aget-wide p2, p1, v4

    cmpg-double p4, v5, p2

    if-gez p4, :cond_1

    .line 503
    aput-wide v5, p1, v4

    goto :goto_1

    .line 504
    :cond_1
    aget-wide p2, p1, v7

    cmpl-double p4, v5, p2

    if-lez p4, :cond_2

    .line 505
    aput-wide v5, p1, v7

    :cond_2
    :goto_1
    const/4 p2, 0x2

    .line 508
    aget-wide p3, p1, p2

    cmpg-double v0, v8, p3

    if-gez v0, :cond_3

    .line 509
    aput-wide v8, p1, p2

    goto :goto_2

    .line 510
    :cond_3
    aget-wide p2, p1, v3

    cmpl-double p4, v8, p2

    if-lez p4, :cond_4

    .line 511
    aput-wide v8, p1, v3

    :cond_4
    :goto_2
    return-void
.end method
