.class Lio/flutter/plugins/imagepicker/ImagePickerDelegate$2;
.super Ljava/lang/Object;
.source "ImagePickerDelegate.java"

# interfaces
.implements Lio/flutter/plugins/imagepicker/ImagePickerDelegate$FileUriResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/flutter/plugins/imagepicker/ImagePickerDelegate;-><init>(Landroid/app/Activity;Lio/flutter/plugins/imagepicker/ImageResizer;Lio/flutter/plugins/imagepicker/ImagePickerCache;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 171
    iput-object p1, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$2;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$getFullImagePath$0(Lio/flutter/plugins/imagepicker/ImagePickerDelegate$OnPathReadyListener;Ljava/lang/String;Landroid/net/Uri;)V
    .locals 0

    .line 183
    invoke-interface {p0, p1}, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$OnPathReadyListener;->onPathReady(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getFullImagePath(Landroid/net/Uri;Lio/flutter/plugins/imagepicker/ImagePickerDelegate$OnPathReadyListener;)V
    .locals 3

    .line 179
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$2;->val$activity:Landroid/app/Activity;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 181
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    const/4 v2, 0x0

    aput-object p1, v1, v2

    new-instance p1, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$2$$ExternalSyntheticLambda0;

    invoke-direct {p1, p2}, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$2$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/imagepicker/ImagePickerDelegate$OnPathReadyListener;)V

    const/4 p2, 0x0

    .line 179
    invoke-static {v0, v1, p2, p1}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    return-void
.end method

.method public resolveFileProviderUriForFile(Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;
    .locals 1

    .line 174
    iget-object v0, p0, Lio/flutter/plugins/imagepicker/ImagePickerDelegate$2;->val$activity:Landroid/app/Activity;

    invoke-static {v0, p1, p2}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method
