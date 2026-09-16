package androidx.media3.exoplayer.mediacodec;

import android.media.MediaCodec;
import androidx.media3.common.util.Util;
import androidx.media3.decoder.DecoderException;

/* loaded from: classes.dex */
public class MediaCodecDecoderException extends DecoderException {
    public final MediaCodecInfo codecInfo;
    public final String diagnosticInfo;
    public final int errorCode;

    public MediaCodecDecoderException(Throwable th, MediaCodecInfo mediaCodecInfo) throws NumberFormatException {
        int errorCodeFromPlatformDiagnosticsInfo;
        StringBuilder sb = new StringBuilder("Decoder failed: ");
        sb.append(mediaCodecInfo == null ? null : mediaCodecInfo.name);
        super(sb.toString(), th);
        this.codecInfo = mediaCodecInfo;
        String diagnosticInfoV21 = Util.SDK_INT >= 21 ? getDiagnosticInfoV21(th) : null;
        this.diagnosticInfo = diagnosticInfoV21;
        if (Util.SDK_INT >= 23) {
            errorCodeFromPlatformDiagnosticsInfo = getErrorCodeV23(th);
        } else {
            errorCodeFromPlatformDiagnosticsInfo = Util.getErrorCodeFromPlatformDiagnosticsInfo(diagnosticInfoV21);
        }
        this.errorCode = errorCodeFromPlatformDiagnosticsInfo;
    }

    private static String getDiagnosticInfoV21(Throwable th) {
        if (th instanceof MediaCodec.CodecException) {
            return ((MediaCodec.CodecException) th).getDiagnosticInfo();
        }
        return null;
    }

    private static int getErrorCodeV23(Throwable th) {
        if (th instanceof MediaCodec.CodecException) {
            return ((MediaCodec.CodecException) th).getErrorCode();
        }
        return 0;
    }
}
