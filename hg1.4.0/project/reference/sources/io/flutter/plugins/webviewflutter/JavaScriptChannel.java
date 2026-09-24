package io.flutter.plugins.webviewflutter;

import android.os.Handler;
import android.os.Looper;
import android.webkit.JavascriptInterface;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;

/* loaded from: classes2.dex */
public class JavaScriptChannel {
    private final JavaScriptChannelFlutterApiImpl flutterApi;
    final String javaScriptChannelName;
    private final Handler platformThreadHandler;

    static /* synthetic */ void lambda$postMessage$0(Void r0) {
    }

    public JavaScriptChannel(JavaScriptChannelFlutterApiImpl javaScriptChannelFlutterApiImpl, String str, Handler handler) {
        this.flutterApi = javaScriptChannelFlutterApiImpl;
        this.javaScriptChannelName = str;
        this.platformThreadHandler = handler;
    }

    @JavascriptInterface
    public void postMessage(final String str) {
        Runnable runnable = new Runnable() { // from class: io.flutter.plugins.webviewflutter.JavaScriptChannel$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m491x6cafa204(str);
            }
        };
        if (this.platformThreadHandler.getLooper() == Looper.myLooper()) {
            runnable.run();
        } else {
            this.platformThreadHandler.post(runnable);
        }
    }

    /* renamed from: lambda$postMessage$1$io-flutter-plugins-webviewflutter-JavaScriptChannel, reason: not valid java name */
    /* synthetic */ void m491x6cafa204(String str) {
        this.flutterApi.postMessage(this, str, new GeneratedAndroidWebView.JavaScriptChannelFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.JavaScriptChannel$$ExternalSyntheticLambda0
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.JavaScriptChannelFlutterApi.Reply
            public final void reply(Object obj) {
                JavaScriptChannel.lambda$postMessage$0((Void) obj);
            }
        });
    }
}
