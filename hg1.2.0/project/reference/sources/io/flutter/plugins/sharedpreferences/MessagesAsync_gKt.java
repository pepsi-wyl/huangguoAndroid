package io.flutter.plugins.sharedpreferences;

import android.util.Log;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;

/* compiled from: MessagesAsync.g.kt */
@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0010 \n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0003\n\u0002\b\u0003\u001a\u0018\u0010\u0000\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u0004H\u0002\u001a\u001a\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u00012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002H\u0002¨\u0006\u0007"}, d2 = {"wrapError", "", "", "exception", "", "wrapResult", "result", "shared_preferences_android_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class MessagesAsync_gKt {
    private static final List<Object> wrapResult(Object obj) {
        return CollectionsKt.listOf(obj);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final List<Object> wrapError(Throwable th) {
        if (th instanceof SharedPreferencesError) {
            SharedPreferencesError sharedPreferencesError = (SharedPreferencesError) th;
            return CollectionsKt.listOf(sharedPreferencesError.getCode(), th.getMessage(), sharedPreferencesError.getDetails());
        }
        return CollectionsKt.listOf((Object[]) new String[]{th.getClass().getSimpleName(), th.toString(), "Cause: " + th.getCause() + ", Stacktrace: " + Log.getStackTraceString(th)});
    }
}
