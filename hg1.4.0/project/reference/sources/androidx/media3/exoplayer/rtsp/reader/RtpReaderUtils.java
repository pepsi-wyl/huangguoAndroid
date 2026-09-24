package androidx.media3.exoplayer.rtsp.reader;

import androidx.media3.common.util.Util;

/* loaded from: classes.dex */
class RtpReaderUtils {
    public static long toSampleTimeUs(long j, long j2, long j3, int i) {
        return j + Util.scaleLargeTimestamp(j2 - j3, 1000000L, i);
    }

    private RtpReaderUtils() {
    }
}
