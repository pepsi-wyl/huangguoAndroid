package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.collect.Sets;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Arrays;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class LinkedHashMultimap<K, V> extends LinkedHashMultimapGwtSerializationDependencies<K, V> {
    private static final int DEFAULT_KEY_CAPACITY = 16;
    private static final int DEFAULT_VALUE_SET_CAPACITY = 2;
    static final double VALUE_SET_LOAD_FACTOR = 1.0d;
    private static final long serialVersionUID = 1;
    private transient ValueEntry<K, V> multimapHeaderEntry;
    transient int valueSetCapacity;

    private interface ValueSetLink<K, V> {
        ValueSetLink<K, V> getPredecessorInValueSet();

        ValueSetLink<K, V> getSuccessorInValueSet();

        void setPredecessorInValueSet(ValueSetLink<K, V> entry);

        void setSuccessorInValueSet(ValueSetLink<K, V> entry);
    }

    @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap, com.google.common.collect.ListMultimap
    public /* bridge */ /* synthetic */ Map asMap() {
        return super.asMap();
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ boolean containsEntry(@CheckForNull Object key, @CheckForNull Object value) {
        return super.containsEntry(key, value);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ boolean containsKey(@CheckForNull Object key) {
        return super.containsKey(key);
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ boolean containsValue(@CheckForNull Object value) {
        return super.containsValue(value);
    }

    @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap, com.google.common.collect.ListMultimap
    public /* bridge */ /* synthetic */ boolean equals(@CheckForNull Object object) {
        return super.equals(object);
    }

    @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ Set get(@ParametricNullness Object key) {
        return super.get(key);
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ int hashCode() {
        return super.hashCode();
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ boolean isEmpty() {
        return super.isEmpty();
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ Multiset keys() {
        return super.keys();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ boolean put(@ParametricNullness Object key, @ParametricNullness Object value) {
        return super.put(key, value);
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ boolean putAll(Multimap multimap) {
        return super.putAll(multimap);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ boolean putAll(@ParametricNullness Object key, Iterable values) {
        return super.putAll(key, values);
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ boolean remove(@CheckForNull Object key, @CheckForNull Object value) {
        return super.remove(key, value);
    }

    @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ Set removeAll(@CheckForNull Object key) {
        return super.removeAll(key);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ Collection replaceValues(@ParametricNullness Object key, Iterable values) {
        return replaceValues((LinkedHashMultimap<K, V>) key, values);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* synthetic */ int size() {
        return super.size();
    }

    @Override // com.google.common.collect.AbstractMultimap
    public /* bridge */ /* synthetic */ String toString() {
        return super.toString();
    }

    public static <K, V> LinkedHashMultimap<K, V> create() {
        return new LinkedHashMultimap<>(16, 2);
    }

    public static <K, V> LinkedHashMultimap<K, V> create(int expectedKeys, int expectedValuesPerKey) {
        return new LinkedHashMultimap<>(Maps.capacity(expectedKeys), Maps.capacity(expectedValuesPerKey));
    }

    public static <K, V> LinkedHashMultimap<K, V> create(Multimap<? extends K, ? extends V> multimap) {
        LinkedHashMultimap<K, V> linkedHashMultimapCreate = create(multimap.keySet().size(), 2);
        linkedHashMultimapCreate.putAll(multimap);
        return linkedHashMultimapCreate;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <K, V> void succeedsInValueSet(ValueSetLink<K, V> pred, ValueSetLink<K, V> succ) {
        pred.setSuccessorInValueSet(succ);
        succ.setPredecessorInValueSet(pred);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <K, V> void succeedsInMultimap(ValueEntry<K, V> pred, ValueEntry<K, V> succ) {
        pred.setSuccessorInMultimap(succ);
        succ.setPredecessorInMultimap(pred);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <K, V> void deleteFromValueSet(ValueSetLink<K, V> entry) {
        succeedsInValueSet(entry.getPredecessorInValueSet(), entry.getSuccessorInValueSet());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static <K, V> void deleteFromMultimap(ValueEntry<K, V> entry) {
        succeedsInMultimap(entry.getPredecessorInMultimap(), entry.getSuccessorInMultimap());
    }

    static final class ValueEntry<K, V> extends ImmutableEntry<K, V> implements ValueSetLink<K, V> {

        @CheckForNull
        ValueEntry<K, V> nextInValueBucket;

        @CheckForNull
        private ValueEntry<K, V> predecessorInMultimap;

        @CheckForNull
        private ValueSetLink<K, V> predecessorInValueSet;
        final int smearedValueHash;

        @CheckForNull
        private ValueEntry<K, V> successorInMultimap;

        @CheckForNull
        private ValueSetLink<K, V> successorInValueSet;

        ValueEntry(@ParametricNullness K key, @ParametricNullness V value, int smearedValueHash, @CheckForNull ValueEntry<K, V> nextInValueBucket) {
            super(key, value);
            this.smearedValueHash = smearedValueHash;
            this.nextInValueBucket = nextInValueBucket;
        }

        static <K, V> ValueEntry<K, V> newHeader() {
            return new ValueEntry<>(null, null, 0, null);
        }

        boolean matchesValue(@CheckForNull Object v, int smearedVHash) {
            return this.smearedValueHash == smearedVHash && Objects.equal(getValue(), v);
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public ValueSetLink<K, V> getPredecessorInValueSet() {
            return (ValueSetLink) java.util.Objects.requireNonNull(this.predecessorInValueSet);
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public ValueSetLink<K, V> getSuccessorInValueSet() {
            return (ValueSetLink) java.util.Objects.requireNonNull(this.successorInValueSet);
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public void setPredecessorInValueSet(ValueSetLink<K, V> entry) {
            this.predecessorInValueSet = entry;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public void setSuccessorInValueSet(ValueSetLink<K, V> entry) {
            this.successorInValueSet = entry;
        }

        public ValueEntry<K, V> getPredecessorInMultimap() {
            return (ValueEntry) java.util.Objects.requireNonNull(this.predecessorInMultimap);
        }

        public ValueEntry<K, V> getSuccessorInMultimap() {
            return (ValueEntry) java.util.Objects.requireNonNull(this.successorInMultimap);
        }

        public void setSuccessorInMultimap(ValueEntry<K, V> multimapSuccessor) {
            this.successorInMultimap = multimapSuccessor;
        }

        public void setPredecessorInMultimap(ValueEntry<K, V> multimapPredecessor) {
            this.predecessorInMultimap = multimapPredecessor;
        }
    }

    private LinkedHashMultimap(int keyCapacity, int valueSetCapacity) {
        super(Platform.newLinkedHashMapWithExpectedSize(keyCapacity));
        this.valueSetCapacity = 2;
        CollectPreconditions.checkNonnegative(valueSetCapacity, "expectedValuesPerKey");
        this.valueSetCapacity = valueSetCapacity;
        ValueEntry<K, V> valueEntryNewHeader = ValueEntry.newHeader();
        this.multimapHeaderEntry = valueEntryNewHeader;
        succeedsInMultimap(valueEntryNewHeader, valueEntryNewHeader);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMapBasedMultimap
    public Set<V> createCollection() {
        return Platform.newLinkedHashSetWithExpectedSize(this.valueSetCapacity);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    Collection<V> createCollection(@ParametricNullness K key) {
        return new ValueSet(key, this.valueSetCapacity);
    }

    @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public Set<V> replaceValues(@ParametricNullness K key, Iterable<? extends V> values) {
        return super.replaceValues((Object) key, (Iterable) values);
    }

    @Override // com.google.common.collect.AbstractSetMultimap, com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public Set<Map.Entry<K, V>> entries() {
        return super.entries();
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public Set<K> keySet() {
        return super.keySet();
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public Collection<V> values() {
        return super.values();
    }

    final class ValueSet extends Sets.ImprovedAbstractSet<V> implements ValueSetLink<K, V> {
        ValueEntry<K, V>[] hashTable;

        @ParametricNullness
        private final K key;
        private int size = 0;
        private int modCount = 0;
        private ValueSetLink<K, V> firstEntry = this;
        private ValueSetLink<K, V> lastEntry = this;

        ValueSet(@ParametricNullness K key, int expectedValues) {
            this.key = key;
            this.hashTable = new ValueEntry[Hashing.closedTableSize(expectedValues, LinkedHashMultimap.VALUE_SET_LOAD_FACTOR)];
        }

        private int mask() {
            return this.hashTable.length - 1;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public ValueSetLink<K, V> getPredecessorInValueSet() {
            return this.lastEntry;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public ValueSetLink<K, V> getSuccessorInValueSet() {
            return this.firstEntry;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public void setPredecessorInValueSet(ValueSetLink<K, V> entry) {
            this.lastEntry = entry;
        }

        @Override // com.google.common.collect.LinkedHashMultimap.ValueSetLink
        public void setSuccessorInValueSet(ValueSetLink<K, V> entry) {
            this.firstEntry = entry;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<V> iterator() {
            return new Iterator<V>() { // from class: com.google.common.collect.LinkedHashMultimap.ValueSet.1
                int expectedModCount;
                ValueSetLink<K, V> nextEntry;

                @CheckForNull
                ValueEntry<K, V> toRemove;

                {
                    this.nextEntry = ValueSet.this.firstEntry;
                    this.expectedModCount = ValueSet.this.modCount;
                }

                private void checkForComodification() {
                    if (ValueSet.this.modCount != this.expectedModCount) {
                        throw new ConcurrentModificationException();
                    }
                }

                @Override // java.util.Iterator
                public boolean hasNext() {
                    checkForComodification();
                    return this.nextEntry != ValueSet.this;
                }

                @Override // java.util.Iterator
                @ParametricNullness
                public V next() {
                    if (!hasNext()) {
                        throw new NoSuchElementException();
                    }
                    ValueEntry<K, V> valueEntry = (ValueEntry) this.nextEntry;
                    V value = valueEntry.getValue();
                    this.toRemove = valueEntry;
                    this.nextEntry = valueEntry.getSuccessorInValueSet();
                    return value;
                }

                @Override // java.util.Iterator
                public void remove() {
                    checkForComodification();
                    Preconditions.checkState(this.toRemove != null, "no calls to next() since the last call to remove()");
                    ValueSet.this.remove(this.toRemove.getValue());
                    this.expectedModCount = ValueSet.this.modCount;
                    this.toRemove = null;
                }
            };
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return this.size;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(@CheckForNull Object o) {
            int iSmearedHash = Hashing.smearedHash(o);
            for (ValueEntry<K, V> valueEntry = this.hashTable[mask() & iSmearedHash]; valueEntry != null; valueEntry = valueEntry.nextInValueBucket) {
                if (valueEntry.matchesValue(o, iSmearedHash)) {
                    return true;
                }
            }
            return false;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean add(@ParametricNullness V value) {
            int iSmearedHash = Hashing.smearedHash(value);
            int iMask = mask() & iSmearedHash;
            ValueEntry<K, V> valueEntry = this.hashTable[iMask];
            for (ValueEntry<K, V> valueEntry2 = valueEntry; valueEntry2 != null; valueEntry2 = valueEntry2.nextInValueBucket) {
                if (valueEntry2.matchesValue(value, iSmearedHash)) {
                    return false;
                }
            }
            ValueEntry<K, V> valueEntry3 = new ValueEntry<>(this.key, value, iSmearedHash, valueEntry);
            LinkedHashMultimap.succeedsInValueSet(this.lastEntry, valueEntry3);
            LinkedHashMultimap.succeedsInValueSet(valueEntry3, this);
            LinkedHashMultimap.succeedsInMultimap(LinkedHashMultimap.this.multimapHeaderEntry.getPredecessorInMultimap(), valueEntry3);
            LinkedHashMultimap.succeedsInMultimap(valueEntry3, LinkedHashMultimap.this.multimapHeaderEntry);
            this.hashTable[iMask] = valueEntry3;
            this.size++;
            this.modCount++;
            rehashIfNecessary();
            return true;
        }

        private void rehashIfNecessary() {
            if (Hashing.needsResizing(this.size, this.hashTable.length, LinkedHashMultimap.VALUE_SET_LOAD_FACTOR)) {
                int length = this.hashTable.length * 2;
                ValueEntry<K, V>[] valueEntryArr = new ValueEntry[length];
                this.hashTable = valueEntryArr;
                int i = length - 1;
                for (ValueSetLink<K, V> successorInValueSet = this.firstEntry; successorInValueSet != this; successorInValueSet = successorInValueSet.getSuccessorInValueSet()) {
                    ValueEntry<K, V> valueEntry = (ValueEntry) successorInValueSet;
                    int i2 = valueEntry.smearedValueHash & i;
                    valueEntry.nextInValueBucket = valueEntryArr[i2];
                    valueEntryArr[i2] = valueEntry;
                }
            }
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean remove(@CheckForNull Object o) {
            int iSmearedHash = Hashing.smearedHash(o);
            int iMask = mask() & iSmearedHash;
            ValueEntry<K, V> valueEntry = null;
            for (ValueEntry<K, V> valueEntry2 = this.hashTable[iMask]; valueEntry2 != null; valueEntry2 = valueEntry2.nextInValueBucket) {
                if (valueEntry2.matchesValue(o, iSmearedHash)) {
                    if (valueEntry == null) {
                        this.hashTable[iMask] = valueEntry2.nextInValueBucket;
                    } else {
                        valueEntry.nextInValueBucket = valueEntry2.nextInValueBucket;
                    }
                    LinkedHashMultimap.deleteFromValueSet(valueEntry2);
                    LinkedHashMultimap.deleteFromMultimap(valueEntry2);
                    this.size--;
                    this.modCount++;
                    return true;
                }
                valueEntry = valueEntry2;
            }
            return false;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public void clear() {
            Arrays.fill(this.hashTable, (Object) null);
            this.size = 0;
            for (ValueSetLink<K, V> successorInValueSet = this.firstEntry; successorInValueSet != this; successorInValueSet = successorInValueSet.getSuccessorInValueSet()) {
                LinkedHashMultimap.deleteFromMultimap((ValueEntry) successorInValueSet);
            }
            LinkedHashMultimap.succeedsInValueSet(this, this);
            this.modCount++;
        }
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap
    Iterator<Map.Entry<K, V>> entryIterator() {
        return new Iterator<Map.Entry<K, V>>() { // from class: com.google.common.collect.LinkedHashMultimap.1
            ValueEntry<K, V> nextEntry;

            @CheckForNull
            ValueEntry<K, V> toRemove;

            {
                this.nextEntry = LinkedHashMultimap.this.multimapHeaderEntry.getSuccessorInMultimap();
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.nextEntry != LinkedHashMultimap.this.multimapHeaderEntry;
            }

            @Override // java.util.Iterator
            public Map.Entry<K, V> next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                ValueEntry<K, V> valueEntry = this.nextEntry;
                this.toRemove = valueEntry;
                this.nextEntry = valueEntry.getSuccessorInMultimap();
                return valueEntry;
            }

            @Override // java.util.Iterator
            public void remove() {
                Preconditions.checkState(this.toRemove != null, "no calls to next() since the last call to remove()");
                LinkedHashMultimap.this.remove(this.toRemove.getKey(), this.toRemove.getValue());
                this.toRemove = null;
            }
        };
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap
    Iterator<V> valueIterator() {
        return Maps.valueIterator(entryIterator());
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public void clear() {
        super.clear();
        ValueEntry<K, V> valueEntry = this.multimapHeaderEntry;
        succeedsInMultimap(valueEntry, valueEntry);
    }

    private void writeObject(ObjectOutputStream stream) throws IOException {
        stream.defaultWriteObject();
        stream.writeInt(keySet().size());
        Iterator<K> it = keySet().iterator();
        while (it.hasNext()) {
            stream.writeObject(it.next());
        }
        stream.writeInt(size());
        for (Map.Entry<K, V> entry : entries()) {
            stream.writeObject(entry.getKey());
            stream.writeObject(entry.getValue());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void readObject(ObjectInputStream stream) throws ClassNotFoundException, IOException {
        stream.defaultReadObject();
        ValueEntry<K, V> valueEntryNewHeader = ValueEntry.newHeader();
        this.multimapHeaderEntry = valueEntryNewHeader;
        succeedsInMultimap(valueEntryNewHeader, valueEntryNewHeader);
        this.valueSetCapacity = 2;
        int i = stream.readInt();
        Map mapNewLinkedHashMapWithExpectedSize = Platform.newLinkedHashMapWithExpectedSize(12);
        for (int i2 = 0; i2 < i; i2++) {
            Object object = stream.readObject();
            mapNewLinkedHashMapWithExpectedSize.put(object, createCollection(object));
        }
        int i3 = stream.readInt();
        for (int i4 = 0; i4 < i3; i4++) {
            Object object2 = stream.readObject();
            ((Collection) java.util.Objects.requireNonNull((Collection) mapNewLinkedHashMapWithExpectedSize.get(object2))).add(stream.readObject());
        }
        setMap(mapNewLinkedHashMapWithExpectedSize);
    }
}
