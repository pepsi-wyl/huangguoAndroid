package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class ForwardingList<E> extends ForwardingCollection<E> implements List<E> {
    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
    public abstract List<E> delegate();

    protected ForwardingList() {
    }

    public void add(int index, @ParametricNullness E element) {
        delegate().add(index, element);
    }

    public boolean addAll(int index, Collection<? extends E> elements) {
        return delegate().addAll(index, elements);
    }

    @Override // java.util.List
    @ParametricNullness
    public E get(int index) {
        return delegate().get(index);
    }

    @Override // java.util.List
    public int indexOf(@CheckForNull Object element) {
        return delegate().indexOf(element);
    }

    @Override // java.util.List
    public int lastIndexOf(@CheckForNull Object element) {
        return delegate().lastIndexOf(element);
    }

    @Override // java.util.List
    public ListIterator<E> listIterator() {
        return delegate().listIterator();
    }

    @Override // java.util.List
    public ListIterator<E> listIterator(int index) {
        return delegate().listIterator(index);
    }

    @Override // java.util.List
    @ParametricNullness
    public E remove(int index) {
        return delegate().remove(index);
    }

    @Override // java.util.List
    @ParametricNullness
    public E set(int index, @ParametricNullness E element) {
        return delegate().set(index, element);
    }

    @Override // java.util.List
    public List<E> subList(int fromIndex, int toIndex) {
        return delegate().subList(fromIndex, toIndex);
    }

    @Override // java.util.Collection, java.util.List
    public boolean equals(@CheckForNull Object object) {
        return object == this || delegate().equals(object);
    }

    @Override // java.util.Collection, java.util.List
    public int hashCode() {
        return delegate().hashCode();
    }

    protected boolean standardAdd(@ParametricNullness E element) {
        add(size(), element);
        return true;
    }

    protected boolean standardAddAll(int index, Iterable<? extends E> elements) {
        return Lists.addAllImpl(this, index, elements);
    }

    protected int standardIndexOf(@CheckForNull Object element) {
        return Lists.indexOfImpl(this, element);
    }

    protected int standardLastIndexOf(@CheckForNull Object element) {
        return Lists.lastIndexOfImpl(this, element);
    }

    protected Iterator<E> standardIterator() {
        return listIterator();
    }

    protected ListIterator<E> standardListIterator() {
        return listIterator(0);
    }

    protected ListIterator<E> standardListIterator(int start) {
        return Lists.listIteratorImpl(this, start);
    }

    protected List<E> standardSubList(int fromIndex, int toIndex) {
        return Lists.subListImpl(this, fromIndex, toIndex);
    }

    protected boolean standardEquals(@CheckForNull Object object) {
        return Lists.equalsImpl(this, object);
    }

    protected int standardHashCode() {
        return Lists.hashCodeImpl(this);
    }
}
