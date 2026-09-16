package com.huawei.hms.ads.identifier;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import java.io.Closeable;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public abstract class e {
    public static final ThreadPoolExecutor a = new ThreadPoolExecutor(0, 3, 60, TimeUnit.SECONDS, new LinkedBlockingQueue(2048), new ThreadPoolExecutor.DiscardPolicy());

    public static Context a(Context context) {
        return a() ? context.createDeviceProtectedStorageContext() : context;
    }

    public static void a(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Throwable th) {
                Log.w("StmUt", "close " + th.getClass().getSimpleName());
            }
        }
    }

    private static boolean a() {
        return Build.VERSION.SDK_INT >= 24;
    }

    public static boolean a(Context context, Uri uri) {
        if (context == null || uri == null) {
            return false;
        }
        PackageManager packageManager = context.getPackageManager();
        ProviderInfo providerInfoResolveContentProvider = packageManager.resolveContentProvider(uri.getAuthority(), 0);
        if (providerInfoResolveContentProvider == null) {
            Log.e("StmUt", "verify provider invalid param");
            return false;
        }
        ApplicationInfo applicationInfo = providerInfoResolveContentProvider.applicationInfo;
        if (applicationInfo == null) {
            return false;
        }
        String str = applicationInfo.packageName;
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return packageManager.checkSignatures(context.getPackageName(), str) == 0 || (applicationInfo.flags & 1) == 1;
    }

    public static Integer b(Context context) {
        Object obj;
        if (context == null) {
            return null;
        }
        try {
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(c.a(context), 128);
            if (applicationInfo != null && applicationInfo.metaData != null && (obj = applicationInfo.metaData.get("ppskit_ver_code")) != null) {
                return Integer.valueOf(obj.toString());
            }
        } catch (Throwable th) {
            Log.i("StmUt", "getPpsKitVerCode ex: " + th.getClass().getSimpleName());
        }
        return null;
    }
}
