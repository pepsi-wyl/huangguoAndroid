package androidx.media3.exoplayer.source;

import android.net.Uri;
import androidx.media3.common.C;
import androidx.media3.common.MediaItem;
import androidx.media3.common.Timeline;
import androidx.media3.common.util.Assertions;

/* loaded from: classes.dex */
public final class SinglePeriodTimeline extends Timeline {
    private final long elapsedRealtimeEpochOffsetMs;
    private final boolean isDynamic;
    private final boolean isSeekable;
    private final MediaItem.LiveConfiguration liveConfiguration;
    private final Object manifest;
    private final MediaItem mediaItem;
    private final long periodDurationUs;
    private final long presentationStartTimeMs;
    private final boolean suppressPositionProjection;
    private final long windowDefaultStartPositionUs;
    private final long windowDurationUs;
    private final long windowPositionInPeriodUs;
    private final long windowStartTimeMs;
    private static final Object UID = new Object();
    private static final MediaItem MEDIA_ITEM = new MediaItem.Builder().setMediaId("SinglePeriodTimeline").setUri(Uri.EMPTY).build();

    @Override // androidx.media3.common.Timeline
    public int getPeriodCount() {
        return 1;
    }

    @Override // androidx.media3.common.Timeline
    public int getWindowCount() {
        return 1;
    }

    @Deprecated
    public SinglePeriodTimeline(long j, boolean z, boolean z2, boolean z3, Object obj, Object obj2) {
        this(j, j, 0L, 0L, z, z2, z3, obj, obj2);
    }

    public SinglePeriodTimeline(long j, boolean z, boolean z2, boolean z3, Object obj, MediaItem mediaItem) {
        this(j, j, 0L, 0L, z, z2, z3, obj, mediaItem);
    }

    @Deprecated
    public SinglePeriodTimeline(long j, long j2, long j3, long j4, boolean z, boolean z2, boolean z3, Object obj, Object obj2) {
        this(C.TIME_UNSET, C.TIME_UNSET, C.TIME_UNSET, j, j2, j3, j4, z, z2, z3, obj, obj2);
    }

    public SinglePeriodTimeline(long j, long j2, long j3, long j4, boolean z, boolean z2, boolean z3, Object obj, MediaItem mediaItem) {
        this(C.TIME_UNSET, C.TIME_UNSET, C.TIME_UNSET, j, j2, j3, j4, z, z2, false, obj, mediaItem, z3 ? mediaItem.liveConfiguration : null);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    @Deprecated
    public SinglePeriodTimeline(long j, long j2, long j3, long j4, long j5, long j6, long j7, boolean z, boolean z2, boolean z3, Object obj, Object obj2) {
        MediaItem mediaItem = MEDIA_ITEM;
        this(j, j2, j3, j4, j5, j6, j7, z, z2, false, obj, mediaItem.buildUpon().setTag(obj2).build(), z3 ? mediaItem.liveConfiguration : null);
    }

    @Deprecated
    public SinglePeriodTimeline(long j, long j2, long j3, long j4, long j5, long j6, long j7, boolean z, boolean z2, Object obj, MediaItem mediaItem, MediaItem.LiveConfiguration liveConfiguration) {
        this(j, j2, j3, j4, j5, j6, j7, z, z2, false, obj, mediaItem, liveConfiguration);
    }

    public SinglePeriodTimeline(long j, long j2, long j3, long j4, long j5, long j6, long j7, boolean z, boolean z2, boolean z3, Object obj, MediaItem mediaItem, MediaItem.LiveConfiguration liveConfiguration) {
        this.presentationStartTimeMs = j;
        this.windowStartTimeMs = j2;
        this.elapsedRealtimeEpochOffsetMs = j3;
        this.periodDurationUs = j4;
        this.windowDurationUs = j5;
        this.windowPositionInPeriodUs = j6;
        this.windowDefaultStartPositionUs = j7;
        this.isSeekable = z;
        this.isDynamic = z2;
        this.suppressPositionProjection = z3;
        this.manifest = obj;
        this.mediaItem = (MediaItem) Assertions.checkNotNull(mediaItem);
        this.liveConfiguration = liveConfiguration;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x002e A[PHI: r1
      0x002e: PHI (r1v2 long) = (r1v1 long), (r1v1 long), (r1v1 long), (r1v10 long) binds: [B:3:0x000d, B:5:0x0011, B:7:0x0017, B:12:0x002b] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // androidx.media3.common.Timeline
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public androidx.media3.common.Timeline.Window getWindow(int r30, androidx.media3.common.Timeline.Window r31, long r32) {
        /*
            r29 = this;
            r0 = r29
            r1 = 0
            r2 = 1
            r3 = r30
            androidx.media3.common.util.Assertions.checkIndex(r3, r1, r2)
            long r1 = r0.windowDefaultStartPositionUs
            boolean r3 = r0.isDynamic
            if (r3 == 0) goto L2e
            boolean r3 = r0.suppressPositionProjection
            if (r3 != 0) goto L2e
            r3 = 0
            int r5 = (r32 > r3 ? 1 : (r32 == r3 ? 0 : -1))
            if (r5 == 0) goto L2e
            long r3 = r0.windowDurationUs
            r5 = -9223372036854775807(0x8000000000000001, double:-4.9E-324)
            int r7 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r7 != 0) goto L27
        L24:
            r21 = r5
            goto L30
        L27:
            long r1 = r1 + r32
            int r7 = (r1 > r3 ? 1 : (r1 == r3 ? 0 : -1))
            if (r7 <= 0) goto L2e
            goto L24
        L2e:
            r21 = r1
        L30:
            java.lang.Object r9 = androidx.media3.common.Timeline.Window.SINGLE_WINDOW_UID
            androidx.media3.common.MediaItem r10 = r0.mediaItem
            java.lang.Object r11 = r0.manifest
            long r12 = r0.presentationStartTimeMs
            long r14 = r0.windowStartTimeMs
            long r1 = r0.elapsedRealtimeEpochOffsetMs
            r16 = r1
            boolean r1 = r0.isSeekable
            r18 = r1
            boolean r1 = r0.isDynamic
            r19 = r1
            androidx.media3.common.MediaItem$LiveConfiguration r1 = r0.liveConfiguration
            r20 = r1
            long r1 = r0.windowDurationUs
            r23 = r1
            r26 = 0
            long r1 = r0.windowPositionInPeriodUs
            r27 = r1
            r25 = 0
            r8 = r31
            androidx.media3.common.Timeline$Window r1 = r8.set(r9, r10, r11, r12, r14, r16, r18, r19, r20, r21, r23, r25, r26, r27)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.exoplayer.source.SinglePeriodTimeline.getWindow(int, androidx.media3.common.Timeline$Window, long):androidx.media3.common.Timeline$Window");
    }

    @Override // androidx.media3.common.Timeline
    public Timeline.Period getPeriod(int i, Timeline.Period period, boolean z) {
        Assertions.checkIndex(i, 0, 1);
        return period.set(null, z ? UID : null, 0, this.periodDurationUs, -this.windowPositionInPeriodUs);
    }

    @Override // androidx.media3.common.Timeline
    public int getIndexOfPeriod(Object obj) {
        return UID.equals(obj) ? 0 : -1;
    }

    @Override // androidx.media3.common.Timeline
    public Object getUidOfPeriod(int i) {
        Assertions.checkIndex(i, 0, 1);
        return UID;
    }
}
