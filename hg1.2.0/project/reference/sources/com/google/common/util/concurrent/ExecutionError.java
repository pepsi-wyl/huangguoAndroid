package com.google.common.util.concurrent;

import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public class ExecutionError extends Error {
    private static final long serialVersionUID = 0;

    protected ExecutionError() {
    }

    protected ExecutionError(@CheckForNull String message) {
        super(message);
    }

    public ExecutionError(@CheckForNull String message, @CheckForNull Error cause) {
        super(message, cause);
    }

    public ExecutionError(@CheckForNull Error cause) {
        super(cause);
    }
}
