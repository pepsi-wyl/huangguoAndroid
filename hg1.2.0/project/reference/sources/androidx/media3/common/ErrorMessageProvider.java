package androidx.media3.common;

import android.util.Pair;
import java.lang.Throwable;

/* loaded from: classes.dex */
public interface ErrorMessageProvider<T extends Throwable> {
    Pair<Integer, String> getErrorMessage(T t);
}
