package com.google.common.math;

import java.math.BigDecimal;
import java.math.RoundingMode;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public class BigDecimalMath {
    private BigDecimalMath() {
    }

    public static double roundToDouble(BigDecimal x, RoundingMode mode) {
        return BigDecimalToDoubleRounder.INSTANCE.roundToDouble(x, mode);
    }

    private static class BigDecimalToDoubleRounder extends ToDoubleRounder<BigDecimal> {
        static final BigDecimalToDoubleRounder INSTANCE = new BigDecimalToDoubleRounder();

        private BigDecimalToDoubleRounder() {
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.math.ToDoubleRounder
        public double roundToDoubleArbitrarily(BigDecimal bigDecimal) {
            return bigDecimal.doubleValue();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.math.ToDoubleRounder
        public int sign(BigDecimal bigDecimal) {
            return bigDecimal.signum();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.math.ToDoubleRounder
        public BigDecimal toX(double d, RoundingMode mode) {
            return new BigDecimal(d);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // com.google.common.math.ToDoubleRounder
        public BigDecimal minus(BigDecimal a, BigDecimal b) {
            return a.subtract(b);
        }
    }
}
