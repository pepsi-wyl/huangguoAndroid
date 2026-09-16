package com.google.common.primitives;

import com.google.common.base.Preconditions;
import com.google.errorprone.annotations.Immutable;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.RandomAccess;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
@Immutable
/* loaded from: classes.dex */
public final class ImmutableLongArray implements Serializable {
    private static final ImmutableLongArray EMPTY = new ImmutableLongArray(new long[0]);
    private final long[] array;
    private final int end;
    private final transient int start;

    public static ImmutableLongArray of() {
        return EMPTY;
    }

    public static ImmutableLongArray of(long e0) {
        return new ImmutableLongArray(new long[]{e0});
    }

    public static ImmutableLongArray of(long e0, long e1) {
        return new ImmutableLongArray(new long[]{e0, e1});
    }

    public static ImmutableLongArray of(long e0, long e1, long e2) {
        return new ImmutableLongArray(new long[]{e0, e1, e2});
    }

    public static ImmutableLongArray of(long e0, long e1, long e2, long e3) {
        return new ImmutableLongArray(new long[]{e0, e1, e2, e3});
    }

    public static ImmutableLongArray of(long e0, long e1, long e2, long e3, long e4) {
        return new ImmutableLongArray(new long[]{e0, e1, e2, e3, e4});
    }

    public static ImmutableLongArray of(long e0, long e1, long e2, long e3, long e4, long e5) {
        return new ImmutableLongArray(new long[]{e0, e1, e2, e3, e4, e5});
    }

    public static ImmutableLongArray of(long first, long... rest) {
        Preconditions.checkArgument(rest.length <= 2147483646, "the total number of elements must fit in an int");
        long[] jArr = new long[rest.length + 1];
        jArr[0] = first;
        System.arraycopy(rest, 0, jArr, 1, rest.length);
        return new ImmutableLongArray(jArr);
    }

    public static ImmutableLongArray copyOf(long[] values) {
        if (values.length == 0) {
            return EMPTY;
        }
        return new ImmutableLongArray(Arrays.copyOf(values, values.length));
    }

    public static ImmutableLongArray copyOf(Collection<Long> values) {
        return values.isEmpty() ? EMPTY : new ImmutableLongArray(Longs.toArray(values));
    }

    public static ImmutableLongArray copyOf(Iterable<Long> values) {
        if (values instanceof Collection) {
            return copyOf((Collection<Long>) values);
        }
        return builder().addAll(values).build();
    }

    public static Builder builder(int initialCapacity) {
        Preconditions.checkArgument(initialCapacity >= 0, "Invalid initialCapacity: %s", initialCapacity);
        return new Builder(initialCapacity);
    }

    public static Builder builder() {
        return new Builder(10);
    }

    public static final class Builder {
        private long[] array;
        private int count = 0;

        Builder(int initialCapacity) {
            this.array = new long[initialCapacity];
        }

        public Builder add(long value) {
            ensureRoomFor(1);
            long[] jArr = this.array;
            int i = this.count;
            jArr[i] = value;
            this.count = i + 1;
            return this;
        }

        public Builder addAll(long[] values) {
            ensureRoomFor(values.length);
            System.arraycopy(values, 0, this.array, this.count, values.length);
            this.count += values.length;
            return this;
        }

        public Builder addAll(Iterable<Long> values) {
            if (values instanceof Collection) {
                return addAll((Collection<Long>) values);
            }
            Iterator<Long> it = values.iterator();
            while (it.hasNext()) {
                add(it.next().longValue());
            }
            return this;
        }

        public Builder addAll(Collection<Long> values) {
            ensureRoomFor(values.size());
            for (Long l : values) {
                long[] jArr = this.array;
                int i = this.count;
                this.count = i + 1;
                jArr[i] = l.longValue();
            }
            return this;
        }

        public Builder addAll(ImmutableLongArray values) {
            ensureRoomFor(values.length());
            System.arraycopy(values.array, values.start, this.array, this.count, values.length());
            this.count += values.length();
            return this;
        }

        private void ensureRoomFor(int numberToAdd) {
            int i = this.count + numberToAdd;
            long[] jArr = this.array;
            if (i > jArr.length) {
                this.array = Arrays.copyOf(jArr, expandedCapacity(jArr.length, i));
            }
        }

        private static int expandedCapacity(int oldCapacity, int minCapacity) {
            if (minCapacity < 0) {
                throw new AssertionError("cannot store more than MAX_VALUE elements");
            }
            int iHighestOneBit = oldCapacity + (oldCapacity >> 1) + 1;
            if (iHighestOneBit < minCapacity) {
                iHighestOneBit = Integer.highestOneBit(minCapacity - 1) << 1;
            }
            if (iHighestOneBit < 0) {
                return Integer.MAX_VALUE;
            }
            return iHighestOneBit;
        }

        public ImmutableLongArray build() {
            if (this.count == 0) {
                return ImmutableLongArray.EMPTY;
            }
            return new ImmutableLongArray(this.array, 0, this.count);
        }
    }

