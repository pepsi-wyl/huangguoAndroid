.class public final Ldev/fluttercommunity/plus/wakelock/Wakelock;
.super Ljava/lang/Object;
.source "Wakelock.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0000\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\r\u001a\u00020\u000eJ\u000e\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012R\u001c\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008R\u0014\u0010\t\u001a\u00020\n8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u0013"
    }
    d2 = {
        "Ldev/fluttercommunity/plus/wakelock/Wakelock;",
        "",
        "()V",
        "activity",
        "Landroid/app/Activity;",
        "getActivity",
        "()Landroid/app/Activity;",
        "setActivity",
        "(Landroid/app/Activity;)V",
        "enabled",
        "",
        "getEnabled",
        "()Z",
        "isEnabled",
        "LIsEnabledMessage;",
        "toggle",
        "",
        "message",
        "LToggleMessage;",
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


# instance fields
.field private activity:Landroid/app/Activity;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final getEnabled()Z
    .locals 1

    .line 12
    iget-object v0, p0, Ldev/fluttercommunity/plus/wakelock/Wakelock;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v0, v0, 0x80

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public final getActivity()Landroid/app/Activity;
    .locals 1

    .line 9
    iget-object v0, p0, Ldev/fluttercommunity/plus/wakelock/Wakelock;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method public final isEnabled()LIsEnabledMessage;
    .locals 2

    .line 31
    iget-object v0, p0, Ldev/fluttercommunity/plus/wakelock/Wakelock;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 35
    new-instance v0, LIsEnabledMessage;

    invoke-direct {p0}, Ldev/fluttercommunity/plus/wakelock/Wakelock;->getEnabled()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v0, v1}, LIsEnabledMessage;-><init>(Ljava/lang/Boolean;)V

    return-object v0

    .line 32
    :cond_0
    new-instance v0, Ldev/fluttercommunity/plus/wakelock/NoActivityException;

    invoke-direct {v0}, Ldev/fluttercommunity/plus/wakelock/NoActivityException;-><init>()V

    throw v0
.end method

.method public final setActivity(Landroid/app/Activity;)V
    .locals 0

    .line 9
    iput-object p1, p0, Ldev/fluttercommunity/plus/wakelock/Wakelock;->activity:Landroid/app/Activity;

    return-void
.end method

.method public final toggle(LToggleMessage;)V
    .locals 3

    const-string v0, "message"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    iget-object v0, p0, Ldev/fluttercommunity/plus/wakelock/Wakelock;->activity:Landroid/app/Activity;

    if-eqz v0, :cond_2

    .line 20
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 21
    invoke-direct {p0}, Ldev/fluttercommunity/plus/wakelock/Wakelock;->getEnabled()Z

    move-result v1

    .line 23
    invoke-virtual {p1}, LToggleMessage;->getEnable()Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const/16 v2, 0x80

    if-eqz p1, :cond_0

    if-nez v1, :cond_1

    .line 24
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/Window;->addFlags(I)V

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    .line 26
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/view/Window;->clearFlags(I)V

    :cond_1
    :goto_0
    return-void

    .line 17
    :cond_2
    new-instance p1, Ldev/fluttercommunity/plus/wakelock/NoActivityException;

    invoke-direct {p1}, Ldev/fluttercommunity/plus/wakelock/NoActivityException;-><init>()V

    throw p1
.end method
