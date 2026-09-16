.class public final synthetic Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/videoplayer/VideoPlayer;

.field public final synthetic f$1:F


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/videoplayer/VideoPlayer;F)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/videoplayer/VideoPlayer;

    iput p2, p0, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda0;->f$1:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda0;->f$0:Lio/flutter/plugins/videoplayer/VideoPlayer;

    iget v1, p0, Lio/flutter/plugins/videoplayer/VideoPlayer$$ExternalSyntheticLambda0;->f$1:F

    invoke-virtual {v0, v1}, Lio/flutter/plugins/videoplayer/VideoPlayer;->lambda$setBrightness$4$io-flutter-plugins-videoplayer-VideoPlayer(F)V

    return-void
.end method
