package io.flutter.plugins.webviewflutter;

import android.os.Build;
import android.webkit.CookieManager;
import android.webkit.ValueCallback;
import android.webkit.WebView;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.util.Objects;

/* loaded from: classes2.dex */
public class CookieManagerHostApiImpl implements GeneratedAndroidWebView.CookieManagerHostApi {
    private final BinaryMessenger binaryMessenger;
    private final InstanceManager instanceManager;
    private final CookieManagerProxy proxy;
    private final AndroidSdkChecker sdkChecker;

    interface AndroidSdkChecker {
        boolean sdkIsAtLeast(int i);
    }

    static class CookieManagerProxy {
        CookieManagerProxy() {
        }

        public CookieManager getInstance() {
            return CookieManager.getInstance();
        }
    }

    public CookieManagerHostApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        this(binaryMessenger, instanceManager, new CookieManagerProxy());
    }

    CookieManagerHostApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager, CookieManagerProxy cookieManagerProxy) {
        this(binaryMessenger, instanceManager, cookieManagerProxy, new AndroidSdkChecker() { // from class: io.flutter.plugins.webviewflutter.CookieManagerHostApiImpl$$ExternalSyntheticLambda0
            @Override // io.flutter.plugins.webviewflutter.CookieManagerHostApiImpl.AndroidSdkChecker
            public final boolean sdkIsAtLeast(int i) {
                return CookieManagerHostApiImpl.lambda$new$0(i);
            }
        });
    }

    static /* synthetic */ boolean lambda$new$0(int i) {
        return Build.VERSION.SDK_INT >= i;
    }

    CookieManagerHostApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager, CookieManagerProxy cookieManagerProxy, AndroidSdkChecker androidSdkChecker) {
        this.binaryMessenger = binaryMessenger;
        this.instanceManager = instanceManager;
        this.proxy = cookieManagerProxy;
        this.sdkChecker = androidSdkChecker;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.CookieManagerHostApi
    public void attachInstance(Long l) {
        this.instanceManager.addDartCreatedInstance(this.proxy.getInstance(), l.longValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.CookieManagerHostApi
    public void setCookie(Long l, String str, String str2) {
        getCookieManagerInstance(l).setCookie(str, str2);
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.CookieManagerHostApi
    public void removeAllCookies(Long l, final GeneratedAndroidWebView.Result<Boolean> result) {
        if (this.sdkChecker.sdkIsAtLeast(21)) {
            CookieManager cookieManagerInstance = getCookieManagerInstance(l);
            Objects.requireNonNull(result);
            cookieManagerInstance.removeAllCookies(new ValueCallback() { // from class: io.flutter.plugins.webviewflutter.CookieManagerHostApiImpl$$ExternalSyntheticLambda1
                @Override // android.webkit.ValueCallback
                public final void onReceiveValue(Object obj) {
                    result.success((Boolean) obj);
                }
            });
            return;
        }
        result.success(Boolean.valueOf(removeCookiesPreL(getCookieManagerInstance(l))));
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.CookieManagerHostApi
    public void setAcceptThirdPartyCookies(Long l, Long l2, Boolean bool) {
        if (this.sdkChecker.sdkIsAtLeast(21)) {
            getCookieManagerInstance(l).setAcceptThirdPartyCookies((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l2.longValue())), bool.booleanValue());
            return;
        }
        throw new UnsupportedOperationException("`setAcceptThirdPartyCookies` is unsupported on versions below `Build.VERSION_CODES.LOLLIPOP`.");
    }

    private boolean removeCookiesPreL(CookieManager cookieManager) {
        boolean zHasCookies = cookieManager.hasCookies();
        if (zHasCookies) {
            cookieManager.removeAllCookie();
        }
        return zHasCookies;
    }

    private CookieManager getCookieManagerInstance(Long l) {
        return (CookieManager) Objects.requireNonNull((CookieManager) this.instanceManager.getInstance(l.longValue()));
    }
}
