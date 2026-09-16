package androidx.media3.exoplayer.mediacodec;

import android.media.MediaCodec;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.HandlerThread;
import androidx.collection.CircularIntArray;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.mediacodec.MediaCodecAdapter;
import java.util.ArrayDeque;

/* loaded from: classes.dex */
final class AsynchronousMediaCodecCallback extends MediaCodec.Callback {
    private final HandlerThread callbackThread;
    private MediaFormat currentFormat;
    private Handler handler;
    private IllegalStateException internalException;
    private MediaCodec.CryptoException mediaCodecCryptoException;
    private MediaCodec.CodecException mediaCodecException;
    private MediaCodecAdapter.OnBufferAvailableListener onBufferAvailableListener;
    private long pendingFlushCount;
    private MediaFormat pendingOutputFormat;
    private boolean shutDown;
    private final Object lock = new Object();
    private final CircularIntArray availableInputBuffers = new CircularIntArray();
    private final CircularIntArray availableOutputBuffers = new CircularIntArray();
    private final ArrayDeque<MediaCodec.BufferInfo> bufferInfos = new ArrayDeque<>();
    private final ArrayDeque<MediaFormat> formats = new ArrayDeque<>();

    AsynchronousMediaCodecCallback(HandlerThread handlerThread) {
        this.callbackThread = handlerThread;
    }

    public void initialize(MediaCodec mediaCodec) {
        Assertions.checkState(this.handler == null);
        this.callbackThread.start();
        Handler handler = new Handler(this.callbackThread.getLooper());
        mediaCodec.setCallback(this, handler);
        this.handler = handler;
    }

    public void shutdown() {
        synchronized (this.lock) {
            this.shutDown = true;
            this.callbackThread.quit();
            flushInternal();
        }
    }

    public int dequeueInputBufferIndex() {
        synchronized (this.lock) {
            maybeThrowException();
            int iPopFirst = -1;
            if (isFlushingOrShutdown()) {
                return -1;
            }
            if (!this.availableInputBuffers.isEmpty()) {
                iPopFirst = this.availableInputBuffers.popFirst();
            }
            return iPopFirst;
        }
    }

    public int dequeueOutputBufferIndex(MediaCodec.BufferInfo bufferInfo) {
        synchronized (this.lock) {
            maybeThrowException();
            if (isFlushingOrShutdown()) {
                return -1;
            }
            if (this.availableOutputBuffers.isEmpty()) {
                return -1;
            }
            int iPopFirst = this.availableOutputBuffers.popFirst();
            if (iPopFirst >= 0) {
                Assertions.checkStateNotNull(this.currentFormat);
                MediaCodec.BufferInfo bufferInfoRemove = this.bufferInfos.remove();
                bufferInfo.set(bufferInfoRemove.offset, bufferInfoRemove.size, bufferInfoRemove.presentationTimeUs, bufferInfoRemove.flags);
            } else if (iPopFirst == -2) {
                this.currentFormat = this.formats.remove();
            }
            return iPopFirst;
        }
    }

    public MediaFormat getOutputFormat() {
        MediaFormat mediaFormat;
        synchronized (this.lock) {
            mediaFormat = this.currentFormat;
            if (mediaFormat == null) {
                throw new IllegalStateException();
            }
        }
        return mediaFormat;
    }

