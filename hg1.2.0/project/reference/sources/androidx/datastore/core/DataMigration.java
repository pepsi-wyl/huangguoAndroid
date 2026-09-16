package androidx.datastore.core;

import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;

/* compiled from: DataMigration.kt */
@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\bf\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002J\u0011\u0010\u0003\u001a\u00020\u0004H¦@ø\u0001\u0000¢\u0006\u0002\u0010\u0005J\u0019\u0010\u0006\u001a\u00028\u00002\u0006\u0010\u0007\u001a\u00028\u0000H¦@ø\u0001\u0000¢\u0006\u0002\u0010\bJ\u0019\u0010\t\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00028\u0000H¦@ø\u0001\u0000¢\u0006\u0002\u0010\b\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006\u000b"}, d2 = {"Landroidx/datastore/core/DataMigration;", ExifInterface.GPS_DIRECTION_TRUE, "", "cleanUp", "", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "migrate", "currentData", "(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "shouldMigrate", "", "datastore-core"}, k = 1, mv = {1, 5, 1}, xi = 48)
/* loaded from: classes.dex */
public interface DataMigration<T> {
    Object cleanUp(Continuation<? super Unit> continuation);

    Object migrate(T t, Continuation<? super T> continuation);

    Object shouldMigrate(T t, Continuation<? super Boolean> continuation);
}
