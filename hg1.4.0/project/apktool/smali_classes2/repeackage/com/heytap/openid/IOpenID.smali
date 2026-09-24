.class public interface abstract Lrepeackage/com/heytap/openid/IOpenID;
.super Ljava/lang/Object;
.source "IOpenID.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrepeackage/com/heytap/openid/IOpenID$Stub;,
        Lrepeackage/com/heytap/openid/IOpenID$Default;
    }
.end annotation


# virtual methods
.method public abstract getSerID(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
