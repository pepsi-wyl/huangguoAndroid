package io.flutter.plugins.webviewflutter;

import android.webkit.WebSettings;
import android.webkit.WebView;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.util.Objects;

/* loaded from: classes2.dex */
public class WebSettingsHostApiImpl implements GeneratedAndroidWebView.WebSettingsHostApi {
    private final InstanceManager instanceManager;
    private final WebSettingsCreator webSettingsCreator;

    public static class WebSettingsCreator {
        public WebSettings createWebSettings(WebView webView) {
            return webView.getSettings();
        }
    }

    public WebSettingsHostApiImpl(InstanceManager instanceManager, WebSettingsCreator webSettingsCreator) {
        this.instanceManager = instanceManager;
        this.webSettingsCreator = webSettingsCreator;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void create(Long l, Long l2) {
        this.instanceManager.addDartCreatedInstance(this.webSettingsCreator.createWebSettings((WebView) Objects.requireNonNull((WebView) this.instanceManager.getInstance(l2.longValue()))), l.longValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setDomStorageEnabled(Long l, Boolean bool) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setDomStorageEnabled(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setJavaScriptCanOpenWindowsAutomatically(Long l, Boolean bool) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setJavaScriptCanOpenWindowsAutomatically(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setSupportMultipleWindows(Long l, Boolean bool) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setSupportMultipleWindows(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setJavaScriptEnabled(Long l, Boolean bool) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setJavaScriptEnabled(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setUserAgentString(Long l, String str) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setUserAgentString(str);
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setMediaPlaybackRequiresUserGesture(Long l, Boolean bool) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setMediaPlaybackRequiresUserGesture(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setSupportZoom(Long l, Boolean bool) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setSupportZoom(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setLoadWithOverviewMode(Long l, Boolean bool) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setLoadWithOverviewMode(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setUseWideViewPort(Long l, Boolean bool) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setUseWideViewPort(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setDisplayZoomControls(Long l, Boolean bool) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setDisplayZoomControls(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setBuiltInZoomControls(Long l, Boolean bool) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setBuiltInZoomControls(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setAllowFileAccess(Long l, Boolean bool) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setAllowFileAccess(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public void setTextZoom(Long l, Long l2) {
        ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).setTextZoom(l2.intValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebSettingsHostApi
    public String getUserAgentString(Long l) {
        return ((WebSettings) Objects.requireNonNull((WebSettings) this.instanceManager.getInstance(l.longValue()))).getUserAgentString();
    }
}
