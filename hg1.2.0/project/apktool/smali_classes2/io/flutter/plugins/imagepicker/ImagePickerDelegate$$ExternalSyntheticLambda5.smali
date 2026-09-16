.class public final synthetic Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lio/flutter/plugins/imagepicker/ImagePickerDelegate;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lio/flutter/plugins/imagepicker/ImagePickerDelegate;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda5;->f$0:Lio/flutter/plugins/imagepicker/ImagePickerDelegate;

    iput p2, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda5;->f$1:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda5;->f$0:Lio/flutter/plugins/imagepicker/ImagePickerDelegate;

    iget v1, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$$ExternalSyntheticLambda5;->f$1:I

    invoke-virtual {v0, v1}, Lio/flutter/plugins/imagepicker/ImagePickerDelegate;->lambda$onActivityResult$5$io-flutter-plugins-imagepicker-ImagePickerDelegate(I)V

    return-void
.end method
