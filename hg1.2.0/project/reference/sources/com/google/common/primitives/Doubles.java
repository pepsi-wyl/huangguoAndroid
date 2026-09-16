package com.google.common.primitives;

import com.google.common.base.Converter;
import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.RandomAccess;
import java.util.regex.Pattern;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Doubles extends DoublesMethodsForWeb {
    public static final int BYTES = 8;
    static final Pattern FLOATING_POINT_PATTERN = fpPattern();

    public static boolean isFinite(double value) {
        return Double.NEGATIVE_INFINITY < value && value < Double.POSITIVE_INFINITY;
    }

    private Doubles() {
    }

    public static int hashCode(double value) {
        return Double.valueOf(value).hashCode();
    }

    public static int compare(double a, double b) {
        return Double.compare(a, b);
    }

    public static boolean contains(double[] array, double target) {
        for (double d : array) {
            if (d == target) {
                return true;
            }
        }
        return false;
    }

    public static int indexOf(double[] array, double target) {
        return indexOf(array, target, 0, array.length);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int indexOf(double[] array, double target, int start, int end) {
        while (start < end) {
            if (array[start] == target) {
                return start;
            }
            start++;
        }
        return -1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0025, code lost:
    
        r0 = r0 + 1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int indexOf(double[] r8, double[] r9) {
        /*
            java.lang.String r0 = "array"
            com.google.common.base.Preconditions.checkNotNull(r8, r0)
            java.lang.String r0 = "target"
            com.google.common.base.Preconditions.checkNotNull(r9, r0)
            int r0 = r9.length
            r1 = 0
            if (r0 != 0) goto Lf
            return r1
        Lf:
            r0 = 0
        L10:
            int r2 = r8.length
            int r3 = r9.length
            int r2 = r2 - r3
            int r2 = r2 + 1
            if (r0 >= r2) goto L2c
            r2 = 0
        L18:
            int r3 = r9.length
            if (r2 >= r3) goto L2b
            int r3 = r0 + r2
            r3 = r8[r3]
            r5 = r9[r2]
            int r7 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r7 == 0) goto L28
            int r0 = r0 + 1
            goto L10
        L28:
            int r2 = r2 + 1
            goto L18
        L2b:
            return r0
        L2c:
            r8 = -1
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.common.primitives.Doubles.indexOf(double[], double[]):int");
    }

    public static int lastIndexOf(double[] array, double target) {
        return lastIndexOf(array, target, 0, array.length);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int lastIndexOf(double[] array, double target, int start, int end) {
        for (int i = end - 1; i >= start; i--) {
            if (array[i] == target) {
                return i;
            }
        }
        return -1;
    }

    public static double min(double... array) {
        Preconditions.checkArgument(array.length > 0);
        double dMin = array[0];
        for (int i = 1; i < array.length; i++) {
            dMin = Math.min(dMin, array[i]);
        }
        return dMin;
    }

    public static double max(double... array) {
        Preconditions.checkArgument(array.length > 0);
        double dMax = array[0];
        for (int i = 1; i < array.length; i++) {
            dMax = Math.max(dMax, array[i]);
        }
        return dMax;
    }

    public static double constrainToRange(double value, double min, double max) {
        if (min <= max) {
            return Math.min(Math.max(value, min), max);
        }
        throw new IllegalArgumentException(Strings.lenientFormat("min (%s) must be less than or equal to max (%s)", Double.valueOf(min), Double.valueOf(max)));
    }

    public static double[] concat(double[]... arrays) {
        int length = 0;
        for (double[] dArr : arrays) {
            length += dArr.length;
        }
        double[] dArr2 = new double[length];
        int length2 = 0;
        for (double[] dArr3 : arrays) {
            System.arraycopy(dArr3, 0, dArr2, length2, dArr3.length);
            length2 += dArr3.length;
        }
        return dArr2;
    }

    private static final class DoubleConverter extends Converter<String, Double> implements Serializable {
        static final Converter<String, Double> INSTANCE = new DoubleConverter();
        private static final long serialVersionUID = 1;

        private DoubleConverter() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.base.Converter
        public Double doForward(String value) {
            return Double.valueOf(value);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.common.base.Converter
        public String doBackward(Double value) {
            return value.toString();
        }

        public String toString() {
            return "Doubles.stringConverter()";
        }

        private Object readResolve() {
            return INSTANCE;
        }
    }

    public static Converter<String, Double> stringConverter() {
        return DoubleConverter.INSTANCE;
    }

    public static double[] ensureCapacity(double[] array, int minLength, int padding) {
        Preconditions.checkArgument(minLength >= 0, "Invalid minLength: %s", minLength);
        Preconditions.checkArgument(padding >= 0, "Invalid padding: %s", padding);
        return array.length < minLength ? Arrays.copyOf(array, minLength + padding) : array;
    }

    public static String join(String separator, double... array) {
        Preconditions.checkNotNull(separator);
        if (array.length == 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder(array.length * 12);
        sb.append(array[0]);
        for (int i = 1; i < array.length; i++) {
            sb.append(separator);
            sb.append(array[i]);
        }
        return sb.toString();
    }

    public static Comparator<double[]> lexicographicalComparator() {
        return LexicographicalComparator.INSTANCE;
    }

    private enum LexicographicalComparator implements Comparator<double[]> {
        INSTANCE;

        @Override // java.util.Comparator
        public int compare(double[] left, double[] right) {
            int iMin = Math.min(left.length, right.length);
            for (int i = 0; i < iMin; i++) {
                int iCompare = Double.compare(left[i], right[i]);
                if (iCompare != 0) {
                    return iCompare;
                }
            }
            return left.length - right.length;
        }

        @Override // java.lang.Enum
        public String toString() {
            return "Doubles.lexicographicalComparator()";
        }
    }

    public static void sortDescending(double[] array) {
        Preconditions.checkNotNull(array);
        sortDescending(array, 0, array.length);
    }

    public static void sortDescending(double[] array, int fromIndex, int toIndex) {
        Preconditions.checkNotNull(array);
        Preconditions.checkPositionIndexes(fromIndex, toIndex, array.length);
        Arrays.sort(array, fromIndex, toIndex);
        reverse(array, fromIndex, toIndex);
    }

    public static void reverse(double[] array) {
        Preconditions.checkNotNull(array);
        reverse(array, 0, array.length);
    }

    public static void reverse(double[] array, int fromIndex, int toIndex) {
        Preconditions.checkNotNull(array);
        Preconditions.checkPositionIndexes(fromIndex, toIndex, array.length);
        for (int i = toIndex - 1; fromIndex < i; i--) {
            double d = array[fromIndex];
            array[fromIndex] = array[i];
            array[i] = d;
            fromIndex++;
        }
    }

    public static void rotate(double[] array, int distance) {
        rotate(array, distance, 0, array.length);
    }

    public static void rotate(double[] array, int distance, int fromIndex, int toIndex) {
        Preconditions.checkNotNull(array);
        Preconditions.checkPositionIndexes(fromIndex, toIndex, array.length);
        if (array.length <= 1) {
            return;
        }
        int i = toIndex - fromIndex;
        int i2 = (-distance) % i;
        if (i2 < 0) {
            i2 += i;
        }
        int i3 = i2 + fromIndex;
        if (i3 == fromIndex) {
            return;
        }
        reverse(array, fromIndex, i3);
        reverse(array, i3, toIndex);
        reverse(array, fromIndex, toIndex);
    }

    public static double[] toArray(Collection<? extends Number> collection) {
        if (collection instanceof DoubleArrayAsList) {
            return ((DoubleArrayAsList) collection).toDoubleArray();
        }
        Object[] array = collection.toArray();
        int length = array.length;
        double[] dArr = new double[length];
        for (int i = 0; i < length; i++) {
            dArr[i] = ((Number) Preconditions.checkNotNull(array[i])).doubleValue();
        }
        return dArr;
    }

    public static List<Double> asList(double... backingArray) {
        if (backingArray.length == 0) {
            return Collections.emptyList();
        }
        return new DoubleArrayAsList(backingArray);
    }

    private static class DoubleArrayAsList extends AbstractList<Double> implements RandomAccess, Serializable {
        private static final long serialVersionUID = 0;
        final double[] array;
        final int end;
        final int start;

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public boolean isEmpty() {
            return false;
        }

        DoubleArrayAsList(double[] array) {
            this(array, 0, array.length);
        }

        DoubleArrayAsList(double[] array, int start, int end) {
            this.array = array;
            this.start = start;
            this.end = end;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public int size() {
            return this.end - this.start;
        }

        @Override // java.util.AbstractList, java.util.List
        public Double get(int index) {
            Preconditions.checkElementIndex(index, size());
            return Double.valueOf(this.array[this.start + index]);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public boolean contains(@CheckForNull Object target) {
            return (target instanceof Double) && Doubles.indexOf(this.array, ((Double) target).doubleValue(), this.start, this.end) != -1;
        }

        @Override // java.util.AbstractList, java.util.List
        public int indexOf(@CheckForNull Object target) {
            int iIndexOf;
            if (!(target instanceof Double) || (iIndexOf = Doubles.indexOf(this.array, ((Double) target).doubleValue(), this.start, this.end)) < 0) {
                return -1;
            }
            return iIndexOf - this.start;
        }

        @Override // java.util.AbstractList, java.util.List
        public int lastIndexOf(@CheckForNull Object target) {
            int iLastIndexOf;
            if (!(target instanceof Double) || (iLastIndexOf = Doubles.lastIndexOf(this.array, ((Double) target).doubleValue(), this.start, this.end)) < 0) {
                return -1;
            }
            return iLastIndexOf - this.start;
        }

        @Override // java.util.AbstractList, java.util.List
        public Double set(int index, Double element) {
            Preconditions.checkElementIndex(index, size());
            double[] dArr = this.array;
            int i = this.start;
            double d = dArr[i + index];
            dArr[i + index] = ((Double) Preconditions.checkNotNull(element)).doubleValue();
            return Double.valueOf(d);
        }

        @Override // java.util.AbstractList, java.util.List
        public List<Double> subList(int fromIndex, int toIndex) {
            Preconditions.checkPositionIndexes(fromIndex, toIndex, size());
            if (fromIndex == toIndex) {
                return Collections.emptyList();
            }
            double[] dArr = this.array;
            int i = this.start;
            return new DoubleArrayAsList(dArr, fromIndex + i, i + toIndex);
        }

        @Override // java.util.AbstractList, java.util.Collection, java.util.List
        public boolean equals(@CheckForNull Object object) {
            if (object == this) {
                return true;
            }
            if (object instanceof DoubleArrayAsList) {
                DoubleArrayAsList doubleArrayAsList = (DoubleArrayAsList) object;
                int size = size();
                if (doubleArrayAsList.size() != size) {
                    return false;
                }
                for (int i = 0; i < size; i++) {
                    if (this.array[this.start + i] != doubleArrayAsList.array[doubleArrayAsList.start + i]) {
                        return false;
                    }
                }
                return true;
            }
            return super.equals(object);
        }

        @Override // java.util.AbstractList, java.util.Collection, java.util.List
        public int hashCode() {
            int iHashCode = 1;
            for (int i = this.start; i < this.end; i++) {
                iHashCode = (iHashCode * 31) + Doubles.hashCode(this.array[i]);
            }
            return iHashCode;
        }

        @Override // java.util.AbstractCollection
        public String toString() {
            StringBuilder sb = new StringBuilder(size() * 12);
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

        double[] toDoubleArray() {
            return Arrays.copyOfRange(this.array, this.start, this.end);
        }
    }

    private static Pattern fpPattern() {
        return Pattern.compile("[+-]?(?:NaN|Infinity|(?:\\d+#(?:\\.\\d*#)?|\\.\\d+#)(?:[eE][+-]?\\d+#)?[fFdD]?|0[xX](?:[0-9a-fA-F]+#(?:\\.[0-9a-fA-F]*#)?|\\.[0-9a-fA-F]+#)[pP][+-]?\\d+#[fFdD]?)".replace("#", "+"));
    }

    @CheckForNull
    public static Double tryParse(String string) {
        if (!FLOATING_POINT_PATTERN.matcher(string).matches()) {
            return null;
        }
        try {
            return Double.valueOf(Double.parseDouble(string));
        } catch (NumberFormatException unused) {
            return null;
        }
    }
}
