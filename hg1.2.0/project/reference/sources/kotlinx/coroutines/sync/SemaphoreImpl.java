package kotlinx.coroutines.sync;

import androidx.concurrent.futures.AbstractResolvableFuture$SafeAtomicHelper$$ExternalSyntheticBackportWithForwarding0;
import androidx.media3.extractor.text.ttml.TtmlNode;
import com.google.common.util.concurrent.Striped$SmallLazyStriped$$ExternalSyntheticBackportWithForwarding0;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugProbesKt;
import kotlin.jvm.functions.Function1;
import kotlinx.coroutines.CancellableContinuation;
import kotlinx.coroutines.CancellableContinuationImpl;
import kotlinx.coroutines.CancellableContinuationKt;
import kotlinx.coroutines.DebugKt;
import kotlinx.coroutines.internal.ConcurrentLinkedListKt;
import kotlinx.coroutines.internal.ConcurrentLinkedListNode;
import kotlinx.coroutines.internal.Segment;
import kotlinx.coroutines.internal.SegmentOrClosed;

/* compiled from: Semaphore.kt */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\u0010\u0003\n\u0002\b\u0004\n\u0002\u0018\u0002\b\u0002\u0018\u00002\u00020\u001eB\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0001¢\u0006\u0004\b\u0004\u0010\u0005J\u0013\u0010\u0007\u001a\u00020\u0006H\u0096@ø\u0001\u0000¢\u0006\u0004\b\u0007\u0010\bJ\u0013\u0010\t\u001a\u00020\u0006H\u0082@ø\u0001\u0000¢\u0006\u0004\b\t\u0010\bJ\u001d\u0010\r\u001a\u00020\f2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\u00060\nH\u0002¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\fH\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\fH\u0002¢\u0006\u0004\b\u0013\u0010\u0012J\u0019\u0010\u0014\u001a\u00020\f*\b\u0012\u0004\u0012\u00020\u00060\nH\u0002¢\u0006\u0004\b\u0014\u0010\u000eR\u0014\u0010\u0017\u001a\u00020\u00018VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0015\u0010\u0016R \u0010\u001a\u001a\u000e\u0012\u0004\u0012\u00020\u0019\u0012\u0004\u0012\u00020\u00060\u00188\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010\u001bR\u0014\u0010\u0002\u001a\u00020\u00018\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0002\u0010\u001c\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006\u001d"}, d2 = {"Lkotlinx/coroutines/sync/SemaphoreImpl;", "", "permits", "acquiredPermits", "<init>", "(II)V", "", "acquire", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "acquireSlowPath", "Lkotlinx/coroutines/CancellableContinuation;", "cont", "", "addAcquireToQueue", "(Lkotlinx/coroutines/CancellableContinuation;)Z", "release", "()V", "tryAcquire", "()Z", "tryResumeNextFromQueue", "tryResumeAcquire", "getAvailablePermits", "()I", "availablePermits", "Lkotlin/Function1;", "", "onCancellationRelease", "Lkotlin/jvm/functions/Function1;", "I", "kotlinx-coroutines-core", "Lkotlinx/coroutines/sync/Semaphore;"}, k = 1, mv = {1, 6, 0}, xi = 48)
/* loaded from: classes2.dex */
final class SemaphoreImpl implements Semaphore {
    volatile /* synthetic */ int _availablePermits;
    private volatile /* synthetic */ long deqIdx = 0;
    private volatile /* synthetic */ long enqIdx = 0;
    private volatile /* synthetic */ Object head;
    private final Function1<Throwable, Unit> onCancellationRelease;
    private final int permits;
    private volatile /* synthetic */ Object tail;
    private static final /* synthetic */ AtomicReferenceFieldUpdater head$FU = AtomicReferenceFieldUpdater.newUpdater(SemaphoreImpl.class, Object.class, TtmlNode.TAG_HEAD);
    private static final /* synthetic */ AtomicLongFieldUpdater deqIdx$FU = AtomicLongFieldUpdater.newUpdater(SemaphoreImpl.class, "deqIdx");
    private static final /* synthetic */ AtomicReferenceFieldUpdater tail$FU = AtomicReferenceFieldUpdater.newUpdater(SemaphoreImpl.class, Object.class, "tail");
    private static final /* synthetic */ AtomicLongFieldUpdater enqIdx$FU = AtomicLongFieldUpdater.newUpdater(SemaphoreImpl.class, "enqIdx");
    static final /* synthetic */ AtomicIntegerFieldUpdater _availablePermits$FU = AtomicIntegerFieldUpdater.newUpdater(SemaphoreImpl.class, "_availablePermits");

