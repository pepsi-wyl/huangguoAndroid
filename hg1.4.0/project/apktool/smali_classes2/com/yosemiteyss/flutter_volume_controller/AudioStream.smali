.class public final enum Lcom/yosemiteyss/flutter_volume_controller/AudioStream;
.super Ljava/lang/Enum;
.source "AudioStream.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yosemiteyss/flutter_volume_controller/AudioStream$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/yosemiteyss/flutter_volume_controller/AudioStream;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0008\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u0011\u0010\u0003\u001a\u00020\u00048F\u00a2\u0006\u0006\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/yosemiteyss/flutter_volume_controller/AudioStream;",
        "",
        "(Ljava/lang/String;I)V",
        "streamType",
        "",
        "getStreamType",
        "()I",
        "VOICE_CALL",
        "SYSTEM",
        "RING",
        "MUSIC",
        "ALARM",
        "flutter_volume_controller_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

.field public static final enum ALARM:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

.field public static final enum MUSIC:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

.field public static final enum RING:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

.field public static final enum SYSTEM:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

.field public static final enum VOICE_CALL:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;


# direct methods
.method private static final synthetic $values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;
    .locals 3

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    sget-object v1, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->VOICE_CALL:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->SYSTEM:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->RING:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->MUSIC:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->ALARM:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 6
    new-instance v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    const-string v1, "VOICE_CALL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->VOICE_CALL:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    .line 7
    new-instance v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    const-string v1, "SYSTEM"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->SYSTEM:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    .line 8
    new-instance v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    const-string v1, "RING"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->RING:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    .line 9
    new-instance v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    const-string v1, "MUSIC"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->MUSIC:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    .line 10
    new-instance v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    const-string v1, "ALARM"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->ALARM:Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    invoke-static {}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->$values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    move-result-object v0

    sput-object v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->$VALUES:[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/yosemiteyss/flutter_volume_controller/AudioStream;
    .locals 1

    const-class v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    return-object p0
.end method

.method public static values()[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;
    .locals 1

    sget-object v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->$VALUES:[Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/yosemiteyss/flutter_volume_controller/AudioStream;

    return-object v0
.end method


# virtual methods
.method public final getStreamType()I
    .locals 3

    .line 14
    sget-object v0, Lcom/yosemiteyss/flutter_volume_controller/AudioStream$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p0}, Lcom/yosemiteyss/flutter_volume_controller/AudioStream;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_3

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v2, 0x4

    if-eq v0, v2, :cond_3

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    .line 19
    :cond_0
    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    :cond_1
    const/4 v1, 0x2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :cond_3
    :goto_0
    return v1
.end method
