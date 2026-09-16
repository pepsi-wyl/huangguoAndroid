.class Lio/flutter/plugin/platform/VirtualDisplayController;
.super Ljava/lang/Object;
.source "VirtualDisplayController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugin/platform/VirtualDisplayController$OneTimeOnDrawListener;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = "VirtualDisplayController"

.field private static callback:Landroid/hardware/display/VirtualDisplay$Callback;


# instance fields
.field private final accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

.field private final context:Landroid/content/Context;

.field private final densityDpi:I

.field private final focusChangeListener:Landroid/view/View$OnFocusChangeListener;

.field presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

.field private final renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

.field private final viewId:I

.field private virtualDisplay:Landroid/hardware/display/VirtualDisplay;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Lio/flutter/plugin/platform/VirtualDisplayController$1;

    invoke-direct {v0}, Lio/flutter/plugin/platform/VirtualDisplayController$1;-><init>()V

    sput-object v0, Lio/flutter/plugin/platform/VirtualDisplayController;->callback:Landroid/hardware/display/VirtualDisplay$Callback;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lio/flutter/plugin/platform/AccessibilityEventsDelegate;Landroid/hardware/display/VirtualDisplay;Lio/flutter/plugin/platform/PlatformView;Lio/flutter/plugin/platform/PlatformViewRenderTarget;Landroid/view/View$OnFocusChangeListener;ILjava/lang/Object;)V
    .locals 7

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-object p1, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->context:Landroid/content/Context;

    .line 113
    iput-object p2, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    .line 114
    iput-object p5, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    .line 115
    iput-object p6, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    .line 116
    iput p7, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->viewId:I

    .line 117
    iput-object p3, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 118
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p3

    iget p3, p3, Landroid/util/DisplayMetrics;->densityDpi:I

    iput p3, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->densityDpi:I

    .line 119
    new-instance p3, Lio/flutter/plugin/platform/SingleViewPresentation;

    iget-object p5, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 122
    invoke-virtual {p5}, Landroid/hardware/display/VirtualDisplay;->getDisplay()Landroid/view/Display;

    move-result-object v2

    move-object v0, p3

    move-object v1, p1

    move-object v3, p4

    move-object v4, p2

    move v5, p7

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lio/flutter/plugin/platform/SingleViewPresentation;-><init>(Landroid/content/Context;Landroid/view/Display;Lio/flutter/plugin/platform/PlatformView;Lio/flutter/plugin/platform/AccessibilityEventsDelegate;ILandroid/view/View$OnFocusChangeListener;)V

    iput-object p3, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    .line 127
    invoke-virtual {p3}, Lio/flutter/plugin/platform/SingleViewPresentation;->show()V

    return-void
.end method

