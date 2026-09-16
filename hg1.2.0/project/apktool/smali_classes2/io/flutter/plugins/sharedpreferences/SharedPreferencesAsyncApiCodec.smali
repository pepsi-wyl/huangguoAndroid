.class final Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApiCodec;
.super Lio/flutter/plugin/common/StandardMessageCodec;
.source "MessagesAsync.g.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0005\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u00c2\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u001a\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008H\u0014J\u001a\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u0004H\u0014\u00a8\u0006\u000e"
    }
    d2 = {
        "Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApiCodec;",
        "Lio/flutter/plugin/common/StandardMessageCodec;",
        "()V",
        "readValueOfType",
        "",
        "type",
        "",
        "buffer",
        "Ljava/nio/ByteBuffer;",
        "writeValue",
        "",
        "stream",
        "Ljava/io/ByteArrayOutputStream;",
        "value",
        "shared_preferences_android_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApiCodec;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApiCodec;

    invoke-direct {v0}, Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApiCodec;-><init>()V

    sput-object v0, Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApiCodec;->INSTANCE:Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApiCodec;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 64
    invoke-direct {p0}, Lio/flutter/plugin/common/StandardMessageCodec;-><init>()V

    return-void
.end method


# virtual methods
.method protected readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;
    .locals 1

    const-string v0, "buffer"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v0, -0x80

    if-ne p1, v0, :cond_2

    .line 68
    invoke-virtual {p0, p2}, Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApiCodec;->readValue(Ljava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    instance-of p2, p1, Ljava/util/List;

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    check-cast p1, Ljava/util/List;

    goto :goto_0

    :cond_0
    move-object p1, v0

    :goto_0
    if-eqz p1, :cond_1

    .line 69
    sget-object p2, Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;->Companion:Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions$Companion;

    invoke-virtual {p2, p1}, Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions$Companion;->fromList(Ljava/util/List;)Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;

    move-result-object v0

    :cond_1
    return-object v0

    .line 72
    :cond_2
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->readValueOfType(BLjava/nio/ByteBuffer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method protected writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V
    .locals 1

    const-string v0, "stream"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 78
    instance-of v0, p2, Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;

    if-eqz v0, :cond_0

    const/16 v0, 0x80

    .line 79
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 80
    check-cast p2, Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;

    invoke-virtual {p2}, Lio/flutter/plugins/sharedpreferences/SharedPreferencesPigeonOptions;->toList()Ljava/util/List;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lio/flutter/plugins/sharedpreferences/SharedPreferencesAsyncApiCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    goto :goto_0

    .line 82
    :cond_0
    invoke-super {p0, p1, p2}, Lio/flutter/plugin/common/StandardMessageCodec;->writeValue(Ljava/io/ByteArrayOutputStream;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
