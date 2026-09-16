package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Optional;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Queue;
import java.util.RandomAccess;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Iterables {
    private Iterables() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <T> Iterable<T> unmodifiableIterable(final Iterable<? extends T> iterable) {
        Preconditions.checkNotNull(iterable);
        return ((iterable instanceof UnmodifiableIterable) || (iterable instanceof ImmutableCollection)) ? iterable : new UnmodifiableIterable(iterable);
    }

    @Deprecated
    public static <E> Iterable<E> unmodifiableIterable(ImmutableCollection<E> iterable) {
        return (Iterable) Preconditions.checkNotNull(iterable);
    }

    private static final class UnmodifiableIterable<T> extends FluentIterable<T> {
        private final Iterable<? extends T> iterable;

        private UnmodifiableIterable(Iterable<? extends T> iterable) {
            this.iterable = iterable;
        }

        @Override // java.lang.Iterable
        public Iterator<T> iterator() {
            return Iterators.unmodifiableIterator(this.iterable.iterator());
        }

        @Override // com.google.common.collect.FluentIterable
        public String toString() {
            return this.iterable.toString();
        }
    }

    public static int size(Iterable<?> iterable) {
        if (iterable instanceof Collection) {
            return ((Collection) iterable).size();
        }
        return Iterators.size(iterable.iterator());
    }

    public static boolean contains(Iterable<? extends Object> iterable, @CheckForNull Object element) {
        if (iterable instanceof Collection) {
            return Collections2.safeContains((Collection) iterable, element);
        }
        return Iterators.contains(iterable.iterator(), element);
    }

    public static boolean removeAll(Iterable<?> removeFrom, Collection<?> elementsToRemove) {
        if (removeFrom instanceof Collection) {
            return ((Collection) removeFrom).removeAll((Collection) Preconditions.checkNotNull(elementsToRemove));
        }
        return Iterators.removeAll(removeFrom.iterator(), elementsToRemove);
    }

    public static boolean retainAll(Iterable<?> removeFrom, Collection<?> elementsToRetain) {
        if (removeFrom instanceof Collection) {
            return ((Collection) removeFrom).retainAll((Collection) Preconditions.checkNotNull(elementsToRetain));
        }
        return Iterators.retainAll(removeFrom.iterator(), elementsToRetain);
    }

    public static <T> boolean removeIf(Iterable<T> removeFrom, Predicate<? super T> predicate) {
        if ((removeFrom instanceof RandomAccess) && (removeFrom instanceof List)) {
            return removeIfFromRandomAccessList((List) removeFrom, (Predicate) Preconditions.checkNotNull(predicate));
        }
        return Iterators.removeIf(removeFrom.iterator(), predicate);
    }

    private static <T> boolean removeIfFromRandomAccessList(List<T> list, Predicate<? super T> predicate) {
        int i = 0;
        int i2 = 0;
        while (i < list.size()) {
            T t = list.get(i);
            if (!predicate.apply(t)) {
                if (i > i2) {
                    try {
                        list.set(i2, t);
                    } catch (IllegalArgumentException unused) {
                        slowRemoveIfForRemainingElements(list, predicate, i2, i);
                        return true;
                    } catch (UnsupportedOperationException unused2) {
                        slowRemoveIfForRemainingElements(list, predicate, i2, i);
                        return true;
                    }
                }
                i2++;
            }
            i++;
        }
        list.subList(i2, list.size()).clear();
        return i != i2;
    }

    private static <T> void slowRemoveIfForRemainingElements(List<T> list, Predicate<? super T> predicate, int to, int from) {
        for (int size = list.size() - 1; size > from; size--) {
            if (predicate.apply(list.get(size))) {
                list.remove(size);
            }
        }
        for (int i = from - 1; i >= to; i--) {
            list.remove(i);
        }
    }

    @CheckForNull
    static <T> T removeFirstMatching(Iterable<T> removeFrom, Predicate<? super T> predicate) {
        Preconditions.checkNotNull(predicate);
        Iterator<T> it = removeFrom.iterator();
        while (it.hasNext()) {
            T next = it.next();
            if (predicate.apply(next)) {
                it.remove();
                return next;
            }
        }
        return null;
    }

    public static boolean elementsEqual(Iterable<?> iterable1, Iterable<?> iterable2) {
        if ((iterable1 instanceof Collection) && (iterable2 instanceof Collection) && ((Collection) iterable1).size() != ((Collection) iterable2).size()) {
            return false;
        }
        return Iterators.elementsEqual(iterable1.iterator(), iterable2.iterator());
    }

    public static String toString(Iterable<?> iterable) {
        return Iterators.toString(iterable.iterator());
    }

    @ParametricNullness
    public static <T> T getOnlyElement(Iterable<T> iterable) {
        return (T) Iterators.getOnlyElement(iterable.iterator());
    }

    @ParametricNullness
    public static <T> T getOnlyElement(Iterable<? extends T> iterable, @ParametricNullness T t) {
        return (T) Iterators.getOnlyElement(iterable.iterator(), t);
    }

    public static <T> T[] toArray(Iterable<? extends T> iterable, Class<T> cls) {
        return (T[]) toArray(iterable, ObjectArrays.newArray(cls, 0));
    }

    static <T> T[] toArray(Iterable<? extends T> iterable, T[] tArr) {
        return (T[]) castOrCopyToCollection(iterable).toArray(tArr);
    }

    static Object[] toArray(Iterable<?> iterable) {
        return castOrCopyToCollection(iterable).toArray();
    }

    private static <E> Collection<E> castOrCopyToCollection(Iterable<E> iterable) {
        if (iterable instanceof Collection) {
            return (Collection) iterable;
        }
        return Lists.newArrayList(iterable.iterator());
    }

    public static <T> boolean addAll(Collection<T> addTo, Iterable<? extends T> elementsToAdd) {
        if (elementsToAdd instanceof Collection) {
            return addTo.addAll((Collection) elementsToAdd);
        }
        return Iterators.addAll(addTo, ((Iterable) Preconditions.checkNotNull(elementsToAdd)).iterator());
    }

    public static int frequency(Iterable<?> iterable, @CheckForNull Object obj) {
        if (iterable instanceof Multiset) {
            return ((Multiset) iterable).count(obj);
        }
        if (iterable instanceof Set) {
            return ((Set) iterable).contains(obj) ? 1 : 0;
        }
        return Iterators.frequency(iterable.iterator(), obj);
    }

    public static <T> Iterable<T> cycle(final Iterable<T> iterable) {
        Preconditions.checkNotNull(iterable);
        return new FluentIterable<T>() { // from class: com.google.common.collect.Iterables.1
            @Override // java.lang.Iterable
            public Iterator<T> iterator() {
                return Iterators.cycle(iterable);
            }

            @Override // com.google.common.collect.FluentIterable
            public String toString() {
                return iterable.toString() + " (cycled)";
            }
        };
    }

    @SafeVarargs
    public static <T> Iterable<T> cycle(T... elements) {
        return cycle(Lists.newArrayList(elements));
    }

    public static <T> Iterable<T> concat(Iterable<? extends T> a, Iterable<? extends T> b) {
        return FluentIterable.concat(a, b);
    }

    public static <T> Iterable<T> concat(Iterable<? extends T> a, Iterable<? extends T> b, Iterable<? extends T> c) {
        return FluentIterable.concat(a, b, c);
    }

    public static <T> Iterable<T> concat(Iterable<? extends T> a, Iterable<? extends T> b, Iterable<? extends T> c, Iterable<? extends T> d) {
        return FluentIterable.concat(a, b, c, d);
    }

    @SafeVarargs
    public static <T> Iterable<T> concat(Iterable<? extends T>... inputs) {
        return FluentIterable.concat(inputs);
    }

    public static <T> Iterable<T> concat(Iterable<? extends Iterable<? extends T>> inputs) {
        return FluentIterable.concat(inputs);
    }

    public static <T> Iterable<List<T>> partition(final Iterable<T> iterable, final int size) {
        Preconditions.checkNotNull(iterable);
        Preconditions.checkArgument(size > 0);
        return new FluentIterable<List<T>>() { // from class: com.google.common.collect.Iterables.2
            @Override // java.lang.Iterable
            public Iterator<List<T>> iterator() {
                return Iterators.partition(iterable.iterator(), size);
            }
        };
    }

    public static <T> Iterable<List<T>> paddedPartition(final Iterable<T> iterable, final int size) {
        Preconditions.checkNotNull(iterable);
        Preconditions.checkArgument(size > 0);
        return new FluentIterable<List<T>>() { // from class: com.google.common.collect.Iterables.3
            @Override // java.lang.Iterable
            public Iterator<List<T>> iterator() {
                return Iterators.paddedPartition(iterable.iterator(), size);
            }
        };
    }

    public static <T> Iterable<T> filter(final Iterable<T> unfiltered, final Predicate<? super T> retainIfTrue) {
        Preconditions.checkNotNull(unfiltered);
        Preconditions.checkNotNull(retainIfTrue);
        return new FluentIterable<T>() { // from class: com.google.common.collect.Iterables.4
            @Override // java.lang.Iterable
            public Iterator<T> iterator() {
                return Iterators.filter(unfiltered.iterator(), retainIfTrue);
            }
        };
    }

    public static <T> Iterable<T> filter(final Iterable<?> unfiltered, final Class<T> desiredType) {
        Preconditions.checkNotNull(unfiltered);
        Preconditions.checkNotNull(desiredType);
        return filter(unfiltered, Predicates.instanceOf(desiredType));
    }

    public static <T> boolean any(Iterable<T> iterable, Predicate<? super T> predicate) {
        return Iterators.any(iterable.iterator(), predicate);
    }

    public static <T> boolean all(Iterable<T> iterable, Predicate<? super T> predicate) {
        return Iterators.all(iterable.iterator(), predicate);
    }

    @ParametricNullness
    public static <T> T find(Iterable<T> iterable, Predicate<? super T> predicate) {
        return (T) Iterators.find(iterable.iterator(), predicate);
    }

    @CheckForNull
    public static <T> T find(Iterable<? extends T> iterable, Predicate<? super T> predicate, @CheckForNull T t) {
        return (T) Iterators.find(iterable.iterator(), predicate, t);
    }

    public static <T> Optional<T> tryFind(Iterable<T> iterable, Predicate<? super T> predicate) {
        return Iterators.tryFind(iterable.iterator(), predicate);
    }

    public static <T> int indexOf(Iterable<T> iterable, Predicate<? super T> predicate) {
        return Iterators.indexOf(iterable.iterator(), predicate);
    }

    public static <F, T> Iterable<T> transform(final Iterable<F> fromIterable, final Function<? super F, ? extends T> function) {
        Preconditions.checkNotNull(fromIterable);
        Preconditions.checkNotNull(function);
        return new FluentIterable<T>() { // from class: com.google.common.collect.Iterables.5
            @Override // java.lang.Iterable
            public Iterator<T> iterator() {
                return Iterators.transform(fromIterable.iterator(), function);
            }
        };
    }

    @ParametricNullness
    public static <T> T get(Iterable<T> iterable, int i) {
        Preconditions.checkNotNull(iterable);
        if (iterable instanceof List) {
            return (T) ((List) iterable).get(i);
        }
        return (T) Iterators.get(iterable.iterator(), i);
    }

    @ParametricNullness
    public static <T> T get(Iterable<? extends T> iterable, int i, @ParametricNullness T t) {
        Preconditions.checkNotNull(iterable);
        Iterators.checkNonnegative(i);
        if (iterable instanceof List) {
            List listCast = Lists.cast(iterable);
            return i < listCast.size() ? (T) listCast.get(i) : t;
        }
        Iterator<? extends T> it = iterable.iterator();
        Iterators.advance(it, i);
        return (T) Iterators.getNext(it, t);
    }

    @ParametricNullness
    public static <T> T getFirst(Iterable<? extends T> iterable, @ParametricNullness T t) {
        return (T) Iterators.getNext(iterable.iterator(), t);
    }

    @ParametricNullness
    public static <T> T getLast(Iterable<T> iterable) {
        if (iterable instanceof List) {
            List list = (List) iterable;
            if (list.isEmpty()) {
                throw new NoSuchElementException();
            }
            return (T) getLastInNonemptyList(list);
        }
        return (T) Iterators.getLast(iterable.iterator());
    }

    @ParametricNullness
    public static <T> T getLast(Iterable<? extends T> iterable, @ParametricNullness T t) {
        if (iterable instanceof Collection) {
            if (((Collection) iterable).isEmpty()) {
                return t;
            }
            if (iterable instanceof List) {
                return (T) getLastInNonemptyList(Lists.cast(iterable));
            }
        }
        return (T) Iterators.getLast(iterable.iterator(), t);
    }

    @ParametricNullness
    private static <T> T getLastInNonemptyList(List<T> list) {
        return list.get(list.size() - 1);
    }

    public static <T> Iterable<T> skip(final Iterable<T> iterable, final int numberToSkip) {
        Preconditions.checkNotNull(iterable);
        Preconditions.checkArgument(numberToSkip >= 0, "number to skip cannot be negative");
        return new FluentIterable<T>() { // from class: com.google.common.collect.Iterables.6
            @Override // java.lang.Iterable
            public Iterator<T> iterator() {
                Iterable iterable2 = iterable;
                if (iterable2 instanceof List) {
                    List list = (List) iterable2;
                    return list.subList(Math.min(list.size(), numberToSkip), list.size()).iterator();
                }
                final Iterator<T> it = iterable2.iterator();
                Iterators.advance(it, numberToSkip);
                return new Iterator<T>(this) { // from class: com.google.common.collect.Iterables.6.1
                    boolean atStart = true;

                    @Override // java.util.Iterator
                    public boolean hasNext() {
                        return it.hasNext();
                    }

                    @Override // java.util.Iterator
                    @ParametricNullness
                    public T next() {
                        T t = (T) it.next();
                        this.atStart = false;
                        return t;
                    }

                    @Override // java.util.Iterator
                    public void remove() {
                        CollectPreconditions.checkRemove(!this.atStart);
                        it.remove();
                    }
                };
            }
        };
    }

    public static <T> Iterable<T> limit(final Iterable<T> iterable, final int limitSize) {
        Preconditions.checkNotNull(iterable);
        Preconditions.checkArgument(limitSize >= 0, "limit is negative");
        return new FluentIterable<T>() { // from class: com.google.common.collect.Iterables.7
            @Override // java.lang.Iterable
            public Iterator<T> iterator() {
                return Iterators.limit(iterable.iterator(), limitSize);
            }
        };
    }

    public static <T> Iterable<T> consumingIterable(final Iterable<T> iterable) {
        Preconditions.checkNotNull(iterable);
        return new FluentIterable<T>() { // from class: com.google.common.collect.Iterables.8
            @Override // java.lang.Iterable
            public Iterator<T> iterator() {
                Iterable iterable2 = iterable;
                if (iterable2 instanceof Queue) {
                    return new ConsumingQueueIterator((Queue) iterable2);
                }
                return Iterators.consumingIterator(iterable2.iterator());
            }

            @Override // com.google.common.collect.FluentIterable
            public String toString() {
                return "Iterables.consumingIterable(...)";
            }
        };
    }

    public static boolean isEmpty(Iterable<?> iterable) {
        if (iterable instanceof Collection) {
            return ((Collection) iterable).isEmpty();
        }
        return !iterable.iterator().hasNext();
    }

    public static <T> Iterable<T> mergeSorted(final Iterable<? extends Iterable<? extends T>> iterables, final Comparator<? super T> comparator) {
        Preconditions.checkNotNull(iterables, "iterables");
        Preconditions.checkNotNull(comparator, "comparator");
        return new UnmodifiableIterable(new FluentIterable<T>() { // from class: com.google.common.collect.Iterables.9
            @Override // java.lang.Iterable
            public Iterator<T> iterator() {
                return Iterators.mergeSorted(Iterables.transform(iterables, new FluentIterable$2$$ExternalSyntheticLambda0()), comparator);
            }
        });
    }
}
