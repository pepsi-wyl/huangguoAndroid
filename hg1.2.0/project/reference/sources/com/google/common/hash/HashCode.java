package com.google.common.hash;

import com.google.common.base.Ascii;
import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import com.google.common.primitives.UnsignedInts;
import java.io.Serializable;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class HashCode {
    private static final char[] hexDigits = "0123456789abcdef".toCharArray();

    public abstract byte[] asBytes();

    public abstract int asInt();

    public abstract long asLong();

    public abstract int bits();

    abstract boolean equalsSameBits(HashCode that);

    public abstract long padToLong();

    abstract void writeBytesToImpl(byte[] dest, int offset, int maxLength);

    HashCode() {
    }

    public int writeBytesTo(byte[] dest, int offset, int maxLength) {
        int iMin = Ints.min(maxLength, bits() / 8);
        Preconditions.checkPositionIndexes(offset, offset + iMin, dest.length);
        writeBytesToImpl(dest, offset, iMin);
        return iMin;
    }

    byte[] getBytesInternal() {
        return asBytes();
    }

    public static HashCode fromInt(int hash) {
        return new IntHashCode(hash);
    }

    private static final class IntHashCode extends HashCode implements Serializable {
        private static final long serialVersionUID = 0;
        final int hash;

        @Override // com.google.common.hash.HashCode
        public int bits() {
            return 32;
        }

        IntHashCode(int hash) {
            this.hash = hash;
        }

        @Override // com.google.common.hash.HashCode
        public byte[] asBytes() {
            int i = this.hash;
            return new byte[]{(byte) i, (byte) (i >> 8), (byte) (i >> 16), (byte) (i >> 24)};
        }

        @Override // com.google.common.hash.HashCode
        public int asInt() {
            return this.hash;
        }

        @Override // com.google.common.hash.HashCode
        public long asLong() {
            throw new IllegalStateException("this HashCode only has 32 bits; cannot create a long");
        }

        @Override // com.google.common.hash.HashCode
        public long padToLong() {
            return UnsignedInts.toLong(this.hash);
        }

        @Override // com.google.common.hash.HashCode
        void writeBytesToImpl(byte[] dest, int offset, int maxLength) {
            for (int i = 0; i < maxLength; i++) {
                dest[offset + i] = (byte) (this.hash >> (i * 8));
            }
        }

        @Override // com.google.common.hash.HashCode
        boolean equalsSameBits(HashCode that) {
            return this.hash == that.asInt();
        }
    }

    public static HashCode fromLong(long hash) {
        return new LongHashCode(hash);
    }

    private static final class LongHashCode extends HashCode implements Serializable {
        private static final long serialVersionUID = 0;
        final long hash;

        @Override // com.google.common.hash.HashCode
        public int bits() {
            return 64;
        }

        LongHashCode(long hash) {
            this.hash = hash;
        }

        @Override // com.google.common.hash.HashCode
        public byte[] asBytes() {
            return new byte[]{(byte) this.hash, (byte) (r0 >> 8), (byte) (r0 >> 16), (byte) (r0 >> 24), (byte) (r0 >> 32), (byte) (r0 >> 40), (byte) (r0 >> 48), (byte) (r0 >> 56)};
        }

        @Override // com.google.common.hash.HashCode
        public int asInt() {
            return (int) this.hash;
        }

        @Override // com.google.common.hash.HashCode
        public long asLong() {
            return this.hash;
        }

        @Override // com.google.common.hash.HashCode
        public long padToLong() {
            return this.hash;
        }

        @Override // com.google.common.hash.HashCode
        void writeBytesToImpl(byte[] dest, int offset, int maxLength) {
            for (int i = 0; i < maxLength; i++) {
                dest[offset + i] = (byte) (this.hash >> (i * 8));
            }
        }

        @Override // com.google.common.hash.HashCode
        boolean equalsSameBits(HashCode that) {
            return this.hash == that.asLong();
        }
    }

    public static HashCode fromBytes(byte[] bytes) {
        Preconditions.checkArgument(bytes.length >= 1, "A HashCode must contain at least 1 byte.");
        return fromBytesNoCopy((byte[]) bytes.clone());
    }

    static HashCode fromBytesNoCopy(byte[] bytes) {
        return new BytesHashCode(bytes);
    }

    private static final class BytesHashCode extends HashCode implements Serializable {
        private static final long serialVersionUID = 0;
        final byte[] bytes;

        BytesHashCode(byte[] bytes) {
            this.bytes = (byte[]) Preconditions.checkNotNull(bytes);
        }

        @Override // com.google.common.hash.HashCode
        public int bits() {
            return this.bytes.length * 8;
        }

        @Override // com.google.common.hash.HashCode
        public byte[] asBytes() {
            return (byte[]) this.bytes.clone();
        }

        @Override // com.google.common.hash.HashCode
        public int asInt() {
            byte[] bArr = this.bytes;
            Preconditions.checkState(bArr.length >= 4, "HashCode#asInt() requires >= 4 bytes (it only has %s bytes).", bArr.length);
            byte[] bArr2 = this.bytes;
            return ((bArr2[3] & 255) << 24) | (bArr2[0] & 255) | ((bArr2[1] & 255) << 8) | ((bArr2[2] & 255) << 16);
        }

        @Override // com.google.common.hash.HashCode
        public long asLong() {
            byte[] bArr = this.bytes;
            Preconditions.checkState(bArr.length >= 8, "HashCode#asLong() requires >= 8 bytes (it only has %s bytes).", bArr.length);
            return padToLong();
        }

        @Override // com.google.common.hash.HashCode
        public long padToLong() {
            long j = this.bytes[0] & 255;
            for (int i = 1; i < Math.min(this.bytes.length, 8); i++) {
                j |= (this.bytes[i] & 255) << (i * 8);
            }
            return j;
        }

        @Override // com.google.common.hash.HashCode
        void writeBytesToImpl(byte[] dest, int offset, int maxLength) {
            System.arraycopy(this.bytes, 0, dest, offset, maxLength);
        }

        @Override // com.google.common.hash.HashCode
        byte[] getBytesInternal() {
            return this.bytes;
        }

        @Override // com.google.common.hash.HashCode
        boolean equalsSameBits(HashCode that) {
            if (this.bytes.length != that.getBytesInternal().length) {
                return false;
            }
            int i = 0;
            boolean z = true;
            while (true) {
                byte[] bArr = this.bytes;
                if (i >= bArr.length) {
                    return z;
                }
                z &= bArr[i] == that.getBytesInternal()[i];
                i++;
            }
        }
    }

    public static HashCode fromString(String string) {
        Preconditions.checkArgument(string.length() >= 2, "input string (%s) must have at least 2 characters", string);
        Preconditions.checkArgument(string.length() % 2 == 0, "input string (%s) must have an even number of characters", string);
        byte[] bArr = new byte[string.length() / 2];
        for (int i = 0; i < string.length(); i += 2) {
            bArr[i / 2] = (byte) ((decode(string.charAt(i)) << 4) + decode(string.charAt(i + 1)));
        }
        return fromBytesNoCopy(bArr);
    }

    private static int decode(char ch) {
        if (ch >= '0' && ch <= '9') {
            return ch - '0';
        }
        if (ch >= 'a' && ch <= 'f') {
            return ch - 'W';
        }
        throw new IllegalArgumentException("Illegal hexadecimal character: " + ch);
    }

    public final boolean equals(@CheckForNull Object object) {
        if (!(object instanceof HashCode)) {
            return false;
        }
        HashCode hashCode = (HashCode) object;
        return bits() == hashCode.bits() && equalsSameBits(hashCode);
    }

    public final int hashCode() {
        if (bits() >= 32) {
            return asInt();
        }
        byte[] bytesInternal = getBytesInternal();
        int i = bytesInternal[0] & 255;
        for (int i2 = 1; i2 < bytesInternal.length; i2++) {
            i |= (bytesInternal[i2] & 255) << (i2 * 8);
        }
        return i;
    }

    public final String toString() {
        byte[] bytesInternal = getBytesInternal();
        StringBuilder sb = new StringBuilder(bytesInternal.length * 2);
        for (byte b : bytesInternal) {
            char[] cArr = hexDigits;
            sb.append(cArr[(b >> 4) & 15]);
            sb.append(cArr[b & Ascii.SI]);
        }
        return sb.toString();
    }
}
