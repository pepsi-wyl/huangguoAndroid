package androidx.webkit.internal;

import android.net.Uri;
import android.webkit.WebResourceRequest;

/* loaded from: classes.dex */
public class ApiHelperForLollipop {
    private ApiHelperForLollipop() {
    }

    public static boolean isForMainFrame(WebResourceRequest webResourceRequest) {
        return webResourceRequest.isForMainFrame();
    }

    public static Uri getUrl(WebResourceRequest webResourceRequest) {
        return webResourceRequest.getUrl();
    }
}
