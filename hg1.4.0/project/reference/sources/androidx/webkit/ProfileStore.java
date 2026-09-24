package androidx.webkit;

import androidx.webkit.internal.ProfileStoreImpl;
import androidx.webkit.internal.WebViewFeatureInternal;
import java.util.List;

/* loaded from: classes.dex */
public interface ProfileStore {
    boolean deleteProfile(String str);

    List<String> getAllProfileNames();

    Profile getOrCreateProfile(String str);

    Profile getProfile(String str);

    /* renamed from: androidx.webkit.ProfileStore$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static ProfileStore getInstance() {
            if (WebViewFeatureInternal.MULTI_PROFILE.isSupportedByWebView()) {
                return ProfileStoreImpl.getInstance();
            }
            throw WebViewFeatureInternal.getUnsupportedOperationException();
        }
    }
}
