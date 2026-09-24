.class public final Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ImageSelectionOptions"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions$Builder;
    }
.end annotation


# instance fields
.field private maxHeight:Ljava/lang/Double;

.field private maxWidth:Ljava/lang/Double;

.field private quality:Ljava/lang/Long;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 245
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;"
        }
    .end annotation

    .line 292
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;

    invoke-direct {v0}, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;-><init>()V

    const/4 v1, 0x0

    .line 293
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 294
    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->setMaxWidth(Ljava/lang/Double;)V

    const/4 v1, 0x1

    .line 295
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 296
    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->setMaxHeight(Ljava/lang/Double;)V

    const/4 v1, 0x2

    .line 297
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_1

    .line 301
    :cond_0
    instance-of v1, p0, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long v1, p0

    goto :goto_0

    :cond_1
    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    :goto_0
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    .line 298
    :goto_1
    invoke-virtual {v0, p0}, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->setQuality(Ljava/lang/Long;)V

    return-object v0
.end method


# virtual methods
.method public getMaxHeight()Ljava/lang/Double;
    .locals 1

    .line 219
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->maxHeight:Ljava/lang/Double;

    return-object v0
.end method

.method public getMaxWidth()Ljava/lang/Double;
    .locals 1

    .line 208
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->maxWidth:Ljava/lang/Double;

    return-object v0
.end method

.method public getQuality()Ljava/lang/Long;
    .locals 1

    .line 234
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->quality:Ljava/lang/Long;

    return-object v0
.end method

.method public setMaxHeight(Ljava/lang/Double;)V
    .locals 0

    .line 223
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->maxHeight:Ljava/lang/Double;

    return-void
.end method

.method public setMaxWidth(Ljava/lang/Double;)V
    .locals 0

    .line 212
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->maxWidth:Ljava/lang/Double;

    return-void
.end method

.method public setQuality(Ljava/lang/Long;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 241
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->quality:Ljava/lang/Long;

    return-void

    .line 239
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"quality\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method toList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 284
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 285
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->maxWidth:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 286
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->maxHeight:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 287
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;->quality:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
