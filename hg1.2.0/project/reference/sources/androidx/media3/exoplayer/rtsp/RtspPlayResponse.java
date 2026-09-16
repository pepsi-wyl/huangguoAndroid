package androidx.media3.exoplayer.rtsp;

import com.google.common.collect.ImmutableList;
import java.util.Collection;
import java.util.List;

/* loaded from: classes.dex */
final class RtspPlayResponse {
    public final RtspSessionTiming sessionTiming;
    public final int status;
    public final ImmutableList<RtspTrackTiming> trackTimingList;

    public RtspPlayResponse(int i, RtspSessionTiming rtspSessionTiming, List<RtspTrackTiming> list) {
        this.status = i;
        this.sessionTiming = rtspSessionTiming;
        this.trackTimingList = ImmutableList.copyOf((Collection) list);
    }
}
