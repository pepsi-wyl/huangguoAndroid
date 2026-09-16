.class public abstract Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub;
.super Landroid/os/Binder;
.source "IAdvertisingIdService.java"

# interfaces
.implements Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.google.android.gms.ads.identifier.internal.IAdvertisingIdService"

.field static final TRANSACTION_getId:I = 0x1

.field static final TRANSACTION_isLimitAdTrackingEnabled:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 66
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 67
    const-string v0, "com.google.android.gms.ads.identifier.internal.IAdvertisingIdService"

    invoke-virtual {p0, p0, v0}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 78
    :cond_0
    const-string v0, "com.google.android.gms.ads.identifier.internal.IAdvertisingIdService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 79
    instance-of v1, v0, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;

    if-eqz v1, :cond_1

    .line 80
    check-cast v0, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;

    return-object v0

    .line 82
    :cond_1
    new-instance v0, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub$Proxy;

    invoke-direct {v0, p0}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public static getDefaultImpl()Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;
    .locals 1

    .line 198
    sget-object v0, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;

    return-object v0
.end method

.method public static setDefaultImpl(Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;)Z
    .locals 1

    .line 187
    sget-object v0, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;

    if-nez v0, :cond_1

    if-eqz p0, :cond_0

    .line 191
    sput-object p0, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    .line 188
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "setDefaultImpl() called twice"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 93
    const-string v1, "com.google.android.gms.ads.identifier.internal.IAdvertisingIdService"

    if-eq p1, v0, :cond_3

    const/4 v2, 0x2

    if-eq p1, v2, :cond_1

    const v2, 0x5f4e5446

    if-eq p1, v2, :cond_0

    .line 115
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    .line 95
    :cond_0
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    .line 106
    :cond_1
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 108
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    .line 109
    :goto_0
    invoke-virtual {p0, p1}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub;->isLimitAdTrackingEnabled(Z)Z

    move-result p1

    .line 110
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 111
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v0

    .line 99
    :cond_3
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 100
    invoke-virtual {p0}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub;->getId()Ljava/lang/String;

    move-result-object p1

    .line 101
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 102
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0
.end method
