package androidx.media3.exoplayer.text;

import androidx.media3.common.C;
import androidx.media3.common.text.Cue;
import androidx.media3.common.util.Assertions;
import androidx.media3.extractor.text.CuesWithTiming;
import com.google.common.base.Function;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Ordering;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
final class MergingCuesResolver implements CuesResolver {
    private static final Ordering<CuesWithTiming> CUES_DISPLAY_PRIORITY_COMPARATOR = Ordering.natural().onResultOf(new Function() { // from class: androidx.media3.exoplayer.text.MergingCuesResolver$$ExternalSyntheticLambda0
        @Override // com.google.common.base.Function
        public final Object apply(Object obj) {
            return Long.valueOf(((CuesWithTiming) obj).startTimeUs);
        }
    }).compound(Ordering.natural().reverse().onResultOf(new Function() { // from class: androidx.media3.exoplayer.text.MergingCuesResolver$$ExternalSyntheticLambda1
        @Override // com.google.common.base.Function
        public final Object apply(Object obj) {
            return Long.valueOf(((CuesWithTiming) obj).durationUs);
        }
    }));
    private final List<CuesWithTiming> cuesWithTimingList = new ArrayList();

    @Override // androidx.media3.exoplayer.text.CuesResolver
    public boolean addCues(CuesWithTiming cuesWithTiming, long j) {
        Assertions.checkArgument(cuesWithTiming.startTimeUs != C.TIME_UNSET);
        Assertions.checkArgument(cuesWithTiming.durationUs != C.TIME_UNSET);
        boolean z = cuesWithTiming.startTimeUs <= j && j < cuesWithTiming.endTimeUs;
        for (int size = this.cuesWithTimingList.size() - 1; size >= 0; size--) {
            if (cuesWithTiming.startTimeUs >= this.cuesWithTimingList.get(size).startTimeUs) {
                this.cuesWithTimingList.add(size + 1, cuesWithTiming);
                return z;
            }
        }
        this.cuesWithTimingList.add(0, cuesWithTiming);
        return z;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // androidx.media3.exoplayer.text.CuesResolver
    public ImmutableList<Cue> getCuesAtTimeUs(long j) {
        if (!this.cuesWithTimingList.isEmpty()) {
            if (j >= this.cuesWithTimingList.get(0).startTimeUs) {
                ArrayList arrayList = new ArrayList();
                for (int i = 0; i < this.cuesWithTimingList.size(); i++) {
                    CuesWithTiming cuesWithTiming = this.cuesWithTimingList.get(i);
                    if (j >= cuesWithTiming.startTimeUs && j < cuesWithTiming.endTimeUs) {
                        arrayList.add(cuesWithTiming);
                    }
                    if (j < cuesWithTiming.startTimeUs) {
                        break;
                    }
                }
                ImmutableList immutableListSortedCopyOf = ImmutableList.sortedCopyOf(CUES_DISPLAY_PRIORITY_COMPARATOR, arrayList);
                ImmutableList.Builder builder = ImmutableList.builder();
                for (int i2 = 0; i2 < immutableListSortedCopyOf.size(); i2++) {
                    builder.addAll((Iterable) ((CuesWithTiming) immutableListSortedCopyOf.get(i2)).cues);
                }
                return builder.build();
            }
        }
        return ImmutableList.of();
    }

    @Override // androidx.media3.exoplayer.text.CuesResolver
    public void discardCuesBeforeTimeUs(long j) {
        int i = 0;
        while (i < this.cuesWithTimingList.size()) {
            long j2 = this.cuesWithTimingList.get(i).startTimeUs;
            if (j > j2 && j > this.cuesWithTimingList.get(i).endTimeUs) {
                this.cuesWithTimingList.remove(i);
                i--;
            } else if (j < j2) {
                return;
            }
            i++;
        }
    }

    @Override // androidx.media3.exoplayer.text.CuesResolver
    public long getPreviousCueChangeTimeUs(long j) {
        if (this.cuesWithTimingList.isEmpty()) {
            return C.TIME_UNSET;
        }
        if (j < this.cuesWithTimingList.get(0).startTimeUs) {
            return C.TIME_UNSET;
        }
        long jMax = this.cuesWithTimingList.get(0).startTimeUs;
        for (int i = 0; i < this.cuesWithTimingList.size(); i++) {
            long j2 = this.cuesWithTimingList.get(i).startTimeUs;
            long j3 = this.cuesWithTimingList.get(i).endTimeUs;
            if (j3 <= j) {
                jMax = Math.max(jMax, j3);
            } else {
                if (j2 > j) {
                    break;
                }
                jMax = Math.max(jMax, j2);
            }
        }
        return jMax;
    }

    @Override // androidx.media3.exoplayer.text.CuesResolver
    public long getNextCueChangeTimeUs(long j) {
        int i = 0;
        long jMin = -9223372036854775807L;
        while (true) {
            if (i >= this.cuesWithTimingList.size()) {
                break;
            }
            long j2 = this.cuesWithTimingList.get(i).startTimeUs;
            long j3 = this.cuesWithTimingList.get(i).endTimeUs;
            if (j < j2) {
                jMin = jMin == C.TIME_UNSET ? j2 : Math.min(jMin, j2);
            } else {
                if (j < j3) {
                    jMin = jMin == C.TIME_UNSET ? j3 : Math.min(jMin, j3);
                }
                i++;
            }
        }
        if (jMin != C.TIME_UNSET) {
            return jMin;
        }
        return Long.MIN_VALUE;
    }

    @Override // androidx.media3.exoplayer.text.CuesResolver
    public void clear() {
        this.cuesWithTimingList.clear();
    }
}
