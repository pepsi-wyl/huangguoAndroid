package com.google.common.hash;

import com.google.common.base.Preconditions;
import com.google.common.hash.BloomFilter;
import com.google.common.math.LongMath;
import com.google.common.primitives.Ints;
import com.google.common.primitives.Longs;
import java.math.RoundingMode;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicLongArray;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
enum BloomFilterStrategies implements BloomFilter.Strategy {
    MURMUR128_MITZ_32 { // from class: com.google.common.hash.BloomFilterStrategies.1
        @Override // com.google.common.hash.BloomFilter.Strategy
        public <T> boolean put(@ParametricNullness T object, Funnel<? super T> funnel, int numHashFunctions, LockFreeBitArray bits) {
            long jBitSize = bits.bitSize();
            long jAsLong = Hashing.murmur3_128().hashObject(object, funnel).asLong();
            int i = (int) jAsLong;
            int i2 = (int) (jAsLong >>> 32);
            boolean z = false;
            for (int i3 = 1; i3 <= numHashFunctions; i3++) {
                int i4 = (i3 * i2) + i;
                if (i4 < 0) {
                    i4 = ~i4;
                }
                z |= bits.set(i4 % jBitSize);
            }
            return z;
        }

        @Override // com.google.common.hash.BloomFilter.Strategy
        public <T> boolean mightContain(@ParametricNullness T object, Funnel<? super T> funnel, int numHashFunctions, LockFreeBitArray bits) {
            long jBitSize = bits.bitSize();
            long jAsLong = Hashing.murmur3_128().hashObject(object, funnel).asLong();
            int i = (int) jAsLong;
            int i2 = (int) (jAsLong >>> 32);
            for (int i3 = 1; i3 <= numHashFunctions; i3++) {
                int i4 = (i3 * i2) + i;
                if (i4 < 0) {
                    i4 = ~i4;
                }
                if (!bits.get(i4 % jBitSize)) {
                    return false;
                }
            }
            return true;
        }
    },
    MURMUR128_MITZ_64 { // from class: com.google.common.hash.BloomFilterStrategies.2
        @Override // com.google.common.hash.BloomFilter.Strategy
        public <T> boolean put(@ParametricNullness T object, Funnel<? super T> funnel, int numHashFunctions, LockFreeBitArray bits) {
            long jBitSize = bits.bitSize();
            byte[] bytesInternal = Hashing.murmur3_128().hashObject(object, funnel).getBytesInternal();
            long jLowerEight = lowerEight(bytesInternal);
            long jUpperEight = upperEight(bytesInternal);
            boolean z = false;
            for (int i = 0; i < numHashFunctions; i++) {
                z |= bits.set((Long.MAX_VALUE & jLowerEight) % jBitSize);
                jLowerEight += jUpperEight;
            }
            return z;
        }

        @Override // com.google.common.hash.BloomFilter.Strategy
        public <T> boolean mightContain(@ParametricNullness T object, Funnel<? super T> funnel, int numHashFunctions, LockFreeBitArray bits) {
            long jBitSize = bits.bitSize();
            byte[] bytesInternal = Hashing.murmur3_128().hashObject(object, funnel).getBytesInternal();
            long jLowerEight = lowerEight(bytesInternal);
            long jUpperEight = upperEight(bytesInternal);
            for (int i = 0; i < numHashFunctions; i++) {
                if (!bits.get((Long.MAX_VALUE & jLowerEight) % jBitSize)) {
                    return false;
                }
                jLowerEight += jUpperEight;
            }
            return true;
        }

        private long lowerEight(byte[] bytes) {
            return Longs.fromBytes(bytes[7], bytes[6], bytes[5], bytes[4], bytes[3], bytes[2], bytes[1], bytes[0]);
        }

        private long upperEight(byte[] bytes) {
            return Longs.fromBytes(bytes[15], bytes[14], bytes[13], bytes[12], bytes[11], bytes[10], bytes[9], bytes[8]);
        }
    };

    static final class LockFreeBitArray {
        private static final int LONG_ADDRESSABLE_BITS = 6;
        private final LongAddable bitCount;
        final AtomicLongArray data;

        LockFreeBitArray(long bits) {
            Preconditions.checkArgument(bits > 0, "data length is zero!");
            this.data = new AtomicLongArray(Ints.checkedCast(LongMath.divide(bits, 64L, RoundingMode.CEILING)));
            this.bitCount = LongAddables.create();
        }

        LockFreeBitArray(long[] data) {
            Preconditions.checkArgument(data.length > 0, "data length is zero!");
            this.data = new AtomicLongArray(data);
            this.bitCount = LongAddables.create();
            long jBitCount = 0;
            for (long j : data) {
                jBitCount += Long.bitCount(j);
            }
            this.bitCount.add(jBitCount);
        }

        boolean set(long bitIndex) {
            long j;
            long j2;
            if (get(bitIndex)) {
                return false;
            }
            int i = (int) (bitIndex >>> 6);
            long j3 = 1 << ((int) bitIndex);
            do {
                j = this.data.get(i);
                j2 = j | j3;
                if (j == j2) {
                    return false;
                }
            } while (!this.data.compareAndSet(i, j, j2));
            this.bitCount.increment();
            return true;
        }

        boolean get(long bitIndex) {
            return ((1 << ((int) bitIndex)) & this.data.get((int) (bitIndex >>> 6))) != 0;
        }

        public static long[] toPlainArray(AtomicLongArray atomicLongArray) {
            int length = atomicLongArray.length();
            long[] jArr = new long[length];
            for (int i = 0; i < length; i++) {
                jArr[i] = atomicLongArray.get(i);
            }
            return jArr;
        }

        long bitSize() {
            return this.data.length() * 64;
        }

        long bitCount() {
            return this.bitCount.sum();
        }

        LockFreeBitArray copy() {
            return new LockFreeBitArray(toPlainArray(this.data));
        }

        void putAll(LockFreeBitArray other) {
            Preconditions.checkArgument(this.data.length() == other.data.length(), "BitArrays must be of equal length (%s != %s)", this.data.length(), other.data.length());
            for (int i = 0; i < this.data.length(); i++) {
                putData(i, other.data.get(i));
            }
        }

        void putData(int i, long longValue) {
            long j;
            long j2;
            do {
                j = this.data.get(i);
                j2 = j | longValue;
                if (j == j2) {
                    return;
                }
            } while (!this.data.compareAndSet(i, j, j2));
            this.bitCount.add(Long.bitCount(j2) - Long.bitCount(j));
        }

        int dataLength() {
            return this.data.length();
        }

        public boolean equals(@CheckForNull Object o) {
            if (o instanceof LockFreeBitArray) {
                return Arrays.equals(toPlainArray(this.data), toPlainArray(((LockFreeBitArray) o).data));
            }
            return false;
        }

        public int hashCode() {
            return Arrays.hashCode(toPlainArray(this.data));
        }
    }
}
