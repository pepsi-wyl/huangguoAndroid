package io.flutter.plugins.webviewflutter;

import android.content.Context;
import android.net.Uri;
import android.os.Message;
import android.view.View;
import android.webkit.ConsoleMessage;
import android.webkit.GeolocationPermissions;
import android.webkit.JsPromptResult;
import android.webkit.JsResult;
import android.webkit.PermissionRequest;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl;
import java.util.List;
import java.util.Objects;

/* loaded from: classes2.dex */
public class WebChromeClientHostApiImpl implements GeneratedAndroidWebView.WebChromeClientHostApi {
    private Context context;
    private final WebChromeClientFlutterApiImpl flutterApi;
    private final InstanceManager instanceManager;
    private final WebChromeClientCreator webChromeClientCreator;

    public static class WebChromeClientImpl extends SecureWebChromeClient {
        private final WebChromeClientFlutterApiImpl flutterApi;
        private boolean returnValueForOnShowFileChooser = false;
        private boolean returnValueForOnConsoleMessage = false;
        private boolean returnValueForOnJsAlert = false;
        private boolean returnValueForOnJsConfirm = false;
        private boolean returnValueForOnJsPrompt = false;

        static /* synthetic */ void lambda$onConsoleMessage$7(Void r0) {
        }

        static /* synthetic */ void lambda$onGeolocationPermissionsHidePrompt$4(Void r0) {
        }

        static /* synthetic */ void lambda$onGeolocationPermissionsShowPrompt$3(Void r0) {
        }

        static /* synthetic */ void lambda$onHideCustomView$2(Void r0) {
        }

        static /* synthetic */ void lambda$onPermissionRequest$6(Void r0) {
        }

        static /* synthetic */ void lambda$onProgressChanged$0(Void r0) {
        }

        static /* synthetic */ void lambda$onShowCustomView$1(Void r0) {
        }

        public WebChromeClientImpl(WebChromeClientFlutterApiImpl webChromeClientFlutterApiImpl) {
            this.flutterApi = webChromeClientFlutterApiImpl;
        }

