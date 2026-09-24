.class public final synthetic Landroidx/media3/common/SimpleBasePlayer$$ExternalSyntheticLambda51;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Supplier;


# instance fields
.field public final synthetic f$0:Z

.field public final synthetic f$1:Landroidx/media3/common/SimpleBasePlayer$State;

.field public final synthetic f$2:I

.field public final synthetic f$3:J


# direct methods
.method public synthetic constructor <init>(ZLandroidx/media3/common/SimpleBasePlayer$State;IJ)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Landroidx/media3/common/SimpleBasePlayer$$ExternalSyntheticLambda51;->f$0:Z

    iput-object p2, p0, Landroidx/media3/common/SimpleBasePlayer$$ExternalSyntheticLambda51;->f$1:Landroidx/media3/common/SimpleBasePlayer$State;

    iput p3, p0, Landroidx/media3/common/SimpleBasePlayer$$ExternalSyntheticLambda51;->f$2:I

    iput-wide p4, p0, Landroidx/media3/common/SimpleBasePlayer$$ExternalSyntheticLambda51;->f$3:J

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 5

    .line 0
    iget-boolean v0, p0, Landroidx/media3/common/SimpleBasePlayer$$ExternalSyntheticLambda51;->f$0:Z

    iget-object v1, p0, Landroidx/media3/common/SimpleBasePlayer$$ExternalSyntheticLambda51;->f$1:Landroidx/media3/common/SimpleBasePlayer$State;

    iget v2, p0, Landroidx/media3/common/SimpleBasePlayer$$ExternalSyntheticLambda51;->f$2:I

    iget-wide v3, p0, Landroidx/media3/common/SimpleBasePlayer$$ExternalSyntheticLambda51;->f$3:J

    invoke-static {v0, v1, v2, v3, v4}, Landroidx/media3/common/SimpleBasePlayer;->lambda$seekTo$10(ZLandroidx/media3/common/SimpleBasePlayer$State;IJ)Landroidx/media3/common/SimpleBasePlayer$State;

    move-result-object v0

    return-object v0
.end method
