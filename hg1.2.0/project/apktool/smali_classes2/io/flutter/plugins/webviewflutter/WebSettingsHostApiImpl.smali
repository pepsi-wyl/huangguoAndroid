.class public Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;
.super Ljava/lang/Object;
.source "WebSettingsHostApiImpl.java"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebSettingsHostApi;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl$WebSettingsCreator;
    }
.end annotation


# instance fields
.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

.field private final webSettingsCreator:Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl$WebSettingsCreator;


# direct methods
.method public constructor <init>(Lio/flutter/plugins/webviewflutter/InstanceManager;Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl$WebSettingsCreator;)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 46
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->webSettingsCreator:Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl$WebSettingsCreator;

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 3

    .line 51
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/webkit/WebView;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/webkit/WebView;

    .line 52
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->webSettingsCreator:Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl$WebSettingsCreator;

    .line 53
    invoke-virtual {v1, p2}, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl$WebSettingsCreator;->createWebSettings(Landroid/webkit/WebView;)Landroid/webkit/WebSettings;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 52
    invoke-virtual {v0, p2, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->addDartCreatedInstance(Ljava/lang/Object;J)V

    return-void
.end method

.method public getUserAgentString(Ljava/lang/Long;)Ljava/lang/String;
    .locals 3

    .line 139
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 140
    invoke-virtual {p1}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public setAllowFileAccess(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 126
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 127
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    return-void
.end method

.method public setBuiltInZoomControls(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 120
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 121
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    return-void
.end method

.method public setDisplayZoomControls(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 114
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 115
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    return-void
.end method

.method public setDomStorageEnabled(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 58
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 59
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    return-void
.end method

.method public setJavaScriptCanOpenWindowsAutomatically(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 65
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 66
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    return-void
.end method

.method public setJavaScriptEnabled(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 77
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 78
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    return-void
.end method

.method public setLoadWithOverviewMode(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 102
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 103
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    return-void
.end method

.method public setMediaPlaybackRequiresUserGesture(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 90
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 91
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setMediaPlaybackRequiresUserGesture(Z)V

    return-void
.end method

.method public setSupportMultipleWindows(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 71
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 72
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setSupportMultipleWindows(Z)V

    return-void
.end method

.method public setSupportZoom(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 96
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 97
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    return-void
.end method

.method public setTextZoom(Ljava/lang/Long;Ljava/lang/Long;)V
    .locals 3

    .line 132
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 133
    invoke-virtual {p2}, Ljava/lang/Long;->intValue()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setTextZoom(I)V

    return-void
.end method

.method public setUseWideViewPort(Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 108
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 109
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    return-void
.end method

.method public setUserAgentString(Ljava/lang/Long;Ljava/lang/String;)V
    .locals 3

    .line 83
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/WebSettings;

    .line 84
    invoke-virtual {p1, p2}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    return-void
.end method
