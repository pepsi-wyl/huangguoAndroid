.class Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;
.super Landroid/view/ViewGroup;
.source "SingleViewFakeWindowViewGroup.java"


# instance fields
.field private final childRect:Landroid/graphics/Rect;

.field private final viewBounds:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 31
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->viewBounds:Landroid/graphics/Rect;

    .line 32
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->childRect:Landroid/graphics/Rect;

    return-void
.end method

.method private static atMost(I)I
    .locals 1

    .line 63
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p0

    const/high16 v0, -0x80000000

    invoke-static {p0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p0

    return p0
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .locals 10

    const/4 p1, 0x0

    .line 37
    :goto_0
    invoke-virtual {p0}, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 38
    invoke-virtual {p0, p1}, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager$LayoutParams;

    .line 40
    iget-object v2, p0, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->viewBounds:Landroid/graphics/Rect;

    invoke-virtual {v2, p2, p3, p4, p5}, Landroid/graphics/Rect;->set(IIII)V

    .line 41
    iget v3, v1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 43
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    .line 44
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    iget-object v6, p0, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->viewBounds:Landroid/graphics/Rect;

    iget v7, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    iget v8, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v9, p0, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->childRect:Landroid/graphics/Rect;

    .line 41
    invoke-static/range {v3 .. v9}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;IILandroid/graphics/Rect;)V

    .line 49
    iget-object v1, p0, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->childRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->childRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    iget-object v3, p0, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->childRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    iget-object v4, p0, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->childRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 4

    const/4 v0, 0x0

    .line 55
    :goto_0
    invoke-virtual {p0}, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 56
    invoke-virtual {p0, v0}, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 57
    invoke-static {p1}, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->atMost(I)I

    move-result v2

    invoke-static {p2}, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;->atMost(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/view/View;->measure(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 59
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    return-void
.end method
