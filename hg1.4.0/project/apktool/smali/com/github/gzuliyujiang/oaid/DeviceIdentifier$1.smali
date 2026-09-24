.class Lcom/github/gzuliyujiang/oaid/DeviceIdentifier$1;
.super Ljava/lang/Object;
.source "DeviceIdentifier.java"

# interfaces
.implements Lcom/github/gzuliyujiang/oaid/IGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->getOAID(Landroid/content/Context;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onOAIDGetComplete(Ljava/lang/String;)V
    .locals 0

    .line 174
    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->access$002(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public onOAIDGetError(Ljava/lang/Exception;)V
    .locals 0

    .line 179
    const-string p1, ""

    invoke-static {p1}, Lcom/github/gzuliyujiang/oaid/DeviceIdentifier;->access$002(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method
