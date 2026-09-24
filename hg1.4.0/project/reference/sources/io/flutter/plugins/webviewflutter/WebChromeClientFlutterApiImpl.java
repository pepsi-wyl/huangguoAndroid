package io.flutter.plugins.webviewflutter;

import android.view.View;
import android.webkit.ConsoleMessage;
import android.webkit.GeolocationPermissions;
import android.webkit.PermissionRequest;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.util.List;
import java.util.Objects;

/* loaded from: classes2.dex */
public class WebChromeClientFlutterApiImpl extends GeneratedAndroidWebView.WebChromeClientFlutterApi {
    private final BinaryMessenger binaryMessenger;
    private final InstanceManager instanceManager;
    private final WebViewFlutterApiImpl webViewFlutterApi;

    static /* synthetic */ void lambda$onGeolocationPermissionsShowPrompt$3(Void r0) {
    }

    static /* synthetic */ void lambda$onPermissionRequest$4(Void r0) {
    }

    static /* synthetic */ void lambda$onProgressChanged$0(Void r0) {
    }

    static /* synthetic */ void lambda$onShowCustomView$5(Void r0) {
    }

    static /* synthetic */ void lambda$onShowCustomView$6(Void r0) {
    }

    static /* synthetic */ void lambda$onShowFileChooser$1(Void r0) {
    }

    static /* synthetic */ void lambda$onShowFileChooser$2(Void r0) {
    }

