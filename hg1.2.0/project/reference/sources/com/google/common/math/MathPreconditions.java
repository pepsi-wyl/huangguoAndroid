package com.google.common.math;

import java.math.BigInteger;
import java.math.RoundingMode;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class MathPreconditions {
    static int checkPositive(String role, int x) {
        if (x > 0) {
            return x;
        }
        throw new IllegalArgumentException(role + " (" + x + ") must be > 0");
    }

    static long checkPositive(String role, long x) {
        if (x > 0) {
            return x;
        }
        throw new IllegalArgumentException(role + " (" + x + ") must be > 0");
    }

    static BigInteger checkPositive(String role, BigInteger x) {
        if (x.signum() > 0) {
            return x;
        }
        throw new IllegalArgumentException(role + " (" + x + ") must be > 0");
    }

    static int checkNonNegative(String role, int x) {
        if (x >= 0) {
            return x;
        }
        throw new IllegalArgumentException(role + " (" + x + ") must be >= 0");
    }

    static long checkNonNegative(String role, long x) {
        if (x >= 0) {
            return x;
        }
        throw new IllegalArgumentException(role + " (" + x + ") must be >= 0");
    }

    static BigInteger checkNonNegative(String role, BigInteger x) {
        if (x.signum() >= 0) {
            return x;
        }
        throw new IllegalArgumentException(role + " (" + x + ") must be >= 0");
    }

    static double checkNonNegative(String role, double x) {
        if (x >= 0.0d) {
            return x;
        }
        throw new IllegalArgumentException(role + " (" + x + ") must be >= 0");
    }

    static void checkRoundingUnnecessary(boolean condition) {
        if (!condition) {
            throw new ArithmeticException("mode was UNNECESSARY, but rounding was necessary");
        }
    }

    static void checkInRangeForRoundingInputs(boolean condition, double input, RoundingMode mode) {
        if (condition) {
            return;
        }
        throw new ArithmeticException("rounded value is out of range for input " + input + " and rounding mode " + mode);
    }

    static void checkNoOverflow(boolean condition, String methodName, int a, int b) {
        if (condition) {
            return;
        }
        throw new ArithmeticException("overflow: " + methodName + "(" + a + ", " + b + ")");
    }

    static void checkNoOverflow(boolean condition, String methodName, long a, long b) {
        if (condition) {
            return;
        }
        throw new ArithmeticException("overflow: " + methodName + "(" + a + ", " + b + ")");
    }

    private MathPreconditions() {
    }
}
