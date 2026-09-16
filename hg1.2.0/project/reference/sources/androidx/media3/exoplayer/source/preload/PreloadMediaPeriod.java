package androidx.media3.exoplayer.source.preload;

import androidx.media3.common.util.Assertions;
import androidx.media3.exoplayer.LoadingInfo;
import androidx.media3.exoplayer.SeekParameters;
import androidx.media3.exoplayer.source.MediaPeriod;
import androidx.media3.exoplayer.source.SampleStream;
import androidx.media3.exoplayer.source.TrackGroupArray;
import androidx.media3.exoplayer.trackselection.ExoTrackSelection;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

/* loaded from: classes.dex */
final class PreloadMediaPeriod implements MediaPeriod {
    private MediaPeriod.Callback callback;
    public final MediaPeriod mediaPeriod;
    private PreloadTrackSelectionHolder preloadTrackSelectionHolder;
    private boolean prepareInternalCalled;
    private boolean prepared;

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public /* synthetic */ List getStreamKeys(List list) {
        return Collections.emptyList();
    }

    public PreloadMediaPeriod(MediaPeriod mediaPeriod) {
        this.mediaPeriod = mediaPeriod;
    }

    void preload(MediaPeriod.Callback callback, long j) {
        this.callback = callback;
        if (this.prepared) {
            callback.onPrepared(this);
        }
        if (this.prepareInternalCalled) {
            return;
        }
        prepareInternal(j);
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public void prepare(MediaPeriod.Callback callback, long j) {
        this.callback = callback;
        if (this.prepared) {
            callback.onPrepared(this);
        } else {
            if (this.prepareInternalCalled) {
                return;
            }
            prepareInternal(j);
        }
    }

    private void prepareInternal(long j) {
        this.prepareInternalCalled = true;
        this.mediaPeriod.prepare(new MediaPeriod.Callback() { // from class: androidx.media3.exoplayer.source.preload.PreloadMediaPeriod.1
            @Override // androidx.media3.exoplayer.source.SequenceableLoader.Callback
            public void onContinueLoadingRequested(MediaPeriod mediaPeriod) {
                ((MediaPeriod.Callback) Assertions.checkNotNull(PreloadMediaPeriod.this.callback)).onContinueLoadingRequested(PreloadMediaPeriod.this);
            }

            @Override // androidx.media3.exoplayer.source.MediaPeriod.Callback
            public void onPrepared(MediaPeriod mediaPeriod) {
                PreloadMediaPeriod.this.prepared = true;
                ((MediaPeriod.Callback) Assertions.checkNotNull(PreloadMediaPeriod.this.callback)).onPrepared(PreloadMediaPeriod.this);
            }
        }, j);
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public void maybeThrowPrepareError() throws IOException {
        this.mediaPeriod.maybeThrowPrepareError();
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public TrackGroupArray getTrackGroups() {
        return this.mediaPeriod.getTrackGroups();
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public long selectTracks(ExoTrackSelection[] exoTrackSelectionArr, boolean[] zArr, SampleStream[] sampleStreamArr, boolean[] zArr2, long j) {
        return selectTracksInternal(exoTrackSelectionArr, zArr, sampleStreamArr, zArr2, j);
    }

    private long selectTracksInternal(ExoTrackSelection[] exoTrackSelectionArr, boolean[] zArr, SampleStream[] sampleStreamArr, boolean[] zArr2, long j) {
        PreloadTrackSelectionHolder preloadTrackSelectionHolder = this.preloadTrackSelectionHolder;
        if (preloadTrackSelectionHolder == null) {
            return this.mediaPeriod.selectTracks(exoTrackSelectionArr, zArr, sampleStreamArr, zArr2, j);
        }
        Assertions.checkState(sampleStreamArr.length == preloadTrackSelectionHolder.streams.length);
        if (j != this.preloadTrackSelectionHolder.trackSelectionPositionUs) {
            for (int i = 0; i < this.preloadTrackSelectionHolder.streams.length; i++) {
                if (this.preloadTrackSelectionHolder.streams[i] != null) {
                    sampleStreamArr[i] = this.preloadTrackSelectionHolder.streams[i];
                    zArr[i] = false;
                }
            }
            this.preloadTrackSelectionHolder = null;
            return this.mediaPeriod.selectTracks(exoTrackSelectionArr, zArr, sampleStreamArr, zArr2, j);
        }
        PreloadTrackSelectionHolder preloadTrackSelectionHolder2 = (PreloadTrackSelectionHolder) Assertions.checkNotNull(this.preloadTrackSelectionHolder);
        long jSelectTracks = preloadTrackSelectionHolder2.trackSelectionPositionUs;
        boolean[] zArr3 = preloadTrackSelectionHolder2.streamResetFlags;
        if (maybeUpdatePreloadTrackSelectionHolderForReselection(exoTrackSelectionArr, preloadTrackSelectionHolder2)) {
            zArr3 = new boolean[zArr3.length];
            jSelectTracks = this.mediaPeriod.selectTracks(preloadTrackSelectionHolder2.selections, preloadTrackSelectionHolder2.mayRetainStreamFlags, preloadTrackSelectionHolder2.streams, zArr3, preloadTrackSelectionHolder2.trackSelectionPositionUs);
            for (int i2 = 0; i2 < preloadTrackSelectionHolder2.mayRetainStreamFlags.length; i2++) {
                if (preloadTrackSelectionHolder2.mayRetainStreamFlags[i2]) {
                    zArr3[i2] = true;
                }
            }
        }
        System.arraycopy(preloadTrackSelectionHolder2.streams, 0, sampleStreamArr, 0, preloadTrackSelectionHolder2.streams.length);
        System.arraycopy(zArr3, 0, zArr2, 0, zArr3.length);
        this.preloadTrackSelectionHolder = null;
        return jSelectTracks;
    }

    private static boolean maybeUpdatePreloadTrackSelectionHolderForReselection(ExoTrackSelection[] exoTrackSelectionArr, PreloadTrackSelectionHolder preloadTrackSelectionHolder) {
        ExoTrackSelection[] exoTrackSelectionArr2 = ((PreloadTrackSelectionHolder) Assertions.checkNotNull(preloadTrackSelectionHolder)).selections;
        int i = 0;
        boolean z = false;
        while (i < exoTrackSelectionArr.length) {
            ExoTrackSelection exoTrackSelection = exoTrackSelectionArr[i];
            ExoTrackSelection exoTrackSelection2 = exoTrackSelectionArr2[i];
            if (exoTrackSelection != null || exoTrackSelection2 != null) {
                preloadTrackSelectionHolder.mayRetainStreamFlags[i] = false;
                if (exoTrackSelection == null) {
                    preloadTrackSelectionHolder.selections[i] = null;
                } else if (exoTrackSelection2 == null || !isSameAdaptionSet(exoTrackSelection, exoTrackSelection2)) {
                    preloadTrackSelectionHolder.selections[i] = exoTrackSelection;
                } else if (exoTrackSelection.getTrackGroup().type == 2 || exoTrackSelection.getTrackGroup().type == 1 || exoTrackSelection.getSelectedIndexInTrackGroup() == exoTrackSelection2.getSelectedIndexInTrackGroup()) {
                    preloadTrackSelectionHolder.mayRetainStreamFlags[i] = true;
                } else {
                    preloadTrackSelectionHolder.selections[i] = exoTrackSelection;
                }
                z = true;
            }
            i++;
        }
        return z;
    }

    private static boolean isSameAdaptionSet(ExoTrackSelection exoTrackSelection, ExoTrackSelection exoTrackSelection2) {
        if (!Objects.equals(exoTrackSelection.getTrackGroup(), exoTrackSelection2.getTrackGroup()) || exoTrackSelection.length() != exoTrackSelection2.length()) {
            return false;
        }
        for (int i = 0; i < exoTrackSelection.length(); i++) {
            if (exoTrackSelection.getIndexInTrackGroup(i) != exoTrackSelection2.getIndexInTrackGroup(i)) {
                return false;
            }
        }
        return true;
    }

    long selectTracksForPreloading(ExoTrackSelection[] exoTrackSelectionArr, long j) {
        SampleStream[] sampleStreamArr = new SampleStream[exoTrackSelectionArr.length];
        boolean[] zArr = new boolean[exoTrackSelectionArr.length];
        boolean[] zArr2 = new boolean[exoTrackSelectionArr.length];
        long jSelectTracksInternal = selectTracksInternal(exoTrackSelectionArr, zArr2, sampleStreamArr, zArr, j);
        this.preloadTrackSelectionHolder = new PreloadTrackSelectionHolder(exoTrackSelectionArr, zArr2, sampleStreamArr, zArr, jSelectTracksInternal);
        return jSelectTracksInternal;
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public void discardBuffer(long j, boolean z) {
        this.mediaPeriod.discardBuffer(j, z);
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public long readDiscontinuity() {
        return this.mediaPeriod.readDiscontinuity();
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public long seekToUs(long j) {
        return this.mediaPeriod.seekToUs(j);
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod
    public long getAdjustedSeekPositionUs(long j, SeekParameters seekParameters) {
        return this.mediaPeriod.getAdjustedSeekPositionUs(j, seekParameters);
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod, androidx.media3.exoplayer.source.SequenceableLoader
    public long getBufferedPositionUs() {
        return this.mediaPeriod.getBufferedPositionUs();
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod, androidx.media3.exoplayer.source.SequenceableLoader
    public long getNextLoadPositionUs() {
        return this.mediaPeriod.getNextLoadPositionUs();
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod, androidx.media3.exoplayer.source.SequenceableLoader
    public boolean continueLoading(LoadingInfo loadingInfo) {
        return this.mediaPeriod.continueLoading(loadingInfo);
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod, androidx.media3.exoplayer.source.SequenceableLoader
    public boolean isLoading() {
        return this.mediaPeriod.isLoading();
    }

    @Override // androidx.media3.exoplayer.source.MediaPeriod, androidx.media3.exoplayer.source.SequenceableLoader
    public void reevaluateBuffer(long j) {
        this.mediaPeriod.reevaluateBuffer(j);
    }

    private static class PreloadTrackSelectionHolder {
        public final boolean[] mayRetainStreamFlags;
        public final ExoTrackSelection[] selections;
        public final boolean[] streamResetFlags;
        public final SampleStream[] streams;
        public final long trackSelectionPositionUs;

        public PreloadTrackSelectionHolder(ExoTrackSelection[] exoTrackSelectionArr, boolean[] zArr, SampleStream[] sampleStreamArr, boolean[] zArr2, long j) {
            this.selections = exoTrackSelectionArr;
            this.mayRetainStreamFlags = zArr;
            this.streams = sampleStreamArr;
            this.streamResetFlags = zArr2;
            this.trackSelectionPositionUs = j;
        }
    }
}
