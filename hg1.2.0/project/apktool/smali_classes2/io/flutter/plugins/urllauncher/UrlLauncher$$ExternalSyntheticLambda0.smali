.class public final synthetic Lio/flutter/plugins/urllauncher/UrlLauncher$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lio/flutter/plugins/urllauncher/UrlLauncher$IntentResolver;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/urllauncher/UrlLauncher$$ExternalSyntheticLambda0;->f$0:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final getHandlerComponentName(Landroid/content/Intent;)Ljava/lang/String;
    .locals 1

    .line 0
    iget-object v0, p0, Lio/flutter/plugins/urllauncher/UrlLauncher$$ExternalSyntheticLambda0;->f$0:Landroid/content/Context;

    invoke-static {v0, p1}, Lio/flutter/plugins/urllauncher/UrlLauncher;->lambda$new$0(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
