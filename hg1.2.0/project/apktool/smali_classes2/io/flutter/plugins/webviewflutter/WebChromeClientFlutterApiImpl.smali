.class public Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;
.super Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi;
.source "WebChromeClientFlutterApiImpl.java"


# instance fields
.field private final binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

.field private final webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 1

    .line 57
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi;-><init>(Lio/flutter/plugin/common/BinaryMessenger;)V

    .line 58
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    .line 59
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 60
    new-instance v0, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    invoke-direct {v0, p1, p2}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V

    iput-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    return-void
.end method

.method private getIdentifierForClient(Landroid/webkit/WebChromeClient;)J
    .locals 2

    .line 241
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 245
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0

    .line 243
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Could not find identifier for WebChromeClient."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic lambda$onGeolocationPermissionsShowPrompt$3(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onPermissionRequest$4(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onProgressChanged$0(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onShowCustomView$5(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onShowCustomView$6(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onShowFileChooser$1(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$onShowFileChooser$2(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method private static toConsoleMessageLevel(Landroid/webkit/ConsoleMessage$MessageLevel;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;
    .locals 1

    .line 33
    sget-object v0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$1;->$SwitchMap$android$webkit$ConsoleMessage$MessageLevel:[I

    invoke-virtual {p0}, Landroid/webkit/ConsoleMessage$MessageLevel;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_4

    const/4 v0, 0x2

    if-eq p0, v0, :cond_3

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/4 v0, 0x5

    if-eq p0, v0, :cond_0

    .line 46
    sget-object p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;->UNKNOWN:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;

    return-object p0

    .line 43
    :cond_0
    sget-object p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;->DEBUG:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;

    return-object p0

    .line 41
    :cond_1
    sget-object p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;->ERROR:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;

    return-object p0

    .line 39
    :cond_2
    sget-object p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;->WARNING:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;

    return-object p0

    .line 37
    :cond_3
    sget-object p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;->LOG:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;

    return-object p0

    .line 35
    :cond_4
    sget-object p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;->TIP:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;

    return-object p0
.end method


# virtual methods
.method public onConsoleMessage(Landroid/webkit/WebChromeClient;Landroid/webkit/ConsoleMessage;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient;",
            "Landroid/webkit/ConsoleMessage;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 179
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 180
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    new-instance v0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage$Builder;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage$Builder;-><init>()V

    .line 182
    invoke-virtual {p2}, Landroid/webkit/ConsoleMessage;->lineNumber()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage$Builder;->setLineNumber(Ljava/lang/Long;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage$Builder;

    move-result-object v0

    .line 183
    invoke-virtual {p2}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage$Builder;->setMessage(Ljava/lang/String;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage$Builder;

    move-result-object v0

    .line 184
    invoke-virtual {p2}, Landroid/webkit/ConsoleMessage;->messageLevel()Landroid/webkit/ConsoleMessage$MessageLevel;

    move-result-object v1

    invoke-static {v1}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->toConsoleMessageLevel(Landroid/webkit/ConsoleMessage$MessageLevel;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage$Builder;->setLevel(Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessageLevel;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage$Builder;

    move-result-object v0

    .line 185
    invoke-virtual {p2}, Landroid/webkit/ConsoleMessage;->sourceId()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage$Builder;->setSourceId(Ljava/lang/String;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage$Builder;

    move-result-object p2

    .line 186
    invoke-virtual {p2}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage$Builder;->build()Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage;

    move-result-object p2

    .line 179
    invoke-super {p0, p1, p2, p3}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi;->onConsoleMessage(Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ConsoleMessage;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V

    return-void
.end method

.method public onGeolocationPermissionsHidePrompt(Landroid/webkit/WebChromeClient;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 117
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 118
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    .line 117
    invoke-super {p0, p1, p2}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi;->onGeolocationPermissionsHidePrompt(Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V

    return-void
.end method

.method public onGeolocationPermissionsShowPrompt(Landroid/webkit/WebChromeClient;Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient;",
            "Ljava/lang/String;",
            "Landroid/webkit/GeolocationPermissions$Callback;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 102
    new-instance v0, Lio/flutter/plugins/webviewflutter/GeolocationPermissionsCallbackFlutterApiImpl;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v2, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/GeolocationPermissionsCallbackFlutterApiImpl;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda4;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda4;-><init>()V

    .line 103
    invoke-virtual {v0, p3, v1}, Lio/flutter/plugins/webviewflutter/GeolocationPermissionsCallbackFlutterApiImpl;->create(Landroid/webkit/GeolocationPermissions$Callback;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$GeolocationPermissionsCallbackFlutterApi$Reply;)V

    .line 104
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 105
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 106
    invoke-virtual {v0, p3}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Long;

    .line 104
    invoke-virtual {p0, p1, p3, p2, p4}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->onGeolocationPermissionsShowPrompt(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V

    return-void
.end method

.method public onHideCustomView(Landroid/webkit/WebChromeClient;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 166
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 167
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    .line 166
    invoke-super {p0, p1, p2}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi;->onHideCustomView(Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V

    return-void
.end method

.method public onJsAlert(Landroid/webkit/WebChromeClient;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 199
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 200
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    .line 199
    invoke-super {p0, p1, p2, p3, p4}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi;->onJsAlert(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V

    return-void
.end method

.method public onJsConfirm(Landroid/webkit/WebChromeClient;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 215
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 216
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    .line 215
    invoke-super {p0, p1, p2, p3, p4}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi;->onJsConfirm(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V

    return-void
.end method

.method public onJsPrompt(Landroid/webkit/WebChromeClient;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 232
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 233
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Ljava/lang/Long;

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 232
    invoke-super/range {v0 .. v5}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi;->onJsPrompt(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V

    return-void
.end method

.method public onPermissionRequest(Landroid/webkit/WebChromeClient;Landroid/webkit/PermissionRequest;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient;",
            "Landroid/webkit/PermissionRequest;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 131
    new-instance v0, Lio/flutter/plugins/webviewflutter/PermissionRequestFlutterApiImpl;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v2, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/PermissionRequestFlutterApiImpl;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V

    .line 132
    invoke-virtual {p2}, Landroid/webkit/PermissionRequest;->getResources()[Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda2;

    invoke-direct {v2}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda2;-><init>()V

    invoke-virtual {v0, p2, v1, v2}, Lio/flutter/plugins/webviewflutter/PermissionRequestFlutterApiImpl;->create(Landroid/webkit/PermissionRequest;[Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$PermissionRequestFlutterApi$Reply;)V

    .line 134
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 135
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 136
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    .line 134
    invoke-super {p0, p1, p2, p3}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi;->onPermissionRequest(Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V

    return-void
.end method

.method public onProgressChanged(Landroid/webkit/WebChromeClient;Landroid/webkit/WebView;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient;",
            "Landroid/webkit/WebView;",
            "Ljava/lang/Long;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    .line 71
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 72
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    .line 74
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->getIdentifierForClient(Landroid/webkit/WebChromeClient;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    .line 73
    invoke-super {p0, p1, p2, p3, p4}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi;->onProgressChanged(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V

    return-void
.end method

.method public onShowCustomView(Landroid/webkit/WebChromeClient;Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient;",
            "Landroid/view/View;",
            "Landroid/webkit/WebChromeClient$CustomViewCallback;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 149
    new-instance v0, Lio/flutter/plugins/webviewflutter/ViewFlutterApiImpl;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v2, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/ViewFlutterApiImpl;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda5;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda5;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/ViewFlutterApiImpl;->create(Landroid/view/View;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$ViewFlutterApi$Reply;)V

    .line 150
    new-instance v0, Lio/flutter/plugins/webviewflutter/CustomViewCallbackFlutterApiImpl;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v2, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/CustomViewCallbackFlutterApiImpl;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda6;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda6;-><init>()V

    .line 151
    invoke-virtual {v0, p3, v1}, Lio/flutter/plugins/webviewflutter/CustomViewCallbackFlutterApiImpl;->create(Landroid/webkit/WebChromeClient$CustomViewCallback;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$CustomViewCallbackFlutterApi$Reply;)V

    .line 153
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 154
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 155
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 156
    invoke-virtual {v0, p3}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Long;

    .line 153
    invoke-virtual {p0, p1, p2, p3, p4}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->onShowCustomView(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V

    return-void
.end method

.method public onShowFileChooser(Landroid/webkit/WebChromeClient;Landroid/webkit/WebView;Landroid/webkit/WebChromeClient$FileChooserParams;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient;",
            "Landroid/webkit/WebView;",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->webViewFlutterApi:Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {v0, p2, v1}, Lio/flutter/plugins/webviewflutter/WebViewFlutterApiImpl;->create(Landroid/webkit/WebView;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewFlutterApi$Reply;)V

    .line 86
    new-instance v0, Lio/flutter/plugins/webviewflutter/FileChooserParamsFlutterApiImpl;

    iget-object v1, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->binaryMessenger:Lio/flutter/plugin/common/BinaryMessenger;

    iget-object v2, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-direct {v0, v1, v2}, Lio/flutter/plugins/webviewflutter/FileChooserParamsFlutterApiImpl;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V

    new-instance v1, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda1;-><init>()V

    .line 87
    invoke-virtual {v0, p3, v1}, Lio/flutter/plugins/webviewflutter/FileChooserParamsFlutterApiImpl;->create(Landroid/webkit/WebChromeClient$FileChooserParams;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$Reply;)V

    .line 89
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 90
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 91
    invoke-virtual {v0, p2}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 92
    invoke-virtual {v0, p3}, Lio/flutter/plugins/webviewflutter/InstanceManager;->getIdentifierForStrongReference(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Long;

    .line 89
    invoke-virtual {p0, p1, p2, p3, p4}, Lio/flutter/plugins/webviewflutter/WebChromeClientFlutterApiImpl;->onShowFileChooser(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebChromeClientFlutterApi$Reply;)V

    return-void
.end method
