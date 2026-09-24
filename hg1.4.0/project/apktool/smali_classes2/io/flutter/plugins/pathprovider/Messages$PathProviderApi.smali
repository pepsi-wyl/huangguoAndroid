.class public interface abstract Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/pathprovider/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PathProviderApi"
.end annotation


# virtual methods
.method public abstract getApplicationCachePath()Ljava/lang/String;
.end method

.method public abstract getApplicationDocumentsPath()Ljava/lang/String;
.end method

.method public abstract getApplicationSupportPath()Ljava/lang/String;
.end method

.method public abstract getExternalCachePaths()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getExternalStoragePath()Ljava/lang/String;
.end method

.method public abstract getExternalStoragePaths(Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTemporaryPath()Ljava/lang/String;
.end method
