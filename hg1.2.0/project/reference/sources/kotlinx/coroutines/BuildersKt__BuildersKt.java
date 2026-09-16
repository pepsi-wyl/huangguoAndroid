package kotlinx.coroutines;

import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function2;

/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: Builders.kt */
@Metadata(d1 = {"\u0000\"\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001aT\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u00032'\u0010\u0004\u001a#\b\u0001\u0012\u0004\u0012\u00020\u0006\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00010\u0007\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005¢\u0006\u0002\b\tø\u0001\u0000\u0082\u0002\n\n\b\b\u0001\u0012\u0002\u0010\u0002 \u0001¢\u0006\u0002\u0010\n\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006\u000b"}, d2 = {"runBlocking", ExifInterface.GPS_DIRECTION_TRUE, "context", "Lkotlin/coroutines/CoroutineContext;", "block", "Lkotlin/Function2;", "Lkotlinx/coroutines/CoroutineScope;", "Lkotlin/coroutines/Continuation;", "", "Lkotlin/ExtensionFunctionType;", "(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;", "kotlinx-coroutines-core"}, k = 5, mv = {1, 6, 0}, xi = 48, xs = "kotlinx/coroutines/BuildersKt")
/* loaded from: classes2.dex */
public final /* synthetic */ class BuildersKt__BuildersKt {
    public static /* synthetic */ Object runBlocking$default(CoroutineContext coroutineContext, Function2 function2, int i, Object obj) throws InterruptedException {
        if ((i & 1) != 0) {
            coroutineContext = EmptyCoroutineContext.INSTANCE;
        }
        return BuildersKt.runBlocking(coroutineContext, function2);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x003d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final <T> T runBlocking(kotlin.coroutines.CoroutineContext r4, kotlin.jvm.functions.Function2<? super kotlinx.coroutines.CoroutineScope, ? super kotlin.coroutines.Continuation<? super T>, ? extends java.lang.Object> r5) throws java.lang.InterruptedException {
        /*
            java.lang.Thread r0 = java.lang.Thread.currentThread()
            kotlin.coroutines.ContinuationInterceptor$Key r1 = kotlin.coroutines.ContinuationInterceptor.INSTANCE
            kotlin.coroutines.CoroutineContext$Key r1 = (kotlin.coroutines.CoroutineContext.Key) r1
            kotlin.coroutines.CoroutineContext$Element r1 = r4.get(r1)
            kotlin.coroutines.ContinuationInterceptor r1 = (kotlin.coroutines.ContinuationInterceptor) r1
            if (r1 != 0) goto L26
            kotlinx.coroutines.ThreadLocalEventLoop r1 = kotlinx.coroutines.ThreadLocalEventLoop.INSTANCE
            kotlinx.coroutines.EventLoop r1 = r1.getEventLoop$kotlinx_coroutines_core()
            kotlinx.coroutines.GlobalScope r2 = kotlinx.coroutines.GlobalScope.INSTANCE
            kotlinx.coroutines.CoroutineScope r2 = (kotlinx.coroutines.CoroutineScope) r2
            r3 = r1
            kotlin.coroutines.CoroutineContext r3 = (kotlin.coroutines.CoroutineContext) r3
            kotlin.coroutines.CoroutineContext r4 = r4.plus(r3)
            kotlin.coroutines.CoroutineContext r4 = kotlinx.coroutines.CoroutineContextKt.newCoroutineContext(r2, r4)
            goto L4b
        L26:
            boolean r2 = r1 instanceof kotlinx.coroutines.EventLoop
            r3 = 0
            if (r2 == 0) goto L2e
            kotlinx.coroutines.EventLoop r1 = (kotlinx.coroutines.EventLoop) r1
            goto L2f
        L2e:
            r1 = r3
        L2f:
            if (r1 == 0) goto L3d
            boolean r2 = r1.shouldBeProcessedFromContext()
            if (r2 == 0) goto L38
            r3 = r1
        L38:
            if (r3 != 0) goto L3b
            goto L3d
        L3b:
            r1 = r3
            goto L43
        L3d:
            kotlinx.coroutines.ThreadLocalEventLoop r1 = kotlinx.coroutines.ThreadLocalEventLoop.INSTANCE
            kotlinx.coroutines.EventLoop r1 = r1.currentOrNull$kotlinx_coroutines_core()
        L43:
            kotlinx.coroutines.GlobalScope r2 = kotlinx.coroutines.GlobalScope.INSTANCE
            kotlinx.coroutines.CoroutineScope r2 = (kotlinx.coroutines.CoroutineScope) r2
            kotlin.coroutines.CoroutineContext r4 = kotlinx.coroutines.CoroutineContextKt.newCoroutineContext(r2, r4)
        L4b:
            kotlinx.coroutines.BlockingCoroutine r2 = new kotlinx.coroutines.BlockingCoroutine
            r2.<init>(r4, r0, r1)
            kotlinx.coroutines.CoroutineStart r4 = kotlinx.coroutines.CoroutineStart.DEFAULT
            r2.start(r4, r2, r5)
            java.lang.Object r4 = r2.joinBlocking()
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: kotlinx.coroutines.BuildersKt__BuildersKt.runBlocking(kotlin.coroutines.CoroutineContext, kotlin.jvm.functions.Function2):java.lang.Object");
    }
}
