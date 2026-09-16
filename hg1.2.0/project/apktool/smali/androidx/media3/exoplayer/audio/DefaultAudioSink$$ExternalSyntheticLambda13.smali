.class public final synthetic Landroidx/media3/exoplayer/audio/DefaultAudioSink$$ExternalSyntheticLambda13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/media/AudioTrack;

.field public final synthetic f$1:Landroidx/media3/exoplayer/audio/AudioSink$Listener;

.field public final synthetic f$2:Landroid/os/Handler;

.field public final synthetic f$3:Landroidx/media3/exoplayer/audio/AudioSink$AudioTrackConfig;

.field public final synthetic f$4:Landroidx/media3/common/util/ConditionVariable;


# direct methods
.method public synthetic constructor <init>(Landroid/media/AudioTrack;Landroidx/media3/exoplayer/audio/AudioSink$Listener;Landroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioSink$AudioTrackConfig;Landroidx/media3/common/util/ConditionVariable;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$$ExternalSyntheticLambda13;->f$0:Landroid/media/AudioTrack;

    iput-object p2, p0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$$ExternalSyntheticLambda13;->f$1:Landroidx/media3/exoplayer/audio/AudioSink$Listener;

    iput-object p3, p0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$$ExternalSyntheticLambda13;->f$2:Landroid/os/Handler;

    iput-object p4, p0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$$ExternalSyntheticLambda13;->f$3:Landroidx/media3/exoplayer/audio/AudioSink$AudioTrackConfig;

    iput-object p5, p0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$$ExternalSyntheticLambda13;->f$4:Landroidx/media3/common/util/ConditionVariable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$$ExternalSyntheticLambda13;->f$0:Landroid/media/AudioTrack;

    iget-object v1, p0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$$ExternalSyntheticLambda13;->f$1:Landroidx/media3/exoplayer/audio/AudioSink$Listener;

    iget-object v2, p0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$$ExternalSyntheticLambda13;->f$2:Landroid/os/Handler;

    iget-object v3, p0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$$ExternalSyntheticLambda13;->f$3:Landroidx/media3/exoplayer/audio/AudioSink$AudioTrackConfig;

    iget-object v4, p0, Landroidx/media3/exoplayer/audio/DefaultAudioSink$$ExternalSyntheticLambda13;->f$4:Landroidx/media3/common/util/ConditionVariable;

    invoke-static {v0, v1, v2, v3, v4}, Landroidx/media3/exoplayer/audio/DefaultAudioSink;->lambda$releaseAudioTrackAsync$1(Landroid/media/AudioTrack;Landroidx/media3/exoplayer/audio/AudioSink$Listener;Landroid/os/Handler;Landroidx/media3/exoplayer/audio/AudioSink$AudioTrackConfig;Landroidx/media3/common/util/ConditionVariable;)V

    return-void
.end method
