package io.flutter.plugins.webviewflutter;

import android.graphics.Bitmap;
import android.os.Build;
import android.view.KeyEvent;
import android.webkit.HttpAuthHandler;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import androidx.webkit.WebResourceErrorCompat;
import androidx.webkit.WebViewClientCompat;
import io.flutter.plugins.webviewflutter.GeneratedAndroidWebView;
import io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl;
import java.util.Objects;

/* loaded from: classes2.dex */
public class WebViewClientHostApiImpl implements GeneratedAndroidWebView.WebViewClientHostApi {
    private final WebViewClientFlutterApiImpl flutterApi;
    private final InstanceManager instanceManager;
    private final WebViewClientCreator webViewClientCreator;

    public static class WebViewClientImpl extends WebViewClient {
        private final WebViewClientFlutterApiImpl flutterApi;
        private boolean returnValueForShouldOverrideUrlLoading = false;

        static /* synthetic */ void lambda$doUpdateVisitedHistory$7(Void r0) {
        }

        static /* synthetic */ void lambda$onPageFinished$1(Void r0) {
        }

        static /* synthetic */ void lambda$onPageStarted$0(Void r0) {
        }

        static /* synthetic */ void lambda$onReceivedError$3(Void r0) {
        }

        static /* synthetic */ void lambda$onReceivedError$4(Void r0) {
        }

        static /* synthetic */ void lambda$onReceivedHttpAuthRequest$8(Void r0) {
        }

        static /* synthetic */ void lambda$onReceivedHttpError$2(Void r0) {
        }

        static /* synthetic */ void lambda$shouldOverrideUrlLoading$5(Void r0) {
        }

        static /* synthetic */ void lambda$shouldOverrideUrlLoading$6(Void r0) {
        }

        @Override // android.webkit.WebViewClient
        public void onUnhandledKeyEvent(WebView webView, KeyEvent keyEvent) {
        }

        public WebViewClientImpl(WebViewClientFlutterApiImpl webViewClientFlutterApiImpl) {
            this.flutterApi = webViewClientFlutterApiImpl;
        }

