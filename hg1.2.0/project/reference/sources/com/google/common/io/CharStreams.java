package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.nio.CharBuffer;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class CharStreams {
    private static final int DEFAULT_BUF_SIZE = 2048;

    static CharBuffer createBuffer() {
        return CharBuffer.allocate(2048);
    }

    private CharStreams() {
    }

    public static long copy(Readable from, Appendable to) throws IOException {
        if (from instanceof Reader) {
            if (to instanceof StringBuilder) {
                return copyReaderToBuilder((Reader) from, (StringBuilder) to);
            }
            return copyReaderToWriter((Reader) from, asWriter(to));
        }
        Preconditions.checkNotNull(from);
        Preconditions.checkNotNull(to);
        CharBuffer charBufferCreateBuffer = createBuffer();
        long jRemaining = 0;
        while (from.read(charBufferCreateBuffer) != -1) {
            Java8Compatibility.flip(charBufferCreateBuffer);
            to.append(charBufferCreateBuffer);
            jRemaining += charBufferCreateBuffer.remaining();
            Java8Compatibility.clear(charBufferCreateBuffer);
        }
        return jRemaining;
    }

    static long copyReaderToBuilder(Reader from, StringBuilder to) throws IOException {
        Preconditions.checkNotNull(from);
        Preconditions.checkNotNull(to);
        char[] cArr = new char[2048];
        long j = 0;
        while (true) {
            int i = from.read(cArr);
            if (i == -1) {
                return j;
            }
            to.append(cArr, 0, i);
            j += i;
        }
    }

    static long copyReaderToWriter(Reader from, Writer to) throws IOException {
        Preconditions.checkNotNull(from);
        Preconditions.checkNotNull(to);
        char[] cArr = new char[2048];
        long j = 0;
        while (true) {
            int i = from.read(cArr);
            if (i == -1) {
                return j;
            }
            to.write(cArr, 0, i);
            j += i;
        }
    }

    public static String toString(Readable r) throws IOException {
        return toStringBuilder(r).toString();
    }

    private static StringBuilder toStringBuilder(Readable r) throws IOException {
        StringBuilder sb = new StringBuilder();
        if (r instanceof Reader) {
            copyReaderToBuilder((Reader) r, sb);
        } else {
            copy(r, sb);
        }
        return sb;
    }

    public static List<String> readLines(Readable r) throws IOException {
        ArrayList arrayList = new ArrayList();
        LineReader lineReader = new LineReader(r);
        while (true) {
            String line = lineReader.readLine();
            if (line == null) {
                return arrayList;
            }
            arrayList.add(line);
        }
    }

    @ParametricNullness
    public static <T> T readLines(Readable readable, LineProcessor<T> processor) throws IOException {
        String line;
        Preconditions.checkNotNull(readable);
        Preconditions.checkNotNull(processor);
        LineReader lineReader = new LineReader(readable);
        do {
            line = lineReader.readLine();
            if (line == null) {
                break;
            }
        } while (processor.processLine(line));
        return processor.getResult();
    }

    public static long exhaust(Readable readable) throws IOException {
        CharBuffer charBufferCreateBuffer = createBuffer();
        long j = 0;
        while (true) {
            long j2 = readable.read(charBufferCreateBuffer);
            if (j2 == -1) {
                return j;
            }
            j += j2;
            Java8Compatibility.clear(charBufferCreateBuffer);
        }
    }

    public static void skipFully(Reader reader, long n) throws IOException {
        Preconditions.checkNotNull(reader);
        while (n > 0) {
            long jSkip = reader.skip(n);
            if (jSkip == 0) {
                throw new EOFException();
            }
            n -= jSkip;
        }
    }

    public static Writer nullWriter() {
        return NullWriter.INSTANCE;
    }

    private static final class NullWriter extends Writer {
        private static final NullWriter INSTANCE = new NullWriter();

        @Override // java.io.Writer, java.lang.Appendable
        public Writer append(char c) {
            return this;
        }

        @Override // java.io.Writer, java.lang.Appendable
        public Writer append(@CheckForNull CharSequence csq) {
            return this;
        }

        @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
        public void close() {
        }

        @Override // java.io.Writer, java.io.Flushable
        public void flush() {
        }

        @Override // java.io.Writer
        public void write(int c) {
        }

        private NullWriter() {
        }

        @Override // java.io.Writer
        public void write(char[] cbuf) {
            Preconditions.checkNotNull(cbuf);
        }

        @Override // java.io.Writer
        public void write(char[] cbuf, int off, int len) {
            Preconditions.checkPositionIndexes(off, len + off, cbuf.length);
        }

        @Override // java.io.Writer
        public void write(String str) {
            Preconditions.checkNotNull(str);
        }

        @Override // java.io.Writer
        public void write(String str, int off, int len) {
            Preconditions.checkPositionIndexes(off, len + off, str.length());
        }

        @Override // java.io.Writer, java.lang.Appendable
        public Writer append(@CheckForNull CharSequence csq, int start, int end) {
            Preconditions.checkPositionIndexes(start, end, csq == null ? 4 : csq.length());
            return this;
        }

        public String toString() {
            return "CharStreams.nullWriter()";
        }
    }

    public static Writer asWriter(Appendable target) {
        if (target instanceof Writer) {
            return (Writer) target;
        }
        return new AppendableWriter(target);
    }
}
