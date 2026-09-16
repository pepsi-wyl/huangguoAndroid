package androidx.webkit.internal;

import org.chromium.support_lib_boundary.WebResourceRequestBoundaryInterface;

/* loaded from: classes.dex */
public class WebResourceRequestAdapter {
    private final WebResourceRequestBoundaryInterface mBoundaryInterface;

    public WebResourceRequestAdapter(WebResourceRequestBoundaryInterface webResourceRequestBoundaryInterface) {
        this.mBoundaryInterface = webResourceRequestBoundaryInterface;
    }

    public boolean isRedirect() {
        return this.mBoundaryInterface.isRedirect();
    }
}
