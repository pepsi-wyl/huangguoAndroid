package androidx.media3.exoplayer.dash.manifest;

import androidx.media3.common.C;
import androidx.media3.common.util.Util;
import com.google.common.math.BigIntegerMath;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.util.List;

/* loaded from: classes.dex */
public abstract class SegmentBase {
    final RangedUri initialization;
    final long presentationTimeOffset;
    final long timescale;

    public SegmentBase(RangedUri rangedUri, long j, long j2) {
        this.initialization = rangedUri;
        this.timescale = j;
        this.presentationTimeOffset = j2;
    }

    public RangedUri getInitialization(Representation representation) {
        return this.initialization;
    }

    public long getPresentationTimeOffsetUs() {
        return Util.scaleLargeTimestamp(this.presentationTimeOffset, 1000000L, this.timescale);
    }

    public static class SingleSegmentBase extends SegmentBase {
        final long indexLength;
        final long indexStart;

        public SingleSegmentBase(RangedUri rangedUri, long j, long j2, long j3, long j4) {
            super(rangedUri, j, j2);
            this.indexStart = j3;
            this.indexLength = j4;
        }

        public SingleSegmentBase() {
            this(null, 1L, 0L, 0L, 0L);
        }

        public RangedUri getIndex() {
            long j = this.indexLength;
            if (j <= 0) {
                return null;
            }
            return new RangedUri(null, this.indexStart, j);
        }
    }

    public static abstract class MultiSegmentBase extends SegmentBase {
        final long availabilityTimeOffsetUs;
        final long duration;
        private final long periodStartUnixTimeUs;
        final List<SegmentTimelineElement> segmentTimeline;
        final long startNumber;
        private final long timeShiftBufferDepthUs;

        public abstract long getSegmentCount(long j);

        public abstract RangedUri getSegmentUrl(Representation representation, long j);

        public MultiSegmentBase(RangedUri rangedUri, long j, long j2, long j3, long j4, List<SegmentTimelineElement> list, long j5, long j6, long j7) {
            super(rangedUri, j, j2);
            this.startNumber = j3;
            this.duration = j4;
            this.segmentTimeline = list;
            this.availabilityTimeOffsetUs = j5;
            this.timeShiftBufferDepthUs = j6;
            this.periodStartUnixTimeUs = j7;
        }

        public long getSegmentNum(long j, long j2) {
            long firstSegmentNum = getFirstSegmentNum();
            long segmentCount = getSegmentCount(j2);
            if (segmentCount == 0) {
                return firstSegmentNum;
            }
            if (this.segmentTimeline == null) {
                long j3 = this.startNumber + (j / ((this.duration * 1000000) / this.timescale));
                return j3 < firstSegmentNum ? firstSegmentNum : segmentCount == -1 ? j3 : Math.min(j3, (firstSegmentNum + segmentCount) - 1);
            }
            long j4 = (segmentCount + firstSegmentNum) - 1;
            long j5 = firstSegmentNum;
            while (j5 <= j4) {
                long j6 = ((j4 - j5) / 2) + j5;
                long segmentTimeUs = getSegmentTimeUs(j6);
                if (segmentTimeUs < j) {
                    j5 = j6 + 1;
                } else {
                    if (segmentTimeUs <= j) {
                        return j6;
                    }
                    j4 = j6 - 1;
                }
            }
            return j5 == firstSegmentNum ? j5 : j4;
        }

        public final long getSegmentDurationUs(long j, long j2) {
            List<SegmentTimelineElement> list = this.segmentTimeline;
            if (list != null) {
                return (list.get((int) (j - this.startNumber)).duration * 1000000) / this.timescale;
            }
            long segmentCount = getSegmentCount(j2);
            if (segmentCount != -1 && j == (getFirstSegmentNum() + segmentCount) - 1) {
                return j2 - getSegmentTimeUs(j);
            }
            return (this.duration * 1000000) / this.timescale;
        }

        public final long getSegmentTimeUs(long j) {
            long j2;
            List<SegmentTimelineElement> list = this.segmentTimeline;
            if (list != null) {
                j2 = list.get((int) (j - this.startNumber)).startTime - this.presentationTimeOffset;
            } else {
                j2 = (j - this.startNumber) * this.duration;
            }
            return Util.scaleLargeTimestamp(j2, 1000000L, this.timescale);
        }

        public long getFirstSegmentNum() {
            return this.startNumber;
        }

        public long getFirstAvailableSegmentNum(long j, long j2) {
            if (getSegmentCount(j) == -1) {
                long j3 = this.timeShiftBufferDepthUs;
                if (j3 != C.TIME_UNSET) {
                    return Math.max(getFirstSegmentNum(), getSegmentNum((j2 - this.periodStartUnixTimeUs) - j3, j));
                }
            }
            return getFirstSegmentNum();
        }