        @Override // android.webkit.WebChromeClient
        public void onProgressChanged(WebView webView, int i) {
            this.flutterApi.onProgressChanged(this, webView, Long.valueOf(i), new GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda7
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebChromeClientHostApiImpl.WebChromeClientImpl.lambda$onProgressChanged$0((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebChromeClient
        public void onShowCustomView(View view, WebChromeClient.CustomViewCallback customViewCallback) {
            this.flutterApi.onShowCustomView(this, view, customViewCallback, new GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda0
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebChromeClientHostApiImpl.WebChromeClientImpl.lambda$onShowCustomView$1((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebChromeClient
        public void onHideCustomView() {
            this.flutterApi.onHideCustomView(this, new GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda10
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebChromeClientHostApiImpl.WebChromeClientImpl.lambda$onHideCustomView$2((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebChromeClient
        public void onGeolocationPermissionsShowPrompt(String str, GeolocationPermissions.Callback callback) {
            this.flutterApi.onGeolocationPermissionsShowPrompt(this, str, callback, new GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda8
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebChromeClientHostApiImpl.WebChromeClientImpl.lambda$onGeolocationPermissionsShowPrompt$3((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebChromeClient
        public void onGeolocationPermissionsHidePrompt() {
            this.flutterApi.onGeolocationPermissionsHidePrompt(this, new GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda9
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebChromeClientHostApiImpl.WebChromeClientImpl.lambda$onGeolocationPermissionsHidePrompt$4((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebChromeClient
        public boolean onShowFileChooser(WebView webView, final ValueCallback<Uri[]> valueCallback, WebChromeClient.FileChooserParams fileChooserParams) {
            final boolean z = this.returnValueForOnShowFileChooser;
            this.flutterApi.onShowFileChooser(this, webView, fileChooserParams, new GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda6
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebChromeClientHostApiImpl.WebChromeClientImpl.lambda$onShowFileChooser$5(z, valueCallback, (List) obj);
                }
            });
            return z;
        }

        static /* synthetic */ void lambda$onShowFileChooser$5(boolean z, ValueCallback valueCallback, List list) {
            if (z) {
                Uri[] uriArr = new Uri[list.size()];
                for (int i = 0; i < list.size(); i++) {
                    uriArr[i] = Uri.parse((String) list.get(i));
                }
                valueCallback.onReceiveValue(uriArr);
            }
        }

        @Override // android.webkit.WebChromeClient
        public void onPermissionRequest(PermissionRequest permissionRequest) {
            this.flutterApi.onPermissionRequest(this, permissionRequest, new GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda2
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebChromeClientHostApiImpl.WebChromeClientImpl.lambda$onPermissionRequest$6((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebChromeClient
        public boolean onConsoleMessage(ConsoleMessage consoleMessage) {
            this.flutterApi.onConsoleMessage(this, consoleMessage, new GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda3
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebChromeClientHostApiImpl.WebChromeClientImpl.lambda$onConsoleMessage$7((Void) obj);
                }
            });
            return this.returnValueForOnConsoleMessage;
        }

        public void setReturnValueForOnShowFileChooser(boolean z) {
            this.returnValueForOnShowFileChooser = z;
        }

        public void setReturnValueForOnConsoleMessage(boolean z) {
            this.returnValueForOnConsoleMessage = z;
        }

        public void setReturnValueForOnJsAlert(boolean z) {
            this.returnValueForOnJsAlert = z;
        }

        public void setReturnValueForOnJsConfirm(boolean z) {
            this.returnValueForOnJsConfirm = z;
        }

        public void setReturnValueForOnJsPrompt(boolean z) {
            this.returnValueForOnJsPrompt = z;
        }

        @Override // android.webkit.WebChromeClient
        public boolean onJsAlert(WebView webView, String str, String str2, final JsResult jsResult) {
            if (!this.returnValueForOnJsAlert) {
                return false;
            }
            this.flutterApi.onJsAlert(this, str, str2, new GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda5
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply
                public final void reply(Object obj) {
                    jsResult.confirm();
                }
            });
            return true;
        }

        @Override // android.webkit.WebChromeClient
        public boolean onJsConfirm(WebView webView, String str, String str2, final JsResult jsResult) {
            if (!this.returnValueForOnJsConfirm) {
                return false;
            }
            this.flutterApi.onJsConfirm(this, str, str2, new GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda1
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebChromeClientHostApiImpl.WebChromeClientImpl.lambda$onJsConfirm$9(jsResult, (Boolean) obj);
                }
            });
            return true;
        }

        static /* synthetic */ void lambda$onJsConfirm$9(JsResult jsResult, Boolean bool) {
            if (bool.booleanValue()) {
                jsResult.confirm();
            } else {
                jsResult.cancel();
            }
        }

        @Override // android.webkit.WebChromeClient
        public boolean onJsPrompt(WebView webView, String str, String str2, String str3, final JsPromptResult jsPromptResult) {
            if (!this.returnValueForOnJsPrompt) {
                return false;
            }
            this.flutterApi.onJsPrompt(this, str, str2, str3, new GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl$WebChromeClientImpl$$ExternalSyntheticLambda4
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebChromeClientHostApiImpl.WebChromeClientImpl.lambda$onJsPrompt$10(jsPromptResult, (String) obj);
                }
            });
            return true;
        }

        static /* synthetic */ void lambda$onJsPrompt$10(JsPromptResult jsPromptResult, String str) {
            if (str != null) {
                jsPromptResult.confirm(str);
            } else {
                jsPromptResult.cancel();
            }
        }
    }

    public static class SecureWebChromeClient extends WebChromeClient {
        WebViewClient webViewClient;

        @Override // android.webkit.WebChromeClient
        public boolean onCreateWindow(WebView webView, boolean z, boolean z2, Message message) {
            return onCreateWindow(webView, message, new WebView(webView.getContext()));
        }

        boolean onCreateWindow(final WebView webView, Message message, WebView webView2) {
            if (this.webViewClient == null) {
                return false;
            }
            WebViewClient webViewClient = new WebViewClient() { // from class: io.flutter.plugins.webviewflutter.WebChromeClientHostApiImpl.SecureWebChromeClient.1
                @Override // android.webkit.WebViewClient
                public boolean shouldOverrideUrlLoading(WebView webView3, WebResourceRequest webResourceRequest) {
                    if (SecureWebChromeClient.this.webViewClient.shouldOverrideUrlLoading(webView, webResourceRequest)) {
                        return true;
                    }
                    webView.loadUrl(webResourceRequest.getUrl().toString());
                    return true;
                }

                @Override // android.webkit.WebViewClient
                public boolean shouldOverrideUrlLoading(WebView webView3, String str) {
                    if (SecureWebChromeClient.this.webViewClient.shouldOverrideUrlLoading(webView, str)) {
                        return true;
                    }
                    webView.loadUrl(str);
                    return true;
                }
            };
            if (webView2 == null) {
                webView2 = new WebView(webView.getContext());
            }
            webView2.setWebViewClient(webViewClient);
            ((WebView.WebViewTransport) message.obj).setWebView(webView2);
            message.sendToTarget();
            return true;
        }

        public void setWebViewClient(WebViewClient webViewClient) {
            this.webViewClient = webViewClient;
        }
    }

    public static class WebChromeClientCreator {
        public WebChromeClientImpl createWebChromeClient(WebChromeClientFlutterApiImpl webChromeClientFlutterApiImpl) {
            return new WebChromeClientImpl(webChromeClientFlutterApiImpl);
        }
    }

    public WebChromeClientHostApiImpl(InstanceManager instanceManager, WebChromeClientCreator webChromeClientCreator, WebChromeClientFlutterApiImpl webChromeClientFlutterApiImpl) {
        this.instanceManager = instanceManager;
        this.webChromeClientCreator = webChromeClientCreator;
        this.flutterApi = webChromeClientFlutterApiImpl;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientHostApi
    public void create(Long l) {
        this.instanceManager.addDartCreatedInstance(this.webChromeClientCreator.createWebChromeClient(this.flutterApi), l.longValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientHostApi
    public void setSynchronousReturnValueForOnShowFileChooser(Long l, Boolean bool) {
        ((WebChromeClientImpl) Objects.requireNonNull((WebChromeClientImpl) this.instanceManager.getInstance(l.longValue()))).setReturnValueForOnShowFileChooser(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientHostApi
    public void setSynchronousReturnValueForOnConsoleMessage(Long l, Boolean bool) {
        ((WebChromeClientImpl) Objects.requireNonNull((WebChromeClientImpl) this.instanceManager.getInstance(l.longValue()))).setReturnValueForOnConsoleMessage(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientHostApi
    public void setSynchronousReturnValueForOnJsAlert(Long l, Boolean bool) {
        ((WebChromeClientImpl) Objects.requireNonNull((WebChromeClientImpl) this.instanceManager.getInstance(l.longValue()))).setReturnValueForOnJsAlert(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientHostApi
    public void setSynchronousReturnValueForOnJsConfirm(Long l, Boolean bool) {
        ((WebChromeClientImpl) Objects.requireNonNull((WebChromeClientImpl) this.instanceManager.getInstance(l.longValue()))).setReturnValueForOnJsConfirm(bool.booleanValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebChromeClientHostApi
    public void setSynchronousReturnValueForOnJsPrompt(Long l, Boolean bool) {
        ((WebChromeClientImpl) Objects.requireNonNull((WebChromeClientImpl) this.instanceManager.getInstance(l.longValue()))).setReturnValueForOnJsPrompt(bool.booleanValue());
    }
}
