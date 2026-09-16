package androidx.media3.exoplayer.source;

import androidx.media3.common.C;
import androidx.media3.common.Format;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.StreamKey;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;
import androidx.media3.decoder.DecoderInputBuffer;
import androidx.media3.exoplayer.FormatHolder;
import androidx.media3.exoplayer.LoadingInfo;
import androidx.media3.exoplayer.SeekParameters;
import androidx.media3.exoplayer.source.ClippingMediaSource;
import androidx.media3.exoplayer.source.MediaPeriod;
import androidx.media3.exoplayer.trackselection.ExoTrackSelection;
import java.io.IOException;
import java.util.List;

/* loaded from: classes.dex */
public final class ClippingMediaPeriod implements MediaPeriod, MediaPeriod.Callback {
    private MediaPeriod.Callback callback;
    private ClippingMediaSource.IllegalClippingException clippingError;
    long endUs;
    public final MediaPeriod mediaPeriod;
    private long pendingInitialDiscontinuityPositionUs;
    private ClippingSampleStream[] sampleStreams = new ClippingSampleStream[0];
    long startUs;

    public ClippingMediaPeriod(MediaPeriod mediaPeriod, boolean z, long j, long j2) {
        this.mediaPeriod = mediaPeriod;
        this.pendingInitialDiscontinuityPositionUs = z ? j : C.TIME_UNSET;
        this.startUs = j;
        this.endUs = j2;
    }

    public void updateClipping(long j, long j2) {
        this.startUs = j;
        this.endUs = j2;
    }

