package com.google.common.util.concurrent;

import java.lang.Thread;
import java.util.Locale;
import java.util.logging.Level;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class UncaughtExceptionHandlers {
    private UncaughtExceptionHandlers() {
    }

    public static Thread.UncaughtExceptionHandler systemExit() {
        return new Exiter(Runtime.getRuntime());
    }

    static final class Exiter implements Thread.UncaughtExceptionHandler {
        private static final LazyLogger logger = new LazyLogger(Exiter.class);
        private final Runtime runtime;

        Exiter(Runtime runtime) {
            this.runtime = runtime;
        }

        @Override // java.lang.Thread.UncaughtExceptionHandler
        public void uncaughtException(Thread t, Throwable e) {
            try {
                logger.get().log(Level.SEVERE, String.format(Locale.ROOT, "Caught an exception in %s.  Shutting down.", t), e);
            } finally {
                try {
                } finally {
                }
            }
        }
    }
}
