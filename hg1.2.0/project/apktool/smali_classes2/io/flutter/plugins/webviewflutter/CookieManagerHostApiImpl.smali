.class public Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;
.super Ljava/lang/Object;
.source "CookieManagerHostApiImpl.java"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$CookieManagerHostApi;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$CookieManagerProxy;,
        Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$AndroidSdkChecker;
    }
.end annotation


# instance fields
.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

.field private final proxy:Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$CookieManagerProxy;

.field private final sdkChecker:Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$AndroidSdkChecker;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 1

    .line 56
    new-instance v0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$CookieManagerProxy;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$CookieManagerProxy;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$CookieManagerProxy;)V

    return-void
.end method

.method constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$CookieManagerProxy;)V
    .locals 1

    .line 64
    new-instance v0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$$ExternalSyntheticLambda0;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$CookieManagerProxy;Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$AndroidSdkChecker;)V

    return-void
.end method

.method constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$CookieManagerProxy;Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$AndroidSdkChecker;)V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 75
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 76
    iput-object p3, p0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->proxy:Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$CookieManagerProxy;

    .line 77
    iput-object p4, p0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->sdkChecker:Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$AndroidSdkChecker;

    return-void
.end method

.method private getCookieManagerInstance(Ljava/lang/Long;)Landroid/webkit/CookieManager;
    .locals 3

    .line 131
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/CookieManager;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/webkit/CookieManager;

    return-object p1
.end method

.method static synthetic lambda$new$0(I)Z
    .locals 1

    .line 65
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private removeCookiesPreL(Landroid/webkit/CookieManager;)Z
    .locals 1

    .line 122
    invoke-virtual {p1}, Landroid/webkit/CookieManager;->hasCookies()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    invoke-virtual {p1}, Landroid/webkit/CookieManager;->removeAllCookie()V

    :cond_0
    return v0
.end method


# virtual methods
.method public attachInstance(Ljava/lang/Long;)V
    .locals 4

    .line 82
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->proxy:Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$CookieManagerProxy;

    invoke-virtual {v1}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$CookieManagerProxy;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lio/flutter/plugins/webviewflutter/InstanceManager;->addDartCreatedInstance(Ljava/lang/Object;J)V

    return-void
.end method

.method public removeAllCookies(Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$Result<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->sdkChecker:Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$AndroidSdkChecker;

    const/16 v1, 0x15

    invoke-interface {v0, v1}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$AndroidSdkChecker;->sdkIsAtLeast(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->getCookieManagerInstance(Ljava/lang/Long;)Landroid/webkit/CookieManager;

    move-result-object p1

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$$ExternalSyntheticLambda1;

    invoke-direct {v0, p2}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$Result;)V

    invoke-virtual {p1, v0}, Landroid/webkit/CookieManager;->removeAllCookies(Landroid/webkit/ValueCallback;)V

    goto :goto_0

    .line 96
    :cond_0
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->getCookieManagerInstance(Ljava/lang/Long;)Landroid/webkit/CookieManager;

    move-result-object p1

    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->removeCookiesPreL(Landroid/webkit/CookieManager;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$Result;->success(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public setAcceptThirdPartyCookies(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;)V
    .locals 3

    .line 103
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->sdkChecker:Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$AndroidSdkChecker;

    const/16 v1, 0x15

    invoke-interface {v0, v1}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl$AndroidSdkChecker;->sdkIsAtLeast(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->getCookieManagerInstance(Ljava/lang/Long;)Landroid/webkit/CookieManager;

    move-result-object p1

    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 106
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getInstance(J)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/webkit/WebView;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/webkit/WebView;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    .line 105
    invoke-virtual {p1, p2, p3}, Landroid/webkit/CookieManager;->setAcceptThirdPartyCookies(Landroid/webkit/WebView;Z)V

    return-void

    .line 108
    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "`setAcceptThirdPartyCookies` is unsupported on versions below `Build.VERSION_CODES.LOLLIPOP`."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setCookie(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 87
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/CookieManagerHostApiImpl;->getCookieManagerInstance(Ljava/lang/Long;)Landroid/webkit/CookieManager;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Landroid/webkit/CookieManager;->setCookie(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
