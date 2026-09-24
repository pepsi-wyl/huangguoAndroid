.class public final synthetic Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/imagepicker/ImagePickerDelegate;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/imagepicker/ImagePickerDelegate;ILandroid/content/Intent;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda4;->f$0:Lio/flutter/plugins/imagepicker/ImagePickerDelegate;

    iput p2, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda4;->f$1:I

    iput-object p3, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda4;->f$2:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda4;->f$0:Lio/flutter/plugins/imagepicker/ImagePickerDelegate;

    iget v1, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda4;->f$1:I

    iget-object v2, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda4;->f$2:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2}, Lio/flutter/plugins/imagepicker/ImagePickerDelegate;->lambda$onActivityResult$4$io-flutter-plugins-imagepicker-ImagePickerDelegate(ILandroid/content/Intent;)V

    return-void
.end method
