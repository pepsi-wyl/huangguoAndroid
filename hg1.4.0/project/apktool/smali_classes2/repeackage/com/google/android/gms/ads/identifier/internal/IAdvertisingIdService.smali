.class public interface abstract Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;
.super Ljava/lang/Object;
.source "IAdvertisingIdService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub;,
        Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Default;
    }
.end annotation


# virtual methods
.method public abstract getId()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract isLimitAdTrackingEnabled(Z)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
