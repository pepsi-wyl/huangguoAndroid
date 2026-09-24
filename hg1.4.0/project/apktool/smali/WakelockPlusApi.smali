.class public interface abstract LWakelockPlusApi;
.super Ljava/lang/Object;
.source "WakelockPlusMessages.g.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LWakelockPlusApi$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008f\u0018\u0000 \u00082\u00020\u0001:\u0001\u0008J\u0008\u0010\u0002\u001a\u00020\u0003H&J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&\u00a8\u0006\t"
    }
    d2 = {
        "LWakelockPlusApi;",
        "",
        "isEnabled",
        "LIsEnabledMessage;",
        "toggle",
        "",
        "msg",
        "LToggleMessage;",
        "Companion",
        "wakelock_plus_release"
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
.field public static final Companion:LWakelockPlusApi$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, LWakelockPlusApi$Companion;->$$INSTANCE:LWakelockPlusApi$Companion;

    sput-object v0, LWakelockPlusApi;->Companion:LWakelockPlusApi$Companion;

    return-void
.end method


# virtual methods
.method public abstract isEnabled()LIsEnabledMessage;
.end method

.method public abstract toggle(LToggleMessage;)V
.end method
