.class public final synthetic Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/baseflow/permissionhandler/PermissionManager$ShouldShowRequestPermissionRationaleSuccessCallback;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugin/common/MethodChannel$Result;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugin/common/MethodChannel$Result;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda5;->f$0:Lio/flutter/plugin/common/MethodChannel$Result;

    return-void
.end method


# virtual methods
.method public final onSuccess(Z)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/baseflow/permissionhandler/MethodCallHandlerImpl$$ExternalSyntheticLambda5;->f$0:Lio/flutter/plugin/common/MethodChannel$Result;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {v0, p1}, Lio/flutter/plugin/common/MethodChannel$Result;->success(Ljava/lang/Object;)V

    return-void
.end method
