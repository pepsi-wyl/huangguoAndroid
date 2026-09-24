package io.flutter.plugins.webviewflutter;

import android.webkit.DownloadListener;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;

/* loaded from: classes2.dex */
public class DownloadListenerFlutterApiImpl extends GeneratedAndroidWebView.DownloadListenerFlutterApi {
    private final InstanceManager instanceManager;

    public DownloadListenerFlutterApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        super(binaryMessenger);
        this.instanceManager = instanceManager;
    }

    public void onDownloadStart(DownloadListener downloadListener, String str, String str2, String str3, String str4, long j, GeneratedAndroidWebView.DownloadListenerFlutterApi.Reply<Void> reply) {
        onDownloadStart(Long.valueOf(getIdentifierForListener(downloadListener)), str, str2, str3, str4, Long.valueOf(j), reply);
    }

    private long getIdentifierForListener(DownloadListener downloadListener) {
        Long identifierForStrongReference = this.instanceManager.getIdentifierForStrongReference(downloadListener);
        if (identifierForStrongReference == null) {
            throw new IllegalStateException("Could not find identifier for DownloadListener.");
        }
        return identifierForStrongReference.longValue();
    }
}
