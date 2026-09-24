package io.flutter.plugins.webviewflutter;

import android.os.Handler;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;

/* loaded from: classes2.dex */
public class JavaScriptChannelHostApiImpl implements GeneratedAndroidWebView.JavaScriptChannelHostApi {
    private final JavaScriptChannelFlutterApiImpl flutterApi;
    private final InstanceManager instanceManager;
    private final JavaScriptChannelCreator javaScriptChannelCreator;
    private Handler platformThreadHandler;

    public static class JavaScriptChannelCreator {
        public JavaScriptChannel createJavaScriptChannel(JavaScriptChannelFlutterApiImpl javaScriptChannelFlutterApiImpl, String str, Handler handler) {
            return new JavaScriptChannel(javaScriptChannelFlutterApiImpl, str, handler);
        }
    }

    public JavaScriptChannelHostApiImpl(InstanceManager instanceManager, JavaScriptChannelCreator javaScriptChannelCreator, JavaScriptChannelFlutterApiImpl javaScriptChannelFlutterApiImpl, Handler handler) {
        this.instanceManager = instanceManager;
        this.javaScriptChannelCreator = javaScriptChannelCreator;
        this.flutterApi = javaScriptChannelFlutterApiImpl;
        this.platformThreadHandler = handler;
    }

    public void setPlatformThreadHandler(Handler handler) {
        this.platformThreadHandler = handler;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.JavaScriptChannelHostApi
    public void create(Long l, String str) {
        this.instanceManager.addDartCreatedInstance(this.javaScriptChannelCreator.createJavaScriptChannel(this.flutterApi, str, this.platformThreadHandler), l.longValue());
    }
}
