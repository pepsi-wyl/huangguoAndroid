.class Lio/flutter/plugins/urllauncher/Messages$UrlLauncherApiCodec;
.super Lio/flutter/plugin/common/StandardMessageCodec;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/urllauncher/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UrlLauncherApiCodec"
.end annotation


# static fields
.field public static final INSTANCE:Lio/flutter/plugins/urllauncher/Messages$UrlLauncherApiCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 209
    new-instance v0, Lio/flutter/plugins/urllauncher/Messages$UrlLauncherApiCodec;

    invoke-direct {v0}, Lio/flutter/plugins/urllauncher/Messages$UrlLauncherApiCodec;-><init>()V

    sput-object v0, Lio/flutter/plugins/urllauncher/Messages$UrlLauncherApiCodec;->INSTANCE:Lio/flutter/plugins/urllauncher/Messages$UrlLauncherApiCodec;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 211
    invoke-direct {p0}, Lio/flutter/plugin/common/StandardMessageCodec;-><init>()V

    return-void
.end method


# virtual methods
.method protected readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 1

    const/16 v0, -0x80

    if-eq p1, v0, :cond_1

    const/16 v0, -0x7f

    if-eq p1, v0, :cond_0

    .line 221
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 219
    :cond_0
    invoke-virtual {p0, p2}, Lio/flutter/plugins/urllauncher/Messages$UrlLauncherApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;

    move-result-object p1

    return-object p1

    .line 217
    :cond_1
    invoke-virtual {p0, p2}, Lio/flutter/plugins/urllauncher/Messages$UrlLauncherApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;

    move-result-object p1

    return-object p1
.end method

.method protected writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V
    .locals 1

    .line 227
    instance-of v0, p2, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;

    if-eqz v0, :cond_0

    const/16 v0, 0x80

    .line 228
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 229
    check-cast p2, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;

    invoke-virtual {p2}, Lio/flutter/plugins/urllauncher/Messages$BrowserOptions;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/urllauncher/Messages$UrlLauncherApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 230
    :cond_0
    instance-of v0, p2, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;

    if-eqz v0, :cond_1

    const/16 v0, 0x81

    .line 231
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 232
    check-cast p2, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;

    invoke-virtual {p2}, Lio/flutter/plugins/urllauncher/Messages$WebViewOptions;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/urllauncher/Messages$UrlLauncherApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 234
    :cond_1
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