    public void setClippingError(ClippingMediaSource.IllegalClippingException illegalClippingException) {
        this.clippingError = illegalClippingException;
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public void prepare(MediaPeriod.Callback callback, long j) {
        this.callback = callback;
        this.mediaPeriod.prepare(this, j);
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public void maybeThrowPrepareError() throws IOException {
        ClippingMediaSource.IllegalClippingException illegalClippingException = this.clippingError;
        if (illegalClippingException != null) {
            throw illegalClippingException;
        }
        this.mediaPeriod.maybeThrowPrepareError();
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public List<StreamKey> getStreamKeys(List<ExoTrackSelection> list) {
        return this.mediaPeriod.getStreamKeys(list);
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public TrackGroupArray getTrackGroups() {
        return this.mediaPeriod.getTrackGroups();
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0043  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0063  */
    @Override // androidx.media3.exoplayer.source.MediaPeriod
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public long selectTracks(androidx.media3.exoplayer.trackselection.ExoTrackSelection[] r13, boolean[] r14, androidx.media3.exoplayer.source.SampleStream[] r15, boolean[] r16, long r17) {
        /*
            r12 = this;
            r0 = r12
            r1 = r15
            int r2 = r1.length
            androidx.media3.exoplayer.source.ClippingMediaPeriod$ClippingSampleStream[] r2 = new androidx.media3.exoplayer.source.ClippingMediaPeriod.ClippingSampleStream[r2]
            r0.sampleStreams = r2
            int r2 = r1.length
            androidx.media3.exoplayer.source.SampleStream[] r9 = new androidx.media3.exoplayer.source.SampleStream[r2]
            r10 = 0
            r2 = 0
        Lc:
            int r3 = r1.length
            r11 = 0
            if (r2 >= r3) goto L21
            androidx.media3.exoplayer.source.ClippingMediaPeriod$ClippingSampleStream[] r3 = r0.sampleStreams
            r4 = r1[r2]
            androidx.media3.exoplayer.source.ClippingMediaPeriod$ClippingSampleStream r4 = (androidx.media3.exoplayer.source.ClippingMediaPeriod.ClippingSampleStream) r4
            r3[r2] = r4
            if (r4 == 0) goto L1c
            androidx.media3.exoplayer.source.SampleStream r11 = r4.childStream
        L1c:
            r9[r2] = r11
            int r2 = r2 + 1
            goto Lc
        L21:
            androidx.media3.exoplayer.source.MediaPeriod r2 = r0.mediaPeriod
            r3 = r13
            r4 = r14
            r5 = r9
            r6 = r16
            r7 = r17
            long r2 = r2.selectTracks(r3, r4, r5, r6, r7)
            boolean r4 = r12.isPendingInitialDiscontinuity()
            if (r4 == 0) goto L43
            long r4 = r0.startUs
            int r6 = (r17 > r4 ? 1 : (r17 == r4 ? 0 : -1))
            if (r6 != 0) goto L43
            r6 = r13
            boolean r4 = shouldKeepInitialDiscontinuity(r4, r13)
            if (r4 == 0) goto L43
            r4 = r2
            goto L48
        L43:
            r4 = -9223372036854775807(0x8000000000000001, double:-4.9E-324)
        L48:
            r0.pendingInitialDiscontinuityPositionUs = r4
            int r4 = (r2 > r17 ? 1 : (r2 == r17 ? 0 : -1))
            if (r4 == 0) goto L63
            long r4 = r0.startUs
            int r6 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r6 < 0) goto L61
            long r4 = r0.endUs
            r6 = -9223372036854775808
            int r8 = (r4 > r6 ? 1 : (r4 == r6 ? 0 : -1))
            if (r8 == 0) goto L63
            int r6 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r6 > 0) goto L61
            goto L63
        L61:
            r4 = 0
            goto L64
        L63:
            r4 = 1
        L64:
            androidx.media3.common.util.Assertions.checkState(r4)
        L67:
            int r4 = r1.length
            if (r10 >= r4) goto L93
            r4 = r9[r10]
            if (r4 != 0) goto L73
            androidx.media3.exoplayer.source.ClippingMediaPeriod$ClippingSampleStream[] r4 = r0.sampleStreams
            r4[r10] = r11
            goto L8a
        L73:
            androidx.media3.exoplayer.source.ClippingMediaPeriod$ClippingSampleStream[] r4 = r0.sampleStreams
            r4 = r4[r10]
            if (r4 == 0) goto L7f
            androidx.media3.exoplayer.source.SampleStream r4 = r4.childStream
            r5 = r9[r10]
            if (r4 == r5) goto L8a
        L7f:
            androidx.media3.exoplayer.source.ClippingMediaPeriod$ClippingSampleStream[] r4 = r0.sampleStreams
            androidx.media3.exoplayer.source.ClippingMediaPeriod$ClippingSampleStream r5 = new androidx.media3.exoplayer.source.ClippingMediaPeriod$ClippingSampleStream
            r6 = r9[r10]
            r5.<init>(r6)
            r4[r10] = r5
        L8a:
            androidx.media3.exoplayer.source.ClippingMediaPeriod$ClippingSampleStream[] r4 = r0.sampleStreams
            r4 = r4[r10]
            r1[r10] = r4
            int r10 = r10 + 1
            goto L67
        L93:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.exoplayer.source.ClippingMediaPeriod.selectTracks(androidx.media3.exoplayer.trackselection.ExoTrackSelection[], boolean[], androidx.media3.exoplayer.source.SampleStream[], boolean[], long):long");
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public void discardBuffer(long j, boolean z) {
        this.mediaPeriod.discardBuffer(j, z);
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod, androidx.media3.exoplayer.source.SequenceableLoader
    public void reevaluateBuffer(long j) {
        this.mediaPeriod.reevaluateBuffer(j);
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public long readDiscontinuity() {
        if (isPendingInitialDiscontinuity()) {
            long j = this.pendingInitialDiscontinuityPositionUs;
            this.pendingInitialDiscontinuityPositionUs = C.TIME_UNSET;
            long discontinuity = readDiscontinuity();
            return discontinuity != C.TIME_UNSET ? discontinuity : j;
        }
        long discontinuity2 = this.mediaPeriod.readDiscontinuity();
        if (discontinuity2 == C.TIME_UNSET) {
            return C.TIME_UNSET;
        }
        boolean z = true;
        Assertions.checkState(discontinuity2 >= this.startUs);
        long j2 = this.endUs;
        if (j2 != Long.MIN_VALUE && discontinuity2 > j2) {
            z = false;
        }
        Assertions.checkState(z);
        return discontinuity2;
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod, androidx.media3.exoplayer.source.SequenceableLoader
    public long getBufferedPositionUs() {
        long bufferedPositionUs = this.mediaPeriod.getBufferedPositionUs();
        if (bufferedPositionUs != Long.MIN_VALUE) {
            long j = this.endUs;
            if (j == Long.MIN_VALUE || bufferedPositionUs < j) {
                return bufferedPositionUs;
            }
        }
        return Long.MIN_VALUE;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0034  */
    @Override // androidx.media3.exoplayer.source.MediaPeriod
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public long seekToUs(long r7) {
        /*
            r6 = this;
            r0 = -9223372036854775807(0x8000000000000001, double:-4.9E-324)
            r6.pendingInitialDiscontinuityPositionUs = r0
            androidx.media3.exoplayer.source.ClippingMediaPeriod$ClippingSampleStream[] r0 = r6.sampleStreams
            int r1 = r0.length
            r2 = 0
            r3 = 0
        Lc:
            if (r3 >= r1) goto L18
            r4 = r0[r3]
            if (r4 == 0) goto L15
            r4.clearSentEos()
        L15:
            int r3 = r3 + 1
            goto Lc
        L18:
            androidx.media3.exoplayer.source.MediaPeriod r0 = r6.mediaPeriod
            long r0 = r0.seekToUs(r7)
            int r3 = (r0 > r7 ? 1 : (r0 == r7 ? 0 : -1))
            if (r3 == 0) goto L34
            long r7 = r6.startUs
            int r3 = (r0 > r7 ? 1 : (r0 == r7 ? 0 : -1))
            if (r3 < 0) goto L35
            long r7 = r6.endUs
            r3 = -9223372036854775808
            int r5 = (r7 > r3 ? 1 : (r7 == r3 ? 0 : -1))
            if (r5 == 0) goto L34
            int r3 = (r0 > r7 ? 1 : (r0 == r7 ? 0 : -1))
            if (r3 > 0) goto L35
        L34:
            r2 = 1
        L35:
            androidx.media3.common.util.Assertions.checkState(r2)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.exoplayer.source.ClippingMediaPeriod.seekToUs(long):long");
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public long getAdjustedSeekPositionUs(long j, SeekParameters seekParameters) {
        long j2 = this.startUs;
        if (j == j2) {
            return j2;
        }
        return this.mediaPeriod.getAdjustedSeekPositionUs(j, clipSeekParameters(j, seekParameters));
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod, androidx.media3.exoplayer.source.SequenceableLoader
    public long getNextLoadPositionUs() {
        long nextLoadPositionUs = this.mediaPeriod.getNextLoadPositionUs();
        if (nextLoadPositionUs != Long.MIN_VALUE) {
            long j = this.endUs;
            if (j == Long.MIN_VALUE || nextLoadPositionUs < j) {
                return nextLoadPositionUs;
            }
        }
        return Long.MIN_VALUE;
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod, androidx.media3.exoplayer.source.SequenceableLoader
    public boolean continueLoading(LoadingInfo loadingInfo) {
        return this.mediaPeriod.continueLoading(loadingInfo);
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod, androidx.media3.exoplayer.source.SequenceableLoader
    public boolean isLoading() {
        return this.mediaPeriod.isLoading();
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod.Callback
    public void onPrepared(MediaPeriod mediaPeriod) {
        if (this.clippingError != null) {
            return;
        }
        ((MediaPeriod.Callback) Assertions.checkNotNull(this.callback)).onPrepared(this);
    }

    @Override // androidx.media3.exoplayer.source.SequenceableLoader.Callback
    public void onContinueLoadingRequested(MediaPeriod mediaPeriod) {
        ((MediaPeriod.Callback) Assertions.checkNotNull(this.callback)).onContinueLoadingRequested(this);
    }

    boolean isPendingInitialDiscontinuity() {
        return this.pendingInitialDiscontinuityPositionUs != C.TIME_UNSET;
    }

    private SeekParameters clipSeekParameters(long j, SeekParameters seekParameters) {
        long jConstrainValue = Util.constrainValue(seekParameters.toleranceBeforeUs, 0L, j - this.startUs);
        long j2 = seekParameters.toleranceAfterUs;
        long j3 = this.endUs;
        long jConstrainValue2 = Util.constrainValue(j2, 0L, j3 == Long.MIN_VALUE ? Long.MAX_VALUE : j3 - j);
        return (jConstrainValue == seekParameters.toleranceBeforeUs && jConstrainValue2 == seekParameters.toleranceAfterUs) ? seekParameters : new SeekParameters(jConstrainValue, jConstrainValue2);
    }

    private static boolean shouldKeepInitialDiscontinuity(long j, ExoTrackSelection[] exoTrackSelectionArr) {
        if (j != 0) {
            for (ExoTrackSelection exoTrackSelection : exoTrackSelectionArr) {
                if (exoTrackSelection != null) {
                    Format selectedFormat = exoTrackSelection.getSelectedFormat();
                    if (!MimeTypes.allSamplesAreSyncSamples(selectedFormat.sampleMimeType, selectedFormat.codecs)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    private final class ClippingSampleStream implements SampleStream {
        public final SampleStream childStream;
        private boolean sentEos;

        public ClippingSampleStream(SampleStream sampleStream) {
            this.childStream = sampleStream;
        }

        public void clearSentEos() {
            this.sentEos = false;
        }

        @Override // androidx.media3.exoplayer.source.SampleStream
        public boolean isReady() {
            return !ClippingMediaPeriod.this.isPendingInitialDiscontinuity() && this.childStream.isReady();
        }

        @Override // androidx.media3.exoplayer.source.SampleStream
        public void maybeThrowError() throws IOException {
            this.childStream.maybeThrowError();
        }

        @Override // androidx.media3.exoplayer.source.SampleStream
        public int readData(FormatHolder formatHolder, DecoderInputBuffer decoderInputBuffer, int i) {
            if (ClippingMediaPeriod.this.isPendingInitialDiscontinuity()) {
                return -3;
            }
            if (this.sentEos) {
                decoderInputBuffer.setFlags(4);
                return -4;
            }
            long bufferedPositionUs = ClippingMediaPeriod.this.getBufferedPositionUs();
            int data = this.childStream.readData(formatHolder, decoderInputBuffer, i);
            if (data == -5) {
                Format format = (Format) Assertions.checkNotNull(formatHolder.format);
                if (format.encoderDelay != 0 || format.encoderPadding != 0) {
                    formatHolder.format = format.buildUpon().setEncoderDelay(ClippingMediaPeriod.this.startUs != 0 ? 0 : format.encoderDelay).setEncoderPadding(ClippingMediaPeriod.this.endUs == Long.MIN_VALUE ? format.encoderPadding : 0).build();
                }
                return -5;
            }
            if (ClippingMediaPeriod.this.endUs == Long.MIN_VALUE || ((data != -4 || decoderInputBuffer.timeUs < ClippingMediaPeriod.this.endUs) && !(data == -3 && bufferedPositionUs == Long.MIN_VALUE && !decoderInputBuffer.waitingForKeys))) {
                return data;
            }
            decoderInputBuffer.clear();
            decoderInputBuffer.setFlags(4);
            this.sentEos = true;
            return -4;
        }

        @Override // androidx.media3.exoplayer.source.SampleStream
        public int skipData(long j) {
            if (ClippingMediaPeriod.this.isPendingInitialDiscontinuity()) {
                return -3;
            }
            return this.childStream.skipData(j);
        }
    }
}
