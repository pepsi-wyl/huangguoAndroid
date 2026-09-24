.class public abstract Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub;
.super Landroid/os/Binder;
.source "IDeviceIdManager.java"

# interfaces
.implements Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.coolpad.deviceidsupport.IDeviceIdManager"

.field static final TRANSACTION_getAAID:I = 0x4

.field static final TRANSACTION_getCoolOsVersion:I = 0x7

.field static final TRANSACTION_getIMEI:I = 0x5

.field static final TRANSACTION_getOAID:I = 0x2

.field static final TRANSACTION_getUDID:I = 0x1

.field static final TRANSACTION_getVAID:I = 0x3

.field static final TRANSACTION_isCoolOs:I = 0x6


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 97
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 98
    const-string v0, "com.coolpad.deviceidsupport.IDeviceIdManager"

    invoke-virtual {p0, p0, v0}, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 109
    :cond_0
    const-string v0, "com.coolpad.deviceidsupport.IDeviceIdManager"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 110
    instance-of v1, v0, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;

    if-eqz v1, :cond_1

    .line 111
    check-cast v0, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;

    return-object v0

    .line 113
    :cond_1
    new-instance v0, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub$Proxy;

    invoke-direct {v0, p0}, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public static getDefaultImpl()Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;
    .locals 1

    .line 381
    sget-object v0, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;

    return-object v0
.end method

.method public static setDefaultImpl(Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;)Z
    .locals 1

    .line 370
    sget-object v0, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;

    if-nez v0, :cond_1

    if-eqz p0, :cond_0

    .line 374
    sput-object p0, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager;

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    .line 371
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

    const v0, 0x5f4e5446

    const/4 v1, 0x1

    .line 124
    const-string v2, "com.coolpad.deviceidsupport.IDeviceIdManager"

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    .line 189
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    .line 182
    :pswitch_0
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 183
    invoke-virtual {p0}, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub;->getCoolOsVersion()Ljava/lang/String;

    move-result-object p1

    .line 184
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 185
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    .line 175
    :pswitch_1
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 176
    invoke-virtual {p0}, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub;->isCoolOs()Z

    move-result p1

    .line 177
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 178
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeInt(I)V

    return v1

    .line 166
    :pswitch_2
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 168
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 169
    invoke-virtual {p0, p1}, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub;->getIMEI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 170
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 171
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    .line 157
    :pswitch_3
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 159
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 160
    invoke-virtual {p0, p1}, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub;->getAAID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 161
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 162
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    .line 148
    :pswitch_4
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 150
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 151
    invoke-virtual {p0, p1}, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub;->getVAID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 152
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 153
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    .line 139
    :pswitch_5
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 141
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 142
    invoke-virtual {p0, p1}, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub;->getOAID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 143
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 144
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    .line 130
    :pswitch_6
    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 132
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 133
    invoke-virtual {p0, p1}, Lrepeackage/com/coolpad/deviceidsupport/IDeviceIdManager$Stub;->getUDID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 134
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 135
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    .line 126
    :cond_0
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