    public SemaphoreImpl(int i, int i2) {
        this.permits = i;
        if (i <= 0) {
            throw new IllegalArgumentException(("Semaphore should have at least 1 permit, but had " + i).toString());
        }
        if (i2 < 0 || i2 > i) {
            throw new IllegalArgumentException(("The number of acquired permits should be in 0.." + i).toString());
        }
        SemaphoreSegment semaphoreSegment = new SemaphoreSegment(0L, null, 2);
        this.head = semaphoreSegment;
        this.tail = semaphoreSegment;
        this._availablePermits = i - i2;
        this.onCancellationRelease = new Function1<Throwable, Unit>() { // from class: kotlinx.coroutines.sync.SemaphoreImpl$onCancellationRelease$1
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Throwable th) {
                invoke2(th);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke, reason: avoid collision after fix types in other method */
            public final void invoke2(Throwable th) {
                this.this$0.release();
            }
        };
    }

    @Override // kotlinx.coroutines.sync.Semaphore
    public int getAvailablePermits() {
        return Math.max(this._availablePermits, 0);
    }

    @Override // kotlinx.coroutines.sync.Semaphore
    public Object acquire(Continuation<? super Unit> continuation) {
        if (_availablePermits$FU.getAndDecrement(this) > 0) {
            return Unit.INSTANCE;
        }
        Object objAcquireSlowPath = acquireSlowPath(continuation);
        return objAcquireSlowPath == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objAcquireSlowPath : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean addAcquireToQueue(CancellableContinuation<? super Unit> cont) {
        Object objM2105constructorimpl;
        Segment segment = (SemaphoreSegment) this.tail;
        long andIncrement = enqIdx$FU.getAndIncrement(this);
        long j = andIncrement / SemaphoreKt.SEGMENT_SIZE;
        loop0: while (true) {
            Segment segment2 = segment;
            while (true) {
                if (segment2.getId() < j || segment2.getRemoved()) {
                    Object obj = segment2.get_next();
                    if (obj == ConcurrentLinkedListKt.CLOSED) {
                        objM2105constructorimpl = SegmentOrClosed.m2105constructorimpl(ConcurrentLinkedListKt.CLOSED);
                        break;
                    }
                    Segment segmentCreateSegment = (Segment) ((ConcurrentLinkedListNode) obj);
                    if (segmentCreateSegment == null) {
                        segmentCreateSegment = SemaphoreKt.createSegment(segment2.getId() + 1, (SemaphoreSegment) segment2);
                        if (segment2.trySetNext(segmentCreateSegment)) {
                            if (segment2.getRemoved()) {
                                segment2.remove();
                            }
                        }
                    }
                    segment2 = segmentCreateSegment;
                } else {
                    objM2105constructorimpl = SegmentOrClosed.m2105constructorimpl(segment2);
                    break;
                }
            }
            if (!SegmentOrClosed.m2110isClosedimpl(objM2105constructorimpl)) {
                Segment segmentM2108getSegmentimpl = SegmentOrClosed.m2108getSegmentimpl(objM2105constructorimpl);
                while (true) {
                    Segment segment3 = (Segment) this.tail;
                    if (segment3.getId() >= segmentM2108getSegmentimpl.getId()) {
                        break loop0;
                    }
                    if (!segmentM2108getSegmentimpl.tryIncPointers$kotlinx_coroutines_core()) {
                        break;
                    }
                    if (AbstractResolvableFuture$SafeAtomicHelper$$ExternalSyntheticBackportWithForwarding0.m(tail$FU, this, segment3, segmentM2108getSegmentimpl)) {
                        if (segment3.decPointers$kotlinx_coroutines_core()) {
                            segment3.remove();
                        }
                    } else if (segmentM2108getSegmentimpl.decPointers$kotlinx_coroutines_core()) {
                        segmentM2108getSegmentimpl.remove();
                    }
                }
            } else {
                break;
            }
        }
        SemaphoreSegment semaphoreSegment = (SemaphoreSegment) SegmentOrClosed.m2108getSegmentimpl(objM2105constructorimpl);
        int i = (int) (andIncrement % SemaphoreKt.SEGMENT_SIZE);
        if (!Striped$SmallLazyStriped$$ExternalSyntheticBackportWithForwarding0.m(semaphoreSegment.acquirers, i, null, cont)) {
            if (Striped$SmallLazyStriped$$ExternalSyntheticBackportWithForwarding0.m(semaphoreSegment.acquirers, i, SemaphoreKt.PERMIT, SemaphoreKt.TAKEN)) {
                cont.resume(Unit.INSTANCE, this.onCancellationRelease);
                return true;
            }
            if (!DebugKt.getASSERTIONS_ENABLED() || semaphoreSegment.acquirers.get(i) == SemaphoreKt.BROKEN) {
                return false;
            }
            throw new AssertionError();
        }
        cont.invokeOnCancellation(new CancelSemaphoreAcquisitionHandler(semaphoreSegment, i));
        return true;
    }

    private final boolean tryResumeNextFromQueue() {
        Object objM2105constructorimpl;
        Segment segment = (SemaphoreSegment) this.head;
        long andIncrement = deqIdx$FU.getAndIncrement(this);
        long j = andIncrement / SemaphoreKt.SEGMENT_SIZE;
        loop0: while (true) {
            Segment segment2 = segment;
            while (true) {
                if (segment2.getId() < j || segment2.getRemoved()) {
                    Object obj = segment2.get_next();
                    if (obj == ConcurrentLinkedListKt.CLOSED) {
                        objM2105constructorimpl = SegmentOrClosed.m2105constructorimpl(ConcurrentLinkedListKt.CLOSED);
                        break;
                    }
                    Segment segmentCreateSegment = (Segment) ((ConcurrentLinkedListNode) obj);
                    if (segmentCreateSegment == null) {
                        segmentCreateSegment = SemaphoreKt.createSegment(segment2.getId() + 1, (SemaphoreSegment) segment2);
                        if (segment2.trySetNext(segmentCreateSegment)) {
                            if (segment2.getRemoved()) {
                                segment2.remove();
                            }
                        }
                    }
                    segment2 = segmentCreateSegment;
                } else {
                    objM2105constructorimpl = SegmentOrClosed.m2105constructorimpl(segment2);
                    break;
                }
            }
            if (SegmentOrClosed.m2110isClosedimpl(objM2105constructorimpl)) {
                break;
            }
            Segment segmentM2108getSegmentimpl = SegmentOrClosed.m2108getSegmentimpl(objM2105constructorimpl);
            while (true) {
                Segment segment3 = (Segment) this.head;
                if (segment3.getId() >= segmentM2108getSegmentimpl.getId()) {
                    break loop0;
                }
                if (!segmentM2108getSegmentimpl.tryIncPointers$kotlinx_coroutines_core()) {
                    break;
                }
                if (AbstractResolvableFuture$SafeAtomicHelper$$ExternalSyntheticBackportWithForwarding0.m(head$FU, this, segment3, segmentM2108getSegmentimpl)) {
                    if (segment3.decPointers$kotlinx_coroutines_core()) {
                        segment3.remove();
                    }
                } else if (segmentM2108getSegmentimpl.decPointers$kotlinx_coroutines_core()) {
                    segmentM2108getSegmentimpl.remove();
                }
            }
        }
        SemaphoreSegment semaphoreSegment = (SemaphoreSegment) SegmentOrClosed.m2108getSegmentimpl(objM2105constructorimpl);
        semaphoreSegment.cleanPrev();
        if (semaphoreSegment.getId() > j) {
            return false;
        }
        int i = (int) (andIncrement % SemaphoreKt.SEGMENT_SIZE);
        Object andSet = semaphoreSegment.acquirers.getAndSet(i, SemaphoreKt.PERMIT);
        if (andSet == null) {
            int i2 = SemaphoreKt.MAX_SPIN_CYCLES;
            for (int i3 = 0; i3 < i2; i3++) {
                if (semaphoreSegment.acquirers.get(i) == SemaphoreKt.TAKEN) {
                    return true;
                }
            }
            return !Striped$SmallLazyStriped$$ExternalSyntheticBackportWithForwarding0.m(semaphoreSegment.acquirers, i, SemaphoreKt.PERMIT, SemaphoreKt.BROKEN);
        }
        if (andSet == SemaphoreKt.CANCELLED) {
            return false;
        }
        return tryResumeAcquire((CancellableContinuation) andSet);
    }

    private final boolean tryResumeAcquire(CancellableContinuation<? super Unit> cancellableContinuation) {
        Object objTryResume = cancellableContinuation.tryResume(Unit.INSTANCE, null, this.onCancellationRelease);
        if (objTryResume == null) {
            return false;
        }
        cancellableContinuation.completeResume(objTryResume);
        return true;
    }

    @Override // kotlinx.coroutines.sync.Semaphore
    public boolean tryAcquire() {
        int i;
        do {
            i = this._availablePermits;
            if (i <= 0) {
                return false;
            }
        } while (!_availablePermits$FU.compareAndSet(this, i, i - 1));
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object acquireSlowPath(Continuation<? super Unit> continuation) {
        CancellableContinuationImpl orCreateCancellableContinuation = CancellableContinuationKt.getOrCreateCancellableContinuation(IntrinsicsKt.intercepted(continuation));
        CancellableContinuationImpl cancellableContinuationImpl = orCreateCancellableContinuation;
        while (true) {
            if (addAcquireToQueue(cancellableContinuationImpl)) {
                break;
            }
            if (_availablePermits$FU.getAndDecrement(this) > 0) {
                cancellableContinuationImpl.resume(Unit.INSTANCE, this.onCancellationRelease);
                break;
            }
        }
        Object result = orCreateCancellableContinuation.getResult();
        if (result == IntrinsicsKt.getCOROUTINE_SUSPENDED()) {
            DebugProbesKt.probeCoroutineSuspended(continuation);
        }
        return result == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? result : Unit.INSTANCE;
    }

    @Override // kotlinx.coroutines.sync.Semaphore
    public void release() {
        while (true) {
            int i = this._availablePermits;
            if (i >= this.permits) {
                throw new IllegalStateException(("The number of released permits cannot be greater than " + this.permits).toString());
            }
            if (_availablePermits$FU.compareAndSet(this, i, i + 1) && (i >= 0 || tryResumeNextFromQueue())) {
                return;
            }
        }
    }
}
