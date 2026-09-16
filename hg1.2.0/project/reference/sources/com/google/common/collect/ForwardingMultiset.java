package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.collect.Multiset;
import com.google.common.collect.Multisets;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class ForwardingMultiset<E> extends ForwardingCollection<E> implements Multiset<E> {
    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
    public abstract Multiset<E> delegate();

    protected ForwardingMultiset() {
    }

    @Override // com.google.common.collect.Multiset
    public int count(@CheckForNull Object element) {
        return delegate().count(element);
    }

    @Override // com.google.common.collect.Multiset
    public int add(@ParametricNullness E element, int occurrences) {
        return delegate().add(element, occurrences);
    }

    @Override // com.google.common.collect.Multiset
    public int remove(@CheckForNull Object element, int occurrences) {
        return delegate().remove(element, occurrences);
    }

    public Set<E> elementSet() {
        return delegate().elementSet();
    }

    public Set<Multiset.Entry<E>> entrySet() {
        return delegate().entrySet();
    }

    @Override // java.util.Collection, com.google.common.collect.Multiset
    public boolean equals(@CheckForNull Object object) {
        return object == this || delegate().equals(object);
    }

    @Override // java.util.Collection, com.google.common.collect.Multiset
    public int hashCode() {
        return delegate().hashCode();
    }

    @Override // com.google.common.collect.Multiset
    public int setCount(@ParametricNullness E element, int count) {
        return delegate().setCount(element, count);
    }

    @Override // com.google.common.collect.Multiset
    public boolean setCount(@ParametricNullness E element, int oldCount, int newCount) {
        return delegate().setCount(element, oldCount, newCount);
    }

    @Override // com.google.common.collect.ForwardingCollection
    protected boolean standardContains(@CheckForNull Object object) {
        return count(object) > 0;
    }

    @Override // com.google.common.collect.ForwardingCollection
    protected void standardClear() {
        Iterators.clear(entrySet().iterator());
    }

    protected int standardCount(@CheckForNull Object object) {
        for (Multiset.Entry<E> entry : entrySet()) {
            if (Objects.equal(entry.getElement(), object)) {
                return entry.getCount();
            }
        }
        return 0;
    }

    protected boolean standardAdd(@ParametricNullness E element) {
        add(element, 1);
        return true;
    }

    @Override // com.google.common.collect.ForwardingCollection
    protected boolean standardAddAll(Collection<? extends E> elementsToAdd) {
        return Multisets.addAllImpl(this, elementsToAdd);
    }

    @Override // com.google.common.collect.ForwardingCollection
    protected boolean standardRemove(@CheckForNull Object element) {
        return remove(element, 1) > 0;
    }

    @Override // com.google.common.collect.ForwardingCollection
    protected boolean standardRemoveAll(Collection<?> elementsToRemove) {
        return Multisets.removeAllImpl(this, elementsToRemove);
    }

    @Override // com.google.common.collect.ForwardingCollection
    protected boolean standardRetainAll(Collection<?> elementsToRetain) {
        return Multisets.retainAllImpl(this, elementsToRetain);
    }

    protected int standardSetCount(@ParametricNullness E element, int count) {
        return Multisets.setCountImpl(this, element, count);
    }

    protected boolean standardSetCount(@ParametricNullness E element, int oldCount, int newCount) {
        return Multisets.setCountImpl(this, element, oldCount, newCount);
    }

    protected class StandardElementSet extends Multisets.ElementSet<E> {
        public StandardElementSet() {
        }

        @Override // com.google.common.collect.Multisets.ElementSet
        Multiset<E> multiset() {
            return ForwardingMultiset.this;
        }

        @Override // com.google.common.collect.Multisets.ElementSet, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public Iterator<E> iterator() {
            return Multisets.elementIterator(multiset().entrySet().iterator());
        }
    }

    protected Iterator<E> standardIterator() {
        return Multisets.iteratorImpl(this);
    }

    protected int standardSize() {
        return Multisets.linearTimeSizeImpl(this);
    }

    protected boolean standardEquals(@CheckForNull Object object) {
        return Multisets.equalsImpl(this, object);
    }

    protected int standardHashCode() {
        return entrySet().hashCode();
    }

    @Override // com.google.common.collect.ForwardingCollection
    protected String standardToString() {
        return entrySet().toString();
    }
}
