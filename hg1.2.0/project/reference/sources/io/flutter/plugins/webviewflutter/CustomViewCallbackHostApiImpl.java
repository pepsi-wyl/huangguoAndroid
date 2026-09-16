package io.flutter.plugins.webviewflutter;

import android.webkit.WebChromeClient;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.util.Objects;

/* loaded from: classes2.dex */
public class CustomViewCallbackHostApiImpl implements GeneratedAndroidWebView.CustomViewCallbackHostApi {
    private final BinaryMessenger binaryMessenger;
    private final InstanceManager instanceManager;

    public CustomViewCallbackHostApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        this.binaryMessenger = binaryMessenger;
        this.instanceManager = instanceManager;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.CustomViewCallbackHostApi
    public void onCustomViewHidden(Long l) {
        getCustomViewCallbackInstance(l).onCustomViewHidden();
    }

    private WebChromeClient.CustomViewCallback getCustomViewCallbackInstance(Long l) {
        return (WebChromeClient.CustomViewCallback) Objects.requireNonNull((WebChromeClient.CustomViewCallback) this.instanceManager.getInstance(l.longValue()));
    }
}
