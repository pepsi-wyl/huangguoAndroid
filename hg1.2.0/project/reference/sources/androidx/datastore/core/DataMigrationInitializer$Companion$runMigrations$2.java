package androidx.datastore.core;

import androidx.core.view.MotionEventCompat;
import androidx.exifinterface.media.ExifInterface;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* JADX INFO: Add missing generic type declarations: [T] */
/* compiled from: DataMigrationInitializer.kt */
@Metadata(d1 = {"\u0000\u0004\n\u0002\b\u0003\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u0001\"\u0004\b\u0001\u0010\u00012\u0006\u0010\u0002\u001a\u0002H\u0001H\u008a@"}, d2 = {"<anonymous>", ExifInterface.GPS_DIRECTION_TRUE, "startingData"}, k = 3, mv = {1, 5, 1}, xi = 48)
@DebugMetadata(c = "androidx.datastore.core.DataMigrationInitializer$Companion$runMigrations$2", f = "DataMigrationInitializer.kt", i = {0, 0}, l = {44, MotionEventCompat.AXIS_GENERIC_15}, m = "invokeSuspend", n = {"migration", "data"}, s = {"L$2", "L$3"})
/* loaded from: classes.dex */
final class DataMigrationInitializer$Companion$runMigrations$2<T> extends SuspendLambda implements Function2<T, Continuation<? super T>, Object> {
    final /* synthetic */ List<Function1<Continuation<? super Unit>, Object>> $cleanUps;
    final /* synthetic */ List<DataMigration<T>> $migrations;
    /* synthetic */ Object L$0;
    Object L$1;
    Object L$2;
    Object L$3;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    DataMigrationInitializer$Companion$runMigrations$2(List<? extends DataMigration<T>> list, List<Function1<Continuation<? super Unit>, Object>> list2, Continuation<? super DataMigrationInitializer$Companion$runMigrations$2> continuation) {
        super(2, continuation);
        this.$migrations = list;
        this.$cleanUps = list2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        DataMigrationInitializer$Companion$runMigrations$2 dataMigrationInitializer$Companion$runMigrations$2 = new DataMigrationInitializer$Companion$runMigrations$2(this.$migrations, this.$cleanUps, continuation);
        dataMigrationInitializer$Companion$runMigrations$2.L$0 = obj;
        return dataMigrationInitializer$Companion$runMigrations$2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        return invoke((DataMigrationInitializer$Companion$runMigrations$2<T>) obj, (Continuation<? super DataMigrationInitializer$Companion$runMigrations$2<T>>) obj2);
    }

    public final Object invoke(T t, Continuation<? super T> continuation) {
        return ((DataMigrationInitializer$Companion$runMigrations$2) create(t, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x008e A[RETURN] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r10) throws java.lang.Throwable {
        /*
            r9 = this;
            java.lang.Object r0 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r1 = r9.label
            r2 = 2
            r3 = 1
            if (r1 == 0) goto L37
            if (r1 == r3) goto L22
            if (r1 != r2) goto L1a
            java.lang.Object r1 = r9.L$1
            java.util.Iterator r1 = (java.util.Iterator) r1
            java.lang.Object r4 = r9.L$0
            java.util.List r4 = (java.util.List) r4
            kotlin.ResultKt.throwOnFailure(r10)
            goto L46
        L1a:
            java.lang.IllegalStateException r10 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r10.<init>(r0)
            throw r10
        L22:
            java.lang.Object r1 = r9.L$3
            java.lang.Object r4 = r9.L$2
            androidx.datastore.core.DataMigration r4 = (androidx.datastore.core.DataMigration) r4
            java.lang.Object r5 = r9.L$1
            java.util.Iterator r5 = (java.util.Iterator) r5
            java.lang.Object r6 = r9.L$0
            java.util.List r6 = (java.util.List) r6
            kotlin.ResultKt.throwOnFailure(r10)
            r8 = r6
            r6 = r4
            r4 = r8
            goto L68
        L37:
            kotlin.ResultKt.throwOnFailure(r10)
            java.lang.Object r10 = r9.L$0
            java.util.List<androidx.datastore.core.DataMigration<T>> r1 = r9.$migrations
            java.lang.Iterable r1 = (java.lang.Iterable) r1
            java.util.List<kotlin.jvm.functions.Function1<kotlin.coroutines.Continuation<? super kotlin.Unit>, java.lang.Object>> r4 = r9.$cleanUps
            java.util.Iterator r1 = r1.iterator()
        L46:
            boolean r5 = r1.hasNext()
            if (r5 == 0) goto L8e
            java.lang.Object r5 = r1.next()
            androidx.datastore.core.DataMigration r5 = (androidx.datastore.core.DataMigration) r5
            r9.L$0 = r4
            r9.L$1 = r1
            r9.L$2 = r5
            r9.L$3 = r10
            r9.label = r3
            java.lang.Object r6 = r5.shouldMigrate(r10, r9)
            if (r6 != r0) goto L63
            return r0
        L63:
            r8 = r1
            r1 = r10
            r10 = r6
            r6 = r5
            r5 = r8
        L68:
            java.lang.Boolean r10 = (java.lang.Boolean) r10
            boolean r10 = r10.booleanValue()
            if (r10 == 0) goto L8c
            androidx.datastore.core.DataMigrationInitializer$Companion$runMigrations$2$1$1 r10 = new androidx.datastore.core.DataMigrationInitializer$Companion$runMigrations$2$1$1
            r7 = 0
            r10.<init>(r6, r7)
            r4.add(r10)
            r9.L$0 = r4
            r9.L$1 = r5
            r9.L$2 = r7
            r9.L$3 = r7
            r9.label = r2
            java.lang.Object r10 = r6.migrate(r1, r9)
            if (r10 != r0) goto L8a
            return r0
        L8a:
            r1 = r5
            goto L46
        L8c:
            r10 = r1
            goto L8a
        L8e:
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.core.DataMigrationInitializer$Companion$runMigrations$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
