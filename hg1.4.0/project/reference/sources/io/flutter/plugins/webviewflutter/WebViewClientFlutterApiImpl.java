package io.flutter.plugins.webviewflutter;

import android.os.Build;
import android.webkit.HttpAuthHandler;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import androidx.webkit.WebResourceErrorCompat;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes2.dex */
public class WebViewClientFlutterApiImpl extends GeneratedAndroidWebView.WebViewClientFlutterApi {
    private final BinaryMessenger binaryMessenger;
    private final InstanceManager instanceManager;
    private final WebViewFlutterApiImpl webViewFlutterApi;

    static /* synthetic */ void lambda$doUpdateVisitedHistory$8(Void r0) {
    }

    static /* synthetic */ void lambda$onPageFinished$1(Void r0) {
    }

    static /* synthetic */ void lambda$onPageStarted$0(Void r0) {
    }

    static /* synthetic */ void lambda$onReceivedError$5(Void r0) {
    }

    static /* synthetic */ void lambda$onReceivedHttpAuthRequest$9(Void r0) {
    }

    static /* synthetic */ void lambda$onReceivedHttpError$2(Void r0) {
    }

    static /* synthetic */ void lambda$onReceivedRequestError$3(Void r0) {
    }

    static /* synthetic */ void lambda$onReceivedRequestError$4(Void r0) {
    }

    static /* synthetic */ void lambda$requestLoading$6(Void r0) {
    }

    static /* synthetic */ void lambda$urlLoading$7(Void r0) {
    }

    static GeneratedAndroidWebView.WebResourceErrorData createWebResourceErrorData(WebResourceError webResourceError) {
        return new GeneratedAndroidWebView.WebResourceErrorData.Builder().setErrorCode(Long.valueOf(webResourceError.getErrorCode())).setDescription(webResourceError.getDescription().toString()).build();
    }

    static GeneratedAndroidWebView.WebResourceErrorData createWebResourceErrorData(WebResourceErrorCompat webResourceErrorCompat) {
        return new GeneratedAndroidWebView.WebResourceErrorData.Builder().setErrorCode(Long.valueOf(webResourceErrorCompat.getErrorCode())).setDescription(webResourceErrorCompat.getDescription().toString()).build();
    }

    static GeneratedAndroidWebView.WebResourceRequestData createWebResourceRequestData(WebResourceRequest webResourceRequest) {
        Map<String, String> map;
        GeneratedAndroidWebView.WebResourceRequestData.Builder method = new GeneratedAndroidWebView.WebResourceRequestData.Builder().setUrl(webResourceRequest.getUrl().toString()).setIsForMainFrame(Boolean.valueOf(webResourceRequest.isForMainFrame())).setHasGesture(Boolean.valueOf(webResourceRequest.hasGesture())).setMethod(webResourceRequest.getMethod());
        if (webResourceRequest.getRequestHeaders() != null) {
            map = webResourceRequest.getRequestHeaders();
        } else {
            map = new HashMap<>();
        }
        GeneratedAndroidWebView.WebResourceRequestData.Builder requestHeaders = method.setRequestHeaders(map);
        if (Build.VERSION.SDK_INT >= 24) {
            requestHeaders.setIsRedirect(Boolean.valueOf(webResourceRequest.isRedirect()));
        }
        return requestHeaders.build();
    }

    static GeneratedAndroidWebView.WebResourceResponseData createWebResourceResponseData(WebResourceResponse webResourceResponse) {
        return new GeneratedAndroidWebView.WebResourceResponseData.Builder().setStatusCode(Long.valueOf(webResourceResponse.getStatusCode())).build();
    }

    public WebViewClientFlutterApiImpl(BinaryMessenger binaryMessenger, InstanceManager instanceManager) {
        super(binaryMessenger);
        this.binaryMessenger = binaryMessenger;
        this.instanceManager = instanceManager;
        this.webViewFlutterApi = new WebViewFlutterApiImpl(binaryMessenger, instanceManager);
    }