    public void flush() {
        synchronized (this.lock) {
            this.pendingFlushCount++;
            ((Handler) Util.castNonNull(this.handler)).post(new Runnable() { // from class: androidx.media3.exoplayer.mediacodec.AsynchronousMediaCodecCallback$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.onFlushCompleted();
                }
            });
        }
    }

    @Override // android.media.MediaCodec.Callback
    public void onInputBufferAvailable(MediaCodec mediaCodec, int i) {
        synchronized (this.lock) {
            this.availableInputBuffers.addLast(i);
            MediaCodecAdapter.OnBufferAvailableListener onBufferAvailableListener = this.onBufferAvailableListener;
            if (onBufferAvailableListener != null) {
                onBufferAvailableListener.onInputBufferAvailable();
            }
        }
    }

    @Override // android.media.MediaCodec.Callback
    public void onOutputBufferAvailable(MediaCodec mediaCodec, int i, MediaCodec.BufferInfo bufferInfo) {
        synchronized (this.lock) {
            MediaFormat mediaFormat = this.pendingOutputFormat;
            if (mediaFormat != null) {
                addOutputFormat(mediaFormat);
                this.pendingOutputFormat = null;
            }
            this.availableOutputBuffers.addLast(i);
            this.bufferInfos.add(bufferInfo);
            MediaCodecAdapter.OnBufferAvailableListener onBufferAvailableListener = this.onBufferAvailableListener;
            if (onBufferAvailableListener != null) {
                onBufferAvailableListener.onOutputBufferAvailable();
            }
        }
    }

    @Override // android.media.MediaCodec.Callback
    public void onError(MediaCodec mediaCodec, MediaCodec.CodecException codecException) {
        synchronized (this.lock) {
            this.mediaCodecException = codecException;
        }
    }

    @Override // android.media.MediaCodec.Callback
    public void onCryptoError(MediaCodec mediaCodec, MediaCodec.CryptoException cryptoException) {
        synchronized (this.lock) {
            this.mediaCodecCryptoException = cryptoException;
        }
    }

    @Override // android.media.MediaCodec.Callback
    public void onOutputFormatChanged(MediaCodec mediaCodec, MediaFormat mediaFormat) {
        synchronized (this.lock) {
            addOutputFormat(mediaFormat);
            this.pendingOutputFormat = null;
        }
    }

    public void setOnBufferAvailableListener(MediaCodecAdapter.OnBufferAvailableListener onBufferAvailableListener) {
        synchronized (this.lock) {
            this.onBufferAvailableListener = onBufferAvailableListener;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onFlushCompleted() {
        synchronized (this.lock) {
            if (this.shutDown) {
                return;
            }
            long j = this.pendingFlushCount - 1;
            this.pendingFlushCount = j;
            if (j > 0) {
                return;
            }
            if (j < 0) {
                setInternalException(new IllegalStateException());
            } else {
                flushInternal();
            }
        }
    }

    private void flushInternal() {
        if (!this.formats.isEmpty()) {
            this.pendingOutputFormat = this.formats.getLast();
        }
        this.availableInputBuffers.clear();
        this.availableOutputBuffers.clear();
        this.bufferInfos.clear();
        this.formats.clear();
    }

    private boolean isFlushingOrShutdown() {
        return this.pendingFlushCount > 0 || this.shutDown;
    }

    private void addOutputFormat(MediaFormat mediaFormat) {
        this.availableOutputBuffers.addLast(-2);
        this.formats.add(mediaFormat);
    }

    private void maybeThrowException() {
        maybeThrowInternalException();
        maybeThrowMediaCodecException();
        maybeThrowMediaCodecCryptoException();
    }

    private void maybeThrowInternalException() {
        IllegalStateException illegalStateException = this.internalException;
        if (illegalStateException == null) {
            return;
        }
        this.internalException = null;
        throw illegalStateException;
    }

    private void maybeThrowMediaCodecException() {
        MediaCodec.CodecException codecException = this.mediaCodecException;
        if (codecException == null) {
            return;
        }
        this.mediaCodecException = null;
        throw codecException;
    }

    private void maybeThrowMediaCodecCryptoException() {
        MediaCodec.CryptoException cryptoException = this.mediaCodecCryptoException;
        if (cryptoException == null) {
            return;
        }
        this.mediaCodecCryptoException = null;
        throw cryptoException;
    }

    private void setInternalException(IllegalStateException illegalStateException) {
        synchronized (this.lock) {
            this.internalException = illegalStateException;
        }
    }
}
