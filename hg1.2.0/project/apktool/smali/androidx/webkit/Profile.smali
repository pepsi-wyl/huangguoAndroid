.class public interface abstract Landroidx/webkit/Profile;
.super Ljava/lang/Object;
.source "Profile.java"


# static fields
.field public static final DEFAULT_PROFILE_NAME:Ljava/lang/String; = "Default"


# virtual methods
.method public abstract getCookieManager()Landroid/webkit/CookieManager;
.end method

.method public abstract getGeolocationPermissions()Landroid/webkit/GeolocationPermissions;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getServiceWorkerController()Landroid/webkit/ServiceWorkerController;
.end method

.method public abstract getWebStorage()Landroid/webkit/WebStorage;
.end method
