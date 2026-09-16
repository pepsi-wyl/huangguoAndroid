package com.google.common.eventbus;

import com.google.common.base.Preconditions;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.Executor;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
class Subscriber {
    private EventBus bus;
    private final Executor executor;
    private final Method method;
    final Object target;

    static Subscriber create(EventBus bus, Object listener, Method method) {
        if (isDeclaredThreadSafe(method)) {
            return new Subscriber(bus, listener, method);
        }
        return new SynchronizedSubscriber(bus, listener, method);
    }

    private Subscriber(EventBus bus, Object target, Method method) {
        this.bus = bus;
        this.target = Preconditions.checkNotNull(target);
        this.method = method;
        method.setAccessible(true);
        this.executor = bus.executor();
    }

    final void dispatchEvent(final Object event) {
        this.executor.execute(new Runnable() { // from class: com.google.common.eventbus.Subscriber$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() throws IllegalAccessException, IllegalArgumentException {
                this.f$0.m411lambda$dispatchEvent$0$comgooglecommoneventbusSubscriber(event);
            }
        });
    }

    /* renamed from: lambda$dispatchEvent$0$com-google-common-eventbus-Subscriber, reason: not valid java name */
    /* synthetic */ void m411lambda$dispatchEvent$0$comgooglecommoneventbusSubscriber(Object obj) throws IllegalAccessException, IllegalArgumentException {
        try {
            invokeSubscriberMethod(obj);
        } catch (InvocationTargetException e) {
            this.bus.handleSubscriberException(e.getCause(), context(obj));
        }
    }

    void invokeSubscriberMethod(Object event) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        try {
            this.method.invoke(this.target, Preconditions.checkNotNull(event));
        } catch (IllegalAccessException e) {
            throw new Error("Method became inaccessible: " + event, e);
        } catch (IllegalArgumentException e2) {
            throw new Error("Method rejected target/argument: " + event, e2);
        } catch (InvocationTargetException e3) {
            if (e3.getCause() instanceof Error) {
                throw ((Error) e3.getCause());
            }
            throw e3;
        }
    }

    private SubscriberExceptionContext context(Object event) {
        return new SubscriberExceptionContext(this.bus, event, this.target, this.method);
    }

    public final int hashCode() {
        return ((this.method.hashCode() + 31) * 31) + System.identityHashCode(this.target);
    }

    public final boolean equals(@CheckForNull Object obj) {
        if (!(obj instanceof Subscriber)) {
            return false;
        }
        Subscriber subscriber = (Subscriber) obj;
        return this.target == subscriber.target && this.method.equals(subscriber.method);
    }

    private static boolean isDeclaredThreadSafe(Method method) {
        return method.getAnnotation(AllowConcurrentEvents.class) != null;
    }

    static final class SynchronizedSubscriber extends Subscriber {
        private SynchronizedSubscriber(EventBus bus, Object target, Method method) {
            super(bus, target, method);
        }

        @Override // com.google.common.eventbus.Subscriber
        void invokeSubscriberMethod(Object event) throws InvocationTargetException {
            synchronized (this) {
                super.invokeSubscriberMethod(event);
            }
        }
    }
}
