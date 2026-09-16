.class public final Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private code:Ljava/lang/String;

.field private message:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 523
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;
    .locals 2

    .line 542
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;

    invoke-direct {v0}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;-><init>()V

    .line 543
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError$Builder;->code:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->setCode(Ljava/lang/String;)V

    .line 544
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError$Builder;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;->setMessage(Ljava/lang/String;)V

    return-object v0
.end method

.method public setCode(Ljava/lang/String;)Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError$Builder;
    .locals 0

    .line 529
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError$Builder;->code:Ljava/lang/String;

    return-object p0
.end method

.method public setMessage(Ljava/lang/String;)Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError$Builder;
    .locals 0

    .line 537
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError$Builder;->message:Ljava/lang/String;

    return-object p0
.end method
