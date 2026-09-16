.class public final Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private maxHeight:Ljava/lang/Double;

.field private maxWidth:Ljava/lang/Double;

.field private quality:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 247
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;
    .locals 2

    .line 274
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;

    invoke-direct {v0}, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;-><init>()V

    .line 275
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions$Builder;->maxWidth:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->setMaxWidth(Ljava/lang/Double;)V

    .line 276
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions$Builder;->maxHeight:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->setMaxHeight(Ljava/lang/Double;)V

    .line 277
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions$Builder;->quality:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->setQuality(Ljava/lang/Long;)V

    return-object v0
.end method

.method public setMaxHeight(Ljava/lang/Double;)Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions$Builder;
    .locals 0

    .line 261
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions$Builder;->maxHeight:Ljava/lang/Double;

    return-object p0
.end method

.method public setMaxWidth(Ljava/lang/Double;)Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions$Builder;
    .locals 0

    .line 253
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions$Builder;->maxWidth:Ljava/lang/Double;

    return-object p0
.end method

.method public setQuality(Ljava/lang/Long;)Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions$Builder;
    .locals 0

    .line 269
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions$Builder;->quality:Ljava/lang/Long;

    return-object p0
.end method
