package io.flutter.plugins.webviewflutter;

import android.webkit.PermissionRequest;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.util.Arrays;

/* loaded from: classes2.dex */
public class PermissionRequestFlutterApiImpl {
    private GeneratedAndroidWebView.PermissionRequestFlutterApi api;
    private final BinaryMessenger binaryMessenger;
    private final InstanceManager instanceManager;

    public PermissionRequestFlutterApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        this.binaryMessenger = binaryMessenger;
        this.instanceManager = instanceManager;
        this.api = new GeneratedAndroidWebView.PermissionRequestFlutterApi(binaryMessenger);
    }

    public void create(PermissionRequest permissionRequest, String[] strArr, GeneratedAndroidWebView.PermissionRequestFlutterApi.Reply<Void> reply) {
        if (this.instanceManager.containsInstance(permissionRequest)) {
            return;
        }
        this.api.create(Long.valueOf(this.instanceManager.addHostCreatedInstance(permissionRequest)), Arrays.asList(strArr), reply);
    }

    void setApi(GeneratedAndroidWebView.PermissionRequestFlutterApi permissionRequestFlutterApi) {
        this.api = permissionRequestFlutterApi;
    }
}
