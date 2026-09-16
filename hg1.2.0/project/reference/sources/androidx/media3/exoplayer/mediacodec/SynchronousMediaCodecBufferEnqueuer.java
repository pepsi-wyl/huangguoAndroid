package androidx.media3.exoplayer.mediacodec;

import android.media.MediaCodec;
import android.os.Bundle;
import androidx.media3.decoder.CryptoInfo;

/* loaded from: classes.dex */
class SynchronousMediaCodecBufferEnqueuer implements MediaCodecBufferEnqueuer {
    private final MediaCodec codec;

    @Override // androidx.media3.exoplayer.mediacodec.MediaCodecBufferEnqueuer
    public void flush() {
    }

    @Override // androidx.media3.exoplayer.mediacodec.MediaCodecBufferEnqueuer
    public void maybeThrowException() {
    }

    @Override // androidx.media3.exoplayer.mediacodec.MediaCodecBufferEnqueuer
    public void shutdown() {
    }

    @Override // androidx.media3.exoplayer.mediacodec.MediaCodecBufferEnqueuer
    public void start() {
    }

    @Override // androidx.media3.exoplayer.mediacodec.MediaCodecBufferEnqueuer
    public void waitUntilQueueingComplete() {
    }

    public SynchronousMediaCodecBufferEnqueuer(MediaCodec mediaCodec) {
        this.codec = mediaCodec;
    }

    @Override // androidx.media3.exoplayer.mediacodec.MediaCodecBufferEnqueuer
    public void queueInputBuffer(int i, int i2, int i3, long j, int i4) throws MediaCodec.CryptoException {
        this.codec.queueInputBuffer(i, i2, i3, j, i4);
    }

    @Override // androidx.media3.exoplayer.mediacodec.MediaCodecBufferEnqueuer
    public void queueSecureInputBuffer(int i, int i2, CryptoInfo cryptoInfo, long j, int i3) throws MediaCodec.CryptoException {
        this.codec.queueSecureInputBuffer(i, i2, cryptoInfo.getFrameworkCryptoInfo(), j, i3);
    }

    @Override // androidx.media3.exoplayer.mediacodec.MediaCodecBufferEnqueuer
    public void setParameters(Bundle bundle) {
        this.codec.setParameters(bundle);
    }
}
