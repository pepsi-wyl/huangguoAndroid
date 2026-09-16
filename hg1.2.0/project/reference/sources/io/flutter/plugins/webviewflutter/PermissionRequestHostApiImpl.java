package io.flutter.plugins.webviewflutter;

import android.webkit.PermissionRequest;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.util.List;
import java.util.Objects;

/* loaded from: classes2.dex */
public class PermissionRequestHostApiImpl implements GeneratedAndroidWebView.PermissionRequestHostApi {
    private final BinaryMessenger binaryMessenger;
    private final InstanceManager instanceManager;

    public PermissionRequestHostApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        this.binaryMessenger = binaryMessenger;
        this.instanceManager = instanceManager;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.PermissionRequestHostApi
    public void grant(Long l, List<String> list) {
        getPermissionRequestInstance(l).grant((String[]) list.toArray(new String[0]));
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.PermissionRequestHostApi
    public void deny(Long l) {
        getPermissionRequestInstance(l).deny();
    }

    private PermissionRequest getPermissionRequestInstance(Long l) {
        return (PermissionRequest) Objects.requireNonNull((PermissionRequest) this.instanceManager.getInstance(l.longValue()));
    }
}
