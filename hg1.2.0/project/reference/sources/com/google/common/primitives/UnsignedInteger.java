package com.google.common.primitives;

import com.google.common.base.Preconditions;
import io.flutter.embedding.android.KeyboardMap;
import java.math.BigInteger;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class UnsignedInteger extends Number implements Comparable<UnsignedInteger> {
    private final int value;
    public static final UnsignedInteger ZERO = fromIntBits(0);
    public static final UnsignedInteger ONE = fromIntBits(1);
    public static final UnsignedInteger MAX_VALUE = fromIntBits(-1);

    private UnsignedInteger(int value) {
        this.value = value;
    }

    public static UnsignedInteger fromIntBits(int bits) {
        return new UnsignedInteger(bits);
    }

    public static UnsignedInteger valueOf(long value) {
        Preconditions.checkArgument((KeyboardMap.kValueMask & value) == value, "value (%s) is outside the range for an unsigned integer value", value);
        return fromIntBits((int) value);
    }

    public static UnsignedInteger valueOf(BigInteger value) {
        Preconditions.checkNotNull(value);
        Preconditions.checkArgument(value.signum() >= 0 && value.bitLength() <= 32, "value (%s) is outside the range for an unsigned integer value", value);
        return fromIntBits(value.intValue());
    }

    public static UnsignedInteger valueOf(String string) {
        return valueOf(string, 10);
    }

    public static UnsignedInteger valueOf(String string, int radix) {
        return fromIntBits(UnsignedInts.parseUnsignedInt(string, radix));
    }

    public UnsignedInteger plus(UnsignedInteger val) {
        return fromIntBits(this.value + ((UnsignedInteger) Preconditions.checkNotNull(val)).value);
    }

    public UnsignedInteger minus(UnsignedInteger val) {
        return fromIntBits(this.value - ((UnsignedInteger) Preconditions.checkNotNull(val)).value);
    }

    public UnsignedInteger times(UnsignedInteger val) {
        return fromIntBits(this.value * ((UnsignedInteger) Preconditions.checkNotNull(val)).value);
    }

    public UnsignedInteger dividedBy(UnsignedInteger val) {
        return fromIntBits(UnsignedInts.divide(this.value, ((UnsignedInteger) Preconditions.checkNotNull(val)).value));
    }

    public UnsignedInteger mod(UnsignedInteger val) {
        return fromIntBits(UnsignedInts.remainder(this.value, ((UnsignedInteger) Preconditions.checkNotNull(val)).value));
    }

    @Override // java.lang.Number
    public int intValue() {
        return this.value;
    }

    @Override // java.lang.Number
    public long longValue() {
        return UnsignedInts.toLong(this.value);
    }

    @Override // java.lang.Number
    public float floatValue() {
        return longValue();
    }

    @Override // java.lang.Number
    public double doubleValue() {
        return longValue();
    }

    public BigInteger bigIntegerValue() {
        return BigInteger.valueOf(longValue());
    }

    @Override // java.lang.Comparable
    public int compareTo(UnsignedInteger other) {
        Preconditions.checkNotNull(other);
        return UnsignedInts.compare(this.value, other.value);
    }

    public int hashCode() {
        return this.value;
    }

    public boolean equals(@CheckForNull Object obj) {
        return (obj instanceof UnsignedInteger) && this.value == ((UnsignedInteger) obj).value;
    }

    public String toString() {
        return toString(10);
    }

    public String toString(int radix) {
        return UnsignedInts.toString(this.value, radix);
    }
}
