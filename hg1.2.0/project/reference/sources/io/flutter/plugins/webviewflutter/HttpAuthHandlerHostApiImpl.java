package io.flutter.plugins.webviewflutter;

import android.webkit.HttpAuthHandler;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.util.Objects;

/* loaded from: classes2.dex */
public class HttpAuthHandlerHostApiImpl implements GeneratedAndroidWebView.HttpAuthHandlerHostApi {
    private final BinaryMessenger binaryMessenger;
    private final InstanceManager instanceManager;

    public HttpAuthHandlerHostApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        this.binaryMessenger = binaryMessenger;
        this.instanceManager = instanceManager;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.HttpAuthHandlerHostApi
    public Boolean useHttpAuthUsernamePassword(Long l) {
        return Boolean.valueOf(getHttpAuthHandlerInstance(l).useHttpAuthUsernamePassword());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.HttpAuthHandlerHostApi
    public void cancel(Long l) {
        getHttpAuthHandlerInstance(l).cancel();
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.HttpAuthHandlerHostApi
    public void proceed(Long l, String str, String str2) {
        getHttpAuthHandlerInstance(l).proceed(str, str2);
    }

    private HttpAuthHandler getHttpAuthHandlerInstance(Long l) {
        return (HttpAuthHandler) Objects.requireNonNull((HttpAuthHandler) this.instanceManager.getInstance(l.longValue()));
    }
}
