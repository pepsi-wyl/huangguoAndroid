.class final Lcom/baseflow/permissionhandler/PermissionConstants;
.super Ljava/lang/Object;
.source "PermissionConstants.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/baseflow/permissionhandler/PermissionConstants$ServiceStatus;,
        Lcom/baseflow/permissionhandler/PermissionConstants$PermissionStatus;,
        Lcom/baseflow/permissionhandler/PermissionConstants$PermissionGroup;
    }
.end annotation


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "permissions_handler"

.field static final PERMISSION_CODE:I = 0x18

.field static final PERMISSION_CODE_ACCESS_NOTIFICATION_POLICY:I = 0xd5

.field static final PERMISSION_CODE_IGNORE_BATTERY_OPTIMIZATIONS:I = 0xd1

.field static final PERMISSION_CODE_MANAGE_EXTERNAL_STORAGE:I = 0xd2

.field static final PERMISSION_CODE_REQUEST_INSTALL_PACKAGES:I = 0xd4

.field static final PERMISSION_CODE_SCHEDULE_EXACT_ALARM:I = 0xd6

.field static final PERMISSION_CODE_SYSTEM_ALERT_WINDOW:I = 0xd3

.field static final PERMISSION_GROUP_ACCESS_MEDIA_LOCATION:I = 0x12

.field static final PERMISSION_GROUP_ACCESS_NOTIFICATION_POLICY:I = 0x1b

.field static final PERMISSION_GROUP_ACTIVITY_RECOGNITION:I = 0x13

.field static final PERMISSION_GROUP_APP_TRACK_TRANSPARENCY:I = 0x19

.field static final PERMISSION_GROUP_AUDIO:I = 0x21

.field static final PERMISSION_GROUP_BLUETOOTH:I = 0x15

.field static final PERMISSION_GROUP_BLUETOOTH_ADVERTISE:I = 0x1d

.field static final PERMISSION_GROUP_BLUETOOTH_CONNECT:I = 0x1e

.field static final PERMISSION_GROUP_BLUETOOTH_SCAN:I = 0x1c

.field static final PERMISSION_GROUP_CALENDAR:I = 0x0

.field static final PERMISSION_GROUP_CAMERA:I = 0x1

.field static final PERMISSION_GROUP_CONTACTS:I = 0x2

.field static final PERMISSION_GROUP_CRITICAL_ALERTS:I = 0x1a

.field static final PERMISSION_GROUP_IGNORE_BATTERY_OPTIMIZATIONS:I = 0x10

.field static final PERMISSION_GROUP_LOCATION:I = 0x3

.field static final PERMISSION_GROUP_LOCATION_ALWAYS:I = 0x4

.field static final PERMISSION_GROUP_LOCATION_WHEN_IN_USE:I = 0x5

.field static final PERMISSION_GROUP_MANAGE_EXTERNAL_STORAGE:I = 0x16

.field static final PERMISSION_GROUP_MEDIA_LIBRARY:I = 0x6

.field static final PERMISSION_GROUP_MICROPHONE:I = 0x7

.field static final PERMISSION_GROUP_NEARBY_WIFI_DEVICES:I = 0x1f

.field static final PERMISSION_GROUP_NOTIFICATION:I = 0x11

.field static final PERMISSION_GROUP_PHONE:I = 0x8

.field static final PERMISSION_GROUP_PHOTOS:I = 0x9

.field static final PERMISSION_GROUP_PHOTOS_ADD_ONLY:I = 0xa

.field static final PERMISSION_GROUP_REMINDERS:I = 0xb

.field static final PERMISSION_GROUP_REQUEST_INSTALL_PACKAGES:I = 0x18

.field static final PERMISSION_GROUP_SCHEDULE_EXACT_ALARM:I = 0x22

.field static final PERMISSION_GROUP_SENSORS:I = 0xc

.field static final PERMISSION_GROUP_SENSORS_ALWAYS:I = 0x23

.field static final PERMISSION_GROUP_SMS:I = 0xd

.field static final PERMISSION_GROUP_SPEECH:I = 0xe

.field static final PERMISSION_GROUP_STORAGE:I = 0xf

.field static final PERMISSION_GROUP_SYSTEM_ALERT_WINDOW:I = 0x17

.field static final PERMISSION_GROUP_UNKNOWN:I = 0x14

.field static final PERMISSION_GROUP_VIDEOS:I = 0x20

.field static final PERMISSION_STATUS_DENIED:I = 0x0

.field static final PERMISSION_STATUS_GRANTED:I = 0x1

.field static final PERMISSION_STATUS_LIMITED:I = 0x3

.field static final PERMISSION_STATUS_NEVER_ASK_AGAIN:I = 0x4

.field static final PERMISSION_STATUS_RESTRICTED:I = 0x2

.field static final SERVICE_STATUS_DISABLED:I = 0x0

.field static final SERVICE_STATUS_ENABLED:I = 0x1

.field static final SERVICE_STATUS_NOT_APPLICABLE:I = 0x2


# direct methods
.method constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
