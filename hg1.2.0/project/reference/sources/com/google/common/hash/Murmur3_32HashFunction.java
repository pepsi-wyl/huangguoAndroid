package com.google.common.hash;

import com.google.common.base.Charsets;
import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import com.google.common.primitives.UnsignedBytes;
import com.google.errorprone.annotations.Immutable;
import io.flutter.embedding.android.KeyboardMap;
import java.io.Serializable;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import javax.annotation.CheckForNull;

@Immutable
@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class Murmur3_32HashFunction extends AbstractHashFunction implements Serializable {
    private static final int C1 = -862048943;
    private static final int C2 = 461845907;
    private static final int CHUNK_SIZE = 4;
    private static final long serialVersionUID = 0;
    private final int seed;
    private final boolean supplementaryPlaneFix;
    static final HashFunction MURMUR3_32 = new Murmur3_32HashFunction(0, false);
    static final HashFunction MURMUR3_32_FIXED = new Murmur3_32HashFunction(0, true);
    static final HashFunction GOOD_FAST_HASH_32 = new Murmur3_32HashFunction(Hashing.GOOD_FAST_HASH_SEED, true);

    /* JADX INFO: Access modifiers changed from: private */
    public static long charToThreeUtf8Bytes(char c) {
        return (c >>> '\f') | 224 | ((((c >>> 6) & 63) | 128) << 8) | (((c & '?') | 128) << 16);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static long charToTwoUtf8Bytes(char c) {
        return (c >>> 6) | 192 | (((c & '?') | 128) << 8);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static long codePointToFourUtf8Bytes(int codePoint) {
        return (codePoint >>> 18) | 240 | ((((codePoint >>> 12) & 63) | 128) << 8) | ((((codePoint >>> 6) & 63) | 128) << 16) | (((codePoint & 63) | 128) << 24);
    }

    @Override // com.google.common.hash.HashFunction
    public int bits() {
        return 32;
    }

    Murmur3_32HashFunction(int seed, boolean supplementaryPlaneFix) {
        this.seed = seed;
        this.supplementaryPlaneFix = supplementaryPlaneFix;
    }

    @Override // com.google.common.hash.HashFunction
    public Hasher newHasher() {
        return new Murmur3_32Hasher(this.seed);
    }

    public String toString() {
        return "Hashing.murmur3_32(" + this.seed + ")";
    }

    public boolean equals(@CheckForNull Object object) {
        if (!(object instanceof Murmur3_32HashFunction)) {
            return false;
        }
        Murmur3_32HashFunction murmur3_32HashFunction = (Murmur3_32HashFunction) object;
        return this.seed == murmur3_32HashFunction.seed && this.supplementaryPlaneFix == murmur3_32HashFunction.supplementaryPlaneFix;
    }

    public int hashCode() {
        return getClass().hashCode() ^ this.seed;
    }

    @Override // com.google.common.hash.AbstractHashFunction, com.google.common.hash.HashFunction
    public HashCode hashInt(int input) {
        return fmix(mixH1(this.seed, mixK1(input)), 4);
    }

    @Override // com.google.common.hash.AbstractHashFunction, com.google.common.hash.HashFunction
    public HashCode hashLong(long input) {
        int i = (int) (input >>> 32);
        return fmix(mixH1(mixH1(this.seed, mixK1((int) input)), mixK1(i)), 8);
    }

    @Override // com.google.common.hash.AbstractHashFunction, com.google.common.hash.HashFunction
    public HashCode hashUnencodedChars(CharSequence input) {
        int iMixK1 = this.seed;
        for (int i = 1; i < input.length(); i += 2) {
            iMixK1 = mixH1(iMixK1, mixK1(input.charAt(i - 1) | (input.charAt(i) << 16)));
        }
        if ((input.length() & 1) == 1) {
            iMixK1 ^= mixK1(input.charAt(input.length() - 1));
        }
        return fmix(iMixK1, input.length() * 2);
    }

    @Override // com.google.common.hash.AbstractHashFunction, com.google.common.hash.HashFunction
    public HashCode hashString(CharSequence input, Charset charset) {
        if (Charsets.UTF_8.equals(charset)) {
            int length = input.length();
            int iMixH1 = this.seed;
            int i = 0;
            int i2 = 0;
            int i3 = 0;
            while (true) {
                int i4 = i2 + 4;
                if (i4 > length) {
                    break;
                }
                char cCharAt = input.charAt(i2);
                char cCharAt2 = input.charAt(i2 + 1);
                char cCharAt3 = input.charAt(i2 + 2);
                char cCharAt4 = input.charAt(i2 + 3);
                if (cCharAt >= 128 || cCharAt2 >= 128 || cCharAt3 >= 128 || cCharAt4 >= 128) {
                    break;
                }
                iMixH1 = mixH1(iMixH1, mixK1((cCharAt2 << '\b') | cCharAt | (cCharAt3 << 16) | (cCharAt4 << 24)));
                i3 += 4;
                i2 = i4;
            }
            long jCharToThreeUtf8Bytes = 0;
            while (i2 < length) {
                char cCharAt5 = input.charAt(i2);
                if (cCharAt5 < 128) {
                    jCharToThreeUtf8Bytes |= cCharAt5 << i;
                    i += 8;
                    i3++;
                } else if (cCharAt5 < 2048) {
                    jCharToThreeUtf8Bytes |= charToTwoUtf8Bytes(cCharAt5) << i;
                    i += 16;
                    i3 += 2;
                } else if (cCharAt5 < 55296 || cCharAt5 > 57343) {
                    jCharToThreeUtf8Bytes |= charToThreeUtf8Bytes(cCharAt5) << i;
                    i += 24;
                    i3 += 3;
                } else {
                    int iCodePointAt = Character.codePointAt(input, i2);
                    if (iCodePointAt == cCharAt5) {
                        return hashBytes(input.toString().getBytes(charset));
                    }
                    i2++;
                    jCharToThreeUtf8Bytes |= codePointToFourUtf8Bytes(iCodePointAt) << i;
                    if (this.supplementaryPlaneFix) {
                        i += 32;
                    }
                    i3 += 4;
                }
                if (i >= 32) {
                    iMixH1 = mixH1(iMixH1, mixK1((int) jCharToThreeUtf8Bytes));
                    jCharToThreeUtf8Bytes >>>= 32;
                    i -= 32;
                }
                i2++;
            }
            return fmix(mixK1((int) jCharToThreeUtf8Bytes) ^ iMixH1, i3);
        }
        return hashBytes(input.toString().getBytes(charset));
    }

    @Override // com.google.common.hash.AbstractHashFunction, com.google.common.hash.HashFunction
    public HashCode hashBytes(byte[] input, int off, int len) {
        Preconditions.checkPositionIndexes(off, off + len, input.length);
        int iMixH1 = this.seed;
        int i = 0;
        int i2 = 0;
        while (true) {
            int i3 = i2 + 4;
            if (i3 > len) {
                break;
            }
            iMixH1 = mixH1(iMixH1, mixK1(getIntLittleEndian(input, i2 + off)));
            i2 = i3;
        }
        int i4 = i2;
        int i5 = 0;
        while (i4 < len) {
            i ^= UnsignedBytes.toInt(input[off + i4]) << i5;
            i4++;
            i5 += 8;
        }
        return fmix(mixK1(i) ^ iMixH1, len);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int getIntLittleEndian(byte[] input, int offset) {
        return Ints.fromBytes(input[offset + 3], input[offset + 2], input[offset + 1], input[offset]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int mixK1(int k1) {
        return Integer.rotateLeft(k1 * C1, 15) * C2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int mixH1(int h1, int k1) {
        return (Integer.rotateLeft(h1 ^ k1, 13) * 5) - 430675100;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static HashCode fmix(int h1, int length) {
        int i = h1 ^ length;
        int i2 = (i ^ (i >>> 16)) * (-2048144789);
        int i3 = (i2 ^ (i2 >>> 13)) * (-1028477387);
        return HashCode.fromInt(i3 ^ (i3 >>> 16));
    }

    private static final class Murmur3_32Hasher extends AbstractHasher {
        private long buffer;
        private int h1;
        private int shift;
        private int length = 0;
        private boolean isDone = false;

        Murmur3_32Hasher(int seed) {
            this.h1 = seed;
        }

        private void update(int nBytes, long update) {
            long j = this.buffer;
            long j2 = update & KeyboardMap.kValueMask;
            int i = this.shift;
            long j3 = (j2 << i) | j;
            this.buffer = j3;
            int i2 = i + (nBytes * 8);
            this.shift = i2;
            this.length += nBytes;
            if (i2 >= 32) {
                this.h1 = Murmur3_32HashFunction.mixH1(this.h1, Murmur3_32HashFunction.mixK1((int) j3));
                this.buffer >>>= 32;
                this.shift -= 32;
            }
        }

        @Override // com.google.common.hash.AbstractHasher, com.google.common.hash.Hasher, com.google.common.hash.PrimitiveSink
        public Hasher putByte(byte b) {
            update(1, b & 255);
            return this;
        }

        @Override // com.google.common.hash.AbstractHasher, com.google.common.hash.PrimitiveSink
        public Hasher putBytes(byte[] bytes, int off, int len) {
            Preconditions.checkPositionIndexes(off, off + len, bytes.length);
            int i = 0;
            while (true) {
                int i2 = i + 4;
                if (i2 > len) {
                    break;
                }
                update(4, Murmur3_32HashFunction.getIntLittleEndian(bytes, i + off));
                i = i2;
            }
            while (i < len) {
                putByte(bytes[off + i]);
                i++;
            }
            return this;
        }

        @Override // com.google.common.hash.AbstractHasher, com.google.common.hash.PrimitiveSink
        public Hasher putBytes(ByteBuffer buffer) {
            ByteOrder byteOrderOrder = buffer.order();
            buffer.order(ByteOrder.LITTLE_ENDIAN);
            while (buffer.remaining() >= 4) {
                putInt(buffer.getInt());
            }
            while (buffer.hasRemaining()) {
                putByte(buffer.get());
            }
            buffer.order(byteOrderOrder);
            return this;
        }

        @Override // com.google.common.hash.AbstractHasher, com.google.common.hash.PrimitiveSink
        public Hasher putInt(int i) {
            update(4, i);
            return this;
        }

        @Override // com.google.common.hash.AbstractHasher, com.google.common.hash.PrimitiveSink
        public Hasher putLong(long l) {
            update(4, (int) l);
            update(4, l >>> 32);
            return this;
        }

        @Override // com.google.common.hash.AbstractHasher, com.google.common.hash.PrimitiveSink
        public Hasher putChar(char c) {
            update(2, c);
            return this;
        }

        @Override // com.google.common.hash.AbstractHasher, com.google.common.hash.PrimitiveSink
        public Hasher putString(CharSequence input, Charset charset) {
            if (Charsets.UTF_8.equals(charset)) {
                int length = input.length();
                int i = 0;
                while (true) {
                    int i2 = i + 4;
                    if (i2 > length) {
                        break;
                    }
                    char cCharAt = input.charAt(i);
                    char cCharAt2 = input.charAt(i + 1);
                    char cCharAt3 = input.charAt(i + 2);
                    char cCharAt4 = input.charAt(i + 3);
                    if (cCharAt >= 128 || cCharAt2 >= 128 || cCharAt3 >= 128 || cCharAt4 >= 128) {
                        break;
                    }
                    update(4, (cCharAt2 << '\b') | cCharAt | (cCharAt3 << 16) | (cCharAt4 << 24));
                    i = i2;
                }
                while (i < length) {
                    char cCharAt5 = input.charAt(i);
                    if (cCharAt5 < 128) {
                        update(1, cCharAt5);
                    } else if (cCharAt5 < 2048) {
                        update(2, Murmur3_32HashFunction.charToTwoUtf8Bytes(cCharAt5));
                    } else if (cCharAt5 < 55296 || cCharAt5 > 57343) {
                        update(3, Murmur3_32HashFunction.charToThreeUtf8Bytes(cCharAt5));
                    } else {
                        int iCodePointAt = Character.codePointAt(input, i);
                        if (iCodePointAt != cCharAt5) {
                            i++;
                            update(4, Murmur3_32HashFunction.codePointToFourUtf8Bytes(iCodePointAt));
                        } else {
                            putBytes(input.subSequence(i, length).toString().getBytes(charset));
                            return this;
                        }
                    }
                    i++;
                }
                return this;
            }
            return super.putString(input, charset);
        }

        @Override // com.google.common.hash.Hasher
        public HashCode hash() {
            Preconditions.checkState(!this.isDone);
            this.isDone = true;
            int iMixK1 = this.h1 ^ Murmur3_32HashFunction.mixK1((int) this.buffer);
            this.h1 = iMixK1;
            return Murmur3_32HashFunction.fmix(iMixK1, this.length);
        }
    }
}
