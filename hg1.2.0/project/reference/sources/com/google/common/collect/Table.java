package com.google.common.collect;

import com.google.errorprone.annotations.DoNotMock;
import java.util.Collection;
import java.util.Map;
import java.util.Set;
import javax.annotation.CheckForNull;

@DoNotMock("Use ImmutableTable, HashBasedTable, or another implementation")
@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface Table<R, C, V> {

    public interface Cell<R, C, V> {
        boolean equals(@CheckForNull Object obj);

        @ParametricNullness
        C getColumnKey();

        @ParametricNullness
        R getRowKey();

        @ParametricNullness
        V getValue();

        int hashCode();
    }

    Set<Cell<R, C, V>> cellSet();

    void clear();

    Map<R, V> column(@ParametricNullness C columnKey);

    Set<C> columnKeySet();

    Map<C, Map<R, V>> columnMap();

    boolean contains(@CheckForNull Object rowKey, @CheckForNull Object columnKey);

    boolean containsColumn(@CheckForNull Object columnKey);

    boolean containsRow(@CheckForNull Object rowKey);

    boolean containsValue(@CheckForNull Object value);

    boolean equals(@CheckForNull Object obj);

    @CheckForNull
    V get(@CheckForNull Object rowKey, @CheckForNull Object columnKey);

    int hashCode();

    boolean isEmpty();

    @CheckForNull
    V put(@ParametricNullness R rowKey, @ParametricNullness C columnKey, @ParametricNullness V value);

    void putAll(Table<? extends R, ? extends C, ? extends V> table);

    @CheckForNull
    V remove(@CheckForNull Object rowKey, @CheckForNull Object columnKey);

    Map<C, V> row(@ParametricNullness R rowKey);

    Set<R> rowKeySet();

    Map<R, Map<C, V>> rowMap();

    int size();

    Collection<V> values();
}
