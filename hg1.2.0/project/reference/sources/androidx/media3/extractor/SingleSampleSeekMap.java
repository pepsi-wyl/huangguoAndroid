package androidx.media3.extractor;

import androidx.media3.extractor.SeekMap;

/* loaded from: classes.dex */
public final class SingleSampleSeekMap implements SeekMap {
    private final long durationUs;
    private final long startPosition;

    @Override // androidx.media3.extractor.SeekMap
    public boolean isSeekable() {
        return true;
    }

    public SingleSampleSeekMap(long j) {
        this(j, 0L);
    }

    public SingleSampleSeekMap(long j, long j2) {
        this.durationUs = j;
        this.startPosition = j2;
    }

    @Override // androidx.media3.extractor.SeekMap
    public long getDurationUs() {
        return this.durationUs;
    }

    @Override // androidx.media3.extractor.SeekMap
    public SeekMap.SeekPoints getSeekPoints(long j) {
        return new SeekMap.SeekPoints(new SeekPoint(j, this.startPosition));
    }
}
