package com.baseflow.permissionhandler;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.Log;
import androidx.core.app.ActivityCompat;
import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;
import androidx.core.content.ContextCompat;
import io.flutter.plugin.common.PluginRegistry;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
final class PermissionManager implements PluginRegistry.ActivityResultListener, PluginRegistry.RequestPermissionsResultListener {
    private Activity activity;
    private int pendingRequestCount;
    private Map<Integer, Integer> requestResults;
    private RequestPermissionsSuccessCallback successCallback;

    @FunctionalInterface
    interface CheckPermissionsSuccessCallback {
        void onSuccess(int i);
    }

    @FunctionalInterface
    interface RequestPermissionsSuccessCallback {
        void onSuccess(Map<Integer, Integer> map);
    }

    @FunctionalInterface
    interface ShouldShowRequestPermissionRationaleSuccessCallback {
        void onSuccess(boolean z);
    }

    PermissionManager() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v11 */
    /* JADX WARN: Type inference failed for: r10v14, types: [int] */
    /* JADX WARN: Type inference failed for: r10v18 */
    /* JADX WARN: Type inference failed for: r10v19 */
    /* JADX WARN: Type inference failed for: r10v20 */
    /* JADX WARN: Type inference failed for: r10v21 */
    /* JADX WARN: Type inference failed for: r10v22 */
    @Override // io.flutter.plugin.common.PluginRegistry.ActivityResultListener
    public boolean onActivityResult(int i, int i2, Intent intent) {
        int i3;
        ?? CanDrawOverlays;
        if (i != 209 && i != 210 && i != 211 && i != 212 && i != 213 && i != 214) {
            return false;
        }
        boolean z = i2 == -1;
        if (i == 209) {
            i3 = 16;
            CanDrawOverlays = z;
        } else if (i == 210) {
            if (Build.VERSION.SDK_INT < 30) {
                return false;
            }
            i3 = 22;
            CanDrawOverlays = Environment.isExternalStorageManager();
        } else if (i == 211) {
            if (Build.VERSION.SDK_INT < 23) {
                return false;
            }
            CanDrawOverlays = Settings.canDrawOverlays(this.activity);
            i3 = 23;
        } else if (i == 212) {
            if (Build.VERSION.SDK_INT < 26) {
                return false;
            }
            i3 = 24;
            CanDrawOverlays = this.activity.getPackageManager().canRequestPackageInstalls();
        } else if (i == 213) {
            if (Build.VERSION.SDK_INT < 23) {
                return false;
            }
            i3 = 27;
            CanDrawOverlays = ((NotificationManager) this.activity.getSystemService("notification")).isNotificationPolicyAccessGranted();
        } else {
            if (i != 214 || Build.VERSION.SDK_INT < 31) {
                return false;
            }
            i3 = 34;
            CanDrawOverlays = ((AlarmManager) this.activity.getSystemService(NotificationCompat.CATEGORY_ALARM)).canScheduleExactAlarms();
        }
        this.requestResults.put(Integer.valueOf(i3), Integer.valueOf((int) CanDrawOverlays));
        int i4 = this.pendingRequestCount - 1;
        this.pendingRequestCount = i4;
        if (i4 == 0) {
            this.successCallback.onSuccess(this.requestResults);
        }
        return true;
    }

