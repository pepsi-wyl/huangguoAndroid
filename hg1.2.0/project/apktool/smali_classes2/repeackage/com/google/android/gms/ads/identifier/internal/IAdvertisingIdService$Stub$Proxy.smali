.class Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub$Proxy;
.super Ljava/lang/Object;
.source "IAdvertisingIdService.java"

# interfaces
.implements Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Proxy"
.end annotation


# static fields
.field public static sDefaultImpl:Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;


# instance fields
.field private mRemote:Landroid/os/IBinder;


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .locals 0

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-object p1, p0, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 1

    .line 129
    iget-object v0, p0, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 138
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 139
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 142
    :try_start_0
    const-string v2, "com.google.android.gms.ads.identifier.internal.IAdvertisingIdService"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 143
    iget-object v2, p0, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 144
    invoke-static {}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub;->getDefaultImpl()Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 145
    invoke-static {}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub;->getDefaultImpl()Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;

    move-result-object v2

    invoke-interface {v2}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;->getId()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 150
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 151
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return-object v2

    .line 147
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 148
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 150
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 151
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return-object v2

    :catchall_0
    move-exception v2

    .line 150
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 151
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 152
    throw v2
.end method

.method public getInterfaceDescriptor()Ljava/lang/String;
    .locals 1

    .line 133
    const-string v0, "com.google.android.gms.ads.identifier.internal.IAdvertisingIdService"

    return-object v0
.end method

.method public isLimitAdTrackingEnabled(Z)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 158
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 159
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 162
    :try_start_0
    const-string v2, "com.google.android.gms.ads.identifier.internal.IAdvertisingIdService"

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 163
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 164
    iget-object v4, p0, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v5, 0x2

    invoke-interface {v4, v5, v0, v1, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v4

    if-nez v4, :cond_0

    .line 165
    invoke-static {}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub;->getDefaultImpl()Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 166
    invoke-static {}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService$Stub;->getDefaultImpl()Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;

    move-result-object v2

    invoke-interface {v2, p1}, Lrepeackage/com/google/android/gms/ads/identifier/internal/IAdvertisingIdService;->isLimitAdTrackingEnabled(Z)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 172
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return p1

    .line 168
    :cond_0
    :try_start_1
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 169
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 171
    :goto_0
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 172
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    return v2

    :catchall_0
    move-exception p1

    .line 171
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 172
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 173
    throw p1
.end method
