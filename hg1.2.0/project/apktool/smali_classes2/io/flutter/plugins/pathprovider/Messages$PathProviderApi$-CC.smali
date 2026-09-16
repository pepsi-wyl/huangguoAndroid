.class public final synthetic Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$-CC;
.super Ljava/lang/Object;
.source "Messages.java"


# direct methods
.method public static getCodec()Lio/flutter/plugin/common/MessageCodec;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/flutter/plugin/common/MessageCodec<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 101
    new-instance v0, Lio/flutter/plugin/common/StandardMessageCodec;

    invoke-direct {v0}, Lio/flutter/plugin/common/StandardMessageCodec;-><init>()V

    return-object v0
.end method

.method public static synthetic lambda$setup$0(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 118
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 120
    :try_start_0
    invoke-interface {p0}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;->getTemporaryPath()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    .line 121
    invoke-virtual {p1, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 123
    invoke-static {p0}, Lio/flutter/plugins/pathprovider/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 126
    :goto_0
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setup$1(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 143
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 145
    :try_start_0
    invoke-interface {p0}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;->getApplicationSupportPath()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    .line 146
    invoke-virtual {p1, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 148
    invoke-static {p0}, Lio/flutter/plugins/pathprovider/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 151
    :goto_0
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setup$2(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 168
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 170
    :try_start_0
    invoke-interface {p0}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;->getApplicationDocumentsPath()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    .line 171
    invoke-virtual {p1, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 173
    invoke-static {p0}, Lio/flutter/plugins/pathprovider/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 176
    :goto_0
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setup$3(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 193
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 195
    :try_start_0
    invoke-interface {p0}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;->getApplicationCachePath()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    .line 196
    invoke-virtual {p1, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 198
    invoke-static {p0}, Lio/flutter/plugins/pathprovider/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 201
    :goto_0
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setup$4(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 218
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 220
    :try_start_0
    invoke-interface {p0}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;->getExternalStoragePath()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    .line 221
    invoke-virtual {p1, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 223
    invoke-static {p0}, Lio/flutter/plugins/pathprovider/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 226
    :goto_0
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setup$5(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 243
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 245
    :try_start_0
    invoke-interface {p0}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;->getExternalCachePaths()Ljava/util/List;

    move-result-object p0

    const/4 v0, 0x0

    .line 246
    invoke-virtual {p1, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 248
    invoke-static {p0}, Lio/flutter/plugins/pathprovider/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 251
    :goto_0
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$setup$6(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 268
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 269
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 271
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-static {}, Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;->values()[Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;

    move-result-object v2

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    aget-object p1, v2, p1

    .line 273
    :goto_0
    :try_start_0
    invoke-interface {p0, p1}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;->getExternalStoragePaths(Lio/flutter/plugins/pathprovider/Messages$StorageDirectory;)Ljava/util/List;

    move-result-object p0

    .line 274
    invoke-virtual {v0, v1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 276
    invoke-static {p0}, Lio/flutter/plugins/pathprovider/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object v0

    .line 279
    :goto_1
    invoke-interface {p2, v0}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static setup(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;)V
    .locals 5

    .line 108
    invoke-interface {p0}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v0

    .line 109
    new-instance v1, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v2, "dev.flutter.pigeon.PathProviderApi.getTemporaryPath"

    .line 113
    invoke-static {}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 116
    new-instance v2, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;)V

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_0

    .line 129
    :cond_0
    invoke-virtual {v1, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 133
    :goto_0
    invoke-interface {p0}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v1

    .line 134
    new-instance v2, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v3, "dev.flutter.pigeon.PathProviderApi.getApplicationSupportPath"

    .line 138
    invoke-static {}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    if-eqz p1, :cond_1

    .line 141
    new-instance v1, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;)V

    invoke-virtual {v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_1

    .line 154
    :cond_1
    invoke-virtual {v2, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 158
    :goto_1
    invoke-interface {p0}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v1

    .line 159
    new-instance v2, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v3, "dev.flutter.pigeon.PathProviderApi.getApplicationDocumentsPath"

    .line 163
    invoke-static {}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    if-eqz p1, :cond_2

    .line 166
    new-instance v1, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;)V

    invoke-virtual {v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_2

    .line 179
    :cond_2
    invoke-virtual {v2, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 183
    :goto_2
    invoke-interface {p0}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v1

    .line 184
    new-instance v2, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v3, "dev.flutter.pigeon.PathProviderApi.getApplicationCachePath"

    .line 188
    invoke-static {}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    if-eqz p1, :cond_3

    .line 191
    new-instance v1, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;)V

    invoke-virtual {v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_3

    .line 204
    :cond_3
    invoke-virtual {v2, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 208
    :goto_3
    invoke-interface {p0}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v1

    .line 209
    new-instance v2, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v3, "dev.flutter.pigeon.PathProviderApi.getExternalStoragePath"

    .line 213
    invoke-static {}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    if-eqz p1, :cond_4

    .line 216
    new-instance v1, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda4;

    invoke-direct {v1, p1}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda4;-><init>(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;)V

    invoke-virtual {v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_4

    .line 229
    :cond_4
    invoke-virtual {v2, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 233
    :goto_4
    invoke-interface {p0}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v1

    .line 234
    new-instance v2, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v3, "dev.flutter.pigeon.PathProviderApi.getExternalCachePaths"

    .line 238
    invoke-static {}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    if-eqz p1, :cond_5

    .line 241
    new-instance v1, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda5;

    invoke-direct {v1, p1}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda5;-><init>(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;)V

    invoke-virtual {v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_5

    .line 254
    :cond_5
    invoke-virtual {v2, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 258
    :goto_5
    invoke-interface {p0}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v1

    .line 259
    new-instance v2, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v3, "dev.flutter.pigeon.PathProviderApi.getExternalStoragePaths"

    .line 263
    invoke-static {}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    if-eqz p1, :cond_6

    .line 266
    new-instance p0, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda6;

    invoke-direct {p0, p1}, Lio/flutter/plugins/pathprovider/Messages$PathProviderApi$$ExternalSyntheticLambda6;-><init>(Lio/flutter/plugins/pathprovider/Messages$PathProviderApi;)V

    invoke-virtual {v2, p0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_6

    .line 282
    :cond_6
    invoke-virtual {v2, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    :goto_6
    return-void
.end method
