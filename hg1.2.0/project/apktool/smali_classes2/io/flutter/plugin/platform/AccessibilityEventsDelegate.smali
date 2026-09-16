.class Lio/flutter/plugin/platform/AccessibilityEventsDelegate;
.super Ljava/lang/Object;
.source "AccessibilityEventsDelegate.java"


# instance fields
.field private accessibilityBridge:Lio/flutter/view/AccessibilityBridge;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccessibilityHoverEvent(Landroid/view/MotionEvent;Z)Z
    .locals 1

    .line 48
    iget-object v0, p0, Lio/flutter/plugin/platform/AccessibilityEventsDelegate;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 51
    :cond_0
    invoke-virtual {v0, p1, p2}, Lio/flutter/view/AccessibilityBridge;->onAccessibilityHoverEvent(Landroid/view/MotionEvent;Z)Z

    move-result p1

    return p1
.end method

.method public requestSendAccessibilityEvent(Landroid/view/View;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 40
    iget-object v0, p0, Lio/flutter/plugin/platform/AccessibilityEventsDelegate;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 43
    :cond_0
    invoke-virtual {v0, p1, p2, p3}, Lio/flutter/view/AccessibilityBridge;->externalViewRequestSendAccessibilityEvent(Landroid/view/View;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method setAccessibilityBridge(Lio/flutter/view/AccessibilityBridge;)V
    .locals 0

    .line 59
    iput-object p1, p0, Lio/flutter/plugin/platform/AccessibilityEventsDelegate;->accessibilityBridge:Lio/flutter/view/AccessibilityBridge;

    return-void
.end method
