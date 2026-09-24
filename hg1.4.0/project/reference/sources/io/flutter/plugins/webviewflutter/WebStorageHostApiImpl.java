package io.flutter.plugins.webviewflutter;

import android.webkit.WebStorage;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.util.Objects;

/* loaded from: classes2.dex */
public class WebStorageHostApiImpl implements GeneratedAndroidWebView.WebStorageHostApi {
    private final InstanceManager instanceManager;
    private final WebStorageCreator webStorageCreator;

    public static class WebStorageCreator {
        public WebStorage createWebStorage() {
            return WebStorage.getInstance();
        }
    }

    public WebStorageHostApiImpl(InstanceManager instanceManager, WebStorageCreator webStorageCreator) {
        this.instanceManager = instanceManager;
        this.webStorageCreator = webStorageCreator;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebStorageHostApi
    public void create(Long l) {
        this.instanceManager.addDartCreatedInstance(this.webStorageCreator.createWebStorage(), l.longValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebStorageHostApi
    public void deleteAllData(Long l) {
        ((WebStorage) Objects.requireNonNull((WebStorage) this.instanceManager.getInstance(l.longValue()))).deleteAllData();
    }
}
