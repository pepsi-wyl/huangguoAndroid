package androidx.media3.decoder;

import androidx.media3.common.util.Assertions;
import androidx.media3.decoder.DecoderOutputBuffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: classes.dex */
public class SimpleDecoderOutputBuffer extends DecoderOutputBuffer {
    public ByteBuffer data;
    private final DecoderOutputBuffer.Owner<SimpleDecoderOutputBuffer> owner;

    public SimpleDecoderOutputBuffer(DecoderOutputBuffer.Owner<SimpleDecoderOutputBuffer> owner) {
        this.owner = owner;
    }

    public ByteBuffer init(long j, int i) {
        this.timeUs = j;
        ByteBuffer byteBuffer = this.data;
        if (byteBuffer == null || byteBuffer.capacity() < i) {
            this.data = ByteBuffer.allocateDirect(i).order(ByteOrder.nativeOrder());
        }
        this.data.position(0);
        this.data.limit(i);
        return this.data;
    }

    public ByteBuffer grow(int i) {
        ByteBuffer byteBuffer = (ByteBuffer) Assertions.checkNotNull(this.data);
        Assertions.checkArgument(i >= byteBuffer.limit());
        ByteBuffer byteBufferOrder = ByteBuffer.allocateDirect(i).order(ByteOrder.nativeOrder());
        int iPosition = byteBuffer.position();
        byteBuffer.position(0);
        byteBufferOrder.put(byteBuffer);
        byteBufferOrder.position(iPosition);
        byteBufferOrder.limit(i);
        this.data = byteBufferOrder;
        return byteBufferOrder;
    }

    @Override // androidx.media3.decoder.DecoderOutputBuffer, androidx.media3.decoder.Buffer
    public void clear() {
        super.clear();
        ByteBuffer byteBuffer = this.data;
        if (byteBuffer != null) {
            byteBuffer.clear();
        }
    }

    @Override // androidx.media3.decoder.DecoderOutputBuffer
    public void release() {
        this.owner.releaseOutputBuffer(this);
    }
}
