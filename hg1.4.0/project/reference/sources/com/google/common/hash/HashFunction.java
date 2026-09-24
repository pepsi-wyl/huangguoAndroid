package com.google.common.hash;

import com.google.errorprone.annotations.Immutable;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;

@Immutable
@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface HashFunction {
    int bits();

    HashCode hashBytes(ByteBuffer input);

    HashCode hashBytes(byte[] input);

    HashCode hashBytes(byte[] input, int off, int len);

    HashCode hashInt(int input);

    HashCode hashLong(long input);

    <T> HashCode hashObject(@ParametricNullness T instance, Funnel<? super T> funnel);

    HashCode hashString(CharSequence input, Charset charset);

    HashCode hashUnencodedChars(CharSequence input);

    Hasher newHasher();

    Hasher newHasher(int expectedInputSize);
}
