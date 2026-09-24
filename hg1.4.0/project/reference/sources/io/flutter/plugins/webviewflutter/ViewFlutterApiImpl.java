package io.flutter.plugins.webviewflutter;

import android.view.View;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;

/* loaded from: classes2.dex */
public class ViewFlutterApiImpl {
    private GeneratedAndroidWebView.ViewFlutterApi api;
    private final BinaryMessenger binaryMessenger;
    private final InstanceManager instanceManager;

    public ViewFlutterApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        this.binaryMessenger = binaryMessenger;
        this.instanceManager = instanceManager;
        this.api = new GeneratedAndroidWebView.ViewFlutterApi(binaryMessenger);
    }

    public void create(View view, GeneratedAndroidWebView.ViewFlutterApi.Reply<Void> reply) {
        if (this.instanceManager.containsInstance(view)) {
            return;
        }
        this.api.create(Long.valueOf(this.instanceManager.addHostCreatedInstance(view)), reply);
    }

    void setApi(GeneratedAndroidWebView.ViewFlutterApi viewFlutterApi) {
        this.api = viewFlutterApi;
    }
}
