.class final enum Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;
.super Ljava/lang/Enum;
.source "AudioPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ryanheise/just_audio/AudioPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "ProcessingState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

.field public static final enum buffering:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

.field public static final enum completed:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

.field public static final enum loading:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

.field public static final enum none:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

.field public static final enum ready:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;


# direct methods
.method private static synthetic $values()[Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;
    .locals 3

    const/4 v0, 0x5

    .line 1113
    new-array v0, v0, [Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->none:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->loading:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->buffering:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->ready:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->completed:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1114
    new-instance v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    const-string v1, "none"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->none:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    .line 1115
    new-instance v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    const-string v1, "loading"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->loading:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    .line 1116
    new-instance v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    const-string v1, "buffering"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->buffering:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    .line 1117
    new-instance v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    const-string v1, "ready"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->ready:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    .line 1118
    new-instance v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    const-string v1, "completed"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->completed:Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    .line 1113
    invoke-static {}, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->$values()[Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    move-result-object v0

    sput-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->$VALUES:[Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1113
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;
    .locals 1

    .line 1113
    const-class v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    return-object p0
.end method

.method public static values()[Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;
    .locals 1

    .line 1113
    sget-object v0, Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->$VALUES:[Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    invoke-virtual {v0}, [Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ryanheise/just_audio/AudioPlayer$ProcessingState;

    return-object v0
.end method
