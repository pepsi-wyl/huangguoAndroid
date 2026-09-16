package com.baseflow.permissionhandler;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* loaded from: classes.dex */
final class PermissionConstants {
    static final String LOG_TAG = "permissions_handler";
    static final int PERMISSION_CODE = 24;
    static final int PERMISSION_CODE_ACCESS_NOTIFICATION_POLICY = 213;
    static final int PERMISSION_CODE_IGNORE_BATTERY_OPTIMIZATIONS = 209;
    static final int PERMISSION_CODE_MANAGE_EXTERNAL_STORAGE = 210;
    static final int PERMISSION_CODE_REQUEST_INSTALL_PACKAGES = 212;
    static final int PERMISSION_CODE_SCHEDULE_EXACT_ALARM = 214;
    static final int PERMISSION_CODE_SYSTEM_ALERT_WINDOW = 211;
    static final int PERMISSION_GROUP_ACCESS_MEDIA_LOCATION = 18;
    static final int PERMISSION_GROUP_ACCESS_NOTIFICATION_POLICY = 27;
    static final int PERMISSION_GROUP_ACTIVITY_RECOGNITION = 19;
    static final int PERMISSION_GROUP_APP_TRACK_TRANSPARENCY = 25;
    static final int PERMISSION_GROUP_AUDIO = 33;
    static final int PERMISSION_GROUP_BLUETOOTH = 21;
    static final int PERMISSION_GROUP_BLUETOOTH_ADVERTISE = 29;
    static final int PERMISSION_GROUP_BLUETOOTH_CONNECT = 30;
    static final int PERMISSION_GROUP_BLUETOOTH_SCAN = 28;
    static final int PERMISSION_GROUP_CALENDAR = 0;
    static final int PERMISSION_GROUP_CAMERA = 1;
    static final int PERMISSION_GROUP_CONTACTS = 2;
    static final int PERMISSION_GROUP_CRITICAL_ALERTS = 26;
    static final int PERMISSION_GROUP_IGNORE_BATTERY_OPTIMIZATIONS = 16;
    static final int PERMISSION_GROUP_LOCATION = 3;
    static final int PERMISSION_GROUP_LOCATION_ALWAYS = 4;
    static final int PERMISSION_GROUP_LOCATION_WHEN_IN_USE = 5;
    static final int PERMISSION_GROUP_MANAGE_EXTERNAL_STORAGE = 22;
    static final int PERMISSION_GROUP_MEDIA_LIBRARY = 6;
    static final int PERMISSION_GROUP_MICROPHONE = 7;
    static final int PERMISSION_GROUP_NEARBY_WIFI_DEVICES = 31;
    static final int PERMISSION_GROUP_NOTIFICATION = 17;
    static final int PERMISSION_GROUP_PHONE = 8;
    static final int PERMISSION_GROUP_PHOTOS = 9;
    static final int PERMISSION_GROUP_PHOTOS_ADD_ONLY = 10;
    static final int PERMISSION_GROUP_REMINDERS = 11;
    static final int PERMISSION_GROUP_REQUEST_INSTALL_PACKAGES = 24;
    static final int PERMISSION_GROUP_SCHEDULE_EXACT_ALARM = 34;
    static final int PERMISSION_GROUP_SENSORS = 12;
    static final int PERMISSION_GROUP_SENSORS_ALWAYS = 35;
    static final int PERMISSION_GROUP_SMS = 13;
    static final int PERMISSION_GROUP_SPEECH = 14;
    static final int PERMISSION_GROUP_STORAGE = 15;
    static final int PERMISSION_GROUP_SYSTEM_ALERT_WINDOW = 23;
    static final int PERMISSION_GROUP_UNKNOWN = 20;
    static final int PERMISSION_GROUP_VIDEOS = 32;
    static final int PERMISSION_STATUS_DENIED = 0;
    static final int PERMISSION_STATUS_GRANTED = 1;
    static final int PERMISSION_STATUS_LIMITED = 3;
    static final int PERMISSION_STATUS_NEVER_ASK_AGAIN = 4;
    static final int PERMISSION_STATUS_RESTRICTED = 2;
    static final int SERVICE_STATUS_DISABLED = 0;
    static final int SERVICE_STATUS_ENABLED = 1;
    static final int SERVICE_STATUS_NOT_APPLICABLE = 2;

    @Retention(RetentionPolicy.SOURCE)
    @interface PermissionGroup {
    }

    @Retention(RetentionPolicy.SOURCE)
    @interface PermissionStatus {
    }

    @Retention(RetentionPolicy.SOURCE)
    @interface ServiceStatus {
    }

    PermissionConstants() {
    }
}
