package androidx.webkit.internal;

import androidx.webkit.WebViewCompat;
import org.chromium.support_lib_boundary.VisualStateCallbackBoundaryInterface;

/* loaded from: classes.dex */
public class VisualStateCallbackAdapter implements VisualStateCallbackBoundaryInterface {
    private final WebViewCompat.VisualStateCallback mVisualStateCallback;

    public VisualStateCallbackAdapter(WebViewCompat.VisualStateCallback visualStateCallback) {
        this.mVisualStateCallback = visualStateCallback;
    }

    @Override // org.chromium.support_lib_boundary.VisualStateCallbackBoundaryInterface
    public void onComplete(long j) {
        this.mVisualStateCallback.onComplete(j);
    }
}
