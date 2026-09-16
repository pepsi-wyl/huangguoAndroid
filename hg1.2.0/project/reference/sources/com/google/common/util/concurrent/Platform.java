package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class Platform {
    static boolean isInstanceOfThrowableClass(@CheckForNull Throwable t, Class<? extends Throwable> expectedClass) {
        return expectedClass.isInstance(t);
    }

    static void restoreInterruptIfIsInterruptedException(Throwable t) {
        Preconditions.checkNotNull(t);
        if (t instanceof InterruptedException) {
            Thread.currentThread().interrupt();
        }
    }

    private Platform() {
    }
}
