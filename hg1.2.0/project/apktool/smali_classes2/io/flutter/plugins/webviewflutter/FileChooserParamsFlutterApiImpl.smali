.class public Lio/flutter/plugins/webviewflutter/FileChooserParamsFlutterApiImpl;
.super Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi;
.source "FileChooserParamsFlutterApiImpl.java"


# instance fields
.field private final instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;


# direct methods
.method public constructor <init>(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/webviewflutter/InstanceManager;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi;-><init>(Lio/flutter/plugin/common/BinaryMessenger;)V

    .line 34
    iput-object p2, p0, Lio/flutter/plugins/webviewflutter/FileChooserParamsFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    return-void
.end method

.method private static toFileChooserEnumData(I)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;
    .locals 3

    if-eqz p0, :cond_2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v1, 0x3

    if-ne p0, v1, :cond_0

    .line 47
    sget-object p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;->SAVE:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;

    return-object p0

    .line 50
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v0, v2

    const-string p0, "Unsupported FileChooserMode: %d"

    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 44
    :cond_1
    sget-object p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;->OPEN_MULTIPLE:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;

    return-object p0

    .line 41
    :cond_2
    sget-object p0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;->OPEN:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;

    return-object p0
.end method


# virtual methods
.method public create(Landroid/webkit/WebChromeClient$FileChooserParams;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$Reply;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebChromeClient$FileChooserParams;",
            "Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$Reply<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/FileChooserParamsFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->containsInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 61
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/FileChooserParamsFlutterApiImpl;->instanceManager:Lio/flutter/plugins/webviewflutter/InstanceManager;

    .line 62
    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/InstanceManager;->addHostCreatedInstance(Ljava/lang/Object;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    .line 63
    invoke-virtual {p1}, Landroid/webkit/WebChromeClient$FileChooserParams;->isCaptureEnabled()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 64
    invoke-virtual {p1}, Landroid/webkit/WebChromeClient$FileChooserParams;->getAcceptTypes()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 65
    invoke-virtual {p1}, Landroid/webkit/WebChromeClient$FileChooserParams;->getMode()I

    move-result v0

    invoke-static {v0}, Lio/flutter/plugins/webviewflutter/FileChooserParamsFlutterApiImpl;->toFileChooserEnumData(I)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;

    move-result-object v6

    .line 66
    invoke-virtual {p1}, Landroid/webkit/WebChromeClient$FileChooserParams;->getFilenameHint()Ljava/lang/String;

    move-result-object v7

    move-object v2, p0

    move-object v8, p2

    .line 61
    invoke-virtual/range {v2 .. v8}, Lio/flutter/plugins/webviewflutter/FileChooserParamsFlutterApiImpl;->create(Ljava/lang/Long;Ljava/lang/Boolean;Ljava/util/List;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserMode;Ljava/lang/String;Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FileChooserParamsFlutterApi$Reply;)V

    :cond_0
    return-void
.end method
