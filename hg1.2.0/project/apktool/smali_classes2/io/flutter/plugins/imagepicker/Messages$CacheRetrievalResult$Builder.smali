.class public final Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
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
.method public constructor <init>()V
    .locals 0

    .line 620
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;
    .locals 2

    .line 647
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;

    invoke-direct {v0}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;-><init>()V

    .line 648
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;->type:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->setType(Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;)V

    .line 649
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;->error:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->setError(Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;)V

    .line 650
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;->paths:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;->setPaths(Ljava/util/List;)V

    return-object v0
.end method

.method public setError(Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;)Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;
    .locals 0

    .line 634
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;->error:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;

    return-object p0
.end method

.method public setPaths(Ljava/util/List;)Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;"
        }
    .end annotation

    .line 642
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;->paths:Ljava/util/List;

    return-object p0
.end method

.method public setType(Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;)Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;
    .locals 0

    .line 626
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult$Builder;->type:Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;

    return-object p0
.end method
