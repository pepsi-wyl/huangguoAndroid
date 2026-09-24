.class public final Lrepeackage/com/qiku/id/QikuIdmanager;
.super Ljava/lang/Object;
.source "QikuIdmanager.java"


# static fields
.field public static CODE_GET_AAID:I = 0x6

.field public static CODE_GET_OAID:I = 0x4

.field public static CODE_GET_UDID:I = 0x3

.field public static CODE_GET_VAID:I = 0x5

.field public static CODE_IS_SUPPORTED:I = 0x2

.field public static final CODE_LIMIT_READ_OAID:I = 0x9

.field public static final CODE_RESET_OAID:I = 0x8

.field public static CODE_SHUTDOWN:I = 0x7


# instance fields
.field private mIBinder:Landroid/os/IBinder;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 8

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    .line 45
    :try_start_0
    const-string v1, "android.os.SystemProperties"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 46
    const-string v2, "get"

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const-class v5, Ljava/lang/String;

    const/4 v7, 0x1

    aput-object v5, v4, v7

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 47
    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "ro.build.uiversion"

    aput-object v4, v3, v6

    const-string v4, ""

    aput-object v4, v3, v7

    invoke-virtual {v2, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 48
    const-string v2, "360UI"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    const-string v1, "android.os.ServiceManager"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 50
    const-string v2, "getService"

    new-array v3, v7, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 51
    new-array v2, v7, [Ljava/lang/Object;

    const-string v3, "qikuid"

    aput-object v3, v2, v6

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/IBinder;

    iput-object v0, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 54
    const-string v1, "Failure get qikuid service"

    invoke-static {v1}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    .line 55
    invoke-static {v0}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void
.end method


# virtual methods
.method public getAAID()Ljava/lang/String;
    .locals 5

    .line 129
    iget-object v0, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    if-eqz v0, :cond_0

    .line 130
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 131
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 133
    :try_start_0
    iget-object v2, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    sget v3, Lrepeackage/com/qiku/id/QikuIdmanager;->CODE_GET_AAID:I

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 134
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 138
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 139
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    return-object v2

    :catchall_0
    move-exception v2

    goto :goto_0

    :catch_0
    move-exception v2

    .line 136
    :try_start_1
    invoke-static {v2}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 139
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    goto :goto_1

    .line 138
    :goto_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 139
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 140
    throw v2

    :cond_0
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOAID()Ljava/lang/String;
    .locals 5

    .line 95
    iget-object v0, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    if-eqz v0, :cond_0

    .line 96
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 97
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 99
    :try_start_0
    iget-object v2, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    sget v3, Lrepeackage/com/qiku/id/QikuIdmanager;->CODE_GET_OAID:I

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 100
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 105
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    return-object v2

    :catchall_0
    move-exception v2

    goto :goto_0

    :catch_0
    move-exception v2

    .line 102
    :try_start_1
    invoke-static {v2}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 105
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    goto :goto_1

    .line 104
    :goto_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 105
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 106
    throw v2

    :cond_0
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getUDID()Ljava/lang/String;
    .locals 5

    .line 78
    iget-object v0, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    if-eqz v0, :cond_0

    .line 79
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 80
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 82
    :try_start_0
    iget-object v2, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    sget v3, Lrepeackage/com/qiku/id/QikuIdmanager;->CODE_GET_UDID:I

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 83
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 88
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    return-object v2

    :catchall_0
    move-exception v2

    goto :goto_0

    :catch_0
    move-exception v2

    .line 85
    :try_start_1
    invoke-static {v2}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 88
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    goto :goto_1

    .line 87
    :goto_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 88
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 89
    throw v2

    :cond_0
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getVAID()Ljava/lang/String;
    .locals 5

    .line 112
    iget-object v0, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    if-eqz v0, :cond_0

    .line 113
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 114
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 116
    :try_start_0
    iget-object v2, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    sget v3, Lrepeackage/com/qiku/id/QikuIdmanager;->CODE_GET_VAID:I

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 117
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 122
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    return-object v2

    :catchall_0
    move-exception v2

    goto :goto_0

    :catch_0
    move-exception v2

    .line 119
    :try_start_1
    invoke-static {v2}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 122
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    goto :goto_1

    .line 121
    :goto_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 122
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 123
    throw v2

    :cond_0
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public isLimited()Z
    .locals 5

    .line 164
    iget-object v0, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 165
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 166
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 168
    :try_start_0
    iget-object v3, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    const/16 v4, 0x9

    invoke-interface {v3, v4, v0, v2, v1}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 169
    invoke-virtual {v2}, Landroid/os/Parcel;->readInt()I

    move-result v3
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_0

    const/4 v1, 0x1

    .line 173
    :cond_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 174
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    return v1

    :catchall_0
    move-exception v1

    goto :goto_0

    :catch_0
    move-exception v3

    .line 171
    :try_start_1
    invoke-static {v3}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 173
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 174
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    goto :goto_1

    .line 173
    :goto_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 174
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 175
    throw v1

    :cond_1
    :goto_1
    return v1
.end method

.method public isSupported()Z
    .locals 5

    .line 60
    iget-object v0, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 61
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 62
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    .line 64
    :try_start_0
    iget-object v3, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    sget v4, Lrepeackage/com/qiku/id/QikuIdmanager;->CODE_IS_SUPPORTED:I

    invoke-interface {v3, v4, v0, v2, v1}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 65
    invoke-virtual {v2}, Landroid/os/Parcel;->readInt()I

    move-result v3
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    const/4 v1, 0x1

    .line 70
    :cond_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 71
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    return v1

    :catchall_0
    move-exception v1

    goto :goto_0

    :catch_0
    move-exception v3

    .line 68
    :try_start_1
    invoke-static {v3}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 71
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    goto :goto_1

    .line 70
    :goto_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 71
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    .line 72
    throw v1

    :cond_1
    :goto_1
    return v1
.end method

.method public shutDown()V
    .locals 5

    .line 146
    iget-object v0, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    if-eqz v0, :cond_0

    .line 147
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 148
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    .line 150
    :try_start_0
    iget-object v2, p0, Lrepeackage/com/qiku/id/QikuIdmanager;->mIBinder:Landroid/os/IBinder;

    sget v3, Lrepeackage/com/qiku/id/QikuIdmanager;->CODE_SHUTDOWN:I

    const/4 v4, 0x0

    invoke-interface {v2, v3, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v2

    goto :goto_1

    :catch_0
    move-exception v2

    .line 152
    :try_start_1
    invoke-static {v2}, Lcom/github/gzuliyujiang/oaid/OAIDLog;->print(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 154
    :goto_0
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 155
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    goto :goto_2

    .line 154
    :goto_1
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 155
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 156
    throw v2

    :cond_0
    :goto_2
    return-void
.end method
