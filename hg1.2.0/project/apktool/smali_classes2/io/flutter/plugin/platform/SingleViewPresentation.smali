.class Lio/flutter/plugin/platform/SingleViewPresentation;
.super Landroid/app/Presentation;
.source "SingleViewPresentation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugin/platform/SingleViewPresentation$ImmContext;,
        Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;,
        Lio/flutter/plugin/platform/SingleViewPresentation$PresentationContext;,
        Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PlatformViewsController"


# instance fields
.field private final accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

.field private container:Landroid/widget/FrameLayout;

.field private final focusChangeListener:Landroid/view/View$OnFocusChangeListener;

.field private final outerContext:Landroid/content/Context;

.field private rootView:Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;

.field private startFocused:Z

.field private final state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

.field private viewId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/Display;Lio/flutter/plugin/platform/AccessibilityEventsDelegate;Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;Landroid/view/View$OnFocusChangeListener;Z)V
    .locals 1

    .line 131
    new-instance v0, Lio/flutter/plugin/platform/SingleViewPresentation$ImmContext;

    invoke-direct {v0, p1}, Lio/flutter/plugin/platform/SingleViewPresentation$ImmContext;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0, p2}, Landroid/app/Presentation;-><init>(Landroid/content/Context;Landroid/view/Display;)V

    const/4 p2, 0x0

    .line 89
    iput-boolean p2, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->startFocused:Z

    .line 132
    iput-object p3, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    .line 133
    iput-object p4, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    .line 134
    iput-object p5, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    .line 135
    iput-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->outerContext:Landroid/content/Context;

    .line 136
    invoke-virtual {p0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 p2, 0x8

    .line 137
    invoke-virtual {p1, p2, p2}, Landroid/view/Window;->setFlags(II)V

    .line 140
    iput-boolean p6, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->startFocused:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/Display;Lio/flutter/plugin/platform/PlatformView;Lio/flutter/plugin/platform/AccessibilityEventsDelegate;ILandroid/view/View$OnFocusChangeListener;)V
    .locals 1

    .line 105
    new-instance v0, Lio/flutter/plugin/platform/SingleViewPresentation$ImmContext;

    invoke-direct {v0, p1}, Lio/flutter/plugin/platform/SingleViewPresentation$ImmContext;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0, p2}, Landroid/app/Presentation;-><init>(Landroid/content/Context;Landroid/view/Display;)V

    const/4 p2, 0x0

    .line 89
    iput-boolean p2, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->startFocused:Z

    .line 106
    iput-object p4, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    .line 107
    iput p5, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->viewId:I

    .line 108
    iput-object p6, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    .line 109
    iput-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->outerContext:Landroid/content/Context;

    .line 110
    new-instance p1, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    invoke-direct {p1}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;-><init>()V

    iput-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    .line 111
    invoke-static {p1, p3}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->access$002(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;Lio/flutter/plugin/platform/PlatformView;)Lio/flutter/plugin/platform/PlatformView;

    .line 112
    invoke-virtual {p0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 p2, 0x8

    .line 113
    invoke-virtual {p1, p2, p2}, Landroid/view/Window;->setFlags(II)V

    .line 116
    invoke-virtual {p0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 p2, 0x7ee

    invoke-virtual {p1, p2}, Landroid/view/Window;->setType(I)V

    return-void
.end method


# virtual methods
.method public detachState()Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;
    .locals 1

    .line 205
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->container:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    .line 206
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 208
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->rootView:Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;

    if-eqz v0, :cond_1

    .line 209
    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;->removeAllViews()V

    .line 211
    :cond_1
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    return-object v0
.end method

.method public getView()Lio/flutter/plugin/platform/PlatformView;
    .locals 1

    .line 216
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    invoke-static {v0}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->access$000(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;)Lio/flutter/plugin/platform/PlatformView;

    move-result-object v0

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 145
    invoke-super {p0, p1}, Landroid/app/Presentation;->onCreate(Landroid/os/Bundle;)V

    .line 147
    invoke-virtual {p0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getWindow()Landroid/view/Window;

    move-result-object p1

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p1, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 148
    iget-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    invoke-static {p1}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->access$100(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;)Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    move-result-object p1

    if-nez p1, :cond_0

    .line 149
    iget-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    new-instance v0, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    invoke-virtual {p0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;-><init>(Landroid/content/Context;)V

    invoke-static {p1, v0}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->access$102(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;)Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    .line 151
    :cond_0
    iget-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    invoke-static {p1}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->access$200(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;)Lio/flutter/plugin/platform/WindowManagerHandler;

    move-result-object p1

    if-nez p1, :cond_1

    .line 153
    invoke-virtual {p0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 154
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    new-instance v1, Lio/flutter/plugin/platform/WindowManagerHandler;

    .line 155
    invoke-static {v0}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->access$100(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;)Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Lio/flutter/plugin/platform/WindowManagerHandler;-><init>(Landroid/view/WindowManager;Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;)V

    .line 154
    invoke-static {v0, v1}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->access$202(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;Lio/flutter/plugin/platform/WindowManagerHandler;)Lio/flutter/plugin/platform/WindowManagerHandler;

    .line 158
    :cond_1
    new-instance p1, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->container:Landroid/widget/FrameLayout;

    .line 162
    new-instance p1, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationContext;

    .line 163
    invoke-virtual {p0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    invoke-static {v1}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->access$200(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;)Lio/flutter/plugin/platform/WindowManagerHandler;

    move-result-object v1

    iget-object v2, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->outerContext:Landroid/content/Context;

    invoke-direct {p1, v0, v1, v2}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationContext;-><init>(Landroid/content/Context;Lio/flutter/plugin/platform/WindowManagerHandler;Landroid/content/Context;)V

    .line 165
    iget-object v0, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    invoke-static {v0}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->access$000(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;)Lio/flutter/plugin/platform/PlatformView;

    move-result-object v0

    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformView;->getView()Landroid/view/View;

    move-result-object v0

    .line 166
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    instance-of v1, v1, Landroid/content/MutableContextWrapper;

    if-eqz v1, :cond_2

    .line 167
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/content/MutableContextWrapper;

    .line 168
    invoke-virtual {v1, p1}, Landroid/content/MutableContextWrapper;->setBaseContext(Landroid/content/Context;)V

    goto :goto_0

    .line 176
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Unexpected platform view context for view ID "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->viewId:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "; some functionality may not work correctly. When constructing a platform view in the factory, ensure that the view returned from PlatformViewFactory#create returns the provided context from getContext(). If you are unable to associate the view with that context, consider using Hybrid Composition instead."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "PlatformViewsController"

    invoke-static {v1, p1}, Lio/flutter/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    :goto_0
    iget-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->container:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 187
    new-instance p1, Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;

    .line 189
    invoke-virtual {p0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    invoke-direct {p1, v1, v2, v0}, Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;-><init>(Landroid/content/Context;Lio/flutter/plugin/platform/AccessibilityEventsDelegate;Landroid/view/View;)V

    iput-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->rootView:Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;

    .line 190
    iget-object v1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->container:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1}, Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;->addView(Landroid/view/View;)V

    .line 191
    iget-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->rootView:Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;

    iget-object v1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->state:Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    invoke-static {v1}, Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;->access$100(Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;)Lio/flutter/plugin/platform/SingleViewFakeWindowViewGroup;

    move-result-object v1

    invoke-virtual {p1, v1}, Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;->addView(Landroid/view/View;)V

    .line 193
    iget-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 194
    iget-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->rootView:Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;->setFocusableInTouchMode(Z)V

    .line 195
    iget-boolean p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->startFocused:Z

    if-eqz p1, :cond_3

    .line 196
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    goto :goto_1

    .line 198
    :cond_3
    iget-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->rootView:Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;

    invoke-virtual {p1}, Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;->requestFocus()Z

    .line 200
    :goto_1
    iget-object p1, p0, Lio/flutter/plugin/platform/SingleViewPresentation;->rootView:Lio/flutter/plugin/platform/SingleViewPresentation$AccessibilityDelegatingFrameLayout;

    invoke-virtual {p0, p1}, Lio/flutter/plugin/platform/SingleViewPresentation;->setContentView(Landroid/view/View;)V

    return-void
.end method
