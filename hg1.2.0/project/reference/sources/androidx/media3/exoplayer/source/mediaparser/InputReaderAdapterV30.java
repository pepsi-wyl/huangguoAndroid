package androidx.media3.exoplayer.source.mediaparser;

import android.media.MediaParser;
import androidx.media3.common.DataReader;
import androidx.media3.common.util.Util;
import java.io.IOException;

/* loaded from: classes.dex */
public final class InputReaderAdapterV30 implements MediaParser.SeekableInputReader {
    private long currentPosition;
    private DataReader dataReader;
    private long lastSeekPosition;
    private long resourceLength;

    public void setDataReader(DataReader dataReader, long j) {
        this.dataReader = dataReader;
        this.resourceLength = j;
        this.lastSeekPosition = -1L;
    }

    public void setCurrentPosition(long j) {
        this.currentPosition = j;
    }

    public long getAndResetSeekPosition() {
        long j = this.lastSeekPosition;
        this.lastSeekPosition = -1L;
        return j;
    }

    @Override // android.media.MediaParser.SeekableInputReader
    public void seekToPosition(long j) {
        this.lastSeekPosition = j;
    }

    @Override // android.media.MediaParser.InputReader
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int i3 = ((DataReader) Util.castNonNull(this.dataReader)).read(bArr, i, i2);
        this.currentPosition += i3;
        return i3;
    }

    @Override // android.media.MediaParser.InputReader
    public long getPosition() {
        return this.currentPosition;
    }

    @Override // android.media.MediaParser.InputReader
    public long getLength() {
        return this.resourceLength;
    }
}
