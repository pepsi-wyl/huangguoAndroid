.class synthetic Lio/flutter/plugins/imagepicker/ImagePickerPlugin$1;
.super Ljava/lang/Object;
.source "ImagePickerPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/imagepicker/ImagePickerPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$io$flutter$plugins$imagepicker$Messages$SourceCamera:[I

.field static final synthetic $SwitchMap$io$flutter$plugins$imagepicker$Messages$SourceType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 300
    invoke-static {}, Lio/flutter/plugins/imagepicker/Messages$SourceType;->values()[Lio/flutter/plugins/imagepicker/Messages$SourceType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lio/flutter/plugins/imagepicker/ImagePickerPlugin$1;->$SwitchMap$io$flutter$plugins$imagepicker$Messages$SourceType:[I

    const/4 v1, 0x1

    :try_start_0
    sget-object v2, Lio/flutter/plugins/imagepicker/Messages$SourceType;->GALLERY:Lio/flutter/plugins/imagepicker/Messages$SourceType;

    invoke-virtual {v2}, Lio/flutter/plugins/imagepicker/Messages$SourceType;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    const/4 v0, 0x2

    :try_start_1
    sget-object v2, Lio/flutter/plugins/imagepicker/ImagePickerPlugin$1;->$SwitchMap$io$flutter$plugins$imagepicker$Messages$SourceType:[I

    sget-object v3, Lio/flutter/plugins/imagepicker/Messages$SourceType;->CAMERA:Lio/flutter/plugins/imagepicker/Messages$SourceType;

    invoke-virtual {v3}, Lio/flutter/plugins/imagepicker/Messages$SourceType;->ordinal()I

    move-result v3

    aput v0, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    .line 266
    :catch_1
    invoke-static {}, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->values()[Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    move-result-object v2

    array-length v2, v2

    new-array v2, v2, [I

    sput-object v2, Lio/flutter/plugins/imagepicker/ImagePickerPlugin$1;->$SwitchMap$io$flutter$plugins$imagepicker$Messages$SourceCamera:[I

    :try_start_2
    sget-object v3, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->FRONT:Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    invoke-virtual {v3}, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->ordinal()I

    move-result v3

    aput v1, v2, v3
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    :try_start_3
    sget-object v1, Lio/flutter/plugins/imagepicker/ImagePickerPlugin$1;->$SwitchMap$io$flutter$plugins$imagepicker$Messages$SourceCamera:[I

    sget-object v2, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->REAR:Lio/flutter/plugins/imagepicker/Messages$SourceCamera;

    invoke-virtual {v2}, Lio/flutter/plugins/imagepicker/Messages$SourceCamera;->ordinal()I

    move-result v2

    aput v0, v1, v2
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    return-void
.end method
