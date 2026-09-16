package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import java.util.AbstractMap;
import java.util.Arrays;
import java.util.Map;
import java.util.Objects;
import javax.annotation.CheckForNull;
import kotlin.UShort;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class RegularImmutableMap<K, V> extends ImmutableMap<K, V> {
    private static final byte ABSENT = -1;
    private static final int BYTE_MASK = 255;
    private static final int BYTE_MAX_SIZE = 128;
    static final ImmutableMap<Object, Object> EMPTY = new RegularImmutableMap(null, new Object[0], 0);
    private static final int SHORT_MASK = 65535;
    private static final int SHORT_MAX_SIZE = 32768;
    private static final long serialVersionUID = 0;
    final transient Object[] alternatingKeysAndValues;

    @CheckForNull
    private final transient Object hashTable;
    private final transient int size;

    @Override // com.google.common.collect.ImmutableMap
    boolean isPartialView() {
        return false;
    }

    static <K, V> RegularImmutableMap<K, V> create(int n, Object[] alternatingKeysAndValues) {
        return create(n, alternatingKeysAndValues, null);
    }

    static <K, V> RegularImmutableMap<K, V> create(int n, Object[] alternatingKeysAndValues, ImmutableMap.Builder<K, V> builder) {
        if (n == 0) {
            return (RegularImmutableMap) EMPTY;
        }
        if (n == 1) {
            CollectPreconditions.checkEntryNotNull(Objects.requireNonNull(alternatingKeysAndValues[0]), Objects.requireNonNull(alternatingKeysAndValues[1]));
            return new RegularImmutableMap<>(null, alternatingKeysAndValues, 1);
        }
        Preconditions.checkPositionIndex(n, alternatingKeysAndValues.length >> 1);
        Object objCreateHashTable = createHashTable(alternatingKeysAndValues, n, ImmutableSet.chooseTableSize(n), 0);
        if (objCreateHashTable instanceof Object[]) {
            Object[] objArr = (Object[]) objCreateHashTable;
            ImmutableMap.Builder.DuplicateKey duplicateKey = (ImmutableMap.Builder.DuplicateKey) objArr[2];
            if (builder == null) {
                throw duplicateKey.exception();
            }
            builder.duplicateKey = duplicateKey;
            Object obj = objArr[0];
            int iIntValue = ((Integer) objArr[1]).intValue();
            alternatingKeysAndValues = Arrays.copyOf(alternatingKeysAndValues, iIntValue * 2);
            objCreateHashTable = obj;
            n = iIntValue;
        }
        return new RegularImmutableMap<>(objCreateHashTable, alternatingKeysAndValues, n);
    }

    @CheckForNull
    private static Object createHashTable(Object[] alternatingKeysAndValues, int n, int tableSize, int keyOffset) {
        ImmutableMap.Builder.DuplicateKey duplicateKey = null;
        if (n == 1) {
            CollectPreconditions.checkEntryNotNull(Objects.requireNonNull(alternatingKeysAndValues[keyOffset]), Objects.requireNonNull(alternatingKeysAndValues[keyOffset ^ 1]));
            return null;
        }
        int i = tableSize - 1;
        int i2 = -1;
        if (tableSize <= 128) {
            byte[] bArr = new byte[tableSize];
            Arrays.fill(bArr, (byte) -1);
            int i3 = 0;
            for (int i4 = 0; i4 < n; i4++) {
                int i5 = (i4 * 2) + keyOffset;
                int i6 = (i3 * 2) + keyOffset;
                Object objRequireNonNull = Objects.requireNonNull(alternatingKeysAndValues[i5]);
                Object objRequireNonNull2 = Objects.requireNonNull(alternatingKeysAndValues[i5 ^ 1]);
                CollectPreconditions.checkEntryNotNull(objRequireNonNull, objRequireNonNull2);
                int iSmear = Hashing.smear(objRequireNonNull.hashCode());
                while (true) {
                    int i7 = iSmear & i;
                    int i8 = bArr[i7] & 255;
                    if (i8 == 255) {
                        bArr[i7] = (byte) i6;
                        if (i3 < i4) {
                            alternatingKeysAndValues[i6] = objRequireNonNull;
                            alternatingKeysAndValues[i6 ^ 1] = objRequireNonNull2;
                        }
                        i3++;
                    } else {
                        if (objRequireNonNull.equals(alternatingKeysAndValues[i8])) {
                            int i9 = i8 ^ 1;
                            duplicateKey = new ImmutableMap.Builder.DuplicateKey(objRequireNonNull, objRequireNonNull2, Objects.requireNonNull(alternatingKeysAndValues[i9]));
                            alternatingKeysAndValues[i9] = objRequireNonNull2;
                            break;
                        }
                        iSmear = i7 + 1;
                    }
                }
            }
            return i3 == n ? bArr : new Object[]{bArr, Integer.valueOf(i3), duplicateKey};
        }
        if (tableSize <= 32768) {
            short[] sArr = new short[tableSize];
            Arrays.fill(sArr, (short) -1);
            int i10 = 0;
            for (int i11 = 0; i11 < n; i11++) {
                int i12 = (i11 * 2) + keyOffset;
                int i13 = (i10 * 2) + keyOffset;
                Object objRequireNonNull3 = Objects.requireNonNull(alternatingKeysAndValues[i12]);
                Object objRequireNonNull4 = Objects.requireNonNull(alternatingKeysAndValues[i12 ^ 1]);
                CollectPreconditions.checkEntryNotNull(objRequireNonNull3, objRequireNonNull4);
                int iSmear2 = Hashing.smear(objRequireNonNull3.hashCode());
                while (true) {
                    int i14 = iSmear2 & i;
                    int i15 = sArr[i14] & UShort.MAX_VALUE;
                    if (i15 == 65535) {
                        sArr[i14] = (short) i13;
                        if (i10 < i11) {
                            alternatingKeysAndValues[i13] = objRequireNonNull3;
                            alternatingKeysAndValues[i13 ^ 1] = objRequireNonNull4;
                        }
                        i10++;
                    } else {
                        if (objRequireNonNull3.equals(alternatingKeysAndValues[i15])) {
                            int i16 = i15 ^ 1;
                            duplicateKey = new ImmutableMap.Builder.DuplicateKey(objRequireNonNull3, objRequireNonNull4, Objects.requireNonNull(alternatingKeysAndValues[i16]));
                            alternatingKeysAndValues[i16] = objRequireNonNull4;
                            break;
                        }
                        iSmear2 = i14 + 1;
                    }
                }
            }
            return i10 == n ? sArr : new Object[]{sArr, Integer.valueOf(i10), duplicateKey};
        }
        int[] iArr = new int[tableSize];
        Arrays.fill(iArr, -1);
        int i17 = 0;
        int i18 = 0;
        while (i17 < n) {
            int i19 = (i17 * 2) + keyOffset;
            int i20 = (i18 * 2) + keyOffset;
            Object objRequireNonNull5 = Objects.requireNonNull(alternatingKeysAndValues[i19]);
            Object objRequireNonNull6 = Objects.requireNonNull(alternatingKeysAndValues[i19 ^ 1]);
            CollectPreconditions.checkEntryNotNull(objRequireNonNull5, objRequireNonNull6);
            int iSmear3 = Hashing.smear(objRequireNonNull5.hashCode());
            while (true) {
                int i21 = iSmear3 & i;
                int i22 = iArr[i21];
                if (i22 == i2) {
                    iArr[i21] = i20;
                    if (i18 < i17) {
                        alternatingKeysAndValues[i20] = objRequireNonNull5;
                        alternatingKeysAndValues[i20 ^ 1] = objRequireNonNull6;
                    }
                    i18++;
                } else {
                    if (objRequireNonNull5.equals(alternatingKeysAndValues[i22])) {
                        int i23 = i22 ^ 1;
                        duplicateKey = new ImmutableMap.Builder.DuplicateKey(objRequireNonNull5, objRequireNonNull6, Objects.requireNonNull(alternatingKeysAndValues[i23]));
                        alternatingKeysAndValues[i23] = objRequireNonNull6;
                        break;
                    }
                    iSmear3 = i21 + 1;
                    i2 = -1;
                }
            }
            i17++;
            i2 = -1;
        }
        return i18 == n ? iArr : new Object[]{iArr, Integer.valueOf(i18), duplicateKey};
    }

    @CheckForNull
    static Object createHashTableOrThrow(Object[] alternatingKeysAndValues, int n, int tableSize, int keyOffset) {
        Object objCreateHashTable = createHashTable(alternatingKeysAndValues, n, tableSize, keyOffset);
        if (objCreateHashTable instanceof Object[]) {
            throw ((ImmutableMap.Builder.DuplicateKey) ((Object[]) objCreateHashTable)[2]).exception();
        }
        return objCreateHashTable;
    }

    private RegularImmutableMap(@CheckForNull Object hashTable, Object[] alternatingKeysAndValues, int size) {
        this.hashTable = hashTable;
        this.alternatingKeysAndValues = alternatingKeysAndValues;
        this.size = size;
    }

    @Override // java.util.Map
    public int size() {
        return this.size;
    }

    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    @CheckForNull
    public V get(@CheckForNull Object obj) {
        V v = (V) get(this.hashTable, this.alternatingKeysAndValues, this.size, 0, obj);
        if (v == null) {
            return null;
        }
        return v;
    }

    @CheckForNull
    static Object get(@CheckForNull Object hashTableObject, Object[] alternatingKeysAndValues, int size, int keyOffset, @CheckForNull Object key) {
        if (key == null) {
            return null;
        }
        if (size == 1) {
            if (Objects.requireNonNull(alternatingKeysAndValues[keyOffset]).equals(key)) {
                return Objects.requireNonNull(alternatingKeysAndValues[keyOffset ^ 1]);
            }
            return null;
        }
        if (hashTableObject == null) {
            return null;
        }
        if (hashTableObject instanceof byte[]) {
            byte[] bArr = (byte[]) hashTableObject;
            int length = bArr.length - 1;
            int iSmear = Hashing.smear(key.hashCode());
            while (true) {
                int i = iSmear & length;
                int i2 = bArr[i] & 255;
                if (i2 == 255) {
                    return null;
                }
                if (key.equals(alternatingKeysAndValues[i2])) {
                    return alternatingKeysAndValues[i2 ^ 1];
                }
                iSmear = i + 1;
            }
        } else if (hashTableObject instanceof short[]) {
            short[] sArr = (short[]) hashTableObject;
            int length2 = sArr.length - 1;
            int iSmear2 = Hashing.smear(key.hashCode());
            while (true) {
                int i3 = iSmear2 & length2;
                int i4 = sArr[i3] & UShort.MAX_VALUE;
                if (i4 == 65535) {
                    return null;
                }
                if (key.equals(alternatingKeysAndValues[i4])) {
                    return alternatingKeysAndValues[i4 ^ 1];
                }
                iSmear2 = i3 + 1;
            }
        } else {
            int[] iArr = (int[]) hashTableObject;
            int length3 = iArr.length - 1;
            int iSmear3 = Hashing.smear(key.hashCode());
            while (true) {
                int i5 = iSmear3 & length3;
                int i6 = iArr[i5];
                if (i6 == -1) {
                    return null;
                }
                if (key.equals(alternatingKeysAndValues[i6])) {
                    return alternatingKeysAndValues[i6 ^ 1];
                }
                iSmear3 = i5 + 1;
            }
        }
    }

    @Override // com.google.common.collect.ImmutableMap
    ImmutableSet<Map.Entry<K, V>> createEntrySet() {
        return new EntrySet(this, this.alternatingKeysAndValues, 0, this.size);
    }

    static class EntrySet<K, V> extends ImmutableSet<Map.Entry<K, V>> {
        private final transient Object[] alternatingKeysAndValues;
        private final transient int keyOffset;
        private final transient ImmutableMap<K, V> map;
        private final transient int size;

        @Override // com.google.common.collect.ImmutableCollection
        boolean isPartialView() {
            return true;
        }

        EntrySet(ImmutableMap<K, V> map, Object[] alternatingKeysAndValues, int keyOffset, int size) {
            this.map = map;
            this.alternatingKeysAndValues = alternatingKeysAndValues;
            this.keyOffset = keyOffset;
            this.size = size;
        }

        @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set, java.util.NavigableSet, com.google.common.collect.SortedIterable
        public UnmodifiableIterator<Map.Entry<K, V>> iterator() {
            return asList().iterator();
        }

        @Override // com.google.common.collect.ImmutableCollection
        int copyIntoArray(Object[] dst, int offset) {
            return asList().copyIntoArray(dst, offset);
        }

        @Override // com.google.common.collect.ImmutableSet
        ImmutableList<Map.Entry<K, V>> createAsList() {
            return new ImmutableList<Map.Entry<K, V>>() { // from class: com.google.common.collect.RegularImmutableMap.EntrySet.1
                @Override // com.google.common.collect.ImmutableCollection
                public boolean isPartialView() {
                    return true;
                }

                @Override // java.util.List
                public Map.Entry<K, V> get(int index) {
                    Preconditions.checkElementIndex(index, EntrySet.this.size);
                    int i = index * 2;
                    return new AbstractMap.SimpleImmutableEntry(Objects.requireNonNull(EntrySet.this.alternatingKeysAndValues[EntrySet.this.keyOffset + i]), Objects.requireNonNull(EntrySet.this.alternatingKeysAndValues[i + (EntrySet.this.keyOffset ^ 1)]));
                }

                @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
                public int size() {
                    return EntrySet.this.size;
                }

                @Override // com.google.common.collect.ImmutableList, com.google.common.collect.ImmutableCollection
                Object writeReplace() {
                    return super.writeReplace();
                }
            };
        }

        @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(@CheckForNull Object object) {
            if (!(object instanceof Map.Entry)) {
                return false;
            }
            Map.Entry entry = (Map.Entry) object;
            Object key = entry.getKey();
            Object value = entry.getValue();
            return value != null && value.equals(this.map.get(key));
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return this.size;
        }

        @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection
        Object writeReplace() {
            return super.writeReplace();
        }
    }

    @Override // com.google.common.collect.ImmutableMap
    ImmutableSet<K> createKeySet() {
        return new KeySet(this, new KeysOrValuesAsList(this.alternatingKeysAndValues, 0, this.size));
    }

    static final class KeysOrValuesAsList extends ImmutableList<Object> {
        private final transient Object[] alternatingKeysAndValues;
        private final transient int offset;
        private final transient int size;

        @Override // com.google.common.collect.ImmutableCollection
        boolean isPartialView() {
            return true;
        }

        KeysOrValuesAsList(Object[] alternatingKeysAndValues, int offset, int size) {
            this.alternatingKeysAndValues = alternatingKeysAndValues;
            this.offset = offset;
            this.size = size;
        }

        @Override // java.util.List
        public Object get(int index) {
            Preconditions.checkElementIndex(index, this.size);
            return Objects.requireNonNull(this.alternatingKeysAndValues[(index * 2) + this.offset]);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return this.size;
        }

        @Override // com.google.common.collect.ImmutableList, com.google.common.collect.ImmutableCollection
        Object writeReplace() {
            return super.writeReplace();
        }
    }

    static final class KeySet<K> extends ImmutableSet<K> {
        private final transient ImmutableList<K> list;
        private final transient ImmutableMap<K, ?> map;

        @Override // com.google.common.collect.ImmutableCollection
        boolean isPartialView() {
            return true;
        }

        KeySet(ImmutableMap<K, ?> map, ImmutableList<K> list) {
            this.map = map;
            this.list = list;
        }

        @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set, java.util.NavigableSet, com.google.common.collect.SortedIterable
        public UnmodifiableIterator<K> iterator() {
            return asList().iterator();
        }

        @Override // com.google.common.collect.ImmutableCollection
        int copyIntoArray(Object[] dst, int offset) {
            return asList().copyIntoArray(dst, offset);
        }

        @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection
        public ImmutableList<K> asList() {
            return this.list;
        }

        @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.util.Set
        public boolean contains(@CheckForNull Object object) {
            return this.map.get(object) != null;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
        public int size() {
            return this.map.size();
        }

        @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection
        Object writeReplace() {
            return super.writeReplace();
        }
    }

    @Override // com.google.common.collect.ImmutableMap
    ImmutableCollection<V> createValues() {
        return new KeysOrValuesAsList(this.alternatingKeysAndValues, 1, this.size);
    }

    @Override // com.google.common.collect.ImmutableMap
    Object writeReplace() {
        return super.writeReplace();
    }
}
