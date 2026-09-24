.class public Lio/flutter/embedding/android/KeyboardMap;
.super Ljava/lang/Object;
.source "KeyboardMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;,
        Lio/flutter/embedding/android/KeyboardMap$PressingGoal;,
        Lio/flutter/embedding/android/KeyboardMap$KeyPair;
    }
.end annotation


# static fields
.field public static final kAndroidPlane:J = 0x1100000000L

.field public static final kUnicodePlane:J = 0x0L

.field public static final kValueMask:J = 0xffffffffL

.field public static final keyCodeToLogical:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final pressingGoals:[Lio/flutter/embedding/android/KeyboardMap$PressingGoal;

.field public static final scanCodeToPhysical:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 72
    new-instance v0, Lio/flutter/embedding/android/KeyboardMap$1;

    invoke-direct {v0}, Lio/flutter/embedding/android/KeyboardMap$1;-><init>()V

    sput-object v0, Lio/flutter/embedding/android/KeyboardMap;->scanCodeToPhysical:Ljava/util/HashMap;

    .line 313
    new-instance v0, Lio/flutter/embedding/android/KeyboardMap$2;

    invoke-direct {v0}, Lio/flutter/embedding/android/KeyboardMap$2;-><init>()V

    sput-object v0, Lio/flutter/embedding/android/KeyboardMap;->keyCodeToLogical:Ljava/util/HashMap;

    .line 581
    new-instance v0, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;

    new-instance v1, Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    const-wide/32 v2, 0x700e0

    const-wide v4, 0x200000100L

    invoke-direct {v1, v2, v3, v4, v5}, Lio/flutter/embedding/android/KeyboardMap$KeyPair;-><init>(JJ)V

    new-instance v2, Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    const-wide/32 v3, 0x700e4

    const-wide v5, 0x200000101L

    invoke-direct {v2, v3, v4, v5, v6}, Lio/flutter/embedding/android/KeyboardMap$KeyPair;-><init>(JJ)V

    const/4 v3, 0x2

    new-array v4, v3, [Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const/4 v1, 0x1

    aput-object v2, v4, v1

    const/16 v2, 0x1000

    invoke-direct {v0, v2, v4}, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;-><init>(I[Lio/flutter/embedding/android/KeyboardMap$KeyPair;)V

    new-instance v2, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;

    new-instance v4, Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    const-wide/32 v6, 0x700e1

    const-wide v8, 0x200000102L

    invoke-direct {v4, v6, v7, v8, v9}, Lio/flutter/embedding/android/KeyboardMap$KeyPair;-><init>(JJ)V

    new-instance v6, Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    const-wide/32 v7, 0x700e5

    const-wide v9, 0x200000103L

    invoke-direct {v6, v7, v8, v9, v10}, Lio/flutter/embedding/android/KeyboardMap$KeyPair;-><init>(JJ)V

    new-array v7, v3, [Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    aput-object v4, v7, v5

    aput-object v6, v7, v1

    invoke-direct {v2, v1, v7}, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;-><init>(I[Lio/flutter/embedding/android/KeyboardMap$KeyPair;)V

    new-instance v4, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;

    new-instance v6, Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    const-wide/32 v7, 0x700e2

    const-wide v9, 0x200000104L

    invoke-direct {v6, v7, v8, v9, v10}, Lio/flutter/embedding/android/KeyboardMap$KeyPair;-><init>(JJ)V

    new-instance v7, Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    const-wide/32 v8, 0x700e6

    const-wide v10, 0x200000105L

    invoke-direct {v7, v8, v9, v10, v11}, Lio/flutter/embedding/android/KeyboardMap$KeyPair;-><init>(JJ)V

    new-array v8, v3, [Lio/flutter/embedding/android/KeyboardMap$KeyPair;

    aput-object v6, v8, v5

    aput-object v7, v8, v1

    invoke-direct {v4, v3, v8}, Lio/flutter/embedding/android/KeyboardMap$PressingGoal;-><init>(I[Lio/flutter/embedding/android/KeyboardMap$KeyPair;)V

    const/4 v6, 0x3

    new-array v6, v6, [Lio/flutter/embedding/android/KeyboardMap$PressingGoal;

    aput-object v0, v6, v5

    aput-object v2, v6, v1

    aput-object v4, v6, v3

    sput-object v6, Lio/flutter/embedding/android/KeyboardMap;->pressingGoals:[Lio/flutter/embedding/android/KeyboardMap$PressingGoal;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getTogglingGoals()[Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;
    .locals 7

    .line 610
    new-instance v6, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;

    const-wide/32 v2, 0x70039

    const-wide v4, 0x100000104L

    const/high16 v1, 0x100000

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;-><init>(IJJ)V

    const/4 v0, 0x1

    new-array v0, v0, [Lio/flutter/embedding/android/KeyboardMap$TogglingGoal;

    const/4 v1, 0x0

    aput-object v6, v0, v1

    return-object v0
.end method
