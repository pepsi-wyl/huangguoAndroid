package androidx.media3.exoplayer.mediacodec;

import android.content.Context;
import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.os.Bundle;
import android.os.Handler;
import android.os.PersistableBundle;
import android.view.Surface;
import androidx.media3.common.Format;
import androidx.media3.decoder.CryptoInfo;
import java.io.IOException;
import java.nio.ByteBuffer;

/* loaded from: classes.dex */
public interface MediaCodecAdapter {

    /* renamed from: androidx.media3.exoplayer.mediacodec.MediaCodecAdapter$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static boolean $default$registerOnBufferAvailableListener(MediaCodecAdapter _this, OnBufferAvailableListener onBufferAvailableListener) {
            return false;
        }
    }

    public interface OnBufferAvailableListener {

        /* renamed from: androidx.media3.exoplayer.mediacodec.MediaCodecAdapter$OnBufferAvailableListener$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static void $default$onInputBufferAvailable(OnBufferAvailableListener _this) {
            }

            public static void $default$onOutputBufferAvailable(OnBufferAvailableListener _this) {
            }
        }

        void onInputBufferAvailable();

        void onOutputBufferAvailable();
    }

    public interface OnFrameRenderedListener {
        void onFrameRendered(MediaCodecAdapter mediaCodecAdapter, long j, long j2);
    }

    int dequeueInputBufferIndex();

    int dequeueOutputBufferIndex(MediaCodec.BufferInfo bufferInfo);

    void flush();

    ByteBuffer getInputBuffer(int i);

    PersistableBundle getMetrics();

    ByteBuffer getOutputBuffer(int i);

    MediaFormat getOutputFormat();

    boolean needsReconfiguration();

    void queueInputBuffer(int i, int i2, int i3, long j, int i4);

    void queueSecureInputBuffer(int i, int i2, CryptoInfo cryptoInfo, long j, int i3);

    boolean registerOnBufferAvailableListener(OnBufferAvailableListener onBufferAvailableListener);

    void release();

    void releaseOutputBuffer(int i, long j);

    void releaseOutputBuffer(int i, boolean z);

    void setOnFrameRenderedListener(OnFrameRenderedListener onFrameRenderedListener, Handler handler);

    void setOutputSurface(Surface surface);

    void setParameters(Bundle bundle);

    void setVideoScalingMode(int i);

    public static final class Configuration {
        public final MediaCodecInfo codecInfo;
        public final MediaCrypto crypto;
        public final int flags;
        public final Format format;
        public final MediaFormat mediaFormat;
        public final Surface surface;

        public static Configuration createForAudioDecoding(MediaCodecInfo mediaCodecInfo, MediaFormat mediaFormat, Format format, MediaCrypto mediaCrypto) {
            return new Configuration(mediaCodecInfo, mediaFormat, format, null, mediaCrypto, 0);
        }

        public static Configuration createForVideoDecoding(MediaCodecInfo mediaCodecInfo, MediaFormat mediaFormat, Format format, Surface surface, MediaCrypto mediaCrypto) {
            return new Configuration(mediaCodecInfo, mediaFormat, format, surface, mediaCrypto, 0);
        }

        private Configuration(MediaCodecInfo mediaCodecInfo, MediaFormat mediaFormat, Format format, Surface surface, MediaCrypto mediaCrypto, int i) {
            this.codecInfo = mediaCodecInfo;
            this.mediaFormat = mediaFormat;
            this.format = format;
            this.surface = surface;
            this.crypto = mediaCrypto;
            this.flags = i;
        }
    }

    public interface Factory {

        @Deprecated
        public static final Factory DEFAULT = new DefaultMediaCodecAdapterFactory();

        MediaCodecAdapter createAdapter(Configuration configuration) throws IOException;

        /* renamed from: androidx.media3.exoplayer.mediacodec.MediaCodecAdapter$Factory$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            static {
                Factory factory = Factory.DEFAULT;
            }

            public static Factory getDefault(Context context) {
                return new DefaultMediaCodecAdapterFactory(context);
            }
        }
    }
}
