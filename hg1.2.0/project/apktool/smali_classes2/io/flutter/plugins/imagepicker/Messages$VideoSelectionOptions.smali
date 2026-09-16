.class public final Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VideoSelectionOptions"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions$Builder;
    }
.end annotation


# instance fields
.field private maxDurationSeconds:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 364
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;"
        }
    .end annotation

    .line 401
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;

    invoke-direct {v0}, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;-><init>()V

    const/4 v1, 0x0

    .line 402
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_1

    .line 406
    :cond_0
    instance-of v1, p0, Ljava/lang/Integer;

    if-eqz v1, :cond_1

    .line 407
    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long v1, p0

    goto :goto_0

    .line 408
    :cond_1
    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 406
    :goto_0
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    .line 403
    :goto_1
    invoke-virtual {v0, p0}, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;->setMaxDurationSeconds(Ljava/lang/Long;)V

    return-object v0
.end method


# virtual methods
.method public getMaxDurationSeconds()Ljava/lang/Long;
    .locals 1

    .line 369
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;->maxDurationSeconds:Ljava/lang/Long;

    return-object v0
.end method

.method public setMaxDurationSeconds(Ljava/lang/Long;)V
    .locals 0

    .line 373
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;->maxDurationSeconds:Ljava/lang/Long;

    return-void
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

    .line 395
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 396
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;->maxDurationSeconds:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
