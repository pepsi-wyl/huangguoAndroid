package com.google.common.collect;

import com.google.common.base.Objects;
import java.util.Arrays;
import javax.annotation.CheckForNull;
import kotlin.UShort;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class CompactHashing {
    private static final int BYTE_MASK = 255;
    private static final int BYTE_MAX_SIZE = 256;
    static final int DEFAULT_SIZE = 3;
    static final int HASH_TABLE_BITS_MASK = 31;
    private static final int HASH_TABLE_BITS_MAX_BITS = 5;
    static final int MAX_SIZE = 1073741823;
    private static final int MIN_HASH_TABLE_SIZE = 4;
    static final int MODIFICATION_COUNT_INCREMENT = 32;
    private static final int SHORT_MASK = 65535;
    private static final int SHORT_MAX_SIZE = 65536;
    static final byte UNSET = 0;

    static int getHashPrefix(int value, int mask) {
        return value & (~mask);
    }

    static int getNext(int entry, int mask) {
        return entry & mask;
    }

    static int maskCombine(int prefix, int suffix, int mask) {
        return (prefix & (~mask)) | (suffix & mask);
    }

    static int newCapacity(int mask) {
        return (mask < 32 ? 4 : 2) * (mask + 1);
    }

    private CompactHashing() {
    }

    static int tableSize(int expectedSize) {
        return Math.max(4, Hashing.closedTableSize(expectedSize + 1, 1.0d));
    }

    static Object createTable(int buckets) {
        if (buckets < 2 || buckets > 1073741824 || Integer.highestOneBit(buckets) != buckets) {
            throw new IllegalArgumentException("must be power of 2 between 2^1 and 2^30: " + buckets);
        }
        if (buckets <= 256) {
            return new byte[buckets];
        }
        if (buckets <= 65536) {
            return new short[buckets];
        }
        return new int[buckets];
    }

    static void tableClear(Object table) {
        if (table instanceof byte[]) {
            Arrays.fill((byte[]) table, (byte) 0);
        } else if (table instanceof short[]) {
            Arrays.fill((short[]) table, (short) 0);
        } else {
            Arrays.fill((int[]) table, 0);
        }
    }

    static int tableGet(Object table, int index) {
        if (table instanceof byte[]) {
            return ((byte[]) table)[index] & 255;
        }
        if (table instanceof short[]) {
            return ((short[]) table)[index] & UShort.MAX_VALUE;
        }
        return ((int[]) table)[index];
    }

    static void tableSet(Object table, int index, int entry) {
        if (table instanceof byte[]) {
            ((byte[]) table)[index] = (byte) entry;
        } else if (table instanceof short[]) {
            ((short[]) table)[index] = (short) entry;
        } else {
            ((int[]) table)[index] = entry;
        }
    }

    static int remove(@CheckForNull Object key, @CheckForNull Object value, int mask, Object table, int[] entries, Object[] keys, @CheckForNull Object[] values) {
        int i;
        int i2;
        int iSmearedHash = Hashing.smearedHash(key);
        int i3 = iSmearedHash & mask;
        int iTableGet = tableGet(table, i3);
        if (iTableGet == 0) {
            return -1;
        }
        int hashPrefix = getHashPrefix(iSmearedHash, mask);
        int i4 = -1;
        while (true) {
            i = iTableGet - 1;
            i2 = entries[i];
            if (getHashPrefix(i2, mask) == hashPrefix && Objects.equal(key, keys[i]) && (values == null || Objects.equal(value, values[i]))) {
                break;
            }
            int next = getNext(i2, mask);
            if (next == 0) {
                return -1;
            }
            i4 = i;
            iTableGet = next;
        }
        int next2 = getNext(i2, mask);
        if (i4 == -1) {
            tableSet(table, i3, next2);
        } else {
            entries[i4] = maskCombine(entries[i4], next2, mask);
        }
        return i;
    }
}
