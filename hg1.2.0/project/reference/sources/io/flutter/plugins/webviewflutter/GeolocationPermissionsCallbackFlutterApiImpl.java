package io.flutter.plugins.webviewflutter;

import android.webkit.GeolocationPermissions;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;

/* loaded from: classes2.dex */
public class GeolocationPermissionsCallbackFlutterApiImpl {
    private GeneratedAndroidWebView.GeolocationPermissionsCallbackFlutterApi api;
    private final BinaryMessenger binaryMessenger;
    private final InstanceManager instanceManager;

    public GeolocationPermissionsCallbackFlutterApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        this.binaryMessenger = binaryMessenger;
        this.instanceManager = instanceManager;
        this.api = new GeneratedAndroidWebView.GeolocationPermissionsCallbackFlutterApi(binaryMessenger);
    }

    public void create(GeolocationPermissions.Callback callback, GeneratedAndroidWebView.GeolocationPermissionsCallbackFlutterApi.Reply<Void> reply) {
        if (this.instanceManager.containsInstance(callback)) {
            return;
        }
        this.api.create(Long.valueOf(this.instanceManager.addHostCreatedInstance(callback)), reply);
    }

    void setApi(GeneratedAndroidWebView.GeolocationPermissionsCallbackFlutterApi geolocationPermissionsCallbackFlutterApi) {
        this.api = geolocationPermissionsCallbackFlutterApi;
    }
}
