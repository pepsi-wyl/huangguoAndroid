package androidx.webkit;

import android.webkit.WebSettings;
import androidx.webkit.internal.ApiFeature;
import androidx.webkit.internal.ApiHelperForM;
import androidx.webkit.internal.ApiHelperForN;
import androidx.webkit.internal.ApiHelperForO;
import androidx.webkit.internal.ApiHelperForQ;
import androidx.webkit.internal.WebSettingsAdapter;
import androidx.webkit.internal.WebViewFeatureInternal;
import androidx.webkit.internal.WebViewGlueCommunicator;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.Set;

/* loaded from: classes.dex */
public class WebSettingsCompat {
    public static final int ATTRIBUTION_BEHAVIOR_APP_SOURCE_AND_APP_TRIGGER = 3;
    public static final int ATTRIBUTION_BEHAVIOR_APP_SOURCE_AND_WEB_TRIGGER = 1;
    public static final int ATTRIBUTION_BEHAVIOR_DISABLED = 0;
    public static final int ATTRIBUTION_BEHAVIOR_WEB_SOURCE_AND_WEB_TRIGGER = 2;

    @Deprecated
    public static final int DARK_STRATEGY_PREFER_WEB_THEME_OVER_USER_AGENT_DARKENING = 2;

    @Deprecated
    public static final int DARK_STRATEGY_USER_AGENT_DARKENING_ONLY = 0;

    @Deprecated
    public static final int DARK_STRATEGY_WEB_THEME_DARKENING_ONLY = 1;

    @Deprecated
    public static final int FORCE_DARK_AUTO = 1;

    @Deprecated
    public static final int FORCE_DARK_OFF = 0;

    @Deprecated
    public static final int FORCE_DARK_ON = 2;

    @Target({ElementType.PARAMETER, ElementType.METHOD})
    @Retention(RetentionPolicy.SOURCE)
    public @interface ForceDark {
    }

    @Target({ElementType.PARAMETER, ElementType.METHOD})
    @Retention(RetentionPolicy.SOURCE)
    public @interface ForceDarkStrategy {
    }

    @Target({ElementType.PARAMETER, ElementType.METHOD})
    @Retention(RetentionPolicy.SOURCE)
    public @interface MenuItemFlags {
    }

    private WebSettingsCompat() {
    }

    public static void setOffscreenPreRaster(WebSettings webSettings, boolean z) {
        ApiFeature.M m = WebViewFeatureInternal.OFF_SCREEN_PRERASTER;
        if (m.isSupportedByFramework()) {
            ApiHelperForM.setOffscreenPreRaster(webSettings, z);
        } else {
            if (m.isSupportedByWebView()) {
                getAdapter(webSettings).setOffscreenPreRaster(z);
                return;
            }
            throw WebViewFeatureInternal.getUnsupportedOperationException();
        }
    }

