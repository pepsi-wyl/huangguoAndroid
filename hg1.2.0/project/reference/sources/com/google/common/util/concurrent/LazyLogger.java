package com.google.common.util.concurrent;

import java.util.logging.Logger;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class LazyLogger {
    private volatile Logger logger;
    private final String loggerName;

    LazyLogger(Class<?> ownerOfLogger) {
        this.loggerName = ownerOfLogger.getName();
    }

    Logger get() {
        Logger logger = this.logger;
        if (logger != null) {
            return logger;
        }
        synchronized (this) {
            Logger logger2 = this.logger;
            if (logger2 != null) {
                return logger2;
            }
            Logger logger3 = Logger.getLogger(this.loggerName);
            this.logger = logger3;
            return logger3;
        }
    }
}