    @Override // io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener
    public boolean onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        if (i != 24) {
            this.pendingRequestCount = 0;
            return false;
        }
        if (this.requestResults == null) {
            return false;
        }
        for (int i2 = 0; i2 < strArr.length; i2++) {
            String str = strArr[i2];
            int manifestName = PermissionUtils.parseManifestName(str);
            if (manifestName != 20) {
                int i3 = iArr[i2];
                if (manifestName == 7) {
                    if (!this.requestResults.containsKey(7)) {
                        this.requestResults.put(7, Integer.valueOf(PermissionUtils.toPermissionStatus(this.activity, str, i3)));
                    }
                    if (!this.requestResults.containsKey(14)) {
                        this.requestResults.put(14, Integer.valueOf(PermissionUtils.toPermissionStatus(this.activity, str, i3)));
                    }
                } else if (manifestName == 4) {
                    int permissionStatus = PermissionUtils.toPermissionStatus(this.activity, str, i3);
                    if (!this.requestResults.containsKey(4)) {
                        this.requestResults.put(4, Integer.valueOf(permissionStatus));
                    }
                } else if (manifestName == 3) {
                    int permissionStatus2 = PermissionUtils.toPermissionStatus(this.activity, str, i3);
                    if (Build.VERSION.SDK_INT < 29 && !this.requestResults.containsKey(4)) {
                        this.requestResults.put(4, Integer.valueOf(permissionStatus2));
                    }
                    if (!this.requestResults.containsKey(5)) {
                        this.requestResults.put(5, Integer.valueOf(permissionStatus2));
                    }
                    this.requestResults.put(Integer.valueOf(manifestName), Integer.valueOf(permissionStatus2));
                } else if (!this.requestResults.containsKey(Integer.valueOf(manifestName))) {
                    this.requestResults.put(Integer.valueOf(manifestName), Integer.valueOf(PermissionUtils.toPermissionStatus(this.activity, str, i3)));
                }
                PermissionUtils.updatePermissionShouldShowStatus(this.activity, manifestName);
            }
        }
        int length = this.pendingRequestCount - iArr.length;
        this.pendingRequestCount = length;
        if (length != 0) {
            return true;
        }
        this.successCallback.onSuccess(this.requestResults);
        return true;
    }

    void checkPermissionStatus(int i, Context context, CheckPermissionsSuccessCallback checkPermissionsSuccessCallback) {
        checkPermissionsSuccessCallback.onSuccess(determinePermissionStatus(i, context));
    }

    void requestPermissions(List<Integer> list, Activity activity, RequestPermissionsSuccessCallback requestPermissionsSuccessCallback, ErrorCallback errorCallback) {
        if (this.pendingRequestCount > 0) {
            errorCallback.onError("PermissionHandler.PermissionManager", "A request for permissions is already running, please wait for it to finish before doing another request (note that you can request multiple permissions at the same time).");
            return;
        }
        if (activity == null) {
            Log.d("permissions_handler", "Unable to detect current Activity.");
            errorCallback.onError("PermissionHandler.PermissionManager", "Unable to detect current Android Activity.");
            return;
        }
        this.successCallback = requestPermissionsSuccessCallback;
        this.activity = activity;
        this.requestResults = new HashMap();
        this.pendingRequestCount = 0;
        ArrayList arrayList = new ArrayList();
        for (Integer num : list) {
            if (determinePermissionStatus(num.intValue(), activity) == 1) {
                if (!this.requestResults.containsKey(num)) {
                    this.requestResults.put(num, 1);
                }
            } else {
                List<String> manifestNames = PermissionUtils.getManifestNames(activity, num.intValue());
                if (manifestNames == null || manifestNames.isEmpty()) {
                    if (!this.requestResults.containsKey(num)) {
                        if (num.intValue() == 16 && Build.VERSION.SDK_INT < 23) {
                            this.requestResults.put(num, 2);
                        } else {
                            this.requestResults.put(num, 0);
                        }
                        if (num.intValue() == 22 && Build.VERSION.SDK_INT < 30) {
                            this.requestResults.put(num, 2);
                        } else {
                            this.requestResults.put(num, 0);
                        }
                    }
                } else if (Build.VERSION.SDK_INT >= 23 && num.intValue() == 16) {
                    launchSpecialPermission("android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS", 209);
                } else if (Build.VERSION.SDK_INT >= 30 && num.intValue() == 22) {
                    launchSpecialPermission("android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION", 210);
                } else if (Build.VERSION.SDK_INT >= 23 && num.intValue() == 23) {
                    launchSpecialPermission("android.settings.action.MANAGE_OVERLAY_PERMISSION", 211);
                } else if (Build.VERSION.SDK_INT >= 26 && num.intValue() == 24) {
                    launchSpecialPermission("android.settings.MANAGE_UNKNOWN_APP_SOURCES", 212);
                } else if (Build.VERSION.SDK_INT >= 23 && num.intValue() == 27) {
                    launchSpecialPermission("android.settings.NOTIFICATION_POLICY_ACCESS_SETTINGS", 213);
                } else if (Build.VERSION.SDK_INT >= 31 && num.intValue() == 34) {
                    launchSpecialPermission("android.settings.REQUEST_SCHEDULE_EXACT_ALARM", 214);
                } else {
                    arrayList.addAll(manifestNames);
                    this.pendingRequestCount += manifestNames.size();
                }
            }
        }
        if (arrayList.size() > 0) {
            ActivityCompat.requestPermissions(activity, (String[]) arrayList.toArray(new String[0]), 24);
        }
        if (this.pendingRequestCount == 0) {
            this.successCallback.onSuccess(this.requestResults);
        }
    }

    private int determinePermissionStatus(int i, Context context) {
        if (i == 17) {
            return checkNotificationPermissionStatus(context);
        }
        if (i == 21) {
            return checkBluetoothPermissionStatus(context);
        }
        if ((i == 30 || i == 28 || i == 29) && Build.VERSION.SDK_INT < 31) {
            return checkBluetoothPermissionStatus(context);
        }
        List<String> manifestNames = PermissionUtils.getManifestNames(context, i);
        if (manifestNames == null) {
            Log.d("permissions_handler", "No android specific permissions needed for: " + i);
            return 1;
        }
        if (manifestNames.size() == 0) {
            Log.d("permissions_handler", "No permissions found in manifest for: " + manifestNames + i);
            if (i == 16 && Build.VERSION.SDK_INT < 23) {
                return 2;
            }
            if (i != 22 || Build.VERSION.SDK_INT >= 30) {
                return Build.VERSION.SDK_INT < 23 ? 1 : 0;
            }
            return 2;
        }
        boolean z = context.getApplicationInfo().targetSdkVersion >= 23;
        for (String str : manifestNames) {
            if (z) {
                if (i == 16) {
                    String packageName = context.getPackageName();
                    PowerManager powerManager = (PowerManager) context.getSystemService("power");
                    if (Build.VERSION.SDK_INT >= 23) {
                        return (powerManager == null || !powerManager.isIgnoringBatteryOptimizations(packageName)) ? 0 : 1;
                    }
                    return 2;
                }
                if (i == 22) {
                    if (Build.VERSION.SDK_INT < 30) {
                        return 2;
                    }
                    return Environment.isExternalStorageManager() ? 1 : 0;
                }
                if (i == 23 && Build.VERSION.SDK_INT >= 23) {
                    return Settings.canDrawOverlays(context) ? 1 : 0;
                }
                if (i == 24 && Build.VERSION.SDK_INT >= 26) {
                    return context.getPackageManager().canRequestPackageInstalls() ? 1 : 0;
                }
                if (i == 27 && Build.VERSION.SDK_INT >= 23) {
                    return ((NotificationManager) context.getSystemService("notification")).isNotificationPolicyAccessGranted() ? 1 : 0;
                }
                if (i == 34) {
                    if (Build.VERSION.SDK_INT >= 31) {
                        return ((AlarmManager) context.getSystemService(NotificationCompat.CATEGORY_ALARM)).canScheduleExactAlarms() ? 1 : 0;
                    }
                    return 1;
                }
                if (ContextCompat.checkSelfPermission(context, str) != 0) {
                    return 0;
                }
            }
        }
        return 1;
    }

    private void launchSpecialPermission(String str, int i) {
        Intent intent = new Intent(str);
        if (!str.equals("android.settings.NOTIFICATION_POLICY_ACCESS_SETTINGS")) {
            intent.setData(Uri.parse("package:" + this.activity.getPackageName()));
        }
        this.activity.startActivityForResult(intent, i);
        this.pendingRequestCount++;
    }

    void shouldShowRequestPermissionRationale(int i, Activity activity, ShouldShowRequestPermissionRationaleSuccessCallback shouldShowRequestPermissionRationaleSuccessCallback, ErrorCallback errorCallback) {
        if (activity == null) {
            Log.d("permissions_handler", "Unable to detect current Activity.");
            errorCallback.onError("PermissionHandler.PermissionManager", "Unable to detect current Android Activity.");
            return;
        }
        List<String> manifestNames = PermissionUtils.getManifestNames(activity, i);
        if (manifestNames == null) {
            Log.d("permissions_handler", "No android specific permissions needed for: " + i);
            shouldShowRequestPermissionRationaleSuccessCallback.onSuccess(false);
            return;
        }
        if (manifestNames.isEmpty()) {
            Log.d("permissions_handler", "No permissions found in manifest for: " + i + " no need to show request rationale");
            shouldShowRequestPermissionRationaleSuccessCallback.onSuccess(false);
            return;
        }
        shouldShowRequestPermissionRationaleSuccessCallback.onSuccess(ActivityCompat.shouldShowRequestPermissionRationale(activity, manifestNames.get(0)));
    }

    private int checkNotificationPermissionStatus(Context context) {
        return Build.VERSION.SDK_INT < 33 ? NotificationManagerCompat.from(context).areNotificationsEnabled() ? 1 : 0 : context.checkSelfPermission("android.permission.POST_NOTIFICATIONS") == 0 ? 1 : 0;
    }

    private int checkBluetoothPermissionStatus(Context context) {
        List<String> manifestNames = PermissionUtils.getManifestNames(context, 21);
        if (manifestNames != null && !manifestNames.isEmpty()) {
            return 1;
        }
        Log.d("permissions_handler", "Bluetooth permission missing in manifest");
        return 0;
    }
}
