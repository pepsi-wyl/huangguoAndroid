.class synthetic Lcom/ryanheise/just_audio/AudioPlayer$2;
.super Ljava/lang/Object;
.source "AudioPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ryanheise/just_audio/AudioPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$ryanheise$just_audio$AudioPlayer$ProcessingState:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 744
    invoke-static {}, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->values()[Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/ryanheise/just_audio/AudioPlayer$2;->$SwitchMap$com$ryanheise$just_audio$AudioPlayer$ProcessingState:[I

    :try_start_0
    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->none:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    invoke-virtual {v1}, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/ryanheise/just_audio/AudioPlayer$2;->$SwitchMap$com$ryanheise$just_audio$AudioPlayer$ProcessingState:[I

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->loading:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    invoke-virtual {v1}, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    return-void
.end method
