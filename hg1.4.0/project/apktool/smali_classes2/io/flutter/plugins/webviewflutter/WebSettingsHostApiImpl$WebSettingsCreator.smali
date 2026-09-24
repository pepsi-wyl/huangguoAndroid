.class public Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl$WebSettingsCreator;
.super Ljava/lang/Object;
.source "WebSettingsHostApiImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/WebSettingsHostApiImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WebSettingsCreator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createWebSettings(Landroid/webkit/WebView;)Landroid/webkit/WebSettings;
    .locals 0

    .line 33
    invoke-virtual {p1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object p1

    return-object p1
.end method
