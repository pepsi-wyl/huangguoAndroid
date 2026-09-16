package androidx.media3.extractor;

import androidx.media3.common.MimeTypes;
import tv.danmaku.ijk.media.player.IjkMediaMeta;

/* loaded from: classes.dex */
public final class MpegAudioUtil {
    public static final int MAX_FRAME_SIZE_BYTES = 4096;
    private static final int SAMPLES_PER_FRAME_L1 = 384;
    private static final int SAMPLES_PER_FRAME_L2 = 1152;
    private static final int SAMPLES_PER_FRAME_L3_V1 = 1152;
    private static final int SAMPLES_PER_FRAME_L3_V2 = 576;
    private static final String[] MIME_TYPE_BY_LAYER = {MimeTypes.AUDIO_MPEG_L1, MimeTypes.AUDIO_MPEG_L2, MimeTypes.AUDIO_MPEG};
    private static final int[] SAMPLING_RATE_V1 = {44100, OpusUtil.SAMPLE_RATE, 32000};
    private static final int[] BITRATE_V1_L1 = {32000, 64000, 96000, 128000, 160000, DtsUtil.DTS_MAX_RATE_BYTES_PER_SECOND, 224000, AacUtil.AAC_XHE_MAX_RATE_BYTES_PER_SECOND, 288000, 320000, 352000, 384000, 416000, 448000};
    private static final int[] BITRATE_V2_L1 = {32000, OpusUtil.SAMPLE_RATE, 56000, 64000, Ac3Util.AC3_MAX_RATE_BYTES_PER_SECOND, 96000, 112000, 128000, 144000, 160000, 176000, DtsUtil.DTS_MAX_RATE_BYTES_PER_SECOND, 224000, AacUtil.AAC_XHE_MAX_RATE_BYTES_PER_SECOND};
    private static final int[] BITRATE_V1_L2 = {32000, OpusUtil.SAMPLE_RATE, 56000, 64000, Ac3Util.AC3_MAX_RATE_BYTES_PER_SECOND, 96000, 112000, 128000, 160000, DtsUtil.DTS_MAX_RATE_BYTES_PER_SECOND, 224000, AacUtil.AAC_XHE_MAX_RATE_BYTES_PER_SECOND, 320000, 384000};
    public static final int MAX_RATE_BYTES_PER_SECOND = 40000;
    private static final int[] BITRATE_V1_L3 = {32000, MAX_RATE_BYTES_PER_SECOND, OpusUtil.SAMPLE_RATE, 56000, 64000, Ac3Util.AC3_MAX_RATE_BYTES_PER_SECOND, 96000, 112000, 128000, 160000, DtsUtil.DTS_MAX_RATE_BYTES_PER_SECOND, 224000, AacUtil.AAC_XHE_MAX_RATE_BYTES_PER_SECOND, 320000};
    private static final int[] BITRATE_V2 = {8000, AacUtil.AAC_HE_V1_MAX_RATE_BYTES_PER_SECOND, 24000, 32000, MAX_RATE_BYTES_PER_SECOND, OpusUtil.SAMPLE_RATE, 56000, 64000, Ac3Util.AC3_MAX_RATE_BYTES_PER_SECOND, 96000, 112000, 128000, 144000, 160000};

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean isMagicPresent(int i) {
        return (i & (-2097152)) == -2097152;
    }

    public static final class Header {
        public int bitrate;
        public int channels;
        public int frameSize;
        public String mimeType;
        public int sampleRate;
        public int samplesPerFrame;
        public int version;

        public Header() {
        }

        public Header(Header header) {
            this.version = header.version;
            this.mimeType = header.mimeType;
            this.frameSize = header.frameSize;
            this.sampleRate = header.sampleRate;
            this.channels = header.channels;
            this.bitrate = header.bitrate;
            this.samplesPerFrame = header.samplesPerFrame;
        }

