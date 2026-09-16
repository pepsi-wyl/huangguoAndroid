package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableCollection;
import com.google.common.collect.UnmodifiableIterator;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.logging.Level;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
abstract class AggregateFuture<InputT, OutputT> extends AggregateFutureState<OutputT> {
    private static final LazyLogger logger = new LazyLogger(AggregateFuture.class);
    private final boolean allMustSucceed;
    private final boolean collectsValues;

    @CheckForNull
    private ImmutableCollection<? extends ListenableFuture<? extends InputT>> futures;

    enum ReleaseResourcesReason {
        OUTPUT_FUTURE_DONE,
        ALL_INPUT_FUTURES_PROCESSED
    }

    abstract void collectOneValue(int index, @ParametricNullness InputT returnValue);

    abstract void handleAllCompleted();

    AggregateFuture(ImmutableCollection<? extends ListenableFuture<? extends InputT>> futures, boolean allMustSucceed, boolean collectsValues) {
        super(futures.size());
        this.futures = (ImmutableCollection) Preconditions.checkNotNull(futures);
        this.allMustSucceed = allMustSucceed;
        this.collectsValues = collectsValues;
    }

    @Override // com.google.common.util.concurrent.AbstractFuture
    protected final void afterDone() {
        super.afterDone();
        ImmutableCollection<? extends ListenableFuture<? extends InputT>> immutableCollection = this.futures;
        releaseResources(ReleaseResourcesReason.OUTPUT_FUTURE_DONE);
        if (isCancelled() && (immutableCollection != null)) {
            boolean zWasInterrupted = wasInterrupted();
            UnmodifiableIterator<? extends ListenableFuture<? extends InputT>> it = immutableCollection.iterator();
            while (it.hasNext()) {
                it.next().cancel(zWasInterrupted);
            }
        }
    }

    @Override // com.google.common.util.concurrent.AbstractFuture
    @CheckForNull
    protected final String pendingToString() {
        ImmutableCollection<? extends ListenableFuture<? extends InputT>> immutableCollection = this.futures;
        if (immutableCollection != null) {
            return "futures=" + immutableCollection;
        }
        return super.pendingToString();
    }

    final void init() {
        Objects.requireNonNull(this.futures);
        if (this.futures.isEmpty()) {
            handleAllCompleted();
            return;
        }
        if (this.allMustSucceed) {
            UnmodifiableIterator<? extends ListenableFuture<? extends InputT>> it = this.futures.iterator();
            final int i = 0;
            while (it.hasNext()) {
                final ListenableFuture<? extends InputT> next = it.next();
                next.addListener(new Runnable() { // from class: com.google.common.util.concurrent.AggregateFuture$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m427lambda$init$0$comgooglecommonutilconcurrentAggregateFuture(next, i);
                    }
                }, MoreExecutors.directExecutor());
                i++;
            }
            return;
        }
        final ImmutableCollection<? extends ListenableFuture<? extends InputT>> immutableCollection = this.collectsValues ? this.futures : null;
        Runnable runnable = new Runnable() { // from class: com.google.common.util.concurrent.AggregateFuture$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m428lambda$init$1$comgooglecommonutilconcurrentAggregateFuture(immutableCollection);
            }
        };
        UnmodifiableIterator<? extends ListenableFuture<? extends InputT>> it2 = this.futures.iterator();
        while (it2.hasNext()) {
            it2.next().addListener(runnable, MoreExecutors.directExecutor());
        }
    }

    /* renamed from: lambda$init$0$com-google-common-util-concurrent-AggregateFuture, reason: not valid java name */
    /* synthetic */ void m427lambda$init$0$comgooglecommonutilconcurrentAggregateFuture(ListenableFuture listenableFuture, int i) {
        try {
            if (listenableFuture.isCancelled()) {
                this.futures = null;
                cancel(false);
            } else {
                collectValueFromNonCancelledFuture(i, listenableFuture);
            }
        } finally {
            m428lambda$init$1$comgooglecommonutilconcurrentAggregateFuture(null);
        }
    }

    private void handleException(Throwable throwable) {
        Preconditions.checkNotNull(throwable);
        if (this.allMustSucceed && !setException(throwable) && addCausalChain(getOrInitSeenExceptions(), throwable)) {
            log(throwable);
        } else if (throwable instanceof Error) {
            log(throwable);
        }
    }

    private static void log(Throwable throwable) {
        String str;
        if (throwable instanceof Error) {
            str = "Input Future failed with Error";
        } else {
            str = "Got more than one input Future failure. Logging failures after the first";
        }
        logger.get().log(Level.SEVERE, str, throwable);
    }

    @Override // com.google.common.util.concurrent.AggregateFutureState
    final void addInitialException(Set<Throwable> seen) {
        Preconditions.checkNotNull(seen);
        if (isCancelled()) {
            return;
        }
        addCausalChain(seen, (Throwable) Objects.requireNonNull(tryInternalFastPathGetFailure()));
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void collectValueFromNonCancelledFuture(int index, Future<? extends InputT> future) {
        try {
            collectOneValue(index, Futures.getDone(future));
        } catch (ExecutionException e) {
            handleException(e.getCause());
        } catch (Throwable th) {
            handleException(th);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: decrementCountAndMaybeComplete, reason: merged with bridge method [inline-methods] */
    public void m428lambda$init$1$comgooglecommonutilconcurrentAggregateFuture(@CheckForNull ImmutableCollection<? extends Future<? extends InputT>> futuresIfNeedToCollectAtCompletion) {
        int iDecrementRemainingAndGet = decrementRemainingAndGet();
        Preconditions.checkState(iDecrementRemainingAndGet >= 0, "Less than 0 remaining futures");
        if (iDecrementRemainingAndGet == 0) {
            processCompleted(futuresIfNeedToCollectAtCompletion);
        }
    }

    private void processCompleted(@CheckForNull ImmutableCollection<? extends Future<? extends InputT>> futuresIfNeedToCollectAtCompletion) {
        if (futuresIfNeedToCollectAtCompletion != null) {
            UnmodifiableIterator<? extends Future<? extends InputT>> it = futuresIfNeedToCollectAtCompletion.iterator();
            int i = 0;
            while (it.hasNext()) {
                Future<? extends InputT> next = it.next();
                if (!next.isCancelled()) {
                    collectValueFromNonCancelledFuture(i, next);
                }
                i++;
            }
        }
        clearSeenExceptions();
        handleAllCompleted();
        releaseResources(ReleaseResourcesReason.ALL_INPUT_FUTURES_PROCESSED);
    }

    void releaseResources(ReleaseResourcesReason reason) {
        Preconditions.checkNotNull(reason);
        this.futures = null;
    }

    private static boolean addCausalChain(Set<Throwable> seen, Throwable param) {
        while (param != null) {
            if (!seen.add(param)) {
                return false;
            }
            param = param.getCause();
        }
        return true;
    }
}
