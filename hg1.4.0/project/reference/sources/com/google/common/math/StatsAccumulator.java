package com.google.common.math;

import com.google.common.base.Preconditions;
import com.google.common.primitives.Doubles;
import java.util.Iterator;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class StatsAccumulator {
    private long count = 0;
    private double mean = 0.0d;
    private double sumOfSquaresOfDeltas = 0.0d;
    private double min = Double.NaN;
    private double max = Double.NaN;

    public void add(double value) {
        long j = this.count;
        if (j == 0) {
            this.count = 1L;
            this.mean = value;
            this.min = value;
            this.max = value;
            if (Doubles.isFinite(value)) {
                return;
            }
            this.sumOfSquaresOfDeltas = Double.NaN;
            return;
        }
        this.count = j + 1;
        if (Doubles.isFinite(value) && Doubles.isFinite(this.mean)) {
            double d = this.mean;
            double d2 = value - d;
            double d3 = d + (d2 / this.count);
            this.mean = d3;
            this.sumOfSquaresOfDeltas += d2 * (value - d3);
        } else {
            this.mean = calculateNewMeanNonFinite(this.mean, value);
            this.sumOfSquaresOfDeltas = Double.NaN;
        }
        this.min = Math.min(this.min, value);
        this.max = Math.max(this.max, value);
    }

    public void addAll(Iterable<? extends Number> values) {
        Iterator<? extends Number> it = values.iterator();
        while (it.hasNext()) {
            add(it.next().doubleValue());
        }
    }

    public void addAll(Iterator<? extends Number> values) {
        while (values.hasNext()) {
            add(values.next().doubleValue());
        }
    }

    public void addAll(double... values) {
        for (double d : values) {
            add(d);
        }
    }

    public void addAll(int... values) {
        for (int i : values) {
            add(i);
        }
    }

    public void addAll(long... values) {
        for (long j : values) {
            add(j);
        }
    }

    public void addAll(Stats values) {
        if (values.count() == 0) {
            return;
        }
        merge(values.count(), values.mean(), values.sumOfSquaresOfDeltas(), values.min(), values.max());
    }

    public void addAll(StatsAccumulator values) {
        if (values.count() == 0) {
            return;
        }
        merge(values.count(), values.mean(), values.sumOfSquaresOfDeltas(), values.min(), values.max());
    }

    private void merge(long otherCount, double otherMean, double otherSumOfSquaresOfDeltas, double otherMin, double otherMax) {
        long j = this.count;
        if (j == 0) {
            this.count = otherCount;
            this.mean = otherMean;
            this.sumOfSquaresOfDeltas = otherSumOfSquaresOfDeltas;
            this.min = otherMin;
            this.max = otherMax;
            return;
        }
        this.count = j + otherCount;
        if (Doubles.isFinite(this.mean) && Doubles.isFinite(otherMean)) {
            double d = this.mean;
            double d2 = otherMean - d;
            double d3 = otherCount;
            double d4 = d + ((d2 * d3) / this.count);
            this.mean = d4;
            this.sumOfSquaresOfDeltas += otherSumOfSquaresOfDeltas + (d2 * (otherMean - d4) * d3);
        } else {
            this.mean = calculateNewMeanNonFinite(this.mean, otherMean);
            this.sumOfSquaresOfDeltas = Double.NaN;
        }
        this.min = Math.min(this.min, otherMin);
        this.max = Math.max(this.max, otherMax);
    }

    public Stats snapshot() {
        return new Stats(this.count, this.mean, this.sumOfSquaresOfDeltas, this.min, this.max);
    }

    public long count() {
        return this.count;
    }

    public double mean() {
        Preconditions.checkState(this.count != 0);
        return this.mean;
    }

    public final double sum() {
        return this.mean * this.count;
    }

    public final double populationVariance() {
        Preconditions.checkState(this.count != 0);
        if (Double.isNaN(this.sumOfSquaresOfDeltas)) {
            return Double.NaN;
        }
        if (this.count == 1) {
            return 0.0d;
        }
        return DoubleUtils.ensureNonNegative(this.sumOfSquaresOfDeltas) / this.count;
    }

    public final double populationStandardDeviation() {
        return Math.sqrt(populationVariance());
    }

    public final double sampleVariance() {
        Preconditions.checkState(this.count > 1);
        if (Double.isNaN(this.sumOfSquaresOfDeltas)) {
            return Double.NaN;
        }
        return DoubleUtils.ensureNonNegative(this.sumOfSquaresOfDeltas) / (this.count - 1);
    }

    public final double sampleStandardDeviation() {
        return Math.sqrt(sampleVariance());
    }

    public double min() {
        Preconditions.checkState(this.count != 0);
        return this.min;
    }

    public double max() {
        Preconditions.checkState(this.count != 0);
        return this.max;
    }

    double sumOfSquaresOfDeltas() {
        return this.sumOfSquaresOfDeltas;
    }

    static double calculateNewMeanNonFinite(double previousMean, double value) {
        if (Doubles.isFinite(previousMean)) {
            return value;
        }
        if (Doubles.isFinite(value) || previousMean == value) {
            return previousMean;
        }
        return Double.NaN;
    }
}
