package io.flutter.plugins.imagepicker;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.provider.MediaStore;
import androidx.activity.result.contract.ActivityResultContracts;
import io.flutter.plugins.imagepicker.Messages;
import java.util.Arrays;

/* loaded from: classes2.dex */
final class ImagePickerUtils {
    ImagePickerUtils() {
    }

    private static boolean isPermissionPresentInManifest(Context context, String str) throws PackageManager.NameNotFoundException {
        PackageInfo permissionsPackageInfoPreApi33;
        try {
            PackageManager packageManager = context.getPackageManager();
            if (Build.VERSION.SDK_INT >= 33) {
                permissionsPackageInfoPreApi33 = packageManager.getPackageInfo(context.getPackageName(), PackageManager.PackageInfoFlags.of(4096L));
            } else {
                permissionsPackageInfoPreApi33 = getPermissionsPackageInfoPreApi33(packageManager, context.getPackageName());
            }
            return Arrays.asList(permissionsPackageInfoPreApi33.requestedPermissions).contains(str);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static PackageInfo getPermissionsPackageInfoPreApi33(PackageManager packageManager, String str) throws PackageManager.NameNotFoundException {
        return packageManager.getPackageInfo(str, 4096);
    }

    static boolean needRequestCameraPermission(Context context) {
        return Build.VERSION.SDK_INT >= 23 && isPermissionPresentInManifest(context, "android.permission.CAMERA");
    }

    static int getMaxItems() {
        if (ActivityResultContracts.PickVisualMedia.INSTANCE.isSystemPickerAvailable$activity_release()) {
            return MediaStore.getPickImagesMaxLimit();
        }
        return Integer.MAX_VALUE;
    }

    static int getLimitFromOption(Messages.GeneralOptions generalOptions) {
        Long limit = generalOptions.getLimit();
        int maxItems = getMaxItems();
        return (limit == null || limit.longValue() >= ((long) maxItems)) ? maxItems : ImagePickerUtils$$ExternalSyntheticBackport1.m(limit.longValue());
    }
}
