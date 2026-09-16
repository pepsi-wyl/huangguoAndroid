package com.google.common.math;

import androidx.media3.common.C;
import androidx.media3.exoplayer.MediaPeriodQueue;
import androidx.media3.exoplayer.Renderer;
import androidx.media3.exoplayer.audio.SilenceSkippingAudioProcessor;
import androidx.media3.exoplayer.upstream.CmcdData;
import androidx.media3.extractor.ts.TsExtractor;
import com.google.common.base.Ascii;
import com.google.common.base.Preconditions;
import com.google.common.primitives.Longs;
import com.google.common.primitives.UnsignedLongs;
import io.flutter.embedding.android.KeyboardMap;
import java.math.RoundingMode;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class LongMath {
    static final long FLOOR_SQRT_MAX_LONG = 3037000499L;
    static final long MAX_POWER_OF_SQRT2_UNSIGNED = -5402926248376769404L;
    static final long MAX_SIGNED_POWER_OF_TWO = 4611686018427387904L;
    private static final int SIEVE_30 = -545925251;
    static final byte[] maxLog10ForLeadingZeros = {19, Ascii.DC2, Ascii.DC2, Ascii.DC2, Ascii.DC2, 17, 17, 17, Ascii.DLE, Ascii.DLE, Ascii.DLE, Ascii.SI, Ascii.SI, Ascii.SI, Ascii.SI, Ascii.SO, Ascii.SO, Ascii.SO, Ascii.CR, Ascii.CR, Ascii.CR, Ascii.FF, Ascii.FF, Ascii.FF, Ascii.FF, Ascii.VT, Ascii.VT, Ascii.VT, 10, 10, 10, 9, 9, 9, 9, 8, 8, 8, 7, 7, 7, 6, 6, 6, 6, 5, 5, 5, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 1, 1, 1, 0, 0, 0};
    static final long[] powersOf10 = {1, 10, 100, 1000, Renderer.DEFAULT_DURATION_TO_PROGRESS_US, SilenceSkippingAudioProcessor.DEFAULT_MINIMUM_SILENCE_DURATION_US, 1000000, 10000000, 100000000, C.NANOS_PER_SECOND, 10000000000L, 100000000000L, MediaPeriodQueue.INITIAL_RENDERER_POSITION_OFFSET_US, 10000000000000L, 100000000000000L, 1000000000000000L, 10000000000000000L, 100000000000000000L, 1000000000000000000L};
    static final long[] halfPowersOf10 = {3, 31, 316, 3162, 31622, 316227, 3162277, 31622776, 316227766, 3162277660L, 31622776601L, 316227766016L, 3162277660168L, 31622776601683L, 316227766016837L, 3162277660168379L, 31622776601683793L, 316227766016837933L, 3162277660168379331L};
    static final long[] factorials = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600, 6227020800L, 87178291200L, 1307674368000L, 20922789888000L, 355687428096000L, 6402373705728000L, 121645100408832000L, 2432902008176640000L};
    static final int[] biggestBinomials = {Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE, 3810779, 121977, 16175, 4337, 1733, 887, 534, 361, 265, 206, 169, 143, 125, 111, 101, 94, 88, 83, 79, 76, 74, 72, 70, 69, 68, 67, 67, 66, 66, 66, 66};
    static final int[] biggestSimpleBinomials = {Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE, 2642246, 86251, 11724, 3218, 1313, 684, 419, 287, 214, 169, TsExtractor.TS_STREAM_TYPE_DTS_UHD, 119, 105, 95, 87, 81, 76, 73, 70, 68, 66, 64, 63, 62, 62, 61, 61, 61};
    private static final long[][] millerRabinBaseSets = {new long[]{291830, 126401071349994536L}, new long[]{885594168, 725270293939359937L, 3569819667048198375L}, new long[]{273919523040L, 15, 7363882082L, 992620450144556L}, new long[]{47636622961200L, 2, 2570940, 211991001, 3749873356L}, new long[]{7999252175582850L, 2, 4130806001517L, 149795463772692060L, 186635894390467037L, 3967304179347715805L}, new long[]{585226005592931976L, 2, 123635709730000L, 9233062284813009L, 43835965440333360L, 761179012939631437L, 1263739024124850375L}, new long[]{Long.MAX_VALUE, 2, 325, 9375, 28178, 450775, 9780504, 1795265022}};

    static boolean fitsInInt(long x) {
        return ((long) ((int) x)) == x;
    }

    public static boolean isPowerOfTwo(long x) {
        return (x > 0) & ((x & (x - 1)) == 0);
    }

    static int lessThanBranchFree(long x, long y) {
        return (int) ((~(~(x - y))) >>> 63);
    }

    public static long mean(long x, long y) {
        return (x & y) + ((x ^ y) >> 1);
    }

    public static long saturatedAdd(long a, long b) {
        long j = a + b;
        return (((b ^ a) > 0L ? 1 : ((b ^ a) == 0L ? 0 : -1)) < 0) | ((a ^ j) >= 0) ? j : ((j >>> 63) ^ 1) + Long.MAX_VALUE;
    }

    public static long saturatedSubtract(long a, long b) {
        long j = a - b;
        return (((b ^ a) > 0L ? 1 : ((b ^ a) == 0L ? 0 : -1)) >= 0) | ((a ^ j) >= 0) ? j : ((j >>> 63) ^ 1) + Long.MAX_VALUE;
    }

    public static long ceilingPowerOfTwo(long x) {
        MathPreconditions.checkPositive("x", x);
        if (x > 4611686018427387904L) {
            throw new ArithmeticException("ceilingPowerOfTwo(" + x + ") is not representable as a long");
        }
        return 1 << (-Long.numberOfLeadingZeros(x - 1));
    }

    public static long floorPowerOfTwo(long x) {
        MathPreconditions.checkPositive("x", x);
        return 1 << (63 - Long.numberOfLeadingZeros(x));
    }

    /* renamed from: com.google.common.math.LongMath$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$java$math$RoundingMode;

        static {
            int[] iArr = new int[RoundingMode.values().length];
            $SwitchMap$java$math$RoundingMode = iArr;
            try {
                iArr[RoundingMode.UNNECESSARY.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.DOWN.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.FLOOR.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.UP.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.CEILING.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_DOWN.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_UP.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_EVEN.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
        }
    }

    public static int log2(long x, RoundingMode mode) {
        MathPreconditions.checkPositive("x", x);
        switch (AnonymousClass1.$SwitchMap$java$math$RoundingMode[mode.ordinal()]) {
            case 1:
                MathPreconditions.checkRoundingUnnecessary(isPowerOfTwo(x));
                break;
            case 2:
            case 3:
                break;
            case 4:
            case 5:
                return 64 - Long.numberOfLeadingZeros(x - 1);
            case 6:
            case 7:
            case 8:
                int iNumberOfLeadingZeros = Long.numberOfLeadingZeros(x);
                return (63 - iNumberOfLeadingZeros) + lessThanBranchFree(MAX_POWER_OF_SQRT2_UNSIGNED >>> iNumberOfLeadingZeros, x);
            default:
                throw new AssertionError("impossible");
        }
        return 63 - Long.numberOfLeadingZeros(x);
    }

    public static int log10(long x, RoundingMode mode) {
        int iLessThanBranchFree;
        MathPreconditions.checkPositive("x", x);
        int iLog10Floor = log10Floor(x);
        long j = powersOf10[iLog10Floor];
        switch (AnonymousClass1.$SwitchMap$java$math$RoundingMode[mode.ordinal()]) {
            case 1:
                MathPreconditions.checkRoundingUnnecessary(x == j);
            case 2:
            case 3:
                return iLog10Floor;
            case 4:
            case 5:
                iLessThanBranchFree = lessThanBranchFree(j, x);
                return iLog10Floor + iLessThanBranchFree;
            case 6:
            case 7:
            case 8:
                iLessThanBranchFree = lessThanBranchFree(halfPowersOf10[iLog10Floor], x);
                return iLog10Floor + iLessThanBranchFree;
            default:
                throw new AssertionError();
        }
    }

    static int log10Floor(long x) {
        byte b = maxLog10ForLeadingZeros[Long.numberOfLeadingZeros(x)];
        return b - lessThanBranchFree(x, powersOf10[b]);
    }

    public static long pow(long b, int k) {
        MathPreconditions.checkNonNegative("exponent", k);
        if (-2 > b || b > 2) {
            long j = 1;
            while (k != 0) {
                if (k == 1) {
                    return j * b;
                }
                j *= (k & 1) == 0 ? 1L : b;
                b *= b;
                k >>= 1;
            }
            return j;
        }
        int i = (int) b;
        if (i == -2) {
            if (k < 64) {
                return (k & 1) == 0 ? 1 << k : -(1 << k);
            }
            return 0L;
        }
        if (i == -1) {
            return (k & 1) == 0 ? 1L : -1L;
        }
        if (i == 0) {
            return k == 0 ? 1L : 0L;
        }
        if (i == 1) {
            return 1L;
        }
        if (i != 2) {
            throw new AssertionError();
        }
        if (k < 64) {
            return 1 << k;
        }
        return 0L;
    }

    public static long sqrt(long j, RoundingMode roundingMode) {
        MathPreconditions.checkNonNegative("x", j);
        if (fitsInInt(j)) {
            return IntMath.sqrt((int) j, roundingMode);
        }
        long jSqrt = (long) Math.sqrt(j);
        long j2 = jSqrt * jSqrt;
        switch (AnonymousClass1.$SwitchMap$java$math$RoundingMode[roundingMode.ordinal()]) {
            case 1:
                MathPreconditions.checkRoundingUnnecessary(j2 == j);
                return jSqrt;
            case 2:
            case 3:
                return j < j2 ? jSqrt - 1 : jSqrt;
            case 4:
            case 5:
                return j > j2 ? jSqrt + 1 : jSqrt;
            case 6:
            case 7:
            case 8:
                return (jSqrt - (j >= j2 ? 0 : 1)) + lessThanBranchFree((r0 * r0) + r0, j);
            default:
                throw new AssertionError();
        }
    }

    public static long divide(long p, long q, RoundingMode mode) {
        Preconditions.checkNotNull(mode);
        long j = p / q;
        long j2 = p - (q * j);
        if (j2 == 0) {
            return j;
        }
        int i = ((int) ((p ^ q) >> 63)) | 1;
        switch (AnonymousClass1.$SwitchMap$java$math$RoundingMode[mode.ordinal()]) {
            case 1:
                MathPreconditions.checkRoundingUnnecessary(j2 == 0);
                return j;
            case 2:
                return j;
            case 3:
                if (i >= 0) {
                    return j;
                }
                break;
            case 4:
                break;
            case 5:
                if (i <= 0) {
                    return j;
                }
                break;
            case 6:
            case 7:
            case 8:
                long jAbs = Math.abs(j2);
                long jAbs2 = jAbs - (Math.abs(q) - jAbs);
                if (jAbs2 == 0) {
                    if (mode != RoundingMode.HALF_UP && (mode != RoundingMode.HALF_EVEN || (1 & j) == 0)) {
                        return j;
                    }
                } else if (jAbs2 <= 0) {
                    return j;
                }
                break;
            default:
                throw new AssertionError();
        }
        return j + i;
    }

    public static int mod(long x, int m) {
        return (int) mod(x, m);
    }

    public static long mod(long x, long m) {
        if (m <= 0) {
            throw new ArithmeticException("Modulus must be positive");
        }
        long j = x % m;
        return j >= 0 ? j : j + m;
    }

    public static long gcd(long a, long b) {
        MathPreconditions.checkNonNegative(CmcdData.Factory.OBJECT_TYPE_AUDIO_ONLY, a);
        MathPreconditions.checkNonNegative("b", b);
        if (a == 0) {
            return b;
        }
        if (b == 0) {
            return a;
        }
        int iNumberOfTrailingZeros = Long.numberOfTrailingZeros(a);
        long jNumberOfTrailingZeros = a >> iNumberOfTrailingZeros;
        int iNumberOfTrailingZeros2 = Long.numberOfTrailingZeros(b);
        long j = b >> iNumberOfTrailingZeros2;
        while (jNumberOfTrailingZeros != j) {
            long j2 = jNumberOfTrailingZeros - j;
            long j3 = (j2 >> 63) & j2;
            long j4 = (j2 - j3) - j3;
            j += j3;
            jNumberOfTrailingZeros = j4 >> Long.numberOfTrailingZeros(j4);
        }
        return jNumberOfTrailingZeros << Math.min(iNumberOfTrailingZeros, iNumberOfTrailingZeros2);
    }

    public static long checkedAdd(long a, long b) {
        long j = a + b;
        MathPreconditions.checkNoOverflow(((a ^ b) < 0) | ((a ^ j) >= 0), "checkedAdd", a, b);
        return j;
    }

    public static long checkedSubtract(long a, long b) {
        long j = a - b;
        MathPreconditions.checkNoOverflow(((a ^ b) >= 0) | ((a ^ j) >= 0), "checkedSubtract", a, b);
        return j;
    }

    public static long checkedMultiply(long a, long b) {
        int iNumberOfLeadingZeros = Long.numberOfLeadingZeros(a) + Long.numberOfLeadingZeros(~a) + Long.numberOfLeadingZeros(b) + Long.numberOfLeadingZeros(~b);
        if (iNumberOfLeadingZeros > 65) {
            return a * b;
        }
        MathPreconditions.checkNoOverflow(iNumberOfLeadingZeros >= 64, "checkedMultiply", a, b);
        MathPreconditions.checkNoOverflow((a >= 0) | (b != Long.MIN_VALUE), "checkedMultiply", a, b);
        long j = a * b;
        MathPreconditions.checkNoOverflow(a == 0 || j / a == b, "checkedMultiply", a, b);
        return j;
    }

    public static long checkedPow(long b, int k) {
        MathPreconditions.checkNonNegative("exponent", k);
        long j = 1;
        if (!(b >= -2) || !(b <= 2)) {
            long j2 = b;
            int i = k;
            while (i != 0) {
                if (i == 1) {
                    return checkedMultiply(j, j2);
                }
                long jCheckedMultiply = (i & 1) != 0 ? checkedMultiply(j, j2) : j;
                int i2 = i >> 1;
                if (i2 > 0) {
                    MathPreconditions.checkNoOverflow(-3037000499L <= j2 && j2 <= FLOOR_SQRT_MAX_LONG, "checkedPow", j2, i2);
                    j2 *= j2;
                }
                j = jCheckedMultiply;
                i = i2;
            }
            return j;
        }
        int i3 = (int) b;
        if (i3 == -2) {
            MathPreconditions.checkNoOverflow(k < 64, "checkedPow", b, k);
            return (k & 1) == 0 ? 1 << k : (-1) << k;
        }
        if (i3 == -1) {
            return (k & 1) == 0 ? 1L : -1L;
        }
        if (i3 == 0) {
            return k == 0 ? 1L : 0L;
        }
        if (i3 == 1) {
            return 1L;
        }
        if (i3 == 2) {
            MathPreconditions.checkNoOverflow(k < 63, "checkedPow", b, k);
            return 1 << k;
        }
        throw new AssertionError();
    }

    public static long saturatedMultiply(long a, long b) {
        int iNumberOfLeadingZeros = Long.numberOfLeadingZeros(a) + Long.numberOfLeadingZeros(~a) + Long.numberOfLeadingZeros(b) + Long.numberOfLeadingZeros(~b);
        if (iNumberOfLeadingZeros > 65) {
            return a * b;
        }
        long j = ((a ^ b) >>> 63) + Long.MAX_VALUE;
        if ((iNumberOfLeadingZeros < 64) || ((b == Long.MIN_VALUE) & (a < 0))) {
            return j;
        }
        long j2 = a * b;
        return (a == 0 || j2 / a == b) ? j2 : j;
    }

    public static long saturatedPow(long b, int k) {
        MathPreconditions.checkNonNegative("exponent", k);
        long jSaturatedMultiply = 1;
        if (!(b >= -2) || !(b <= 2)) {
            long j = ((b >>> 63) & k & 1) + Long.MAX_VALUE;
            while (k != 0) {
                if (k == 1) {
                    return saturatedMultiply(jSaturatedMultiply, b);
                }
                if ((k & 1) != 0) {
                    jSaturatedMultiply = saturatedMultiply(jSaturatedMultiply, b);
                }
                k >>= 1;
                if (k > 0) {
                    if ((-3037000499L > b) || (b > FLOOR_SQRT_MAX_LONG)) {
                        return j;
                    }
                    b *= b;
                }
            }
            return jSaturatedMultiply;
        }
        int i = (int) b;
        if (i == -2) {
            return k >= 64 ? (k & 1) + Long.MAX_VALUE : (k & 1) == 0 ? 1 << k : (-1) << k;
        }
        if (i == -1) {
            return (k & 1) == 0 ? 1L : -1L;
        }
        if (i == 0) {
            return k == 0 ? 1L : 0L;
        }
        if (i == 1) {
            return 1L;
        }
        if (i != 2) {
            throw new AssertionError();
        }
        if (k >= 63) {
            return Long.MAX_VALUE;
        }
        return 1 << k;
    }

    public static long factorial(int n) {
        MathPreconditions.checkNonNegative("n", n);
        long[] jArr = factorials;
        if (n < jArr.length) {
            return jArr[n];
        }
        return Long.MAX_VALUE;
    }

    public static long binomial(int n, int k) {
        MathPreconditions.checkNonNegative("n", n);
        MathPreconditions.checkNonNegative("k", k);
        Preconditions.checkArgument(k <= n, "k (%s) > n (%s)", k, n);
        if (k > (n >> 1)) {
            k = n - k;
        }
        long jMultiplyFraction = 1;
        if (k == 0) {
            return 1L;
        }
        if (k == 1) {
            return n;
        }
        long[] jArr = factorials;
        if (n < jArr.length) {
            return jArr[n] / (jArr[k] * jArr[n - k]);
        }
        int[] iArr = biggestBinomials;
        if (k >= iArr.length || n > iArr[k]) {
            return Long.MAX_VALUE;
        }
        int[] iArr2 = biggestSimpleBinomials;
        if (k < iArr2.length && n <= iArr2[k]) {
            int i = n - 1;
            long j = n;
            for (int i2 = 2; i2 <= k; i2++) {
                j = (j * i) / i2;
                i--;
            }
            return j;
        }
        long j2 = n;
        int iLog2 = log2(j2, RoundingMode.CEILING);
        int i3 = n - 1;
        int i4 = iLog2;
        long j3 = j2;
        int i5 = 2;
        long j4 = 1;
        while (i5 <= k) {
            i4 += iLog2;
            if (i4 < 63) {
                j3 *= i3;
                j4 *= i5;
            } else {
                jMultiplyFraction = multiplyFraction(jMultiplyFraction, j3, j4);
                j3 = i3;
                j4 = i5;
                i4 = iLog2;
            }
            i5++;
            i3--;
        }
        return multiplyFraction(jMultiplyFraction, j3, j4);
    }

    static long multiplyFraction(long x, long numerator, long denominator) {
        if (x == 1) {
            return numerator / denominator;
        }
        long jGcd = gcd(x, denominator);
        return (x / jGcd) * (numerator / (denominator / jGcd));
    }

    public static boolean isPrime(long n) {
        if (n < 2) {
            MathPreconditions.checkNonNegative("n", n);
            return false;
        }
        if (n < 66) {
            return ((722865708377213483 >> (((int) n) + (-2))) & 1) != 0;
        }
        if (((1 << ((int) (n % 30))) & SIEVE_30) != 0 || n % 7 == 0 || n % 11 == 0 || n % 13 == 0) {
            return false;
        }
        if (n < 289) {
            return true;
        }
        for (long[] jArr : millerRabinBaseSets) {
            if (n <= jArr[0]) {
                for (int i = 1; i < jArr.length; i++) {
                    if (!MillerRabinTester.test(jArr[i], n)) {
                        return false;
                    }
                }
                return true;
            }
        }
        throw new AssertionError();
    }

    private enum MillerRabinTester {
        SMALL { // from class: com.google.common.math.LongMath.MillerRabinTester.1
            @Override // com.google.common.math.LongMath.MillerRabinTester
            long mulMod(long a, long b, long m) {
                return (a * b) % m;
            }

            @Override // com.google.common.math.LongMath.MillerRabinTester
            long squareMod(long a, long m) {
                return (a * a) % m;
            }
        },
        LARGE { // from class: com.google.common.math.LongMath.MillerRabinTester.2
            private long plusMod(long a, long b, long m) {
                long j = a + b;
                return a >= m - b ? j - m : j;
            }

            private long times2ToThe32Mod(long a, long m) {
                int i = 32;
                do {
                    int iMin = Math.min(i, Long.numberOfLeadingZeros(a));
                    a = UnsignedLongs.remainder(a << iMin, m);
                    i -= iMin;
                } while (i > 0);
                return a;
            }

            @Override // com.google.common.math.LongMath.MillerRabinTester
            long mulMod(long a, long b, long m) {
                long j = a >>> 32;
                long j2 = b >>> 32;
                long j3 = a & KeyboardMap.kValueMask;
                long j4 = b & KeyboardMap.kValueMask;
                long jTimes2ToThe32Mod = times2ToThe32Mod(j * j2, m) + (j * j4);
                if (jTimes2ToThe32Mod < 0) {
                    jTimes2ToThe32Mod = UnsignedLongs.remainder(jTimes2ToThe32Mod, m);
                }
                Long.signum(j3);
                return plusMod(times2ToThe32Mod(jTimes2ToThe32Mod + (j2 * j3), m), UnsignedLongs.remainder(j3 * j4, m), m);
            }

            @Override // com.google.common.math.LongMath.MillerRabinTester
            long squareMod(long a, long m) {
                long j = a >>> 32;
                long j2 = a & KeyboardMap.kValueMask;
                long jTimes2ToThe32Mod = times2ToThe32Mod(j * j, m);
                long jRemainder = j * j2 * 2;
                if (jRemainder < 0) {
                    jRemainder = UnsignedLongs.remainder(jRemainder, m);
                }
                return plusMod(times2ToThe32Mod(jTimes2ToThe32Mod + jRemainder, m), UnsignedLongs.remainder(j2 * j2, m), m);
            }
        };

        abstract long mulMod(long a, long b, long m);

        abstract long squareMod(long a, long m);

        /* synthetic */ MillerRabinTester(AnonymousClass1 anonymousClass1) {
            this();
        }

        static boolean test(long base, long n) {
            return (n <= LongMath.FLOOR_SQRT_MAX_LONG ? SMALL : LARGE).testWitness(base, n);
        }

        private long powMod(long a, long p, long m) {
            long jMulMod = 1;
            while (p != 0) {
                if ((p & 1) != 0) {
                    jMulMod = mulMod(jMulMod, a, m);
                }
                a = squareMod(a, m);
                p >>= 1;
            }
            return jMulMod;
        }

        private boolean testWitness(long base, long n) {
            long j = n - 1;
            int iNumberOfTrailingZeros = Long.numberOfTrailingZeros(j);
            long j2 = j >> iNumberOfTrailingZeros;
            long j3 = base % n;
            if (j3 == 0) {
                return true;
            }
            long jPowMod = powMod(j3, j2, n);
            if (jPowMod == 1) {
                return true;
            }
            int i = 0;
            while (jPowMod != j) {
                i++;
                if (i == iNumberOfTrailingZeros) {
                    return false;
                }
                jPowMod = squareMod(jPowMod, n);
            }
            return true;
        }
    }

    public static double roundToDouble(long x, RoundingMode mode) {
        long jCeil;
        double dNextUp;
        double d = x;
        long jFloor = (long) d;
        int iCompare = jFloor == Long.MAX_VALUE ? -1 : Longs.compare(x, jFloor);
        switch (AnonymousClass1.$SwitchMap$java$math$RoundingMode[mode.ordinal()]) {
            case 1:
                MathPreconditions.checkRoundingUnnecessary(iCompare == 0);
                return d;
            case 2:
                return x >= 0 ? iCompare >= 0 ? d : DoubleUtils.nextDown(d) : iCompare <= 0 ? d : Math.nextUp(d);
            case 3:
                return iCompare >= 0 ? d : DoubleUtils.nextDown(d);
            case 4:
                return x >= 0 ? iCompare <= 0 ? d : Math.nextUp(d) : iCompare >= 0 ? d : DoubleUtils.nextDown(d);
            case 5:
                return iCompare <= 0 ? d : Math.nextUp(d);
            case 6:
            case 7:
            case 8:
                if (iCompare >= 0) {
                    dNextUp = Math.nextUp(d);
                    jCeil = (long) Math.ceil(dNextUp);
                } else {
                    double dNextDown = DoubleUtils.nextDown(d);
                    jFloor = (long) Math.floor(dNextDown);
                    jCeil = jFloor;
                    d = dNextDown;
                    dNextUp = d;
                }
                long j = x - jFloor;
                long j2 = jCeil - x;
                if (jCeil == Long.MAX_VALUE) {
                    j2++;
                }
                int iCompare2 = Longs.compare(j, j2);
                if (iCompare2 < 0) {
                    return d;
                }
                if (iCompare2 > 0) {
                    return dNextUp;
                }
                int i = AnonymousClass1.$SwitchMap$java$math$RoundingMode[mode.ordinal()];
                if (i == 6) {
                    return x >= 0 ? d : dNextUp;
                }
                if (i == 7) {
                    return x >= 0 ? dNextUp : d;
                }
                if (i == 8) {
                    return (DoubleUtils.getSignificand(d) & 1) == 0 ? d : dNextUp;
                }
                throw new AssertionError("impossible");
            default:
                throw new AssertionError("impossible");
        }
    }

    private LongMath() {
    }
}
