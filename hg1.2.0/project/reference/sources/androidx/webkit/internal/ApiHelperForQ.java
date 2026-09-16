package androidx.webkit.internal;

import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewRenderProcess;
import androidx.webkit.WebViewRenderProcessClient;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public class ApiHelperForQ {
    private ApiHelperForQ() {
    }

    @Deprecated
    public static void setForceDark(WebSettings webSettings, int i) {
        webSettings.setForceDark(i);
    }

    @Deprecated
    public static int getForceDark(WebSettings webSettings) {
        return webSettings.getForceDark();
    }

    public static WebViewRenderProcess getWebViewRenderProcess(WebView webView) {
        return webView.getWebViewRenderProcess();
    }

    public static boolean terminate(WebViewRenderProcess webViewRenderProcess) {
        return webViewRenderProcess.terminate();
    }

    public static void setWebViewRenderProcessClient(WebView webView, Executor executor, WebViewRenderProcessClient webViewRenderProcessClient) {
        webView.setWebViewRenderProcessClient(executor, webViewRenderProcessClient != null ? new WebViewRenderProcessClientFrameworkAdapter(webViewRenderProcessClient) : null);
    }

    public static void setWebViewRenderProcessClient(WebView webView, WebViewRenderProcessClient webViewRenderProcessClient) {
        webView.setWebViewRenderProcessClient(webViewRenderProcessClient != null ? new WebViewRenderProcessClientFrameworkAdapter(webViewRenderProcessClient) : null);
    }

    public static android.webkit.WebViewRenderProcessClient getWebViewRenderProcessClient(WebView webView) {
        return webView.getWebViewRenderProcessClient();
    }
}
