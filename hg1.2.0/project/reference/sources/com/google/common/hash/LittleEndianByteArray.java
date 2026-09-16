package com.google.common.hash;

import com.google.common.hash.LittleEndianByteArray;
import com.google.common.primitives.Longs;
import java.lang.reflect.Field;
import java.nio.ByteOrder;
import java.security.AccessController;
import java.security.PrivilegedActionException;
import java.security.PrivilegedExceptionAction;
import sun.misc.Unsafe;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class LittleEndianByteArray {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final LittleEndianBytes byteArray;

    private enum JavaLittleEndianBytes implements LittleEndianBytes {
        INSTANCE { // from class: com.google.common.hash.LittleEndianByteArray.JavaLittleEndianBytes.1
            @Override // com.google.common.hash.LittleEndianByteArray.LittleEndianBytes
            public long getLongLittleEndian(byte[] source, int offset) {
                return Longs.fromBytes(source[offset + 7], source[offset + 6], source[offset + 5], source[offset + 4], source[offset + 3], source[offset + 2], source[offset + 1], source[offset]);
            }

            @Override // com.google.common.hash.LittleEndianByteArray.LittleEndianBytes
            public void putLongLittleEndian(byte[] sink, int offset, long value) {
                long j = 255;
                for (int i = 0; i < 8; i++) {
                    sink[offset + i] = (byte) ((value & j) >> (i * 8));
                    j <<= 8;
                }
            }
        }
    }

    private interface LittleEndianBytes {
        long getLongLittleEndian(byte[] array, int offset);

        void putLongLittleEndian(byte[] array, int offset, long value);
    }

    static long load64(byte[] input, int offset) {
        return byteArray.getLongLittleEndian(input, offset);
    }

    static long load64Safely(byte[] input, int offset, int length) {
        long j = 0;
        for (int i = 0; i < Math.min(length, 8); i++) {
            j |= (input[offset + i] & 255) << (i * 8);
        }
        return j;
    }

    static void store64(byte[] sink, int offset, long value) {
        byteArray.putLongLittleEndian(sink, offset, value);
    }

    static int load32(byte[] source, int offset) {
        return ((source[offset + 3] & 255) << 24) | (source[offset] & 255) | ((source[offset + 1] & 255) << 8) | ((source[offset + 2] & 255) << 16);
    }

    static boolean usingUnsafe() {
        return byteArray instanceof UnsafeByteArray;
    }

    /* JADX INFO: Access modifiers changed from: private */
    enum UnsafeByteArray implements LittleEndianBytes {
        UNSAFE_LITTLE_ENDIAN { // from class: com.google.common.hash.LittleEndianByteArray.UnsafeByteArray.1
            @Override // com.google.common.hash.LittleEndianByteArray.LittleEndianBytes
            public long getLongLittleEndian(byte[] array, int offset) {
                return UnsafeByteArray.theUnsafe.getLong(array, offset + UnsafeByteArray.BYTE_ARRAY_BASE_OFFSET);
            }

            @Override // com.google.common.hash.LittleEndianByteArray.LittleEndianBytes
            public void putLongLittleEndian(byte[] array, int offset, long value) {
                UnsafeByteArray.theUnsafe.putLong(array, offset + UnsafeByteArray.BYTE_ARRAY_BASE_OFFSET, value);
            }
        },
        UNSAFE_BIG_ENDIAN { // from class: com.google.common.hash.LittleEndianByteArray.UnsafeByteArray.2
            @Override // com.google.common.hash.LittleEndianByteArray.LittleEndianBytes
            public long getLongLittleEndian(byte[] array, int offset) {
                return Long.reverseBytes(UnsafeByteArray.theUnsafe.getLong(array, offset + UnsafeByteArray.BYTE_ARRAY_BASE_OFFSET));
            }

            @Override // com.google.common.hash.LittleEndianByteArray.LittleEndianBytes
            public void putLongLittleEndian(byte[] array, int offset, long value) {
                UnsafeByteArray.theUnsafe.putLong(array, offset + UnsafeByteArray.BYTE_ARRAY_BASE_OFFSET, Long.reverseBytes(value));
            }
        };

        private static final int BYTE_ARRAY_BASE_OFFSET;
        private static final Unsafe theUnsafe;

        static {
            Unsafe unsafe = getUnsafe();
            theUnsafe = unsafe;
            BYTE_ARRAY_BASE_OFFSET = unsafe.arrayBaseOffset(byte[].class);
            if (unsafe.arrayIndexScale(byte[].class) != 1) {
                throw new AssertionError();
            }
        }

        private static Unsafe getUnsafe() {
            try {
                try {
                    return Unsafe.getUnsafe();
                } catch (PrivilegedActionException e) {
                    throw new RuntimeException("Could not initialize intrinsics", e.getCause());
                }
            } catch (SecurityException unused) {
                return (Unsafe) AccessController.doPrivileged(new PrivilegedExceptionAction() { // from class: com.google.common.hash.LittleEndianByteArray$UnsafeByteArray$$ExternalSyntheticLambda0
                    @Override // java.security.PrivilegedExceptionAction
                    public final Object run() {
                        return LittleEndianByteArray.UnsafeByteArray.lambda$getUnsafe$0();
                    }
                });
            }
        }

        static /* synthetic */ Unsafe lambda$getUnsafe$0() throws Exception {
            for (Field field : Unsafe.class.getDeclaredFields()) {
                field.setAccessible(true);
                Object obj = field.get(null);
                if (Unsafe.class.isInstance(obj)) {
                    return (Unsafe) Unsafe.class.cast(obj);
                }
            }
            throw new NoSuchFieldError("the Unsafe");
        }
    }

    static {
        LittleEndianBytes littleEndianBytes = JavaLittleEndianBytes.INSTANCE;
        try {
            if ("amd64".equals(System.getProperty("os.arch"))) {
                if (ByteOrder.nativeOrder().equals(ByteOrder.LITTLE_ENDIAN)) {
                    littleEndianBytes = UnsafeByteArray.UNSAFE_LITTLE_ENDIAN;
                } else {
                    littleEndianBytes = UnsafeByteArray.UNSAFE_BIG_ENDIAN;
                }
            }
        } catch (Throwable unused) {
        }
        byteArray = littleEndianBytes;
    }

    private LittleEndianByteArray() {
    }
}
