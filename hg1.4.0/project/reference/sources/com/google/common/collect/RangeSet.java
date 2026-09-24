package com.google.common.collect;

import com.google.errorprone.annotations.DoNotMock;
import java.lang.Comparable;
import java.util.Set;
import javax.annotation.CheckForNull;

@DoNotMock("Use ImmutableRangeSet or TreeRangeSet")
@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface RangeSet<C extends Comparable> {
    void add(Range<C> range);

    void addAll(RangeSet<C> other);

    void addAll(Iterable<Range<C>> ranges);

    Set<Range<C>> asDescendingSetOfRanges();

    Set<Range<C>> asRanges();

    void clear();

    RangeSet<C> complement();

    boolean contains(C value);

    boolean encloses(Range<C> otherRange);

    boolean enclosesAll(RangeSet<C> other);

    boolean enclosesAll(Iterable<Range<C>> other);

    boolean equals(@CheckForNull Object obj);

    int hashCode();

    boolean intersects(Range<C> otherRange);

    boolean isEmpty();

    @CheckForNull
    Range<C> rangeContaining(C value);

    void remove(Range<C> range);

    void removeAll(RangeSet<C> other);

    void removeAll(Iterable<Range<C>> ranges);

    Range<C> span();

    RangeSet<C> subRangeSet(Range<C> view);

    String toString();
}
