.class public Lio/flutter/app/FlutterFragmentActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "FlutterFragmentActivity.java"

# interfaces
.implements Lio/flutter/view/FlutterView$Provider;
.implements Lio/flutter/plugin/common/PluginRegistry;
.implements Lio/flutter/app/FlutterActivityDelegate$ViewFactory;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final delegate:Lio/flutter/app/FlutterActivityDelegate;

.field private final eventDelegate:Lio/flutter/app/FlutterActivityEvents;

.field private final pluginRegistry:Lio/flutter/plugin/common/PluginRegistry;

.field private final viewProvider:Lio/flutter/view/FlutterView$Provider;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    .line 37
    new-instance v0, Lio/flutter/app/FlutterActivityDelegate;

    invoke-direct {v0, p0, p0}, Lio/flutter/app/FlutterActivityDelegate;-><init>(Landroid/app/Activity;Lio/flutter/app/FlutterActivityDelegate$ViewFactory;)V

    iput-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->delegate:Lio/flutter/app/FlutterActivityDelegate;

    .line 41
    iput-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    .line 42
    iput-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->viewProvider:Lio/flutter/view/FlutterView$Provider;

    .line 43
    iput-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->pluginRegistry:Lio/flutter/plugin/common/PluginRegistry;

    return-void
.end method


# virtual methods
.method public createFlutterNativeView()Lio/flutter/view/FlutterNativeView;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public createFlutterView(Landroid/content/Context;)Lio/flutter/view/FlutterView;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getFlutterView()Lio/flutter/view/FlutterView;
    .locals 1

    .line 51
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->viewProvider:Lio/flutter/view/FlutterView$Provider;

    invoke-interface {v0}, Lio/flutter/view/FlutterView$Provider;->getFlutterView()Lio/flutter/view/FlutterView;

    move-result-object v0

    return-object v0
.end method

.method public final hasPlugin(Ljava/lang/String;)Z
    .locals 1

    .line 77
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->pluginRegistry:Lio/flutter/plugin/common/PluginRegistry;

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/PluginRegistry;->hasPlugin(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 142
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1, p2, p3}, Lio/flutter/app/FlutterActivityEvents;->onActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 143
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 104
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 105
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onBackPressed()V

    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 178
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 179
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1}, Lio/flutter/app/FlutterActivityEvents;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 92
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 93
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1}, Lio/flutter/app/FlutterActivityEvents;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 98
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onDestroy()V

    .line 99
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onDestroy()V

    return-void
.end method

.method public onLowMemory()V
    .locals 1

    .line 173
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onLowMemory()V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 1

    .line 149
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 150
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1}, Lio/flutter/app/FlutterActivityEvents;->onNewIntent(Landroid/content/Intent;)V

    return-void
.end method

.method protected onPause()V
    .locals 1

    .line 123
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    .line 124
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onPause()V

    return-void
.end method

.method protected onPostResume()V
    .locals 1

    .line 129
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPostResume()V

    .line 130
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onPostResume()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    .line 136
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 137
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1, p2, p3}, Lio/flutter/app/FlutterActivityEvents;->onRequestPermissionsResult(I[Ljava/lang/String;[I)Z

    return-void
.end method

.method protected onStart()V
    .locals 1

    .line 111
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStart()V

    .line 112
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onStart()V

    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 117
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onStop()V

    .line 118
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStop()V

    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1

    .line 167
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onTrimMemory(I)V

    .line 168
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1}, Lio/flutter/app/FlutterActivityEvents;->onTrimMemory(I)V

    return-void
.end method

.method public onUserLeaveHint()V
    .locals 1

    .line 156
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0}, Lio/flutter/app/FlutterActivityEvents;->onUserLeaveHint()V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    .line 161
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onWindowFocusChanged(Z)V

    .line 162
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->eventDelegate:Lio/flutter/app/FlutterActivityEvents;

    invoke-interface {v0, p1}, Lio/flutter/app/FlutterActivityEvents;->onWindowFocusChanged(Z)V

    return-void
.end method

.method public final registrarFor(Ljava/lang/String;)Lio/flutter/plugin/common/PluginRegistry$Registrar;
    .locals 1

    .line 87
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->pluginRegistry:Lio/flutter/plugin/common/PluginRegistry;

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/PluginRegistry;->registrarFor(Ljava/lang/String;)Lio/flutter/plugin/common/PluginRegistry$Registrar;

    move-result-object p1

    return-object p1
.end method

.method public retainFlutterNativeView()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public final valuePublishedByPlugin(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lio/flutter/app/FlutterFragmentActivity;->pluginRegistry:Lio/flutter/plugin/common/PluginRegistry;

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/PluginRegistry;->valuePublishedByPlugin(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
