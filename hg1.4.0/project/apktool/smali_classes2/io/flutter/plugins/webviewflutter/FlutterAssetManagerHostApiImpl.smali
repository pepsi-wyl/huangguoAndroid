.class public Lio/flutter/plugins/webviewflutter/FlutterAssetManagerHostApiImpl;
.super Ljava/lang/Object;
.source "FlutterAssetManagerHostApiImpl.java"

# interfaces
.implements Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$FlutterAssetManagerHostApi;


# instance fields
.field final flutterAssetManager:Lio/flutter/plugins/webviewflutter/FlutterAssetManager;


# direct methods
.method public constructor <init>(Lio/flutter/plugins/webviewflutter/FlutterAssetManager;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lio/flutter/plugins/webviewflutter/FlutterAssetManagerHostApiImpl;->flutterAssetManager:Lio/flutter/plugins/webviewflutter/FlutterAssetManager;

    return-void
.end method


# virtual methods
.method public getAssetFilePathByName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 47
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/FlutterAssetManagerHostApiImpl;->flutterAssetManager:Lio/flutter/plugins/webviewflutter/FlutterAssetManager;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/FlutterAssetManager;->getAssetFilePathByName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public list(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 32
    :try_start_0
    iget-object v0, p0, Lio/flutter/plugins/webviewflutter/FlutterAssetManagerHostApiImpl;->flutterAssetManager:Lio/flutter/plugins/webviewflutter/FlutterAssetManager;

    invoke-virtual {v0, p1}, Lio/flutter/plugins/webviewflutter/FlutterAssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    return-object p1

    .line 38
    :cond_0
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 40
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
