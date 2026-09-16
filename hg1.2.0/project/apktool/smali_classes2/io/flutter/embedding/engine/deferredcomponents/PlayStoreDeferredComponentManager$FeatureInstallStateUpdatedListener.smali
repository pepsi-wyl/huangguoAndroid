.class Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;
.super Ljava/lang/Object;
.source "PlayStoreDeferredComponentManager.java"

# interfaces
.implements Lcom/google/android/play/core/splitinstall/SplitInstallStateUpdatedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FeatureInstallStateUpdatedListener"
.end annotation


# instance fields
.field final synthetic this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;


# direct methods
.method private constructor <init>(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)V
    .locals 0

    .line 67
    iput-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$1;)V
    .locals 0

    .line 67
    invoke-direct {p0, p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;-><init>(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)V

    return-void
.end method


# virtual methods
.method public onStateUpdate(Lcom/google/android/play/core/splitinstall/SplitInstallSessionState;)V
    .locals 9

    .line 70
    invoke-virtual {p1}, Lcom/google/android/play/core/splitinstall/SplitInstallSessionState;->sessionId()I

    move-result v0

    .line 71
    iget-object v1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {v1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 72
    invoke-virtual {p1}, Lcom/google/android/play/core/splitinstall/SplitInstallSessionState;->status()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x1

    const-string v5, "PlayStoreDeferredComponentManager"

    packed-switch v1, :pswitch_data_0

    .line 196
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unknown status: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/android/play/core/splitinstall/SplitInstallSessionState;->status()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 137
    :pswitch_0
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 141
    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    aput-object v1, v3, v4

    .line 139
    const-string p1, "Module \"%s\" (sessionId %d) install canceling."

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 137
    invoke-static {v5, p1}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$400(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    const-string v1, "canceling"

    invoke-virtual {p1, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 157
    :pswitch_1
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 161
    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    aput-object v1, v3, v4

    .line 159
    const-string p1, "Module \"%s\" (sessionId %d) install requires user confirmation."

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 157
    invoke-static {v5, p1}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$400(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    const-string v1, "requiresUserConfirmation"

    invoke-virtual {p1, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 120
    :pswitch_2
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 124
    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    aput-object v1, v3, v4

    .line 122
    const-string p1, "Module \"%s\" (sessionId %d) install canceled."

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 120
    invoke-static {v5, p1}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$300(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Lio/flutter/embedding/engine/systemchannels/DeferredComponentChannel;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 126
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$300(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Lio/flutter/embedding/engine/systemchannels/DeferredComponentChannel;

    move-result-object p1

    iget-object v1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 127
    invoke-static {v1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "Android Deferred Component installation canceled."

    .line 126
    invoke-virtual {p1, v1, v2}, Lio/flutter/embedding/engine/systemchannels/DeferredComponentChannel;->completeInstallError(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    :cond_0
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->delete(I)V

    .line 131
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$100(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseIntArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseIntArray;->delete(I)V

    .line 132
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$400(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    const-string v1, "cancelled"

    invoke-virtual {p1, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 75
    :pswitch_3
    iget-object v1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 79
    invoke-static {v1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p1}, Lcom/google/android/play/core/splitinstall/SplitInstallSessionState;->errorCode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v1, v8, v2

    aput-object v6, v8, v4

    aput-object v7, v8, v3

    .line 77
    const-string v1, "Module \"%s\" (sessionId %d) install failed with: %s"

    invoke-static {v1, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 75
    invoke-static {v5, v1}, Lio/flutter/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    iget-object v1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {v1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$200(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Lio/flutter/embedding/engine/FlutterJNI;

    move-result-object v1

    iget-object v2, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 81
    invoke-static {v2}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$100(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseIntArray;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Module install failed with "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    invoke-virtual {p1}, Lcom/google/android/play/core/splitinstall/SplitInstallSessionState;->errorCode()I

    move-result p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 80
    invoke-virtual {v1, v2, p1, v4}, Lio/flutter/embedding/engine/FlutterJNI;->deferredComponentInstallFailure(ILjava/lang/String;Z)V

    .line 84
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$300(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Lio/flutter/embedding/engine/systemchannels/DeferredComponentChannel;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 85
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$300(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Lio/flutter/embedding/engine/systemchannels/DeferredComponentChannel;

    move-result-object p1

    iget-object v1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 86
    invoke-static {v1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "Android Deferred Component failed to install."

    .line 85
    invoke-virtual {p1, v1, v2}, Lio/flutter/embedding/engine/systemchannels/DeferredComponentChannel;->completeInstallError(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    :cond_1
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->delete(I)V

    .line 90
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$100(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseIntArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseIntArray;->delete(I)V

    .line 91
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$400(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    const-string v1, "failed"

    invoke-virtual {p1, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 96
    :pswitch_4
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 100
    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    aput-object v1, v3, v4

    .line 98
    const-string p1, "Module \"%s\" (sessionId %d) install successfully."

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 96
    invoke-static {v5, p1}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$100(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseIntArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    iget-object v2, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {v2}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v1, v2}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->loadAssets(ILjava/lang/String;)V

    .line 106
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$100(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseIntArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseIntArray;->get(I)I

    move-result p1

    if-lez p1, :cond_2

    .line 107
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 108
    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$100(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseIntArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    iget-object v2, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {v2}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 107
    invoke-virtual {p1, v1, v2}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->loadDartLibrary(ILjava/lang/String;)V

    .line 110
    :cond_2
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$300(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Lio/flutter/embedding/engine/systemchannels/DeferredComponentChannel;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 111
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$300(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Lio/flutter/embedding/engine/systemchannels/DeferredComponentChannel;

    move-result-object p1

    iget-object v1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {v1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Lio/flutter/embedding/engine/systemchannels/DeferredComponentChannel;->completeInstallSuccess(Ljava/lang/String;)V

    .line 113
    :cond_3
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->delete(I)V

    .line 114
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$100(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseIntArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseIntArray;->delete(I)V

    .line 115
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$400(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    const-string v1, "installed"

    invoke-virtual {p1, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 187
    :pswitch_5
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 191
    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    aput-object v1, v3, v4

    .line 189
    const-string p1, "Module \"%s\" (sessionId %d) installing."

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 187
    invoke-static {v5, p1}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$400(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    const-string v1, "installing"

    invoke-virtual {p1, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 177
    :pswitch_6
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 181
    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    aput-object v1, v3, v4

    .line 179
    const-string p1, "Module \"%s\" (sessionId %d) downloaded."

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 177
    invoke-static {v5, p1}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$400(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    const-string v1, "downloaded"

    invoke-virtual {p1, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 167
    :pswitch_7
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 171
    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    aput-object v1, v3, v4

    .line 169
    const-string p1, "Module \"%s\" (sessionId %d) downloading."

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 167
    invoke-static {v5, p1}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$400(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    const-string v1, "downloading"

    invoke-virtual {p1, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 147
    :pswitch_8
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    .line 151
    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$000(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v2

    aput-object v1, v3, v4

    .line 149
    const-string p1, "Module \"%s\" (sessionId %d) install pending."

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 147
    invoke-static {v5, p1}, Lio/flutter/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    iget-object p1, p0, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->this$0:Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;

    invoke-static {p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;->access$400(Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager;)Landroid/util/SparseArray;

    move-result-object p1

    const-string v1, "pending"

    invoke-virtual {p1, v0, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_4
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onStateUpdate(Ljava/lang/Object;)V
    .locals 0

    .line 67
    check-cast p1, Lcom/google/android/play/core/splitinstall/SplitInstallSessionState;

    invoke-virtual {p0, p1}, Lio/flutter/embedding/engine/deferredcomponents/PlayStoreDeferredComponentManager$FeatureInstallStateUpdatedListener;->onStateUpdate(Lcom/google/android/play/core/splitinstall/SplitInstallSessionState;)V

    return-void
.end method