        @Override // android.webkit.WebViewClient
        public void onPageStarted(WebView webView, String str, Bitmap bitmap) {
            this.flutterApi.onPageStarted(this, webView, str, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda5
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientImpl.lambda$onPageStarted$0((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView webView, String str) {
            this.flutterApi.onPageFinished(this, webView, str, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda2
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientImpl.lambda$onPageFinished$1((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) {
            this.flutterApi.onReceivedHttpError(this, webView, webResourceRequest, webResourceResponse, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda4
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientImpl.lambda$onReceivedHttpError$2((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) {
            this.flutterApi.onReceivedRequestError(this, webView, webResourceRequest, webResourceError, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda0
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientImpl.lambda$onReceivedError$3((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView webView, int i, String str, String str2) {
            this.flutterApi.onReceivedError(this, webView, Long.valueOf(i), str, str2, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda6
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientImpl.lambda$onReceivedError$4((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, WebResourceRequest webResourceRequest) {
            this.flutterApi.requestLoading(this, webView, webResourceRequest, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda1
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientImpl.lambda$shouldOverrideUrlLoading$5((Void) obj);
                }
            });
            return webResourceRequest.isForMainFrame() && this.returnValueForShouldOverrideUrlLoading;
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            this.flutterApi.urlLoading(this, webView, str, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda3
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientImpl.lambda$shouldOverrideUrlLoading$6((Void) obj);
                }
            });
            return this.returnValueForShouldOverrideUrlLoading;
        }

        @Override // android.webkit.WebViewClient
        public void doUpdateVisitedHistory(WebView webView, String str, boolean z) {
            this.flutterApi.doUpdateVisitedHistory(this, webView, str, z, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda8
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientImpl.lambda$doUpdateVisitedHistory$7((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedHttpAuthRequest(WebView webView, HttpAuthHandler httpAuthHandler, String str, String str2) {
            this.flutterApi.onReceivedHttpAuthRequest(this, webView, httpAuthHandler, str, str2, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientImpl$$ExternalSyntheticLambda7
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientImpl.lambda$onReceivedHttpAuthRequest$8((Void) obj);
                }
            });
        }

        public void setReturnValueForShouldOverrideUrlLoading(boolean z) {
            this.returnValueForShouldOverrideUrlLoading = z;
        }
    }

    public static class WebViewClientCompatImpl extends WebViewClientCompat {
        private final WebViewClientFlutterApiImpl flutterApi;
        private boolean returnValueForShouldOverrideUrlLoading = false;

        static /* synthetic */ void lambda$doUpdateVisitedHistory$7(Void r0) {
        }

        static /* synthetic */ void lambda$onPageFinished$1(Void r0) {
        }

        static /* synthetic */ void lambda$onPageStarted$0(Void r0) {
        }

        static /* synthetic */ void lambda$onReceivedError$3(Void r0) {
        }

        static /* synthetic */ void lambda$onReceivedError$4(Void r0) {
        }

        static /* synthetic */ void lambda$onReceivedHttpAuthRequest$8(Void r0) {
        }

        static /* synthetic */ void lambda$onReceivedHttpError$2(Void r0) {
        }

        static /* synthetic */ void lambda$shouldOverrideUrlLoading$5(Void r0) {
        }

        static /* synthetic */ void lambda$shouldOverrideUrlLoading$6(Void r0) {
        }

        @Override // android.webkit.WebViewClient
        public void onUnhandledKeyEvent(WebView webView, KeyEvent keyEvent) {
        }

        public WebViewClientCompatImpl(WebViewClientFlutterApiImpl webViewClientFlutterApiImpl) {
            this.flutterApi = webViewClientFlutterApiImpl;
        }

        @Override // android.webkit.WebViewClient
        public void onPageStarted(WebView webView, String str, Bitmap bitmap) {
            this.flutterApi.onPageStarted(this, webView, str, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientCompatImpl$$ExternalSyntheticLambda4
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientCompatImpl.lambda$onPageStarted$0((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView webView, String str) {
            this.flutterApi.onPageFinished(this, webView, str, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientCompatImpl$$ExternalSyntheticLambda6
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientCompatImpl.lambda$onPageFinished$1((Void) obj);
                }
            });
        }

        @Override // androidx.webkit.WebViewClientCompat, android.webkit.WebViewClient, org.chromium.support_lib_boundary.WebViewClientBoundaryInterface
        public void onReceivedHttpError(WebView webView, WebResourceRequest webResourceRequest, WebResourceResponse webResourceResponse) {
            this.flutterApi.onReceivedHttpError(this, webView, webResourceRequest, webResourceResponse, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientCompatImpl$$ExternalSyntheticLambda1
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientCompatImpl.lambda$onReceivedHttpError$2((Void) obj);
                }
            });
        }

        @Override // androidx.webkit.WebViewClientCompat
        public void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceErrorCompat webResourceErrorCompat) {
            this.flutterApi.onReceivedRequestError(this, webView, webResourceRequest, webResourceErrorCompat, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientCompatImpl$$ExternalSyntheticLambda8
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientCompatImpl.lambda$onReceivedError$3((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedError(WebView webView, int i, String str, String str2) {
            this.flutterApi.onReceivedError(this, webView, Long.valueOf(i), str, str2, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientCompatImpl$$ExternalSyntheticLambda2
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientCompatImpl.lambda$onReceivedError$4((Void) obj);
                }
            });
        }

        @Override // androidx.webkit.WebViewClientCompat, android.webkit.WebViewClient, org.chromium.support_lib_boundary.WebViewClientBoundaryInterface
        public boolean shouldOverrideUrlLoading(WebView webView, WebResourceRequest webResourceRequest) {
            this.flutterApi.requestLoading(this, webView, webResourceRequest, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientCompatImpl$$ExternalSyntheticLambda5
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientCompatImpl.lambda$shouldOverrideUrlLoading$5((Void) obj);
                }
            });
            return webResourceRequest.isForMainFrame() && this.returnValueForShouldOverrideUrlLoading;
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            this.flutterApi.urlLoading(this, webView, str, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientCompatImpl$$ExternalSyntheticLambda0
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientCompatImpl.lambda$shouldOverrideUrlLoading$6((Void) obj);
                }
            });
            return this.returnValueForShouldOverrideUrlLoading;
        }

        @Override // android.webkit.WebViewClient
        public void doUpdateVisitedHistory(WebView webView, String str, boolean z) {
            this.flutterApi.doUpdateVisitedHistory(this, webView, str, z, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientCompatImpl$$ExternalSyntheticLambda3
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientCompatImpl.lambda$doUpdateVisitedHistory$7((Void) obj);
                }
            });
        }

        @Override // android.webkit.WebViewClient
        public void onReceivedHttpAuthRequest(WebView webView, HttpAuthHandler httpAuthHandler, String str, String str2) {
            this.flutterApi.onReceivedHttpAuthRequest(this, webView, httpAuthHandler, str, str2, new GeneratedAndroidWebView.WebViewClientFlutterApi.Reply() { // from class: io.flutter.plugins.webviewflutter.WebViewClientHostApiImpl$WebViewClientCompatImpl$$ExternalSyntheticLambda7
                @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientFlutterApi.Reply
                public final void reply(Object obj) {
                    WebViewClientHostApiImpl.WebViewClientCompatImpl.lambda$onReceivedHttpAuthRequest$8((Void) obj);
                }
            });
        }

        public void setReturnValueForShouldOverrideUrlLoading(boolean z) {
            this.returnValueForShouldOverrideUrlLoading = z;
        }
    }

    public static class WebViewClientCreator {
        public WebViewClient createWebViewClient(WebViewClientFlutterApiImpl webViewClientFlutterApiImpl) {
            if (Build.VERSION.SDK_INT >= 24) {
                return new WebViewClientImpl(webViewClientFlutterApiImpl);
            }
            return new WebViewClientCompatImpl(webViewClientFlutterApiImpl);
        }
    }

    public WebViewClientHostApiImpl(InstanceManager instanceManager, WebViewClientCreator webViewClientCreator, WebViewClientFlutterApiImpl webViewClientFlutterApiImpl) {
        this.instanceManager = instanceManager;
        this.webViewClientCreator = webViewClientCreator;
        this.flutterApi = webViewClientFlutterApiImpl;
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientHostApi
    public void create(Long l) {
        this.instanceManager.addDartCreatedInstance(this.webViewClientCreator.createWebViewClient(this.flutterApi), l.longValue());
    }

    @Override // io.flutter.plugins.webviewflutter.GeneratedAndroidWebView.WebViewClientHostApi
    public void setSynchronousReturnValueForShouldOverrideUrlLoading(Long l, Boolean bool) {
        WebViewClient webViewClient = (WebViewClient) Objects.requireNonNull((WebViewClient) this.instanceManager.getInstance(l.longValue()));
        if (webViewClient instanceof WebViewClientCompatImpl) {
            ((WebViewClientCompatImpl) webViewClient).setReturnValueForShouldOverrideUrlLoading(bool.booleanValue());
        } else {
            if (Build.VERSION.SDK_INT >= 24 && (webViewClient instanceof WebViewClientImpl)) {
                ((WebViewClientImpl) webViewClient).setReturnValueForShouldOverrideUrlLoading(bool.booleanValue());
                return;
            }
            throw new IllegalStateException("This WebViewClient doesn't support setting the returnValueForShouldOverrideUrlLoading.");
        }
    }
}
