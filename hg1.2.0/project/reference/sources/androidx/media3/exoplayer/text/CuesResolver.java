package androidx.media3.exoplayer.text;

import androidx.media3.common.text.Cue;
import androidx.media3.extractor.text.CuesWithTiming;
import com.google.common.collect.ImmutableList;

/* loaded from: classes.dex */
interface CuesResolver {
    boolean addCues(CuesWithTiming cuesWithTiming, long j);

    void clear();

    void discardCuesBeforeTimeUs(long j);

    ImmutableList<Cue> getCuesAtTimeUs(long j);

    long getNextCueChangeTimeUs(long j);

    long getPreviousCueChangeTimeUs(long j);
}