.method public static create(Landroid/content/Context;Lio/flutter/plugin/platform/AccessibilityEventsDelegate;Lio/flutter/plugin/platform/PlatformView;Lio/flutter/plugin/platform/PlatformViewRenderTarget;IIILjava/lang/Object;Landroid/view/View$OnFocusChangeListener;)Lio/flutter/plugin/platform/VirtualDisplayController;
    .locals 12

    const/4 v0, 0x0

    if-eqz p4, :cond_2

    if-nez p5, :cond_0

    goto :goto_0

    .line 49
    :cond_0
    const-string v1, "display"

    move-object v10, p0

    .line 50
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/DisplayManager;

    .line 51
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 63
    invoke-interface/range {p3 .. p5}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->resize(II)V

    .line 65
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "flutter-vd#"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v11, p6

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget v5, v2, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 71
    invoke-interface {p3}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getSurface()Landroid/view/Surface;

    move-result-object v6

    sget-object v8, Lio/flutter/plugin/platform/VirtualDisplayController;->callback:Landroid/hardware/display/VirtualDisplay$Callback;

    const/4 v9, 0x0

    const/4 v7, 0x0

    move-object v2, v3

    move/from16 v3, p4

    move/from16 v4, p5

    .line 66
    invoke-virtual/range {v1 .. v9}, Landroid/hardware/display/DisplayManager;->createVirtualDisplay(Ljava/lang/String;IIILandroid/view/Surface;ILandroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    move-result-object v5

    if-nez v5, :cond_1

    return-object v0

    .line 79
    :cond_1
    new-instance v0, Lio/flutter/plugin/platform/VirtualDisplayController;

    move-object v2, v0

    move-object v3, p0

    move-object v4, p1

    move-object v6, p2

    move-object v7, p3

    move-object/from16 v8, p8

    move/from16 v9, p6

    move-object/from16 v10, p7

    invoke-direct/range {v2 .. v10}, Lio/flutter/plugin/platform/VirtualDisplayController;-><init>(Landroid/content/Context;Lio/flutter/plugin/platform/AccessibilityEventsDelegate;Landroid/hardware/display/VirtualDisplay;Lio/flutter/plugin/platform/PlatformView;Lio/flutter/plugin/platform/PlatformViewRenderTarget;Landroid/view/View$OnFocusChangeListener;ILjava/lang/Object;)V

    :cond_2
    :goto_0
    return-object v0
.end method

.method private resize31(Landroid/view/View;IILjava/lang/Runnable;)V
    .locals 2

    .line 238
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    invoke-interface {v0, p2, p3}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->resize(II)V

    .line 239
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    iget v1, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->densityDpi:I

    invoke-virtual {v0, p2, p3, v1}, Landroid/hardware/display/VirtualDisplay;->resize(III)V

    .line 241
    iget-object p2, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    iget-object p3, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    invoke-interface {p3}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getSurface()Landroid/view/Surface;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    const-wide/16 p2, 0x0

    .line 242
    invoke-virtual {p1, p4, p2, p3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method


# virtual methods
.method public clearSurface()V
    .locals 2

    .line 288
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)V
    .locals 1

    .line 283
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    if-nez v0, :cond_0

    return-void

    .line 284
    :cond_0
    invoke-virtual {v0, p1}, Lio/flutter/plugin/platform/SingleViewPresentation;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    return-void
.end method

.method public dispose()V
    .locals 1

    .line 228
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->cancel()V

    .line 229
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->detachState()Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    .line 230
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    invoke-virtual {v0}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 231
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->release()V

    return-void
.end method

.method public getRenderTargetHeight()I
    .locals 1

    .line 138
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    if-eqz v0, :cond_0

    .line 139
    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getHeight()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getRenderTargetWidth()I
    .locals 1

    .line 131
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    if-eqz v0, :cond_0

    .line 132
    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getWidth()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 276
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 277
    :cond_0
    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getView()Lio/flutter/plugin/platform/PlatformView;

    move-result-object v0

    .line 278
    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformView;->getView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method onFlutterViewAttached(Landroid/view/View;)V
    .locals 1

    .line 247
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getView()Lio/flutter/plugin/platform/PlatformView;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 250
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getView()Lio/flutter/plugin/platform/PlatformView;

    move-result-object v0

    invoke-interface {v0, p1}, Lio/flutter/plugin/platform/PlatformView;->onFlutterViewAttached(Landroid/view/View;)V

    :cond_1
    :goto_0
    return-void
.end method

.method onFlutterViewDetached()V
    .locals 1

    .line 255
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getView()Lio/flutter/plugin/platform/PlatformView;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 258
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getView()Lio/flutter/plugin/platform/PlatformView;

    move-result-object v0

    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformView;->onFlutterViewDetached()V

    :cond_1
    :goto_0
    return-void
.end method

.method onInputConnectionLocked()V
    .locals 1

    .line 262
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getView()Lio/flutter/plugin/platform/PlatformView;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 265
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getView()Lio/flutter/plugin/platform/PlatformView;

    move-result-object v0

    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformView;->onInputConnectionLocked()V

    :cond_1
    :goto_0
    return-void
.end method

.method onInputConnectionUnlocked()V
    .locals 1

    .line 269
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getView()Lio/flutter/plugin/platform/PlatformView;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 272
    :cond_0
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->getView()Lio/flutter/plugin/platform/PlatformView;

    move-result-object v0

    invoke-interface {v0}, Lio/flutter/plugin/platform/PlatformView;->onInputConnectionUnlocked()V

    :cond_1
    :goto_0
    return-void
.end method

.method public resetSurface()V
    .locals 11

    .line 292
    invoke-virtual {p0}, Lio/flutter/plugin/platform/VirtualDisplayController;->getRenderTargetWidth()I

    move-result v2

    .line 293
    invoke-virtual {p0}, Lio/flutter/plugin/platform/VirtualDisplayController;->getRenderTargetHeight()I

    move-result v3

    .line 294
    invoke-virtual {p0}, Lio/flutter/plugin/platform/VirtualDisplayController;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    move-result v10

    .line 295
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->detachState()Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    move-result-object v9

    .line 298
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 299
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    invoke-virtual {v0}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 300
    iget-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->context:Landroid/content/Context;

    const-string v1, "display"

    .line 301
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/display/DisplayManager;

    .line 303
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "flutter-vd#"

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->viewId:I

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v4, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->densityDpi:I

    iget-object v5, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    .line 309
    invoke-interface {v5}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getSurface()Landroid/view/Surface;

    move-result-object v5

    sget-object v7, Lio/flutter/plugin/platform/VirtualDisplayController;->callback:Landroid/hardware/display/VirtualDisplay$Callback;

    const/4 v8, 0x0

    const/4 v6, 0x0

    .line 304
    invoke-virtual/range {v0 .. v8}, Landroid/hardware/display/DisplayManager;->createVirtualDisplay(Ljava/lang/String;IIILandroid/view/Surface;ILandroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    move-result-object v0

    iput-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 317
    new-instance v0, Lio/flutter/plugin/platform/SingleViewPresentation;

    iget-object v5, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->context:Landroid/content/Context;

    iget-object v1, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 320
    invoke-virtual {v1}, Landroid/hardware/display/VirtualDisplay;->getDisplay()Landroid/view/Display;

    move-result-object v6

    iget-object v7, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    iget-object v1, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    move-object v4, v0

    move-object v8, v9

    move-object v9, v1

    invoke-direct/range {v4 .. v10}, Lio/flutter/plugin/platform/SingleViewPresentation;-><init>(Landroid/content/Context;Landroid/view/Display;Lio/flutter/plugin/platform/AccessibilityEventsDelegate;Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;Landroid/view/View$OnFocusChangeListener;Z)V

    .line 325
    invoke-virtual {v0}, Lio/flutter/plugin/platform/SingleViewPresentation;->show()V

    .line 326
    iget-object v1, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    invoke-virtual {v1}, Lio/flutter/plugin/platform/SingleViewPresentation;->cancel()V

    .line 327
    iput-object v0, p0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    return-void
.end method

.method public resize(IILjava/lang/Runnable;)V
    .locals 13

    move-object v0, p0

    move v3, p1

    move v4, p2

    move-object/from16 v10, p3

    .line 147
    invoke-virtual {p0}, Lio/flutter/plugin/platform/VirtualDisplayController;->getRenderTargetWidth()I

    move-result v1

    if-ne v3, v1, :cond_0

    invoke-virtual {p0}, Lio/flutter/plugin/platform/VirtualDisplayController;->getRenderTargetHeight()I

    move-result v1

    if-ne v4, v1, :cond_0

    .line 148
    invoke-virtual {p0}, Lio/flutter/plugin/platform/VirtualDisplayController;->getView()Landroid/view/View;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v10, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 151
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v1, v2, :cond_1

    .line 152
    invoke-virtual {p0}, Lio/flutter/plugin/platform/VirtualDisplayController;->getView()Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1, p1, p2, v10}, Lio/flutter/plugin/platform/VirtualDisplayController;->resize31(Landroid/view/View;IILjava/lang/Runnable;)V

    return-void

    .line 155
    :cond_1
    invoke-virtual {p0}, Lio/flutter/plugin/platform/VirtualDisplayController;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->isFocused()Z

    move-result v11

    .line 156
    iget-object v1, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    invoke-virtual {v1}, Lio/flutter/plugin/platform/SingleViewPresentation;->detachState()Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;

    move-result-object v12

    .line 158
    iget-object v1, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/hardware/display/VirtualDisplay;->setSurface(Landroid/view/Surface;)V

    .line 159
    iget-object v1, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    invoke-virtual {v1}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 161
    iget-object v1, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->context:Landroid/content/Context;

    const-string v2, "display"

    .line 162
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/display/DisplayManager;

    .line 163
    iget-object v2, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    invoke-interface {v2, p1, p2}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->resize(II)V

    .line 165
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "flutter-vd#"

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->viewId:I

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget v5, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->densityDpi:I

    iget-object v6, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->renderTarget:Lio/flutter/plugin/platform/PlatformViewRenderTarget;

    .line 171
    invoke-interface {v6}, Lio/flutter/plugin/platform/PlatformViewRenderTarget;->getSurface()Landroid/view/Surface;

    move-result-object v6

    sget-object v8, Lio/flutter/plugin/platform/VirtualDisplayController;->callback:Landroid/hardware/display/VirtualDisplay$Callback;

    const/4 v9, 0x0

    const/4 v7, 0x0

    move v3, p1

    move v4, p2

    .line 166
    invoke-virtual/range {v1 .. v9}, Landroid/hardware/display/DisplayManager;->createVirtualDisplay(Ljava/lang/String;IIILandroid/view/Surface;ILandroid/hardware/display/VirtualDisplay$Callback;Landroid/os/Handler;)Landroid/hardware/display/VirtualDisplay;

    move-result-object v1

    iput-object v1, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 176
    invoke-virtual {p0}, Lio/flutter/plugin/platform/VirtualDisplayController;->getView()Landroid/view/View;

    move-result-object v1

    .line 181
    new-instance v2, Lio/flutter/plugin/platform/VirtualDisplayController$2;

    invoke-direct {v2, p0, v1, v10}, Lio/flutter/plugin/platform/VirtualDisplayController$2;-><init>(Lio/flutter/plugin/platform/VirtualDisplayController;Landroid/view/View;Ljava/lang/Runnable;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 213
    new-instance v1, Lio/flutter/plugin/platform/SingleViewPresentation;

    iget-object v3, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->context:Landroid/content/Context;

    iget-object v2, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->virtualDisplay:Landroid/hardware/display/VirtualDisplay;

    .line 216
    invoke-virtual {v2}, Landroid/hardware/display/VirtualDisplay;->getDisplay()Landroid/view/Display;

    move-result-object v4

    iget-object v5, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->accessibilityEventsDelegate:Lio/flutter/plugin/platform/AccessibilityEventsDelegate;

    iget-object v7, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->focusChangeListener:Landroid/view/View$OnFocusChangeListener;

    move-object v2, v1

    move-object v6, v12

    move v8, v11

    invoke-direct/range {v2 .. v8}, Lio/flutter/plugin/platform/SingleViewPresentation;-><init>(Landroid/content/Context;Landroid/view/Display;Lio/flutter/plugin/platform/AccessibilityEventsDelegate;Lio/flutter/plugin/platform/SingleViewPresentation$PresentationState;Landroid/view/View$OnFocusChangeListener;Z)V

    .line 221
    invoke-virtual {v1}, Lio/flutter/plugin/platform/SingleViewPresentation;->show()V

    .line 222
    iget-object v2, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    invoke-virtual {v2}, Lio/flutter/plugin/platform/SingleViewPresentation;->cancel()V

    .line 223
    iput-object v1, v0, Lio/flutter/plugin/platform/VirtualDisplayController;->presentation:Lio/flutter/plugin/platform/SingleViewPresentation;

    return-void
.end method
