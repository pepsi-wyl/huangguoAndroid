.class public abstract Lrepeackage/com/oplus/stdid/IStdID$Stub;
.super Lrepeackage/com/heytap/openid/IOpenID$Stub;
.source "IStdID.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrepeackage/com/oplus/stdid/IStdID;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrepeackage/com/oplus/stdid/IStdID$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.oplus.stdid.IStdID"

.field static final TRANSACTION_getSerID:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Lrepeackage/com/heytap/openid/IOpenID$Stub;-><init>()V

    .line 28
    const-string v0, "com.oplus.stdid.IStdID"

    invoke-virtual {p0, p0, v0}, Lrepeackage/com/oplus/stdid/IStdID$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lrepeackage/com/oplus/stdid/IStdID;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 35
    :cond_0
    const-string v0, "com.oplus.stdid.IStdID"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 36
    instance-of v1, v0, Lrepeackage/com/oplus/stdid/IStdID;

    if-eqz v1, :cond_1

    .line 37
    check-cast v0, Lrepeackage/com/oplus/stdid/IStdID;

    return-object v0

    .line 39
    :cond_1
    new-instance v0, Lrepeackage/com/oplus/stdid/IStdID$Stub$Proxy;

    invoke-direct {v0, p0}, Lrepeackage/com/oplus/stdid/IStdID$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v0
.end method

.method public static getDefaultImpl()Lrepeackage/com/heytap/openid/IOpenID;
    .locals 1

    .line 95
    sget-object v0, Lrepeackage/com/oplus/stdid/IStdID$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/heytap/openid/IOpenID;

    return-object v0
.end method

.method public static setDefaultImpl(Lrepeackage/com/heytap/openid/IOpenID;)Z
    .locals 1

    .line 87
    sget-object v0, Lrepeackage/com/oplus/stdid/IStdID$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/heytap/openid/IOpenID;

    if-nez v0, :cond_0

    if-eqz p0, :cond_0

    .line 88
    sput-object p0, Lrepeackage/com/oplus/stdid/IStdID$Stub$Proxy;->sDefaultImpl:Lrepeackage/com/heytap/openid/IOpenID;

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
