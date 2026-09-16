package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.Charset;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class ByteSink {
    public abstract OutputStream openStream() throws IOException;

    protected ByteSink() {
    }

    public CharSink asCharSink(Charset charset) {
        return new AsCharSink(charset);
    }

    public OutputStream openBufferedStream() throws IOException {
        OutputStream outputStreamOpenStream = openStream();
        if (outputStreamOpenStream instanceof BufferedOutputStream) {
            return (BufferedOutputStream) outputStreamOpenStream;
        }
        return new BufferedOutputStream(outputStreamOpenStream);
    }

    public void write(byte[] bytes) throws Throwable {
        Preconditions.checkNotNull(bytes);
        try {
            OutputStream outputStream = (OutputStream) Closer.create().register(openStream());
            outputStream.write(bytes);
            outputStream.flush();
        } finally {
        }
    }

    public long writeFrom(InputStream input) throws Throwable {
        Preconditions.checkNotNull(input);
        try {
            OutputStream outputStream = (OutputStream) Closer.create().register(openStream());
            long jCopy = ByteStreams.copy(input, outputStream);
            outputStream.flush();
            return jCopy;
        } finally {
        }
    }

    private final class AsCharSink extends CharSink {
        private final Charset charset;

        private AsCharSink(Charset charset) {
            this.charset = (Charset) Preconditions.checkNotNull(charset);
        }

        @Override // com.google.common.io.CharSink
        public Writer openStream() throws IOException {
            return new OutputStreamWriter(ByteSink.this.openStream(), this.charset);
        }

        public String toString() {
            return ByteSink.this.toString() + ".asCharSink(" + this.charset + ")";
        }
    }
}
