package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableSortedSet;
import java.lang.Comparable;
import java.util.NoSuchElementException;
import java.util.Objects;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class ContiguousSet<C extends Comparable> extends ImmutableSortedSet<C> {
    final DiscreteDomain<C> domain;

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.google.common.collect.ImmutableSortedSet
    public abstract ContiguousSet<C> headSetImpl(C toElement, boolean inclusive);

    public abstract ContiguousSet<C> intersection(ContiguousSet<C> other);

    public abstract Range<C> range();

    public abstract Range<C> range(BoundType lowerBoundType, BoundType upperBoundType);

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.google.common.collect.ImmutableSortedSet
    public abstract ContiguousSet<C> subSetImpl(C fromElement, boolean fromInclusive, C toElement, boolean toInclusive);

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.google.common.collect.ImmutableSortedSet
    public abstract ContiguousSet<C> tailSetImpl(C fromElement, boolean inclusive);

    public static <C extends Comparable> ContiguousSet<C> create(Range<C> range, DiscreteDomain<C> domain) {
        Preconditions.checkNotNull(range);
        Preconditions.checkNotNull(domain);
        try {
            Range<C> rangeIntersection = !range.hasLowerBound() ? range.intersection(Range.atLeast(domain.minValue())) : range;
            if (!range.hasUpperBound()) {
                rangeIntersection = rangeIntersection.intersection(Range.atMost(domain.maxValue()));
            }
            if (rangeIntersection.isEmpty() || Range.compareOrThrow((Comparable) Objects.requireNonNull(range.lowerBound.leastValueAbove(domain)), (Comparable) Objects.requireNonNull(range.upperBound.greatestValueBelow(domain))) > 0) {
                return new EmptyContiguousSet(domain);
            }
            return new RegularContiguousSet(rangeIntersection, domain);
        } catch (NoSuchElementException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public static ContiguousSet<Integer> closed(int lower, int upper) {
        return create(Range.closed(Integer.valueOf(lower), Integer.valueOf(upper)), DiscreteDomain.integers());
    }

    public static ContiguousSet<Long> closed(long lower, long upper) {
        return create(Range.closed(Long.valueOf(lower), Long.valueOf(upper)), DiscreteDomain.longs());
    }

    public static ContiguousSet<Integer> closedOpen(int lower, int upper) {
        return create(Range.closedOpen(Integer.valueOf(lower), Integer.valueOf(upper)), DiscreteDomain.integers());
    }

    public static ContiguousSet<Long> closedOpen(long lower, long upper) {
        return create(Range.closedOpen(Long.valueOf(lower), Long.valueOf(upper)), DiscreteDomain.longs());
    }

    ContiguousSet(DiscreteDomain<C> domain) {
        super(Ordering.natural());
        this.domain = domain;
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.NavigableSet, java.util.SortedSet
    public ContiguousSet<C> headSet(C toElement) {
        return headSetImpl((ContiguousSet<C>) Preconditions.checkNotNull(toElement), false);
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.NavigableSet
    public ContiguousSet<C> headSet(C toElement, boolean inclusive) {
        return headSetImpl((ContiguousSet<C>) Preconditions.checkNotNull(toElement), inclusive);
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.NavigableSet, java.util.SortedSet
    public ContiguousSet<C> subSet(C fromElement, C toElement) {
        Preconditions.checkNotNull(fromElement);
        Preconditions.checkNotNull(toElement);
        Preconditions.checkArgument(comparator().compare(fromElement, toElement) <= 0);
        return subSetImpl((boolean) fromElement, true, (boolean) toElement, false);
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.NavigableSet
    public ContiguousSet<C> subSet(C fromElement, boolean fromInclusive, C toElement, boolean toInclusive) {
        Preconditions.checkNotNull(fromElement);
        Preconditions.checkNotNull(toElement);
        Preconditions.checkArgument(comparator().compare(fromElement, toElement) <= 0);
        return subSetImpl((boolean) fromElement, fromInclusive, (boolean) toElement, toInclusive);
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.NavigableSet, java.util.SortedSet
    public ContiguousSet<C> tailSet(C fromElement) {
        return tailSetImpl((ContiguousSet<C>) Preconditions.checkNotNull(fromElement), true);
    }

    @Override // com.google.common.collect.ImmutableSortedSet, java.util.NavigableSet
    public ContiguousSet<C> tailSet(C fromElement, boolean inclusive) {
        return tailSetImpl((ContiguousSet<C>) Preconditions.checkNotNull(fromElement), inclusive);
    }

    @Override // com.google.common.collect.ImmutableSortedSet
    ImmutableSortedSet<C> createDescendingSet() {
        return new DescendingImmutableSortedSet(this);
    }

    @Override // java.util.AbstractCollection
    public String toString() {
        return range().toString();
    }

    @Deprecated
    public static <E> ImmutableSortedSet.Builder<E> builder() {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.common.collect.ImmutableSortedSet, com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection
    Object writeReplace() {
        return super.writeReplace();
    }
}
