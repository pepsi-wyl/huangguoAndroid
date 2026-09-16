.class public final Lcom/example/image_gallery_saver_plus/SaveResultModel;
.super Ljava/lang/Object;
.source "ImageGallerySaverPlusPlugin.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0002\u0010\u0007J&\u0010\u0011\u001a\"\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0012j\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u0001`\u0013R\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0008\u0010\t\"\u0004\u0008\n\u0010\u000bR\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000c\u0010\t\"\u0004\u0008\r\u0010\u000bR\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0002\u0010\u000e\"\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/example/image_gallery_saver_plus/SaveResultModel;",
        "",
        "isSuccess",
        "",
        "filePath",
        "",
        "errorMessage",
        "(ZLjava/lang/String;Ljava/lang/String;)V",
        "getErrorMessage",
        "()Ljava/lang/String;",
        "setErrorMessage",
        "(Ljava/lang/String;)V",
        "getFilePath",
        "setFilePath",
        "()Z",
        "setSuccess",
        "(Z)V",
        "toHashMap",
        "Ljava/util/HashMap;",
        "Lkotlin/collections/HashMap;",
        "image_gallery_saver_plus_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private errorMessage:Ljava/lang/String;

.field private filePath:Ljava/lang/String;

.field private isSuccess:Z


# direct methods
.method public constructor <init>(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->isSuccess:Z

    .line 239
    iput-object p2, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->filePath:Ljava/lang/String;

    .line 240
    iput-object p3, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->errorMessage:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/String;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    and-int/lit8 p5, p4, 0x2

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    move-object p2, v0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    move-object p3, v0

    .line 238
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/example/image_gallery_saver_plus/SaveResultModel;-><init>(ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final getErrorMessage()Ljava/lang/String;
    .locals 1

    .line 240
    iget-object v0, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->errorMessage:Ljava/lang/String;

    return-object v0
.end method

.method public final getFilePath()Ljava/lang/String;
    .locals 1

    .line 239
    iget-object v0, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->filePath:Ljava/lang/String;

    return-object v0
.end method

.method public final isSuccess()Z
    .locals 1

    .line 238
    iget-boolean v0, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->isSuccess:Z

    return v0
.end method

.method public final setErrorMessage(Ljava/lang/String;)V
    .locals 0

    .line 240
    iput-object p1, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->errorMessage:Ljava/lang/String;

    return-void
.end method

.method public final setFilePath(Ljava/lang/String;)V
    .locals 0

    .line 239
    iput-object p1, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->filePath:Ljava/lang/String;

    return-void
.end method

.method public final setSuccess(Z)V
    .locals 0

    .line 238
    iput-boolean p1, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->isSuccess:Z

    return-void
.end method

.method public final toHashMap()Ljava/util/HashMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 242
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 243
    move-object v1, v0

    check-cast v1, Ljava/util/Map;

    iget-boolean v2, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->isSuccess:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "isSuccess"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    const-string v2, "filePath"

    iget-object v3, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->filePath:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    const-string v2, "errorMessage"

    iget-object v3, p0, Lcom/example/image_gallery_saver_plus/SaveResultModel;->errorMessage:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method
