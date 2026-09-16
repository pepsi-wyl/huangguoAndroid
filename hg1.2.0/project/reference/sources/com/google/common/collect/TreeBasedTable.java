package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import com.google.common.collect.Maps;
import java.io.Serializable;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public class TreeBasedTable<R, C, V> extends StandardRowSortedTable<R, C, V> {
    private static final long serialVersionUID = 0;
    private final Comparator<? super C> columnComparator;

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ Set cellSet() {
        return super.cellSet();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ void clear() {
        super.clear();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.common.collect.StandardTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ Map column(Object columnKey) {
        return super.column(columnKey);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ Set columnKeySet() {
        return super.columnKeySet();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ Map columnMap() {
        return super.columnMap();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ boolean contains(@CheckForNull Object rowKey, @CheckForNull Object columnKey) {
        return super.contains(rowKey, columnKey);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ boolean containsColumn(@CheckForNull Object columnKey) {
        return super.containsColumn(columnKey);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ boolean containsRow(@CheckForNull Object rowKey) {
        return super.containsRow(rowKey);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ boolean containsValue(@CheckForNull Object value) {
        return super.containsValue(value);
    }

    @Override // com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ boolean equals(@CheckForNull Object obj) {
        return super.equals(obj);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    @CheckForNull
    public /* bridge */ /* synthetic */ Object get(@CheckForNull Object rowKey, @CheckForNull Object columnKey) {
        return super.get(rowKey, columnKey);
    }

    @Override // com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ int hashCode() {
        return super.hashCode();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ boolean isEmpty() {
        return super.isEmpty();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    @CheckForNull
    public /* bridge */ /* synthetic */ Object put(Object rowKey, Object columnKey, Object value) {
        return super.put(rowKey, columnKey, value);
    }

    @Override // com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ void putAll(Table table) {
        super.putAll(table);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    @CheckForNull
    public /* bridge */ /* synthetic */ Object remove(@CheckForNull Object rowKey, @CheckForNull Object columnKey) {
        return super.remove(rowKey, columnKey);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.common.collect.StandardTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ Map row(Object rowKey) {
        return row((TreeBasedTable<R, C, V>) rowKey);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ int size() {
        return super.size();
    }

    @Override // com.google.common.collect.AbstractTable
    public /* bridge */ /* synthetic */ String toString() {
        return super.toString();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* synthetic */ Collection values() {
        return super.values();
    }

    private static class Factory<C, V> implements Supplier<TreeMap<C, V>>, Serializable {
        private static final long serialVersionUID = 0;
        final Comparator<? super C> comparator;

        Factory(Comparator<? super C> comparator) {
            this.comparator = comparator;
        }

        @Override // com.google.common.base.Supplier
        public TreeMap<C, V> get() {
            return new TreeMap<>(this.comparator);
        }
    }

    public static <R extends Comparable, C extends Comparable, V> TreeBasedTable<R, C, V> create() {
        return new TreeBasedTable<>(Ordering.natural(), Ordering.natural());
    }

    public static <R, C, V> TreeBasedTable<R, C, V> create(Comparator<? super R> rowComparator, Comparator<? super C> columnComparator) {
        Preconditions.checkNotNull(rowComparator);
        Preconditions.checkNotNull(columnComparator);
        return new TreeBasedTable<>(rowComparator, columnComparator);
    }

    public static <R, C, V> TreeBasedTable<R, C, V> create(TreeBasedTable<R, C, ? extends V> table) {
        TreeBasedTable<R, C, V> treeBasedTable = new TreeBasedTable<>(table.rowComparator(), table.columnComparator());
        treeBasedTable.putAll(table);
        return treeBasedTable;
    }

    TreeBasedTable(Comparator<? super R> rowComparator, Comparator<? super C> columnComparator) {
        super(new TreeMap(rowComparator), new Factory(columnComparator));
        this.columnComparator = columnComparator;
    }

    @Deprecated
    public Comparator<? super R> rowComparator() {
        return (Comparator) Objects.requireNonNull(rowKeySet().comparator());
    }

    @Deprecated
    public Comparator<? super C> columnComparator() {
        return this.columnComparator;
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.Table
    public SortedMap<C, V> row(R rowKey) {
        return new TreeRow(this, rowKey);
    }

    private class TreeRow extends StandardTable<R, C, V>.Row implements SortedMap<C, V> {

        @CheckForNull
        final C lowerBound;

        @CheckForNull
        final C upperBound;

        @CheckForNull
        transient SortedMap<C, V> wholeRow;

        TreeRow(final TreeBasedTable this$0, R rowKey) {
            this(rowKey, null, null);
        }

        TreeRow(R rowKey, @CheckForNull C lowerBound, @CheckForNull C upperBound) {
            super(rowKey);
            this.lowerBound = lowerBound;
            this.upperBound = upperBound;
            Preconditions.checkArgument(lowerBound == null || upperBound == null || compare(lowerBound, upperBound) <= 0);
        }

        @Override // java.util.AbstractMap, java.util.Map, java.util.SortedMap
        public SortedSet<C> keySet() {
            return new Maps.SortedKeySet(this);
        }

        @Override // java.util.SortedMap
        public Comparator<? super C> comparator() {
            return TreeBasedTable.this.columnComparator();
        }

        int compare(Object a, Object b) {
            return comparator().compare(a, b);
        }

        boolean rangeContains(@CheckForNull Object o) {
            C c;
            C c2;
            return o != null && ((c = this.lowerBound) == null || compare(c, o) <= 0) && ((c2 = this.upperBound) == null || compare(c2, o) > 0);
        }

        @Override // java.util.SortedMap
        public SortedMap<C, V> subMap(C fromKey, C toKey) {
            Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(fromKey)) && rangeContains(Preconditions.checkNotNull(toKey)));
            return new TreeRow(this.rowKey, fromKey, toKey);
        }

        @Override // java.util.SortedMap
        public SortedMap<C, V> headMap(C toKey) {
            Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(toKey)));
            return new TreeRow(this.rowKey, this.lowerBound, toKey);
        }

        @Override // java.util.SortedMap
        public SortedMap<C, V> tailMap(C fromKey) {
            Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(fromKey)));
            return new TreeRow(this.rowKey, fromKey, this.upperBound);
        }

        @Override // java.util.SortedMap
        public C firstKey() {
            updateBackingRowMapField();
            if (this.backingRowMap == null) {
                throw new NoSuchElementException();
            }
            return (C) ((SortedMap) this.backingRowMap).firstKey();
        }

        @Override // java.util.SortedMap
        public C lastKey() {
            updateBackingRowMapField();
            if (this.backingRowMap == null) {
                throw new NoSuchElementException();
            }
            return (C) ((SortedMap) this.backingRowMap).lastKey();
        }

        void updateWholeRowField() {
            SortedMap<C, V> sortedMap = this.wholeRow;
            if (sortedMap == null || (sortedMap.isEmpty() && TreeBasedTable.this.backingMap.containsKey(this.rowKey))) {
                this.wholeRow = (SortedMap) TreeBasedTable.this.backingMap.get(this.rowKey);
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.collect.StandardTable.Row
        @CheckForNull
        public SortedMap<C, V> computeBackingRowMap() {
            updateWholeRowField();
            SortedMap<C, V> sortedMapTailMap = this.wholeRow;
            if (sortedMapTailMap == null) {
                return null;
            }
            C c = this.lowerBound;
            if (c != null) {
                sortedMapTailMap = sortedMapTailMap.tailMap(c);
            }
            C c2 = this.upperBound;
            return c2 != null ? sortedMapTailMap.headMap(c2) : sortedMapTailMap;
        }

        @Override // com.google.common.collect.StandardTable.Row
        void maintainEmptyInvariant() {
            updateWholeRowField();
            SortedMap<C, V> sortedMap = this.wholeRow;
            if (sortedMap == null || !sortedMap.isEmpty()) {
                return;
            }
            TreeBasedTable.this.backingMap.remove(this.rowKey);
            this.wholeRow = null;
            this.backingRowMap = null;
        }

        @Override // com.google.common.collect.StandardTable.Row, java.util.AbstractMap, java.util.Map
        public boolean containsKey(@CheckForNull Object key) {
            return rangeContains(key) && super.containsKey(key);
        }

        @Override // com.google.common.collect.StandardTable.Row, java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V put(C c, V v) {
            Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(c)));
            return (V) super.put(c, v);
        }
    }

    @Override // com.google.common.collect.StandardRowSortedTable, com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public SortedSet<R> rowKeySet() {
        return super.rowKeySet();
    }

    @Override // com.google.common.collect.StandardRowSortedTable, com.google.common.collect.StandardTable, com.google.common.collect.Table
    public SortedMap<R, Map<C, V>> rowMap() {
        return super.rowMap();
    }

    @Override // com.google.common.collect.StandardTable
    Iterator<C> createColumnKeyIterator() {
        final Comparator<? super C> comparatorColumnComparator = columnComparator();
        final UnmodifiableIterator unmodifiableIteratorMergeSorted = Iterators.mergeSorted(Iterables.transform(this.backingMap.values(), new Function() { // from class: com.google.common.collect.TreeBasedTable$$ExternalSyntheticLambda0
            @Override // com.google.common.base.Function
            public final Object apply(Object obj) {
                return ((Map) obj).keySet().iterator();
            }
        }), comparatorColumnComparator);
        return new AbstractIterator<C>(this) { // from class: com.google.common.collect.TreeBasedTable.1

            @CheckForNull
            C lastValue;

            @Override // com.google.common.collect.AbstractIterator
            @CheckForNull
            protected C computeNext() {
                while (unmodifiableIteratorMergeSorted.hasNext()) {
                    C c = (C) unmodifiableIteratorMergeSorted.next();
                    C c2 = this.lastValue;
                    if (c2 == null || comparatorColumnComparator.compare(c, c2) != 0) {
                        this.lastValue = c;
                        return c;
                    }
                }
                this.lastValue = null;
                return endOfData();
            }
        };
    }
}
