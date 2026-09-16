package com.google.common.collect;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Objects;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
class CompactLinkedHashSet<E> extends CompactHashSet<E> {
    private static final int ENDPOINT = -2;
    private transient int firstEntry;
    private transient int lastEntry;

    @CheckForNull
    private transient int[] predecessor;

    @CheckForNull
    private transient int[] successor;

    public static <E> CompactLinkedHashSet<E> create() {
        return new CompactLinkedHashSet<>();
    }

    public static <E> CompactLinkedHashSet<E> create(Collection<? extends E> collection) {
        CompactLinkedHashSet<E> compactLinkedHashSetCreateWithExpectedSize = createWithExpectedSize(collection.size());
        compactLinkedHashSetCreateWithExpectedSize.addAll(collection);
        return compactLinkedHashSetCreateWithExpectedSize;
    }

    @SafeVarargs
    public static <E> CompactLinkedHashSet<E> create(E... elements) {
        CompactLinkedHashSet<E> compactLinkedHashSetCreateWithExpectedSize = createWithExpectedSize(elements.length);
        Collections.addAll(compactLinkedHashSetCreateWithExpectedSize, elements);
        return compactLinkedHashSetCreateWithExpectedSize;
    }

    public static <E> CompactLinkedHashSet<E> createWithExpectedSize(int expectedSize) {
        return new CompactLinkedHashSet<>(expectedSize);
    }

    CompactLinkedHashSet() {
    }

    CompactLinkedHashSet(int expectedSize) {
        super(expectedSize);
    }

    @Override // com.google.common.collect.CompactHashSet
    void init(int expectedSize) {
        super.init(expectedSize);
        this.firstEntry = -2;
        this.lastEntry = -2;
    }

    @Override // com.google.common.collect.CompactHashSet
    int allocArrays() {
        int iAllocArrays = super.allocArrays();
        this.predecessor = new int[iAllocArrays];
        this.successor = new int[iAllocArrays];
        return iAllocArrays;
    }

    @Override // com.google.common.collect.CompactHashSet
    Set<E> convertToHashFloodingResistantImplementation() {
        Set<E> setConvertToHashFloodingResistantImplementation = super.convertToHashFloodingResistantImplementation();
        this.predecessor = null;
        this.successor = null;
        return setConvertToHashFloodingResistantImplementation;
    }

    private int getPredecessor(int entry) {
        return requirePredecessors()[entry] - 1;
    }

    @Override // com.google.common.collect.CompactHashSet
    int getSuccessor(int entry) {
        return requireSuccessors()[entry] - 1;
    }

    private void setSuccessor(int entry, int succ) {
        requireSuccessors()[entry] = succ + 1;
    }

    private void setPredecessor(int entry, int pred) {
        requirePredecessors()[entry] = pred + 1;
    }

    private void setSucceeds(int pred, int succ) {
        if (pred == -2) {
            this.firstEntry = succ;
        } else {
            setSuccessor(pred, succ);
        }
        if (succ == -2) {
            this.lastEntry = pred;
        } else {
            setPredecessor(succ, pred);
        }
    }

    @Override // com.google.common.collect.CompactHashSet
    void insertEntry(int entryIndex, @ParametricNullness E object, int hash, int mask) {
        super.insertEntry(entryIndex, object, hash, mask);
        setSucceeds(this.lastEntry, entryIndex);
        setSucceeds(entryIndex, -2);
    }

    @Override // com.google.common.collect.CompactHashSet
    void moveLastEntry(int dstIndex, int mask) {
        int size = size() - 1;
        super.moveLastEntry(dstIndex, mask);
        setSucceeds(getPredecessor(dstIndex), getSuccessor(dstIndex));
        if (dstIndex < size) {
            setSucceeds(getPredecessor(size), dstIndex);
            setSucceeds(dstIndex, getSuccessor(size));
        }
        requirePredecessors()[size] = 0;
        requireSuccessors()[size] = 0;
    }

    @Override // com.google.common.collect.CompactHashSet
    void resizeEntries(int newCapacity) {
        super.resizeEntries(newCapacity);
        this.predecessor = Arrays.copyOf(requirePredecessors(), newCapacity);
        this.successor = Arrays.copyOf(requireSuccessors(), newCapacity);
    }

    @Override // com.google.common.collect.CompactHashSet
    int firstEntryIndex() {
        return this.firstEntry;
    }

    @Override // com.google.common.collect.CompactHashSet
    int adjustAfterRemove(int indexBeforeRemove, int indexRemoved) {
        return indexBeforeRemove >= size() ? indexRemoved : indexBeforeRemove;
    }

    @Override // com.google.common.collect.CompactHashSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public Object[] toArray() {
        return ObjectArrays.toArrayImpl(this);
    }

    @Override // com.google.common.collect.CompactHashSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public <T> T[] toArray(T[] tArr) {
        return (T[]) ObjectArrays.toArrayImpl(this, tArr);
    }

    @Override // com.google.common.collect.CompactHashSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public void clear() {
        if (needsAllocArrays()) {
            return;
        }
        this.firstEntry = -2;
        this.lastEntry = -2;
        int[] iArr = this.predecessor;
        if (iArr != null && this.successor != null) {
            Arrays.fill(iArr, 0, size(), 0);
            Arrays.fill(this.successor, 0, size(), 0);
        }
        super.clear();
    }

    private int[] requirePredecessors() {
        return (int[]) Objects.requireNonNull(this.predecessor);
    }

    private int[] requireSuccessors() {
        return (int[]) Objects.requireNonNull(this.successor);
    }
}
