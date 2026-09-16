package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.collect.Table;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
abstract class RegularImmutableTable<R, C, V> extends ImmutableTable<R, C, V> {
    abstract Table.Cell<R, C, V> getCell(int iterationIndex);

    abstract V getValue(int iterationIndex);

    @Override // com.google.common.collect.ImmutableTable
    abstract Object writeReplace();

    RegularImmutableTable() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.google.common.collect.ImmutableTable, com.google.common.collect.AbstractTable
    public final ImmutableSet<Table.Cell<R, C, V>> createCellSet() {
        return isEmpty() ? ImmutableSet.of() : new CellSet();
    }

    private final class CellSet extends IndexedImmutableSet<Table.Cell<R, C, V>> {
        @Override // com.google.common.collect.ImmutableCollection
        boolean isPartialView() {
            return false;
        }

        private CellSet() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return RegularImmutableTable.this.size();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.collect.IndexedImmutableSet
        public Table.Cell<R, C, V> get(int index) {
            return RegularImmutableTable.this.getCell(index);
        }

        @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(@CheckForNull Object object) {
            if (!(object instanceof Table.Cell)) {
                return false;
            }
            Table.Cell cell = (Table.Cell) object;
            Object obj = RegularImmutableTable.this.get(cell.getRowKey(), cell.getColumnKey());
            return obj != null && obj.equals(cell.getValue());
        }

        @Override // com.google.common.collect.IndexedImmutableSet, com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection
        Object writeReplace() {
            return super.writeReplace();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.google.common.collect.ImmutableTable, com.google.common.collect.AbstractTable
    public final ImmutableCollection<V> createValues() {
        return isEmpty() ? ImmutableList.of() : new Values();
    }

    private final class Values extends ImmutableList<V> {
        @Override // com.google.common.collect.ImmutableCollection
        boolean isPartialView() {
            return true;
        }

        private Values() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return RegularImmutableTable.this.size();
        }

        @Override // java.util.List
        public V get(int i) {
            return (V) RegularImmutableTable.this.getValue(i);
        }

        @Override // com.google.common.collect.ImmutableList, com.google.common.collect.ImmutableCollection
        Object writeReplace() {
            return super.writeReplace();
        }
    }

    static <R, C, V> RegularImmutableTable<R, C, V> forCells(List<Table.Cell<R, C, V>> cells, @CheckForNull final Comparator<? super R> rowComparator, @CheckForNull final Comparator<? super C> columnComparator) {
        Preconditions.checkNotNull(cells);
        if (rowComparator != null || columnComparator != null) {
            Collections.sort(cells, new Comparator() { // from class: com.google.common.collect.RegularImmutableTable$$ExternalSyntheticLambda0
                @Override // java.util.Comparator
                public final int compare(Object obj, Object obj2) {
                    return RegularImmutableTable.lambda$forCells$0(rowComparator, columnComparator, (Table.Cell) obj, (Table.Cell) obj2);
                }
            });
        }
        return forCellsInternal(cells, rowComparator, columnComparator);
    }

    static /* synthetic */ int lambda$forCells$0(Comparator comparator, Comparator comparator2, Table.Cell cell, Table.Cell cell2) {
        int iCompare = comparator == null ? 0 : comparator.compare(cell.getRowKey(), cell2.getRowKey());
        if (iCompare != 0) {
            return iCompare;
        }
        if (comparator2 == null) {
            return 0;
        }
        return comparator2.compare(cell.getColumnKey(), cell2.getColumnKey());
    }

    static <R, C, V> RegularImmutableTable<R, C, V> forCells(Iterable<Table.Cell<R, C, V>> cells) {
        return forCellsInternal(cells, null, null);
    }

    private static <R, C, V> RegularImmutableTable<R, C, V> forCellsInternal(Iterable<Table.Cell<R, C, V>> cells, @CheckForNull Comparator<? super R> rowComparator, @CheckForNull Comparator<? super C> columnComparator) {
        ImmutableSet immutableSetCopyOf;
        ImmutableSet immutableSetCopyOf2;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        LinkedHashSet linkedHashSet2 = new LinkedHashSet();
        ImmutableList immutableListCopyOf = ImmutableList.copyOf(cells);
        for (Table.Cell<R, C, V> cell : cells) {
            linkedHashSet.add(cell.getRowKey());
            linkedHashSet2.add(cell.getColumnKey());
        }
        if (rowComparator == null) {
            immutableSetCopyOf = ImmutableSet.copyOf((Collection) linkedHashSet);
        } else {
            immutableSetCopyOf = ImmutableSet.copyOf((Collection) ImmutableList.sortedCopyOf(rowComparator, linkedHashSet));
        }
        if (columnComparator == null) {
            immutableSetCopyOf2 = ImmutableSet.copyOf((Collection) linkedHashSet2);
        } else {
            immutableSetCopyOf2 = ImmutableSet.copyOf((Collection) ImmutableList.sortedCopyOf(columnComparator, linkedHashSet2));
        }
        return forOrderedComponents(immutableListCopyOf, immutableSetCopyOf, immutableSetCopyOf2);
    }

    static <R, C, V> RegularImmutableTable<R, C, V> forOrderedComponents(ImmutableList<Table.Cell<R, C, V>> cellList, ImmutableSet<R> rowSpace, ImmutableSet<C> columnSpace) {
        if (cellList.size() > (rowSpace.size() * columnSpace.size()) / 2) {
            return new DenseImmutableTable(cellList, rowSpace, columnSpace);
        }
        return new SparseImmutableTable(cellList, rowSpace, columnSpace);
    }

    final void checkNoDuplicate(R rowKey, C columnKey, @CheckForNull V existingValue, V newValue) {
        Preconditions.checkArgument(existingValue == null, "Duplicate key: (row=%s, column=%s), values: [%s, %s].", rowKey, columnKey, newValue, existingValue);
    }
}
