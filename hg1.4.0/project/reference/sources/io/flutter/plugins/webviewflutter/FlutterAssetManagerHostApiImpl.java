package io.flutter.plugins.webviewflutter;

import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: classes2.dex */
public class FlutterAssetManagerHostApiImpl implements GeneratedAndroidWebView.FlutterAssetManagerHostApi {
    final FlutterAssetManager flutterAssetManager;

    public FlutterAssetManagerHostApiImpl(FlutterAssetManager flutterAssetManager) {
        this.flutterAssetManager = flutterAssetManager;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.FlutterAssetManagerHostApi
    public List<String> list(String str) {
        try {
            String[] list = this.flutterAssetManager.list(str);
            if (list == null) {
                return new ArrayList();
            }
            return Arrays.asList(list);
        } catch (IOException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.FlutterAssetManagerHostApi
    public String getAssetFilePathByName(String str) {
        return this.flutterAssetManager.getAssetFilePathByName(str);
    }
}
