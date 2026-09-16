.class public final Lio/flutter/embedding/android/MotionEventTracker;
.super Ljava/lang/Object;
.source "MotionEventTracker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;
    }
.end annotation


# static fields
.field private static INSTANCE:Lio/flutter/embedding/android/MotionEventTracker; = null

.field private static final TAG:Ljava/lang/String; = "MotionEventTracker"


# instance fields
.field private final eventById:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Landroid/view/MotionEvent;",
            ">;"
        }
    .end annotation
.end field

.field private final unusedEvents:Ljava/util/PriorityQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/PriorityQueue<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/MotionEventTracker;->eventById:Landroid/util/LongSparseArray;

    .line 51
    new-instance v0, Ljava/util/PriorityQueue;

    invoke-direct {v0}, Ljava/util/PriorityQueue;-><init>()V

    iput-object v0, p0, Lio/flutter/embedding/android/MotionEventTracker;->unusedEvents:Ljava/util/PriorityQueue;

    return-void
.end method

.method public static getInstance()Lio/flutter/embedding/android/MotionEventTracker;
    .locals 1

    .line 43
    sget-object v0, Lio/flutter/embedding/android/MotionEventTracker;->INSTANCE:Lio/flutter/embedding/android/MotionEventTracker;

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Lio/flutter/embedding/android/MotionEventTracker;

    invoke-direct {v0}, Lio/flutter/embedding/android/MotionEventTracker;-><init>()V

    sput-object v0, Lio/flutter/embedding/android/MotionEventTracker;->INSTANCE:Lio/flutter/embedding/android/MotionEventTracker;

    .line 46
    :cond_0
    sget-object v0, Lio/flutter/embedding/android/MotionEventTracker;->INSTANCE:Lio/flutter/embedding/android/MotionEventTracker;

    return-object v0
.end method


# virtual methods
.method public pop(Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;)Landroid/view/MotionEvent;
    .locals 5

    .line 78
    :goto_0
    iget-object v0, p0, Lio/flutter/embedding/android/MotionEventTracker;->unusedEvents:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/flutter/embedding/android/MotionEventTracker;->unusedEvents:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {p1}, Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;->access$000(Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;)J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    .line 79
    iget-object v0, p0, Lio/flutter/embedding/android/MotionEventTracker;->eventById:Landroid/util/LongSparseArray;

    iget-object v1, p0, Lio/flutter/embedding/android/MotionEventTracker;->unusedEvents:Ljava/util/PriorityQueue;

    invoke-virtual {v1}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->remove(J)V

    goto :goto_0

    .line 83
    :cond_0
    iget-object v0, p0, Lio/flutter/embedding/android/MotionEventTracker;->unusedEvents:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/flutter/embedding/android/MotionEventTracker;->unusedEvents:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {p1}, Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;->access$000(Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;)J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    .line 84
    iget-object v0, p0, Lio/flutter/embedding/android/MotionEventTracker;->unusedEvents:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    .line 87
    :cond_1
    iget-object v0, p0, Lio/flutter/embedding/android/MotionEventTracker;->eventById:Landroid/util/LongSparseArray;

    invoke-static {p1}, Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;->access$000(Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MotionEvent;

    .line 88
    iget-object v1, p0, Lio/flutter/embedding/android/MotionEventTracker;->eventById:Landroid/util/LongSparseArray;

    invoke-static {p1}, Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;->access$000(Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/util/LongSparseArray;->remove(J)V

    return-object v0
.end method

.method public track(Landroid/view/MotionEvent;)Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;
    .locals 4

    .line 57
    invoke-static {}, Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;->createUnique()Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;

    move-result-object v0

    .line 64
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    .line 65
    iget-object v1, p0, Lio/flutter/embedding/android/MotionEventTracker;->eventById:Landroid/util/LongSparseArray;

    invoke-static {v0}, Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;->access$000(Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3, p1}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 66
    iget-object p1, p0, Lio/flutter/embedding/android/MotionEventTracker;->unusedEvents:Ljava/util/PriorityQueue;

    invoke-static {v0}, Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;->access$000(Lio/flutter/embedding/android/MotionEventTracker$MotionEventId;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
