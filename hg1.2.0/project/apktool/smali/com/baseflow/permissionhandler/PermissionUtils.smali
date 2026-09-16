.class public Lcom/baseflow/permissionhandler/PermissionUtils;
.super Ljava/lang/Object;
.source "PermissionUtils.java"


# static fields
.field static final SHARED_PREFERENCES_PERMISSION_WAS_DENIED_BEFORE_KEY:Ljava/lang/String; = "sp_permission_handler_permission_was_denied_before"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static determineBluetoothPermission(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 495
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    invoke-static {p0, v2, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    .line 497
    :cond_0
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1d

    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    if-ge p1, v0, :cond_3

    .line 498
    invoke-static {p0, v2, v1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    return-object v1

    .line 500
    :cond_1
    const-string p1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {p0, v2, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    return-object p1

    :cond_2
    return-object v2

    .line 505
    :cond_3
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v0, :cond_4

    invoke-static {p0, v2, v1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4

    return-object v1

    :cond_4
    return-object v2
.end method

.method static getManifestNames(Landroid/content/Context;I)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 100
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/16 v1, 0x17

    const/4 v2, 0x0

    const/16 v3, 0x21

    const/16 v4, 0x1d

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 190
    :pswitch_1
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_15

    .line 191
    const-string p1, "android.permission.BODY_SENSORS_BACKGROUND"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 192
    const-string p0, "android.permission.BODY_SENSORS_BACKGROUND"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 342
    :pswitch_2
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt p1, v1, :cond_15

    const-string p1, "android.permission.SCHEDULE_EXACT_ALARM"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 343
    const-string p0, "android.permission.SCHEDULE_EXACT_ALARM"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 336
    :pswitch_3
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_15

    const-string p1, "android.permission.READ_MEDIA_AUDIO"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 337
    const-string p0, "android.permission.READ_MEDIA_AUDIO"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 330
    :pswitch_4
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_15

    const-string p1, "android.permission.READ_MEDIA_VIDEO"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 331
    const-string p0, "android.permission.READ_MEDIA_VIDEO"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 318
    :pswitch_5
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_15

    const-string p1, "android.permission.NEARBY_WIFI_DEVICES"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 319
    const-string p0, "android.permission.NEARBY_WIFI_DEVICES"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 301
    :pswitch_6
    const-string p1, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {p0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->determineBluetoothPermission(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_15

    .line 304
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 290
    :pswitch_7
    const-string p1, "android.permission.BLUETOOTH_ADVERTISE"

    invoke-static {p0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->determineBluetoothPermission(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_15

    .line 293
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 279
    :pswitch_8
    const-string p1, "android.permission.BLUETOOTH_SCAN"

    invoke-static {p0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->determineBluetoothPermission(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_15

    .line 282
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 273
    :pswitch_9
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v1, :cond_15

    const-string p1, "android.permission.ACCESS_NOTIFICATION_POLICY"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 274
    const-string p0, "android.permission.ACCESS_NOTIFICATION_POLICY"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 267
    :pswitch_a
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v1, :cond_15

    const-string p1, "android.permission.REQUEST_INSTALL_PACKAGES"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 268
    const-string p0, "android.permission.REQUEST_INSTALL_PACKAGES"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 260
    :pswitch_b
    const-string p1, "android.permission.SYSTEM_ALERT_WINDOW"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 261
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 255
    :pswitch_c
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt p1, v1, :cond_15

    const-string p1, "android.permission.MANAGE_EXTERNAL_STORAGE"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 256
    const-string p0, "android.permission.MANAGE_EXTERNAL_STORAGE"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 248
    :pswitch_d
    const-string p1, "android.permission.BLUETOOTH"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 249
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 241
    :pswitch_e
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge p1, v4, :cond_0

    return-object v2

    .line 243
    :cond_0
    const-string p1, "android.permission.ACTIVITY_RECOGNITION"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 244
    const-string p0, "android.permission.ACTIVITY_RECOGNITION"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 232
    :pswitch_f
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge p1, v4, :cond_1

    return-object v2

    .line 234
    :cond_1
    const-string p1, "android.permission.ACCESS_MEDIA_LOCATION"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 235
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 312
    :pswitch_10
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_15

    const-string p1, "android.permission.POST_NOTIFICATIONS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 313
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 225
    :pswitch_11
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v1, :cond_15

    const-string p1, "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 226
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 214
    :pswitch_12
    const-string p1, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 215
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 217
    :cond_2
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v4, :cond_3

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ne p1, v4, :cond_15

    invoke-static {}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m$1()Z

    move-result p1

    if-eqz p1, :cond_15

    .line 218
    :cond_3
    const-string p1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 219
    const-string p0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 197
    :pswitch_13
    const-string p1, "android.permission.SEND_SMS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 198
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    :cond_4
    const-string p1, "android.permission.RECEIVE_SMS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 201
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 203
    :cond_5
    const-string p1, "android.permission.READ_SMS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_6

    .line 204
    const-string p1, "android.permission.READ_SMS"

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 206
    :cond_6
    const-string p1, "android.permission.RECEIVE_WAP_PUSH"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 207
    const-string p1, "android.permission.RECEIVE_WAP_PUSH"

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    :cond_7
    const-string p1, "android.permission.RECEIVE_MMS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 210
    const-string p0, "android.permission.RECEIVE_MMS"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 184
    :pswitch_14
    const-string p1, "android.permission.BODY_SENSORS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 185
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 324
    :pswitch_15
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_15

    const-string p1, "android.permission.READ_MEDIA_IMAGES"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 325
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 152
    :pswitch_16
    const-string p1, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 153
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    :cond_8
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-le p1, v4, :cond_9

    const-string p1, "android.permission.READ_PHONE_NUMBERS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 156
    const-string p1, "android.permission.READ_PHONE_NUMBERS"

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    :cond_9
    const-string p1, "android.permission.CALL_PHONE"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_a

    .line 160
    const-string p1, "android.permission.CALL_PHONE"

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    :cond_a
    const-string p1, "android.permission.READ_CALL_LOG"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_b

    .line 163
    const-string p1, "android.permission.READ_CALL_LOG"

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    :cond_b
    const-string p1, "android.permission.WRITE_CALL_LOG"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_c

    .line 166
    const-string p1, "android.permission.WRITE_CALL_LOG"

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 168
    :cond_c
    const-string p1, "com.android.voicemail.permission.ADD_VOICEMAIL"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_d

    .line 169
    const-string p1, "com.android.voicemail.permission.ADD_VOICEMAIL"

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    :cond_d
    const-string p1, "android.permission.USE_SIP"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_e

    .line 172
    const-string p1, "android.permission.USE_SIP"

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    :cond_e
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v4, :cond_f

    const-string p1, "android.permission.BIND_CALL_REDIRECTION_SERVICE"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_f

    .line 175
    const-string p1, "android.permission.BIND_CALL_REDIRECTION_SERVICE"

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 177
    :cond_f
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt p1, v1, :cond_15

    const-string p1, "android.permission.ANSWER_PHONE_CALLS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 178
    const-string p0, "android.permission.ANSWER_PHONE_CALLS"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 147
    :pswitch_17
    const-string p1, "android.permission.RECORD_AUDIO"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 148
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_18
    return-object v2

    :pswitch_19
    const/4 v1, 0x4

    if-ne p1, v1, :cond_10

    .line 133
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v4, :cond_10

    .line 134
    const-string p1, "android.permission.ACCESS_BACKGROUND_LOCATION"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 135
    const-string p0, "android.permission.ACCESS_BACKGROUND_LOCATION"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 139
    :cond_10
    const-string p1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 140
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    :cond_11
    const-string p1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 143
    const-string p0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 116
    :pswitch_1a
    const-string p1, "android.permission.READ_CONTACTS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 117
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    :cond_12
    const-string p1, "android.permission.WRITE_CONTACTS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 120
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    :cond_13
    const-string p1, "android.permission.GET_ACCOUNTS"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 123
    const-string p0, "android.permission.GET_ACCOUNTS"

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 111
    :pswitch_1b
    const-string p1, "android.permission.CAMERA"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 112
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 104
    :pswitch_1c
    const-string p1, "android.permission.READ_CALENDAR"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 105
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    :cond_14
    const-string p1, "android.permission.WRITE_CALENDAR"

    invoke-static {p0, v0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    .line 107
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_15
    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_19
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_0
        :pswitch_18
        :pswitch_14
        :pswitch_13
        :pswitch_17
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_18
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_0
        :pswitch_0
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private static getPackageInfo(Landroid/content/Context;)Landroid/content/pm/PackageInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .line 516
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 518
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_0

    .line 519
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-wide/16 v1, 0x1000

    invoke-static {v1, v2}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(J)Landroid/content/pm/PackageManager$PackageInfoFlags;

    move-result-object v1

    invoke-static {v0, p0, v1}, Lcom/example/analytics_sdk/AnalyticsSdkPlugin$$ExternalSyntheticApiModelOutline0;->m(Landroid/content/pm/PackageManager;Ljava/lang/String;Landroid/content/pm/PackageManager$PackageInfoFlags;)Landroid/content/pm/PackageInfo;

    move-result-object p0

    return-object p0

    .line 521
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0x1000

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    return-object p0
.end method

.method private static hasPermissionInManifest(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 356
    const-string v2, "permissions_handler"

    if-eqz p1, :cond_1

    .line 357
    :try_start_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 358
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return v0

    :catch_0
    move-exception p0

    goto :goto_0

    :cond_1
    if-nez p0, :cond_2

    .line 365
    const-string p0, "Unable to detect current Activity or App Context."

    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 369
    :cond_2
    invoke-static {p0}, Lcom/baseflow/permissionhandler/PermissionUtils;->getPackageInfo(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object p0

    if-nez p0, :cond_3

    .line 372
    const-string p0, "Unable to get Package info, will not be able to determine permissions to request."

    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 376
    :cond_3
    new-instance p1, Ljava/util/ArrayList;

    iget-object p0, p0, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 377
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 378
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_4

    return v0

    .line 383
    :goto_0
    const-string p1, "Unable to check manifest for permission: "

    invoke-static {v2, p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_5
    return v1
.end method

.method static isNeverAskAgainSelected(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 490
    :cond_0
    invoke-static {p0, p1}, Landroidx/core/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method static parseManifestName(Ljava/lang/String;)I
    .locals 25

    move-object/from16 v0, p0

    .line 25
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->hashCode()I

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/16 v2, 0x1e

    const/16 v3, 0x1d

    const/16 v4, 0x1c

    const/16 v5, 0x1b

    const/16 v6, 0x18

    const/16 v7, 0x17

    const/16 v8, 0x16

    const/16 v9, 0x14

    const/16 v10, 0x13

    const/16 v11, 0x12

    const/16 v12, 0x11

    const/16 v13, 0xf

    const/16 v14, 0xd

    const/16 v15, 0xc

    const/16 v16, 0x9

    const/16 v17, 0x8

    const/16 v18, 0x7

    const/16 v19, 0x4

    const/16 v20, 0x3

    const/16 v21, 0x2

    const/16 v22, 0x1

    const/16 v23, 0x0

    const/16 v24, -0x1

    sparse-switch v1, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v1, "com.android.voicemail.permission.ADD_VOICEMAIL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v24, 0x29

    goto/16 :goto_0

    :sswitch_1
    const-string v1, "android.permission.ACCESS_MEDIA_LOCATION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v24, 0x28

    goto/16 :goto_0

    :sswitch_2
    const-string v1, "android.permission.BLUETOOTH_SCAN"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v24, 0x27

    goto/16 :goto_0

    :sswitch_3
    const-string v1, "android.permission.ACCESS_BACKGROUND_LOCATION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v24, 0x26

    goto/16 :goto_0

    :sswitch_4
    const-string v1, "android.permission.READ_CONTACTS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v24, 0x25

    goto/16 :goto_0

    :sswitch_5
    const-string v1, "android.permission.RECORD_AUDIO"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v24, 0x24

    goto/16 :goto_0

    :sswitch_6
    const-string v1, "android.permission.ACTIVITY_RECOGNITION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v24, 0x23

    goto/16 :goto_0

    :sswitch_7
    const-string v1, "android.permission.REQUEST_INSTALL_PACKAGES"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v24, 0x22

    goto/16 :goto_0

    :sswitch_8
    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v24, 0x21

    goto/16 :goto_0

    :sswitch_9
    const-string v1, "android.permission.GET_ACCOUNTS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v24, 0x20

    goto/16 :goto_0

    :sswitch_a
    const-string v1, "android.permission.BLUETOOTH_ADVERTISE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v24, 0x1f

    goto/16 :goto_0

    :sswitch_b
    const-string v1, "android.permission.SCHEDULE_EXACT_ALARM"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v24, 0x1e

    goto/16 :goto_0

    :sswitch_c
    const-string v1, "android.permission.USE_SIP"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v24, 0x1d

    goto/16 :goto_0

    :sswitch_d
    const-string v1, "android.permission.READ_MEDIA_VIDEO"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v24, 0x1c

    goto/16 :goto_0

    :sswitch_e
    const-string v1, "android.permission.READ_MEDIA_AUDIO"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v24, 0x1b

    goto/16 :goto_0

    :sswitch_f
    const-string v1, "android.permission.WRITE_CALL_LOG"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v24, 0x1a

    goto/16 :goto_0

    :sswitch_10
    const-string v1, "android.permission.WRITE_CALENDAR"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v24, 0x19

    goto/16 :goto_0

    :sswitch_11
    const-string v1, "android.permission.CAMERA"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v24, 0x18

    goto/16 :goto_0

    :sswitch_12
    const-string v1, "android.permission.BODY_SENSORS_BACKGROUND"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v24, 0x17

    goto/16 :goto_0

    :sswitch_13
    const-string v1, "android.permission.WRITE_CONTACTS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v24, 0x16

    goto/16 :goto_0

    :sswitch_14
    const-string v1, "android.permission.READ_MEDIA_IMAGES"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v24, 0x15

    goto/16 :goto_0

    :sswitch_15
    const-string v1, "android.permission.CALL_PHONE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v24, 0x14

    goto/16 :goto_0

    :sswitch_16
    const-string v1, "android.permission.SEND_SMS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v24, 0x13

    goto/16 :goto_0

    :sswitch_17
    const-string v1, "android.permission.READ_PHONE_STATE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v24, 0x12

    goto/16 :goto_0

    :sswitch_18
    const-string v1, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v24, 0x11

    goto/16 :goto_0

    :sswitch_19
    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v24, 0x10

    goto/16 :goto_0

    :sswitch_1a
    const-string v1, "android.permission.BLUETOOTH_CONNECT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v24, 0xf

    goto/16 :goto_0

    :sswitch_1b
    const-string v1, "android.permission.RECEIVE_SMS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v24, 0xe

    goto/16 :goto_0

    :sswitch_1c
    const-string v1, "android.permission.RECEIVE_MMS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v24, 0xd

    goto/16 :goto_0

    :sswitch_1d
    const-string v1, "android.permission.BIND_CALL_REDIRECTION_SERVICE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v24, 0xc

    goto/16 :goto_0

    :sswitch_1e
    const-string v1, "android.permission.NEARBY_WIFI_DEVICES"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v24, 0xb

    goto/16 :goto_0

    :sswitch_1f
    const-string v1, "android.permission.READ_PHONE_NUMBERS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v24, 0xa

    goto/16 :goto_0

    :sswitch_20
    const-string v1, "android.permission.BODY_SENSORS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v24, 0x9

    goto/16 :goto_0

    :sswitch_21
    const-string v1, "android.permission.RECEIVE_WAP_PUSH"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v24, 0x8

    goto/16 :goto_0

    :sswitch_22
    const-string v1, "android.permission.SYSTEM_ALERT_WINDOW"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    goto :goto_0

    :cond_22
    const/16 v24, 0x7

    goto :goto_0

    :sswitch_23
    const-string v1, "android.permission.ACCESS_NOTIFICATION_POLICY"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    goto :goto_0

    :cond_23
    const/16 v24, 0x6

    goto :goto_0

    :sswitch_24
    const-string v1, "android.permission.MANAGE_EXTERNAL_STORAGE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    goto :goto_0

    :cond_24
    const/16 v24, 0x5

    goto :goto_0

    :sswitch_25
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    goto :goto_0

    :cond_25
    const/16 v24, 0x4

    goto :goto_0

    :sswitch_26
    const-string v1, "android.permission.READ_CALL_LOG"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    goto :goto_0

    :cond_26
    const/16 v24, 0x3

    goto :goto_0

    :sswitch_27
    const-string v1, "android.permission.POST_NOTIFICATIONS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_27

    goto :goto_0

    :cond_27
    const/16 v24, 0x2

    goto :goto_0

    :sswitch_28
    const-string v1, "android.permission.READ_CALENDAR"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    goto :goto_0

    :cond_28
    const/16 v24, 0x1

    goto :goto_0

    :sswitch_29
    const-string v1, "android.permission.READ_SMS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_29

    goto :goto_0

    :cond_29
    const/16 v24, 0x0

    :goto_0
    packed-switch v24, :pswitch_data_0

    return v9

    :pswitch_0
    return v11

    :pswitch_1
    return v4

    :pswitch_2
    return v19

    :pswitch_3
    return v18

    :pswitch_4
    return v10

    :pswitch_5
    return v6

    :pswitch_6
    return v3

    :pswitch_7
    const/16 v0, 0x22

    return v0

    :pswitch_8
    const/16 v0, 0x20

    return v0

    :pswitch_9
    const/16 v0, 0x21

    return v0

    :pswitch_a
    return v22

    :pswitch_b
    const/16 v0, 0x23

    return v0

    :pswitch_c
    return v21

    :pswitch_d
    return v16

    :pswitch_e
    return v13

    :pswitch_f
    return v2

    :pswitch_10
    const/16 v0, 0x1f

    return v0

    :pswitch_11
    return v15

    :pswitch_12
    return v7

    :pswitch_13
    return v5

    :pswitch_14
    return v8

    :pswitch_15
    return v20

    :pswitch_16
    return v17

    :pswitch_17
    return v12

    :pswitch_18
    return v23

    :pswitch_19
    return v14

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7aed85b0 -> :sswitch_29
        -0x72f13779 -> :sswitch_28
        -0x72ca2557 -> :sswitch_27
        -0x7286b8f4 -> :sswitch_26
        -0x70918bc1 -> :sswitch_25
        -0x6c1165bf -> :sswitch_24
        -0x6a47e915 -> :sswitch_23
        -0x5d1492dd -> :sswitch_22
        -0x583351d1 -> :sswitch_21
        -0x49cb6684 -> :sswitch_20
        -0x456a1f70 -> :sswitch_1f
        -0x363647ed -> :sswitch_1e
        -0x35b67cfd -> :sswitch_1d
        -0x3562fc09 -> :sswitch_1c
        -0x3562e583 -> :sswitch_1b
        -0x2f9abb27 -> :sswitch_1a
        -0x1833add0 -> :sswitch_19
        -0x3c1ac56 -> :sswitch_18
        -0x550ba9 -> :sswitch_17
        0x322a742 -> :sswitch_16
        0x6afff6d -> :sswitch_15
        0xa7a881c -> :sswitch_14
        0xcc96c13 -> :sswitch_13
        0x158e77d1 -> :sswitch_12
        0x1b9efa65 -> :sswitch_11
        0x23fb06fe -> :sswitch_10
        0x24658583 -> :sswitch_f
        0x2933cd92 -> :sswitch_e
        0x2a564637 -> :sswitch_d
        0x2ec2d2a2 -> :sswitch_c
        0x39db9e69 -> :sswitch_b
        0x4586b056 -> :sswitch_a
        0x4bcdda0f -> :sswitch_9
        0x516a29a7 -> :sswitch_8
        0x69eee241 -> :sswitch_7
        0x6a1dc9a7 -> :sswitch_6
        0x6d24f988 -> :sswitch_5
        0x75dd2d9c -> :sswitch_4
        0x78aeb38b -> :sswitch_3
        0x7aed10ce -> :sswitch_2
        0x7e09eacb -> :sswitch_1
        0x7f2f307d -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_19
        :pswitch_11
        :pswitch_16
        :pswitch_10
        :pswitch_16
        :pswitch_19
        :pswitch_19
        :pswitch_f
        :pswitch_e
        :pswitch_15
        :pswitch_16
        :pswitch_19
        :pswitch_16
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_18
        :pswitch_16
        :pswitch_9
        :pswitch_8
        :pswitch_16
        :pswitch_7
        :pswitch_6
        :pswitch_c
        :pswitch_e
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_c
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_16
    .end packed-switch
.end method

.method private static setPermissionDenied(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 553
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 554
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "sp_permission_handler_permission_was_denied_before"

    const/4 v0, 0x1

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static toPermissionStatus(Landroid/app/Activity;Ljava/lang/String;I)I
    .locals 3

    const/4 v0, -0x1

    const/4 v1, 0x1

    if-ne p2, v0, :cond_5

    .line 448
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x17

    const/4 v2, 0x0

    if-ge p2, v0, :cond_0

    return v2

    .line 452
    :cond_0
    invoke-static {p0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->wasPermissionDeniedBefore(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p2

    .line 453
    invoke-static {p0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->isNeverAskAgainSelected(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    xor-int/2addr v0, v1

    if-eqz p2, :cond_2

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    move v1, v0

    :goto_0
    if-nez p2, :cond_3

    if-eqz v1, :cond_3

    .line 459
    invoke-static {p0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->setPermissionDenied(Landroid/content/Context;Ljava/lang/String;)V

    :cond_3
    if-eqz p2, :cond_4

    if-eqz v1, :cond_4

    const/4 p0, 0x4

    return p0

    :cond_4
    return v2

    :cond_5
    return v1
.end method

.method static updatePermissionShouldShowStatus(Landroid/app/Activity;I)V
    .locals 0

    if-nez p0, :cond_0

    return-void

    .line 477
    :cond_0
    invoke-static {p0, p1}, Lcom/baseflow/permissionhandler/PermissionUtils;->getManifestNames(Landroid/content/Context;I)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 479
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    :cond_1
    return-void
.end method

.method private static wasPermissionDeniedBefore(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 538
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 539
    const-string p1, "sp_permission_handler_permission_was_denied_before"

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method
