.class public abstract Lrepeackage/com/android/creator/IdsSupplier$Stub;
.super Landroid/os/Binder;
.source "IdsSupplier.java"

# interfaces
.implements Lrepeackage/com/android/creator/IdsSupplier;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrepeackage/com/android/creator/IdsSupplier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrepeackage/com/android/creator/IdsSupplier$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.android.creator.IdsSupplier"

.field static final TRANSACTION_getAAID:I = 0x5

.field static final TRANSACTION_getOAID:I = 0x3

.field static final TRANSACTION_getUDID:I = 0x2

.field static final TRANSACTION_getVAID:I = 0x4

.field static final TRANSACTION_isSupported:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 86
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 87
    const-string v0, "com.android.creator.IdsSupplier"

    invoke-virtual {p0, p0, v0}, Lrepeackage/com/android/creator/IdsSupplier$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lrepeackage/com/android/creator/IdsSupplier;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 98
    :cond_0
    const-string v0, "com.android.creator.IdsSupplier"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 99
    instance-of v1, v0, Lrepeackage/com/android/creator/IdsSupplier;

    if-eqz v1, :cond_1

    .line 100
    check-cast v0, Lrepeackage/com/android/creator/IdsSupplier;

    return-object v0

    .line 102
    :cond_1
    new-instance v0, Lrepeackage/com/android/creator/IdsSupplier$Stub$Proxy;

    invoke-direct {v0, p0}, Lrepeackage/com/android/creator/IdsSupplier$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public static getDefaultImpl()Lrepeackage/com/android/creator/IdsSupplier;
    .locals 1

    .line 305
    sget-object v0, Lrepeackage/com/android/creator/IdsSupplier$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/android/creator/IdsSupplier;

    return-object v0
.end method

.method public static setDefaultImpl(Lrepeackage/com/android/creator/IdsSupplier;)Z
    .locals 1

    .line 294
    sget-object v0, Lrepeackage/com/android/creator/IdsSupplier$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/android/creator/IdsSupplier;

    if-nez v0, :cond_1

    if-eqz p0, :cond_0

    .line 298
    sput-object p0, Lrepeackage/com/android/creator/IdsSupplier$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/android/creator/IdsSupplier;

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    .line 295
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

    .line 113
    const-string v1, "com.android.creator.IdsSupplier"

    if-eq p1, v0, :cond_5

    const/4 v2, 0x2

    if-eq p1, v2, :cond_4

    const/4 v2, 0x3

    if-eq p1, v2, :cond_3

    const/4 v2, 0x4

    if-eq p1, v2, :cond_2

    const/4 v2, 0x5

    if-eq p1, v2, :cond_1

    const v2, 0x5f4e5446

    if-eq p1, v2, :cond_0

    .line 158
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    .line 115
    :cond_0
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    .line 149
    :cond_1
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 151
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 152
    invoke-virtual {p0, p1}, Lrepeackage/com/android/creator/IdsSupplier$Stub;->getAAID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 153
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 154
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    .line 142
    :cond_2
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 143
    invoke-virtual {p0}, Lrepeackage/com/android/creator/IdsSupplier$Stub;->getVAID()Ljava/lang/String;

    move-result-object p1

    .line 144
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 145
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    .line 135
    :cond_3
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 136
    invoke-virtual {p0}, Lrepeackage/com/android/creator/IdsSupplier$Stub;->getOAID()Ljava/lang/String;

    move-result-object p1

    .line 137
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 138
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    .line 126
    :cond_4
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 128
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 129
    invoke-virtual {p0, p1}, Lrepeackage/com/android/creator/IdsSupplier$Stub;->getUDID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 130
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 131
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    .line 119
    :cond_5
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 120
    invoke-virtual {p0}, Lrepeackage/com/android/creator/IdsSupplier$Stub;->isSupported()Z

    move-result p1

    .line 121
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 122
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v0
.end method
