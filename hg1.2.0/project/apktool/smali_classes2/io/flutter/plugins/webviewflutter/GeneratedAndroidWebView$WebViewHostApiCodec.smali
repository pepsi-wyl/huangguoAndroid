.class Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApiCodec;
.super Lio/flutter/plugin/common/StandardMessageCodec;
.source "GeneratedAndroidWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WebViewHostApiCodec"
.end annotation


# static fields
.field public static final INSTANCE:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApiCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 937
    new-instance v0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApiCodec;

    invoke-direct {v0}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApiCodec;-><init>()V

    sput-object v0, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApiCodec;->INSTANCE:Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApiCodec;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 939
    invoke-direct {p0}, Lio/flutter/plugin/common/StandardMessageCodec;-><init>()V

    return-void
.end method


# virtual methods
.method protected readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 1

    const/16 v0, -0x80

    if-eq p1, v0, :cond_0

    .line 947
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 945
    :cond_0
    invoke-virtual {p0, p2}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint;->fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint;

    move-result-object p1

    return-object p1
.end method

.method protected writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V
    .locals 1

    .line 953
    instance-of v0, p2, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint;

    if-eqz v0, :cond_0

    const/16 v0, 0x80

    .line 954
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 955
    check-cast p2, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint;

    invoke-virtual {p2}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewPoint;->toList()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/webviewflutter/GeneratedAndroidWebView$WebViewHostApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 957
    :cond_0
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
