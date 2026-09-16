.class Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;
.super Landroid/os/Handler;
.source "IjkMediaPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EventHandler"
.end annotation


# instance fields
.field private final mWeakPlayer:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ltv/danmaku/ijk/media/player/IjkMediaPlayer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Landroid/os/Looper;)V
    .locals 0

    .line 965
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 966
    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;->mWeakPlayer:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9

    .line 971
    iget-object v0, p0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$EventHandler;->mWeakPlayer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    if-eqz v0, :cond_11

    .line 972
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$000(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    goto/16 :goto_4

    .line 978
    :cond_0
    iget v1, p1, Landroid/os/Message;->what:I

    if-eqz v1, :cond_10

    const/4 v2, 0x1

    if-eq v1, v2, :cond_f

    const/4 v5, 0x2

    const/4 v6, 0x0

    if-eq v1, v5, :cond_e

    const/4 v5, 0x3

    if-eq v1, v5, :cond_a

    const/4 v3, 0x4

    if-eq v1, v3, :cond_9

    const/4 v3, 0x5

    if-eq v1, v3, :cond_8

    const/16 v3, 0x63

    if-eq v1, v3, :cond_6

    const/16 v2, 0x64

    if-eq v1, v2, :cond_4

    const/16 v2, 0xc8

    if-eq v1, v2, :cond_2

    const/16 v2, 0x2711

    if-eq v1, v2, :cond_1

    .line 1054
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown message type "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Ltv/danmaku/ijk/media/player/pragma/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 1047
    :cond_1
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$502(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)I

    .line 1048
    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-static {v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$602(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)I

    .line 1049
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$300(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    move-result p1

    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$400(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    move-result v1

    .line 1050
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$500(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    move-result v2

    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$600(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    move-result v3

    .line 1049
    invoke-virtual {v0, p1, v1, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->notifyOnVideoSizeChanged(IIII)V

    goto/16 :goto_3

    .line 1027
    :cond_2
    iget v1, p1, Landroid/os/Message;->arg1:I

    if-eq v1, v5, :cond_3

    goto :goto_0

    .line 1029
    :cond_3
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Info: MEDIA_INFO_VIDEO_RENDERING_START\n"

    invoke-static {v1, v2}, Ltv/danmaku/ijk/media/player/pragma/DebugLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1032
    :goto_0
    iget v1, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v0, v1, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->notifyOnInfo(II)Z

    return-void

    .line 1019
    :cond_4
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Error ("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Ltv/danmaku/ijk/media/player/pragma/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1020
    iget v1, p1, Landroid/os/Message;->arg1:I

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v0, v1, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->notifyOnError(II)Z

    move-result p1

    if-nez p1, :cond_5

    .line 1021
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->notifyOnCompletion()V

    .line 1023
    :cond_5
    invoke-static {v0, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$200(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Z)V

    return-void

    .line 1036
    :cond_6
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-nez v1, :cond_7

    const/4 p1, 0x0

    .line 1037
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->notifyOnTimedText(Ltv/danmaku/ijk/media/player/IjkTimedText;)V

    goto :goto_1

    .line 1039
    :cond_7
    new-instance v1, Ltv/danmaku/ijk/media/player/IjkTimedText;

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3, v6, v6, v2, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-direct {v1, v3, p1}, Ltv/danmaku/ijk/media/player/IjkTimedText;-><init>(Landroid/graphics/Rect;Ljava/lang/String;)V

    .line 1040
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->notifyOnTimedText(Ltv/danmaku/ijk/media/player/IjkTimedText;)V

    :goto_1
    return-void

    .line 1012
    :cond_8
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$302(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)I

    .line 1013
    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-static {v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$402(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;I)I

    .line 1014
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$300(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    move-result p1

    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$400(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    move-result v1

    .line 1015
    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$500(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    move-result v2

    invoke-static {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$600(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)I

    move-result v3

    .line 1014
    invoke-virtual {v0, p1, v1, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->notifyOnVideoSizeChanged(IIII)V

    return-void

    .line 1008
    :cond_9
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->notifyOnSeekComplete()V

    return-void

    .line 989
    :cond_a
    iget p1, p1, Landroid/os/Message;->arg1:I

    int-to-long v1, p1

    cmp-long p1, v1, v3

    if-gez p1, :cond_b

    move-wide v1, v3

    .line 995
    :cond_b
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getDuration()J

    move-result-wide v5

    const-wide/16 v7, 0x64

    cmp-long p1, v5, v3

    if-lez p1, :cond_c

    mul-long v1, v1, v7

    .line 997
    div-long v3, v1, v5

    :cond_c
    cmp-long p1, v3, v7

    if-ltz p1, :cond_d

    goto :goto_2

    :cond_d
    move-wide v7, v3

    :goto_2
    long-to-int p1, v7

    .line 1004
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->notifyOnBufferingUpdate(I)V

    return-void

    .line 984
    :cond_e
    invoke-static {v0, v6}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$200(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;Z)V

    .line 985
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->notifyOnCompletion()V

    return-void

    .line 980
    :cond_f
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->notifyOnPrepared()V

    :cond_10
    :goto_3
    return-void

    .line 973
    :cond_11
    :goto_4
    invoke-static {}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "IjkMediaPlayer went away with unhandled events"

    invoke-static {p1, v0}, Ltv/danmaku/ijk/media/player/pragma/DebugLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
