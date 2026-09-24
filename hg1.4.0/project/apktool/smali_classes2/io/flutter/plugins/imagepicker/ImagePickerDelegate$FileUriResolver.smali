.class interface abstract Lio/flutter/plugins/imagepicker/ImagePickerDelegate$FileUriResolver;
.super Ljava/lang/Object;
.source "ImagePickerDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/ImagePickerDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "FileUriResolver"
.end annotation


# virtual methods
.method public abstract getFullImagePath(Landroid/net/Uri;Lio/flutter/plugins/imagepicker/ImagePickerDelegate$OnPathReadyListener;)V
.end method

.method public abstract resolveFileProviderUriForFile(Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;
.end method
