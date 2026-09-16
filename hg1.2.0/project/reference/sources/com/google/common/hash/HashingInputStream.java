package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class HashingInputStream extends FilterInputStream {
    private final Hasher hasher;

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void mark(int readlimit) {
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    public HashingInputStream(HashFunction hashFunction, InputStream in) {
        super((InputStream) Preconditions.checkNotNull(in));
        this.hasher = (Hasher) Preconditions.checkNotNull(hashFunction.newHasher());
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int i = this.in.read();
        if (i != -1) {
            this.hasher.putByte((byte) i);
        }
        return i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bytes, int off, int len) throws IOException {
        int i = this.in.read(bytes, off, len);
        if (i != -1) {
            this.hasher.putBytes(bytes, off, i);
        }
        return i;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public void reset() throws IOException {
        throw new IOException("reset not supported");
    }

    public HashCode hash() {
        return this.hasher.hash();
    }
}
