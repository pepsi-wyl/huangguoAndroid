package com.google.common.collect;

import androidx.exifinterface.media.ExifInterface;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableTable;
import com.google.common.collect.Table;
import com.google.errorprone.annotations.Immutable;
import java.lang.reflect.Array;
import java.util.Map;
import java.util.Objects;
import javax.annotation.CheckForNull;

@Immutable(containerOf = {"R", "C", ExifInterface.GPS_MEASUREMENT_INTERRUPTED})
@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class DenseImmutableTable<R, C, V> extends RegularImmutableTable<R, C, V> {
    private final int[] cellColumnIndices;
    private final int[] cellRowIndices;
    private final int[] columnCounts;
    private final ImmutableMap<C, Integer> columnKeyToIndex;
    private final ImmutableMap<C, ImmutableMap<R, V>> columnMap;
    private final int[] rowCounts;
    private final ImmutableMap<R, Integer> rowKeyToIndex;
    private final ImmutableMap<R, ImmutableMap<C, V>> rowMap;
    private final V[][] values;

    DenseImmutableTable(ImmutableList<Table.Cell<R, C, V>> immutableList, ImmutableSet<R> immutableSet, ImmutableSet<C> immutableSet2) {
        this.values = (V[][]) ((Object[][]) Array.newInstance((Class<?>) Object.class, immutableSet.size(), immutableSet2.size()));
        ImmutableMap<R, Integer> immutableMapIndexMap = Maps.indexMap(immutableSet);
        this.rowKeyToIndex = immutableMapIndexMap;
        ImmutableMap<C, Integer> immutableMapIndexMap2 = Maps.indexMap(immutableSet2);
        this.columnKeyToIndex = immutableMapIndexMap2;
        this.rowCounts = new int[immutableMapIndexMap.size()];
        this.columnCounts = new int[immutableMapIndexMap2.size()];
        int[] iArr = new int[immutableList.size()];
        int[] iArr2 = new int[immutableList.size()];
        for (int i = 0; i < immutableList.size(); i++) {
            Table.Cell<R, C, V> cell = immutableList.get(i);
            R rowKey = cell.getRowKey();
            C columnKey = cell.getColumnKey();
            int iIntValue = ((Integer) Objects.requireNonNull(this.rowKeyToIndex.get(rowKey))).intValue();
            int iIntValue2 = ((Integer) Objects.requireNonNull(this.columnKeyToIndex.get(columnKey))).intValue();
            checkNoDuplicate(rowKey, columnKey, this.values[iIntValue][iIntValue2], cell.getValue());
            this.values[iIntValue][iIntValue2] = cell.getValue();
            int[] iArr3 = this.rowCounts;
            iArr3[iIntValue] = iArr3[iIntValue] + 1;
            int[] iArr4 = this.columnCounts;
            iArr4[iIntValue2] = iArr4[iIntValue2] + 1;
            iArr[i] = iIntValue;
            iArr2[i] = iIntValue2;
        }
        this.cellRowIndices = iArr;
        this.cellColumnIndices = iArr2;
        this.rowMap = new RowMap();
        this.columnMap = new ColumnMap();
    }

    private static abstract class ImmutableArrayMap<K, V> extends ImmutableMap.IteratorBasedImmutableMap<K, V> {
        private final int size;

        @CheckForNull
        abstract V getValue(int keyIndex);

        abstract ImmutableMap<K, Integer> keyToIndex();

        ImmutableArrayMap(int size) {
            this.size = size;
        }

        private boolean isFull() {
            return this.size == keyToIndex().size();
        }

        K getKey(int index) {
            return keyToIndex().keySet().asList().get(index);
        }

        @Override // com.google.common.collect.ImmutableMap.IteratorBasedImmutableMap, com.google.common.collect.ImmutableMap
        ImmutableSet<K> createKeySet() {
            return isFull() ? keyToIndex().keySet() : super.createKeySet();
        }

        @Override // java.util.Map
        public int size() {
            return this.size;
        }

        @Override // com.google.common.collect.ImmutableMap, java.util.Map
        @CheckForNull
        public V get(@CheckForNull Object key) {
            Integer num = keyToIndex().get(key);
            if (num == null) {
                return null;
            }
            return getValue(num.intValue());
        }

        @Override // com.google.common.collect.ImmutableMap.IteratorBasedImmutableMap
        UnmodifiableIterator<Map.Entry<K, V>> entryIterator() {
            return new AbstractIterator<Map.Entry<K, V>>() { // from class: com.google.common.collect.DenseImmutableTable.ImmutableArrayMap.1
                private int index = -1;
                private final int maxIndex;

                {
                    this.maxIndex = ImmutableArrayMap.this.keyToIndex().size();
                }

                /* JADX INFO: Access modifiers changed from: protected */
                @Override // com.google.common.collect.AbstractIterator
                @CheckForNull
                public Map.Entry<K, V> computeNext() {
                    int i = this.index;
                    while (true) {
                        this.index = i + 1;
                        int i2 = this.index;
                        if (i2 < this.maxIndex) {
                            Object value = ImmutableArrayMap.this.getValue(i2);
                            if (value == null) {
                                i = this.index;
                            } else {
                                return Maps.immutableEntry(ImmutableArrayMap.this.getKey(this.index), value);
                            }
                        } else {
                            return endOfData();
                        }
                    }
                }
            };
        }

        @Override // com.google.common.collect.ImmutableMap.IteratorBasedImmutableMap, com.google.common.collect.ImmutableMap
        Object writeReplace() {
            return super.writeReplace();
        }
    }

    private final class Row extends ImmutableArrayMap<C, V> {
        private final int rowIndex;

        @Override // com.google.common.collect.ImmutableMap
        boolean isPartialView() {
            return true;
        }

        Row(int rowIndex) {
            super(DenseImmutableTable.this.rowCounts[rowIndex]);
            this.rowIndex = rowIndex;
        }

        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap
        ImmutableMap<C, Integer> keyToIndex() {
            return DenseImmutableTable.this.columnKeyToIndex;
        }

        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap
        @CheckForNull
        V getValue(int i) {
            return (V) DenseImmutableTable.this.values[this.rowIndex][i];
        }

        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap, com.google.common.collect.ImmutableMap.IteratorBasedImmutableMap, com.google.common.collect.ImmutableMap
        Object writeReplace() {
            return super.writeReplace();
        }
    }

    private final class Column extends ImmutableArrayMap<R, V> {
        private final int columnIndex;

        @Override // com.google.common.collect.ImmutableMap
        boolean isPartialView() {
            return true;
        }

        Column(int columnIndex) {
            super(DenseImmutableTable.this.columnCounts[columnIndex]);
            this.columnIndex = columnIndex;
        }

        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap
        ImmutableMap<R, Integer> keyToIndex() {
            return DenseImmutableTable.this.rowKeyToIndex;
        }

        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap
        @CheckForNull
        V getValue(int i) {
            return (V) DenseImmutableTable.this.values[i][this.columnIndex];
        }

        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap, com.google.common.collect.ImmutableMap.IteratorBasedImmutableMap, com.google.common.collect.ImmutableMap
        Object writeReplace() {
            return super.writeReplace();
        }
    }

    private final class RowMap extends ImmutableArrayMap<R, ImmutableMap<C, V>> {
        @Override // com.google.common.collect.ImmutableMap
        boolean isPartialView() {
            return false;
        }

        private RowMap() {
            super(DenseImmutableTable.this.rowCounts.length);
        }

        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap
        ImmutableMap<R, Integer> keyToIndex() {
            return DenseImmutableTable.this.rowKeyToIndex;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap
        public ImmutableMap<C, V> getValue(int keyIndex) {
            return new Row(keyIndex);
        }

        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap, com.google.common.collect.ImmutableMap.IteratorBasedImmutableMap, com.google.common.collect.ImmutableMap
        Object writeReplace() {
            return super.writeReplace();
        }
    }

    private final class ColumnMap extends ImmutableArrayMap<C, ImmutableMap<R, V>> {
        @Override // com.google.common.collect.ImmutableMap
        boolean isPartialView() {
            return false;
        }

        private ColumnMap() {
            super(DenseImmutableTable.this.columnCounts.length);
        }

        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap
        ImmutableMap<C, Integer> keyToIndex() {
            return DenseImmutableTable.this.columnKeyToIndex;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap
        public ImmutableMap<R, V> getValue(int keyIndex) {
            return new Column(keyIndex);
        }

        @Override // com.google.common.collect.DenseImmutableTable.ImmutableArrayMap, com.google.common.collect.ImmutableMap.IteratorBasedImmutableMap, com.google.common.collect.ImmutableMap
        Object writeReplace() {
            return super.writeReplace();
        }
    }

    @Override // com.google.common.collect.ImmutableTable, com.google.common.collect.Table
    public ImmutableMap<C, Map<R, V>> columnMap() {
        return ImmutableMap.copyOf((Map) this.columnMap);
    }

    @Override // com.google.common.collect.ImmutableTable, com.google.common.collect.Table
    public ImmutableMap<R, Map<C, V>> rowMap() {
        return ImmutableMap.copyOf((Map) this.rowMap);
    }

    @Override // com.google.common.collect.ImmutableTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    @CheckForNull
    public V get(@CheckForNull Object rowKey, @CheckForNull Object columnKey) {
        Integer num = this.rowKeyToIndex.get(rowKey);
        Integer num2 = this.columnKeyToIndex.get(columnKey);
        if (num == null || num2 == null) {
            return null;
        }
        return this.values[num.intValue()][num2.intValue()];
    }

    @Override // com.google.common.collect.Table
    public int size() {
        return this.cellRowIndices.length;
    }

    @Override // com.google.common.collect.RegularImmutableTable
    Table.Cell<R, C, V> getCell(int index) {
        int i = this.cellRowIndices[index];
        int i2 = this.cellColumnIndices[index];
        return cellOf(rowKeySet().asList().get(i), columnKeySet().asList().get(i2), Objects.requireNonNull(this.values[i][i2]));
    }

    @Override // com.google.common.collect.RegularImmutableTable
    V getValue(int i) {
        return (V) Objects.requireNonNull(this.values[this.cellRowIndices[i]][this.cellColumnIndices[i]]);
    }

    @Override // com.google.common.collect.RegularImmutableTable, com.google.common.collect.ImmutableTable
    Object writeReplace() {
        return ImmutableTable.SerializedForm.create(this, this.cellRowIndices, this.cellColumnIndices);
    }
}
