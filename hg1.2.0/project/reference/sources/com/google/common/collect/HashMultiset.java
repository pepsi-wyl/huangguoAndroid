package com.google.common.collect;

import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class HashMultiset<E> extends AbstractMapBasedMultiset<E> {
    private static final long serialVersionUID = 0;

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

    public static <E> HashMultiset<E> create() {
        return create(3);
    }

    public static <E> HashMultiset<E> create(int distinctElements) {
        return new HashMultiset<>(distinctElements);
    }

    public static <E> HashMultiset<E> create(Iterable<? extends E> elements) {
        HashMultiset<E> hashMultisetCreate = create(Multisets.inferDistinctElements(elements));
        Iterables.addAll(hashMultisetCreate, elements);
        return hashMultisetCreate;
    }

    HashMultiset(int distinctElements) {
        super(distinctElements);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultiset
    ObjectCountHashMap<E> newBackingMap(int distinctElements) {
        return new ObjectCountHashMap<>(distinctElements);
    }
}
