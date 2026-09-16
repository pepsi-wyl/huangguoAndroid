.class public final synthetic Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$-CC;
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

    .line 798
    sget-object v0, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApiCodec;->INSTANCE:Lio/flutter/plugins/imagepicker/Messages$ImagePickerApiCodec;

    return-object v0
.end method

.method public static synthetic lambda$setUp$0(Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 813
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 814
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 815
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/imagepicker/Messages$SourceSpecification;

    const/4 v2, 0x1

    .line 816
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;

    const/4 v3, 0x2

    .line 817
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;

    .line 818
    new-instance v3, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$1;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$1;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 831
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;->pickImages(Lio/flutter/plugins/imagepicker/Messages$SourceSpecification;Lio/flutter/plugins/imagepicker/Messages$ImageSelectionOptions;Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;Lio/flutter/plugins/imagepicker/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$1(Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 4

    .line 848
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 849
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 850
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/imagepicker/Messages$SourceSpecification;

    const/4 v2, 0x1

    .line 851
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;

    const/4 v3, 0x2

    .line 852
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;

    .line 853
    new-instance v3, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$2;

    invoke-direct {v3, v0, p2}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$2;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 866
    invoke-interface {p0, v1, v2, p1, v3}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;->pickVideos(Lio/flutter/plugins/imagepicker/Messages$SourceSpecification;Lio/flutter/plugins/imagepicker/Messages$VideoSelectionOptions;Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;Lio/flutter/plugins/imagepicker/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$2(Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 3

    .line 881
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 882
    check-cast p1, Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 884
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/flutter/plugins/imagepicker/Messages$MediaSelectionOptions;

    const/4 v2, 0x1

    .line 885
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;

    .line 886
    new-instance v2, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$3;

    invoke-direct {v2, v0, p2}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$3;-><init>(Ljava/util/ArrayList;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V

    .line 899
    invoke-interface {p0, v1, p1, v2}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;->pickMedia(Lio/flutter/plugins/imagepicker/Messages$MediaSelectionOptions;Lio/flutter/plugins/imagepicker/Messages$GeneralOptions;Lio/flutter/plugins/imagepicker/Messages$Result;)V

    return-void
.end method

.method public static synthetic lambda$setUp$3(Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;Ljava/lang/Object;Lio/flutter/plugin/common/BasicMessageChannel$Reply;)V
    .locals 1

    .line 916
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 918
    :try_start_0
    invoke-interface {p0}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;->retrieveLostResults()Lio/flutter/plugins/imagepicker/Messages$CacheRetrievalResult;

    move-result-object p0

    const/4 v0, 0x0

    .line 919
    invoke-virtual {p1, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 921
    invoke-static {p0}, Lio/flutter/plugins/imagepicker/Messages;->wrapError(Ljava/lang/Throwable;)Ljava/util/ArrayList;

    move-result-object p1

    .line 924
    :goto_0
    invoke-interface {p2, p1}, Lio/flutter/plugin/common/BasicMessageChannel$Reply;->reply(Ljava/lang/Object;)V

    return-void
.end method

.method public static setUp(Lio/flutter/plugin/common/BinaryMessenger;Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;)V
    .locals 5

    .line 803
    invoke-interface {p0}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v0

    .line 804
    new-instance v1, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v2, "dev.flutter.pigeon.image_picker_android.ImagePickerApi.pickImages"

    .line 808
    invoke-static {}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3, v0}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 811
    new-instance v2, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$$ExternalSyntheticLambda0;-><init>(Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;)V

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_0

    .line 834
    :cond_0
    invoke-virtual {v1, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 838
    :goto_0
    invoke-interface {p0}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v1

    .line 839
    new-instance v2, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v3, "dev.flutter.pigeon.image_picker_android.ImagePickerApi.pickVideos"

    .line 843
    invoke-static {}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    if-eqz p1, :cond_1

    .line 846
    new-instance v1, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$$ExternalSyntheticLambda1;-><init>(Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;)V

    invoke-virtual {v2, v1}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_1

    .line 869
    :cond_1
    invoke-virtual {v2, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 873
    :goto_1
    new-instance v1, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v2, "dev.flutter.pigeon.image_picker_android.ImagePickerApi.pickMedia"

    .line 877
    invoke-static {}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v3

    invoke-direct {v1, p0, v2, v3}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;)V

    if-eqz p1, :cond_2

    .line 879
    new-instance v2, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$$ExternalSyntheticLambda2;

    invoke-direct {v2, p1}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$$ExternalSyntheticLambda2;-><init>(Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;)V

    invoke-virtual {v1, v2}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_2

    .line 902
    :cond_2
    invoke-virtual {v1, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    .line 906
    :goto_2
    invoke-interface {p0}, Lio/flutter/plugin/common/BinaryMessenger;->makeBackgroundTaskQueue()Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;

    move-result-object v1

    .line 907
    new-instance v2, Lio/flutter/plugin/common/BasicMessageChannel;

    const-string v3, "dev.flutter.pigeon.image_picker_android.ImagePickerApi.retrieveLostResults"

    .line 911
    invoke-static {}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$-CC;->getCodec()Lio/flutter/plugin/common/MessageCodec;

    move-result-object v4

    invoke-direct {v2, p0, v3, v4, v1}, Lio/flutter/plugin/common/BasicMessageChannel;-><init>(Lio/flutter/plugin/common/BinaryMessenger;Ljava/lang/String;Lio/flutter/plugin/common/MessageCodec;Lio/flutter/plugin/common/BinaryMessenger$TaskQueue;)V

    if-eqz p1, :cond_3

    .line 914
    new-instance p0, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$$ExternalSyntheticLambda3;

    invoke-direct {p0, p1}, Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi$$ExternalSyntheticLambda3;-><init>(Lio/flutter/plugins/imagepicker/Messages$ImagePickerApi;)V

    invoke-virtual {v2, p0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    goto :goto_3

    .line 927
    :cond_3
    invoke-virtual {v2, v0}, Lio/flutter/plugin/common/BasicMessageChannel;->setMessageHandler(Lio/flutter/plugin/common/BasicMessageChannel$MessageHandler;)V

    :goto_3
    return-void
.end method
