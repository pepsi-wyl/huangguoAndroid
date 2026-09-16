package io.flutter.plugins.urllauncher;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Message;
import android.view.KeyEvent;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import androidx.core.content.ContextCompat;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class WebViewActivity extends Activity {
    public static final String ACTION_CLOSE = "close action";
    static final String ENABLE_DOM_EXTRA = "enableDomStorage";
    static final String ENABLE_JS_EXTRA = "enableJavaScript";
    static final String URL_EXTRA = "url";
    WebView webview;
    private final BroadcastReceiver broadcastReceiver = new BroadcastReceiver() { // from class: io.flutter.plugins.urllauncher.WebViewActivity.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (WebViewActivity.ACTION_CLOSE.equals(intent.getAction())) {
                WebViewActivity.this.finish();
            }
        }
    };
    private final WebViewClient webViewClient = new WebViewClient() { // from class: io.flutter.plugins.urllauncher.WebViewActivity.2
        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            return super.shouldOverrideUrlLoading(webView, str);
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView webView, WebResourceRequest webResourceRequest) {
            webView.loadUrl(webResourceRequest.getUrl().toString());
            return false;
        }
    };
    private final IntentFilter closeIntentFilter = new IntentFilter(ACTION_CLOSE);

    class FlutterWebChromeClient extends WebChromeClient {
        FlutterWebChromeClient() {
        }

        @Override // android.webkit.WebChromeClient
        public boolean onCreateWindow(WebView webView, boolean z, boolean z2, Message message) {
            WebViewClient webViewClient = new WebViewClient() { // from class: io.flutter.plugins.urllauncher.WebViewActivity.FlutterWebChromeClient.1
                @Override // android.webkit.WebViewClient
                public boolean shouldOverrideUrlLoading(WebView webView2, WebResourceRequest webResourceRequest) {
                    WebViewActivity.this.webview.loadUrl(webResourceRequest.getUrl().toString());
                    return true;
                }

                @Override // android.webkit.WebViewClient
                public boolean shouldOverrideUrlLoading(WebView webView2, String str) {
                    WebViewActivity.this.webview.loadUrl(str);
                    return true;
                }
            };
            WebView webView2 = new WebView(WebViewActivity.this.webview.getContext());
            webView2.setWebViewClient(webViewClient);
            ((WebView.WebViewTransport) message.obj).setWebView(webView2);
            message.sendToTarget();
            return true;
        }
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        WebView webView = new WebView(this);
        this.webview = webView;
        setContentView(webView);
        Intent intent = getIntent();
        String stringExtra = intent.getStringExtra("url");
        boolean booleanExtra = intent.getBooleanExtra(ENABLE_JS_EXTRA, false);
        boolean booleanExtra2 = intent.getBooleanExtra(ENABLE_DOM_EXTRA, false);
        this.webview.loadUrl(stringExtra, extractHeaders(intent.getBundleExtra("com.android.browser.headers")));
        this.webview.getSettings().setJavaScriptEnabled(booleanExtra);
        this.webview.getSettings().setDomStorageEnabled(booleanExtra2);
        this.webview.setWebViewClient(this.webViewClient);
        this.webview.getSettings().setSupportMultipleWindows(true);
        this.webview.setWebChromeClient(new FlutterWebChromeClient());
        ContextCompat.registerReceiver(this, this.broadcastReceiver, this.closeIntentFilter, 2);
    }

    public static Map<String, String> extractHeaders(Bundle bundle) {
        if (bundle == null) {
            return Collections.emptyMap();
        }
        HashMap map = new HashMap();
        for (String str : bundle.keySet()) {
            map.put(str, bundle.getString(str));
        }
        return map;
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(this.broadcastReceiver);
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 4 && this.webview.canGoBack()) {
            this.webview.goBack();
            return true;
        }
        return super.onKeyDown(i, keyEvent);
    }

    public static Intent createIntent(Context context, String str, boolean z, boolean z2, Bundle bundle) {
        return new Intent(context, (Class<?>) WebViewActivity.class).putExtra("url", str).putExtra(ENABLE_JS_EXTRA, z).putExtra(ENABLE_DOM_EXTRA, z2).putExtra("com.android.browser.headers", bundle);
    }
}
