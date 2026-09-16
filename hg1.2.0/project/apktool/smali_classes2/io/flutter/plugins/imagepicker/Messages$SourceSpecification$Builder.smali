.class public final Lio/flutter/plugins/imagepicker/Messages$SourceSpecification$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/Messages$SourceSpecification;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private camera:Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

.field private type:Lio/flutter/plugins/imagepicker/Messages$SourceType;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 445
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/imagepicker/Messages$SourceSpecification;
    .locals 2

    .line 464
    new-instance v0, Lio/flutter/plugins/imagepicker/Messages$SourceSpecification;

    invoke-direct {v0}, Lio/flutter/plugins/imagepicker/Messages$SourceSpecification;-><init>()V

    .line 465
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$SourceSpecification$Builder;->type:Lio/flutter/plugins/imagepicker/Messages$SourceType;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$SourceSpecification;->setType(Lio/flutter/plugins/imagepicker/Messages$SourceType;)V

    .line 466
    iget-object v1, p0, Lio/flutter/plugins/imagepicker/Messages$SourceSpecification$Builder;->camera:Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/Messages$SourceSpecification;->setCamera(Lio/flutter/plugins/imagepicker/Messages$SourceCamera;)V

    return-object v0
.end method

.method public setCamera(Lio/flutter/plugins/imagepicker/Messages$SourceCamera;)Lio/flutter/plugins/imagepicker/Messages$SourceSpecification$Builder;
    .locals 0

    .line 459
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$SourceSpecification$Builder;->camera:Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    return-object p0
.end method

.method public setType(Lio/flutter/plugins/imagepicker/Messages$SourceType;)Lio/flutter/plugins/imagepicker/Messages$SourceSpecification$Builder;
    .locals 0

    .line 451
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/Messages$SourceSpecification$Builder;->type:Lio/flutter/plugins/imagepicker/Messages$SourceType;

    return-object p0
.end method
