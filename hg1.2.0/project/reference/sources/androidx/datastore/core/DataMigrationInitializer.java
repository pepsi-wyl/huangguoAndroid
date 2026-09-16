package androidx.datastore.core;

import androidx.exifinterface.media.ExifInterface;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: DataMigrationInitializer.kt */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0000\u0018\u0000 \u0004*\u0004\b\u0000\u0010\u00012\u00020\u0002:\u0001\u0004B\u0005¢\u0006\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Landroidx/datastore/core/DataMigrationInitializer;", ExifInterface.GPS_DIRECTION_TRUE, "", "()V", "Companion", "datastore-core"}, k = 1, mv = {1, 5, 1}, xi = 48)
/* loaded from: classes.dex */
public final class DataMigrationInitializer<T> {

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);

    /* compiled from: DataMigrationInitializer.kt */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002JY\u0010\u0003\u001a3\b\u0001\u0012\u0019\u0012\u0017\u0012\u0004\u0012\u0002H\u00060\u0005¢\u0006\f\b\u0007\u0012\b\b\b\u0012\u0004\b\b(\t\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000b0\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0004\"\u0004\b\u0001\u0010\u00062\u0012\u0010\f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00060\u000e0\rø\u0001\u0000¢\u0006\u0002\u0010\u000fJ9\u0010\u0010\u001a\u00020\u000b\"\u0004\b\u0001\u0010\u00062\u0012\u0010\f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00060\u000e0\r2\f\u0010\t\u001a\b\u0012\u0004\u0012\u0002H\u00060\u0005H\u0082@ø\u0001\u0000¢\u0006\u0002\u0010\u0011\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006\u0012"}, d2 = {"Landroidx/datastore/core/DataMigrationInitializer$Companion;", "", "()V", "getInitializer", "Lkotlin/Function2;", "Landroidx/datastore/core/InitializerApi;", ExifInterface.GPS_DIRECTION_TRUE, "Lkotlin/ParameterName;", "name", "api", "Lkotlin/coroutines/Continuation;", "", "migrations", "", "Landroidx/datastore/core/DataMigration;", "(Ljava/util/List;)Lkotlin/jvm/functions/Function2;", "runMigrations", "(Ljava/util/List;Landroidx/datastore/core/InitializerApi;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "datastore-core"}, k = 1, mv = {1, 5, 1}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final <T> Function2<InitializerApi<T>, Continuation<? super Unit>, Object> getInitializer(List<? extends DataMigration<T>> migrations) {
            Intrinsics.checkNotNullParameter(migrations, "migrations");
            return new DataMigrationInitializer$Companion$getInitializer$1(migrations, null);
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX WARN: Removed duplicated region for block: B:27:0x0076  */
        /* JADX WARN: Removed duplicated region for block: B:37:0x00a3  */
        /* JADX WARN: Removed duplicated region for block: B:39:0x00a6  */
        /* JADX WARN: Removed duplicated region for block: B:7:0x0014  */
        /* JADX WARN: Type inference failed for: r9v4, types: [T, java.lang.Throwable] */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x008d -> B:25:0x0070). Please report as a decompilation issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x0090 -> B:25:0x0070). Please report as a decompilation issue!!! */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final <T> java.lang.Object runMigrations(java.util.List<? extends androidx.datastore.core.DataMigration<T>> r7, androidx.datastore.core.InitializerApi<T> r8, kotlin.coroutines.Continuation<? super kotlin.Unit> r9) throws java.lang.Throwable {
            /*
                r6 = this;
                boolean r0 = r9 instanceof androidx.datastore.core.DataMigrationInitializer$Companion$runMigrations$1
                if (r0 == 0) goto L14
                r0 = r9
                androidx.datastore.core.DataMigrationInitializer$Companion$runMigrations$1 r0 = (androidx.datastore.core.DataMigrationInitializer$Companion$runMigrations$1) r0
                int r1 = r0.label
                r2 = -2147483648(0xffffffff80000000, float:-0.0)
                r1 = r1 & r2
                if (r1 == 0) goto L14
                int r9 = r0.label
                int r9 = r9 - r2
                r0.label = r9
                goto L19
            L14:
                androidx.datastore.core.DataMigrationInitializer$Companion$runMigrations$1 r0 = new androidx.datastore.core.DataMigrationInitializer$Companion$runMigrations$1
                r0.<init>(r6, r9)
            L19:
                java.lang.Object r9 = r0.result
                java.lang.Object r1 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
                int r2 = r0.label
                r3 = 2
                r4 = 1
                if (r2 == 0) goto L47
                if (r2 == r4) goto L3f
                if (r2 != r3) goto L37
                java.lang.Object r7 = r0.L$1
                java.util.Iterator r7 = (java.util.Iterator) r7
                java.lang.Object r8 = r0.L$0
                kotlin.jvm.internal.Ref$ObjectRef r8 = (kotlin.jvm.internal.Ref.ObjectRef) r8
                kotlin.ResultKt.throwOnFailure(r9)     // Catch: java.lang.Throwable -> L35
                goto L70
            L35:
                r9 = move-exception
                goto L89
            L37:
                java.lang.IllegalStateException r7 = new java.lang.IllegalStateException
                java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
                r7.<init>(r8)
                throw r7
            L3f:
                java.lang.Object r7 = r0.L$0
                java.util.List r7 = (java.util.List) r7
                kotlin.ResultKt.throwOnFailure(r9)
                goto L65
            L47:
                kotlin.ResultKt.throwOnFailure(r9)
                java.util.ArrayList r9 = new java.util.ArrayList
                r9.<init>()
                java.util.List r9 = (java.util.List) r9
                androidx.datastore.core.DataMigrationInitializer$Companion$runMigrations$2 r2 = new androidx.datastore.core.DataMigrationInitializer$Companion$runMigrations$2
                r5 = 0
                r2.<init>(r7, r9, r5)
                kotlin.jvm.functions.Function2 r2 = (kotlin.jvm.functions.Function2) r2
                r0.L$0 = r9
                r0.label = r4
                java.lang.Object r7 = r8.updateData(r2, r0)
                if (r7 != r1) goto L64
                return r1
            L64:
                r7 = r9
            L65:
                kotlin.jvm.internal.Ref$ObjectRef r8 = new kotlin.jvm.internal.Ref$ObjectRef
                r8.<init>()
                java.lang.Iterable r7 = (java.lang.Iterable) r7
                java.util.Iterator r7 = r7.iterator()
            L70:
                boolean r9 = r7.hasNext()
                if (r9 == 0) goto L9d
                java.lang.Object r9 = r7.next()
                kotlin.jvm.functions.Function1 r9 = (kotlin.jvm.functions.Function1) r9
                r0.L$0 = r8     // Catch: java.lang.Throwable -> L35
                r0.L$1 = r7     // Catch: java.lang.Throwable -> L35
                r0.label = r3     // Catch: java.lang.Throwable -> L35
                java.lang.Object r9 = r9.invoke(r0)     // Catch: java.lang.Throwable -> L35
                if (r9 != r1) goto L70
                return r1
            L89:
                T r2 = r8.element
                if (r2 != 0) goto L90
                r8.element = r9
                goto L70
            L90:
                T r2 = r8.element
                kotlin.jvm.internal.Intrinsics.checkNotNull(r2)
                T r2 = r8.element
                java.lang.Throwable r2 = (java.lang.Throwable) r2
                kotlin.ExceptionsKt.addSuppressed(r2, r9)
                goto L70
            L9d:
                T r7 = r8.element
                java.lang.Throwable r7 = (java.lang.Throwable) r7
                if (r7 != 0) goto La6
                kotlin.Unit r7 = kotlin.Unit.INSTANCE
                return r7
            La6:
                throw r7
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.datastore.core.DataMigrationInitializer.Companion.runMigrations(java.util.List, androidx.datastore.core.InitializerApi, kotlin.coroutines.Continuation):java.lang.Object");
        }
    }
}
