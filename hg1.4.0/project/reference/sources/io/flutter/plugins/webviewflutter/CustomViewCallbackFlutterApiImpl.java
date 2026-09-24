package io.flutter.plugins.webviewflutter;

import android.webkit.WebChromeClient;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;

/* loaded from: classes2.dex */
public class CustomViewCallbackFlutterApiImpl {
    private GeneratedAndroidWebView.CustomViewCallbackFlutterApi api;
    private final BinaryMessenger binaryMessenger;
    private final InstanceManager instanceManager;

    public CustomViewCallbackFlutterApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        this.binaryMessenger = binaryMessenger;
        this.instanceManager = instanceManager;
        this.api = new GeneratedAndroidWebView.CustomViewCallbackFlutterApi(binaryMessenger);
    }

    public void create(WebChromeClient.CustomViewCallback customViewCallback, GeneratedAndroidWebView.CustomViewCallbackFlutterApi.Reply<Void> reply) {
        if (this.instanceManager.containsInstance(customViewCallback)) {
            return;
        }
        this.api.create(Long.valueOf(this.instanceManager.addHostCreatedInstance(customViewCallback)), reply);
    }

    void setApi(GeneratedAndroidWebView.CustomViewCallbackFlutterApi customViewCallbackFlutterApi) {
        this.api = customViewCallbackFlutterApi;
    }
}
