package com.google.common.collect;

import com.google.common.base.Converter;
import com.google.common.base.Equivalence;
import com.google.common.base.Function;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.MapDifference;
import com.google.common.collect.Sets;
import com.google.errorprone.annotations.concurrent.LazyInit;
import defpackage.WakelockPlusApi$Companion$codec$2;
import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.AbstractMap;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.EnumMap;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Properties;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.function.BinaryOperator;
import java.util.stream.Collector;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Maps {

    private enum EntryFunction implements Function<Map.Entry<?, ?>, Object> {
        KEY { // from class: com.google.common.collect.Maps.EntryFunction.1
            @Override // com.google.common.base.Function
            @CheckForNull
            public Object apply(Map.Entry<?, ?> entry) {
                return entry.getKey();
            }
        },
        VALUE { // from class: com.google.common.collect.Maps.EntryFunction.2
            @Override // com.google.common.base.Function
            @CheckForNull
            public Object apply(Map.Entry<?, ?> entry) {
                return entry.getValue();
            }
        }
    }

    public interface EntryTransformer<K, V1, V2> {
        @ParametricNullness
        V2 transformEntry(@ParametricNullness K key, @ParametricNullness V1 value);
    }

    private Maps() {
    }

    static <K> Function<Map.Entry<K, ?>, K> keyFunction() {
        return EntryFunction.KEY;
    }

    static <V> Function<Map.Entry<?, V>, V> valueFunction() {
        return EntryFunction.VALUE;
    }

    static <K, V> Iterator<K> keyIterator(Iterator<Map.Entry<K, V>> entryIterator) {
        return new TransformedIterator<Map.Entry<K, V>, K>(entryIterator) { // from class: com.google.common.collect.Maps.1
            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.collect.TransformedIterator
            @ParametricNullness
            public K transform(Map.Entry<K, V> entry) {
                return entry.getKey();
            }
        };
    }

    static <K, V> Iterator<V> valueIterator(Iterator<Map.Entry<K, V>> entryIterator) {
        return new TransformedIterator<Map.Entry<K, V>, V>(entryIterator) { // from class: com.google.common.collect.Maps.2
            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.collect.TransformedIterator
            @ParametricNullness
            public V transform(Map.Entry<K, V> entry) {
                return entry.getValue();
            }
        };
    }

    public static <K extends Enum<K>, V> ImmutableMap<K, V> immutableEnumMap(Map<K, ? extends V> map) {
        if (map instanceof ImmutableEnumMap) {
            return (ImmutableEnumMap) map;
        }
        Iterator<Map.Entry<K, ? extends V>> it = map.entrySet().iterator();
        if (!it.hasNext()) {
            return ImmutableMap.of();
        }
        Map.Entry<K, ? extends V> next = it.next();
        K key = next.getKey();
        V value = next.getValue();
        CollectPreconditions.checkEntryNotNull(key, value);
        EnumMap enumMap = new EnumMap(Collections.singletonMap(key, value));
        while (it.hasNext()) {
            Map.Entry<K, ? extends V> next2 = it.next();
            K key2 = next2.getKey();
            V value2 = next2.getValue();
            CollectPreconditions.checkEntryNotNull(key2, value2);
            enumMap.put((EnumMap) key2, (K) value2);
        }
        return ImmutableEnumMap.asImmutable(enumMap);
    }

    static <T, K extends Enum<K>, V> Collector<T, ?, ImmutableMap<K, V>> toImmutableEnumMap(java.util.function.Function<? super T, ? extends K> keyFunction, java.util.function.Function<? super T, ? extends V> valueFunction) {
        return CollectCollectors.toImmutableEnumMap(keyFunction, valueFunction);
    }

    static <T, K extends Enum<K>, V> Collector<T, ?, ImmutableMap<K, V>> toImmutableEnumMap(java.util.function.Function<? super T, ? extends K> keyFunction, java.util.function.Function<? super T, ? extends V> valueFunction, BinaryOperator<V> mergeFunction) {
        return CollectCollectors.toImmutableEnumMap(keyFunction, valueFunction, mergeFunction);
    }

    public static <K, V> HashMap<K, V> newHashMap() {
        return new HashMap<>();
    }

    public static <K, V> HashMap<K, V> newHashMap(Map<? extends K, ? extends V> map) {
        return new HashMap<>(map);
    }

    public static <K, V> HashMap<K, V> newHashMapWithExpectedSize(int expectedSize) {
        return new HashMap<>(capacity(expectedSize));
    }

    static int capacity(int expectedSize) {
        if (expectedSize < 3) {
            CollectPreconditions.checkNonnegative(expectedSize, "expectedSize");
            return expectedSize + 1;
        }
        if (expectedSize < 1073741824) {
            return (int) Math.ceil(expectedSize / 0.75d);
        }
        return Integer.MAX_VALUE;
    }

    public static <K, V> LinkedHashMap<K, V> newLinkedHashMap() {
        return new LinkedHashMap<>();
    }

    public static <K, V> LinkedHashMap<K, V> newLinkedHashMap(Map<? extends K, ? extends V> map) {
        return new LinkedHashMap<>(map);
    }

    public static <K, V> LinkedHashMap<K, V> newLinkedHashMapWithExpectedSize(int expectedSize) {
        return new LinkedHashMap<>(capacity(expectedSize));
    }

    public static <K, V> ConcurrentMap<K, V> newConcurrentMap() {
        return new ConcurrentHashMap();
    }

    public static <K extends Comparable, V> TreeMap<K, V> newTreeMap() {
        return new TreeMap<>();
    }

    public static <K, V> TreeMap<K, V> newTreeMap(SortedMap<K, ? extends V> map) {
        return new TreeMap<>((SortedMap) map);
    }

    public static <C, K extends C, V> TreeMap<K, V> newTreeMap(@CheckForNull Comparator<C> comparator) {
        return new TreeMap<>(comparator);
    }

    public static <K extends Enum<K>, V> EnumMap<K, V> newEnumMap(Class<K> type) {
        return new EnumMap<>((Class) Preconditions.checkNotNull(type));
    }

    public static <K extends Enum<K>, V> EnumMap<K, V> newEnumMap(Map<K, ? extends V> map) {
        return new EnumMap<>(map);
    }

    public static <K, V> IdentityHashMap<K, V> newIdentityHashMap() {
        return new IdentityHashMap<>();
    }

    public static <K, V> MapDifference<K, V> difference(Map<? extends K, ? extends V> left, Map<? extends K, ? extends V> right) {
        if (left instanceof SortedMap) {
            return difference((SortedMap) left, (Map) right);
        }
        return difference(left, right, Equivalence.equals());
    }

    public static <K, V> MapDifference<K, V> difference(Map<? extends K, ? extends V> left, Map<? extends K, ? extends V> right, Equivalence<? super V> valueEquivalence) {
        Preconditions.checkNotNull(valueEquivalence);
        LinkedHashMap linkedHashMapNewLinkedHashMap = newLinkedHashMap();
        LinkedHashMap linkedHashMap = new LinkedHashMap(right);
        LinkedHashMap linkedHashMapNewLinkedHashMap2 = newLinkedHashMap();
        LinkedHashMap linkedHashMapNewLinkedHashMap3 = newLinkedHashMap();
        doDifference(left, right, valueEquivalence, linkedHashMapNewLinkedHashMap, linkedHashMap, linkedHashMapNewLinkedHashMap2, linkedHashMapNewLinkedHashMap3);
        return new MapDifferenceImpl(linkedHashMapNewLinkedHashMap, linkedHashMap, linkedHashMapNewLinkedHashMap2, linkedHashMapNewLinkedHashMap3);
    }

    public static <K, V> SortedMapDifference<K, V> difference(SortedMap<K, ? extends V> left, Map<? extends K, ? extends V> right) {
        Preconditions.checkNotNull(left);
        Preconditions.checkNotNull(right);
        Comparator comparatorOrNaturalOrder = orNaturalOrder(left.comparator());
        TreeMap treeMapNewTreeMap = newTreeMap(comparatorOrNaturalOrder);
        TreeMap treeMapNewTreeMap2 = newTreeMap(comparatorOrNaturalOrder);
        treeMapNewTreeMap2.putAll(right);
        TreeMap treeMapNewTreeMap3 = newTreeMap(comparatorOrNaturalOrder);
        TreeMap treeMapNewTreeMap4 = newTreeMap(comparatorOrNaturalOrder);
        doDifference(left, right, Equivalence.equals(), treeMapNewTreeMap, treeMapNewTreeMap2, treeMapNewTreeMap3, treeMapNewTreeMap4);
        return new SortedMapDifferenceImpl(treeMapNewTreeMap, treeMapNewTreeMap2, treeMapNewTreeMap3, treeMapNewTreeMap4);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static <K, V> void doDifference(Map<? extends K, ? extends V> map, Map<? extends K, ? extends V> map2, Equivalence<? super V> equivalence, Map<K, V> map3, Map<K, V> map4, Map<K, V> map5, Map<K, MapDifference.ValueDifference<V>> map6) {
        for (Map.Entry<? extends K, ? extends V> entry : map.entrySet()) {
            K key = entry.getKey();
            V value = entry.getValue();
            if (map2.containsKey(key)) {
                WakelockPlusApi$Companion$codec$2 wakelockPlusApi$Companion$codec$2 = (Object) NullnessCasts.uncheckedCastNullableTToT(map4.remove(key));
                if (equivalence.equivalent(value, wakelockPlusApi$Companion$codec$2)) {
                    map5.put(key, value);
                } else {
                    map6.put(key, ValueDifferenceImpl.create(value, wakelockPlusApi$Companion$codec$2));
                }
            } else {
                map3.put(key, value);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <K, V> Map<K, V> unmodifiableMap(Map<K, ? extends V> map) {
        if (map instanceof SortedMap) {
            return Collections.unmodifiableSortedMap((SortedMap) map);
        }
        return Collections.unmodifiableMap(map);
    }

    static class MapDifferenceImpl<K, V> implements MapDifference<K, V> {
        final Map<K, MapDifference.ValueDifference<V>> differences;
        final Map<K, V> onBoth;
        final Map<K, V> onlyOnLeft;
        final Map<K, V> onlyOnRight;

        MapDifferenceImpl(Map<K, V> onlyOnLeft, Map<K, V> onlyOnRight, Map<K, V> onBoth, Map<K, MapDifference.ValueDifference<V>> differences) {
            this.onlyOnLeft = Maps.unmodifiableMap(onlyOnLeft);
            this.onlyOnRight = Maps.unmodifiableMap(onlyOnRight);
            this.onBoth = Maps.unmodifiableMap(onBoth);
            this.differences = Maps.unmodifiableMap(differences);
        }

        @Override // com.google.common.collect.MapDifference
        public boolean areEqual() {
            return this.onlyOnLeft.isEmpty() && this.onlyOnRight.isEmpty() && this.differences.isEmpty();
        }

        @Override // com.google.common.collect.MapDifference
        public Map<K, V> entriesOnlyOnLeft() {
            return this.onlyOnLeft;
        }

        @Override // com.google.common.collect.MapDifference
        public Map<K, V> entriesOnlyOnRight() {
            return this.onlyOnRight;
        }

        @Override // com.google.common.collect.MapDifference
        public Map<K, V> entriesInCommon() {
            return this.onBoth;
        }

        @Override // com.google.common.collect.MapDifference
        public Map<K, MapDifference.ValueDifference<V>> entriesDiffering() {
            return this.differences;
        }

        @Override // com.google.common.collect.MapDifference
        public boolean equals(@CheckForNull Object object) {
            if (object == this) {
                return true;
            }
            if (!(object instanceof MapDifference)) {
                return false;
            }
            MapDifference mapDifference = (MapDifference) object;
            return entriesOnlyOnLeft().equals(mapDifference.entriesOnlyOnLeft()) && entriesOnlyOnRight().equals(mapDifference.entriesOnlyOnRight()) && entriesInCommon().equals(mapDifference.entriesInCommon()) && entriesDiffering().equals(mapDifference.entriesDiffering());
        }

        @Override // com.google.common.collect.MapDifference
        public int hashCode() {
            return Objects.hashCode(entriesOnlyOnLeft(), entriesOnlyOnRight(), entriesInCommon(), entriesDiffering());
        }

        public String toString() {
            if (areEqual()) {
                return "equal";
            }
            StringBuilder sb = new StringBuilder("not equal");
            if (!this.onlyOnLeft.isEmpty()) {
                sb.append(": only on left=");
                sb.append(this.onlyOnLeft);
            }
            if (!this.onlyOnRight.isEmpty()) {
                sb.append(": only on right=");
                sb.append(this.onlyOnRight);
            }
            if (!this.differences.isEmpty()) {
                sb.append(": value differences=");
                sb.append(this.differences);
            }
            return sb.toString();
        }
    }

    static class ValueDifferenceImpl<V> implements MapDifference.ValueDifference<V> {

        @ParametricNullness
        private final V left;

        @ParametricNullness
        private final V right;

        static <V> MapDifference.ValueDifference<V> create(@ParametricNullness V left, @ParametricNullness V right) {
            return new ValueDifferenceImpl(left, right);
        }

        private ValueDifferenceImpl(@ParametricNullness V left, @ParametricNullness V right) {
            this.left = left;
            this.right = right;
        }

        @Override // com.google.common.collect.MapDifference.ValueDifference
        @ParametricNullness
        public V leftValue() {
            return this.left;
        }

        @Override // com.google.common.collect.MapDifference.ValueDifference
        @ParametricNullness
        public V rightValue() {
            return this.right;
        }

        @Override // com.google.common.collect.MapDifference.ValueDifference
        public boolean equals(@CheckForNull Object object) {
            if (!(object instanceof MapDifference.ValueDifference)) {
                return false;
            }
            MapDifference.ValueDifference valueDifference = (MapDifference.ValueDifference) object;
            return Objects.equal(this.left, valueDifference.leftValue()) && Objects.equal(this.right, valueDifference.rightValue());
        }

        @Override // com.google.common.collect.MapDifference.ValueDifference
        public int hashCode() {
            return Objects.hashCode(this.left, this.right);
        }

        public String toString() {
            return "(" + this.left + ", " + this.right + ")";
        }
    }

    static class SortedMapDifferenceImpl<K, V> extends MapDifferenceImpl<K, V> implements SortedMapDifference<K, V> {
        SortedMapDifferenceImpl(SortedMap<K, V> onlyOnLeft, SortedMap<K, V> onlyOnRight, SortedMap<K, V> onBoth, SortedMap<K, MapDifference.ValueDifference<V>> differences) {
            super(onlyOnLeft, onlyOnRight, onBoth, differences);
        }

        @Override // com.google.common.collect.Maps.MapDifferenceImpl, com.google.common.collect.MapDifference
        public SortedMap<K, MapDifference.ValueDifference<V>> entriesDiffering() {
            return (SortedMap) super.entriesDiffering();
        }

        @Override // com.google.common.collect.Maps.MapDifferenceImpl, com.google.common.collect.MapDifference
        public SortedMap<K, V> entriesInCommon() {
            return (SortedMap) super.entriesInCommon();
        }

        @Override // com.google.common.collect.Maps.MapDifferenceImpl, com.google.common.collect.MapDifference
        public SortedMap<K, V> entriesOnlyOnLeft() {
            return (SortedMap) super.entriesOnlyOnLeft();
        }

        @Override // com.google.common.collect.Maps.MapDifferenceImpl, com.google.common.collect.MapDifference
        public SortedMap<K, V> entriesOnlyOnRight() {
            return (SortedMap) super.entriesOnlyOnRight();
        }
    }

    static <E> Comparator<? super E> orNaturalOrder(@CheckForNull Comparator<? super E> comparator) {
        return comparator != null ? comparator : Ordering.natural();
    }

    public static <K, V> Map<K, V> asMap(Set<K> set, Function<? super K, V> function) {
        return new AsMapView(set, function);
    }

    public static <K, V> SortedMap<K, V> asMap(SortedSet<K> set, Function<? super K, V> function) {
        return new SortedAsMapView(set, function);
    }

    public static <K, V> NavigableMap<K, V> asMap(NavigableSet<K> set, Function<? super K, V> function) {
        return new NavigableAsMapView(set, function);
    }

    private static class AsMapView<K, V> extends ViewCachingAbstractMap<K, V> {
        final Function<? super K, V> function;
        private final Set<K> set;

        Set<K> backingSet() {
            return this.set;
        }

        AsMapView(Set<K> set, Function<? super K, V> function) {
            this.set = (Set) Preconditions.checkNotNull(set);
            this.function = (Function) Preconditions.checkNotNull(function);
        }

        @Override // com.google.common.collect.Maps.ViewCachingAbstractMap
        public Set<K> createKeySet() {
            return Maps.removeOnlySet(backingSet());
        }

        @Override // com.google.common.collect.Maps.ViewCachingAbstractMap
        Collection<V> createValues() {
            return Collections2.transform(this.set, this.function);
        }

        @Override // java.util.AbstractMap, java.util.Map
        public int size() {
            return backingSet().size();
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsKey(@CheckForNull Object key) {
            return backingSet().contains(key);
        }

        @Override // java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V get(@CheckForNull Object key) {
            if (Collections2.safeContains(backingSet(), key)) {
                return this.function.apply(key);
            }
            return null;
        }

        @Override // java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V remove(@CheckForNull Object key) {
            if (backingSet().remove(key)) {
                return this.function.apply(key);
            }
            return null;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public void clear() {
            backingSet().clear();
        }

        @Override // com.google.common.collect.Maps.ViewCachingAbstractMap
        protected Set<Map.Entry<K, V>> createEntrySet() {
            return new EntrySet<K, V>() { // from class: com.google.common.collect.Maps.AsMapView.1EntrySetImpl
                @Override // com.google.common.collect.Maps.EntrySet
                Map<K, V> map() {
                    return AsMapView.this;
                }

                @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
                public Iterator<Map.Entry<K, V>> iterator() {
                    return Maps.asMapEntryIterator(AsMapView.this.backingSet(), AsMapView.this.function);
                }
            };
        }
    }

    static <K, V> Iterator<Map.Entry<K, V>> asMapEntryIterator(Set<K> set, final Function<? super K, V> function) {
        return new TransformedIterator<K, Map.Entry<K, V>>(set.iterator()) { // from class: com.google.common.collect.Maps.3
            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.google.common.collect.TransformedIterator
            /* bridge */ /* synthetic */ Object transform(@ParametricNullness final Object key) {
                return transform((AnonymousClass3<K, V>) key);
            }

            @Override // com.google.common.collect.TransformedIterator
            Map.Entry<K, V> transform(@ParametricNullness final K key) {
                return Maps.immutableEntry(key, function.apply(key));
            }
        };
    }

    private static class SortedAsMapView<K, V> extends AsMapView<K, V> implements SortedMap<K, V> {
        SortedAsMapView(SortedSet<K> set, Function<? super K, V> function) {
            super(set, function);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.collect.Maps.AsMapView
        public SortedSet<K> backingSet() {
            return (SortedSet) super.backingSet();
        }

        @Override // java.util.SortedMap
        @CheckForNull
        public Comparator<? super K> comparator() {
            return backingSet().comparator();
        }

        @Override // com.google.common.collect.Maps.ViewCachingAbstractMap, java.util.AbstractMap, java.util.Map
        public Set<K> keySet() {
            return Maps.removeOnlySortedSet(backingSet());
        }

        @Override // java.util.SortedMap
        public SortedMap<K, V> subMap(@ParametricNullness K fromKey, @ParametricNullness K toKey) {
            return Maps.asMap((SortedSet) backingSet().subSet(fromKey, toKey), (Function) this.function);
        }

        @Override // java.util.SortedMap
        public SortedMap<K, V> headMap(@ParametricNullness K toKey) {
            return Maps.asMap((SortedSet) backingSet().headSet(toKey), (Function) this.function);
        }

        @Override // java.util.SortedMap
        public SortedMap<K, V> tailMap(@ParametricNullness K fromKey) {
            return Maps.asMap((SortedSet) backingSet().tailSet(fromKey), (Function) this.function);
        }

        @Override // java.util.SortedMap
        @ParametricNullness
        public K firstKey() {
            return backingSet().first();
        }

        @Override // java.util.SortedMap
        @ParametricNullness
        public K lastKey() {
            return backingSet().last();
        }
    }

    private static final class NavigableAsMapView<K, V> extends AbstractNavigableMap<K, V> {
        private final Function<? super K, V> function;
        private final NavigableSet<K> set;

        NavigableAsMapView(NavigableSet<K> ks, Function<? super K, V> vFunction) {
            this.set = (NavigableSet) Preconditions.checkNotNull(ks);
            this.function = (Function) Preconditions.checkNotNull(vFunction);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> subMap(@ParametricNullness K fromKey, boolean fromInclusive, @ParametricNullness K toKey, boolean toInclusive) {
            return Maps.asMap((NavigableSet) this.set.subSet(fromKey, fromInclusive, toKey, toInclusive), (Function) this.function);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> headMap(@ParametricNullness K toKey, boolean inclusive) {
            return Maps.asMap((NavigableSet) this.set.headSet(toKey, inclusive), (Function) this.function);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> tailMap(@ParametricNullness K fromKey, boolean inclusive) {
            return Maps.asMap((NavigableSet) this.set.tailSet(fromKey, inclusive), (Function) this.function);
        }

        @Override // java.util.SortedMap
        @CheckForNull
        public Comparator<? super K> comparator() {
            return this.set.comparator();
        }

        @Override // com.google.common.collect.AbstractNavigableMap, java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V get(@CheckForNull Object key) {
            if (Collections2.safeContains(this.set, key)) {
                return this.function.apply(key);
            }
            return null;
        }

        @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap, java.util.AbstractMap, java.util.Map
        public void clear() {
            this.set.clear();
        }

        @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap
        Iterator<Map.Entry<K, V>> entryIterator() {
            return Maps.asMapEntryIterator(this.set, this.function);
        }

        @Override // com.google.common.collect.AbstractNavigableMap
        Iterator<Map.Entry<K, V>> descendingEntryIterator() {
            return descendingMap().entrySet().iterator();
        }

        @Override // com.google.common.collect.AbstractNavigableMap, java.util.NavigableMap
        public NavigableSet<K> navigableKeySet() {
            return Maps.removeOnlyNavigableSet(this.set);
        }

        @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap, java.util.AbstractMap, java.util.Map
        public int size() {
            return this.set.size();
        }

        @Override // com.google.common.collect.AbstractNavigableMap, java.util.NavigableMap
        public NavigableMap<K, V> descendingMap() {
            return Maps.asMap((NavigableSet) this.set.descendingSet(), (Function) this.function);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <E> Set<E> removeOnlySet(final Set<E> set) {
        return new ForwardingSet<E>() { // from class: com.google.common.collect.Maps.4
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
            public Set<E> delegate() {
                return set;
            }

            @Override // com.google.common.collect.ForwardingCollection, java.util.Collection, java.util.Queue
            public boolean add(@ParametricNullness E element) {
                throw new UnsupportedOperationException();
            }

            @Override // com.google.common.collect.ForwardingCollection, java.util.Collection
            public boolean addAll(Collection<? extends E> es) {
                throw new UnsupportedOperationException();
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <E> SortedSet<E> removeOnlySortedSet(final SortedSet<E> set) {
        return new ForwardingSortedSet<E>() { // from class: com.google.common.collect.Maps.5
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.common.collect.ForwardingSortedSet, com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
            public SortedSet<E> delegate() {
                return set;
            }

            @Override // com.google.common.collect.ForwardingCollection, java.util.Collection, java.util.Queue
            public boolean add(@ParametricNullness E element) {
                throw new UnsupportedOperationException();
            }

            @Override // com.google.common.collect.ForwardingCollection, java.util.Collection
            public boolean addAll(Collection<? extends E> es) {
                throw new UnsupportedOperationException();
            }

            @Override // com.google.common.collect.ForwardingSortedSet, java.util.SortedSet
            public SortedSet<E> headSet(@ParametricNullness E toElement) {
                return Maps.removeOnlySortedSet(super.headSet(toElement));
            }

            @Override // com.google.common.collect.ForwardingSortedSet, java.util.SortedSet
            public SortedSet<E> subSet(@ParametricNullness E fromElement, @ParametricNullness E toElement) {
                return Maps.removeOnlySortedSet(super.subSet(fromElement, toElement));
            }

            @Override // com.google.common.collect.ForwardingSortedSet, java.util.SortedSet
            public SortedSet<E> tailSet(@ParametricNullness E fromElement) {
                return Maps.removeOnlySortedSet(super.tailSet(fromElement));
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <E> NavigableSet<E> removeOnlyNavigableSet(final NavigableSet<E> set) {
        return new ForwardingNavigableSet<E>() { // from class: com.google.common.collect.Maps.6
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.common.collect.ForwardingNavigableSet, com.google.common.collect.ForwardingSortedSet, com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
            public NavigableSet<E> delegate() {
                return set;
            }

            @Override // com.google.common.collect.ForwardingCollection, java.util.Collection, java.util.Queue
            public boolean add(@ParametricNullness E element) {
                throw new UnsupportedOperationException();
            }

            @Override // com.google.common.collect.ForwardingCollection, java.util.Collection
            public boolean addAll(Collection<? extends E> es) {
                throw new UnsupportedOperationException();
            }

            @Override // com.google.common.collect.ForwardingSortedSet, java.util.SortedSet
            public SortedSet<E> headSet(@ParametricNullness E toElement) {
                return Maps.removeOnlySortedSet(super.headSet(toElement));
            }

            @Override // com.google.common.collect.ForwardingNavigableSet, java.util.NavigableSet
            public NavigableSet<E> headSet(@ParametricNullness E toElement, boolean inclusive) {
                return Maps.removeOnlyNavigableSet(super.headSet(toElement, inclusive));
            }

            @Override // com.google.common.collect.ForwardingSortedSet, java.util.SortedSet
            public SortedSet<E> subSet(@ParametricNullness E fromElement, @ParametricNullness E toElement) {
                return Maps.removeOnlySortedSet(super.subSet(fromElement, toElement));
            }

            @Override // com.google.common.collect.ForwardingNavigableSet, java.util.NavigableSet
            public NavigableSet<E> subSet(@ParametricNullness E fromElement, boolean fromInclusive, @ParametricNullness E toElement, boolean toInclusive) {
                return Maps.removeOnlyNavigableSet(super.subSet(fromElement, fromInclusive, toElement, toInclusive));
            }

            @Override // com.google.common.collect.ForwardingSortedSet, java.util.SortedSet
            public SortedSet<E> tailSet(@ParametricNullness E fromElement) {
                return Maps.removeOnlySortedSet(super.tailSet(fromElement));
            }

            @Override // com.google.common.collect.ForwardingNavigableSet, java.util.NavigableSet
            public NavigableSet<E> tailSet(@ParametricNullness E fromElement, boolean inclusive) {
                return Maps.removeOnlyNavigableSet(super.tailSet(fromElement, inclusive));
            }

            @Override // com.google.common.collect.ForwardingNavigableSet, java.util.NavigableSet
            public NavigableSet<E> descendingSet() {
                return Maps.removeOnlyNavigableSet(super.descendingSet());
            }
        };
    }

    public static <K, V> ImmutableMap<K, V> toMap(Iterable<K> keys, Function<? super K, V> valueFunction) {
        return toMap(keys.iterator(), valueFunction);
    }

    public static <K, V> ImmutableMap<K, V> toMap(Iterator<K> keys, Function<? super K, V> valueFunction) {
        Preconditions.checkNotNull(valueFunction);
        ImmutableMap.Builder builder = ImmutableMap.builder();
        while (keys.hasNext()) {
            K next = keys.next();
            builder.put(next, valueFunction.apply(next));
        }
        return builder.buildKeepingLast();
    }

    public static <K, V> ImmutableMap<K, V> uniqueIndex(Iterable<V> values, Function<? super V, K> keyFunction) {
        if (values instanceof Collection) {
            return uniqueIndex(values.iterator(), keyFunction, ImmutableMap.builderWithExpectedSize(((Collection) values).size()));
        }
        return uniqueIndex(values.iterator(), keyFunction);
    }

    public static <K, V> ImmutableMap<K, V> uniqueIndex(Iterator<V> values, Function<? super V, K> keyFunction) {
        return uniqueIndex(values, keyFunction, ImmutableMap.builder());
    }

    private static <K, V> ImmutableMap<K, V> uniqueIndex(Iterator<V> values, Function<? super V, K> keyFunction, ImmutableMap.Builder<K, V> builder) {
        Preconditions.checkNotNull(keyFunction);
        while (values.hasNext()) {
            V next = values.next();
            builder.put(keyFunction.apply(next), next);
        }
        try {
            return builder.buildOrThrow();
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException(e.getMessage() + ". To index multiple values under a key, use Multimaps.index.");
        }
    }

    public static ImmutableMap<String, String> fromProperties(Properties properties) {
        ImmutableMap.Builder builder = ImmutableMap.builder();
        Enumeration<?> enumerationPropertyNames = properties.propertyNames();
        while (enumerationPropertyNames.hasMoreElements()) {
            String str = (String) java.util.Objects.requireNonNull(enumerationPropertyNames.nextElement());
            builder.put(str, (String) java.util.Objects.requireNonNull(properties.getProperty(str)));
        }
        return builder.buildOrThrow();
    }

    public static <K, V> Map.Entry<K, V> immutableEntry(@ParametricNullness K key, @ParametricNullness V value) {
        return new ImmutableEntry(key, value);
    }

    static <K, V> Set<Map.Entry<K, V>> unmodifiableEntrySet(Set<Map.Entry<K, V>> entrySet) {
        return new UnmodifiableEntrySet(Collections.unmodifiableSet(entrySet));
    }

    static <K, V> Map.Entry<K, V> unmodifiableEntry(final Map.Entry<? extends K, ? extends V> entry) {
        Preconditions.checkNotNull(entry);
        return new AbstractMapEntry<K, V>() { // from class: com.google.common.collect.Maps.7
            @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
            @ParametricNullness
            public K getKey() {
                return (K) entry.getKey();
            }

            @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
            @ParametricNullness
            public V getValue() {
                return (V) entry.getValue();
            }
        };
    }

    static <K, V> UnmodifiableIterator<Map.Entry<K, V>> unmodifiableEntryIterator(final Iterator<Map.Entry<K, V>> entryIterator) {
        return new UnmodifiableIterator<Map.Entry<K, V>>() { // from class: com.google.common.collect.Maps.8
            @Override // java.util.Iterator
            public boolean hasNext() {
                return entryIterator.hasNext();
            }

            @Override // java.util.Iterator
            public Map.Entry<K, V> next() {
                return Maps.unmodifiableEntry((Map.Entry) entryIterator.next());
            }
        };
    }

    static class UnmodifiableEntries<K, V> extends ForwardingCollection<Map.Entry<K, V>> {
        private final Collection<Map.Entry<K, V>> entries;

        UnmodifiableEntries(Collection<Map.Entry<K, V>> entries) {
            this.entries = entries;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
        public Collection<Map.Entry<K, V>> delegate() {
            return this.entries;
        }

        @Override // com.google.common.collect.ForwardingCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<Map.Entry<K, V>> iterator() {
            return Maps.unmodifiableEntryIterator(this.entries.iterator());
        }

        @Override // com.google.common.collect.ForwardingCollection, java.util.Collection, java.util.Set
        public Object[] toArray() {
            return standardToArray();
        }

        @Override // com.google.common.collect.ForwardingCollection, java.util.Collection, java.util.Set
        public <T> T[] toArray(T[] tArr) {
            return (T[]) standardToArray(tArr);
        }
    }

    static class UnmodifiableEntrySet<K, V> extends UnmodifiableEntries<K, V> implements Set<Map.Entry<K, V>> {
        UnmodifiableEntrySet(Set<Map.Entry<K, V>> entries) {
            super(entries);
        }

        @Override // java.util.Collection, java.util.Set
        public boolean equals(@CheckForNull Object object) {
            return Sets.equalsImpl(this, object);
        }

        @Override // java.util.Collection, java.util.Set
        public int hashCode() {
            return Sets.hashCodeImpl(this);
        }
    }

    public static <A, B> Converter<A, B> asConverter(final BiMap<A, B> bimap) {
        return new BiMapConverter(bimap);
    }

    private static final class BiMapConverter<A, B> extends Converter<A, B> implements Serializable {
        private static final long serialVersionUID = 0;
        private final BiMap<A, B> bimap;

        BiMapConverter(BiMap<A, B> bimap) {
            this.bimap = (BiMap) Preconditions.checkNotNull(bimap);
        }

        @Override // com.google.common.base.Converter
        protected B doForward(A a) {
            return (B) convert(this.bimap, a);
        }

        @Override // com.google.common.base.Converter
        protected A doBackward(B b) {
            return (A) convert(this.bimap.inverse(), b);
        }

        private static <X, Y> Y convert(BiMap<X, Y> bimap, X input) {
            Y y = bimap.get(input);
            Preconditions.checkArgument(y != null, "No non-null mapping present for input: %s", input);
            return y;
        }

        @Override // com.google.common.base.Converter, com.google.common.base.Function
        public boolean equals(@CheckForNull Object object) {
            if (object instanceof BiMapConverter) {
                return this.bimap.equals(((BiMapConverter) object).bimap);
            }
            return false;
        }

        public int hashCode() {
            return this.bimap.hashCode();
        }

        public String toString() {
            return "Maps.asConverter(" + this.bimap + ")";
        }
    }

    public static <K, V> BiMap<K, V> synchronizedBiMap(BiMap<K, V> bimap) {
        return Synchronized.biMap(bimap, null);
    }

    public static <K, V> BiMap<K, V> unmodifiableBiMap(BiMap<? extends K, ? extends V> bimap) {
        return new UnmodifiableBiMap(bimap, null);
    }

    private static class UnmodifiableBiMap<K, V> extends ForwardingMap<K, V> implements BiMap<K, V>, Serializable {
        private static final long serialVersionUID = 0;
        final BiMap<? extends K, ? extends V> delegate;

        @CheckForNull
        @LazyInit
        BiMap<V, K> inverse;
        final Map<K, V> unmodifiableMap;

        @CheckForNull
        @LazyInit
        transient Set<V> values;

        UnmodifiableBiMap(BiMap<? extends K, ? extends V> delegate, @CheckForNull BiMap<V, K> inverse) {
            this.unmodifiableMap = Collections.unmodifiableMap(delegate);
            this.delegate = delegate;
            this.inverse = inverse;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.collect.ForwardingMap, com.google.common.collect.ForwardingObject
        public Map<K, V> delegate() {
            return this.unmodifiableMap;
        }

        @Override // com.google.common.collect.BiMap
        @CheckForNull
        public V forcePut(@ParametricNullness K key, @ParametricNullness V value) {
            throw new UnsupportedOperationException();
        }

        @Override // com.google.common.collect.BiMap
        public BiMap<V, K> inverse() {
            BiMap<V, K> biMap = this.inverse;
            if (biMap != null) {
                return biMap;
            }
            UnmodifiableBiMap unmodifiableBiMap = new UnmodifiableBiMap(this.delegate.inverse(), this);
            this.inverse = unmodifiableBiMap;
            return unmodifiableBiMap;
        }

        @Override // com.google.common.collect.ForwardingMap, java.util.Map
        public Set<V> values() {
            Set<V> set = this.values;
            if (set != null) {
                return set;
            }
            Set<V> setUnmodifiableSet = Collections.unmodifiableSet(this.delegate.values());
            this.values = setUnmodifiableSet;
            return setUnmodifiableSet;
        }
    }

    public static <K, V1, V2> Map<K, V2> transformValues(Map<K, V1> fromMap, Function<? super V1, V2> function) {
        return transformEntries(fromMap, asEntryTransformer(function));
    }

    public static <K, V1, V2> SortedMap<K, V2> transformValues(SortedMap<K, V1> fromMap, Function<? super V1, V2> function) {
        return transformEntries((SortedMap) fromMap, asEntryTransformer(function));
    }

    public static <K, V1, V2> NavigableMap<K, V2> transformValues(NavigableMap<K, V1> fromMap, Function<? super V1, V2> function) {
        return transformEntries((NavigableMap) fromMap, asEntryTransformer(function));
    }

    public static <K, V1, V2> Map<K, V2> transformEntries(Map<K, V1> fromMap, EntryTransformer<? super K, ? super V1, V2> transformer) {
        return new TransformedEntriesMap(fromMap, transformer);
    }

    public static <K, V1, V2> SortedMap<K, V2> transformEntries(SortedMap<K, V1> fromMap, EntryTransformer<? super K, ? super V1, V2> transformer) {
        return new TransformedEntriesSortedMap(fromMap, transformer);
    }

    public static <K, V1, V2> NavigableMap<K, V2> transformEntries(NavigableMap<K, V1> fromMap, EntryTransformer<? super K, ? super V1, V2> transformer) {
        return new TransformedEntriesNavigableMap(fromMap, transformer);
    }

    static <K, V1, V2> EntryTransformer<K, V1, V2> asEntryTransformer(final Function<? super V1, V2> function) {
        Preconditions.checkNotNull(function);
        return new EntryTransformer<K, V1, V2>() { // from class: com.google.common.collect.Maps.9
            @Override // com.google.common.collect.Maps.EntryTransformer
            @ParametricNullness
            public V2 transformEntry(@ParametricNullness K k, @ParametricNullness V1 v1) {
                return (V2) function.apply(v1);
            }
        };
    }

    static <K, V1, V2> Function<V1, V2> asValueToValueFunction(final EntryTransformer<? super K, V1, V2> transformer, @ParametricNullness final K key) {
        Preconditions.checkNotNull(transformer);
        return new Function<V1, V2>() { // from class: com.google.common.collect.Maps.10
            @Override // com.google.common.base.Function
            @ParametricNullness
            public V2 apply(@ParametricNullness V1 v1) {
                return (V2) transformer.transformEntry(key, v1);
            }
        };
    }

    static <K, V1, V2> Function<Map.Entry<K, V1>, V2> asEntryToValueFunction(final EntryTransformer<? super K, ? super V1, V2> transformer) {
        Preconditions.checkNotNull(transformer);
        return new Function<Map.Entry<K, V1>, V2>() { // from class: com.google.common.collect.Maps.11
            @Override // com.google.common.base.Function
            @ParametricNullness
            public V2 apply(Map.Entry<K, V1> entry) {
                return (V2) transformer.transformEntry(entry.getKey(), entry.getValue());
            }
        };
    }

    static <V2, K, V1> Map.Entry<K, V2> transformEntry(final EntryTransformer<? super K, ? super V1, V2> transformer, final Map.Entry<K, V1> entry) {
        Preconditions.checkNotNull(transformer);
        Preconditions.checkNotNull(entry);
        return new AbstractMapEntry<K, V2>() { // from class: com.google.common.collect.Maps.12
            @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
            @ParametricNullness
            public K getKey() {
                return (K) entry.getKey();
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.google.common.collect.AbstractMapEntry, java.util.Map.Entry
            @ParametricNullness
            public V2 getValue() {
                return (V2) transformer.transformEntry(entry.getKey(), entry.getValue());
            }
        };
    }

    static <K, V1, V2> Function<Map.Entry<K, V1>, Map.Entry<K, V2>> asEntryToEntryFunction(final EntryTransformer<? super K, ? super V1, V2> transformer) {
        Preconditions.checkNotNull(transformer);
        return new Function<Map.Entry<K, V1>, Map.Entry<K, V2>>() { // from class: com.google.common.collect.Maps.13
            @Override // com.google.common.base.Function
            public Map.Entry<K, V2> apply(final Map.Entry<K, V1> entry) {
                return Maps.transformEntry(transformer, entry);
            }
        };
    }

    static class TransformedEntriesMap<K, V1, V2> extends IteratorBasedAbstractMap<K, V2> {
        final Map<K, V1> fromMap;
        final EntryTransformer<? super K, ? super V1, V2> transformer;

        TransformedEntriesMap(Map<K, V1> fromMap, EntryTransformer<? super K, ? super V1, V2> transformer) {
            this.fromMap = (Map) Preconditions.checkNotNull(fromMap);
            this.transformer = (EntryTransformer) Preconditions.checkNotNull(transformer);
        }

        @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap, java.util.AbstractMap, java.util.Map
        public int size() {
            return this.fromMap.size();
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsKey(@CheckForNull Object key) {
            return this.fromMap.containsKey(key);
        }

        @Override // java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V2 get(@CheckForNull Object obj) {
            V1 v1 = this.fromMap.get(obj);
            if (v1 != null || this.fromMap.containsKey(obj)) {
                return this.transformer.transformEntry(obj, (Object) NullnessCasts.uncheckedCastNullableTToT(v1));
            }
            return null;
        }

        @Override // java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V2 remove(@CheckForNull Object obj) {
            if (this.fromMap.containsKey(obj)) {
                return this.transformer.transformEntry(obj, (Object) NullnessCasts.uncheckedCastNullableTToT(this.fromMap.remove(obj)));
            }
            return null;
        }

        @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap, java.util.AbstractMap, java.util.Map
        public void clear() {
            this.fromMap.clear();
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Set<K> keySet() {
            return this.fromMap.keySet();
        }

        @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap
        Iterator<Map.Entry<K, V2>> entryIterator() {
            return Iterators.transform(this.fromMap.entrySet().iterator(), Maps.asEntryToEntryFunction(this.transformer));
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Collection<V2> values() {
            return new Values(this);
        }
    }

    static class TransformedEntriesSortedMap<K, V1, V2> extends TransformedEntriesMap<K, V1, V2> implements SortedMap<K, V2> {
        protected SortedMap<K, V1> fromMap() {
            return (SortedMap) this.fromMap;
        }

        TransformedEntriesSortedMap(SortedMap<K, V1> fromMap, EntryTransformer<? super K, ? super V1, V2> transformer) {
            super(fromMap, transformer);
        }

        @Override // java.util.SortedMap
        @CheckForNull
        public Comparator<? super K> comparator() {
            return fromMap().comparator();
        }

        @Override // java.util.SortedMap
        @ParametricNullness
        public K firstKey() {
            return fromMap().firstKey();
        }

        public SortedMap<K, V2> headMap(@ParametricNullness K toKey) {
            return Maps.transformEntries((SortedMap) fromMap().headMap(toKey), (EntryTransformer) this.transformer);
        }

        @Override // java.util.SortedMap
        @ParametricNullness
        public K lastKey() {
            return fromMap().lastKey();
        }

        public SortedMap<K, V2> subMap(@ParametricNullness K fromKey, @ParametricNullness K toKey) {
            return Maps.transformEntries((SortedMap) fromMap().subMap(fromKey, toKey), (EntryTransformer) this.transformer);
        }

        public SortedMap<K, V2> tailMap(@ParametricNullness K fromKey) {
            return Maps.transformEntries((SortedMap) fromMap().tailMap(fromKey), (EntryTransformer) this.transformer);
        }
    }

    private static class TransformedEntriesNavigableMap<K, V1, V2> extends TransformedEntriesSortedMap<K, V1, V2> implements NavigableMap<K, V2> {
        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.common.collect.Maps.TransformedEntriesSortedMap, java.util.SortedMap, java.util.NavigableMap
        public /* bridge */ /* synthetic */ SortedMap headMap(@ParametricNullness Object toKey) {
            return headMap((TransformedEntriesNavigableMap<K, V1, V2>) toKey);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.common.collect.Maps.TransformedEntriesSortedMap, java.util.SortedMap, java.util.NavigableMap
        public /* bridge */ /* synthetic */ SortedMap tailMap(@ParametricNullness Object fromKey) {
            return tailMap((TransformedEntriesNavigableMap<K, V1, V2>) fromKey);
        }

        TransformedEntriesNavigableMap(NavigableMap<K, V1> fromMap, EntryTransformer<? super K, ? super V1, V2> transformer) {
            super(fromMap, transformer);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V2> ceilingEntry(@ParametricNullness K key) {
            return transformEntry(fromMap().ceilingEntry(key));
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K ceilingKey(@ParametricNullness K key) {
            return fromMap().ceilingKey(key);
        }

        @Override // java.util.NavigableMap
        public NavigableSet<K> descendingKeySet() {
            return fromMap().descendingKeySet();
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V2> descendingMap() {
            return Maps.transformEntries((NavigableMap) fromMap().descendingMap(), (EntryTransformer) this.transformer);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V2> firstEntry() {
            return transformEntry(fromMap().firstEntry());
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V2> floorEntry(@ParametricNullness K key) {
            return transformEntry(fromMap().floorEntry(key));
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K floorKey(@ParametricNullness K key) {
            return fromMap().floorKey(key);
        }

        @Override // com.google.common.collect.Maps.TransformedEntriesSortedMap, java.util.SortedMap, java.util.NavigableMap
        public NavigableMap<K, V2> headMap(@ParametricNullness K toKey) {
            return headMap(toKey, false);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V2> headMap(@ParametricNullness K toKey, boolean inclusive) {
            return Maps.transformEntries((NavigableMap) fromMap().headMap(toKey, inclusive), (EntryTransformer) this.transformer);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V2> higherEntry(@ParametricNullness K key) {
            return transformEntry(fromMap().higherEntry(key));
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K higherKey(@ParametricNullness K key) {
            return fromMap().higherKey(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V2> lastEntry() {
            return transformEntry(fromMap().lastEntry());
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V2> lowerEntry(@ParametricNullness K key) {
            return transformEntry(fromMap().lowerEntry(key));
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K lowerKey(@ParametricNullness K key) {
            return fromMap().lowerKey(key);
        }

        @Override // java.util.NavigableMap
        public NavigableSet<K> navigableKeySet() {
            return fromMap().navigableKeySet();
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V2> pollFirstEntry() {
            return transformEntry(fromMap().pollFirstEntry());
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V2> pollLastEntry() {
            return transformEntry(fromMap().pollLastEntry());
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V2> subMap(@ParametricNullness K fromKey, boolean fromInclusive, @ParametricNullness K toKey, boolean toInclusive) {
            return Maps.transformEntries((NavigableMap) fromMap().subMap(fromKey, fromInclusive, toKey, toInclusive), (EntryTransformer) this.transformer);
        }

        @Override // com.google.common.collect.Maps.TransformedEntriesSortedMap, java.util.SortedMap, java.util.NavigableMap
        public NavigableMap<K, V2> subMap(@ParametricNullness K fromKey, @ParametricNullness K toKey) {
            return subMap(fromKey, true, toKey, false);
        }

        @Override // com.google.common.collect.Maps.TransformedEntriesSortedMap, java.util.SortedMap, java.util.NavigableMap
        public NavigableMap<K, V2> tailMap(@ParametricNullness K fromKey) {
            return tailMap(fromKey, true);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V2> tailMap(@ParametricNullness K fromKey, boolean inclusive) {
            return Maps.transformEntries((NavigableMap) fromMap().tailMap(fromKey, inclusive), (EntryTransformer) this.transformer);
        }

        @CheckForNull
        private Map.Entry<K, V2> transformEntry(@CheckForNull Map.Entry<K, V1> entry) {
            if (entry == null) {
                return null;
            }
            return Maps.transformEntry(this.transformer, entry);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.collect.Maps.TransformedEntriesSortedMap
        public NavigableMap<K, V1> fromMap() {
            return (NavigableMap) super.fromMap();
        }
    }

    static <K> Predicate<Map.Entry<K, ?>> keyPredicateOnEntries(Predicate<? super K> keyPredicate) {
        return Predicates.compose(keyPredicate, keyFunction());
    }

    static <V> Predicate<Map.Entry<?, V>> valuePredicateOnEntries(Predicate<? super V> valuePredicate) {
        return Predicates.compose(valuePredicate, valueFunction());
    }

    public static <K, V> Map<K, V> filterKeys(Map<K, V> unfiltered, final Predicate<? super K> keyPredicate) {
        Preconditions.checkNotNull(keyPredicate);
        Predicate predicateKeyPredicateOnEntries = keyPredicateOnEntries(keyPredicate);
        if (unfiltered instanceof AbstractFilteredMap) {
            return filterFiltered((AbstractFilteredMap) unfiltered, predicateKeyPredicateOnEntries);
        }
        return new FilteredKeyMap((Map) Preconditions.checkNotNull(unfiltered), keyPredicate, predicateKeyPredicateOnEntries);
    }

    public static <K, V> SortedMap<K, V> filterKeys(SortedMap<K, V> unfiltered, final Predicate<? super K> keyPredicate) {
        return filterEntries((SortedMap) unfiltered, keyPredicateOnEntries(keyPredicate));
    }

    public static <K, V> NavigableMap<K, V> filterKeys(NavigableMap<K, V> unfiltered, final Predicate<? super K> keyPredicate) {
        return filterEntries((NavigableMap) unfiltered, keyPredicateOnEntries(keyPredicate));
    }

    public static <K, V> BiMap<K, V> filterKeys(BiMap<K, V> unfiltered, final Predicate<? super K> keyPredicate) {
        Preconditions.checkNotNull(keyPredicate);
        return filterEntries((BiMap) unfiltered, keyPredicateOnEntries(keyPredicate));
    }

    public static <K, V> Map<K, V> filterValues(Map<K, V> unfiltered, final Predicate<? super V> valuePredicate) {
        return filterEntries(unfiltered, valuePredicateOnEntries(valuePredicate));
    }

    public static <K, V> SortedMap<K, V> filterValues(SortedMap<K, V> unfiltered, final Predicate<? super V> valuePredicate) {
        return filterEntries((SortedMap) unfiltered, valuePredicateOnEntries(valuePredicate));
    }

    public static <K, V> NavigableMap<K, V> filterValues(NavigableMap<K, V> unfiltered, final Predicate<? super V> valuePredicate) {
        return filterEntries((NavigableMap) unfiltered, valuePredicateOnEntries(valuePredicate));
    }

    public static <K, V> BiMap<K, V> filterValues(BiMap<K, V> unfiltered, final Predicate<? super V> valuePredicate) {
        return filterEntries((BiMap) unfiltered, valuePredicateOnEntries(valuePredicate));
    }

    public static <K, V> Map<K, V> filterEntries(Map<K, V> unfiltered, Predicate<? super Map.Entry<K, V>> entryPredicate) {
        Preconditions.checkNotNull(entryPredicate);
        if (unfiltered instanceof AbstractFilteredMap) {
            return filterFiltered((AbstractFilteredMap) unfiltered, entryPredicate);
        }
        return new FilteredEntryMap((Map) Preconditions.checkNotNull(unfiltered), entryPredicate);
    }

    public static <K, V> SortedMap<K, V> filterEntries(SortedMap<K, V> unfiltered, Predicate<? super Map.Entry<K, V>> entryPredicate) {
        Preconditions.checkNotNull(entryPredicate);
        if (unfiltered instanceof FilteredEntrySortedMap) {
            return filterFiltered((FilteredEntrySortedMap) unfiltered, (Predicate) entryPredicate);
        }
        return new FilteredEntrySortedMap((SortedMap) Preconditions.checkNotNull(unfiltered), entryPredicate);
    }

    public static <K, V> NavigableMap<K, V> filterEntries(NavigableMap<K, V> unfiltered, Predicate<? super Map.Entry<K, V>> entryPredicate) {
        Preconditions.checkNotNull(entryPredicate);
        if (unfiltered instanceof FilteredEntryNavigableMap) {
            return filterFiltered((FilteredEntryNavigableMap) unfiltered, entryPredicate);
        }
        return new FilteredEntryNavigableMap((NavigableMap) Preconditions.checkNotNull(unfiltered), entryPredicate);
    }

    public static <K, V> BiMap<K, V> filterEntries(BiMap<K, V> unfiltered, Predicate<? super Map.Entry<K, V>> entryPredicate) {
        Preconditions.checkNotNull(unfiltered);
        Preconditions.checkNotNull(entryPredicate);
        if (unfiltered instanceof FilteredEntryBiMap) {
            return filterFiltered((FilteredEntryBiMap) unfiltered, (Predicate) entryPredicate);
        }
        return new FilteredEntryBiMap(unfiltered, entryPredicate);
    }

    private static <K, V> Map<K, V> filterFiltered(AbstractFilteredMap<K, V> map, Predicate<? super Map.Entry<K, V>> entryPredicate) {
        return new FilteredEntryMap(map.unfiltered, Predicates.and(map.predicate, entryPredicate));
    }

    private static <K, V> SortedMap<K, V> filterFiltered(FilteredEntrySortedMap<K, V> map, Predicate<? super Map.Entry<K, V>> entryPredicate) {
        return new FilteredEntrySortedMap(map.sortedMap(), Predicates.and(map.predicate, entryPredicate));
    }

    private static <K, V> NavigableMap<K, V> filterFiltered(FilteredEntryNavigableMap<K, V> map, Predicate<? super Map.Entry<K, V>> entryPredicate) {
        return new FilteredEntryNavigableMap(((FilteredEntryNavigableMap) map).unfiltered, Predicates.and(((FilteredEntryNavigableMap) map).entryPredicate, entryPredicate));
    }

    private static <K, V> BiMap<K, V> filterFiltered(FilteredEntryBiMap<K, V> map, Predicate<? super Map.Entry<K, V>> entryPredicate) {
        return new FilteredEntryBiMap(map.unfiltered(), Predicates.and(map.predicate, entryPredicate));
    }

    private static abstract class AbstractFilteredMap<K, V> extends ViewCachingAbstractMap<K, V> {
        final Predicate<? super Map.Entry<K, V>> predicate;
        final Map<K, V> unfiltered;

        AbstractFilteredMap(Map<K, V> unfiltered, Predicate<? super Map.Entry<K, V>> predicate) {
            this.unfiltered = unfiltered;
            this.predicate = predicate;
        }

        boolean apply(@CheckForNull Object key, @ParametricNullness V value) {
            return this.predicate.apply(Maps.immutableEntry(key, value));
        }

        @Override // java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V put(@ParametricNullness K key, @ParametricNullness V value) {
            Preconditions.checkArgument(apply(key, value));
            return this.unfiltered.put(key, value);
        }

        @Override // java.util.AbstractMap, java.util.Map
        public void putAll(Map<? extends K, ? extends V> map) {
            for (Map.Entry<? extends K, ? extends V> entry : map.entrySet()) {
                Preconditions.checkArgument(apply(entry.getKey(), entry.getValue()));
            }
            this.unfiltered.putAll(map);
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsKey(@CheckForNull Object key) {
            return this.unfiltered.containsKey(key) && apply(key, this.unfiltered.get(key));
        }

        @Override // java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V get(@CheckForNull Object key) {
            V v = this.unfiltered.get(key);
            if (v == null || !apply(key, v)) {
                return null;
            }
            return v;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean isEmpty() {
            return entrySet().isEmpty();
        }

        @Override // java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V remove(@CheckForNull Object key) {
            if (containsKey(key)) {
                return this.unfiltered.remove(key);
            }
            return null;
        }

        @Override // com.google.common.collect.Maps.ViewCachingAbstractMap
        Collection<V> createValues() {
            return new FilteredMapValues(this, this.unfiltered, this.predicate);
        }
    }

    private static final class FilteredMapValues<K, V> extends Values<K, V> {
        final Predicate<? super Map.Entry<K, V>> predicate;
        final Map<K, V> unfiltered;

        FilteredMapValues(Map<K, V> filteredMap, Map<K, V> unfiltered, Predicate<? super Map.Entry<K, V>> predicate) {
            super(filteredMap);
            this.unfiltered = unfiltered;
            this.predicate = predicate;
        }

        @Override // com.google.common.collect.Maps.Values, java.util.AbstractCollection, java.util.Collection
        public boolean remove(@CheckForNull Object o) {
            Iterator<Map.Entry<K, V>> it = this.unfiltered.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry<K, V> next = it.next();
                if (this.predicate.apply(next) && Objects.equal(next.getValue(), o)) {
                    it.remove();
                    return true;
                }
            }
            return false;
        }

        @Override // com.google.common.collect.Maps.Values, java.util.AbstractCollection, java.util.Collection
        public boolean removeAll(Collection<?> collection) {
            Iterator<Map.Entry<K, V>> it = this.unfiltered.entrySet().iterator();
            boolean z = false;
            while (it.hasNext()) {
                Map.Entry<K, V> next = it.next();
                if (this.predicate.apply(next) && collection.contains(next.getValue())) {
                    it.remove();
                    z = true;
                }
            }
            return z;
        }

        @Override // com.google.common.collect.Maps.Values, java.util.AbstractCollection, java.util.Collection
        public boolean retainAll(Collection<?> collection) {
            Iterator<Map.Entry<K, V>> it = this.unfiltered.entrySet().iterator();
            boolean z = false;
            while (it.hasNext()) {
                Map.Entry<K, V> next = it.next();
                if (this.predicate.apply(next) && !collection.contains(next.getValue())) {
                    it.remove();
                    z = true;
                }
            }
            return z;
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public Object[] toArray() {
            return Lists.newArrayList(iterator()).toArray();
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            return (T[]) Lists.newArrayList(iterator()).toArray(tArr);
        }
    }

    private static class FilteredKeyMap<K, V> extends AbstractFilteredMap<K, V> {
        final Predicate<? super K> keyPredicate;

        FilteredKeyMap(Map<K, V> unfiltered, Predicate<? super K> keyPredicate, Predicate<? super Map.Entry<K, V>> entryPredicate) {
            super(unfiltered, entryPredicate);
            this.keyPredicate = keyPredicate;
        }

        @Override // com.google.common.collect.Maps.ViewCachingAbstractMap
        protected Set<Map.Entry<K, V>> createEntrySet() {
            return Sets.filter(this.unfiltered.entrySet(), this.predicate);
        }

        @Override // com.google.common.collect.Maps.ViewCachingAbstractMap
        Set<K> createKeySet() {
            return Sets.filter(this.unfiltered.keySet(), this.keyPredicate);
        }

        @Override // com.google.common.collect.Maps.AbstractFilteredMap, java.util.AbstractMap, java.util.Map
        public boolean containsKey(@CheckForNull Object key) {
            return this.unfiltered.containsKey(key) && this.keyPredicate.apply(key);
        }
    }

    static class FilteredEntryMap<K, V> extends AbstractFilteredMap<K, V> {
        final Set<Map.Entry<K, V>> filteredEntrySet;

        FilteredEntryMap(Map<K, V> unfiltered, Predicate<? super Map.Entry<K, V>> entryPredicate) {
            super(unfiltered, entryPredicate);
            this.filteredEntrySet = Sets.filter(unfiltered.entrySet(), this.predicate);
        }

        @Override // com.google.common.collect.Maps.ViewCachingAbstractMap
        protected Set<Map.Entry<K, V>> createEntrySet() {
            return new EntrySet();
        }

        private class EntrySet extends ForwardingSet<Map.Entry<K, V>> {
            private EntrySet() {
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.common.collect.ForwardingSet, com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
            public Set<Map.Entry<K, V>> delegate() {
                return FilteredEntryMap.this.filteredEntrySet;
            }

            @Override // com.google.common.collect.ForwardingCollection, java.util.Collection, java.lang.Iterable, java.util.Set
            public Iterator<Map.Entry<K, V>> iterator() {
                return new TransformedIterator<Map.Entry<K, V>, Map.Entry<K, V>>(FilteredEntryMap.this.filteredEntrySet.iterator()) { // from class: com.google.common.collect.Maps.FilteredEntryMap.EntrySet.1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    @Override // com.google.common.collect.TransformedIterator
                    public Map.Entry<K, V> transform(final Map.Entry<K, V> entry) {
                        return new ForwardingMapEntry<K, V>() { // from class: com.google.common.collect.Maps.FilteredEntryMap.EntrySet.1.1
                            /* JADX INFO: Access modifiers changed from: protected */
                            @Override // com.google.common.collect.ForwardingMapEntry, com.google.common.collect.ForwardingObject
                            public Map.Entry<K, V> delegate() {
                                return entry;
                            }

                            @Override // com.google.common.collect.ForwardingMapEntry, java.util.Map.Entry
                            @ParametricNullness
                            public V setValue(@ParametricNullness V v) {
                                Preconditions.checkArgument(FilteredEntryMap.this.apply(getKey(), v));
                                return (V) super.setValue(v);
                            }
                        };
                    }
                };
            }
        }

        @Override // com.google.common.collect.Maps.ViewCachingAbstractMap
        Set<K> createKeySet() {
            return new KeySet();
        }

        static <K, V> boolean removeAllKeys(Map<K, V> map, Predicate<? super Map.Entry<K, V>> entryPredicate, Collection<?> keyCollection) {
            Iterator<Map.Entry<K, V>> it = map.entrySet().iterator();
            boolean z = false;
            while (it.hasNext()) {
                Map.Entry<K, V> next = it.next();
                if (entryPredicate.apply(next) && keyCollection.contains(next.getKey())) {
                    it.remove();
                    z = true;
                }
            }
            return z;
        }

        static <K, V> boolean retainAllKeys(Map<K, V> map, Predicate<? super Map.Entry<K, V>> entryPredicate, Collection<?> keyCollection) {
            Iterator<Map.Entry<K, V>> it = map.entrySet().iterator();
            boolean z = false;
            while (it.hasNext()) {
                Map.Entry<K, V> next = it.next();
                if (entryPredicate.apply(next) && !keyCollection.contains(next.getKey())) {
                    it.remove();
                    z = true;
                }
            }
            return z;
        }

        class KeySet extends KeySet<K, V> {
            KeySet() {
                super(FilteredEntryMap.this);
            }

            @Override // com.google.common.collect.Maps.KeySet, java.util.AbstractCollection, java.util.Collection, java.util.Set
            public boolean remove(@CheckForNull Object o) {
                if (!FilteredEntryMap.this.containsKey(o)) {
                    return false;
                }
                FilteredEntryMap.this.unfiltered.remove(o);
                return true;
            }

            @Override // com.google.common.collect.Sets.ImprovedAbstractSet, java.util.AbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
            public boolean removeAll(Collection<?> collection) {
                return FilteredEntryMap.removeAllKeys(FilteredEntryMap.this.unfiltered, FilteredEntryMap.this.predicate, collection);
            }

            @Override // com.google.common.collect.Sets.ImprovedAbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
            public boolean retainAll(Collection<?> collection) {
                return FilteredEntryMap.retainAllKeys(FilteredEntryMap.this.unfiltered, FilteredEntryMap.this.predicate, collection);
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
            public Object[] toArray() {
                return Lists.newArrayList(iterator()).toArray();
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
            public <T> T[] toArray(T[] tArr) {
                return (T[]) Lists.newArrayList(iterator()).toArray(tArr);
            }
        }
    }

    private static class FilteredEntrySortedMap<K, V> extends FilteredEntryMap<K, V> implements SortedMap<K, V> {
        FilteredEntrySortedMap(SortedMap<K, V> unfiltered, Predicate<? super Map.Entry<K, V>> entryPredicate) {
            super(unfiltered, entryPredicate);
        }

        SortedMap<K, V> sortedMap() {
            return (SortedMap) this.unfiltered;
        }

        @Override // com.google.common.collect.Maps.ViewCachingAbstractMap, java.util.AbstractMap, java.util.Map
        public SortedSet<K> keySet() {
            return (SortedSet) super.keySet();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.collect.Maps.FilteredEntryMap, com.google.common.collect.Maps.ViewCachingAbstractMap
        public SortedSet<K> createKeySet() {
            return new SortedKeySet();
        }

        class SortedKeySet extends FilteredEntryMap<K, V>.KeySet implements SortedSet<K> {
            SortedKeySet() {
                super();
            }

            @Override // java.util.SortedSet
            @CheckForNull
            public Comparator<? super K> comparator() {
                return FilteredEntrySortedMap.this.sortedMap().comparator();
            }

            @Override // java.util.SortedSet
            public SortedSet<K> subSet(@ParametricNullness K fromElement, @ParametricNullness K toElement) {
                return (SortedSet) FilteredEntrySortedMap.this.subMap(fromElement, toElement).keySet();
            }

            @Override // java.util.SortedSet
            public SortedSet<K> headSet(@ParametricNullness K toElement) {
                return (SortedSet) FilteredEntrySortedMap.this.headMap(toElement).keySet();
            }

            @Override // java.util.SortedSet
            public SortedSet<K> tailSet(@ParametricNullness K fromElement) {
                return (SortedSet) FilteredEntrySortedMap.this.tailMap(fromElement).keySet();
            }

            @Override // java.util.SortedSet
            @ParametricNullness
            public K first() {
                return (K) FilteredEntrySortedMap.this.firstKey();
            }

            @Override // java.util.SortedSet
            @ParametricNullness
            public K last() {
                return (K) FilteredEntrySortedMap.this.lastKey();
            }
        }

        @Override // java.util.SortedMap
        @CheckForNull
        public Comparator<? super K> comparator() {
            return sortedMap().comparator();
        }

        @Override // java.util.SortedMap
        @ParametricNullness
        public K firstKey() {
            return keySet().iterator().next();
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.SortedMap
        @ParametricNullness
        public K lastKey() {
            SortedMap<K, V> sortedMap = sortedMap();
            while (true) {
                K kLastKey = sortedMap.lastKey();
                if (apply(kLastKey, NullnessCasts.uncheckedCastNullableTToT(this.unfiltered.get(kLastKey)))) {
                    return kLastKey;
                }
                sortedMap = sortedMap().headMap(kLastKey);
            }
        }

        @Override // java.util.SortedMap
        public SortedMap<K, V> headMap(@ParametricNullness K toKey) {
            return new FilteredEntrySortedMap(sortedMap().headMap(toKey), this.predicate);
        }

        @Override // java.util.SortedMap
        public SortedMap<K, V> subMap(@ParametricNullness K fromKey, @ParametricNullness K toKey) {
            return new FilteredEntrySortedMap(sortedMap().subMap(fromKey, toKey), this.predicate);
        }

        @Override // java.util.SortedMap
        public SortedMap<K, V> tailMap(@ParametricNullness K fromKey) {
            return new FilteredEntrySortedMap(sortedMap().tailMap(fromKey), this.predicate);
        }
    }

    private static class FilteredEntryNavigableMap<K, V> extends AbstractNavigableMap<K, V> {
        private final Predicate<? super Map.Entry<K, V>> entryPredicate;
        private final Map<K, V> filteredDelegate;
        private final NavigableMap<K, V> unfiltered;

        FilteredEntryNavigableMap(NavigableMap<K, V> unfiltered, Predicate<? super Map.Entry<K, V>> entryPredicate) {
            this.unfiltered = (NavigableMap) Preconditions.checkNotNull(unfiltered);
            this.entryPredicate = entryPredicate;
            this.filteredDelegate = new FilteredEntryMap(unfiltered, entryPredicate);
        }

        @Override // java.util.SortedMap
        @CheckForNull
        public Comparator<? super K> comparator() {
            return this.unfiltered.comparator();
        }

        @Override // com.google.common.collect.AbstractNavigableMap, java.util.NavigableMap
        public NavigableSet<K> navigableKeySet() {
            return new NavigableKeySet<K, V>(this) { // from class: com.google.common.collect.Maps.FilteredEntryNavigableMap.1
                @Override // com.google.common.collect.Sets.ImprovedAbstractSet, java.util.AbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
                public boolean removeAll(Collection<?> collection) {
                    return FilteredEntryMap.removeAllKeys(FilteredEntryNavigableMap.this.unfiltered, FilteredEntryNavigableMap.this.entryPredicate, collection);
                }

                @Override // com.google.common.collect.Sets.ImprovedAbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
                public boolean retainAll(Collection<?> collection) {
                    return FilteredEntryMap.retainAllKeys(FilteredEntryNavigableMap.this.unfiltered, FilteredEntryNavigableMap.this.entryPredicate, collection);
                }
            };
        }

        @Override // java.util.AbstractMap, java.util.Map, java.util.SortedMap
        public Collection<V> values() {
            return new FilteredMapValues(this, this.unfiltered, this.entryPredicate);
        }

        @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap
        Iterator<Map.Entry<K, V>> entryIterator() {
            return Iterators.filter(this.unfiltered.entrySet().iterator(), this.entryPredicate);
        }

        @Override // com.google.common.collect.AbstractNavigableMap
        Iterator<Map.Entry<K, V>> descendingEntryIterator() {
            return Iterators.filter(this.unfiltered.descendingMap().entrySet().iterator(), this.entryPredicate);
        }

        @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap, java.util.AbstractMap, java.util.Map
        public int size() {
            return this.filteredDelegate.size();
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean isEmpty() {
            return !Iterables.any(this.unfiltered.entrySet(), this.entryPredicate);
        }

        @Override // com.google.common.collect.AbstractNavigableMap, java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V get(@CheckForNull Object key) {
            return this.filteredDelegate.get(key);
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean containsKey(@CheckForNull Object key) {
            return this.filteredDelegate.containsKey(key);
        }

        @Override // java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V put(@ParametricNullness K key, @ParametricNullness V value) {
            return this.filteredDelegate.put(key, value);
        }

        @Override // java.util.AbstractMap, java.util.Map
        @CheckForNull
        public V remove(@CheckForNull Object key) {
            return this.filteredDelegate.remove(key);
        }

        @Override // java.util.AbstractMap, java.util.Map
        public void putAll(Map<? extends K, ? extends V> m) {
            this.filteredDelegate.putAll(m);
        }

        @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap, java.util.AbstractMap, java.util.Map
        public void clear() {
            this.filteredDelegate.clear();
        }

        @Override // com.google.common.collect.Maps.IteratorBasedAbstractMap, java.util.AbstractMap, java.util.Map, java.util.SortedMap
        public Set<Map.Entry<K, V>> entrySet() {
            return this.filteredDelegate.entrySet();
        }

        @Override // com.google.common.collect.AbstractNavigableMap, java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> pollFirstEntry() {
            return (Map.Entry) Iterables.removeFirstMatching(this.unfiltered.entrySet(), this.entryPredicate);
        }

        @Override // com.google.common.collect.AbstractNavigableMap, java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> pollLastEntry() {
            return (Map.Entry) Iterables.removeFirstMatching(this.unfiltered.descendingMap().entrySet(), this.entryPredicate);
        }

        @Override // com.google.common.collect.AbstractNavigableMap, java.util.NavigableMap
        public NavigableMap<K, V> descendingMap() {
            return Maps.filterEntries((NavigableMap) this.unfiltered.descendingMap(), (Predicate) this.entryPredicate);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> subMap(@ParametricNullness K fromKey, boolean fromInclusive, @ParametricNullness K toKey, boolean toInclusive) {
            return Maps.filterEntries((NavigableMap) this.unfiltered.subMap(fromKey, fromInclusive, toKey, toInclusive), (Predicate) this.entryPredicate);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> headMap(@ParametricNullness K toKey, boolean inclusive) {
            return Maps.filterEntries((NavigableMap) this.unfiltered.headMap(toKey, inclusive), (Predicate) this.entryPredicate);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> tailMap(@ParametricNullness K fromKey, boolean inclusive) {
            return Maps.filterEntries((NavigableMap) this.unfiltered.tailMap(fromKey, inclusive), (Predicate) this.entryPredicate);
        }
    }

    static final class FilteredEntryBiMap<K, V> extends FilteredEntryMap<K, V> implements BiMap<K, V> {
        private final BiMap<V, K> inverse;

        private static <K, V> Predicate<Map.Entry<V, K>> inversePredicate(final Predicate<? super Map.Entry<K, V>> forwardPredicate) {
            return new Predicate<Map.Entry<V, K>>() { // from class: com.google.common.collect.Maps.FilteredEntryBiMap.1
                @Override // com.google.common.base.Predicate
                public boolean apply(Map.Entry<V, K> input) {
                    return forwardPredicate.apply(Maps.immutableEntry(input.getValue(), input.getKey()));
                }
            };
        }

        FilteredEntryBiMap(BiMap<K, V> delegate, Predicate<? super Map.Entry<K, V>> predicate) {
            super(delegate, predicate);
            this.inverse = new FilteredEntryBiMap(delegate.inverse(), inversePredicate(predicate), this);
        }

        private FilteredEntryBiMap(BiMap<K, V> delegate, Predicate<? super Map.Entry<K, V>> predicate, BiMap<V, K> inverse) {
            super(delegate, predicate);
            this.inverse = inverse;
        }

        BiMap<K, V> unfiltered() {
            return (BiMap) this.unfiltered;
        }

        @Override // com.google.common.collect.BiMap
        @CheckForNull
        public V forcePut(@ParametricNullness K key, @ParametricNullness V value) {
            Preconditions.checkArgument(apply(key, value));
            return unfiltered().forcePut(key, value);
        }

        @Override // com.google.common.collect.BiMap
        public BiMap<V, K> inverse() {
            return this.inverse;
        }

        @Override // com.google.common.collect.Maps.ViewCachingAbstractMap, java.util.AbstractMap, java.util.Map
        public Set<V> values() {
            return this.inverse.keySet();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <K, V> NavigableMap<K, V> unmodifiableNavigableMap(NavigableMap<K, ? extends V> map) {
        Preconditions.checkNotNull(map);
        return map instanceof UnmodifiableNavigableMap ? map : new UnmodifiableNavigableMap(map);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @CheckForNull
    public static <K, V> Map.Entry<K, V> unmodifiableOrNull(@CheckForNull Map.Entry<K, ? extends V> entry) {
        if (entry == null) {
            return null;
        }
        return unmodifiableEntry(entry);
    }

    static class UnmodifiableNavigableMap<K, V> extends ForwardingSortedMap<K, V> implements NavigableMap<K, V>, Serializable {
        private final NavigableMap<K, ? extends V> delegate;

        @CheckForNull
        @LazyInit
        private transient UnmodifiableNavigableMap<K, V> descendingMap;

        UnmodifiableNavigableMap(NavigableMap<K, ? extends V> delegate) {
            this.delegate = delegate;
        }

        UnmodifiableNavigableMap(NavigableMap<K, ? extends V> delegate, UnmodifiableNavigableMap<K, V> descendingMap) {
            this.delegate = delegate;
            this.descendingMap = descendingMap;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.collect.ForwardingSortedMap, com.google.common.collect.ForwardingMap, com.google.common.collect.ForwardingObject
        public SortedMap<K, V> delegate() {
            return Collections.unmodifiableSortedMap(this.delegate);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> lowerEntry(@ParametricNullness K key) {
            return Maps.unmodifiableOrNull(this.delegate.lowerEntry(key));
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K lowerKey(@ParametricNullness K key) {
            return this.delegate.lowerKey(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> floorEntry(@ParametricNullness K key) {
            return Maps.unmodifiableOrNull(this.delegate.floorEntry(key));
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K floorKey(@ParametricNullness K key) {
            return this.delegate.floorKey(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> ceilingEntry(@ParametricNullness K key) {
            return Maps.unmodifiableOrNull(this.delegate.ceilingEntry(key));
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K ceilingKey(@ParametricNullness K key) {
            return this.delegate.ceilingKey(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> higherEntry(@ParametricNullness K key) {
            return Maps.unmodifiableOrNull(this.delegate.higherEntry(key));
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K higherKey(@ParametricNullness K key) {
            return this.delegate.higherKey(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> firstEntry() {
            return Maps.unmodifiableOrNull(this.delegate.firstEntry());
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> lastEntry() {
            return Maps.unmodifiableOrNull(this.delegate.lastEntry());
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public final Map.Entry<K, V> pollFirstEntry() {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public final Map.Entry<K, V> pollLastEntry() {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> descendingMap() {
            UnmodifiableNavigableMap<K, V> unmodifiableNavigableMap = this.descendingMap;
            if (unmodifiableNavigableMap != null) {
                return unmodifiableNavigableMap;
            }
            UnmodifiableNavigableMap<K, V> unmodifiableNavigableMap2 = new UnmodifiableNavigableMap<>(this.delegate.descendingMap(), this);
            this.descendingMap = unmodifiableNavigableMap2;
            return unmodifiableNavigableMap2;
        }

        @Override // com.google.common.collect.ForwardingMap, java.util.Map
        public Set<K> keySet() {
            return navigableKeySet();
        }

        @Override // java.util.NavigableMap
        public NavigableSet<K> navigableKeySet() {
            return Sets.unmodifiableNavigableSet(this.delegate.navigableKeySet());
        }

        @Override // java.util.NavigableMap
        public NavigableSet<K> descendingKeySet() {
            return Sets.unmodifiableNavigableSet(this.delegate.descendingKeySet());
        }

        @Override // com.google.common.collect.ForwardingSortedMap, java.util.SortedMap
        public SortedMap<K, V> subMap(@ParametricNullness K fromKey, @ParametricNullness K toKey) {
            return subMap(fromKey, true, toKey, false);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> subMap(@ParametricNullness K fromKey, boolean fromInclusive, @ParametricNullness K toKey, boolean toInclusive) {
            return Maps.unmodifiableNavigableMap(this.delegate.subMap(fromKey, fromInclusive, toKey, toInclusive));
        }

        @Override // com.google.common.collect.ForwardingSortedMap, java.util.SortedMap
        public SortedMap<K, V> headMap(@ParametricNullness K toKey) {
            return headMap(toKey, false);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> headMap(@ParametricNullness K toKey, boolean inclusive) {
            return Maps.unmodifiableNavigableMap(this.delegate.headMap(toKey, inclusive));
        }

        @Override // com.google.common.collect.ForwardingSortedMap, java.util.SortedMap
        public SortedMap<K, V> tailMap(@ParametricNullness K fromKey) {
            return tailMap(fromKey, true);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> tailMap(@ParametricNullness K fromKey, boolean inclusive) {
            return Maps.unmodifiableNavigableMap(this.delegate.tailMap(fromKey, inclusive));
        }
    }

    public static <K, V> NavigableMap<K, V> synchronizedNavigableMap(NavigableMap<K, V> navigableMap) {
        return Synchronized.navigableMap(navigableMap);
    }

    static abstract class ViewCachingAbstractMap<K, V> extends AbstractMap<K, V> {

        @CheckForNull
        @LazyInit
        private transient Set<Map.Entry<K, V>> entrySet;

        @CheckForNull
        @LazyInit
        private transient Set<K> keySet;

        @CheckForNull
        @LazyInit
        private transient Collection<V> values;

        abstract Set<Map.Entry<K, V>> createEntrySet();

        ViewCachingAbstractMap() {
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Set<Map.Entry<K, V>> entrySet() {
            Set<Map.Entry<K, V>> set = this.entrySet;
            if (set != null) {
                return set;
            }
            Set<Map.Entry<K, V>> setCreateEntrySet = createEntrySet();
            this.entrySet = setCreateEntrySet;
            return setCreateEntrySet;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Set<K> keySet() {
            Set<K> set = this.keySet;
            if (set != null) {
                return set;
            }
            Set<K> setCreateKeySet = createKeySet();
            this.keySet = setCreateKeySet;
            return setCreateKeySet;
        }

        Set<K> createKeySet() {
            return new KeySet(this);
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Collection<V> values() {
            Collection<V> collection = this.values;
            if (collection != null) {
                return collection;
            }
            Collection<V> collectionCreateValues = createValues();
            this.values = collectionCreateValues;
            return collectionCreateValues;
        }

        Collection<V> createValues() {
            return new Values(this);
        }
    }

    static abstract class IteratorBasedAbstractMap<K, V> extends AbstractMap<K, V> {
        abstract Iterator<Map.Entry<K, V>> entryIterator();

        @Override // java.util.AbstractMap, java.util.Map
        public abstract int size();

        IteratorBasedAbstractMap() {
        }

        @Override // java.util.AbstractMap, java.util.Map, java.util.SortedMap
        public Set<Map.Entry<K, V>> entrySet() {
            return new EntrySet<K, V>() { // from class: com.google.common.collect.Maps.IteratorBasedAbstractMap.1
                @Override // com.google.common.collect.Maps.EntrySet
                Map<K, V> map() {
                    return IteratorBasedAbstractMap.this;
                }

                @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
                public Iterator<Map.Entry<K, V>> iterator() {
                    return IteratorBasedAbstractMap.this.entryIterator();
                }
            };
        }

        @Override // java.util.AbstractMap, java.util.Map
        public void clear() {
            Iterators.clear(entryIterator());
        }
    }

    @CheckForNull
    static <V> V safeGet(Map<?, V> map, @CheckForNull Object key) {
        Preconditions.checkNotNull(map);
        try {
            return map.get(key);
        } catch (ClassCastException | NullPointerException unused) {
            return null;
        }
    }

    static boolean safeContainsKey(Map<?, ?> map, @CheckForNull Object key) {
        Preconditions.checkNotNull(map);
        try {
            return map.containsKey(key);
        } catch (ClassCastException | NullPointerException unused) {
            return false;
        }
    }

    @CheckForNull
    static <V> V safeRemove(Map<?, V> map, @CheckForNull Object key) {
        Preconditions.checkNotNull(map);
        try {
            return map.remove(key);
        } catch (ClassCastException | NullPointerException unused) {
            return null;
        }
    }

    static boolean containsKeyImpl(Map<?, ?> map, @CheckForNull Object key) {
        return Iterators.contains(keyIterator(map.entrySet().iterator()), key);
    }

    static boolean containsValueImpl(Map<?, ?> map, @CheckForNull Object value) {
        return Iterators.contains(valueIterator(map.entrySet().iterator()), value);
    }

    static <K, V> boolean containsEntryImpl(Collection<Map.Entry<K, V>> c, @CheckForNull Object o) {
        if (o instanceof Map.Entry) {
            return c.contains(unmodifiableEntry((Map.Entry) o));
        }
        return false;
    }

    static <K, V> boolean removeEntryImpl(Collection<Map.Entry<K, V>> c, @CheckForNull Object o) {
        if (o instanceof Map.Entry) {
            return c.remove(unmodifiableEntry((Map.Entry) o));
        }
        return false;
    }

    static boolean equalsImpl(Map<?, ?> map, @CheckForNull Object object) {
        if (map == object) {
            return true;
        }
        if (object instanceof Map) {
            return map.entrySet().equals(((Map) object).entrySet());
        }
        return false;
    }

    static String toStringImpl(Map<?, ?> map) {
        StringBuilder sbNewStringBuilderForCollection = Collections2.newStringBuilderForCollection(map.size());
        sbNewStringBuilderForCollection.append('{');
        boolean z = true;
        for (Map.Entry<?, ?> entry : map.entrySet()) {
            if (!z) {
                sbNewStringBuilderForCollection.append(", ");
            }
            sbNewStringBuilderForCollection.append(entry.getKey());
            sbNewStringBuilderForCollection.append('=');
            sbNewStringBuilderForCollection.append(entry.getValue());
            z = false;
        }
        sbNewStringBuilderForCollection.append('}');
        return sbNewStringBuilderForCollection.toString();
    }

    static <K, V> void putAllImpl(Map<K, V> self, Map<? extends K, ? extends V> map) {
        for (Map.Entry<? extends K, ? extends V> entry : map.entrySet()) {
            self.put(entry.getKey(), entry.getValue());
        }
    }

    static class KeySet<K, V> extends Sets.ImprovedAbstractSet<K> {
        final Map<K, V> map;

        KeySet(Map<K, V> map) {
            this.map = (Map) Preconditions.checkNotNull(map);
        }

        Map<K, V> map() {
            return this.map;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<K> iterator() {
            return Maps.keyIterator(map().entrySet().iterator());
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return map().size();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean isEmpty() {
            return map().isEmpty();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(@CheckForNull Object o) {
            return map().containsKey(o);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean remove(@CheckForNull Object o) {
            if (!contains(o)) {
                return false;
            }
            map().remove(o);
            return true;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public void clear() {
            map().clear();
        }
    }

    @CheckForNull
    static <K> K keyOrNull(@CheckForNull Map.Entry<K, ?> entry) {
        if (entry == null) {
            return null;
        }
        return entry.getKey();
    }

    @CheckForNull
    static <V> V valueOrNull(@CheckForNull Map.Entry<?, V> entry) {
        if (entry == null) {
            return null;
        }
        return entry.getValue();
    }

    static class SortedKeySet<K, V> extends KeySet<K, V> implements SortedSet<K> {
        SortedKeySet(SortedMap<K, V> map) {
            super(map);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.collect.Maps.KeySet
        public SortedMap<K, V> map() {
            return (SortedMap) super.map();
        }

        @Override // java.util.SortedSet
        @CheckForNull
        public Comparator<? super K> comparator() {
            return map().comparator();
        }

        public SortedSet<K> subSet(@ParametricNullness K fromElement, @ParametricNullness K toElement) {
            return new SortedKeySet(map().subMap(fromElement, toElement));
        }

        public SortedSet<K> headSet(@ParametricNullness K toElement) {
            return new SortedKeySet(map().headMap(toElement));
        }

        public SortedSet<K> tailSet(@ParametricNullness K fromElement) {
            return new SortedKeySet(map().tailMap(fromElement));
        }

        @Override // java.util.SortedSet
        @ParametricNullness
        public K first() {
            return map().firstKey();
        }

        @Override // java.util.SortedSet
        @ParametricNullness
        public K last() {
            return map().lastKey();
        }
    }

    static class NavigableKeySet<K, V> extends SortedKeySet<K, V> implements NavigableSet<K> {
        NavigableKeySet(NavigableMap<K, V> map) {
            super(map);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.collect.Maps.SortedKeySet, com.google.common.collect.Maps.KeySet
        public NavigableMap<K, V> map() {
            return (NavigableMap) this.map;
        }

        @Override // java.util.NavigableSet
        @CheckForNull
        public K lower(@ParametricNullness K e) {
            return map().lowerKey(e);
        }

        @Override // java.util.NavigableSet
        @CheckForNull
        public K floor(@ParametricNullness K e) {
            return map().floorKey(e);
        }

        @Override // java.util.NavigableSet
        @CheckForNull
        public K ceiling(@ParametricNullness K e) {
            return map().ceilingKey(e);
        }

        @Override // java.util.NavigableSet
        @CheckForNull
        public K higher(@ParametricNullness K e) {
            return map().higherKey(e);
        }

        @Override // java.util.NavigableSet
        @CheckForNull
        public K pollFirst() {
            return (K) Maps.keyOrNull(map().pollFirstEntry());
        }

        @Override // java.util.NavigableSet
        @CheckForNull
        public K pollLast() {
            return (K) Maps.keyOrNull(map().pollLastEntry());
        }

        @Override // java.util.NavigableSet
        public NavigableSet<K> descendingSet() {
            return map().descendingKeySet();
        }

        @Override // java.util.NavigableSet
        public Iterator<K> descendingIterator() {
            return descendingSet().iterator();
        }

        @Override // java.util.NavigableSet
        public NavigableSet<K> subSet(@ParametricNullness K fromElement, boolean fromInclusive, @ParametricNullness K toElement, boolean toInclusive) {
            return map().subMap(fromElement, fromInclusive, toElement, toInclusive).navigableKeySet();
        }

        @Override // com.google.common.collect.Maps.SortedKeySet, java.util.SortedSet, java.util.NavigableSet
        public SortedSet<K> subSet(@ParametricNullness K fromElement, @ParametricNullness K toElement) {
            return subSet(fromElement, true, toElement, false);
        }

        @Override // java.util.NavigableSet
        public NavigableSet<K> headSet(@ParametricNullness K toElement, boolean inclusive) {
            return map().headMap(toElement, inclusive).navigableKeySet();
        }

        @Override // com.google.common.collect.Maps.SortedKeySet, java.util.SortedSet, java.util.NavigableSet
        public SortedSet<K> headSet(@ParametricNullness K toElement) {
            return headSet(toElement, false);
        }

        @Override // java.util.NavigableSet
        public NavigableSet<K> tailSet(@ParametricNullness K fromElement, boolean inclusive) {
            return map().tailMap(fromElement, inclusive).navigableKeySet();
        }

        @Override // com.google.common.collect.Maps.SortedKeySet, java.util.SortedSet, java.util.NavigableSet
        public SortedSet<K> tailSet(@ParametricNullness K fromElement) {
            return tailSet(fromElement, true);
        }
    }

    static class Values<K, V> extends AbstractCollection<V> {
        final Map<K, V> map;

        Values(Map<K, V> map) {
            this.map = (Map) Preconditions.checkNotNull(map);
        }

        final Map<K, V> map() {
            return this.map;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
        public Iterator<V> iterator() {
            return Maps.valueIterator(map().entrySet().iterator());
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean remove(@CheckForNull Object o) {
            try {
                return super.remove(o);
            } catch (UnsupportedOperationException unused) {
                for (Map.Entry<K, V> entry : map().entrySet()) {
                    if (Objects.equal(o, entry.getValue())) {
                        map().remove(entry.getKey());
                        return true;
                    }
                }
                return false;
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean removeAll(Collection<?> c) {
            try {
                return super.removeAll((Collection) Preconditions.checkNotNull(c));
            } catch (UnsupportedOperationException unused) {
                HashSet hashSetNewHashSet = Sets.newHashSet();
                for (Map.Entry<K, V> entry : map().entrySet()) {
                    if (c.contains(entry.getValue())) {
                        hashSetNewHashSet.add(entry.getKey());
                    }
                }
                return map().keySet().removeAll(hashSetNewHashSet);
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean retainAll(Collection<?> c) {
            try {
                return super.retainAll((Collection) Preconditions.checkNotNull(c));
            } catch (UnsupportedOperationException unused) {
                HashSet hashSetNewHashSet = Sets.newHashSet();
                for (Map.Entry<K, V> entry : map().entrySet()) {
                    if (c.contains(entry.getValue())) {
                        hashSetNewHashSet.add(entry.getKey());
                    }
                }
                return map().keySet().retainAll(hashSetNewHashSet);
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public int size() {
            return map().size();
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean isEmpty() {
            return map().isEmpty();
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public boolean contains(@CheckForNull Object o) {
            return map().containsValue(o);
        }

        @Override // java.util.AbstractCollection, java.util.Collection
        public void clear() {
            map().clear();
        }
    }

    static abstract class EntrySet<K, V> extends Sets.ImprovedAbstractSet<Map.Entry<K, V>> {
        abstract Map<K, V> map();

        EntrySet() {
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return map().size();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public void clear() {
            map().clear();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(@CheckForNull Object o) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) o;
            Object key = entry.getKey();
            Object objSafeGet = Maps.safeGet(map(), key);
            if (Objects.equal(objSafeGet, entry.getValue())) {
                return objSafeGet != null || map().containsKey(key);
            }
            return false;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean isEmpty() {
            return map().isEmpty();
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean remove(@CheckForNull Object o) {
            if (contains(o) && (o instanceof Map.Entry)) {
                return map().keySet().remove(((Map.Entry) o).getKey());
            }
            return false;
        }

        @Override // com.google.common.collect.Sets.ImprovedAbstractSet, java.util.AbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean removeAll(Collection<?> c) {
            try {
                return super.removeAll((Collection) Preconditions.checkNotNull(c));
            } catch (UnsupportedOperationException unused) {
                return Sets.removeAllImpl(this, c.iterator());
            }
        }

        @Override // com.google.common.collect.Sets.ImprovedAbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean retainAll(Collection<?> c) {
            try {
                return super.retainAll((Collection) Preconditions.checkNotNull(c));
            } catch (UnsupportedOperationException unused) {
                HashSet hashSetNewHashSetWithExpectedSize = Sets.newHashSetWithExpectedSize(c.size());
                for (Object obj : c) {
                    if (contains(obj) && (obj instanceof Map.Entry)) {
                        hashSetNewHashSetWithExpectedSize.add(((Map.Entry) obj).getKey());
                    }
                }
                return map().keySet().retainAll(hashSetNewHashSetWithExpectedSize);
            }
        }
    }

    static abstract class DescendingMap<K, V> extends ForwardingMap<K, V> implements NavigableMap<K, V> {

        @CheckForNull
        @LazyInit
        private transient Comparator<? super K> comparator;

        @CheckForNull
        @LazyInit
        private transient Set<Map.Entry<K, V>> entrySet;

        @CheckForNull
        @LazyInit
        private transient NavigableSet<K> navigableKeySet;

        abstract Iterator<Map.Entry<K, V>> entryIterator();

        abstract NavigableMap<K, V> forward();

        DescendingMap() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.collect.ForwardingMap, com.google.common.collect.ForwardingObject
        public final Map<K, V> delegate() {
            return forward();
        }

        @Override // java.util.SortedMap
        public Comparator<? super K> comparator() {
            Comparator<? super K> comparator = this.comparator;
            if (comparator != null) {
                return comparator;
            }
            Comparator<? super K> comparator2 = forward().comparator();
            if (comparator2 == null) {
                comparator2 = Ordering.natural();
            }
            Ordering orderingReverse = reverse(comparator2);
            this.comparator = orderingReverse;
            return orderingReverse;
        }

        private static <T> Ordering<T> reverse(Comparator<T> forward) {
            return Ordering.from(forward).reverse();
        }

        @Override // java.util.SortedMap
        @ParametricNullness
        public K firstKey() {
            return forward().lastKey();
        }

        @Override // java.util.SortedMap
        @ParametricNullness
        public K lastKey() {
            return forward().firstKey();
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> lowerEntry(@ParametricNullness K key) {
            return forward().higherEntry(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K lowerKey(@ParametricNullness K key) {
            return forward().higherKey(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> floorEntry(@ParametricNullness K key) {
            return forward().ceilingEntry(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K floorKey(@ParametricNullness K key) {
            return forward().ceilingKey(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> ceilingEntry(@ParametricNullness K key) {
            return forward().floorEntry(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K ceilingKey(@ParametricNullness K key) {
            return forward().floorKey(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> higherEntry(@ParametricNullness K key) {
            return forward().lowerEntry(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public K higherKey(@ParametricNullness K key) {
            return forward().lowerKey(key);
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> firstEntry() {
            return forward().lastEntry();
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> lastEntry() {
            return forward().firstEntry();
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> pollFirstEntry() {
            return forward().pollLastEntry();
        }

        @Override // java.util.NavigableMap
        @CheckForNull
        public Map.Entry<K, V> pollLastEntry() {
            return forward().pollFirstEntry();
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> descendingMap() {
            return forward();
        }

        @Override // com.google.common.collect.ForwardingMap, java.util.Map
        public Set<Map.Entry<K, V>> entrySet() {
            Set<Map.Entry<K, V>> set = this.entrySet;
            if (set != null) {
                return set;
            }
            Set<Map.Entry<K, V>> setCreateEntrySet = createEntrySet();
            this.entrySet = setCreateEntrySet;
            return setCreateEntrySet;
        }

        Set<Map.Entry<K, V>> createEntrySet() {
            return new EntrySet<K, V>() { // from class: com.google.common.collect.Maps.DescendingMap.1EntrySetImpl
                @Override // com.google.common.collect.Maps.EntrySet
                Map<K, V> map() {
                    return DescendingMap.this;
                }

                @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
                public Iterator<Map.Entry<K, V>> iterator() {
                    return DescendingMap.this.entryIterator();
                }
            };
        }

        @Override // com.google.common.collect.ForwardingMap, java.util.Map
        public Set<K> keySet() {
            return navigableKeySet();
        }

        @Override // java.util.NavigableMap
        public NavigableSet<K> navigableKeySet() {
            NavigableSet<K> navigableSet = this.navigableKeySet;
            if (navigableSet != null) {
                return navigableSet;
            }
            NavigableKeySet navigableKeySet = new NavigableKeySet(this);
            this.navigableKeySet = navigableKeySet;
            return navigableKeySet;
        }

        @Override // java.util.NavigableMap
        public NavigableSet<K> descendingKeySet() {
            return forward().navigableKeySet();
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> subMap(@ParametricNullness K fromKey, boolean fromInclusive, @ParametricNullness K toKey, boolean toInclusive) {
            return forward().subMap(toKey, toInclusive, fromKey, fromInclusive).descendingMap();
        }

        @Override // java.util.NavigableMap, java.util.SortedMap
        public SortedMap<K, V> subMap(@ParametricNullness K fromKey, @ParametricNullness K toKey) {
            return subMap(fromKey, true, toKey, false);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> headMap(@ParametricNullness K toKey, boolean inclusive) {
            return forward().tailMap(toKey, inclusive).descendingMap();
        }

        @Override // java.util.NavigableMap, java.util.SortedMap
        public SortedMap<K, V> headMap(@ParametricNullness K toKey) {
            return headMap(toKey, false);
        }

        @Override // java.util.NavigableMap
        public NavigableMap<K, V> tailMap(@ParametricNullness K fromKey, boolean inclusive) {
            return forward().headMap(fromKey, inclusive).descendingMap();
        }

        @Override // java.util.NavigableMap, java.util.SortedMap
        public SortedMap<K, V> tailMap(@ParametricNullness K fromKey) {
            return tailMap(fromKey, true);
        }

        @Override // com.google.common.collect.ForwardingMap, java.util.Map
        public Collection<V> values() {
            return new Values(this);
        }

        @Override // com.google.common.collect.ForwardingObject
        public String toString() {
            return standardToString();
        }
    }

    static <E> ImmutableMap<E, Integer> indexMap(Collection<E> list) {
        ImmutableMap.Builder builder = new ImmutableMap.Builder(list.size());
        Iterator<E> it = list.iterator();
        int i = 0;
        while (it.hasNext()) {
            builder.put(it.next(), Integer.valueOf(i));
            i++;
        }
        return builder.buildOrThrow();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <K extends Comparable<? super K>, V> NavigableMap<K, V> subMap(NavigableMap<K, V> map, Range<K> range) {
        if (map.comparator() != null && map.comparator() != Ordering.natural() && range.hasLowerBound() && range.hasUpperBound()) {
            Preconditions.checkArgument(map.comparator().compare(range.lowerEndpoint(), range.upperEndpoint()) <= 0, "map is using a custom comparator which is inconsistent with the natural ordering.");
        }
        if (range.hasLowerBound() && range.hasUpperBound()) {
            return map.subMap(range.lowerEndpoint(), range.lowerBoundType() == BoundType.CLOSED, range.upperEndpoint(), range.upperBoundType() == BoundType.CLOSED);
        }
        if (range.hasLowerBound()) {
            return map.tailMap(range.lowerEndpoint(), range.lowerBoundType() == BoundType.CLOSED);
        }
        if (range.hasUpperBound()) {
            return map.headMap(range.upperEndpoint(), range.upperBoundType() == BoundType.CLOSED);
        }
        return (NavigableMap) Preconditions.checkNotNull(map);
    }
}
