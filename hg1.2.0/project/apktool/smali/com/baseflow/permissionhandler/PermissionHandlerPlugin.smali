.class public final Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;
.super Ljava/lang/Object;
.source "PermissionHandlerPlugin.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/FlutterPlugin;
.implements Lio/flutter/embedding/engine/plugins/activity/ActivityAware;


# instance fields
.field private methodCallHandler:Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;

.field private methodChannel:Lio/flutter/plugin/common/MethodChannel;

.field private final permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

.field private pluginBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

.field private pluginRegistrar:Lio/flutter/plugin/common/PluginRegistry$Registrar;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Lcom/baseflow/permissionhandler/PermissionManager;

    invoke-direct {v0}, Lcom/baseflow/permissionhandler/PermissionManager;-><init>()V

    iput-object v0, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    return-void
.end method

.method private deregisterListeners()V
    .locals 2

    .line 149
    iget-object v0, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->pluginBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    if-eqz v0, :cond_0

    .line 150
    iget-object v1, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    invoke-interface {v0, v1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->removeActivityResultListener(Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;)V

    .line 151
    iget-object v0, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->pluginBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    iget-object v1, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    invoke-interface {v0, v1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->removeRequestPermissionsResultListener(Lio/flutter/plugin/common/PluginRegistry$RequestPermissionsResultListener;)V

    :cond_0
    return-void
.end method

.method private registerListeners()V
    .locals 2

    .line 139
    iget-object v0, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->pluginRegistrar:Lio/flutter/plugin/common/PluginRegistry$Registrar;

    if-eqz v0, :cond_0

    .line 140
    iget-object v1, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    invoke-interface {v0, v1}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->addActivityResultListener(Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;)Lio/flutter/plugin/common/PluginRegistry$Registrar;

    .line 141
    iget-object v0, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->pluginRegistrar:Lio/flutter/plugin/common/PluginRegistry$Registrar;

    iget-object v1, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    invoke-interface {v0, v1}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->addRequestPermissionsResultListener(Lio/flutter/plugin/common/PluginRegistry$RequestPermissionsResultListener;)Lio/flutter/plugin/common/PluginRegistry$Registrar;

    goto :goto_0

    .line 142
    :cond_0
    iget-object v0, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->pluginBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    if-eqz v0, :cond_1

    .line 143
    iget-object v1, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    invoke-interface {v0, v1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->addActivityResultListener(Lio/flutter/plugin/common/PluginRegistry$ActivityResultListener;)V

    .line 144
    iget-object v0, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->pluginBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    iget-object v1, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    invoke-interface {v0, v1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->addRequestPermissionsResultListener(Lio/flutter/plugin/common/PluginRegistry$RequestPermissionsResultListener;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static registerWith(Lio/flutter/plugin/common/PluginRegistry$Registrar;)V
    .locals 3

    .line 48
    new-instance v0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;

    invoke-direct {v0}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;-><init>()V

    .line 50
    iput-object p0, v0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->pluginRegistrar:Lio/flutter/plugin/common/PluginRegistry$Registrar;

    .line 51
    invoke-direct {v0}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->registerListeners()V

    .line 53
    invoke-interface {p0}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->context()Landroid/content/Context;

    move-result-object v1

    invoke-interface {p0}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->messenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->startListening(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V

    .line 55
    invoke-interface {p0}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->activeContext()Landroid/content/Context;

    move-result-object v1

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_0

    .line 57
    invoke-interface {p0}, Lio/flutter/plugin/common/PluginRegistry$Registrar;->activity()Landroid/app/Activity;

    move-result-object p0

    .line 56
    invoke-direct {v0, p0}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->startListeningToActivity(Landroid/app/Activity;)V

    :cond_0
    return-void
.end method

.method private startListening(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V
    .locals 3

    .line 104
    new-instance v0, Lio/flutter/plugin/common/MethodChannel;

    const-string v1, "flutter.baseflow.com/permissions/methods"

    invoke-direct {v0, p2, v1}, Lio/flutter/plugin/common/MethodChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 108
    new-instance p2, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;

    new-instance v0, Lcom/baseflow/permissionhandler/AppSettingsManager;

    invoke-direct {v0}, Lcom/baseflow/permissionhandler/AppSettingsManager;-><init>()V

    iget-object v1, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    new-instance v2, Lcom/baseflow/permissionhandler/ServiceManager;

    invoke-direct {v2}, Lcom/baseflow/permissionhandler/ServiceManager;-><init>()V

    invoke-direct {p2, p1, v0, v1, v2}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;-><init>(Landroid/content/Context;Lcom/baseflow/permissionhandler/AppSettingsManager;Lcom/baseflow/permissionhandler/PermissionManager;Lcom/baseflow/permissionhandler/ServiceManager;)V

    iput-object p2, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->methodCallHandler:Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;

    .line 115
    iget-object p1, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    invoke-virtual {p1, p2}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    return-void
.end method

.method private startListeningToActivity(Landroid/app/Activity;)V
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->methodCallHandler:Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;

    if-eqz v0, :cond_0

    .line 128
    invoke-virtual {v0, p1}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->setActivity(Landroid/app/Activity;)V

    :cond_0
    return-void
.end method

.method private stopListening()V
    .locals 2

    .line 119
    iget-object v0, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lio/flutter/plugin/common/MethodChannel;->setMethodCallHandler(Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;)V

    .line 120
    iput-object v1, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->methodChannel:Lio/flutter/plugin/common/MethodChannel;

    .line 121
    iput-object v1, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->methodCallHandler:Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;

    return-void
.end method

.method private stopListeningToActivity()V
    .locals 2

    .line 133
    iget-object v0, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->methodCallHandler:Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 134
    invoke-virtual {v0, v1}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->setActivity(Landroid/app/Activity;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 1

    .line 78
    invoke-interface {p1}, Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 77
    invoke-direct {p0, v0}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->startListeningToActivity(Landroid/app/Activity;)V

    .line 81
    iput-object p1, p0, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->pluginBinding:Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;

    .line 82
    invoke-direct {p0}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->registerListeners()V

    return-void
.end method

.method public onAttachedToEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 1

    .line 65
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 66
    invoke-virtual {p1}, Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;->getBinaryMessenger()Lio/flutter/plugin/common/BinaryMessenger;

    move-result-object p1

    .line 64
    invoke-direct {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->startListening(Landroid/content/Context;Lio/flutter/plugin/common/BinaryMessenger;)V

    return-void
.end method

.method public onDetachedFromActivity()V
    .locals 0

    .line 92
    invoke-direct {p0}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->stopListeningToActivity()V

    .line 94
    invoke-direct {p0}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->deregisterListeners()V

    return-void
.end method

.method public onDetachedFromActivityForConfigChanges()V
    .locals 0

    .line 99
    invoke-virtual {p0}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->onDetachedFromActivity()V

    return-void
.end method

.method public onDetachedFromEngine(Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;)V
    .locals 0

    .line 72
    invoke-direct {p0}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->stopListening()V

    return-void
.end method

.method public onReattachedToActivityForConfigChanges(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V
    .locals 0

    .line 87
    invoke-virtual {p0, p1}, Lcom/baseflow/permissionhandler/PermissionHandlerPlugin;->onAttachedToActivity(Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;)V

    return-void
.end method
