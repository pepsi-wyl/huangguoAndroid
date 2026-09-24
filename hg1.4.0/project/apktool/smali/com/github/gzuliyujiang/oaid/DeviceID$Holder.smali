.class Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;
.super Ljava/lang/Object;
.source "DeviceID.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/gzuliyujiang/oaid/DeviceID;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Holder"
.end annotation


# static fields
.field static final INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 592
    new-instance v0, Lcom/github/gzuliyujiang/oaid/DeviceID;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/github/gzuliyujiang/oaid/DeviceID;-><init>(Lcom/github/gzuliyujiang/oaid/DeviceID$1;)V

    sput-object v0, Lcom/github/gzuliyujiang/oaid/DeviceID$Holder;->INSTANCE:Lcom/github/gzuliyujiang/oaid/DeviceID;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 591
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
