package androidx.webkit;

import android.webkit.CookieManager;
import androidx.webkit.internal.CookieManagerAdapter;
import androidx.webkit.internal.WebViewFeatureInternal;
import androidx.webkit.internal.WebViewGlueCommunicator;
import java.util.List;

/* loaded from: classes.dex */
public class CookieManagerCompat {
    private CookieManagerCompat() {
    }

    public static List<String> getCookieInfo(CookieManager cookieManager, String str) {
        if (WebViewFeatureInternal.GET_COOKIE_INFO.isSupportedByWebView()) {
            return getAdapter(cookieManager).getCookieInfo(str);
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    private static CookieManagerAdapter getAdapter(CookieManager cookieManager) {
        return WebViewGlueCommunicator.getCompatConverter().convertCookieManager(cookieManager);
    }
}
