package com.google.common.io;

import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import com.google.common.primitives.Longs;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class LittleEndianDataInputStream extends FilterInputStream implements DataInput {
    public LittleEndianDataInputStream(InputStream in) {
        super((InputStream) Preconditions.checkNotNull(in));
    }

    @Override // java.io.DataInput
    public String readLine() {
        throw new UnsupportedOperationException("readLine is not supported");
    }

    @Override // java.io.DataInput
    public void readFully(byte[] b) throws IOException {
        ByteStreams.readFully(this, b);
    }

    @Override // java.io.DataInput
    public void readFully(byte[] b, int off, int len) throws IOException {
        ByteStreams.readFully(this, b, off, len);
    }

    @Override // java.io.DataInput
    public int skipBytes(int n) throws IOException {
        return (int) this.in.skip(n);
    }

    @Override // java.io.DataInput
    public int readUnsignedByte() throws IOException {
        int i = this.in.read();
        if (i >= 0) {
            return i;
        }
        throw new EOFException();
    }

    @Override // java.io.DataInput
    public int readUnsignedShort() throws IOException {
        return Ints.fromBytes((byte) 0, (byte) 0, readAndCheckByte(), readAndCheckByte());
    }

    @Override // java.io.DataInput
    public int readInt() throws IOException {
        byte andCheckByte = readAndCheckByte();
        byte andCheckByte2 = readAndCheckByte();
        return Ints.fromBytes(readAndCheckByte(), readAndCheckByte(), andCheckByte2, andCheckByte);
    }

    @Override // java.io.DataInput
    public long readLong() throws IOException {
        byte andCheckByte = readAndCheckByte();
        byte andCheckByte2 = readAndCheckByte();
        byte andCheckByte3 = readAndCheckByte();
        byte andCheckByte4 = readAndCheckByte();
        byte andCheckByte5 = readAndCheckByte();
        byte andCheckByte6 = readAndCheckByte();
        return Longs.fromBytes(readAndCheckByte(), readAndCheckByte(), andCheckByte6, andCheckByte5, andCheckByte4, andCheckByte3, andCheckByte2, andCheckByte);
    }

    @Override // java.io.DataInput
    public float readFloat() throws IOException {
        return Float.intBitsToFloat(readInt());
    }

    @Override // java.io.DataInput
    public double readDouble() throws IOException {
        return Double.longBitsToDouble(readLong());
    }

    @Override // java.io.DataInput
    public String readUTF() throws IOException {
        return new DataInputStream(this.in).readUTF();
    }

    @Override // java.io.DataInput
    public short readShort() throws IOException {
        return (short) readUnsignedShort();
    }

    @Override // java.io.DataInput
    public char readChar() throws IOException {
        return (char) readUnsignedShort();
    }

    @Override // java.io.DataInput
    public byte readByte() throws IOException {
        return (byte) readUnsignedByte();
    }

    @Override // java.io.DataInput
    public boolean readBoolean() throws IOException {
        return readUnsignedByte() != 0;
    }

    private byte readAndCheckByte() throws IOException {
        int i = this.in.read();
        if (-1 != i) {
            return (byte) i;
        }
        throw new EOFException();
    }
}
