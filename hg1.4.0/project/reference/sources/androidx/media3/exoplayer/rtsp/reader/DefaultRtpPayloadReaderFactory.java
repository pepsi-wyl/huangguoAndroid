package androidx.media3.exoplayer.rtsp.reader;

import androidx.media3.common.util.Assertions;
import androidx.media3.exoplayer.rtsp.RtpPayloadFormat;
import androidx.media3.exoplayer.rtsp.reader.RtpPayloadReader;

/* loaded from: classes.dex */
public final class DefaultRtpPayloadReaderFactory implements RtpPayloadReader.Factory {
    @Override // androidx.media3.exoplayer.rtsp.reader.RtpPayloadReader.Factory
    public RtpPayloadReader createPayloadReader(RtpPayloadFormat rtpPayloadFormat) {
        String str = (String) Assertions.checkNotNull(rtpPayloadFormat.format.sampleMimeType);
        str.hashCode();
        switch (str) {
            case "video/3gpp":
                return new RtpH263Reader(rtpPayloadFormat);
            case "video/hevc":
                return new RtpH265Reader(rtpPayloadFormat);
            case "audio/amr-wb":
            case "audio/3gpp":
                return new RtpAmrReader(rtpPayloadFormat);
            case "audio/mp4a-latm":
                if (rtpPayloadFormat.mediaEncoding.equals(RtpPayloadFormat.RTP_MEDIA_MPEG4_LATM_AUDIO)) {
                    return new RtpMp4aReader(rtpPayloadFormat);
                }
                return new RtpAacReader(rtpPayloadFormat);
            case "audio/ac3":
                return new RtpAc3Reader(rtpPayloadFormat);
            case "audio/raw":
            case "audio/g711-alaw":
            case "audio/g711-mlaw":
                return new RtpPcmReader(rtpPayloadFormat);
            case "video/mp4v-es":
                return new RtpMpeg4Reader(rtpPayloadFormat);
            case "video/avc":
                return new RtpH264Reader(rtpPayloadFormat);
            case "audio/opus":
                return new RtpOpusReader(rtpPayloadFormat);
            case "video/x-vnd.on2.vp8":
                return new RtpVp8Reader(rtpPayloadFormat);
            case "video/x-vnd.on2.vp9":
                return new RtpVp9Reader(rtpPayloadFormat);
            default:
                return null;
        }
    }
}
