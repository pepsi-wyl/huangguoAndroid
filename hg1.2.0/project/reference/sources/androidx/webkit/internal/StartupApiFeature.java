package androidx.webkit.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.Bundle;
import androidx.webkit.WebViewCompat;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* loaded from: classes.dex */
public abstract class StartupApiFeature {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    public static final String METADATA_HOLDER_SERVICE_NAME = "org.chromium.android_webview.services.StartupFeatureMetadataHolder";
    private static final Set<StartupApiFeature> sValues = new HashSet();
    private final String mInternalFeatureValue;
    private final String mPublicFeatureValue;

    public abstract boolean isSupportedByFramework();

    StartupApiFeature(String str, String str2) {
        this.mPublicFeatureValue = str;
        this.mInternalFeatureValue = str2;
        sValues.add(this);
    }

    public String getPublicFeatureName() {
        return this.mPublicFeatureValue;
    }

    public boolean isSupported(Context context) {
        return isSupportedByFramework() || isSupportedByWebView(context);
    }

    public boolean isSupportedByWebView(Context context) {
        Bundle metaDataFromWebViewManifestOrNull = getMetaDataFromWebViewManifestOrNull(context);
        if (metaDataFromWebViewManifestOrNull == null) {
            return false;
        }
        return metaDataFromWebViewManifestOrNull.containsKey(this.mInternalFeatureValue);
    }

    public static Set<StartupApiFeature> values() {
        return Collections.unmodifiableSet(sValues);
    }

    private static Bundle getMetaDataFromWebViewManifestOrNull(Context context) {
        PackageInfo currentWebViewPackage = WebViewCompat.getCurrentWebViewPackage(context);
        if (currentWebViewPackage == null) {
            return null;
        }
        ComponentName componentName = new ComponentName(currentWebViewPackage.packageName, METADATA_HOLDER_SERVICE_NAME);
        if (Build.VERSION.SDK_INT >= 33) {
            try {
                return ApiHelperForTiramisu.getServiceInfo(context.getPackageManager(), componentName, ApiHelperForTiramisu.of(640L)).metaData;
            } catch (PackageManager.NameNotFoundException unused) {
                return null;
            }
        }
        try {
            return getServiceInfo(context, componentName, Build.VERSION.SDK_INT >= 24 ? 640 : 128).metaData;
        } catch (PackageManager.NameNotFoundException unused2) {
            return null;
        }
    }

    private static ServiceInfo getServiceInfo(Context context, ComponentName componentName, int i) throws PackageManager.NameNotFoundException {
        return context.getPackageManager().getServiceInfo(componentName, i);
    }

    public static class P extends StartupApiFeature {
        P(String str, String str2) {
            super(str, str2);
        }

        @Override // androidx.webkit.internal.StartupApiFeature
        public final boolean isSupportedByFramework() {
            return Build.VERSION.SDK_INT >= 28;
        }
    }

    public static class NoFramework extends StartupApiFeature {
        @Override // androidx.webkit.internal.StartupApiFeature
        public final boolean isSupportedByFramework() {
            return false;
        }

        NoFramework(String str, String str2) {
            super(str, str2);
        }
    }
}
