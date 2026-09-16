package com.google.common.base;

import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public class VerifyException extends RuntimeException {
    public VerifyException() {
    }

    public VerifyException(@CheckForNull String message) {
        super(message);
    }

    public VerifyException(@CheckForNull Throwable cause) {
        super(cause);
    }

    public VerifyException(@CheckForNull String message, @CheckForNull Throwable cause) {
        super(message, cause);
    }
}
