.class final Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;
.super Ljava/lang/Object;
.source "MethodCallHandlerImpl.java"

# interfaces
.implements Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;


# instance fields
.field private activity:Landroid/app/Activity;

.field private final appSettingsManager:Lcom/baseflow/permissionhandler/AppSettingsManager;

.field private final applicationContext:Landroid/content/Context;

.field private final permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

.field private final serviceManager:Lcom/baseflow/permissionhandler/ServiceManager;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/baseflow/permissionhandler/AppSettingsManager;Lcom/baseflow/permissionhandler/PermissionManager;Lcom/baseflow/permissionhandler/ServiceManager;)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->applicationContext:Landroid/content/Context;

    .line 27
    iput-object p2, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->appSettingsManager:Lcom/baseflow/permissionhandler/AppSettingsManager;

    .line 28
    iput-object p3, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    .line 29
    iput-object p4, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->serviceManager:Lcom/baseflow/permissionhandler/ServiceManager;

    return-void
.end method

.method static synthetic lambda$onMethodCall$0(Lio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 49
    invoke-interface {p0, p1, p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$onMethodCall$1(Lio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 70
    invoke-interface {p0, p1, p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$onMethodCall$2(Lio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 82
    invoke-interface {p0, p1, p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$onMethodCall$3(Lio/flutter/plugin/common/MethodChannel$Result;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 93
    invoke-interface {p0, p1, p2, v0}, Lio/flutter/plugin/common/MethodChannel$Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public onMethodCall(Lio/flutter/plugin/common/MethodCall;Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 4

    .line 42
    iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, -0x1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v1, "requestPermissions"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_1
    const-string v1, "openAppSettings"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_2
    const-string v1, "checkPermissionStatus"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_3
    const-string v1, "shouldShowRequestPermissionRationale"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v2, 0x1

    goto :goto_0

    :sswitch_4
    const-string v1, "checkServiceStatus"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    :cond_4
    const/4 v2, 0x0

    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 100
    invoke-interface {p2}, Lio/flutter/plugin/common/MethodChannel$Result;->notImplemented()V

    goto/16 :goto_1

    .line 65
    :pswitch_0
    invoke-virtual {p1}, Lio/flutter/plugin/common/MethodCall;->arguments()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 66
    iget-object v0, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    iget-object v1, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->activity:Landroid/app/Activity;

    .line 69
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda3;

    invoke-direct {v2, p2}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    new-instance v3, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda4;

    invoke-direct {v3, p2}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 66
    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/baseflow/permissionhandler/PermissionManager;->requestPermissions(Ljava/util/List;Landroid/app/Activity;Lcom/baseflow/permissionhandler/PermissionManager$RequestPermissionsSuccessCallback;Lcom/baseflow/permissionhandler/ErrorCallback;)V

    goto :goto_1

    .line 90
    :pswitch_1
    iget-object p1, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->appSettingsManager:Lcom/baseflow/permissionhandler/AppSettingsManager;

    iget-object v0, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->applicationContext:Landroid/content/Context;

    .line 92
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda7;

    invoke-direct {v1, p2}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda7;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    new-instance v2, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda8;

    invoke-direct {v2, p2}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda8;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 90
    invoke-virtual {p1, v0, v1, v2}, Lcom/baseflow/permissionhandler/AppSettingsManager;->openAppSettings(Landroid/content/Context;Lcom/baseflow/permissionhandler/AppSettingsManager$OpenAppSettingsSuccessCallback;Lcom/baseflow/permissionhandler/ErrorCallback;)V

    goto :goto_1

    .line 57
    :pswitch_2
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    .line 58
    iget-object v0, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    iget-object v1, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->applicationContext:Landroid/content/Context;

    .line 61
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda2;

    invoke-direct {v2, p2}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 58
    invoke-virtual {v0, p1, v1, v2}, Lcom/baseflow/permissionhandler/PermissionManager;->checkPermissionStatus(ILandroid/content/Context;Lcom/baseflow/permissionhandler/PermissionManager$CheckPermissionsSuccessCallback;)V

    goto :goto_1

    .line 77
    :pswitch_3
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    .line 78
    iget-object v0, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->permissionManager:Lcom/baseflow/permissionhandler/PermissionManager;

    iget-object v1, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->activity:Landroid/app/Activity;

    .line 81
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda5;

    invoke-direct {v2, p2}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda5;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    new-instance v3, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda6;

    invoke-direct {v3, p2}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda6;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 78
    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/baseflow/permissionhandler/PermissionManager;->shouldShowRequestPermissionRationale(ILandroid/app/Activity;Lcom/baseflow/permissionhandler/PermissionManager$ShouldShowRequestPermissionRationaleSuccessCallback;Lcom/baseflow/permissionhandler/ErrorCallback;)V

    goto :goto_1

    .line 44
    :pswitch_4
    iget-object p1, p1, Lio/flutter/plugin/common/MethodCall;->arguments:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    .line 45
    iget-object v0, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->serviceManager:Lcom/baseflow/permissionhandler/ServiceManager;

    iget-object v1, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->applicationContext:Landroid/content/Context;

    .line 48
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda0;

    invoke-direct {v2, p2}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    new-instance v3, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda1;

    invoke-direct {v3, p2}, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugin/common/MethodChannel$Result;)V

    .line 45
    invoke-virtual {v0, p1, v1, v2, v3}, Lcom/baseflow/permissionhandler/ServiceManager;->checkServiceStatus(ILandroid/content/Context;Lcom/baseflow/permissionhandler/ServiceManager$SuccessCallback;Lcom/baseflow/permissionhandler/ErrorCallback;)V

    :goto_1
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x5c086121 -> :sswitch_4
        -0x3ca2ffb7 -> :sswitch_3
        -0x22583c37 -> :sswitch_2
        0x14b278ba -> :sswitch_1
        0x637dca75 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setActivity(Landroid/app/Activity;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl;->activity:Landroid/app/Activity;

    return-void
.end method
