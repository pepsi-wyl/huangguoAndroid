package androidx.media3.exoplayer.mediacodec;

import android.os.Bundle;
import androidx.media3.decoder.CryptoInfo;

/* loaded from: classes.dex */
interface MediaCodecBufferEnqueuer {
    void flush();

    void maybeThrowException();

    void queueInputBuffer(int i, int i2, int i3, long j, int i4);

    void queueSecureInputBuffer(int i, int i2, CryptoInfo cryptoInfo, long j, int i3);

    void setParameters(Bundle bundle);

    void shutdown();

    void start();

    void waitUntilQueueingComplete() throws InterruptedException;
}
