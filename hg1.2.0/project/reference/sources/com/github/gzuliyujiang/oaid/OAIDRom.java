package com.github.gzuliyujiang.oaid;

import android.content.Context;
import android.os.Build;
import android.text.TextUtils;

/* loaded from: classes.dex */
public final class OAIDRom {
    private OAIDRom() {
    }

    public static String sysProperty(String str, String str2) {
        String str3;
        try {
            Class<?> cls = Class.forName("android.os.SystemProperties");
            str3 = (String) cls.getMethod("get", String.class, String.class).invoke(cls, str, str2);
        } catch (Throwable th) {
            OAIDLog.print("System property invoke error: " + th);
            str3 = null;
        }
        return str3 == null ? "" : str3;
    }

    public static boolean isHuawei() {
        return Build.MANUFACTURER.equalsIgnoreCase("HUAWEI") || Build.BRAND.equalsIgnoreCase("HUAWEI");
    }

    public static boolean isHonor() {
        return Build.BRAND.equalsIgnoreCase("HONOR");
    }

    public static boolean isHarmonyOS() {
        try {
            Class<?> cls = Class.forName("com.huawei.system.BuildEx");
            Object objInvoke = cls.getMethod("getOsBrand", new Class[0]).invoke(cls, new Object[0]);
            if (objInvoke != null) {
                return objInvoke.toString().length() > 0;
            }
            return false;
        } catch (Throwable unused) {
            return false;
        }
    }

    public static boolean isEmui() {
        return !TextUtils.isEmpty(sysProperty("ro.build.version.emui", ""));
    }

    public static boolean isMagicUI() {
        return !TextUtils.isEmpty(sysProperty("ro.build.version.magic", ""));
    }

    public static boolean isOppo() {
        return Build.MANUFACTURER.equalsIgnoreCase("OPPO") || Build.BRAND.equalsIgnoreCase("OPPO") || Build.BRAND.equalsIgnoreCase("REALME") || !TextUtils.isEmpty(sysProperty("ro.build.version.opporom", ""));
    }

    public static boolean isVivo() {
        return Build.MANUFACTURER.equalsIgnoreCase("VIVO") || Build.BRAND.equalsIgnoreCase("VIVO") || !TextUtils.isEmpty(sysProperty("ro.vivo.os.version", ""));
    }

    public static boolean isXiaomi() {
        return Build.MANUFACTURER.equalsIgnoreCase("XIAOMI") || Build.BRAND.equalsIgnoreCase("XIAOMI") || Build.BRAND.equalsIgnoreCase("REDMI");
    }

    public static boolean isBlackShark() {
        return Build.MANUFACTURER.equalsIgnoreCase("BLACKSHARK") || Build.BRAND.equalsIgnoreCase("BLACKSHARK");
    }

    public static boolean isMiui() {
        return !TextUtils.isEmpty(sysProperty("ro.miui.ui.version.name", ""));
    }

    public static boolean isMiuiGlobal() {
        if (TextUtils.isEmpty(sysProperty("ro.com.google.gmsversion", ""))) {
            return !sysProperty("ro.miui.region", "").equalsIgnoreCase("CN") && sysProperty("ro.product.mod_device", "").endsWith("_global");
        }
        return true;
    }

    public static boolean isOnePlus() {
        return Build.MANUFACTURER.equalsIgnoreCase("ONEPLUS") || Build.BRAND.equalsIgnoreCase("ONEPLUS");
    }

    public static boolean isSamsung() {
        return Build.MANUFACTURER.equalsIgnoreCase("SAMSUNG") || Build.BRAND.equalsIgnoreCase("SAMSUNG");
    }

    public static boolean isMeizu() {
        return Build.MANUFACTURER.equalsIgnoreCase("MEIZU") || Build.BRAND.equalsIgnoreCase("MEIZU") || Build.DISPLAY.toUpperCase().contains("FLYME");
    }

    public static boolean isLenovo() {
        return Build.MANUFACTURER.equalsIgnoreCase("LENOVO") || Build.BRAND.equalsIgnoreCase("LENOVO") || Build.BRAND.equalsIgnoreCase("ZUK");
    }

    public static boolean isNubia() {
        return Build.MANUFACTURER.equalsIgnoreCase("NUBIA") || Build.BRAND.equalsIgnoreCase("NUBIA");
    }

    public static boolean isASUS() {
        return Build.MANUFACTURER.equalsIgnoreCase("ASUS") || Build.BRAND.equalsIgnoreCase("ASUS");
    }

    public static boolean isZTE() {
        return Build.MANUFACTURER.equalsIgnoreCase("ZTE") || Build.BRAND.equalsIgnoreCase("ZTE");
    }

    public static boolean isMotorola() {
        return Build.MANUFACTURER.toUpperCase().contains("MOTO") || Build.BRAND.toUpperCase().contains("MOTO") || Build.BRAND.equalsIgnoreCase("MOTOROLA");
    }

    @Deprecated(forRemoval = true, since = "4.2.14")
    public static boolean isMotolora() {
        return isMotorola();
    }

    public static boolean isFreeme() {
        return !TextUtils.isEmpty(sysProperty("ro.build.freeme.label", ""));
    }

    public static boolean isCoolpad(Context context) {
        if (Build.MANUFACTURER.toUpperCase().contains("COOL") || Build.BRAND.toUpperCase().contains("COOL") || Build.MODEL.toUpperCase().contains("COOL")) {
            return true;
        }
        try {
            context.getPackageManager().getPackageInfo("com.coolpad.deviceidsupport", 0);
            return true;
        } catch (Throwable unused) {
            return false;
        }
    }

    public static boolean isCoosea() {
        return sysProperty("ro.odm.manufacturer", "").equalsIgnoreCase("PRIZE");
    }

    public static boolean isSSUI() {
        return !TextUtils.isEmpty(sysProperty("ro.ssui.product", ""));
    }

    public static boolean is360OS() {
        return !TextUtils.isEmpty(sysProperty("ro.build.uiversion", ""));
    }
}
