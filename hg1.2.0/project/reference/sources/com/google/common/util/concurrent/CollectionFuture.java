package com.google.common.util.concurrent;

import com.google.common.collect.ImmutableCollection;
import com.google.common.collect.Lists;
import com.google.common.util.concurrent.AggregateFuture;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
abstract class CollectionFuture<V, C> extends AggregateFuture<V, C> {

    @CheckForNull
    private List<Present<V>> values;

    abstract C combine(List<Present<V>> values);

    CollectionFuture(ImmutableCollection<? extends ListenableFuture<? extends V>> futures, boolean allMustSucceed) {
        List<Present<V>> listNewArrayListWithCapacity;
        super(futures, allMustSucceed, true);
        if (futures.isEmpty()) {
            listNewArrayListWithCapacity = Collections.emptyList();
        } else {
            listNewArrayListWithCapacity = Lists.newArrayListWithCapacity(futures.size());
        }
        for (int i = 0; i < futures.size(); i++) {
            listNewArrayListWithCapacity.add(null);
        }
        this.values = listNewArrayListWithCapacity;
    }

    @Override // com.google.common.util.concurrent.AggregateFuture
    final void collectOneValue(int index, @ParametricNullness V returnValue) {
        List<Present<V>> list = this.values;
        if (list != null) {
            list.set(index, new Present<>(returnValue));
        }
    }

    @Override // com.google.common.util.concurrent.AggregateFuture
    final void handleAllCompleted() {
        List<Present<V>> list = this.values;
        if (list != null) {
            set(combine(list));
        }
    }

    @Override // com.google.common.util.concurrent.AggregateFuture
    void releaseResources(AggregateFuture.ReleaseResourcesReason reason) {
        super.releaseResources(reason);
        this.values = null;
    }

    static final class ListFuture<V> extends CollectionFuture<V, List<V>> {
        ListFuture(ImmutableCollection<? extends ListenableFuture<? extends V>> futures, boolean allMustSucceed) {
            super(futures, allMustSucceed);
            init();
        }

        @Override // com.google.common.util.concurrent.CollectionFuture
        public List<V> combine(List<Present<V>> values) {
            ArrayList arrayListNewArrayListWithCapacity = Lists.newArrayListWithCapacity(values.size());
            Iterator<Present<V>> it = values.iterator();
            while (it.hasNext()) {
                Present<V> next = it.next();
                arrayListNewArrayListWithCapacity.add(next != null ? next.value : null);
            }
            return Collections.unmodifiableList(arrayListNewArrayListWithCapacity);
        }
    }

    private static final class Present<V> {

        @ParametricNullness
        final V value;

        Present(@ParametricNullness V value) {
            this.value = value;
        }
    }
}
