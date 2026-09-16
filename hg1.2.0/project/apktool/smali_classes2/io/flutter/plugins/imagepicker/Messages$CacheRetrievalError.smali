.class public final Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "CacheRetrievalError"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError$Builder;
    }
.end annotation


# instance fields
.field private code:Ljava/lang/String;

.field private message:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 521
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;"
        }
    .end annotation

    .line 558
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;

    invoke-direct {v0}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;-><init>()V

    const/4 v1, 0x0

    .line 559
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 560
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->setCode(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 561
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 562
    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->setMessage(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getCode()Ljava/lang/String;
    .locals 1

    .line 500
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->code:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 513
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->message:Ljava/lang/String;

    return-object v0
.end method

.method public setCode(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 507
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->code:Ljava/lang/String;

    return-void

    .line 505
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"code\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0

    .line 517
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->message:Ljava/lang/String;

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

    .line 551
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 552
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->code:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 553
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
