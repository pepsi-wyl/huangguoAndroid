package androidx.webkit.internal;

import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import androidx.webkit.ServiceWorkerClientCompat;
import org.chromium.support_lib_boundary.ServiceWorkerClientBoundaryInterface;

/* loaded from: classes.dex */
public class ServiceWorkerClientAdapter implements ServiceWorkerClientBoundaryInterface {
    private final ServiceWorkerClientCompat mClient;

    public ServiceWorkerClientAdapter(ServiceWorkerClientCompat serviceWorkerClientCompat) {
        this.mClient = serviceWorkerClientCompat;
    }

    @Override // org.chromium.support_lib_boundary.ServiceWorkerClientBoundaryInterface
    public WebResourceResponse shouldInterceptRequest(WebResourceRequest webResourceRequest) {
        return this.mClient.shouldInterceptRequest(webResourceRequest);
    }

    @Override // org.chromium.support_lib_boundary.FeatureFlagHolderBoundaryInterface
    public String[] getSupportedFeatures() {
        return new String[]{"SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST"};
    }
}
