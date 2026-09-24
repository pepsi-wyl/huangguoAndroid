package io.flutter.plugins.webviewflutter;

import android.webkit.GeolocationPermissions;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.util.Objects;

/* loaded from: classes2.dex */
public class GeolocationPermissionsCallbackHostApiImpl implements GeneratedAndroidWebView.GeolocationPermissionsCallbackHostApi {
    private final BinaryMessenger binaryMessenger;
    private final InstanceManager instanceManager;

    public GeolocationPermissionsCallbackHostApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        this.binaryMessenger = binaryMessenger;
        this.instanceManager = instanceManager;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.GeolocationPermissionsCallbackHostApi
    public void invoke(Long l, String str, Boolean bool, Boolean bool2) {
        getGeolocationPermissionsCallbackInstance(l).invoke(str, bool.booleanValue(), bool2.booleanValue());
    }

    private GeolocationPermissions.Callback getGeolocationPermissionsCallbackInstance(Long l) {
        return (GeolocationPermissions.Callback) Objects.requireNonNull((GeolocationPermissions.Callback) this.instanceManager.getInstance(l.longValue()));
    }
}
