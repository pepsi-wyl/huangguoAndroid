package androidx.media3.extractor.text;

import androidx.media3.common.C;
import androidx.media3.common.text.Cue;
import com.google.common.collect.ImmutableList;
import java.util.Collection;
import java.util.List;

/* loaded from: classes.dex */
public class CuesWithTiming {
    public final ImmutableList<Cue> cues;
    public final long durationUs;
    public final long endTimeUs;
    public final long startTimeUs;

    public CuesWithTiming(List<Cue> list, long j, long j2) {
        this.cues = ImmutableList.copyOf((Collection) list);
        this.startTimeUs = j;
        this.durationUs = j2;
        long j3 = C.TIME_UNSET;
        if (j != C.TIME_UNSET && j2 != C.TIME_UNSET) {
            j3 = j + j2;
        }
        this.endTimeUs = j3;
    }
}
