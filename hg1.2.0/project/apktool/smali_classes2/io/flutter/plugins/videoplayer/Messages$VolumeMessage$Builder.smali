.class public final Lio/flutter/plugins/videoplayer/Messages$VolumeMessage$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/videoplayer/Messages$VolumeMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private textureId:Ljava/lang/Long;

.field private volume:Ljava/lang/Double;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/videoplayer/Messages$VolumeMessage;
    .locals 2

    .line 233
    new-instance v0, Lio/flutter/plugins/videoplayer/Messages$VolumeMessage;

    invoke-direct {v0}, Lio/flutter/plugins/videoplayer/Messages$VolumeMessage;-><init>()V

    .line 234
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/Messages$VolumeMessage$Builder;->textureId:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/videoplayer/Messages$VolumeMessage;->setTextureId(Ljava/lang/Long;)V

    .line 235
    iget-object v1, p0, Lio/flutter/plugins/videoplayer/Messages$VolumeMessage$Builder;->volume:Ljava/lang/Double;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/videoplayer/Messages$VolumeMessage;->setVolume(Ljava/lang/Double;)V

    return-object v0
.end method

.method public setTextureId(Ljava/lang/Long;)Lio/flutter/plugins/videoplayer/Messages$VolumeMessage$Builder;
    .locals 0

    .line 221
    iput-object p1, p0, Lio/flutter/plugins/videoplayer/Messages$VolumeMessage$Builder;->textureId:Ljava/lang/Long;

    return-object p0
.end method

.method public setVolume(Ljava/lang/Double;)Lio/flutter/plugins/videoplayer/Messages$VolumeMessage$Builder;
    .locals 0

    .line 228
    iput-object p1, p0, Lio/flutter/plugins/videoplayer/Messages$VolumeMessage$Builder;->volume:Ljava/lang/Double;

    return-object p0
.end method
