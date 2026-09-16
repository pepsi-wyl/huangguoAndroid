package androidx.media3.exoplayer;

import androidx.media3.common.Format;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/* loaded from: classes.dex */
public interface RendererCapabilities {
    public static final int ADAPTIVE_NOT_SEAMLESS = 8;
    public static final int ADAPTIVE_NOT_SUPPORTED = 0;
    public static final int ADAPTIVE_SEAMLESS = 16;
    public static final int ADAPTIVE_SUPPORT_MASK = 24;
    public static final int AUDIO_OFFLOAD_GAPLESS_SUPPORTED = 1024;
    public static final int AUDIO_OFFLOAD_NOT_SUPPORTED = 0;
    public static final int AUDIO_OFFLOAD_SPEED_CHANGE_SUPPORTED = 2048;
    public static final int AUDIO_OFFLOAD_SUPPORTED = 512;
    public static final int AUDIO_OFFLOAD_SUPPORT_MASK = 3584;
    public static final int DECODER_SUPPORT_FALLBACK = 0;
    public static final int DECODER_SUPPORT_FALLBACK_MIMETYPE = 256;
    public static final int DECODER_SUPPORT_MASK = 384;
    public static final int DECODER_SUPPORT_PRIMARY = 128;
    public static final int FORMAT_SUPPORT_MASK = 7;
    public static final int HARDWARE_ACCELERATION_NOT_SUPPORTED = 0;
    public static final int HARDWARE_ACCELERATION_SUPPORTED = 64;
    public static final int HARDWARE_ACCELERATION_SUPPORT_MASK = 64;
    public static final int TUNNELING_NOT_SUPPORTED = 0;
    public static final int TUNNELING_SUPPORTED = 32;
    public static final int TUNNELING_SUPPORT_MASK = 32;

    @Target({ElementType.TYPE_USE})
    @Documented
    @Retention(RetentionPolicy.SOURCE)
    public @interface AdaptiveSupport {
    }

    @Target({ElementType.TYPE_USE})
    @Documented
    @Retention(RetentionPolicy.SOURCE)
    public @interface AudioOffloadSupport {
    }

    @Target({ElementType.TYPE_USE})
    @Documented
    @Retention(RetentionPolicy.SOURCE)
    public @interface Capabilities {
    }

    @Target({ElementType.TYPE_USE})
    @Documented
    @Retention(RetentionPolicy.SOURCE)
    public @interface DecoderSupport {
    }

    @Target({ElementType.TYPE_USE})
    @Documented
    @Retention(RetentionPolicy.SOURCE)
    public @interface HardwareAccelerationSupport {
    }

    public interface Listener {
        void onRendererCapabilitiesChanged(Renderer renderer);
    }

    @Target({ElementType.TYPE_USE})
    @Documented
    @Retention(RetentionPolicy.SOURCE)
    public @interface TunnelingSupport {
    }

    void clearListener();

    String getName();

    int getTrackType();

    void setListener(Listener listener);

    int supportsFormat(Format format) throws ExoPlaybackException;

    int supportsMixedMimeTypeAdaptation() throws ExoPlaybackException;

    /* renamed from: androidx.media3.exoplayer.RendererCapabilities$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static void $default$clearListener(RendererCapabilities _this) {
        }

        public static void $default$setListener(RendererCapabilities _this, Listener listener) {
        }

        public static int create(int i, int i2, int i3, int i4, int i5, int i6) {
            return i | i2 | i3 | i4 | i5 | i6;
        }

        public static int getAdaptiveSupport(int i) {
            return i & 24;
        }

        public static int getAudioOffloadSupport(int i) {
            return i & RendererCapabilities.AUDIO_OFFLOAD_SUPPORT_MASK;
        }

        public static int getDecoderSupport(int i) {
            return i & RendererCapabilities.DECODER_SUPPORT_MASK;
        }

        public static int getFormatSupport(int i) {
            return i & 7;
        }

        public static int getHardwareAccelerationSupport(int i) {
            return i & 64;
        }

        public static int getTunnelingSupport(int i) {
            return i & 32;
        }

        public static int create(int i) {
            return create(i, 0, 0, 0);
        }

        public static int create(int i, int i2, int i3) {
            return create(i, i2, i3, 0, 128, 0);
        }

        public static int create(int i, int i2, int i3, int i4) {
            return create(i, i2, i3, 0, 128, i4);
        }

        public static int create(int i, int i2, int i3, int i4, int i5) {
            return create(i, i2, i3, i4, i5, 0);
        }

        public static boolean isFormatSupported(int i, boolean z) {
            int formatSupport = getFormatSupport(i);
            return formatSupport == 4 || (z && formatSupport == 3);
        }
    }
}
