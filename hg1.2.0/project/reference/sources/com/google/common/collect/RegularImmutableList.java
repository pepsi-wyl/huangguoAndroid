package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Objects;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
class RegularImmutableList<E> extends ImmutableList<E> {
    static final ImmutableList<Object> EMPTY = new RegularImmutableList(new Object[0], 0);
    final transient Object[] array;
    private final transient int size;

    @Override // com.google.common.collect.ImmutableCollection
    int internalArrayStart() {
        return 0;
    }

    @Override // com.google.common.collect.ImmutableCollection
    boolean isPartialView() {
        return false;
    }

    RegularImmutableList(Object[] array, int size) {
        this.array = array;
        this.size = size;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public int size() {
        return this.size;
    }

    @Override // com.google.common.collect.ImmutableCollection
    Object[] internalArray() {
        return this.array;
    }

    @Override // com.google.common.collect.ImmutableCollection
    int internalArrayEnd() {
        return this.size;
    }

    @Override // com.google.common.collect.ImmutableList, com.google.common.collect.ImmutableCollection
    int copyIntoArray(Object[] dst, int dstOff) {
        System.arraycopy(this.array, 0, dst, dstOff, this.size);
        return dstOff + this.size;
    }

    @Override // java.util.List
    public E get(int i) {
        Preconditions.checkElementIndex(i, this.size);
        return (E) Objects.requireNonNull(this.array[i]);
    }

    @Override // com.google.common.collect.ImmutableList, com.google.common.collect.ImmutableCollection
    Object writeReplace() {
        return super.writeReplace();
    }
}