    public void onPageStarted(WebViewClient webViewClient, WebView webView, String str, GeneratedAndroidWebView.WebViewClientFlutterApi.Reply<Void> reply) {
        this.webViewFlutterApi.create(webView, new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientFlutterApiImpl$$ExternalSyntheticLambda10
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebViewClientFlutterApiImpl.lambda$onPageStarted$0((Void) obj);
            }
        });
        onPageStarted(Long.valueOf(getIdentifierForClient(webViewClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webView)), str, reply);
    }

    public void onPageFinished(WebViewClient webViewClient, WebView webView, String str, GeneratedAndroidWebView.WebViewClientFlutterApi.Reply<Void> reply) {
        this.webViewFlutterApi.create(webView, new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientFlutterApiImpl$$ExternalSyntheticLambda7
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebViewClientFlutterApiImpl.lambda$onPageFinished$1((Void) obj);
            }
        });
        onPageFinished(Long.valueOf(getIdentifierForClient(webViewClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webView)), str, reply);
    }

    public void onReceivedHttpError(WebViewClient webViewClient, WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse, GeneratedAndroidWebView.WebViewClientFlutterApi.Reply<Void> reply) {
        this.webViewFlutterApi.create(webView, new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientFlutterApiImpl$$ExternalSyntheticLambda6
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebViewClientFlutterApiImpl.lambda$onReceivedHttpError$2((Void) obj);
            }
        });
        onReceivedHttpError(Long.valueOf(getIdentifierForClient(webViewClient)), this.instanceManager.getIdentifierForStrongReference(webView), createWebResourceRequestData(webResourceRequest), createWebResourceResponseData(webResourceResponse), reply);
    }

    public void onReceivedRequestError(WebViewClient webViewClient, WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError, GeneratedAndroidWebView.WebViewClientFlutterApi.Reply<Void> reply) {
        this.webViewFlutterApi.create(webView, new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientFlutterApiImpl$$ExternalSyntheticLambda12
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebViewClientFlutterApiImpl.lambda$onReceivedRequestError$3((Void) obj);
            }
        });
        onReceivedRequestError(Long.valueOf(getIdentifierForClient(webViewClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webView)), createWebResourceRequestData(webResourceRequest), createWebResourceErrorData(webResourceError), reply);
    }

    public void onReceivedRequestError(WebViewClient webViewClient, WebView webView, WebResourceRequest webResourceRequest, WebResourceErrorCompat webResourceErrorCompat, GeneratedAndroidWebView.WebViewClientFlutterApi.Reply<Void> reply) {
        this.webViewFlutterApi.create(webView, new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientFlutterApiImpl$$ExternalSyntheticLambda11
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebViewClientFlutterApiImpl.lambda$onReceivedRequestError$4((Void) obj);
            }
        });
        onReceivedRequestError(Long.valueOf(getIdentifierForClient(webViewClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webView)), createWebResourceRequestData(webResourceRequest), createWebResourceErrorData(webResourceErrorCompat), reply);
    }

    public void onReceivedError(WebViewClient webViewClient, WebView webView, Long l, String str, String str2, GeneratedAndroidWebView.WebViewClientFlutterApi.Reply<Void> reply) {
        this.webViewFlutterApi.create(webView, new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientFlutterApiImpl$$ExternalSyntheticLambda3
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebViewClientFlutterApiImpl.lambda$onReceivedError$5((Void) obj);
            }
        });
        onReceivedError(Long.valueOf(getIdentifierForClient(webViewClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webView)), l, str, str2, reply);
    }

    public void requestLoading(WebViewClient webViewClient, WebView webView, WebResourceRequest webResourceRequest, GeneratedAndroidWebView.WebViewClientFlutterApi.Reply<Void> reply) {
        this.webViewFlutterApi.create(webView, new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientFlutterApiImpl$$ExternalSyntheticLambda8
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebViewClientFlutterApiImpl.lambda$requestLoading$6((Void) obj);
            }
        });
        requestLoading(Long.valueOf(getIdentifierForClient(webViewClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webView)), createWebResourceRequestData(webResourceRequest), reply);
    }

    public void urlLoading(WebViewClient webViewClient, WebView webView, String str, GeneratedAndroidWebView.WebViewClientFlutterApi.Reply<Void> reply) {
        this.webViewFlutterApi.create(webView, new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientFlutterApiImpl$$ExternalSyntheticLambda5
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebViewClientFlutterApiImpl.lambda$urlLoading$7((Void) obj);
            }
        });
        urlLoading(Long.valueOf(getIdentifierForClient(webViewClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webView)), str, reply);
    }

    public void doUpdateVisitedHistory(WebViewClient webViewClient, WebView webView, String str, boolean z, GeneratedAndroidWebView.WebViewClientFlutterApi.Reply<Void> reply) {
        this.webViewFlutterApi.create(webView, new GeneratedAndroidWebView.WebViewFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientFlutterApiImpl$$ExternalSyntheticLambda4
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewFlutterApi.Reply
            public final void reply(Object obj) {
                WebViewClientFlutterApiImpl.lambda$doUpdateVisitedHistory$8((Void) obj);
            }
        });
        doUpdateVisitedHistory(Long.valueOf(getIdentifierForClient(webViewClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webView)), str, Boolean.valueOf(z), reply);
    }

    public void onReceivedHttpAuthRequest(WebViewClient webViewClient, WebView webView, HttpAuthHandler httpAuthHandler, String str, String str2, GeneratedAndroidWebView.WebViewClientFlutterApi.Reply<Void> reply) {
        new HttpAuthHandlerFlutterApiImpl(this.binaryMessenger, this.instanceManager).create(httpAuthHandler, new GeneratedAndroidWebView.HttpAuthHandlerFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientFlutterApiImpl$$ExternalSyntheticLambda9
            @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.HttpAuthHandlerFlutterApi.Reply
            public final void reply(Object obj) {
                WebViewClientFlutterApiImpl.lambda$onReceivedHttpAuthRequest$9((Void) obj);
            }
        });
        onReceivedHttpAuthRequest((Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webViewClient)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(webView)), (Long) Objects.requireNonNull(this.instanceManager.getIdentifierForStrongReference(httpAuthHandler)), str, str2, reply);
    }

    private long getIdentifierForClient(WebViewClient webViewClient) {
        Long identifierForStrongReference = this.instanceManager.getIdentifierForStrongReference(webViewClient);
        if (identifierForStrongReference == null) {
            throw new IllegalStateException("Could not find identifier for WebViewClient.");
        }
        return identifierForStrongReference.longValue();
    }
}
