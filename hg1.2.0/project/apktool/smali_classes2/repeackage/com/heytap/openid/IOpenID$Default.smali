.class public Lrepeackage/com/heytap/openid/IOpenID$Default;
.super Ljava/lang/Object;
.source "IOpenID.java"

# interfaces
.implements Lrepeackage/com/heytap/openid/IOpenID;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrepeackage/com/heytap/openid/IOpenID;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Default"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getSerID(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method
