.class public final Lcom/yosemiteyss/flutter_volume_controller/MethodArg;
.super Ljava/lang/Object;
.source "Constants.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/yosemiteyss/flutter_volume_controller/MethodArg;",
        "",
        "()V",
        "AUDIO_STREAM",
        "",
        "EMIT_ON_START",
        "IS_MUTED",
        "SHOW_SYSTEM_UI",
        "STEP",
        "VOLUME",
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
.field public static final AUDIO_STREAM:Ljava/lang/String; = "audioStream"

.field public static final EMIT_ON_START:Ljava/lang/String; = "emitOnStart"

.field public static final INSTANCE:Lcom/yosemiteyss/flutter_volume_controller/MethodArg;

.field public static final IS_MUTED:Ljava/lang/String; = "isMuted"

.field public static final SHOW_SYSTEM_UI:Ljava/lang/String; = "showSystemUI"

.field public static final STEP:Ljava/lang/String; = "step"

.field public static final VOLUME:Ljava/lang/String; = "volume"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/yosemiteyss/flutter_volume_controller/MethodArg;

    invoke-direct {v0}, Lcom/yosemiteyss/flutter_volume_controller/MethodArg;-><init>()V

    sput-object v0, Lcom/yosemiteyss/flutter_volume_controller/MethodArg;->INSTANCE:Lcom/yosemiteyss/flutter_volume_controller/MethodArg;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
