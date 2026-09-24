package io.flutter.plugins.webviewflutter;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;

/* loaded from: classes2.dex */
public class JavaScriptChannelFlutterApiImpl extends GeneratedAndroidWebView.JavaScriptChannelFlutterApi {
    private final InstanceManager instanceManager;

    public JavaScriptChannelFlutterApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        super(binaryMessenger);
        this.instanceManager = instanceManager;
    }

    public void postMessage(JavaScriptChannel javaScriptChannel, String str, GeneratedAndroidWebView.JavaScriptChannelFlutterApi.Reply<Void> reply) {
        super.postMessage(Long.valueOf(getIdentifierForJavaScriptChannel(javaScriptChannel)), str, reply);
    }

    private long getIdentifierForJavaScriptChannel(JavaScriptChannel javaScriptChannel) {
        Long identifierForStrongReference = this.instanceManager.getIdentifierForStrongReference(javaScriptChannel);
        if (identifierForStrongReference == null) {
            throw new IllegalStateException("Could not find identifier for JavaScriptChannel.");
        }
        return identifierForStrongReference.longValue();
    }
}
