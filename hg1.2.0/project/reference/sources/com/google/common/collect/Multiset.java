package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface Multiset<E> extends Collection<E> {

    public interface Entry<E> {
        boolean equals(@CheckForNull Object o);

        int getCount();

        @ParametricNullness
        E getElement();

        int hashCode();

        String toString();
    }

    int add(@ParametricNullness E element, int occurrences);

    boolean add(@ParametricNullness E element);

    boolean contains(@CheckForNull Object element);

    @Override // java.util.Collection
    boolean containsAll(Collection<?> elements);

    int count(@CheckForNull Object element);

    Set<E> elementSet();

    Set<Entry<E>> entrySet();

    boolean equals(@CheckForNull Object object);

    int hashCode();

    Iterator<E> iterator();

    int remove(@CheckForNull Object element, int occurrences);

    boolean remove(@CheckForNull Object element);

    boolean removeAll(Collection<?> c);

    boolean retainAll(Collection<?> c);

    int setCount(@ParametricNullness E element, int count);

    boolean setCount(@ParametricNullness E element, int oldCount, int newCount);

    int size();

    String toString();
}
