package com.google.common.hash;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface PrimitiveSink {
    PrimitiveSink putBoolean(boolean b);

    PrimitiveSink putByte(byte b);

    PrimitiveSink putBytes(ByteBuffer bytes);

    PrimitiveSink putBytes(byte[] bytes);

    PrimitiveSink putBytes(byte[] bytes, int off, int len);

    PrimitiveSink putChar(char c);

    PrimitiveSink putDouble(double d);

    PrimitiveSink putFloat(float f);

    PrimitiveSink putInt(int i);

    PrimitiveSink putLong(long l);

    PrimitiveSink putShort(short s);

    PrimitiveSink putString(CharSequence charSequence, Charset charset);

    PrimitiveSink putUnencodedChars(CharSequence charSequence);
}
