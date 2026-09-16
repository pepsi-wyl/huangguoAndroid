package com.google.common.util.concurrent;

import com.google.common.base.Supplier;
import com.google.common.util.concurrent.Service;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.logging.Level;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class AbstractExecutionThreadService implements Service {
    private static final LazyLogger logger = new LazyLogger(AbstractExecutionThreadService.class);
    private final Service delegate = new AnonymousClass1();

    protected abstract void run() throws Exception;

    protected void shutDown() throws Exception {
    }

    protected void startUp() throws Exception {
    }

    protected void triggerShutdown() {
    }

    /* renamed from: com.google.common.util.concurrent.AbstractExecutionThreadService$1, reason: invalid class name */
    class AnonymousClass1 extends AbstractService {
        AnonymousClass1() {
        }

        @Override // com.google.common.util.concurrent.AbstractService
        protected final void doStart() {
            MoreExecutors.renamingDecorator(AbstractExecutionThreadService.this.executor(), (Supplier<String>) new Supplier() { // from class: com.google.common.util.concurrent.AbstractExecutionThreadService$1$$ExternalSyntheticLambda0
                @Override // com.google.common.base.Supplier
                public final Object get() {
                    return this.f$0.m419xa0f821c5();
                }
            }).execute(new Runnable() { // from class: com.google.common.util.concurrent.AbstractExecutionThreadService$1$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m420x3d661e24();
                }
            });
        }

        /* renamed from: lambda$doStart$0$com-google-common-util-concurrent-AbstractExecutionThreadService$1, reason: not valid java name */
        /* synthetic */ String m419xa0f821c5() {
            return AbstractExecutionThreadService.this.serviceName();
        }

        /* renamed from: lambda$doStart$1$com-google-common-util-concurrent-AbstractExecutionThreadService$1, reason: not valid java name */
        /* synthetic */ void m420x3d661e24() {
            try {
                AbstractExecutionThreadService.this.startUp();
                notifyStarted();
                if (isRunning()) {
                    try {
                        AbstractExecutionThreadService.this.run();
                    } catch (Throwable th) {
                        Platform.restoreInterruptIfIsInterruptedException(th);
                        try {
                            AbstractExecutionThreadService.this.shutDown();
                        } catch (Exception e) {
                            Platform.restoreInterruptIfIsInterruptedException(e);
                            AbstractExecutionThreadService.logger.get().log(Level.WARNING, "Error while attempting to shut down the service after failure.", (Throwable) e);
                        }
                        notifyFailed(th);
                        return;
                    }
                }
                AbstractExecutionThreadService.this.shutDown();
                notifyStopped();
            } catch (Throwable th2) {
                Platform.restoreInterruptIfIsInterruptedException(th2);
                notifyFailed(th2);
            }
        }

        @Override // com.google.common.util.concurrent.AbstractService
        protected void doStop() {
            AbstractExecutionThreadService.this.triggerShutdown();
        }

        @Override // com.google.common.util.concurrent.AbstractService
        public String toString() {
            return AbstractExecutionThreadService.this.toString();
        }
    }

    protected AbstractExecutionThreadService() {
    }

    protected Executor executor() {
        return new Executor() { // from class: com.google.common.util.concurrent.AbstractExecutionThreadService$$ExternalSyntheticLambda0
            @Override // java.util.concurrent.Executor
            public final void execute(Runnable runnable) {
                this.f$0.m418xafeb5522(runnable);
            }
        };
    }

    /* renamed from: lambda$executor$0$com-google-common-util-concurrent-AbstractExecutionThreadService, reason: not valid java name */
    /* synthetic */ void m418xafeb5522(Runnable runnable) {
        MoreExecutors.newThread(serviceName(), runnable).start();
    }

    public String toString() {
        return serviceName() + " [" + state() + "]";
    }

    @Override // com.google.common.util.concurrent.Service
    public final boolean isRunning() {
        return this.delegate.isRunning();
    }

    @Override // com.google.common.util.concurrent.Service
    public final Service.State state() {
        return this.delegate.state();
    }

    @Override // com.google.common.util.concurrent.Service
    public final void addListener(Service.Listener listener, Executor executor) {
        this.delegate.addListener(listener, executor);
    }

    @Override // com.google.common.util.concurrent.Service
    public final Throwable failureCause() {
        return this.delegate.failureCause();
    }

    @Override // com.google.common.util.concurrent.Service
    public final Service startAsync() {
        this.delegate.startAsync();
        return this;
    }

    @Override // com.google.common.util.concurrent.Service
    public final Service stopAsync() {
        this.delegate.stopAsync();
        return this;
    }

    @Override // com.google.common.util.concurrent.Service
    public final void awaitRunning() {
        this.delegate.awaitRunning();
    }

    @Override // com.google.common.util.concurrent.Service
    public final void awaitRunning(long timeout, TimeUnit unit) throws TimeoutException {
        this.delegate.awaitRunning(timeout, unit);
    }

    @Override // com.google.common.util.concurrent.Service
    public final void awaitTerminated() {
        this.delegate.awaitTerminated();
    }

    @Override // com.google.common.util.concurrent.Service
    public final void awaitTerminated(long timeout, TimeUnit unit) throws TimeoutException {
        this.delegate.awaitTerminated(timeout, unit);
    }

    protected String serviceName() {
        return getClass().getSimpleName();
    }
}
