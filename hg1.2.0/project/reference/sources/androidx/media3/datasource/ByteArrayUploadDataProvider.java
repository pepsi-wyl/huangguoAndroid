package androidx.media3.datasource;

import android.net.http.UploadDataProvider;
import android.net.http.UploadDataSink;
import java.io.IOException;
import java.nio.ByteBuffer;

/* loaded from: classes.dex */
final class ByteArrayUploadDataProvider extends UploadDataProvider {
    private final byte[] data;
    private int position;

    public ByteArrayUploadDataProvider(byte[] bArr) {
        this.data = bArr;
    }

    @Override // android.net.http.UploadDataProvider
    public long getLength() {
        return this.data.length;
    }

    @Override // android.net.http.UploadDataProvider
    public void read(UploadDataSink uploadDataSink, ByteBuffer byteBuffer) throws IOException {
        int iMin = Math.min(byteBuffer.remaining(), this.data.length - this.position);
        byteBuffer.put(this.data, this.position, iMin);
        this.position += iMin;
        uploadDataSink.onReadSucceeded(false);
    }

    @Override // android.net.http.UploadDataProvider
    public void rewind(UploadDataSink uploadDataSink) throws IOException {
        this.position = 0;
        uploadDataSink.onRewindSucceeded();
    }
}
