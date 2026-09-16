.class Lio/flutter/embedding/engine/FlutterEngineConnectionRegistry$FlutterEngineContentProviderPluginBinding;
.super Ljava/lang/Object;
.source "FlutterEngineConnectionRegistry.java"

# interfaces
.implements Lio/flutter/embedding/engine/plugins/contentprovider/ContentProviderPluginBinding;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/FlutterEngineConnectionRegistry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FlutterEngineContentProviderPluginBinding"
.end annotation


# instance fields
.field private final contentProvider:Landroid/content/ContentProvider;


# direct methods
.method constructor <init>(Landroid/content/ContentProvider;)V
    .locals 0

    .line 945
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 946
    iput-object p1, p0, Lio/flutter/embedding/engine/FlutterEngineConnectionRegistry$FlutterEngineContentProviderPluginBinding;->contentProvider:Landroid/content/ContentProvider;

    return-void
.end method


# virtual methods
.method public getContentProvider()Landroid/content/ContentProvider;
    .locals 1

    .line 952
    iget-object v0, p0, Lio/flutter/embedding/engine/FlutterEngineConnectionRegistry$FlutterEngineContentProviderPluginBinding;->contentProvider:Landroid/content/ContentProvider;

    return-object v0
.end method
