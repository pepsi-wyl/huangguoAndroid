package com.google.common.eventbus;

import com.google.common.base.MoreObjects;
import com.google.common.base.Preconditions;
import com.google.common.util.concurrent.MoreExecutors;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.Locale;
import java.util.concurrent.Executor;
import java.util.logging.Level;
import java.util.logging.Logger;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public class EventBus {
    private static final Logger logger = Logger.getLogger(EventBus.class.getName());
    private final Dispatcher dispatcher;
    private final SubscriberExceptionHandler exceptionHandler;
    private final Executor executor;
    private final String identifier;
    private final SubscriberRegistry subscribers;

    public EventBus() {
        this("default");
    }

    public EventBus(String identifier) {
        this(identifier, MoreExecutors.directExecutor(), Dispatcher.perThreadDispatchQueue(), LoggingHandler.INSTANCE);
    }

    public EventBus(SubscriberExceptionHandler exceptionHandler) {
        this("default", MoreExecutors.directExecutor(), Dispatcher.perThreadDispatchQueue(), exceptionHandler);
    }

    EventBus(String identifier, Executor executor, Dispatcher dispatcher, SubscriberExceptionHandler exceptionHandler) {
        this.subscribers = new SubscriberRegistry(this);
        this.identifier = (String) Preconditions.checkNotNull(identifier);
        this.executor = (Executor) Preconditions.checkNotNull(executor);
        this.dispatcher = (Dispatcher) Preconditions.checkNotNull(dispatcher);
        this.exceptionHandler = (SubscriberExceptionHandler) Preconditions.checkNotNull(exceptionHandler);
    }

    public final String identifier() {
        return this.identifier;
    }

    final Executor executor() {
        return this.executor;
    }

    void handleSubscriberException(Throwable e, SubscriberExceptionContext context) {
        Preconditions.checkNotNull(e);
        Preconditions.checkNotNull(context);
        try {
            this.exceptionHandler.handleException(e, context);
        } catch (Throwable th) {
            logger.log(Level.SEVERE, String.format(Locale.ROOT, "Exception %s thrown while handling exception: %s", th, e), th);
        }
    }

    public void register(Object object) {
        this.subscribers.register(object);
    }

    public void unregister(Object object) {
        this.subscribers.unregister(object);
    }

    public void post(Object event) {
        Iterator<Subscriber> subscribers = this.subscribers.getSubscribers(event);
        if (subscribers.hasNext()) {
            this.dispatcher.dispatch(event, subscribers);
        } else {
            if (event instanceof DeadEvent) {
                return;
            }
            post(new DeadEvent(this, event));
        }
    }

    public String toString() {
        return MoreObjects.toStringHelper(this).addValue(this.identifier).toString();
    }

    static final class LoggingHandler implements SubscriberExceptionHandler {
        static final LoggingHandler INSTANCE = new LoggingHandler();

        LoggingHandler() {
        }

        @Override // com.google.common.eventbus.SubscriberExceptionHandler
        public void handleException(Throwable exception, SubscriberExceptionContext context) {
            Logger logger = logger(context);
            if (logger.isLoggable(Level.SEVERE)) {
                logger.log(Level.SEVERE, message(context), exception);
            }
        }

        private static Logger logger(SubscriberExceptionContext context) {
            return Logger.getLogger(EventBus.class.getName() + "." + context.getEventBus().identifier());
        }

        private static String message(SubscriberExceptionContext context) {
            Method subscriberMethod = context.getSubscriberMethod();
            return "Exception thrown by subscriber method " + subscriberMethod.getName() + '(' + subscriberMethod.getParameterTypes()[0].getName() + ") on subscriber " + context.getSubscriber() + " when dispatching event: " + context.getEvent();
        }
    }
}
