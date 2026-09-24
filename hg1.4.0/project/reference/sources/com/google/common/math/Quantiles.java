package com.google.common.math;

import com.google.common.base.Preconditions;
import com.google.common.primitives.Doubles;
import com.google.common.primitives.Ints;
import java.math.RoundingMode;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Quantiles {
    /* JADX INFO: Access modifiers changed from: private */
    public static double interpolate(double lower, double upper, double remainder, double scale) {
        if (lower == Double.NEGATIVE_INFINITY) {
            return upper == Double.POSITIVE_INFINITY ? Double.NaN : Double.NEGATIVE_INFINITY;
        }
        if (upper == Double.POSITIVE_INFINITY) {
            return Double.POSITIVE_INFINITY;
        }
        return lower + (((upper - lower) * remainder) / scale);
    }

    public static ScaleAndIndex median() {
        return scale(2).index(1);
    }

    public static Scale quartiles() {
        return scale(4);
    }

    public static Scale percentiles() {
        return scale(100);
    }

    public static Scale scale(int scale) {
        return new Scale(scale);
    }

    public static final class Scale {
        private final int scale;

        private Scale(int scale) {
            Preconditions.checkArgument(scale > 0, "Quantile scale must be positive");
            this.scale = scale;
        }

        public ScaleAndIndex index(int index) {
            return new ScaleAndIndex(this.scale, index);
        }

        public ScaleAndIndexes indexes(int... indexes) {
            return new ScaleAndIndexes(this.scale, (int[]) indexes.clone());
        }

        public ScaleAndIndexes indexes(Collection<Integer> indexes) {
            return new ScaleAndIndexes(this.scale, Ints.toArray(indexes));
        }
    }

    public static final class ScaleAndIndex {
        private final int index;
        private final int scale;

        private ScaleAndIndex(int scale, int index) {
            Quantiles.checkIndex(index, scale);
            this.scale = scale;
            this.index = index;
        }

        public double compute(Collection<? extends Number> dataset) {
            return computeInPlace(Doubles.toArray(dataset));
        }

        public double compute(double... dataset) {
            return computeInPlace((double[]) dataset.clone());
        }

        public double compute(long... dataset) {
            return computeInPlace(Quantiles.longsToDoubles(dataset));
        }

        public double compute(int... dataset) {
            return computeInPlace(Quantiles.intsToDoubles(dataset));
        }

        public double computeInPlace(double... dataset) {
            Preconditions.checkArgument(dataset.length > 0, "Cannot calculate quantiles of an empty dataset");
            if (Quantiles.containsNaN(dataset)) {
                return Double.NaN;
            }
            long length = this.index * (dataset.length - 1);
            int iDivide = (int) LongMath.divide(length, this.scale, RoundingMode.DOWN);
            int i = (int) (length - (iDivide * this.scale));
            Quantiles.selectInPlace(iDivide, dataset, 0, dataset.length - 1);
            if (i != 0) {
                int i2 = iDivide + 1;
                Quantiles.selectInPlace(i2, dataset, i2, dataset.length - 1);
                return Quantiles.interpolate(dataset[iDivide], dataset[i2], i, this.scale);
            }
            return dataset[iDivide];
        }
    }

    public static final class ScaleAndIndexes {
        private final int[] indexes;
        private final int scale;

        private ScaleAndIndexes(int scale, int[] indexes) {
            for (int i : indexes) {
                Quantiles.checkIndex(i, scale);
            }
            Preconditions.checkArgument(indexes.length > 0, "Indexes must be a non empty array");
            this.scale = scale;
            this.indexes = indexes;
        }

        public Map<Integer, Double> compute(Collection<? extends Number> dataset) {
            return computeInPlace(Doubles.toArray(dataset));
        }

        public Map<Integer, Double> compute(double... dataset) {
            return computeInPlace((double[]) dataset.clone());
        }

        public Map<Integer, Double> compute(long... dataset) {
            return computeInPlace(Quantiles.longsToDoubles(dataset));
        }

        public Map<Integer, Double> compute(int... dataset) {
            return computeInPlace(Quantiles.intsToDoubles(dataset));
        }

        public Map<Integer, Double> computeInPlace(double... dataset) {
            int i = 0;
            int i2 = 1;
            Preconditions.checkArgument(dataset.length > 0, "Cannot calculate quantiles of an empty dataset");
            if (Quantiles.containsNaN(dataset)) {
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                int[] iArr = this.indexes;
                int length = iArr.length;
                while (i < length) {
                    linkedHashMap.put(Integer.valueOf(iArr[i]), Double.valueOf(Double.NaN));
                    i++;
                }
                return Collections.unmodifiableMap(linkedHashMap);
            }
            int[] iArr2 = this.indexes;
            int[] iArr3 = new int[iArr2.length];
            int[] iArr4 = new int[iArr2.length];
            int[] iArr5 = new int[iArr2.length * 2];
            int i3 = 0;
            int i4 = 0;
            while (true) {
                if (i3 >= this.indexes.length) {
                    break;
                }
                long length2 = r5[i3] * (dataset.length - i2);
                int iDivide = (int) LongMath.divide(length2, this.scale, RoundingMode.DOWN);
                int i5 = i3;
                int i6 = (int) (length2 - (iDivide * this.scale));
                iArr3[i5] = iDivide;
                iArr4[i5] = i6;
                iArr5[i4] = iDivide;
                int i7 = i4 + 1;
                if (i6 != 0) {
                    iArr5[i7] = iDivide + 1;
                    i4 += 2;
                } else {
                    i4 = i7;
                }
                i3 = i5 + 1;
                i2 = 1;
            }
            Arrays.sort(iArr5, 0, i4);
            Quantiles.selectAllInPlace(iArr5, 0, i4 - 1, dataset, 0, dataset.length - 1);
            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
            while (true) {
                int[] iArr6 = this.indexes;
                if (i < iArr6.length) {
                    int i8 = iArr3[i];
                    int i9 = iArr4[i];
                    if (i9 == 0) {
                        linkedHashMap2.put(Integer.valueOf(iArr6[i]), Double.valueOf(dataset[i8]));
                    } else {
                        linkedHashMap2.put(Integer.valueOf(iArr6[i]), Double.valueOf(Quantiles.interpolate(dataset[i8], dataset[i8 + 1], i9, this.scale)));
                    }
                    i++;
                } else {
                    return Collections.unmodifiableMap(linkedHashMap2);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean containsNaN(double... dataset) {
        for (double d : dataset) {
            if (Double.isNaN(d)) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void checkIndex(int index, int scale) {
        if (index < 0 || index > scale) {
            throw new IllegalArgumentException("Quantile indexes must be between 0 and the scale, which is " + scale);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static double[] longsToDoubles(long[] longs) {
        int length = longs.length;
        double[] dArr = new double[length];
        for (int i = 0; i < length; i++) {
            dArr[i] = longs[i];
        }
        return dArr;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static double[] intsToDoubles(int[] ints) {
        int length = ints.length;
        double[] dArr = new double[length];
        for (int i = 0; i < length; i++) {
            dArr[i] = ints[i];
        }
        return dArr;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void selectInPlace(int required, double[] array, int from, int to) {
        if (required != from) {
            while (to > from) {
                int iPartition = partition(array, from, to);
                if (iPartition >= required) {
                    to = iPartition - 1;
                }
                if (iPartition <= required) {
                    from = iPartition + 1;
                }
            }
            return;
        }
        int i = from;
        for (int i2 = from + 1; i2 <= to; i2++) {
            if (array[i] > array[i2]) {
                i = i2;
            }
        }
        if (i != from) {
            swap(array, i, from);
        }
    }

    private static int partition(double[] array, int from, int to) {
        movePivotToStartOfSlice(array, from, to);
        double d = array[from];
        int i = to;
        while (to > from) {
            if (array[to] > d) {
                swap(array, i, to);
                i--;
            }
            to--;
        }
        swap(array, from, i);
        return i;
    }

    private static void movePivotToStartOfSlice(double[] array, int from, int to) {
        int i = (from + to) >>> 1;
        double d = array[to];
        double d2 = array[i];
        boolean z = d < d2;
        double d3 = array[from];
        boolean z2 = d2 < d3;
        boolean z3 = d < d3;
        if (z == z2) {
            swap(array, i, from);
        } else if (z != z3) {
            swap(array, from, to);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void selectAllInPlace(int[] allRequired, int requiredFrom, int requiredTo, double[] array, int from, int to) {
        int iChooseNextSelection = chooseNextSelection(allRequired, requiredFrom, requiredTo, from, to);
        int i = allRequired[iChooseNextSelection];
        selectInPlace(i, array, from, to);
        int i2 = iChooseNextSelection - 1;
        while (i2 >= requiredFrom && allRequired[i2] == i) {
            i2--;
        }
        if (i2 >= requiredFrom) {
            selectAllInPlace(allRequired, requiredFrom, i2, array, from, i - 1);
        }
        int i3 = iChooseNextSelection + 1;
        while (i3 <= requiredTo && allRequired[i3] == i) {
            i3++;
        }
        if (i3 <= requiredTo) {
            selectAllInPlace(allRequired, i3, requiredTo, array, i + 1, to);
        }
    }

    private static int chooseNextSelection(int[] allRequired, int requiredFrom, int requiredTo, int from, int to) {
        if (requiredFrom == requiredTo) {
            return requiredFrom;
        }
        int i = from + to;
        int i2 = i >>> 1;
        while (requiredTo > requiredFrom + 1) {
            int i3 = (requiredFrom + requiredTo) >>> 1;
            int i4 = allRequired[i3];
            if (i4 > i2) {
                requiredTo = i3;
            } else {
                if (i4 >= i2) {
                    return i3;
                }
                requiredFrom = i3;
            }
        }
        return (i - allRequired[requiredFrom]) - allRequired[requiredTo] > 0 ? requiredTo : requiredFrom;
    }

    private static void swap(double[] array, int i, int j) {
        double d = array[i];
        array[i] = array[j];
        array[j] = d;
    }
}
