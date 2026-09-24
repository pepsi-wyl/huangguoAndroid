package dev.fluttercommunity.plus.device_info;

import android.content.pm.FeatureInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import androidx.core.app.NotificationCompat;
import androidx.media3.extractor.text.ttml.TtmlNode;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;

/* compiled from: MethodCallHandlerImpl.kt */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\u000e\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000bH\u0002J\u0018\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0016R\u0014\u0010\u0007\u001a\u00020\b8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0007\u0010\tR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0013"}, d2 = {"Ldev/fluttercommunity/plus/device_info/MethodCallHandlerImpl;", "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;", "packageManager", "Landroid/content/pm/PackageManager;", "windowManager", "Landroid/view/WindowManager;", "(Landroid/content/pm/PackageManager;Landroid/view/WindowManager;)V", "isEmulator", "", "()Z", "getSystemFeatures", "", "", "onMethodCall", "", NotificationCompat.CATEGORY_CALL, "Lio/flutter/plugin/common/MethodCall;", "result", "Lio/flutter/plugin/common/MethodChannel$Result;", "device_info_plus_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class MethodCallHandlerImpl implements MethodChannel.MethodCallHandler {
    private final PackageManager packageManager;
    private final WindowManager windowManager;

    public MethodCallHandlerImpl(PackageManager packageManager, WindowManager windowManager) {
        Intrinsics.checkNotNullParameter(packageManager, "packageManager");
        Intrinsics.checkNotNullParameter(windowManager, "windowManager");
        this.packageManager = packageManager;
        this.windowManager = windowManager;
    }

    @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        String serial;
        Intrinsics.checkNotNullParameter(call, "call");
        Intrinsics.checkNotNullParameter(result, "result");
        if (call.method.equals("getDeviceInfo")) {
            HashMap map = new HashMap();
            String BOARD = Build.BOARD;
            Intrinsics.checkNotNullExpressionValue(BOARD, "BOARD");
            map.put("board", BOARD);
            String BOOTLOADER = Build.BOOTLOADER;
            Intrinsics.checkNotNullExpressionValue(BOOTLOADER, "BOOTLOADER");
            map.put("bootloader", BOOTLOADER);
            String BRAND = Build.BRAND;
            Intrinsics.checkNotNullExpressionValue(BRAND, "BRAND");
            map.put("brand", BRAND);
            String DEVICE = Build.DEVICE;
            Intrinsics.checkNotNullExpressionValue(DEVICE, "DEVICE");
            map.put("device", DEVICE);
            String DISPLAY = Build.DISPLAY;
            Intrinsics.checkNotNullExpressionValue(DISPLAY, "DISPLAY");
            map.put("display", DISPLAY);
            String FINGERPRINT = Build.FINGERPRINT;
            Intrinsics.checkNotNullExpressionValue(FINGERPRINT, "FINGERPRINT");
            map.put("fingerprint", FINGERPRINT);
            String HARDWARE = Build.HARDWARE;
            Intrinsics.checkNotNullExpressionValue(HARDWARE, "HARDWARE");
            map.put("hardware", HARDWARE);
            String HOST = Build.HOST;
            Intrinsics.checkNotNullExpressionValue(HOST, "HOST");
            map.put("host", HOST);
            String ID = Build.ID;
            Intrinsics.checkNotNullExpressionValue(ID, "ID");
            map.put(TtmlNode.ATTR_ID, ID);
            String MANUFACTURER = Build.MANUFACTURER;
            Intrinsics.checkNotNullExpressionValue(MANUFACTURER, "MANUFACTURER");
            map.put("manufacturer", MANUFACTURER);
            String MODEL = Build.MODEL;
            Intrinsics.checkNotNullExpressionValue(MODEL, "MODEL");
            map.put("model", MODEL);
            String PRODUCT = Build.PRODUCT;
            Intrinsics.checkNotNullExpressionValue(PRODUCT, "PRODUCT");
            map.put("product", PRODUCT);
            String[] SUPPORTED_32_BIT_ABIS = Build.SUPPORTED_32_BIT_ABIS;
            Intrinsics.checkNotNullExpressionValue(SUPPORTED_32_BIT_ABIS, "SUPPORTED_32_BIT_ABIS");
            map.put("supported32BitAbis", CollectionsKt.listOf(Arrays.copyOf(SUPPORTED_32_BIT_ABIS, SUPPORTED_32_BIT_ABIS.length)));
            String[] SUPPORTED_64_BIT_ABIS = Build.SUPPORTED_64_BIT_ABIS;
            Intrinsics.checkNotNullExpressionValue(SUPPORTED_64_BIT_ABIS, "SUPPORTED_64_BIT_ABIS");
            map.put("supported64BitAbis", CollectionsKt.listOf(Arrays.copyOf(SUPPORTED_64_BIT_ABIS, SUPPORTED_64_BIT_ABIS.length)));
            String[] SUPPORTED_ABIS = Build.SUPPORTED_ABIS;
            Intrinsics.checkNotNullExpressionValue(SUPPORTED_ABIS, "SUPPORTED_ABIS");
            map.put("supportedAbis", CollectionsKt.listOf(Arrays.copyOf(SUPPORTED_ABIS, SUPPORTED_ABIS.length)));
            String TAGS = Build.TAGS;
            Intrinsics.checkNotNullExpressionValue(TAGS, "TAGS");
            map.put("tags", TAGS);
            String TYPE = Build.TYPE;
            Intrinsics.checkNotNullExpressionValue(TYPE, "TYPE");
            map.put("type", TYPE);
            map.put("isPhysicalDevice", Boolean.valueOf(!isEmulator()));
            map.put("systemFeatures", getSystemFeatures());
            HashMap map2 = new HashMap();
            if (Build.VERSION.SDK_INT >= 23) {
                String BASE_OS = Build.VERSION.BASE_OS;
                Intrinsics.checkNotNullExpressionValue(BASE_OS, "BASE_OS");
                map2.put("baseOS", BASE_OS);
                map2.put("previewSdkInt", Integer.valueOf(Build.VERSION.PREVIEW_SDK_INT));
                String SECURITY_PATCH = Build.VERSION.SECURITY_PATCH;
                Intrinsics.checkNotNullExpressionValue(SECURITY_PATCH, "SECURITY_PATCH");
                map2.put("securityPatch", SECURITY_PATCH);
            }
            String CODENAME = Build.VERSION.CODENAME;
            Intrinsics.checkNotNullExpressionValue(CODENAME, "CODENAME");
            map2.put("codename", CODENAME);
            String INCREMENTAL = Build.VERSION.INCREMENTAL;
            Intrinsics.checkNotNullExpressionValue(INCREMENTAL, "INCREMENTAL");
            map2.put("incremental", INCREMENTAL);
            String RELEASE = Build.VERSION.RELEASE;
            Intrinsics.checkNotNullExpressionValue(RELEASE, "RELEASE");
            map2.put("release", RELEASE);
            map2.put("sdkInt", Integer.valueOf(Build.VERSION.SDK_INT));
            map.put("version", map2);
            Display defaultDisplay = this.windowManager.getDefaultDisplay();
            Intrinsics.checkNotNullExpressionValue(defaultDisplay, "getDefaultDisplay(...)");
            DisplayMetrics displayMetrics = new DisplayMetrics();
            defaultDisplay.getRealMetrics(displayMetrics);
            HashMap map3 = new HashMap();
            map3.put("widthPx", Double.valueOf(displayMetrics.widthPixels));
            map3.put("heightPx", Double.valueOf(displayMetrics.heightPixels));
            map3.put("xDpi", Float.valueOf(displayMetrics.xdpi));
            map3.put("yDpi", Float.valueOf(displayMetrics.ydpi));
            map.put("displayMetrics", map3);
            if (Build.VERSION.SDK_INT >= 26) {
                try {
                    serial = Build.getSerial();
                } catch (SecurityException unused) {
                    serial = "unknown";
                }
                Intrinsics.checkNotNull(serial);
                map.put("serialNumber", serial);
            } else {
                String SERIAL = Build.SERIAL;
                Intrinsics.checkNotNullExpressionValue(SERIAL, "SERIAL");
                map.put("serialNumber", SERIAL);
            }
            result.success(map);
            return;
        }
        result.notImplemented();
    }

    private final List<String> getSystemFeatures() {
        FeatureInfo[] systemAvailableFeatures = this.packageManager.getSystemAvailableFeatures();
        Intrinsics.checkNotNullExpressionValue(systemAvailableFeatures, "getSystemAvailableFeatures(...)");
        ArrayList arrayList = new ArrayList();
        for (FeatureInfo featureInfo : systemAvailableFeatures) {
            if (featureInfo.name != null) {
                arrayList.add(featureInfo);
            }
        }
        ArrayList arrayList2 = arrayList;
        ArrayList arrayList3 = new ArrayList(CollectionsKt.collectionSizeOrDefault(arrayList2, 10));
        Iterator it = arrayList2.iterator();
        while (it.hasNext()) {
            arrayList3.add(((FeatureInfo) it.next()).name);
        }
        return arrayList3;
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final boolean isEmulator() {
        String BRAND = Build.BRAND;
        Intrinsics.checkNotNullExpressionValue(BRAND, "BRAND");
        if (StringsKt.startsWith$default(BRAND, "generic", false, 2, (Object) null)) {
            String DEVICE = Build.DEVICE;
            Intrinsics.checkNotNullExpressionValue(DEVICE, "DEVICE");
            if (!StringsKt.startsWith$default(DEVICE, "generic", false, 2, (Object) null)) {
                String FINGERPRINT = Build.FINGERPRINT;
                Intrinsics.checkNotNullExpressionValue(FINGERPRINT, "FINGERPRINT");
                if (!StringsKt.startsWith$default(FINGERPRINT, "generic", false, 2, (Object) null)) {
                    String FINGERPRINT2 = Build.FINGERPRINT;
                    Intrinsics.checkNotNullExpressionValue(FINGERPRINT2, "FINGERPRINT");
                    if (!StringsKt.startsWith$default(FINGERPRINT2, "unknown", false, 2, (Object) null)) {
                        String HARDWARE = Build.HARDWARE;
                        Intrinsics.checkNotNullExpressionValue(HARDWARE, "HARDWARE");
                        if (!StringsKt.contains$default((CharSequence) HARDWARE, (CharSequence) "goldfish", false, 2, (Object) null)) {
                            String HARDWARE2 = Build.HARDWARE;
                            Intrinsics.checkNotNullExpressionValue(HARDWARE2, "HARDWARE");
                            if (!StringsKt.contains$default((CharSequence) HARDWARE2, (CharSequence) "ranchu", false, 2, (Object) null)) {
                                String MODEL = Build.MODEL;
                                Intrinsics.checkNotNullExpressionValue(MODEL, "MODEL");
                                if (!StringsKt.contains$default((CharSequence) MODEL, (CharSequence) "google_sdk", false, 2, (Object) null)) {
                                    String MODEL2 = Build.MODEL;
                                    Intrinsics.checkNotNullExpressionValue(MODEL2, "MODEL");
                                    if (!StringsKt.contains$default((CharSequence) MODEL2, (CharSequence) "Emulator", false, 2, (Object) null)) {
                                        String MODEL3 = Build.MODEL;
                                        Intrinsics.checkNotNullExpressionValue(MODEL3, "MODEL");
                                        if (!StringsKt.contains$default((CharSequence) MODEL3, (CharSequence) "Android SDK built for x86", false, 2, (Object) null)) {
                                            String MANUFACTURER = Build.MANUFACTURER;
                                            Intrinsics.checkNotNullExpressionValue(MANUFACTURER, "MANUFACTURER");
                                            if (!StringsKt.contains$default((CharSequence) MANUFACTURER, (CharSequence) "Genymotion", false, 2, (Object) null)) {
                                                String PRODUCT = Build.PRODUCT;
                                                Intrinsics.checkNotNullExpressionValue(PRODUCT, "PRODUCT");
                                                if (!StringsKt.contains$default((CharSequence) PRODUCT, (CharSequence) "sdk", false, 2, (Object) null)) {
                                                    String PRODUCT2 = Build.PRODUCT;
                                                    Intrinsics.checkNotNullExpressionValue(PRODUCT2, "PRODUCT");
                                                    if (!StringsKt.contains$default((CharSequence) PRODUCT2, (CharSequence) "vbox86p", false, 2, (Object) null)) {
                                                        String PRODUCT3 = Build.PRODUCT;
                                                        Intrinsics.checkNotNullExpressionValue(PRODUCT3, "PRODUCT");
                                                        if (!StringsKt.contains$default((CharSequence) PRODUCT3, (CharSequence) "emulator", false, 2, (Object) null)) {
                                                            String PRODUCT4 = Build.PRODUCT;
                                                            Intrinsics.checkNotNullExpressionValue(PRODUCT4, "PRODUCT");
                                                            if (!StringsKt.contains$default((CharSequence) PRODUCT4, (CharSequence) "simulator", false, 2, (Object) null)) {
                                                                return false;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return true;
    }
}
