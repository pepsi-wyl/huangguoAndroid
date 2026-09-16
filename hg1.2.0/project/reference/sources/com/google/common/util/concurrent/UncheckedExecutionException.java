package com.google.common.util.concurrent;

import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public class UncheckedExecutionException extends RuntimeException {
    private static final long serialVersionUID = 0;

    protected UncheckedExecutionException() {
    }

    protected UncheckedExecutionException(@CheckForNull String message) {
        super(message);
    }

    public UncheckedExecutionException(@CheckForNull String message, @CheckForNull Throwable cause) {
        super(message, cause);
    }

    public UncheckedExecutionException(@CheckForNull Throwable cause) {
        super(cause);
    }
}