        public long getAvailableSegmentCount(long j, long j2) {
            long segmentCount = getSegmentCount(j);
            return segmentCount != -1 ? segmentCount : (int) (getSegmentNum((j2 - this.periodStartUnixTimeUs) + this.availabilityTimeOffsetUs, j) - getFirstAvailableSegmentNum(j, j2));
        }

        public long getNextSegmentAvailableTimeUs(long j, long j2) {
            if (this.segmentTimeline != null) {
                return C.TIME_UNSET;
            }
            long firstAvailableSegmentNum = getFirstAvailableSegmentNum(j, j2) + getAvailableSegmentCount(j, j2);
            return (getSegmentTimeUs(firstAvailableSegmentNum) + getSegmentDurationUs(firstAvailableSegmentNum, j)) - this.availabilityTimeOffsetUs;
        }

        public boolean isExplicit() {
            return this.segmentTimeline != null;
        }
    }

    public static final class SegmentList extends MultiSegmentBase {
        final List<RangedUri> mediaSegments;

        @Override // androidx.media3.exoplayer.dash.manifest.SegmentBase.MultiSegmentBase
        public boolean isExplicit() {
            return true;
        }

        public SegmentList(RangedUri rangedUri, long j, long j2, long j3, long j4, List<SegmentTimelineElement> list, long j5, List<RangedUri> list2, long j6, long j7) {
            super(rangedUri, j, j2, j3, j4, list, j5, j6, j7);
            this.mediaSegments = list2;
        }

        @Override // androidx.media3.exoplayer.dash.manifest.SegmentBase.MultiSegmentBase
        public RangedUri getSegmentUrl(Representation representation, long j) {
            return this.mediaSegments.get((int) (j - this.startNumber));
        }

        @Override // androidx.media3.exoplayer.dash.manifest.SegmentBase.MultiSegmentBase
        public long getSegmentCount(long j) {
            return this.mediaSegments.size();
        }
    }

    public static final class SegmentTemplate extends MultiSegmentBase {
        final long endNumber;
        final UrlTemplate initializationTemplate;
        final UrlTemplate mediaTemplate;

        public SegmentTemplate(RangedUri rangedUri, long j, long j2, long j3, long j4, long j5, List<SegmentTimelineElement> list, long j6, UrlTemplate urlTemplate, UrlTemplate urlTemplate2, long j7, long j8) {
            super(rangedUri, j, j2, j3, j5, list, j6, j7, j8);
            this.initializationTemplate = urlTemplate;
            this.mediaTemplate = urlTemplate2;
            this.endNumber = j4;
        }

        @Override // androidx.media3.exoplayer.dash.manifest.SegmentBase
        public RangedUri getInitialization(Representation representation) {
            UrlTemplate urlTemplate = this.initializationTemplate;
            if (urlTemplate != null) {
                return new RangedUri(urlTemplate.buildUri(representation.format.id, 0L, representation.format.bitrate, 0L), 0L, -1L);
            }
            return super.getInitialization(representation);
        }

        @Override // androidx.media3.exoplayer.dash.manifest.SegmentBase.MultiSegmentBase
        public RangedUri getSegmentUrl(Representation representation, long j) {
            long j2;
            if (this.segmentTimeline != null) {
                j2 = this.segmentTimeline.get((int) (j - this.startNumber)).startTime;
            } else {
                j2 = (j - this.startNumber) * this.duration;
            }
            return new RangedUri(this.mediaTemplate.buildUri(representation.format.id, j, representation.format.bitrate, j2), 0L, -1L);
        }

        @Override // androidx.media3.exoplayer.dash.manifest.SegmentBase.MultiSegmentBase
        public long getSegmentCount(long j) {
            if (this.segmentTimeline != null) {
                return this.segmentTimeline.size();
            }
            long j2 = this.endNumber;
            if (j2 != -1) {
                return (j2 - this.startNumber) + 1;
            }
            if (j != C.TIME_UNSET) {
                return BigIntegerMath.divide(BigInteger.valueOf(j).multiply(BigInteger.valueOf(this.timescale)), BigInteger.valueOf(this.duration).multiply(BigInteger.valueOf(1000000L)), RoundingMode.CEILING).longValue();
            }
            return -1L;
        }
    }

    public static final class SegmentTimelineElement {
        final long duration;
        final long startTime;

        public SegmentTimelineElement(long j, long j2) {
            this.startTime = j;
            this.duration = j2;
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            SegmentTimelineElement segmentTimelineElement = (SegmentTimelineElement) obj;
            return this.startTime == segmentTimelineElement.startTime && this.duration == segmentTimelineElement.duration;
        }

        public int hashCode() {
            return (((int) this.startTime) * 31) + ((int) this.duration);
        }
    }
}
