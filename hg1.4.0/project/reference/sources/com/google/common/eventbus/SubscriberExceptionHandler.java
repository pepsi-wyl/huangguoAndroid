package com.google.common.eventbus;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface SubscriberExceptionHandler {
    void handleException(Throwable exception, SubscriberExceptionContext context);
}
