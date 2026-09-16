package androidx.browser.customtabs;

import android.os.Bundle;

/* loaded from: classes.dex */
class Api33Impl {
    private Api33Impl() {
    }

    static <T> T getParcelable(Bundle bundle, String str, Class<T> cls) {
        return (T) bundle.getParcelable(str, cls);
    }
}
