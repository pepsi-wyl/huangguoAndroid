package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableTable;
import com.google.common.collect.Table;
import com.google.common.collect.TableCollectors;
import com.google.common.collect.Tables;
import java.util.ArrayList;
import java.util.List;
import java.util.function.BiConsumer;
import java.util.function.BinaryOperator;
import java.util.function.Function;
import java.util.function.Supplier;
import java.util.stream.Collector;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class TableCollectors {
    static <T, R, C, V> Collector<T, ?, ImmutableTable<R, C, V>> toImmutableTable(final Function<? super T, ? extends R> rowFunction, final Function<? super T, ? extends C> columnFunction, final Function<? super T, ? extends V> valueFunction) {
        Preconditions.checkNotNull(rowFunction, "rowFunction");
        Preconditions.checkNotNull(columnFunction, "columnFunction");
        Preconditions.checkNotNull(valueFunction, "valueFunction");
        return Collector.of(new Supplier() { // from class: com.google.common.collect.TableCollectors$$ExternalSyntheticLambda2
            @Override // java.util.function.Supplier
            public final Object get() {
                return new ImmutableTable.Builder();
            }
        }, new BiConsumer() { // from class: com.google.common.collect.TableCollectors$$ExternalSyntheticLambda3
            @Override // java.util.function.BiConsumer
            public final void accept(Object obj, Object obj2) {
                ((ImmutableTable.Builder) obj).put(rowFunction.apply(obj2), columnFunction.apply(obj2), valueFunction.apply(obj2));
            }
        }, new BinaryOperator() { // from class: com.google.common.collect.TableCollectors$$ExternalSyntheticLambda4
            @Override // java.util.function.BiFunction
            public final Object apply(Object obj, Object obj2) {
                return ((ImmutableTable.Builder) obj).combine((ImmutableTable.Builder) obj2);
            }
        }, new Function() { // from class: com.google.common.collect.TableCollectors$$ExternalSyntheticLambda5
            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return ((ImmutableTable.Builder) obj).build();
            }
        }, new Collector.Characteristics[0]);
    }

    static <T, R, C, V> Collector<T, ?, ImmutableTable<R, C, V>> toImmutableTable(final Function<? super T, ? extends R> rowFunction, final Function<? super T, ? extends C> columnFunction, final Function<? super T, ? extends V> valueFunction, final BinaryOperator<V> mergeFunction) {
        Preconditions.checkNotNull(rowFunction, "rowFunction");
        Preconditions.checkNotNull(columnFunction, "columnFunction");
        Preconditions.checkNotNull(valueFunction, "valueFunction");
        Preconditions.checkNotNull(mergeFunction, "mergeFunction");
        return Collector.of(new Supplier() { // from class: com.google.common.collect.TableCollectors$$ExternalSyntheticLambda9
            @Override // java.util.function.Supplier
            public final Object get() {
                return TableCollectors.lambda$toImmutableTable$1();
            }
        }, new BiConsumer() { // from class: com.google.common.collect.TableCollectors$$ExternalSyntheticLambda10
            @Override // java.util.function.BiConsumer
            public final void accept(Object obj, Object obj2) {
                TableCollectors.ImmutableTableCollectorState immutableTableCollectorState = (TableCollectors.ImmutableTableCollectorState) obj;
                immutableTableCollectorState.put(rowFunction.apply(obj2), columnFunction.apply(obj2), valueFunction.apply(obj2), mergeFunction);
            }
        }, new BinaryOperator() { // from class: com.google.common.collect.TableCollectors$$ExternalSyntheticLambda11
            @Override // java.util.function.BiFunction
            public final Object apply(Object obj, Object obj2) {
                return ((TableCollectors.ImmutableTableCollectorState) obj).combine((TableCollectors.ImmutableTableCollectorState) obj2, mergeFunction);
            }
        }, new Function() { // from class: com.google.common.collect.TableCollectors$$ExternalSyntheticLambda1
            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return ((TableCollectors.ImmutableTableCollectorState) obj).toTable();
            }
        }, new Collector.Characteristics[0]);
    }

    static /* synthetic */ ImmutableTableCollectorState lambda$toImmutableTable$1() {
        return new ImmutableTableCollectorState();
    }

    static <T, R, C, V, I extends Table<R, C, V>> Collector<T, ?, I> toTable(Function<? super T, ? extends R> rowFunction, Function<? super T, ? extends C> columnFunction, Function<? super T, ? extends V> valueFunction, Supplier<I> tableSupplier) {
        return toTable(rowFunction, columnFunction, valueFunction, new BinaryOperator() { // from class: com.google.common.collect.TableCollectors$$ExternalSyntheticLambda6
            @Override // java.util.function.BiFunction
            public final Object apply(Object obj, Object obj2) {
                return TableCollectors.lambda$toTable$5(obj, obj2);
            }
        }, tableSupplier);
    }

    static /* synthetic */ Object lambda$toTable$5(Object obj, Object obj2) {
        throw new IllegalStateException("Conflicting values " + obj + " and " + obj2);
    }

    static <T, R, C, V, I extends Table<R, C, V>> Collector<T, ?, I> toTable(final Function<? super T, ? extends R> rowFunction, final Function<? super T, ? extends C> columnFunction, final Function<? super T, ? extends V> valueFunction, final BinaryOperator<V> mergeFunction, Supplier<I> tableSupplier) {
        Preconditions.checkNotNull(rowFunction);
        Preconditions.checkNotNull(columnFunction);
        Preconditions.checkNotNull(valueFunction);
        Preconditions.checkNotNull(mergeFunction);
        Preconditions.checkNotNull(tableSupplier);
        return Collector.of(tableSupplier, new BiConsumer() { // from class: com.google.common.collect.TableCollectors$$ExternalSyntheticLambda7
            @Override // java.util.function.BiConsumer
            public final void accept(Object obj, Object obj2) {
                Table table = (Table) obj;
                TableCollectors.mergeTables(table, rowFunction.apply(obj2), columnFunction.apply(obj2), valueFunction.apply(obj2), mergeFunction);
            }
        }, new BinaryOperator() { // from class: com.google.common.collect.TableCollectors$$ExternalSyntheticLambda8
            @Override // java.util.function.BiFunction
            public final Object apply(Object obj, Object obj2) {
                return TableCollectors.lambda$toTable$7(mergeFunction, (Table) obj, (Table) obj2);
            }
        }, new Collector.Characteristics[0]);
    }

    static /* synthetic */ Table lambda$toTable$7(BinaryOperator binaryOperator, Table table, Table table2) {
        for (Table.Cell cell : table2.cellSet()) {
            mergeTables(table, cell.getRowKey(), cell.getColumnKey(), cell.getValue(), binaryOperator);
        }
        return table;
    }

    /* JADX INFO: Access modifiers changed from: private */
    static final class ImmutableTableCollectorState<R, C, V> {
        final List<MutableCell<R, C, V>> insertionOrder;
        final Table<R, C, MutableCell<R, C, V>> table;

        private ImmutableTableCollectorState() {
            this.insertionOrder = new ArrayList();
            this.table = HashBasedTable.create();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public void put(R row, C column, V value, BinaryOperator<V> merger) {
            MutableCell<R, C, V> mutableCell = this.table.get(row, column);
            if (mutableCell == null) {
                MutableCell<R, C, V> mutableCell2 = new MutableCell<>(row, column, value);
                this.insertionOrder.add(mutableCell2);
                this.table.put(row, column, mutableCell2);
                return;
            }
            mutableCell.merge(value, merger);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public ImmutableTableCollectorState<R, C, V> combine(ImmutableTableCollectorState<R, C, V> other, BinaryOperator<V> merger) {
            for (MutableCell<R, C, V> mutableCell : other.insertionOrder) {
                put(mutableCell.getRowKey(), mutableCell.getColumnKey(), mutableCell.getValue(), merger);
            }
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public ImmutableTable<R, C, V> toTable() {
            return ImmutableTable.copyOf(this.insertionOrder);
        }
    }

    private static final class MutableCell<R, C, V> extends Tables.AbstractCell<R, C, V> {
        private final C column;
        private final R row;
        private V value;

        MutableCell(R r, C c, V v) {
            this.row = (R) Preconditions.checkNotNull(r, "row");
            this.column = (C) Preconditions.checkNotNull(c, "column");
            this.value = (V) Preconditions.checkNotNull(v, "value");
        }

        @Override // com.google.common.collect.Table.Cell
        public R getRowKey() {
            return this.row;
        }

        @Override // com.google.common.collect.Table.Cell
        public C getColumnKey() {
            return this.column;
        }

        @Override // com.google.common.collect.Table.Cell
        public V getValue() {
            return this.value;
        }

        void merge(V v, BinaryOperator<V> binaryOperator) {
            Preconditions.checkNotNull(v, "value");
            this.value = (V) Preconditions.checkNotNull(binaryOperator.apply(this.value, v), "mergeFunction.apply");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public static <R, C, V> void mergeTables(Table<R, C, V> table, @ParametricNullness R row, @ParametricNullness C column, @ParametricNullness V value, BinaryOperator<V> mergeFunction) {
        Preconditions.checkNotNull(value);
        Object obj = table.get(row, column);
        if (obj == null) {
            table.put(row, column, value);
            return;
        }
        Object objApply = mergeFunction.apply(obj, value);
        if (objApply == null) {
            table.remove(row, column);
        } else {
            table.put(row, column, objApply);
        }
    }

    private TableCollectors() {
    }
}
