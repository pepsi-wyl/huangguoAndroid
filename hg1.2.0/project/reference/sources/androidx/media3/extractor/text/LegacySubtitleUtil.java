package androidx.media3.extractor.text;

import androidx.media3.common.C;
import androidx.media3.common.text.Cue;
import androidx.media3.common.util.Consumer;
import java.util.List;

/* loaded from: classes.dex */
public class LegacySubtitleUtil {
    private LegacySubtitleUtil() {
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x003f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void toCuesWithTiming(androidx.media3.extractor.text.Subtitle r12, androidx.media3.extractor.text.SubtitleParser.OutputOptions r13, androidx.media3.common.util.Consumer<androidx.media3.extractor.text.CuesWithTiming> r14) {
        /*
            long r0 = r13.startTimeUs
            int r0 = getStartIndex(r12, r0)
            long r1 = r13.startTimeUs
            r3 = -9223372036854775807(0x8000000000000001, double:-4.9E-324)
            r5 = 0
            int r6 = (r1 > r3 ? 1 : (r1 == r3 ? 0 : -1))
            if (r6 == 0) goto L3f
            int r1 = r12.getEventTimeCount()
            if (r0 >= r1) goto L3f
            long r1 = r13.startTimeUs
            java.util.List r7 = r12.getCues(r1)
            long r1 = r12.getEventTime(r0)
            boolean r3 = r7.isEmpty()
            if (r3 != 0) goto L3f
            long r3 = r13.startTimeUs
            int r6 = (r3 > r1 ? 1 : (r3 == r1 ? 0 : -1))
            if (r6 >= 0) goto L3f
            androidx.media3.extractor.text.CuesWithTiming r3 = new androidx.media3.extractor.text.CuesWithTiming
            long r8 = r13.startTimeUs
            long r10 = r13.startTimeUs
            long r10 = r1 - r10
            r6 = r3
            r6.<init>(r7, r8, r10)
            r14.accept(r3)
            r1 = 1
            goto L40
        L3f:
            r1 = 0
        L40:
            r2 = r0
        L41:
            int r3 = r12.getEventTimeCount()
            if (r2 >= r3) goto L4d
            outputSubtitleEvent(r12, r2, r14)
            int r2 = r2 + 1
            goto L41
        L4d:
            boolean r2 = r13.outputAllCues
            if (r2 == 0) goto L7a
            if (r1 == 0) goto L55
            int r0 = r0 + (-1)
        L55:
            if (r5 >= r0) goto L5d
            outputSubtitleEvent(r12, r5, r14)
            int r5 = r5 + 1
            goto L55
        L5d:
            if (r1 == 0) goto L7a
            androidx.media3.extractor.text.CuesWithTiming r1 = new androidx.media3.extractor.text.CuesWithTiming
            long r2 = r13.startTimeUs
            java.util.List r7 = r12.getCues(r2)
            long r8 = r12.getEventTime(r0)
            long r2 = r13.startTimeUs
            long r12 = r12.getEventTime(r0)
            long r10 = r2 - r12
            r6 = r1
            r6.<init>(r7, r8, r10)
            r14.accept(r1)
        L7a:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.extractor.text.LegacySubtitleUtil.toCuesWithTiming(androidx.media3.extractor.text.Subtitle, androidx.media3.extractor.text.SubtitleParser$OutputOptions, androidx.media3.common.util.Consumer):void");
    }

    private static int getStartIndex(Subtitle subtitle, long j) {
        if (j == C.TIME_UNSET) {
            return 0;
        }
        int nextEventTimeIndex = subtitle.getNextEventTimeIndex(j);
        if (nextEventTimeIndex == -1) {
            nextEventTimeIndex = subtitle.getEventTimeCount();
        }
        return (nextEventTimeIndex <= 0 || subtitle.getEventTime(nextEventTimeIndex + (-1)) != j) ? nextEventTimeIndex : nextEventTimeIndex - 1;
    }

    private static void outputSubtitleEvent(Subtitle subtitle, int i, Consumer<CuesWithTiming> consumer) {
        long eventTime = subtitle.getEventTime(i);
        List<Cue> cues = subtitle.getCues(eventTime);
        if (cues.isEmpty()) {
            return;
        }
        if (i == subtitle.getEventTimeCount() - 1) {
            throw new IllegalStateException();
        }
        long eventTime2 = subtitle.getEventTime(i + 1) - subtitle.getEventTime(i);
        if (eventTime2 > 0) {
            consumer.accept(new CuesWithTiming(cues, eventTime, eventTime2));
        }
    }
}
