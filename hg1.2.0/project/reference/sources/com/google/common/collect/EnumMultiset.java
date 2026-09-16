package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.collect.Multiset;
import com.google.common.collect.Multisets;
import com.google.common.primitives.Ints;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.Enum;
import java.util.Arrays;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class EnumMultiset<E extends Enum<E>> extends AbstractMultiset<E> implements Serializable {
    private static final long serialVersionUID = 0;
    private transient int[] counts;
    private transient int distinctElements;
    private transient E[] enumConstants;
    private transient long size;
    private transient Class<E> type;

    @Override // com.google.common.collect.AbstractMultiset, java.util.AbstractCollection, java.util.Collection, com.google.common.collect.Multiset
    public /* bridge */ /* synthetic */ boolean contains(@CheckForNull Object element) {
        return super.contains(element);
    }

    @Override // com.google.common.collect.AbstractMultiset, com.google.common.collect.Multiset
    public /* bridge */ /* synthetic */ Set elementSet() {
        return super.elementSet();
    }

    @Override // com.google.common.collect.AbstractMultiset, com.google.common.collect.Multiset
    public /* bridge */ /* synthetic */ Set entrySet() {
        return super.entrySet();
    }

    @Override // com.google.common.collect.AbstractMultiset, java.util.AbstractCollection, java.util.Collection
    public /* bridge */ /* synthetic */ boolean isEmpty() {
        return super.isEmpty();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.common.collect.AbstractMultiset, com.google.common.collect.Multiset
    public /* bridge */ /* synthetic */ boolean setCount(@ParametricNullness Object element, int oldCount, int newCount) {
        return super.setCount(element, oldCount, newCount);
    }

    static /* synthetic */ int access$210(EnumMultiset enumMultiset) {
        int i = enumMultiset.distinctElements;
        enumMultiset.distinctElements = i - 1;
        return i;
    }

    static /* synthetic */ long access$322(EnumMultiset enumMultiset, long j) {
        long j2 = enumMultiset.size - j;
        enumMultiset.size = j2;
        return j2;
    }

    public static <E extends Enum<E>> EnumMultiset<E> create(Class<E> type) {
        return new EnumMultiset<>(type);
    }

    public static <E extends Enum<E>> EnumMultiset<E> create(Iterable<E> elements) {
        Iterator<E> it = elements.iterator();
        Preconditions.checkArgument(it.hasNext(), "EnumMultiset constructor passed empty Iterable");
        EnumMultiset<E> enumMultiset = new EnumMultiset<>(it.next().getDeclaringClass());
        Iterables.addAll(enumMultiset, elements);
        return enumMultiset;
    }

    public static <E extends Enum<E>> EnumMultiset<E> create(Iterable<E> elements, Class<E> type) {
        EnumMultiset<E> enumMultisetCreate = create(type);
        Iterables.addAll(enumMultisetCreate, elements);
        return enumMultisetCreate;
    }

    private EnumMultiset(Class<E> type) {
        this.type = type;
        Preconditions.checkArgument(type.isEnum());
        E[] enumConstants = type.getEnumConstants();
        this.enumConstants = enumConstants;
        this.counts = new int[enumConstants.length];
    }

    private boolean isActuallyE(@CheckForNull Object o) {
        if (!(o instanceof Enum)) {
            return false;
        }
        Enum r5 = (Enum) o;
        int iOrdinal = r5.ordinal();
        E[] eArr = this.enumConstants;
        return iOrdinal < eArr.length && eArr[iOrdinal] == r5;
    }

    private void checkIsE(Object element) {
        Preconditions.checkNotNull(element);
        if (isActuallyE(element)) {
            return;
        }
        throw new ClassCastException("Expected an " + this.type + " but got " + element);
    }

    @Override // com.google.common.collect.AbstractMultiset
    int distinctElements() {
        return this.distinctElements;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, com.google.common.collect.Multiset
    public int size() {
        return Ints.saturatedCast(this.size);
    }

    @Override // com.google.common.collect.Multiset
    public int count(@CheckForNull Object element) {
        if (element == null || !isActuallyE(element)) {
            return 0;
        }
        return this.counts[((Enum) element).ordinal()];
    }

    @Override // com.google.common.collect.AbstractMultiset, com.google.common.collect.Multiset
    public int add(E element, int occurrences) {
        checkIsE(element);
        CollectPreconditions.checkNonnegative(occurrences, "occurrences");
        if (occurrences == 0) {
            return count(element);
        }
        int iOrdinal = element.ordinal();
        int i = this.counts[iOrdinal];
        long j = occurrences;
        long j2 = i + j;
        Preconditions.checkArgument(j2 <= 2147483647L, "too many occurrences: %s", j2);
        this.counts[iOrdinal] = (int) j2;
        if (i == 0) {
            this.distinctElements++;
        }
        this.size += j;
        return i;
    }

    @Override // com.google.common.collect.AbstractMultiset, com.google.common.collect.Multiset
    public int remove(@CheckForNull Object element, int occurrences) {
        if (element == null || !isActuallyE(element)) {
            return 0;
        }
        Enum r1 = (Enum) element;
        CollectPreconditions.checkNonnegative(occurrences, "occurrences");
        if (occurrences == 0) {
            return count(element);
        }
        int iOrdinal = r1.ordinal();
        int[] iArr = this.counts;
        int i = iArr[iOrdinal];
        if (i == 0) {
            return 0;
        }
        if (i <= occurrences) {
            iArr[iOrdinal] = 0;
            this.distinctElements--;
            this.size -= i;
        } else {
            iArr[iOrdinal] = i - occurrences;
            this.size -= occurrences;
        }
        return i;
    }

    @Override // com.google.common.collect.AbstractMultiset, com.google.common.collect.Multiset
    public int setCount(E element, int count) {
        checkIsE(element);
        CollectPreconditions.checkNonnegative(count, "count");
        int iOrdinal = element.ordinal();
        int[] iArr = this.counts;
        int i = iArr[iOrdinal];
        iArr[iOrdinal] = count;
        this.size += count - i;
        if (i == 0 && count > 0) {
            this.distinctElements++;
        } else if (i > 0 && count == 0) {
            this.distinctElements--;
        }
        return i;
    }

    @Override // com.google.common.collect.AbstractMultiset, java.util.AbstractCollection, java.util.Collection
    public void clear() {
        Arrays.fill(this.counts, 0);
        this.size = 0L;
        this.distinctElements = 0;
    }

    abstract class Itr<T> implements Iterator<T> {
        int index = 0;
        int toRemove = -1;

        abstract T output(int index);

        Itr() {
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            while (this.index < EnumMultiset.this.enumConstants.length) {
                int[] iArr = EnumMultiset.this.counts;
                int i = this.index;
                if (iArr[i] > 0) {
                    return true;
                }
                this.index = i + 1;
            }
            return false;
        }

        @Override // java.util.Iterator
        public T next() {
            if (!hasNext()) {
                throw new NoSuchElementException();
            }
            T tOutput = output(this.index);
            int i = this.index;
            this.toRemove = i;
            this.index = i + 1;
            return tOutput;
        }

        @Override // java.util.Iterator
        public void remove() {
            CollectPreconditions.checkRemove(this.toRemove >= 0);
            if (EnumMultiset.this.counts[this.toRemove] > 0) {
                EnumMultiset.access$210(EnumMultiset.this);
                EnumMultiset.access$322(EnumMultiset.this, r0.counts[this.toRemove]);
                EnumMultiset.this.counts[this.toRemove] = 0;
            }
            this.toRemove = -1;
        }
    }

    @Override // com.google.common.collect.AbstractMultiset
    Iterator<E> elementIterator() {
        return new EnumMultiset<E>.Itr<E>() { // from class: com.google.common.collect.EnumMultiset.1
            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.collect.EnumMultiset.Itr
            public E output(int i) {
                return (E) EnumMultiset.this.enumConstants[i];
            }
        };
    }

    @Override // com.google.common.collect.AbstractMultiset
    Iterator<Multiset.Entry<E>> entryIterator() {
        return new EnumMultiset<E>.Itr<Multiset.Entry<E>>() { // from class: com.google.common.collect.EnumMultiset.2
            /* JADX INFO: Access modifiers changed from: package-private */
            @Override // com.google.common.collect.EnumMultiset.Itr
            public Multiset.Entry<E> output(final int i) {
                return new Multisets.AbstractEntry<E>() { // from class: com.google.common.collect.EnumMultiset.2.1
                    @Override // com.google.common.collect.Multiset.Entry
                    public E getElement() {
                        return (E) EnumMultiset.this.enumConstants[i];
                    }

                    @Override // com.google.common.collect.Multiset.Entry
                    public int getCount() {
                        return EnumMultiset.this.counts[i];
                    }
                };
            }
        };
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, com.google.common.collect.Multiset
    public Iterator<E> iterator() {
        return Multisets.iteratorImpl(this);
    }

    private void writeObject(ObjectOutputStream stream) throws IOException {
        stream.defaultWriteObject();
        stream.writeObject(this.type);
        Serialization.writeMultiset(this, stream);
    }

    private void readObject(ObjectInputStream stream) throws ClassNotFoundException, IOException {
        stream.defaultReadObject();
        Class<E> cls = (Class) Objects.requireNonNull(stream.readObject());
        this.type = cls;
        E[] enumConstants = cls.getEnumConstants();
        this.enumConstants = enumConstants;
        this.counts = new int[enumConstants.length];
        Serialization.populateMultiset(this, stream);
    }
}
