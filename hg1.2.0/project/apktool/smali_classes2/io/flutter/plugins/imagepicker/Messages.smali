.class public Lio/flutter/plugins/imagepicker/Messages;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/imagepicker/Messages$FlutterError;,
        Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;,
        Lio/flutter/plugins/imagepicker/Messages$ImagePickerApiCodec;,
        Lio/flutter/plugins/imagepicker/Messages$VoidResult;,
        Lio/flutter/plugins/imagepicker/Messages$NullableResult;,
        Lio/flutter/plugins/imagepicker/Messages$Result;,
        Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;,
        Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalError;,
        Lio/flutter/plugins/imagepicker/Messages$SourceSpecification;,
        Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;,
        Lio/flutter/plugins/imagepicker/Messages$MediaSelectionOptions;,
        Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;,
        Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;,
        Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalType;,
        Lio/flutter/plugins/imagepicker/Messages$SourceType;,
        Lio/flutter/plugins/imagepicker/Messages$SourceCamera;,
        Lio/flutter/plugins/imagepicker/Messages$CanIgnoreReturnValue;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 49
    instance-of v1, p0, Lio/flutter/plugins/imagepicker/Messages$FlutterError;

    if-eqz v1, :cond_0

    .line 50
    check-cast p0, Lio/flutter/plugins/imagepicker/Messages$FlutterError;

    .line 51
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$FlutterError;->code:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    invoke-virtual {p0}, Lio/flutter/plugins/imagepicker/Messages$FlutterError;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    iget-object p0, p0, Lio/flutter/plugins/imagepicker/Messages$FlutterError;->details:Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 55
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Cause: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", Stacktrace: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_0
    return-object v0
.end method
