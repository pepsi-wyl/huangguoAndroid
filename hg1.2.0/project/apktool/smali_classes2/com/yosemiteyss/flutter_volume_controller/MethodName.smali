.class public final Lcom/yosemiteyss/flutter_volume_controller/MethodName;
.super Ljava/lang/Object;
.source "Constants.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\t\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/yosemiteyss/flutter_volume_controller/MethodName;",
        "",
        "()V",
        "GET_ANDROID_AUDIO_STREAM",
        "",
        "GET_MUTE",
        "GET_VOLUME",
        "LOWER_VOLUME",
        "RAISE_VOLUME",
        "SET_ANDROID_AUDIO_STREAM",
        "SET_MUTE",
        "SET_VOLUME",
        "TOGGLE_MUTE",
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
.field public static final GET_ANDROID_AUDIO_STREAM:Ljava/lang/String; = "getAndroidAudioStream"

.field public static final GET_MUTE:Ljava/lang/String; = "getMute"

.field public static final GET_VOLUME:Ljava/lang/String; = "getVolume"

.field public static final INSTANCE:Lcom/yosemiteyss/flutter_volume_controller/MethodName;

.field public static final LOWER_VOLUME:Ljava/lang/String; = "lowerVolume"

.field public static final RAISE_VOLUME:Ljava/lang/String; = "raiseVolume"

.field public static final SET_ANDROID_AUDIO_STREAM:Ljava/lang/String; = "setAndroidAudioStream"

.field public static final SET_MUTE:Ljava/lang/String; = "setMute"

.field public static final SET_VOLUME:Ljava/lang/String; = "setVolume"

.field public static final TOGGLE_MUTE:Ljava/lang/String; = "toggleMute"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/yosemiteyss/flutter_volume_controller/MethodName;

    invoke-direct {v0}, Lcom/yosemiteyss/flutter_volume_controller/MethodName;-><init>()V

    sput-object v0, Lcom/yosemiteyss/flutter_volume_controller/MethodName;->INSTANCE:Lcom/yosemiteyss/flutter_volume_controller/MethodName;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