    /* renamed from: io.flutter.plugins.webviewflutter.WebChromeClientFlutterApiImpl$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$android$webkit$ConsoleMessage$MessageLevel;

        static {
            int[] iArr = new int[ConsoleMessage.MessageLevel.values().length];
            $SwitchMap$android$webkit$ConsoleMessage$MessageLevel = iArr;
            try {
                iArr[ConsoleMessage.MessageLevel.TIP.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$android$webkit$ConsoleMessage$MessageLevel[ConsoleMessage.MessageLevel.LOG.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$android$webkit$ConsoleMessage$MessageLevel[ConsoleMessage.MessageLevel.WARNING.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$android$webkit$ConsoleMessage$MessageLevel[ConsoleMessage.MessageLevel.ERROR.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$android$webkit$ConsoleMessage$MessageLevel[ConsoleMessage.MessageLevel.DEBUG.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
        }
    }

    private static GeneratedAndroidWebView.ConsoleMessageLevel toConsoleMessageLevel(ConsoleMessage.MessageLevel messageLevel) {
        int i = AnonymousClass1.$SwitchMap$android$webkit$ConsoleMessage$MessageLevel[messageLevel.ordinal()];
        if (i == 1) {
            return GeneratedAndroidWebView.ConsoleMessageLevel.TIP;
        }
        if (i == 2) {
            return GeneratedAndroidWebView.ConsoleMessageLevel.LOG;
        }
        if (i == 3) {
            return GeneratedAndroidWebView.ConsoleMessageLevel.WARNING;
        }
        if (i == 4) {
            return GeneratedAndroidWebView.ConsoleMessageLevel.ERROR;
        }
        if (i == 5) {
            return GeneratedAndroidWebView.ConsoleMessageLevel.DEBUG;
        }
        return GeneratedAndroidWebView.ConsoleMessageLevel.UNKNOWN;
    }

    public WebChromeClientFlutterApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        super(binaryMessenger);
        this.binaryMessenger = binaryMessenger;
        this.instanceManager = instanceManager;
        this.webViewFlutterApi = new WebViewFlutterApiImpl(binaryMessenger, instanceManager);
    }

    public void onProgressChanged(WebChromeClient webChromeClient, WebView webView, Long l, GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply<Void> reply) {
        this.webViewFlutterApi.create(webView, new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda3
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebChromeClientFlutterApiImpl.lambda$onProgressChanged$0((Void) obj);
            }
        });
        super.onProgressChanged(Long.valueOf(getIdentifierForClient(webChromeClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webView)), l, reply);
    }

    public void onShowFileChooser(WebChromeClient webChromeClient, WebView webView, WebChromeClient.FileChooserParams fileChooserParams, GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply<List<String>> reply) {
        this.webViewFlutterApi.create(webView, new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda0
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebChromeClientFlutterApiImpl.lambda$onShowFileChooser$1((Void) obj);
            }
        });
        new FileChooserParamsFlutterApiImpl(this.binaryMessenger, this.instanceManager).create(fileChooserParams, new GeneratedAndroidWebView.FileChooserParamsFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda1
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.FileChooserParamsFlutterApi.Reply
            public final void reply(Object obj) {
                WebChromeClientFlutterApiImpl.lambda$onShowFileChooser$2((Void) obj);
            }
        });
        onShowFileChooser((Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webChromeClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webView)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(fileChooserParams)), reply);
    }

    public void onGeolocationPermissionsShowPrompt(WebChromeClient webChromeClient, String str, GeolocationPermissions.Callback callback, GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply<Void> reply) {
        new GeolocationPermissionsCallbackFlutterApiImpl(this.binaryMessenger, this.instanceManager).create(callback, new GeneratedAndroidWebView.GeolocationPermissionsCallbackFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda4
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.GeolocationPermissionsCallbackFlutterApi.Reply
            public final void reply(Object obj) {
                WebChromeClientFlutterApiImpl.lambda$onGeolocationPermissionsShowPrompt$3((Void) obj);
            }
        });
        onGeolocationPermissionsShowPrompt((Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webChromeClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(callback)), str, reply);
    }

    public void onGeolocationPermissionsHidePrompt(WebChromeClient webChromeClient, GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply<Void> reply) {
        super.onGeolocationPermissionsHidePrompt((Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webChromeClient)), reply);
    }

    public void onPermissionRequest(WebChromeClient webChromeClient, PermissionRequest permissionRequest, GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply<Void> reply) {
        new PermissionRequestFlutterApiImpl(this.binaryMessenger, this.instanceManager).create(permissionRequest, permissionRequest.getResources(), new GeneratedAndroidWebView.PermissionRequestFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda2
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.PermissionRequestFlutterApi.Reply
            public final void reply(Object obj) {
                WebChromeClientFlutterApiImpl.lambda$onPermissionRequest$4((Void) obj);
            }
        });
        super.onPermissionRequest((Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webChromeClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(permissionRequest)), reply);
    }

    public void onShowCustomView(WebChromeClient webChromeClient, View view, WebChromeClient.CustomViewCallback customViewCallback, GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply<Void> reply) {
        new ViewFlutterApiImpl(this.binaryMessenger, this.instanceManager).create(view, new GeneratedAndroidWebView.ViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda5
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.ViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebChromeClientFlutterApiImpl.lambda$onShowCustomView$5((Void) obj);
            }
        });
        new CustomViewCallbackFlutterApiImpl(this.binaryMessenger, this.instanceManager).create(customViewCallback, new GeneratedAndroidWebView.CustomViewCallbackFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientFlutterApiImpl$$ExternalSyntheticLambda6
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.CustomViewCallbackFlutterApi.Reply
            public final void reply(Object obj) {
                WebChromeClientFlutterApiImpl.lambda$onShowCustomView$6((Void) obj);
            }
        });
        onShowCustomView((Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webChromeClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(view)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(customViewCallback)), reply);
    }

    public void onHideCustomView(WebChromeClient webChromeClient, GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply<Void> reply) {
        super.onHideCustomView((Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webChromeClient)), reply);
    }

    public void onConsoleMessage(WebChromeClient webChromeClient, ConsoleMessage consoleMessage, GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply<Void> reply) {
        super.onConsoleMessage((Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webChromeClient)), new GeneratedAndroidWebView.ConsoleMessage.Builder().setLineNumber(Long.valueOf(consoleMessage.lineNumber())).setMessage(consoleMessage.message()).setLevel(toConsoleMessageLevel(consoleMessage.messageLevel())).setSourceId(consoleMessage.sourceId()).build(), reply);
    }

    public void onJsAlert(WebChromeClient webChromeClient, String str, String str2, GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply<Void> reply) {
        super.onJsAlert((Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webChromeClient)), str, str2, reply);
    }

    public void onJsConfirm(WebChromeClient webChromeClient, String str, String str2, GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply<Boolean> reply) {
        super.onJsConfirm((Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webChromeClient)), str, str2, reply);
    }

    public void onJsPrompt(WebChromeClient webChromeClient, String str, String str2, String str3, GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply<String> reply) {
        super.onJsPrompt((Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webChromeClient)), str, str2, str3, reply);
    }

    private long getIdentifierForClient(WebChromeClient webChromeClient) {
        Long identifierForStrongReference = this.instanceManager.getIdentifierForStrongReference(webChromeClient);
        if (identifierForStrongReference == null) {
            throw new IllegalStateException("Could not find identifier for WebChromeClient.");
        }
        return identifierForStrongReference.longValue();
    }
}