        public boolean setForHeaderData(int i) {
            int i2;
            int i3;
            int i4;
            int i5;
            if (!MpegAudioUtil.isMagicPresent(i) || (i2 = (i >>> 19) & 3) == 1 || (i3 = (i >>> 17) & 3) == 0 || (i4 = (i >>> 12) & 15) == 0 || i4 == 15 || (i5 = (i >>> 10) & 3) == 3) {
                return false;
            }
            this.version = i2;
            this.mimeType = MpegAudioUtil.MIME_TYPE_BY_LAYER[3 - i3];
            int i6 = MpegAudioUtil.SAMPLING_RATE_V1[i5];
            this.sampleRate = i6;
            if (i2 == 2) {
                this.sampleRate = i6 / 2;
            } else if (i2 == 0) {
                this.sampleRate = i6 / 4;
            }
            int i7 = (i >>> 9) & 1;
            this.samplesPerFrame = MpegAudioUtil.getFrameSizeInSamples(i2, i3);
            if (i3 == 3) {
                int i8 = i2 == 3 ? MpegAudioUtil.BITRATE_V1_L1[i4 - 1] : MpegAudioUtil.BITRATE_V2_L1[i4 - 1];
                this.bitrate = i8;
                this.frameSize = (((i8 * 12) / this.sampleRate) + i7) * 4;
            } else {
                int i9 = IjkMediaMeta.FF_PROFILE_H264_HIGH_444;
                if (i2 == 3) {
                    int i10 = i3 == 2 ? MpegAudioUtil.BITRATE_V1_L2[i4 - 1] : MpegAudioUtil.BITRATE_V1_L3[i4 - 1];
                    this.bitrate = i10;
                    this.frameSize = ((i10 * IjkMediaMeta.FF_PROFILE_H264_HIGH_444) / this.sampleRate) + i7;
                } else {
                    int i11 = MpegAudioUtil.BITRATE_V2[i4 - 1];
                    this.bitrate = i11;
                    if (i3 == 1) {
                        i9 = 72;
                    }
                    this.frameSize = ((i9 * i11) / this.sampleRate) + i7;
                }
            }
            this.channels = ((i >> 6) & 3) == 3 ? 1 : 2;
            return true;
        }
    }

    public static int getFrameSize(int i) {
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        if (!isMagicPresent(i) || (i2 = (i >>> 19) & 3) == 1 || (i3 = (i >>> 17) & 3) == 0 || (i4 = (i >>> 12) & 15) == 0 || i4 == 15 || (i5 = (i >>> 10) & 3) == 3) {
            return -1;
        }
        int i7 = SAMPLING_RATE_V1[i5];
        if (i2 == 2) {
            i7 /= 2;
        } else if (i2 == 0) {
            i7 /= 4;
        }
        int i8 = (i >>> 9) & 1;
        if (i3 == 3) {
            return ((((i2 == 3 ? BITRATE_V1_L1[i4 - 1] : BITRATE_V2_L1[i4 - 1]) * 12) / i7) + i8) * 4;
        }
        if (i2 == 3) {
            i6 = i3 == 2 ? BITRATE_V1_L2[i4 - 1] : BITRATE_V1_L3[i4 - 1];
        } else {
            i6 = BITRATE_V2[i4 - 1];
        }
        int i9 = IjkMediaMeta.FF_PROFILE_H264_HIGH_444;
        if (i2 == 3) {
            return ((i6 * IjkMediaMeta.FF_PROFILE_H264_HIGH_444) / i7) + i8;
        }
        if (i3 == 1) {
            i9 = 72;
        }
        return ((i9 * i6) / i7) + i8;
    }

    public static int parseMpegAudioFrameSampleCount(int i) {
        int i2;
        int i3;
        if (!isMagicPresent(i) || (i2 = (i >>> 19) & 3) == 1 || (i3 = (i >>> 17) & 3) == 0) {
            return -1;
        }
        int i4 = (i >>> 12) & 15;
        int i5 = (i >>> 10) & 3;
        if (i4 == 0 || i4 == 15 || i5 == 3) {
            return -1;
        }
        return getFrameSizeInSamples(i2, i3);
    }

    private MpegAudioUtil() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int getFrameSizeInSamples(int i, int i2) {
        if (i2 == 1) {
            if (i == 3) {
                return 1152;
            }
            return SAMPLES_PER_FRAME_L3_V2;
        }
        if (i2 == 2) {
            return 1152;
        }
        if (i2 == 3) {
            return 384;
        }
        throw new IllegalArgumentException();
    }
}
