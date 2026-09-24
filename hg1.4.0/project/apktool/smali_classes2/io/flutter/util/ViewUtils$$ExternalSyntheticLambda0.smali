.class public final synthetic Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lio/flutter/util/ViewUtils$ViewVisitor;


# instance fields
.field public final synthetic f$0:[Ljava/lang/Class;


# direct methods
.method public synthetic constructor <init>([Ljava/lang/Class;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda0;->f$0:[Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public final run(Landroid/view/View;)Z
    .locals 1

    .line 0
    iget-object v0, p0, Lio/flutter/util/ViewUtils$$ExternalSyntheticLambda0;->f$0:[Ljava/lang/Class;

    invoke-static {v0, p1}, Lio/flutter/util/ViewUtils;->lambda$hasChildViewOfType$1([Ljava/lang/Class;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
