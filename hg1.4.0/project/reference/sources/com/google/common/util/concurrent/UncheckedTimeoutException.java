package com.google.common.util.concurrent;

import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public class UncheckedTimeoutException extends RuntimeException {
    private static final long serialVersionUID = 0;

    public UncheckedTimeoutException() {
    }

    public UncheckedTimeoutException(@CheckForNull String message) {
        super(message);
    }

    public UncheckedTimeoutException(@CheckForNull Throwable cause) {
        super(cause);
    }

    public UncheckedTimeoutException(@CheckForNull String message, @CheckForNull Throwable cause) {
        super(message, cause);
    }
}
