.class public final Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private speed:Ljava/lang/Double;

.field private textureId:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 289
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage;
    .locals 2

    .line 306
    new-instance v0, Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage;

    invoke-direct {v0}, Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage;-><init>()V

    .line 307
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage$Builder;->textureId:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage;->setTextureId(Ljava/lang/Long;)V

    .line 308
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage$Builder;->speed:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage;->setSpeed(Ljava/lang/Double;)V

    return-object v0
.end method

.method public setSpeed(Ljava/lang/Double;)Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage$Builder;
    .locals 0

    .line 301
    iput-object p1, p0, Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage$Builder;->speed:Ljava/lang/Double;

    return-object p0
.end method

.method public setTextureId(Ljava/lang/Long;)Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage$Builder;
    .locals 0

    .line 294
    iput-object p1, p0, Lio/flutter/plugins/videoplayer/Messages$PlaybackSpeedMessage$Builder;->textureId:Ljava/lang/Long;

    return-object p0
.end method
