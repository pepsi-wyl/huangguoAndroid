.class public Landroidx/core/view/ViewStructureCompat;
.super Ljava/lang/Object;
.source "ViewStructureCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/view/ViewStructureCompat$Api23Impl;
    }
.end annotation


# instance fields
.field private final mWrappedObj:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Landroid/view/ViewStructure;)V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Landroidx/core/view/ViewStructureCompat;->mWrappedObj:Ljava/lang/Object;

    return-void
.end method

.method public static toViewStructureCompat(Landroid/view/ViewStructure;)Landroidx/core/view/ViewStructureCompat;
    .locals 1

    .line 51
    new-instance v0, Landroidx/core/view/ViewStructureCompat;

    invoke-direct {v0, p0}, Landroidx/core/view/ViewStructureCompat;-><init>(Landroid/view/ViewStructure;)V

    return-object v0
.end method


# virtual methods
.method public setClassName(Ljava/lang/String;)V
    .locals 2

    .line 101
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 102
    iget-object v0, p0, Landroidx/core/view/ViewStructureCompat;->mWrappedObj:Ljava/lang/Object;

    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/view/ViewStructure;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/core/view/ViewStructureCompat$Api23Impl;->setClassName(Landroid/view/ViewStructure;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public setContentDescription(Ljava/lang/CharSequence;)V
    .locals 2

    .line 117
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 118
    iget-object v0, p0, Landroidx/core/view/ViewStructureCompat;->mWrappedObj:Ljava/lang/Object;

    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/view/ViewStructure;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/core/view/ViewStructureCompat$Api23Impl;->setContentDescription(Landroid/view/ViewStructure;Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setDimens(IIIIII)V
    .locals 8

    .line 141
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 142
    iget-object v0, p0, Landroidx/core/view/ViewStructureCompat;->mWrappedObj:Ljava/lang/Object;

    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/view/ViewStructure;

    move-result-object v1

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-static/range {v1 .. v7}, Landroidx/core/view/ViewStructureCompat$Api23Impl;->setDimens(Landroid/view/ViewStructure;IIIIII)V

    :cond_0
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 2

    .line 85
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 86
    iget-object v0, p0, Landroidx/core/view/ViewStructureCompat;->mWrappedObj:Ljava/lang/Object;

    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/view/ViewStructure;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/core/view/ViewStructureCompat$Api23Impl;->setText(Landroid/view/ViewStructure;Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public toViewStructure()Landroid/view/ViewStructure;
    .locals 1

    .line 66
    iget-object v0, p0, Landroidx/core/view/ViewStructureCompat;->mWrappedObj:Ljava/lang/Object;

    invoke-static {v0}, Landroidx/core/util/HalfKt$$ExternalSyntheticApiModelOutline0;->m(Ljava/lang/Object;)Landroid/view/ViewStructure;

    move-result-object v0

    return-object v0
.end method
