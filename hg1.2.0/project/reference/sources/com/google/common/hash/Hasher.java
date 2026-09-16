package com.google.common.hash;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface Hasher extends PrimitiveSink {
    HashCode hash();

    @Deprecated
    int hashCode();

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putBoolean(boolean b);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putByte(byte b);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putBytes(ByteBuffer bytes);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putBytes(byte[] bytes);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putBytes(byte[] bytes, int off, int len);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putChar(char c);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putDouble(double d);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putFloat(float f);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putInt(int i);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putLong(long l);

    <T> Hasher putObject(@ParametricNullness T instance, Funnel<? super T> funnel);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putShort(short s);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putString(CharSequence charSequence, Charset charset);

    @Override // com.google.common.hash.PrimitiveSink
    Hasher putUnencodedChars(CharSequence charSequence);

    /* renamed from: com.google.common.hash.Hasher$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
    }
}
