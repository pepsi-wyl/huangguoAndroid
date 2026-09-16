package kotlinx.coroutines.internal;

import androidx.concurrent.futures.AbstractResolvableFuture$SafeAtomicHelper$$ExternalSyntheticBackportWithForwarding0;
import androidx.exifinterface.media.ExifInterface;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CancellableContinuation;
import kotlinx.coroutines.CancellableContinuationImpl;
import kotlinx.coroutines.CompletedWithCancellation;
import kotlinx.coroutines.CompletionStateKt;
import kotlinx.coroutines.CoroutineDispatcher;
import kotlinx.coroutines.DebugKt;
import kotlinx.coroutines.DebugStringsKt;
import kotlinx.coroutines.DispatchedTask;
import kotlinx.coroutines.EventLoop;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.ThreadLocalEventLoop;

/* compiled from: DispatchedContinuation.kt */
@Metadata(d1 = {"\u0000\u0080\u0001\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0003\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\b\u0000\u0018\u0000*\u0006\b\u0000\u0010\u0001 \u00002\b\u0012\u0004\u0012\u00028\u00000O2\u00060?j\u0002`@2\b\u0012\u0004\u0012\u00028\u00000\u0004B\u001d\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00028\u00000\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ!\u0010\u0011\u001a\u00020\b2\b\u0010\f\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u000e\u001a\u00020\rH\u0010¢\u0006\u0004\b\u000f\u0010\u0010J\u0015\u0010\u0013\u001a\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u0012¢\u0006\u0004\b\u0013\u0010\u0014J\u001f\u0010\u001a\u001a\u00020\b2\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0017\u001a\u00028\u0000H\u0000¢\u0006\u0004\b\u0018\u0010\u0019J\u0017\u0010\u001d\u001a\n\u0018\u00010\u001bj\u0004\u0018\u0001`\u001cH\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\r\u0010 \u001a\u00020\u001f¢\u0006\u0004\b \u0010!J\u0015\u0010\"\u001a\u00020\u001f2\u0006\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\"\u0010#J\r\u0010$\u001a\u00020\b¢\u0006\u0004\b$\u0010\nJH\u0010+\u001a\u00020\b2\f\u0010&\u001a\b\u0012\u0004\u0012\u00028\u00000%2%\b\b\u0010*\u001a\u001f\u0012\u0013\u0012\u00110\r¢\u0006\f\b(\u0012\b\b)\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\b\u0018\u00010'H\u0086\bø\u0001\u0000¢\u0006\u0004\b+\u0010,J\u001a\u0010.\u001a\u00020\u001f2\b\u0010-\u001a\u0004\u0018\u00010\u000bH\u0086\b¢\u0006\u0004\b.\u0010/J!\u00100\u001a\u00020\b2\f\u0010&\u001a\b\u0012\u0004\u0012\u00028\u00000%H\u0086\bø\u0001\u0000¢\u0006\u0004\b0\u00101J \u00102\u001a\u00020\b2\f\u0010&\u001a\b\u0012\u0004\u0012\u00028\u00000%H\u0016ø\u0001\u0000¢\u0006\u0004\b2\u00101J\u0011\u00105\u001a\u0004\u0018\u00010\u000bH\u0010¢\u0006\u0004\b3\u00104J\u000f\u00107\u001a\u000206H\u0016¢\u0006\u0004\b7\u00108J\u001b\u0010:\u001a\u0004\u0018\u00010\r2\n\u0010\u0005\u001a\u0006\u0012\u0002\b\u000309¢\u0006\u0004\b:\u0010;R\u001e\u0010<\u001a\u0004\u0018\u00010\u000b8\u0000@\u0000X\u0081\u000e¢\u0006\f\n\u0004\b<\u0010=\u0012\u0004\b>\u0010\nR\u001c\u0010C\u001a\n\u0018\u00010?j\u0004\u0018\u0001`@8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bA\u0010BR\u0014\u0010\u0016\u001a\u00020\u00158\u0016X\u0096\u0005¢\u0006\u0006\u001a\u0004\bD\u0010ER\u001a\u0010\u0005\u001a\b\u0012\u0004\u0012\u00028\u00000\u00048\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010FR\u0014\u0010G\u001a\u00020\u000b8\u0000X\u0081\u0004¢\u0006\u0006\n\u0004\bG\u0010=R\u001a\u0010J\u001a\b\u0012\u0004\u0012\u00028\u00000\u00048PX\u0090\u0004¢\u0006\u0006\u001a\u0004\bH\u0010IR\u0014\u0010\u0003\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010KR\u001a\u0010M\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u00128BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bL\u0010\u0014\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006N"}, d2 = {"Lkotlinx/coroutines/internal/DispatchedContinuation;", ExifInterface.GPS_DIRECTION_TRUE, "Lkotlinx/coroutines/CoroutineDispatcher;", "dispatcher", "Lkotlin/coroutines/Continuation;", "continuation", "<init>", "(Lkotlinx/coroutines/CoroutineDispatcher;Lkotlin/coroutines/Continuation;)V", "", "awaitReusability", "()V", "", "takenState", "", "cause", "cancelCompletedResult$kotlinx_coroutines_core", "(Ljava/lang/Object;Ljava/lang/Throwable;)V", "cancelCompletedResult", "Lkotlinx/coroutines/CancellableContinuationImpl;", "claimReusableCancellableContinuation", "()Lkotlinx/coroutines/CancellableContinuationImpl;", "Lkotlin/coroutines/CoroutineContext;", "context", "value", "dispatchYield$kotlinx_coroutines_core", "(Lkotlin/coroutines/CoroutineContext;Ljava/lang/Object;)V", "dispatchYield", "Ljava/lang/StackTraceElement;", "Lkotlinx/coroutines/internal/StackTraceElement;", "getStackTraceElement", "()Ljava/lang/StackTraceElement;", "", "isReusable", "()Z", "postponeCancellation", "(Ljava/lang/Throwable;)Z", "release", "Lkotlin/Result;", "result", "Lkotlin/Function1;", "Lkotlin/ParameterName;", "name", "onCancellation", "resumeCancellableWith", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V", "state", "resumeCancelled", "(Ljava/lang/Object;)Z", "resumeUndispatchedWith", "(Ljava/lang/Object;)V", "resumeWith", "takeState$kotlinx_coroutines_core", "()Ljava/lang/Object;", "takeState", "", "toString", "()Ljava/lang/String;", "Lkotlinx/coroutines/CancellableContinuation;", "tryReleaseClaimedContinuation", "(Lkotlinx/coroutines/CancellableContinuation;)Ljava/lang/Throwable;", "_state", "Ljava/lang/Object;", "get_state$kotlinx_coroutines_core$annotations", "Lkotlin/coroutines/jvm/internal/CoroutineStackFrame;", "Lkotlinx/coroutines/internal/CoroutineStackFrame;", "getCallerFrame", "()Lkotlin/coroutines/jvm/internal/CoroutineStackFrame;", "callerFrame", "getContext", "()Lkotlin/coroutines/CoroutineContext;", "Lkotlin/coroutines/Continuation;", "countOrElement", "getDelegate$kotlinx_coroutines_core", "()Lkotlin/coroutines/Continuation;", "delegate", "Lkotlinx/coroutines/CoroutineDispatcher;", "getReusableCancellableContinuation", "reusableCancellableContinuation", "kotlinx-coroutines-core", "Lkotlinx/coroutines/DispatchedTask;"}, k = 1, mv = {1, 6, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class DispatchedContinuation<T> extends DispatchedTask<T> implements CoroutineStackFrame, Continuation<T> {
    private static final /* synthetic */ AtomicReferenceFieldUpdater _reusableCancellableContinuation$FU = AtomicReferenceFieldUpdater.newUpdater(DispatchedContinuation.class, Object.class, "_reusableCancellableContinuation");
    private volatile /* synthetic */ Object _reusableCancellableContinuation;
    public Object _state;
    public final Continuation<T> continuation;
    public final Object countOrElement;
    public final CoroutineDispatcher dispatcher;

    public static /* synthetic */ void get_state$kotlinx_coroutines_core$annotations() {
    }

    @Override // kotlin.coroutines.Continuation
    public CoroutineContext getContext() {
        return this.continuation.getContext();
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    public StackTraceElement getStackTraceElement() {
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public DispatchedContinuation(CoroutineDispatcher coroutineDispatcher, Continuation<? super T> continuation) {
        super(-1);
        this.dispatcher = coroutineDispatcher;
        this.continuation = continuation;
        this._state = DispatchedContinuationKt.UNDEFINED;
        this.countOrElement = ThreadContextKt.threadContextElements(getContext());
        this._reusableCancellableContinuation = null;
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    public CoroutineStackFrame getCallerFrame() {
        Continuation<T> continuation = this.continuation;
        if (continuation instanceof CoroutineStackFrame) {
            return (CoroutineStackFrame) continuation;
        }
        return null;
    }

    private final CancellableContinuationImpl<?> getReusableCancellableContinuation() {
        Object obj = this._reusableCancellableContinuation;
        if (obj instanceof CancellableContinuationImpl) {
            return (CancellableContinuationImpl) obj;
        }
        return null;
    }

    public final boolean isReusable() {
        return this._reusableCancellableContinuation != null;
    }

    public final void release() {
        awaitReusability();
        CancellableContinuationImpl<?> reusableCancellableContinuation = getReusableCancellableContinuation();
        if (reusableCancellableContinuation != null) {
            reusableCancellableContinuation.detachChild$kotlinx_coroutines_core();
        }
    }

    @Override // kotlinx.coroutines.DispatchedTask
    public Object takeState$kotlinx_coroutines_core() {
        Object obj = this._state;
        if (DebugKt.getASSERTIONS_ENABLED() && obj == DispatchedContinuationKt.UNDEFINED) {
            throw new AssertionError();
        }
        this._state = DispatchedContinuationKt.UNDEFINED;
        return obj;
    }

    @Override // kotlinx.coroutines.DispatchedTask
    public Continuation<T> getDelegate$kotlinx_coroutines_core() {
        return this;
    }

    @Override // kotlin.coroutines.Continuation
    public void resumeWith(Object result) {
        CoroutineContext context;
        Object objUpdateThreadContext;
        CoroutineContext context2 = this.continuation.getContext();
        Object state$default = CompletionStateKt.toState$default(result, null, 1, null);
        if (this.dispatcher.isDispatchNeeded(context2)) {
            this._state = state$default;
            this.resumeMode = 0;
            this.dispatcher.mo2102dispatch(context2, this);
            return;
        }
        DebugKt.getASSERTIONS_ENABLED();
        EventLoop eventLoop$kotlinx_coroutines_core = ThreadLocalEventLoop.INSTANCE.getEventLoop$kotlinx_coroutines_core();
        if (eventLoop$kotlinx_coroutines_core.isUnconfinedLoopActive()) {
            this._state = state$default;
            this.resumeMode = 0;
            eventLoop$kotlinx_coroutines_core.dispatchUnconfined(this);
            return;
        }
        DispatchedContinuation<T> dispatchedContinuation = this;
        eventLoop$kotlinx_coroutines_core.incrementUseCount(true);
        try {
            context = getContext();
            objUpdateThreadContext = ThreadContextKt.updateThreadContext(context, this.countOrElement);
        } finally {
            try {
            } finally {
            }
        }
        try {
            this.continuation.resumeWith(result);
            Unit unit = Unit.INSTANCE;
            while (eventLoop$kotlinx_coroutines_core.processUnconfinedEvent()) {
            }
        } finally {
            ThreadContextKt.restoreThreadContext(context, objUpdateThreadContext);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x00a3 A[Catch: all -> 0x00c6, DONT_GENERATE, TryCatch #2 {all -> 0x00c6, blocks: (B:9:0x0045, B:11:0x0055, B:13:0x005b, B:26:0x00a9, B:14:0x0078, B:16:0x0088, B:20:0x0098, B:22:0x009d, B:25:0x00a6, B:24:0x00a3, B:30:0x00b4, B:32:0x00b9, B:35:0x00c2, B:36:0x00c5, B:34:0x00bf, B:17:0x008d, B:19:0x0091), top: B:49:0x0045, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void resumeCancellableWith(java.lang.Object r8, kotlin.jvm.functions.Function1<? super java.lang.Throwable, kotlin.Unit> r9) {
        /*
            r7 = this;
            java.lang.Object r9 = kotlinx.coroutines.CompletionStateKt.toState(r8, r9)
            kotlinx.coroutines.CoroutineDispatcher r0 = r7.dispatcher
            kotlin.coroutines.CoroutineContext r1 = r7.getContext()
            boolean r0 = r0.isDispatchNeeded(r1)
            r1 = 1
            if (r0 == 0) goto L23
            r7._state = r9
            r7.resumeMode = r1
            kotlinx.coroutines.CoroutineDispatcher r8 = r7.dispatcher
            kotlin.coroutines.CoroutineContext r9 = r7.getContext()
            r0 = r7
            java.lang.Runnable r0 = (java.lang.Runnable) r0
            r8.mo2102dispatch(r9, r0)
            goto Ld3
        L23:
            kotlinx.coroutines.DebugKt.getASSERTIONS_ENABLED()
            kotlinx.coroutines.ThreadLocalEventLoop r0 = kotlinx.coroutines.ThreadLocalEventLoop.INSTANCE
            kotlinx.coroutines.EventLoop r0 = r0.getEventLoop$kotlinx_coroutines_core()
            boolean r2 = r0.isUnconfinedLoopActive()
            if (r2 == 0) goto L3e
            r7._state = r9
            r7.resumeMode = r1
            r8 = r7
            kotlinx.coroutines.DispatchedTask r8 = (kotlinx.coroutines.DispatchedTask) r8
            r0.dispatchUnconfined(r8)
            goto Ld3
        L3e:
            r2 = r7
            kotlinx.coroutines.DispatchedTask r2 = (kotlinx.coroutines.DispatchedTask) r2
            r0.incrementUseCount(r1)
            r3 = 0
            kotlin.coroutines.CoroutineContext r4 = r7.getContext()     // Catch: java.lang.Throwable -> Lc6
            kotlinx.coroutines.Job$Key r5 = kotlinx.coroutines.Job.INSTANCE     // Catch: java.lang.Throwable -> Lc6
            kotlin.coroutines.CoroutineContext$Key r5 = (kotlin.coroutines.CoroutineContext.Key) r5     // Catch: java.lang.Throwable -> Lc6
            kotlin.coroutines.CoroutineContext$Element r4 = r4.get(r5)     // Catch: java.lang.Throwable -> Lc6
            kotlinx.coroutines.Job r4 = (kotlinx.coroutines.Job) r4     // Catch: java.lang.Throwable -> Lc6
            if (r4 == 0) goto L78
            boolean r5 = r4.isActive()     // Catch: java.lang.Throwable -> Lc6
            if (r5 != 0) goto L78
            java.util.concurrent.CancellationException r8 = r4.getCancellationException()     // Catch: java.lang.Throwable -> Lc6
            r4 = r8
            java.lang.Throwable r4 = (java.lang.Throwable) r4     // Catch: java.lang.Throwable -> Lc6
            r7.cancelCompletedResult$kotlinx_coroutines_core(r9, r4)     // Catch: java.lang.Throwable -> Lc6
            r9 = r7
            kotlin.coroutines.Continuation r9 = (kotlin.coroutines.Continuation) r9     // Catch: java.lang.Throwable -> Lc6
            kotlin.Result$Companion r4 = kotlin.Result.INSTANCE     // Catch: java.lang.Throwable -> Lc6
            java.lang.Throwable r8 = (java.lang.Throwable) r8     // Catch: java.lang.Throwable -> Lc6
            java.lang.Object r8 = kotlin.ResultKt.createFailure(r8)     // Catch: java.lang.Throwable -> Lc6
            java.lang.Object r8 = kotlin.Result.m497constructorimpl(r8)     // Catch: java.lang.Throwable -> Lc6
            r9.resumeWith(r8)     // Catch: java.lang.Throwable -> Lc6
            goto La9
        L78:
            kotlin.coroutines.Continuation<T> r9 = r7.continuation     // Catch: java.lang.Throwable -> Lc6
            java.lang.Object r4 = r7.countOrElement     // Catch: java.lang.Throwable -> Lc6
            kotlin.coroutines.CoroutineContext r5 = r9.getContext()     // Catch: java.lang.Throwable -> Lc6
            java.lang.Object r4 = kotlinx.coroutines.internal.ThreadContextKt.updateThreadContext(r5, r4)     // Catch: java.lang.Throwable -> Lc6
            kotlinx.coroutines.internal.Symbol r6 = kotlinx.coroutines.internal.ThreadContextKt.NO_THREAD_ELEMENTS     // Catch: java.lang.Throwable -> Lc6
            if (r4 == r6) goto L8d
            kotlinx.coroutines.UndispatchedCoroutine r9 = kotlinx.coroutines.CoroutineContextKt.updateUndispatchedCompletion(r9, r5, r4)     // Catch: java.lang.Throwable -> Lc6
            goto L91
        L8d:
            r9 = r3
            kotlinx.coroutines.UndispatchedCoroutine r9 = (kotlinx.coroutines.UndispatchedCoroutine) r9     // Catch: java.lang.Throwable -> Lc6
            r9 = r3
        L91:
            kotlin.coroutines.Continuation<T> r6 = r7.continuation     // Catch: java.lang.Throwable -> Lb3
            r6.resumeWith(r8)     // Catch: java.lang.Throwable -> Lb3
            kotlin.Unit r8 = kotlin.Unit.INSTANCE     // Catch: java.lang.Throwable -> Lb3
            kotlin.jvm.internal.InlineMarker.finallyStart(r1)     // Catch: java.lang.Throwable -> Lc6
            if (r9 == 0) goto La3
            boolean r8 = r9.clearThreadContext()     // Catch: java.lang.Throwable -> Lc6
            if (r8 == 0) goto La6
        La3:
            kotlinx.coroutines.internal.ThreadContextKt.restoreThreadContext(r5, r4)     // Catch: java.lang.Throwable -> Lc6
        La6:
            kotlin.jvm.internal.InlineMarker.finallyEnd(r1)     // Catch: java.lang.Throwable -> Lc6
        La9:
            boolean r8 = r0.processUnconfinedEvent()     // Catch: java.lang.Throwable -> Lc6
            if (r8 != 0) goto La9
            kotlin.jvm.internal.InlineMarker.finallyStart(r1)
            goto Lcd
        Lb3:
            r8 = move-exception
            kotlin.jvm.internal.InlineMarker.finallyStart(r1)     // Catch: java.lang.Throwable -> Lc6
            if (r9 == 0) goto Lbf
            boolean r9 = r9.clearThreadContext()     // Catch: java.lang.Throwable -> Lc6
            if (r9 == 0) goto Lc2
        Lbf:
            kotlinx.coroutines.internal.ThreadContextKt.restoreThreadContext(r5, r4)     // Catch: java.lang.Throwable -> Lc6
        Lc2:
            kotlin.jvm.internal.InlineMarker.finallyEnd(r1)     // Catch: java.lang.Throwable -> Lc6
            throw r8     // Catch: java.lang.Throwable -> Lc6
        Lc6:
            r8 = move-exception
            r2.handleFatalException(r8, r3)     // Catch: java.lang.Throwable -> Ld4
            kotlin.jvm.internal.InlineMarker.finallyStart(r1)
        Lcd:
            r0.decrementUseCount(r1)
            kotlin.jvm.internal.InlineMarker.finallyEnd(r1)
        Ld3:
            return
        Ld4:
            r8 = move-exception
            kotlin.jvm.internal.InlineMarker.finallyStart(r1)
            r0.decrementUseCount(r1)
            kotlin.jvm.internal.InlineMarker.finallyEnd(r1)
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.internal.DispatchedContinuation.resumeCancellableWith(java.lang.Object, kotlin.jvm.functions.Function1):void");
    }

    @Override // kotlinx.coroutines.DispatchedTask
    public void cancelCompletedResult$kotlinx_coroutines_core(Object takenState, Throwable cause) {
        if (takenState instanceof CompletedWithCancellation) {
            ((CompletedWithCancellation) takenState).onCancellation.invoke(cause);
        }
    }

    public final boolean resumeCancelled(Object state) {
        Job job = (Job) getContext().get(Job.INSTANCE);
        if (job == null || job.isActive()) {
            return false;
        }
        CancellationException cancellationException = job.getCancellationException();
        cancelCompletedResult$kotlinx_coroutines_core(state, cancellationException);
        Result.Companion companion = Result.INSTANCE;
        resumeWith(Result.m497constructorimpl(ResultKt.createFailure(cancellationException)));
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x002c A[DONT_GENERATE] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void resumeUndispatchedWith(java.lang.Object r6) {
        /*
            r5 = this;
            kotlin.coroutines.Continuation<T> r0 = r5.continuation
            java.lang.Object r1 = r5.countOrElement
            kotlin.coroutines.CoroutineContext r2 = r0.getContext()
            java.lang.Object r1 = kotlinx.coroutines.internal.ThreadContextKt.updateThreadContext(r2, r1)
            kotlinx.coroutines.internal.Symbol r3 = kotlinx.coroutines.internal.ThreadContextKt.NO_THREAD_ELEMENTS
            if (r1 == r3) goto L15
            kotlinx.coroutines.UndispatchedCoroutine r0 = kotlinx.coroutines.CoroutineContextKt.updateUndispatchedCompletion(r0, r2, r1)
            goto L19
        L15:
            r0 = 0
            r3 = r0
            kotlinx.coroutines.UndispatchedCoroutine r3 = (kotlinx.coroutines.UndispatchedCoroutine) r3
        L19:
            r3 = 1
            kotlin.coroutines.Continuation<T> r4 = r5.continuation     // Catch: java.lang.Throwable -> L33
            r4.resumeWith(r6)     // Catch: java.lang.Throwable -> L33
            kotlin.Unit r6 = kotlin.Unit.INSTANCE     // Catch: java.lang.Throwable -> L33
            kotlin.jvm.internal.InlineMarker.finallyStart(r3)
            if (r0 == 0) goto L2c
            boolean r6 = r0.clearThreadContext()
            if (r6 == 0) goto L2f
        L2c:
            kotlinx.coroutines.internal.ThreadContextKt.restoreThreadContext(r2, r1)
        L2f:
            kotlin.jvm.internal.InlineMarker.finallyEnd(r3)
            return
        L33:
            r6 = move-exception
            kotlin.jvm.internal.InlineMarker.finallyStart(r3)
            if (r0 == 0) goto L3f
            boolean r0 = r0.clearThreadContext()
            if (r0 == 0) goto L42
        L3f:
            kotlinx.coroutines.internal.ThreadContextKt.restoreThreadContext(r2, r1)
        L42:
            kotlin.jvm.internal.InlineMarker.finallyEnd(r3)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.internal.DispatchedContinuation.resumeUndispatchedWith(java.lang.Object):void");
    }

    public final void dispatchYield$kotlinx_coroutines_core(CoroutineContext context, T value) {
        this._state = value;
        this.resumeMode = 1;
        this.dispatcher.dispatchYield(context, this);
    }

    public String toString() {
        return "DispatchedContinuation[" + this.dispatcher + ", " + DebugStringsKt.toDebugString(this.continuation) + ']';
    }

    public final void awaitReusability() {
        while (this._reusableCancellableContinuation == DispatchedContinuationKt.REUSABLE_CLAIMED) {
        }
    }

    public final CancellableContinuationImpl<T> claimReusableCancellableContinuation() {
        while (true) {
            Object obj = this._reusableCancellableContinuation;
            if (obj == null) {
                this._reusableCancellableContinuation = DispatchedContinuationKt.REUSABLE_CLAIMED;
                return null;
            }
            if (obj instanceof CancellableContinuationImpl) {
                if (AbstractResolvableFuture$SafeAtomicHelper$$ExternalSyntheticBackportWithForwarding0.m(_reusableCancellableContinuation$FU, this, obj, DispatchedContinuationKt.REUSABLE_CLAIMED)) {
                    return (CancellableContinuationImpl) obj;
                }
            } else if (obj != DispatchedContinuationKt.REUSABLE_CLAIMED && !(obj instanceof Throwable)) {
                throw new IllegalStateException(("Inconsistent state " + obj).toString());
            }
        }
    }

    public final Throwable tryReleaseClaimedContinuation(CancellableContinuation<?> continuation) {
        do {
            Object obj = this._reusableCancellableContinuation;
            if (obj != DispatchedContinuationKt.REUSABLE_CLAIMED) {
                if (obj instanceof Throwable) {
                    if (!AbstractResolvableFuture$SafeAtomicHelper$$ExternalSyntheticBackportWithForwarding0.m(_reusableCancellableContinuation$FU, this, obj, null)) {
                        throw new IllegalArgumentException("Failed requirement.".toString());
                    }
                    return (Throwable) obj;
                }
                throw new IllegalStateException(("Inconsistent state " + obj).toString());
            }
        } while (!AbstractResolvableFuture$SafeAtomicHelper$$ExternalSyntheticBackportWithForwarding0.m(_reusableCancellableContinuation$FU, this, DispatchedContinuationKt.REUSABLE_CLAIMED, continuation));
        return null;
    }

    public final boolean postponeCancellation(Throwable cause) {
        while (true) {
            Object obj = this._reusableCancellableContinuation;
            if (Intrinsics.areEqual(obj, DispatchedContinuationKt.REUSABLE_CLAIMED)) {
                if (AbstractResolvableFuture$SafeAtomicHelper$$ExternalSyntheticBackportWithForwarding0.m(_reusableCancellableContinuation$FU, this, DispatchedContinuationKt.REUSABLE_CLAIMED, cause)) {
                    return true;
                }
            } else {
                if (obj instanceof Throwable) {
                    return true;
                }
                if (AbstractResolvableFuture$SafeAtomicHelper$$ExternalSyntheticBackportWithForwarding0.m(_reusableCancellableContinuation$FU, this, obj, null)) {
                    return false;
                }
            }
        }
    }
}