    public static boolean getOffscreenPreRaster(WebSettings webSettings) {
        ApiFeature.M m = WebViewFeatureInternal.OFF_SCREEN_PRERASTER;
        if (m.isSupportedByFramework()) {
            return ApiHelperForM.getOffscreenPreRaster(webSettings);
        }
        if (m.isSupportedByWebView()) {
            return getAdapter(webSettings).getOffscreenPreRaster();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static void setSafeBrowsingEnabled(WebSettings webSettings, boolean z) {
        ApiFeature.O o = WebViewFeatureInternal.SAFE_BROWSING_ENABLE;
        if (o.isSupportedByFramework()) {
            ApiHelperForO.setSafeBrowsingEnabled(webSettings, z);
        } else {
            if (o.isSupportedByWebView()) {
                getAdapter(webSettings).setSafeBrowsingEnabled(z);
                return;
            }
            throw WebViewFeatureInternal.getUnsupportedOperationException();
        }
    }

    public static boolean getSafeBrowsingEnabled(WebSettings webSettings) {
        ApiFeature.O o = WebViewFeatureInternal.SAFE_BROWSING_ENABLE;
        if (o.isSupportedByFramework()) {
            return ApiHelperForO.getSafeBrowsingEnabled(webSettings);
        }
        if (o.isSupportedByWebView()) {
            return getAdapter(webSettings).getSafeBrowsingEnabled();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static void setDisabledActionModeMenuItems(WebSettings webSettings, int i) {
        ApiFeature.N n = WebViewFeatureInternal.DISABLED_ACTION_MODE_MENU_ITEMS;
        if (n.isSupportedByFramework()) {
            ApiHelperForN.setDisabledActionModeMenuItems(webSettings, i);
        } else {
            if (n.isSupportedByWebView()) {
                getAdapter(webSettings).setDisabledActionModeMenuItems(i);
                return;
            }
            throw WebViewFeatureInternal.getUnsupportedOperationException();
        }
    }

    public static int getDisabledActionModeMenuItems(WebSettings webSettings) {
        ApiFeature.N n = WebViewFeatureInternal.DISABLED_ACTION_MODE_MENU_ITEMS;
        if (n.isSupportedByFramework()) {
            return ApiHelperForN.getDisabledActionModeMenuItems(webSettings);
        }
        if (n.isSupportedByWebView()) {
            return getAdapter(webSettings).getDisabledActionModeMenuItems();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    @Deprecated
    public static void setForceDark(WebSettings webSettings, int i) {
        ApiFeature.Q q = WebViewFeatureInternal.FORCE_DARK;
        if (q.isSupportedByFramework()) {
            ApiHelperForQ.setForceDark(webSettings, i);
        } else {
            if (q.isSupportedByWebView()) {
                getAdapter(webSettings).setForceDark(i);
                return;
            }
            throw WebViewFeatureInternal.getUnsupportedOperationException();
        }
    }

    @Deprecated
    public static int getForceDark(WebSettings webSettings) {
        ApiFeature.Q q = WebViewFeatureInternal.FORCE_DARK;
        if (q.isSupportedByFramework()) {
            return ApiHelperForQ.getForceDark(webSettings);
        }
        if (q.isSupportedByWebView()) {
            return getAdapter(webSettings).getForceDark();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static void setAlgorithmicDarkeningAllowed(WebSettings webSettings, boolean z) {
        if (WebViewFeatureInternal.ALGORITHMIC_DARKENING.isSupportedByWebView()) {
            getAdapter(webSettings).setAlgorithmicDarkeningAllowed(z);
            return;
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static boolean isAlgorithmicDarkeningAllowed(WebSettings webSettings) {
        if (WebViewFeatureInternal.ALGORITHMIC_DARKENING.isSupportedByWebView()) {
            return getAdapter(webSettings).isAlgorithmicDarkeningAllowed();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    @Deprecated
    public static void setForceDarkStrategy(WebSettings webSettings, int i) {
        if (WebViewFeatureInternal.FORCE_DARK_STRATEGY.isSupportedByWebView()) {
            getAdapter(webSettings).setForceDarkStrategy(i);
            return;
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    @Deprecated
    public static int getForceDarkStrategy(WebSettings webSettings) {
        if (WebViewFeatureInternal.FORCE_DARK_STRATEGY.isSupportedByWebView()) {
            return getAdapter(webSettings).getForceDark();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static void setEnterpriseAuthenticationAppLinkPolicyEnabled(WebSettings webSettings, boolean z) {
        if (WebViewFeatureInternal.ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY.isSupportedByWebView()) {
            getAdapter(webSettings).setEnterpriseAuthenticationAppLinkPolicyEnabled(z);
            return;
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static boolean getEnterpriseAuthenticationAppLinkPolicyEnabled(WebSettings webSettings) {
        if (WebViewFeatureInternal.ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY.isSupportedByWebView()) {
            return getAdapter(webSettings).getEnterpriseAuthenticationAppLinkPolicyEnabled();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static Set<String> getRequestedWithHeaderOriginAllowList(WebSettings webSettings) {
        if (WebViewFeatureInternal.REQUESTED_WITH_HEADER_ALLOW_LIST.isSupportedByWebView()) {
            return getAdapter(webSettings).getRequestedWithHeaderOriginAllowList();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static void setRequestedWithHeaderOriginAllowList(WebSettings webSettings, Set<String> set) {
        if (WebViewFeatureInternal.REQUESTED_WITH_HEADER_ALLOW_LIST.isSupportedByWebView()) {
            getAdapter(webSettings).setRequestedWithHeaderOriginAllowList(set);
            return;
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static void setUserAgentMetadata(WebSettings webSettings, UserAgentMetadata userAgentMetadata) {
        if (WebViewFeatureInternal.USER_AGENT_METADATA.isSupportedByWebView()) {
            getAdapter(webSettings).setUserAgentMetadata(userAgentMetadata);
            return;
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static UserAgentMetadata getUserAgentMetadata(WebSettings webSettings) {
        if (WebViewFeatureInternal.USER_AGENT_METADATA.isSupportedByWebView()) {
            return getAdapter(webSettings).getUserAgentMetadata();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static void setAttributionRegistrationBehavior(WebSettings webSettings, int i) {
        if (WebViewFeatureInternal.ATTRIBUTION_REGISTRATION_BEHAVIOR.isSupportedByWebView()) {
            getAdapter(webSettings).setAttributionRegistrationBehavior(i);
            return;
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static int getAttributionRegistrationBehavior(WebSettings webSettings) {
        if (WebViewFeatureInternal.ATTRIBUTION_REGISTRATION_BEHAVIOR.isSupportedByWebView()) {
            return getAdapter(webSettings).getAttributionRegistrationBehavior();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static void setWebViewMediaIntegrityApiStatus(WebSettings webSettings, WebViewMediaIntegrityApiStatusConfig webViewMediaIntegrityApiStatusConfig) {
        if (WebViewFeatureInternal.WEBVIEW_MEDIA_INTEGRITY_API_STATUS.isSupportedByWebView()) {
            getAdapter(webSettings).setWebViewMediaIntegrityApiStatus(webViewMediaIntegrityApiStatusConfig);
            return;
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    public static WebViewMediaIntegrityApiStatusConfig getWebViewMediaIntegrityApiStatus(WebSettings webSettings) {
        if (WebViewFeatureInternal.WEBVIEW_MEDIA_INTEGRITY_API_STATUS.isSupportedByWebView()) {
            return getAdapter(webSettings).getWebViewMediaIntegrityApiStatus();
        }
        throw WebViewFeatureInternal.getUnsupportedOperationException();
    }

    private static WebSettingsAdapter getAdapter(WebSettings webSettings) {
        return WebViewGlueCommunicator.getCompatConverter().convertSettings(webSettings);
    }
}
