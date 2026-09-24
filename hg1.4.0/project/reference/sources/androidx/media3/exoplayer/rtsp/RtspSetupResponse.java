package androidx.media3.exoplayer.rtsp;

import androidx.media3.exoplayer.rtsp.RtspMessageUtil;

/* loaded from: classes.dex */
final class RtspSetupResponse {
    public final RtspMessageUtil.RtspSessionHeader sessionHeader;
    public final int status;
    public final String transport;

    public RtspSetupResponse(int i, RtspMessageUtil.RtspSessionHeader rtspSessionHeader, String str) {
        this.status = i;
        this.sessionHeader = rtspSessionHeader;
        this.transport = str;
    }
}