    private ImmutableLongArray(long[] array) {
        this(array, 0, array.length);
    }

    private ImmutableLongArray(long[] array, int start, int end) {
        this.array = array;
        this.start = start;
        this.end = end;
    }

    public int length() {
        return this.end - this.start;
    }

    public boolean isEmpty() {
        return this.end == this.start;
    }

    public long get(int index) {
        Preconditions.checkElementIndex(index, length());
        return this.array[this.start + index];
    }

    public int indexOf(long target) {
        for (int i = this.start; i < this.end; i++) {
            if (this.array[i] == target) {
                return i - this.start;
            }
        }
        return -1;
    }

    public int lastIndexOf(long target) {
        int i;
        int i2 = this.end;
        do {
            i2--;
            i = this.start;
            if (i2 < i) {
                return -1;
            }
        } while (this.array[i2] != target);
        return i2 - i;
    }

    public boolean contains(long target) {
        return indexOf(target) >= 0;
    }

    public long[] toArray() {
        return Arrays.copyOfRange(this.array, this.start, this.end);
    }

    public ImmutableLongArray subArray(int startIndex, int endIndex) {
        Preconditions.checkPositionIndexes(startIndex, endIndex, length());
        if (startIndex == endIndex) {
            return EMPTY;
        }
        long[] jArr = this.array;
        int i = this.start;
        return new ImmutableLongArray(jArr, startIndex + i, i + endIndex);
    }

    public List<Long> asList() {
        return new AsList();
    }

    static class AsList extends AbstractList<Long> implements RandomAccess, Serializable {
        private final ImmutableLongArray parent;

        private AsList(ImmutableLongArray parent) {
            this.parent = parent;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return this.parent.length();
        }

        @Override // java.util.AbstractList, java.util.List
        public Long get(int index) {
            return Long.valueOf(this.parent.get(index));
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public boolean contains(@CheckForNull Object target) {
            return indexOf(target) >= 0;
        }

        @Override // java.util.AbstractList, java.util.List
        public int indexOf(@CheckForNull Object target) {
            if (target instanceof Long) {
                return this.parent.indexOf(((Long) target).longValue());
            }
            return -1;
        }

        @Override // java.util.AbstractList, java.util.List
        public int lastIndexOf(@CheckForNull Object target) {
            if (target instanceof Long) {
                return this.parent.lastIndexOf(((Long) target).longValue());
            }
            return -1;
        }

        @Override // java.util.AbstractList, java.util.List
        public List<Long> subList(int fromIndex, int toIndex) {
            return this.parent.subArray(fromIndex, toIndex).asList();
        }

        @Override // java.util.AbstractList, java.util.Collection, java.util.List
        public boolean equals(@CheckForNull Object object) {
            if (object instanceof AsList) {
                return this.parent.equals(((AsList) object).parent);
            }
            if (!(object instanceof List)) {
                return false;
            }
            List list = (List) object;
            if (size() != list.size()) {
                return false;
            }
            int i = this.parent.start;
            for (Object obj : list) {
                if (obj instanceof Long) {
                    int i2 = i + 1;
                    if (this.parent.array[i] == ((Long) obj).longValue()) {
                        i = i2;
                    }
                }
                return false;
            }
            return true;
        }

        @Override // java.util.AbstractList, java.util.Collection, java.util.List
        public int hashCode() {
            return this.parent.hashCode();
        }

        @Override // java.util.AbstractCollection
        public String toString() {
            return this.parent.toString();
        }
    }

    public boolean equals(@CheckForNull Object object) {
        if (object == this) {
            return true;
        }
        if (!(object instanceof ImmutableLongArray)) {
            return false;
        }
        ImmutableLongArray immutableLongArray = (ImmutableLongArray) object;
        if (length() != immutableLongArray.length()) {
            return false;
        }
        for (int i = 0; i < length(); i++) {
            if (get(i) != immutableLongArray.get(i)) {
                return false;
            }
        }
        return true;
    }

    public int hashCode() {
        int iHashCode = 1;
        for (int i = this.start; i < this.end; i++) {
            iHashCode = (iHashCode * 31) + Longs.hashCode(this.array[i]);
        }
        return iHashCode;
    }

    public String toString() {
        if (isEmpty()) {
            return "[]";
        }
        StringBuilder sb = new StringBuilder(length() * 5);
        sb.append('[');
        sb.append(this.array[this.start]);
        int i = this.start;
        while (true) {
            i++;
            if (i < this.end) {
                sb.append(", ");
                sb.append(this.array[i]);
            } else {
                sb.append(']');
                return sb.toString();
            }
        }
    }

    public ImmutableLongArray trimmed() {
        return isPartialView() ? new ImmutableLongArray(toArray()) : this;
    }

    private boolean isPartialView() {
        return this.start > 0 || this.end < this.array.length;
    }

    Object writeReplace() {
        return trimmed();
    }

    Object readResolve() {
        return isEmpty() ? EMPTY : this;
    }
}
