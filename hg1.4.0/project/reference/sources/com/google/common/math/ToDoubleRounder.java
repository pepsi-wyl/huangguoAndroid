package com.google.common.math;

import com.google.common.base.Preconditions;
import java.lang.Comparable;
import java.lang.Number;
import java.math.RoundingMode;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
abstract class ToDoubleRounder<X extends Number & Comparable<X>> {
    abstract X minus(X a, X b);

    abstract double roundToDoubleArbitrarily(X x);

    abstract int sign(X x);

    abstract X toX(double d, RoundingMode mode);

    ToDoubleRounder() {
    }

    final double roundToDouble(X x, RoundingMode mode) {
        Number x2;
        double dNextUp;
        Preconditions.checkNotNull(x, "x");
        Preconditions.checkNotNull(mode, "mode");
        double dRoundToDoubleArbitrarily = roundToDoubleArbitrarily(x);
        if (Double.isInfinite(dRoundToDoubleArbitrarily)) {
            switch (AnonymousClass1.$SwitchMap$java$math$RoundingMode[mode.ordinal()]) {
                case 1:
                case 2:
                case 3:
                case 4:
                    return sign(x) * Double.MAX_VALUE;
                case 5:
                    return dRoundToDoubleArbitrarily == Double.POSITIVE_INFINITY ? Double.MAX_VALUE : Double.NEGATIVE_INFINITY;
                case 6:
                    return dRoundToDoubleArbitrarily == Double.POSITIVE_INFINITY ? Double.POSITIVE_INFINITY : -1.7976931348623157E308d;
                case 7:
                    return dRoundToDoubleArbitrarily;
                case 8:
                    throw new ArithmeticException(x + " cannot be represented precisely as a double");
            }
        }
        Number x3 = toX(dRoundToDoubleArbitrarily, RoundingMode.UNNECESSARY);
        int iCompareTo = ((Comparable) x).compareTo(x3);
        switch (AnonymousClass1.$SwitchMap$java$math$RoundingMode[mode.ordinal()]) {
            case 1:
                return sign(x) >= 0 ? iCompareTo >= 0 ? dRoundToDoubleArbitrarily : DoubleUtils.nextDown(dRoundToDoubleArbitrarily) : iCompareTo <= 0 ? dRoundToDoubleArbitrarily : Math.nextUp(dRoundToDoubleArbitrarily);
            case 2:
            case 3:
            case 4:
                if (iCompareTo >= 0) {
                    dNextUp = Math.nextUp(dRoundToDoubleArbitrarily);
                    if (dNextUp == Double.POSITIVE_INFINITY) {
                        return dRoundToDoubleArbitrarily;
                    }
                    x2 = toX(dNextUp, RoundingMode.CEILING);
                } else {
                    double dNextDown = DoubleUtils.nextDown(dRoundToDoubleArbitrarily);
                    if (dNextDown == Double.NEGATIVE_INFINITY) {
                        return dRoundToDoubleArbitrarily;
                    }
                    Number x4 = toX(dNextDown, RoundingMode.FLOOR);
                    x2 = x3;
                    x3 = x4;
                    dNextUp = dRoundToDoubleArbitrarily;
                    dRoundToDoubleArbitrarily = dNextDown;
                }
                int iCompareTo2 = ((Comparable) minus(x, x3)).compareTo(minus(x2, x));
                if (iCompareTo2 < 0) {
                    return dRoundToDoubleArbitrarily;
                }
                if (iCompareTo2 > 0) {
                    return dNextUp;
                }
                int i = AnonymousClass1.$SwitchMap$java$math$RoundingMode[mode.ordinal()];
                if (i == 2) {
                    return (Double.doubleToRawLongBits(dRoundToDoubleArbitrarily) & 1) == 0 ? dRoundToDoubleArbitrarily : dNextUp;
                }
                if (i == 3) {
                    return sign(x) >= 0 ? dRoundToDoubleArbitrarily : dNextUp;
                }
                if (i == 4) {
                    return sign(x) >= 0 ? dNextUp : dRoundToDoubleArbitrarily;
                }
                throw new AssertionError("impossible");
            case 5:
                return iCompareTo >= 0 ? dRoundToDoubleArbitrarily : DoubleUtils.nextDown(dRoundToDoubleArbitrarily);
            case 6:
                return iCompareTo <= 0 ? dRoundToDoubleArbitrarily : Math.nextUp(dRoundToDoubleArbitrarily);
            case 7:
                return sign(x) >= 0 ? iCompareTo <= 0 ? dRoundToDoubleArbitrarily : Math.nextUp(dRoundToDoubleArbitrarily) : iCompareTo >= 0 ? dRoundToDoubleArbitrarily : DoubleUtils.nextDown(dRoundToDoubleArbitrarily);
            case 8:
                MathPreconditions.checkRoundingUnnecessary(iCompareTo == 0);
                return dRoundToDoubleArbitrarily;
            default:
                throw new AssertionError("impossible");
        }
    }

    /* renamed from: com.google.common.math.ToDoubleRounder$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$java$math$RoundingMode;

        static {
            int[] iArr = new int[RoundingMode.values().length];
            $SwitchMap$java$math$RoundingMode = iArr;
            try {
                iArr[RoundingMode.DOWN.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_EVEN.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_DOWN.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_UP.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.FLOOR.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.CEILING.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.UP.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.UNNECESSARY.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
        }
    }
}
