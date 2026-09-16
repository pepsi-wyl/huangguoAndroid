package com.google.common.io;

import com.google.common.base.Preconditions;
import com.google.common.primitives.UnsignedBytes;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CodingErrorAction;
import java.util.Arrays;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class ReaderInputStream extends InputStream {
    private ByteBuffer byteBuffer;
    private CharBuffer charBuffer;
    private boolean doneFlushing;
    private boolean draining;
    private final CharsetEncoder encoder;
    private boolean endOfInput;
    private final Reader reader;
    private final byte[] singleByte;

    ReaderInputStream(Reader reader, Charset charset, int bufferSize) {
        this(reader, charset.newEncoder().onMalformedInput(CodingErrorAction.REPLACE).onUnmappableCharacter(CodingErrorAction.REPLACE), bufferSize);
    }

    ReaderInputStream(Reader reader, CharsetEncoder encoder, int bufferSize) {
        this.singleByte = new byte[1];
        this.reader = (Reader) Preconditions.checkNotNull(reader);
        this.encoder = (CharsetEncoder) Preconditions.checkNotNull(encoder);
        Preconditions.checkArgument(bufferSize > 0, "bufferSize must be positive: %s", bufferSize);
        encoder.reset();
        CharBuffer charBufferAllocate = CharBuffer.allocate(bufferSize);
        this.charBuffer = charBufferAllocate;
        Java8Compatibility.flip(charBufferAllocate);
        this.byteBuffer = ByteBuffer.allocate(bufferSize);
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.reader.close();
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (read(this.singleByte) == 1) {
            return UnsignedBytes.toInt(this.singleByte[0]);
        }
        return -1;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0029, code lost:
    
        if (r2 <= 0) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x002c, code lost:
    
        return -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:?, code lost:
    
        return r2;
     */
    @Override // java.io.InputStream
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int read(byte[] r8, int r9, int r10) throws java.io.IOException {
        /*
            r7 = this;
            int r0 = r9 + r10
            int r1 = r8.length
            com.google.common.base.Preconditions.checkPositionIndexes(r9, r0, r1)
            r0 = 0
            if (r10 != 0) goto La
            return r0
        La:
            boolean r1 = r7.endOfInput
            r2 = 0
        Ld:
            boolean r3 = r7.draining
            if (r3 == 0) goto L2e
            int r3 = r9 + r2
            int r4 = r10 - r2
            int r3 = r7.drain(r8, r3, r4)
            int r2 = r2 + r3
            if (r2 == r10) goto L29
            boolean r3 = r7.doneFlushing
            if (r3 == 0) goto L21
            goto L29
        L21:
            r7.draining = r0
            java.nio.ByteBuffer r3 = r7.byteBuffer
            com.google.common.io.Java8Compatibility.clear(r3)
            goto L2e
        L29:
            if (r2 <= 0) goto L2c
            goto L2d
        L2c:
            r2 = -1
        L2d:
            return r2
        L2e:
            boolean r3 = r7.doneFlushing
            if (r3 == 0) goto L35
            java.nio.charset.CoderResult r3 = java.nio.charset.CoderResult.UNDERFLOW
            goto L4c
        L35:
            if (r1 == 0) goto L40
            java.nio.charset.CharsetEncoder r3 = r7.encoder
            java.nio.ByteBuffer r4 = r7.byteBuffer
            java.nio.charset.CoderResult r3 = r3.flush(r4)
            goto L4c
        L40:
            java.nio.charset.CharsetEncoder r3 = r7.encoder
            java.nio.CharBuffer r4 = r7.charBuffer
            java.nio.ByteBuffer r5 = r7.byteBuffer
            boolean r6 = r7.endOfInput
            java.nio.charset.CoderResult r3 = r3.encode(r4, r5, r6)
        L4c:
            boolean r4 = r3.isOverflow()
            r5 = 1
            if (r4 == 0) goto L57
            r7.startDraining(r5)
            goto Ld
        L57:
            boolean r4 = r3.isUnderflow()
            if (r4 == 0) goto L6f
            if (r1 == 0) goto L65
            r7.doneFlushing = r5
            r7.startDraining(r0)
            goto Ld
        L65:
            boolean r3 = r7.endOfInput
            if (r3 == 0) goto L6b
            r1 = 1
            goto L2e
        L6b:
            r7.readMoreChars()
            goto L2e
        L6f:
            boolean r4 = r3.isError()
            if (r4 == 0) goto L2e
            r3.throwException()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.common.io.ReaderInputStream.read(byte[], int, int):int");
    }

    private static CharBuffer grow(CharBuffer buf) {
        CharBuffer charBufferWrap = CharBuffer.wrap(Arrays.copyOf(buf.array(), buf.capacity() * 2));
        Java8Compatibility.position(charBufferWrap, buf.position());
        Java8Compatibility.limit(charBufferWrap, buf.limit());
        return charBufferWrap;
    }

    private void readMoreChars() throws IOException {
        if (availableCapacity(this.charBuffer) == 0) {
            if (this.charBuffer.position() > 0) {
                Java8Compatibility.flip(this.charBuffer.compact());
            } else {
                this.charBuffer = grow(this.charBuffer);
            }
        }
        int iLimit = this.charBuffer.limit();
        int i = this.reader.read(this.charBuffer.array(), iLimit, availableCapacity(this.charBuffer));
        if (i == -1) {
            this.endOfInput = true;
        } else {
            Java8Compatibility.limit(this.charBuffer, iLimit + i);
        }
    }

    private static int availableCapacity(Buffer buffer) {
        return buffer.capacity() - buffer.limit();
    }

    private void startDraining(boolean overflow) {
        Java8Compatibility.flip(this.byteBuffer);
        if (overflow && this.byteBuffer.remaining() == 0) {
            this.byteBuffer = ByteBuffer.allocate(this.byteBuffer.capacity() * 2);
        } else {
            this.draining = true;
        }
    }

    private int drain(byte[] b, int off, int len) {
        int iMin = Math.min(len, this.byteBuffer.remaining());
        this.byteBuffer.get(b, off, iMin);
        return iMin;
    }
}
