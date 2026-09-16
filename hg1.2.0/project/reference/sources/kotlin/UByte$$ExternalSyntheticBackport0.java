package kotlin;

import io.flutter.embedding.android.KeyboardMap;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes2.dex */
public final /* synthetic */ class UByte$$ExternalSyntheticBackport0 {
    public static /* synthetic */ int m(double d) {
        long jDoubleToLongBits = Double.doubleToLongBits(d);
        return (int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32));
    }

    public static /* synthetic */ int m(int i, int i2) {
        return (int) ((i & KeyboardMap.kValueMask) / (i2 & KeyboardMap.kValueMask));
    }

    public static /* synthetic */ int m(long j) {
        return (int) (j ^ (j >>> 32));
    }

    public static /* synthetic */ int m(boolean z) {
        return z ? 1231 : 1237;
    }

    /* renamed from: m, reason: collision with other method in class */
    public static /* synthetic */ long m566m(long j, long j2) {
        if (j2 < 0) {
            return (j ^ Long.MIN_VALUE) < (Long.MIN_VALUE ^ j2) ? j : j - j2;
        }
        if (j >= 0) {
            return j % j2;
        }
        long j3 = j - ((((j >>> 1) / j2) << 1) * j2);
        if ((j3 ^ Long.MIN_VALUE) < (Long.MIN_VALUE ^ j2)) {
            j2 = 0;
        }
        return j3 - j2;
    }

    public static /* synthetic */ boolean m(Object obj) {
        return obj == null;
    }

    public static /* synthetic */ int m$1(int i, int i2) {
        return (int) ((i & KeyboardMap.kValueMask) % (i2 & KeyboardMap.kValueMask));
    }

    public static /* synthetic */ long m$1(long j, long j2) {
        if (j2 < 0) {
            return (j ^ Long.MIN_VALUE) < (j2 ^ Long.MIN_VALUE) ? 0L : 1L;
        }
        if (j >= 0) {
            return j / j2;
        }
        long j3 = ((j >>> 1) / j2) << 1;
        return j3 + (((j - (j3 * j2)) ^ Long.MIN_VALUE) < (j2 ^ Long.MIN_VALUE) ? 0 : 1);
    }
}
