.class public final Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private maxDurationSeconds:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 376
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;
    .locals 2

    .line 387
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;

    invoke-direct {v0}, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;-><init>()V

    .line 388
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions$Builder;->maxDurationSeconds:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;->setMaxDurationSeconds(Ljava/lang/Long;)V

    return-object v0
.end method

.method public setMaxDurationSeconds(Ljava/lang/Long;)Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions$Builder;
    .locals 0

    .line 382
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions$Builder;->maxDurationSeconds:Ljava/lang/Long;

    return-object p0
.end method
