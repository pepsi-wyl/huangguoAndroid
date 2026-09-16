package com.google.common.hash;

import com.google.common.base.Preconditions;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class Fingerprint2011 extends AbstractNonStreamingHashFunction {
    static final HashFunction FINGERPRINT_2011 = new Fingerprint2011();
    private static final long K0 = -6505348102511208375L;
    private static final long K1 = -8261664234251669945L;
    private static final long K2 = -4288712594273399085L;
    private static final long K3 = -4132994306676758123L;

    static long hash128to64(long high, long low) {
        long j = (low ^ high) * K3;
        long j2 = (high ^ (j ^ (j >>> 47))) * K3;
        return (j2 ^ (j2 >>> 47)) * K3;
    }

    private static long shiftMix(long val) {
        return val ^ (val >>> 47);
    }

    @Override // com.google.common.hash.HashFunction
    public int bits() {
        return 64;
    }

    Fingerprint2011() {
    }

    @Override // com.google.common.hash.AbstractNonStreamingHashFunction, com.google.common.hash.AbstractHashFunction, com.google.common.hash.HashFunction
    public HashCode hashBytes(byte[] input, int off, int len) {
        Preconditions.checkPositionIndexes(off, off + len, input.length);
        return HashCode.fromLong(fingerprint(input, off, len));
    }

    public String toString() {
        return "Hashing.fingerprint2011()";
    }

    static long fingerprint(byte[] bytes, int offset, int length) {
        long jFullFingerprint;
        if (length <= 32) {
            jFullFingerprint = murmurHash64WithSeed(bytes, offset, length, -1397348546323613475L);
        } else if (length <= 64) {
            jFullFingerprint = hashLength33To64(bytes, offset, length);
        } else {
            jFullFingerprint = fullFingerprint(bytes, offset, length);
        }
        long jLoad64 = K0;
        long jLoad642 = length >= 8 ? LittleEndianByteArray.load64(bytes, offset) : -6505348102511208375L;
        if (length >= 9) {
            jLoad64 = LittleEndianByteArray.load64(bytes, (offset + length) - 8);
        }
        long jHash128to64 = hash128to64(jFullFingerprint + jLoad64, jLoad642);
        return (jHash128to64 == 0 || jHash128to64 == 1) ? jHash128to64 - 2 : jHash128to64;
    }

    private static void weakHashLength32WithSeeds(byte[] bytes, int offset, long seedA, long seedB, long[] output) {
        long jLoad64 = LittleEndianByteArray.load64(bytes, offset);
        long jLoad642 = LittleEndianByteArray.load64(bytes, offset + 8);
        long jLoad643 = LittleEndianByteArray.load64(bytes, offset + 16);
        long jLoad644 = LittleEndianByteArray.load64(bytes, offset + 24);
        long j = seedA + jLoad64;
        long j2 = jLoad642 + j + jLoad643;
        long jRotateRight = Long.rotateRight(seedB + j + jLoad644, 51) + Long.rotateRight(j2, 23);
        output[0] = j2 + jLoad644;
        output[1] = jRotateRight + j;
    }

    private static long fullFingerprint(byte[] bytes, int offset, int length) {
        long jLoad64 = LittleEndianByteArray.load64(bytes, offset);
        int i = offset + length;
        long jLoad642 = LittleEndianByteArray.load64(bytes, i - 16) ^ K1;
        long jLoad643 = LittleEndianByteArray.load64(bytes, i - 56) ^ K0;
        long[] jArr = new long[2];
        long[] jArr2 = new long[2];
        long j = length;
        weakHashLength32WithSeeds(bytes, i - 64, j, jLoad642, jArr);
        weakHashLength32WithSeeds(bytes, i - 32, j * K1, K0, jArr2);
        long jShiftMix = jLoad643 + (shiftMix(jArr[1]) * K1);
        long jRotateRight = Long.rotateRight(jShiftMix + jLoad64, 39) * K1;
        long jRotateRight2 = Long.rotateRight(jLoad642, 33) * K1;
        int i2 = offset;
        int i3 = (length - 1) & (-64);
        while (true) {
            long jRotateRight3 = Long.rotateRight(jRotateRight + jRotateRight2 + jArr[0] + LittleEndianByteArray.load64(bytes, i2 + 16), 37) * K1;
            long jRotateRight4 = Long.rotateRight(jRotateRight2 + jArr[1] + LittleEndianByteArray.load64(bytes, i2 + 48), 42) * K1;
            long j2 = jRotateRight3 ^ jArr2[1];
            long j3 = jRotateRight4 ^ jArr[0];
            long jRotateRight5 = Long.rotateRight(jShiftMix ^ jArr2[0], 33);
            weakHashLength32WithSeeds(bytes, i2, jArr[1] * K1, j2 + jArr2[0], jArr);
            weakHashLength32WithSeeds(bytes, i2 + 32, jArr2[1] + jRotateRight5, j3, jArr2);
            i2 += 64;
            i3 -= 64;
            if (i3 == 0) {
                return hash128to64(hash128to64(jArr[0], jArr2[0]) + (shiftMix(j3) * K1) + j2, hash128to64(jArr[1], jArr2[1]) + jRotateRight5);
            }
            jRotateRight = jRotateRight5;
            jShiftMix = j2;
            jRotateRight2 = j3;
        }
    }

    private static long hashLength33To64(byte[] bytes, int offset, int length) {
        long jLoad64 = LittleEndianByteArray.load64(bytes, offset + 24);
        int i = offset + length;
        int i2 = i - 16;
        long jLoad642 = LittleEndianByteArray.load64(bytes, offset) + ((length + LittleEndianByteArray.load64(bytes, i2)) * K0);
        long jRotateRight = Long.rotateRight(jLoad642 + jLoad64, 52);
        long jRotateRight2 = Long.rotateRight(jLoad642, 37);
        long jLoad643 = jLoad642 + LittleEndianByteArray.load64(bytes, offset + 8);
        long jRotateRight3 = jRotateRight2 + Long.rotateRight(jLoad643, 7);
        int i3 = offset + 16;
        long jLoad644 = jLoad643 + LittleEndianByteArray.load64(bytes, i3);
        long j = jLoad64 + jLoad644;
        long jRotateRight4 = jRotateRight + Long.rotateRight(jLoad644, 31) + jRotateRight3;
        long jLoad645 = LittleEndianByteArray.load64(bytes, i3) + LittleEndianByteArray.load64(bytes, i - 32);
        long jLoad646 = LittleEndianByteArray.load64(bytes, i - 8);
        long jRotateRight5 = Long.rotateRight(jLoad645 + jLoad646, 52);
        long jRotateRight6 = Long.rotateRight(jLoad645, 37);
        long jLoad647 = jLoad645 + LittleEndianByteArray.load64(bytes, i - 24);
        long jRotateRight7 = jRotateRight6 + Long.rotateRight(jLoad647, 7);
        long jLoad648 = jLoad647 + LittleEndianByteArray.load64(bytes, i2);
        return shiftMix((shiftMix(((j + jRotateRight5 + Long.rotateRight(jLoad648, 31) + jRotateRight7) * K2) + ((jLoad646 + jLoad648 + jRotateRight4) * K0)) * K0) + jRotateRight4) * K2;
    }

    static long murmurHash64WithSeed(byte[] bytes, int offset, int length, long seed) {
        int i = length & (-8);
        int i2 = length & 7;
        long jLoad64Safely = seed ^ (length * K3);
        for (int i3 = 0; i3 < i; i3 += 8) {
            jLoad64Safely = (jLoad64Safely ^ (shiftMix(LittleEndianByteArray.load64(bytes, offset + i3) * K3) * K3)) * K3;
        }
        if (i2 != 0) {
            jLoad64Safely = (LittleEndianByteArray.load64Safely(bytes, offset + i, i2) ^ jLoad64Safely) * K3;
        }
        return shiftMix(shiftMix(jLoad64Safely) * K3);
    }
}
