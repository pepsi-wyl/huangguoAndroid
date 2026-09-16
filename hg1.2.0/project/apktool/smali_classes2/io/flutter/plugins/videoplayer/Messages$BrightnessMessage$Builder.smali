.class public final Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private brightness:Ljava/lang/Double;

.field private textureId:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 617
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage;
    .locals 2

    .line 634
    new-instance v0, Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage;

    invoke-direct {v0}, Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage;-><init>()V

    .line 635
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage$Builder;->textureId:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage;->setTextureId(Ljava/lang/Long;)V

    .line 636
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage$Builder;->brightness:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage;->setBrightness(Ljava/lang/Double;)V

    return-object v0
.end method

.method public setBrightness(Ljava/lang/Double;)Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage$Builder;
    .locals 0

    .line 629
    iput-object p1, p0, Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage$Builder;->brightness:Ljava/lang/Double;

    return-object p0
.end method

.method public setTextureId(Ljava/lang/Long;)Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage$Builder;
    .locals 0

    .line 622
    iput-object p1, p0, Lio/flutter/plugins/videoplayer/Messages$BrightnessMessage$Builder;->textureId:Ljava/lang/Long;

    return-object p0
.end method
