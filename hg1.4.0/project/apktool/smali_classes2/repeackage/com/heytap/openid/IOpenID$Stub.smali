.class public abstract Lrepeackage/com/heytap/openid/IOpenID$Stub;
.super Landroid/os/Binder;
.source "IOpenID.java"

# interfaces
.implements Lrepeackage/com/heytap/openid/IOpenID;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrepeackage/com/heytap/openid/IOpenID;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrepeackage/com/heytap/openid/IOpenID$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.heytap.openid.IOpenID"

.field static final TRANSACTION_getSerID:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 60
    const-string v0, "com.heytap.openid.IOpenID"

    invoke-virtual {p0, p0, v0}, Lrepeackage/com/heytap/openid/IOpenID$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lrepeackage/com/heytap/openid/IOpenID;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 71
    :cond_0
    const-string v0, "com.heytap.openid.IOpenID"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 72
    instance-of v1, v0, Lrepeackage/com/heytap/openid/IOpenID;

    if-eqz v1, :cond_1

    .line 73
    check-cast v0, Lrepeackage/com/heytap/openid/IOpenID;

    return-object v0

    .line 75
    :cond_1
    new-instance v0, Lrepeackage/com/heytap/openid/IOpenID$Stub$Proxy;

    invoke-direct {v0, p0}, Lrepeackage/com/heytap/openid/IOpenID$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public static getDefaultImpl()Lrepeackage/com/heytap/openid/IOpenID;
    .locals 1

    .line 163
    sget-object v0, Lrepeackage/com/heytap/openid/IOpenID$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/heytap/openid/IOpenID;

    return-object v0
.end method

.method public static setDefaultImpl(Lrepeackage/com/heytap/openid/IOpenID;)Z
    .locals 1

    .line 155
    sget-object v0, Lrepeackage/com/heytap/openid/IOpenID$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/heytap/openid/IOpenID;

    if-nez v0, :cond_0

    if-eqz p0, :cond_0

    .line 156
    sput-object p0, Lrepeackage/com/heytap/openid/IOpenID$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/heytap/openid/IOpenID;

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
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

    .line 86
    const-string v1, "com.heytap.openid.IOpenID"

    if-eq p1, v0, :cond_1

    const v2, 0x5f4e5446

    if-eq p1, v2, :cond_0

    .line 105
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result p1

    return p1

    .line 88
    :cond_0
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0

    .line 92
    :cond_1
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 94
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    .line 96
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p4

    .line 98
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p2

    .line 99
    invoke-virtual {p0, p1, p4, p2}, Lrepeackage/com/heytap/openid/IOpenID$Stub;->getSerID(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 100
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 101
    invoke-virtual {p3, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return v0
.end method
