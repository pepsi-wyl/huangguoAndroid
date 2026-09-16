package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import com.google.common.collect.ImmutableList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
abstract class WrappingExecutorService implements ExecutorService {
    private final ExecutorService delegate;

    protected abstract <T> Callable<T> wrapTask(Callable<T> callable);

    protected WrappingExecutorService(ExecutorService delegate) {
        this.delegate = (ExecutorService) Preconditions.checkNotNull(delegate);
    }

    protected Runnable wrapTask(Runnable command) {
        final Callable callableWrapTask = wrapTask(Executors.callable(command, null));
        return new Runnable() { // from class: com.google.common.util.concurrent.WrappingExecutorService$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() throws Exception {
                WrappingExecutorService.lambda$wrapTask$0(callableWrapTask);
            }
        };
    }

    static /* synthetic */ void lambda$wrapTask$0(Callable callable) throws Exception {
        try {
            callable.call();
        } catch (Exception e) {
            Platform.restoreInterruptIfIsInterruptedException(e);
            Throwables.throwIfUnchecked(e);
            throw new RuntimeException(e);
        }
    }

    private <T> ImmutableList<Callable<T>> wrapTasks(Collection<? extends Callable<T>> tasks) {
        ImmutableList.Builder builder = ImmutableList.builder();
        Iterator<? extends Callable<T>> it = tasks.iterator();
        while (it.hasNext()) {
            builder.add((ImmutableList.Builder) wrapTask(it.next()));
        }
        return builder.build();
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable command) {
        this.delegate.execute(wrapTask(command));
    }

    @Override // java.util.concurrent.ExecutorService
    public final <T> Future<T> submit(Callable<T> task) {
        return this.delegate.submit(wrapTask((Callable) Preconditions.checkNotNull(task)));
    }

    @Override // java.util.concurrent.ExecutorService
    public final Future<?> submit(Runnable task) {
        return this.delegate.submit(wrapTask(task));
    }

    @Override // java.util.concurrent.ExecutorService
    public final <T> Future<T> submit(Runnable task, @ParametricNullness T result) {
        return this.delegate.submit(wrapTask(task), result);
    }

    @Override // java.util.concurrent.ExecutorService
    public final <T> List<Future<T>> invokeAll(Collection<? extends Callable<T>> tasks) throws InterruptedException {
        return this.delegate.invokeAll(wrapTasks(tasks));
    }

    @Override // java.util.concurrent.ExecutorService
    public final <T> List<Future<T>> invokeAll(Collection<? extends Callable<T>> tasks, long timeout, TimeUnit unit) throws InterruptedException {
        return this.delegate.invokeAll(wrapTasks(tasks), timeout, unit);
    }

    @Override // java.util.concurrent.ExecutorService
    public final <T> T invokeAny(Collection<? extends Callable<T>> collection) throws ExecutionException, InterruptedException {
        return (T) this.delegate.invokeAny(wrapTasks(collection));
    }

    @Override // java.util.concurrent.ExecutorService
    public final <T> T invokeAny(Collection<? extends Callable<T>> collection, long j, TimeUnit timeUnit) throws ExecutionException, InterruptedException, TimeoutException {
        return (T) this.delegate.invokeAny(wrapTasks(collection), j, timeUnit);
    }

    @Override // java.util.concurrent.ExecutorService
    public final void shutdown() {
        this.delegate.shutdown();
    }

    @Override // java.util.concurrent.ExecutorService
    public final List<Runnable> shutdownNow() {
        return this.delegate.shutdownNow();
    }

    @Override // java.util.concurrent.ExecutorService
    public final boolean isShutdown() {
        return this.delegate.isShutdown();
    }

    @Override // java.util.concurrent.ExecutorService
    public final boolean isTerminated() {
        return this.delegate.isTerminated();
    }

    @Override // java.util.concurrent.ExecutorService
    public final boolean awaitTermination(long timeout, TimeUnit unit) throws InterruptedException {
        return this.delegate.awaitTermination(timeout, unit);
    }
}
