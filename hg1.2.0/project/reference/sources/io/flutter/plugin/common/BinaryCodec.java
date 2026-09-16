package io.flutter.plugin.common;

import java.nio.ByteBuffer;

/* loaded from: classes2.dex */
public final class BinaryCodec implements MessageCodec<ByteBuffer> {
    public static final BinaryCodec INSTANCE = new BinaryCodec();
    public static final BinaryCodec INSTANCE_DIRECT = new BinaryCodec(true);
    private final boolean returnsDirectByteBufferFromDecoding;

    @Override // io.flutter.plugin.common.MessageCodec
    public ByteBuffer encodeMessage(ByteBuffer byteBuffer) {
        return byteBuffer;
    }

    private BinaryCodec() {
        this.returnsDirectByteBufferFromDecoding = false;
    }

    private BinaryCodec(boolean z) {
        this.returnsDirectByteBufferFromDecoding = z;
    }

    @Override // io.flutter.plugin.common.MessageCodec
    public ByteBuffer decodeMessage(ByteBuffer byteBuffer) {
        if (byteBuffer == null || this.returnsDirectByteBufferFromDecoding) {
            return byteBuffer;
        }
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(byteBuffer.capacity());
        byteBufferAllocate.put(byteBuffer);
        byteBufferAllocate.rewind();
        return byteBufferAllocate;
    }
}
