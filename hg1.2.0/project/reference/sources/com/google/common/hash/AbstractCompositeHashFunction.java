package com.google.common.hash;

import com.google.common.base.Preconditions;
import com.google.errorprone.annotations.Immutable;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;

@Immutable
@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
abstract class AbstractCompositeHashFunction extends AbstractHashFunction {
    private static final long serialVersionUID = 0;
    final HashFunction[] functions;

    abstract HashCode makeHash(Hasher[] hashers);

    AbstractCompositeHashFunction(HashFunction... functions) {
        for (HashFunction hashFunction : functions) {
            Preconditions.checkNotNull(hashFunction);
        }
        this.functions = functions;
    }

    @Override // com.google.common.hash.HashFunction
    public Hasher newHasher() {
        int length = this.functions.length;
        Hasher[] hasherArr = new Hasher[length];
        for (int i = 0; i < length; i++) {
            hasherArr[i] = this.functions[i].newHasher();
        }
        return fromHashers(hasherArr);
    }

    @Override // com.google.common.hash.AbstractHashFunction, com.google.common.hash.HashFunction
    public Hasher newHasher(int expectedInputSize) {
        Preconditions.checkArgument(expectedInputSize >= 0);
        int length = this.functions.length;
        Hasher[] hasherArr = new Hasher[length];
        for (int i = 0; i < length; i++) {
            hasherArr[i] = this.functions[i].newHasher(expectedInputSize);
        }
        return fromHashers(hasherArr);
    }

    private Hasher fromHashers(final Hasher[] hashers) {
        return new Hasher() { // from class: com.google.common.hash.AbstractCompositeHashFunction.1
            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putByte(byte b) {
                for (Hasher hasher : hashers) {
                    hasher.putByte(b);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putBytes(byte[] bytes) {
                for (Hasher hasher : hashers) {
                    hasher.putBytes(bytes);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putBytes(byte[] bytes, int off, int len) {
                for (Hasher hasher : hashers) {
                    hasher.putBytes(bytes, off, len);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putBytes(ByteBuffer bytes) {
                int iPosition = bytes.position();
                for (Hasher hasher : hashers) {
                    Java8Compatibility.position(bytes, iPosition);
                    hasher.putBytes(bytes);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putShort(short s) {
                for (Hasher hasher : hashers) {
                    hasher.putShort(s);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putInt(int i) {
                for (Hasher hasher : hashers) {
                    hasher.putInt(i);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putLong(long l) {
                for (Hasher hasher : hashers) {
                    hasher.putLong(l);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putFloat(float f) {
                for (Hasher hasher : hashers) {
                    hasher.putFloat(f);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putDouble(double d) {
                for (Hasher hasher : hashers) {
                    hasher.putDouble(d);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putBoolean(boolean b) {
                for (Hasher hasher : hashers) {
                    hasher.putBoolean(b);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putChar(char c) {
                for (Hasher hasher : hashers) {
                    hasher.putChar(c);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putUnencodedChars(CharSequence chars) {
                for (Hasher hasher : hashers) {
                    hasher.putUnencodedChars(chars);
                }
                return this;
            }

            @Override // com.google.common.hash.PrimitiveSink
            public Hasher putString(CharSequence chars, Charset charset) {
                for (Hasher hasher : hashers) {
                    hasher.putString(chars, charset);
                }
                return this;
            }

            @Override // com.google.common.hash.Hasher
            public <T> Hasher putObject(@ParametricNullness T instance, Funnel<? super T> funnel) {
                for (Hasher hasher : hashers) {
                    hasher.putObject(instance, funnel);
                }
                return this;
            }

            @Override // com.google.common.hash.Hasher
            public HashCode hash() {
                return AbstractCompositeHashFunction.this.makeHash(hashers);
            }
        };
    }
}
