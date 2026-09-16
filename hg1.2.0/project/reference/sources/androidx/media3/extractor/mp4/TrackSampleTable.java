package androidx.media3.extractor.mp4;

import androidx.media3.common.C;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;

/* loaded from: classes.dex */
final class TrackSampleTable {
    public final long durationUs;
    public final int[] flags;
    public final int maximumSize;
    public final long[] offsets;
    public final int sampleCount;
    public final int[] sizes;
    public final long[] timestampsUs;
    public final Track track;

    public TrackSampleTable(Track track, long[] jArr, int[] iArr, int i, long[] jArr2, int[] iArr2, long j) {
        Assertions.checkArgument(iArr.length == jArr2.length);
        Assertions.checkArgument(jArr.length == jArr2.length);
        Assertions.checkArgument(iArr2.length == jArr2.length);
        this.track = track;
        this.offsets = jArr;
        this.sizes = iArr;
        this.maximumSize = i;
        this.timestampsUs = jArr2;
        this.flags = iArr2;
        this.durationUs = j;
        this.sampleCount = jArr.length;
        if (iArr2.length > 0) {
            int length = iArr2.length - 1;
            iArr2[length] = iArr2[length] | C.BUFFER_FLAG_LAST_SAMPLE;
        }
    }

    public int getIndexOfEarlierOrEqualSynchronizationSample(long j) {
        for (int iBinarySearchFloor = Util.binarySearchFloor(this.timestampsUs, j, true, false); iBinarySearchFloor >= 0; iBinarySearchFloor--) {
            if ((this.flags[iBinarySearchFloor] & 1) != 0) {
                return iBinarySearchFloor;
            }
        }
        return -1;
    }

    public int getIndexOfLaterOrEqualSynchronizationSample(long j) {
        for (int iBinarySearchCeil = Util.binarySearchCeil(this.timestampsUs, j, true, false); iBinarySearchCeil < this.timestampsUs.length; iBinarySearchCeil++) {
            if ((this.flags[iBinarySearchCeil] & 1) != 0) {
                return iBinarySearchCeil;
            }
        }
        return -1;
    }
}
