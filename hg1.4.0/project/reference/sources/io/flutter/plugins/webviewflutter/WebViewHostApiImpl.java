package io.flutter.plugins.webviewflutter;

import android.content.Context;
import android.hardware.display.DisplayManager;
import android.os.Build;
import android.view.View;
import android.view.ViewParent;
import android.webkit.DownloadListener;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import io.flutter.embedding.android.FlutterView;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl;
import io.flutter.plugins.webviewflutter.WebViewHostApiImpl;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes2.dex */
public class WebViewHostApiImpl implements GeneratedAndroidWebView.WebViewHostApi {
    private final BinaryMessenger binaryMessenger;
    private Context context;
    private final InstanceManager instanceManager;
    private final WebViewProxy webViewProxy;

    public static class WebViewProxy {
        public WebViewPlatformView createWebView(Context context, BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
            return new WebViewPlatformView(context, binaryMessenger, instanceManager);
        }

        public void setWebContentsDebuggingEnabled(boolean z) {
            WebView.setWebContentsDebuggingEnabled(z);
        }
    }

    public static class WebViewPlatformView extends WebView implements PlatformView {
        private WebViewFlutterApiImpl api;
        private WebChromeClientHostApiImpl.SecureWebChromeClient currentWebChromeClient;
        private WebViewClient currentWebViewClient;
        private final AndroidSdkChecker sdkChecker;

        interface AndroidSdkChecker {
            boolean sdkIsAtLeast(int i);
        }

        static /* synthetic */ void lambda$onScrollChanged$1(Void r0) {
        }

        @Override // io.flutter.plugin.platform.PlatformView
        public void dispose() {
        }

        @Override // io.flutter.plugin.platform.PlatformView
        public View getView() {
            return this;
        }

        @Override // io.flutter.plugin.platform.PlatformView
        public /* synthetic */ void onFlutterViewAttached(View view) {
            PlatformView.CC.$default$onFlutterViewAttached(this, view);
        }

        @Override // io.flutter.plugin.platform.PlatformView
        public /* synthetic */ void onFlutterViewDetached() {
            PlatformView.CC.$default$onFlutterViewDetached(this);
        }

        @Override // io.flutter.plugin.platform.PlatformView
        public /* synthetic */ void onInputConnectionLocked() {
            PlatformView.CC.$default$onInputConnectionLocked(this);
        }

        @Override // io.flutter.plugin.platform.PlatformView
        public /* synthetic */ void onInputConnectionUnlocked() {
            PlatformView.CC.$default$onInputConnectionUnlocked(this);
        }

        public WebViewPlatformView(Context context, BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
            this(context, binaryMessenger, instanceManager, new AndroidSdkChecker() { // from class: io.flutter.plugins.webviewflutter.WebViewHostApiImpl$WebViewPlatformView$$ExternalSyntheticLambda1
                @Override // io.flutter.plugins.webviewflutter.WebViewHostApiImpl.WebViewPlatformView.AndroidSdkChecker
                public final boolean sdkIsAtLeast(int i) {
                    return WebViewHostApiImpl.WebViewPlatformView.lambda$new$0(i);
                }
            });
        }

        static /* synthetic */ boolean lambda$new$0(int i) {
            return Build.VERSION.SDK_INT >= i;
        }

        WebViewPlatformView(Context context, BinaryMessenger binaryMessenger, InstanceManager instanceManager, AndroidSdkChecker androidSdkChecker) {
            super(context);
            this.currentWebViewClient = new WebViewClient();
            this.currentWebChromeClient = new WebChromeClientHostApiImpl.SecureWebChromeClient();
            this.api = new WebViewFlutterApiImpl(binaryMessenger, instanceManager);
            this.sdkChecker = androidSdkChecker;
            setWebViewClient(this.currentWebViewClient);
            setWebChromeClient(this.currentWebChromeClient);
        }

        @Override // android.webkit.WebView, android.view.ViewGroup, android.view.View
        protected void onAttachedToWindow() {
            FlutterView flutterViewTryFindFlutterView;
            super.onAttachedToWindow();
            if (!this.sdkChecker.sdkIsAtLeast(26) || (flutterViewTryFindFlutterView = tryFindFlutterView()) == null) {
                return;
            }
            flutterViewTryFindFlutterView.setImportantForAutofill(1);
        }

        private FlutterView tryFindFlutterView() {
            ViewParent parent = this;
            while (parent.getParent() != null) {
                parent = parent.getParent();
                if (parent instanceof FlutterView) {
                    return (FlutterView) parent;
                }
            }
            return null;
        }

        @Override // android.webkit.WebView
        public void setWebViewClient(WebViewClient webViewClient) {
            super.setWebViewClient(webViewClient);
            this.currentWebViewClient = webViewClient;
            this.currentWebChromeClient.setWebViewClient(webViewClient);
        }

        @Override // android.webkit.WebView
        public void setWebChromeClient(WebChromeClient webChromeClient) {
            super.setWebChromeClient(webChromeClient);
            if (!(webChromeClient instanceof WebChromeClientHostApiImpl.SecureWebChromeClient)) {
                throw new AssertionError("Client must be a SecureWebChromeClient.");
            }
            WebChromeClientHostApiImpl.SecureWebChromeClient secureWebChromeClient = (WebChromeClientHostApiImpl.SecureWebChromeClient) webChromeClient;
            this.currentWebChromeClient = secureWebChromeClient;
            secureWebChromeClient.setWebViewClient(this.currentWebViewClient);
        }

