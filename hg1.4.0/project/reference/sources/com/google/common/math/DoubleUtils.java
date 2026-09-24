package com.google.common.math;

import androidx.media3.exoplayer.analytics.AnalyticsListener;
import com.google.common.base.Preconditions;
import java.math.BigInteger;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class DoubleUtils {
    static final int EXPONENT_BIAS = 1023;
    static final long EXPONENT_MASK = 9218868437227405312L;
    static final long IMPLICIT_BIT = 4503599627370496L;
    static final long ONE_BITS = 4607182418800017408L;
    static final int SIGNIFICAND_BITS = 52;
    static final long SIGNIFICAND_MASK = 4503599627370495L;
    static final long SIGN_MASK = Long.MIN_VALUE;

    private DoubleUtils() {
    }

    static double nextDown(double d) {
        return -Math.nextUp(-d);
    }

    static long getSignificand(double d) {
        Preconditions.checkArgument(isFinite(d), "not a normal value");
        int exponent = Math.getExponent(d);
        long jDoubleToRawLongBits = Double.doubleToRawLongBits(d) & SIGNIFICAND_MASK;
        return exponent == -1023 ? jDoubleToRawLongBits << 1 : jDoubleToRawLongBits | IMPLICIT_BIT;
    }

    static boolean isFinite(double d) {
        return Math.getExponent(d) <= 1023;
    }

    static boolean isNormal(double d) {
        return Math.getExponent(d) >= -1022;
    }

    static double scaleNormalize(double x) {
        return Double.longBitsToDouble((Double.doubleToRawLongBits(x) & SIGNIFICAND_MASK) | ONE_BITS);
    }

    static double bigToDouble(BigInteger x) {
        BigInteger bigIntegerAbs = x.abs();
        int iBitLength = bigIntegerAbs.bitLength();
        int i = iBitLength - 1;
        if (i < 63) {
            return x.longValue();
        }
        if (i > 1023) {
            return x.signum() * Double.POSITIVE_INFINITY;
        }
        int i2 = iBitLength - 54;
        long jLongValue = bigIntegerAbs.shiftRight(i2).longValue();
        long j = jLongValue >> 1;
        long j2 = SIGNIFICAND_MASK & j;
        if ((jLongValue & 1) != 0 && ((j & 1) != 0 || bigIntegerAbs.getLowestSetBit() < i2)) {
            j2++;
        }
        return Double.longBitsToDouble((((iBitLength + AnalyticsListener.EVENT_DRM_SESSION_ACQUIRED) << 52) + j2) | (x.signum() & Long.MIN_VALUE));
    }

    static double ensureNonNegative(double value) {
        Preconditions.checkArgument(!Double.isNaN(value));
        return Math.max(value, 0.0d);
    }
}
