package androidx.webkit.internal;

import android.content.Context;
import android.net.Uri;
import android.webkit.SafeBrowsingResponse;
import android.webkit.ValueCallback;
import android.webkit.WebView;
import java.util.List;

/* loaded from: classes.dex */
public class ApiHelperForOMR1 {
    private ApiHelperForOMR1() {
    }

    public static void showInterstitial(SafeBrowsingResponse safeBrowsingResponse, boolean z) {
        safeBrowsingResponse.showInterstitial(z);
    }

    public static void proceed(SafeBrowsingResponse safeBrowsingResponse, boolean z) {
        safeBrowsingResponse.proceed(z);
    }

    public static void backToSafety(SafeBrowsingResponse safeBrowsingResponse, boolean z) {
        safeBrowsingResponse.backToSafety(z);
    }

    public static void startSafeBrowsing(Context context, ValueCallback<Boolean> valueCallback) {
        WebView.startSafeBrowsing(context, valueCallback);
    }

    public static void setSafeBrowsingWhitelist(List<String> list, ValueCallback<Boolean> valueCallback) {
        WebView.setSafeBrowsingWhitelist(list, valueCallback);
    }

    public static Uri getSafeBrowsingPrivacyPolicyUrl() {
        return WebView.getSafeBrowsingPrivacyPolicyUrl();
    }
}
