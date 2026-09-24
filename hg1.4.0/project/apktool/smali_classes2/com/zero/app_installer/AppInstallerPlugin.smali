.class public Lcom/zero/app_installer/AppInstallerPlugin;
.super Ljava/lang/Object;
.source "AppInstallerPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/embedding/engine/plugins/activity/ActivityAware;
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;
.implements Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;


# instance fields
.field private apkFile:Ljava/io/File;

.field private applicationContext:Landroid/content/Context;

.field private mActivity:Landroid/app/Activity;

.field private methodChannel:Lio/flutter/plugin/common/MethodChannel;

.field private result:Lio/flutter/plugin/common/MethodChannel$Result;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getActivityResultListener()Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;
    .locals 0

    return-object p0
.end method

.method private goAppStore(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3

    if-eqz p2, :cond_0

    goto :goto_0

    .line 120
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object p2

    .line 123
    :goto_0
    new-instance v0, Landroid/content/Intent;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "market://details?id="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 p2, 0x48080000    # 139264.0f

    .line 124
    invoke-virtual {v0, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 126
    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private installApk(Ljava/io/File;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 6

    if-eqz p1, :cond_1

    .line 163
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    .line 164
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x10000000

    .line 165
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 166
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    const/4 v3, 0x1

    const-string v4, "application/vnd.android.package-archive"

    if-lt v1, v2, :cond_0

    .line 167
    invoke-virtual {v0, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 168
    iget-object v1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->applicationContext:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/zero/app_installer/AppInstallerPlugin;->applicationContext:Landroid/content/Context;

    .line 169
    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".fileProvider"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 168
    invoke-static {v1, v2, p1}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    .line 170
    invoke-virtual {v0, p1, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 172
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 174
    :goto_0
    iget-object p1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    if-eqz p2, :cond_2

    .line 176
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    if-eqz p2, :cond_2

    const/4 p1, 0x0

    .line 180
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    :cond_2
    :goto_1
    const/4 p1, 0x0

    .line 183
    iput-object p1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->apkFile:Ljava/io/File;

    .line 184
    iput-object p1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->result:Lio/flutter/plugin/common/MethodChannel$Result;

    return-void
.end method

.method private installProcess(Ljava/io/File;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0

    .line 141
    iput-object p1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->apkFile:Ljava/io/File;

    .line 142
    iput-object p2, p0, Lcom/zero/app_installer/AppInstallerPlugin;->result:Lio/flutter/plugin/common/MethodChannel$Result;

    .line 143
    invoke-direct {p0, p1, p2}, Lcom/zero/app_installer/AppInstallerPlugin;->installApk(Ljava/io/File;Lio/flutter/plugin/common/MethodChannel$Result;)V

    return-void
.end method

.method private onAttachedToActivity(Landroid/app/Activity;)V
    .locals 0

    .line 60
    iput-object p1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method private onAttachedToEngine(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 1

    .line 41
    iput-object p1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->applicationContext:Landroid/content/Context;

    .line 42
    new-instance p1, Lio/flutter/plugin/common/MethodChannel;

    const-string v0, "app_installer"

    invoke-direct {p1, p2, v0}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 43
    invoke-virtual {p1, p0}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method

.method private startInstallPermissionSettingActivity()V
    .locals 3

    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "package:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->applicationContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 153
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.MANAGE_UNKNOWN_APP_SOURCES"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 154
    iget-object v0, p0, Lcom/zero/app_installer/AppInstallerPlugin;->mActivity:Landroid/app/Activity;

    const/16 v2, 0x2766

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)Z
    .locals 0

    const/16 p3, 0x2766

    if-ne p1, p3, :cond_0

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    .line 190
    iget-object p1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->apkFile:Ljava/io/File;

    iget-object p2, p0, Lcom/zero/app_installer/AppInstallerPlugin;->result:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-direct {p0, p1, p2}, Lcom/zero/app_installer/AppInstallerPlugin;->installProcess(Ljava/io/File;Lio/flutter/plugin/common/MethodChannel$Result;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 1

    .line 55
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/zero/app_installer/AppInstallerPlugin;->onAttachedToActivity(Landroid/app/Activity;)V

    .line 56
    invoke-direct {p0}, Lcom/zero/app_installer/AppInstallerPlugin;->getActivityResultListener()Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->addActivityResultListener(Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;)V

    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 37
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/zero/app_installer/AppInstallerPlugin;->onAttachedToEngine(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V

    return-void
.end method

.method public onDetachedFromActivity()V
    .locals 1

    const/4 v0, 0x0

    .line 78
    iput-object v0, p0, Lcom/zero/app_installer/AppInstallerPlugin;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method public onDetachedFromActivityForConfigChanges()V
    .locals 0

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    const/4 p1, 0x0

    .line 48
    iput-object p1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->applicationContext:Landroid/content/Context;

    .line 49
    iget-object v0, p0, Lcom/zero/app_installer/AppInstallerPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {v0, p1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 50
    iput-object p1, p0, Lcom/zero/app_installer/AppInstallerPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    return-void
.end method

.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 2

    .line 92
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    .line 93
    const-string v1, "goStore"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 94
    const-string v0, "androidAppId"

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 95
    iget-object v0, p0, Lcom/zero/app_installer/AppInstallerPlugin;->mActivity:Landroid/app/Activity;

    invoke-direct {p0, v0, p1}, Lcom/zero/app_installer/AppInstallerPlugin;->goAppStore(Landroid/app/Activity;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 96
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p2, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    goto :goto_0

    .line 97
    :cond_0
    const-string v1, "installApk"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 98
    const-string v0, "apkPath"

    invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 99
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 100
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lcom/zero/app_installer/AppInstallerPlugin;->installProcess(Ljava/io/File;Lio/flutter/plugin/common/MethodChannel$Result;)V

    goto :goto_0

    .line 102
    :cond_1
    const-string p1, "apkPath is null"

    const/4 v0, 0x0

    invoke-interface {p2, v1, p1, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 105
    :cond_2
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    :goto_0
    return-void
.end method

.method public onReattachedToActivityForConfigChanges(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 1

    .line 70
    invoke-virtual {p0, p1}, Lcom/zero/app_installer/AppInstallerPlugin;->onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V

    .line 71
    invoke-direct {p0}, Lcom/zero/app_installer/AppInstallerPlugin;->getActivityResultListener()Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->removeActivityResultListener(Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;)V

    .line 72
    invoke-direct {p0}, Lcom/zero/app_installer/AppInstallerPlugin;->getActivityResultListener()Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;

    move-result-object v0

    invoke-interface {p1, v0}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->addActivityResultListener(Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;)V

    return-void
.end method