        @Override // android.webkit.WebView
        public WebChromeClient getWebChromeClient() {
            return this.currentWebChromeClient;
        }

        @Override // android.webkit.WebView, android.view.View
        protected void onScrollChanged(int i, int i2, int i3, int i4) {
            super.onScrollChanged(i, i2, i3, i4);
            this.api.onScrollChanged(this, Long.valueOf(i), Long.valueOf(i2), Long.valueOf(i3), Long.valueOf(i4), new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewHostApiImpl$WebViewPlatformView$$ExternalSyntheticLambda2
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewHostApiImpl.WebViewPlatformView.lambda$onScrollChanged$1((Void) obj);
                }
            });
        }

        void setApi(WebViewFlutterApiImpl webViewFlutterApiImpl) {
            this.api = webViewFlutterApiImpl;
        }
    }

    public WebViewHostApiImpl(InstanceManager instanceManager, BinaryMessenger binaryMessenger, WebViewProxy webViewProxy, Context context) {
        this.instanceManager = instanceManager;
        this.binaryMessenger = binaryMessenger;
        this.webViewProxy = webViewProxy;
        this.context = context;
    }

    public void setContext(Context context) {
        this.context = context;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void create(Long l) throws IllegalAccessException, NoSuchFieldException, IllegalArgumentException {
        DisplayListenerProxy displayListenerProxy = new DisplayListenerProxy();
        DisplayManager displayManager = (DisplayManager) this.context.getSystemService("display");
        displayListenerProxy.onPreWebViewInitialization(displayManager);
        WebViewPlatformView webViewPlatformViewCreateWebView = this.webViewProxy.createWebView(this.context, this.binaryMessenger, this.instanceManager);
        displayListenerProxy.onPostWebViewInitialization(displayManager);
        this.instanceManager.addDartCreatedInstance(webViewPlatformViewCreateWebView, l.longValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void loadData(Long l, String str, String str2, String str3) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).loadData(str, str2, str3);
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void loadDataWithBaseUrl(Long l, String str, String str2, String str3, String str4, String str5) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).loadDataWithBaseURL(str, str2, str3, str4, str5);
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void loadUrl(Long l, String str, Map<String, String> map) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).loadUrl(str, map);
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void postUrl(Long l, String str, byte[] bArr) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).postUrl(str, bArr);
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public String getUrl(Long l) {
        return ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).getUrl();
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public Boolean canGoBack(Long l) {
        return Boolean.valueOf(((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).canGoBack());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public Boolean canGoForward(Long l) {
        return Boolean.valueOf(((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).canGoForward());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void goBack(Long l) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).goBack();
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void goForward(Long l) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).goForward();
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void reload(Long l) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).reload();
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void clearCache(Long l, Boolean bool) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).clearCache(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void evaluateJavascript(Long l, String str, final GeneratedAndroidWebView.Result<String> result) {
        WebView webView = (WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()));
        Objects.requireNonNull(result);
        webView.evaluateJavascript(str, new ValueCallback() { // from class: io.flutter.plugins.webviewflutter.WebViewHostApiImpl$$ExternalSyntheticLambda0
            @Override // android.webkit.ValueCallback
            public final void onReceiveValue(Object obj) {
                result.success((String) obj);
            }
        });
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public String getTitle(Long l) {
        return ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).getTitle();
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void scrollTo(Long l, Long l2, Long l3) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).scrollTo(l2.intValue(), l3.intValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void scrollBy(Long l, Long l2, Long l3) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).scrollBy(l2.intValue(), l3.intValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public Long getScrollX(Long l) {
        return Long.valueOf(((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).getScrollX());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public Long getScrollY(Long l) {
        return Long.valueOf(((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).getScrollY());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public GeneratedAndroidWebView.WebViewPoint getScrollPosition(Long l) {
        WebView webView = (WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()));
        return new GeneratedAndroidWebView.WebViewPoint.Builder().setX(Long.valueOf(webView.getScrollX())).setY(Long.valueOf(webView.getScrollY())).build();
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void setWebContentsDebuggingEnabled(Boolean bool) {
        this.webViewProxy.setWebContentsDebuggingEnabled(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void setWebViewClient(Long l, Long l2) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).setWebViewClient((WebViewClient) this.instanceManager.getInstance(l2.longValue()));
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void addJavaScriptChannel(Long l, Long l2) {
        WebView webView = (WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()));
        JavaScriptChannel javaScriptChannel = (JavaScriptChannel) Objects.requireNonNull((JavaScriptChannel) this.instanceManager.getInstance(l2.longValue()));
        webView.addJavascriptInterface(javaScriptChannel, javaScriptChannel.javaScriptChannelName);
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void removeJavaScriptChannel(Long l, Long l2) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).removeJavascriptInterface(((JavaScriptChannel) Objects.requireNonNull((JavaScriptChannel) this.instanceManager.getInstance(l2.longValue()))).javaScriptChannelName);
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void setDownloadListener(Long l, Long l2) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).setDownloadListener((DownloadListener) this.instanceManager.getInstance(((Long) Objects.requireNonNull(l2)).longValue()));
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void setWebChromeClient(Long l, Long l2) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).setWebChromeClient((WebChromeClient) this.instanceManager.getInstance(((Long) Objects.requireNonNull(l2)).longValue()));
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewHostApi
    public void setBackgroundColor(Long l, Long l2) {
        ((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l.longValue()))).setBackgroundColor(l2.intValue());
    }

    public InstanceManager getInstanceManager() {
        return this.instanceManager;
    }
}
