package androidx.webkit.internal;

import android.os.Looper;
import android.webkit.TracingController;
import android.webkit.WebView;
import androidx.tracing.Trace$$ExternalSyntheticApiModelOutline0;
import androidx.webkit.TracingConfig;
import java.io.OutputStream;
import java.util.Collection;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public class ApiHelperForP {
    private ApiHelperForP() {
    }

    public static TracingController getTracingControllerInstance() {
        return TracingController.getInstance();
    }

    public static boolean isTracing(TracingController tracingController) {
        return tracingController.isTracing();
    }

    public static void start(TracingController tracingController, TracingConfig tracingConfig) {
        tracingController.start(Trace$$ExternalSyntheticApiModelOutline0.m331m().addCategories(tracingConfig.getPredefinedCategories()).addCategories((Collection<String>) tracingConfig.getCustomIncludedCategories()).setTracingMode(tracingConfig.getTracingMode()).build());
    }

    public static boolean stop(TracingController tracingController, OutputStream outputStream, Executor executor) {
        return tracingController.stop(outputStream, executor);
    }

    public static ClassLoader getWebViewClassLoader() {
        return WebView.getWebViewClassLoader();
    }

    public static Looper getWebViewLooper(WebView webView) {
        return webView.getWebViewLooper();
    }

    public static void setDataDirectorySuffix(String str) {
        WebView.setDataDirectorySuffix(str);
    }
}
