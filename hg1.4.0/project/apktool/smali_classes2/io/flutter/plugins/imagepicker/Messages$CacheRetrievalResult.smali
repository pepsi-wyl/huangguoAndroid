.class public final Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CacheRetrievalResult"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;
    }
.end annotation


# instance fields
.field private error:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;

.field private paths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private type:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 618
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;"
        }
    .end annotation

    .line 665
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;

    invoke-direct {v0}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;-><init>()V

    const/4 v1, 0x0

    .line 666
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 667
    invoke-static {}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;->values()[Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    move-result-object v2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v1, v2, v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->setType(Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;)V

    const/4 v1, 0x1

    .line 668
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 670
    :cond_0
    check-cast v1, Ljava/util/ArrayList;

    invoke-static {v1}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;

    move-result-object v1

    .line 669
    :goto_0
    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->setError(Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;)V

    const/4 v1, 0x2

    .line 671
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 672
    check-cast p0, Ljava/util/List;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->setPaths(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public getError()Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;
    .locals 1

    .line 591
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->error:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;

    return-object v0
.end method

.method public getPaths()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 607
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->paths:Ljava/util/List;

    return-object v0
.end method

.method public getType()Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;
    .locals 1

    .line 577
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->type:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    return-object v0
.end method

.method public setError(Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;)V
    .locals 0

    .line 595
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->error:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;

    return-void
.end method

.method public setPaths(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 614
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->paths:Ljava/util/List;

    return-void

    .line 612
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"paths\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setType(Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 584
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->type:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    return-void

    .line 582
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"type\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method toList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 657
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 658
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->type:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move-object v1, v2

    goto :goto_0

    :cond_0
    iget v1, v1, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;->index:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 659
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->error:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->toList()Ljava/util/ArrayList;

    move-result-object v2

    :goto_1
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 660
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->paths:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
