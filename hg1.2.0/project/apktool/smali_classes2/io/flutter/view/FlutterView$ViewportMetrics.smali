.class final Lio/flutter/view/FlutterView$ViewportMetrics;
.super Ljava/lang/Object;
.source "FlutterView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/view/FlutterView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ViewportMetrics"
.end annotation


# instance fields
.field devicePixelRatio:F

.field physicalHeight:I

.field physicalTouchSlop:I

.field physicalViewInsetBottom:I

.field physicalViewInsetLeft:I

.field physicalViewInsetRight:I

.field physicalViewInsetTop:I

.field physicalViewPaddingBottom:I

.field physicalViewPaddingLeft:I

.field physicalViewPaddingRight:I

.field physicalViewPaddingTop:I

.field physicalWidth:I

.field systemGestureInsetBottom:I

.field systemGestureInsetLeft:I

.field systemGestureInsetRight:I

.field systemGestureInsetTop:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 108
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->devicePixelRatio:F

    const/4 v0, 0x0

    .line 109
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->physicalWidth:I

    .line 110
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->physicalHeight:I

    .line 111
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->physicalViewPaddingTop:I

    .line 112
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->physicalViewPaddingRight:I

    .line 113
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->physicalViewPaddingBottom:I

    .line 114
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->physicalViewPaddingLeft:I

    .line 115
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->physicalViewInsetTop:I

    .line 116
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->physicalViewInsetRight:I

    .line 117
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->physicalViewInsetBottom:I

    .line 118
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->physicalViewInsetLeft:I

    .line 119
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->systemGestureInsetTop:I

    .line 120
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->systemGestureInsetRight:I

    .line 121
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->systemGestureInsetBottom:I

    .line 122
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->systemGestureInsetLeft:I

    const/4 v0, -0x1

    .line 123
    iput v0, p0, Lio/flutter/view/FlutterView$ViewportMetrics;->physicalTouchSlop:I

    return-void
.end method
