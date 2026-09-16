package io.flutter.plugins.webviewflutter;

import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import io.flutter.plugins.webviewflutter.WebViewHostApiImpl;

/* loaded from: classes2.dex */
public class JavaObjectHostApiImpl implements GeneratedAndroidWebView.JavaObjectHostApi {
    private final InstanceManager instanceManager;

    public JavaObjectHostApiImpl(InstanceManager instanceManager) {
        this.instanceManager = instanceManager;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.JavaObjectHostApi
    public void dispose(Long l) {
        Object instanceManager = this.instanceManager.getInstance(l.longValue());
        if (instanceManager instanceof WebViewHostApiImpl.WebViewPlatformView) {
            ((WebViewHostApiImpl.WebViewPlatformView) instanceManager).destroy();
        }
        this.instanceManager.remove(l.longValue());
    }
}
