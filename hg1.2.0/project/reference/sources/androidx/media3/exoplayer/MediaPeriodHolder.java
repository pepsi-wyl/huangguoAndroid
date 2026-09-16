package androidx.media3.exoplayer;

import androidx.media3.common.C;
import androidx.media3.common.Timeline;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Log;
import androidx.media3.exoplayer.LoadingInfo;
import androidx.media3.exoplayer.source.ClippingMediaPeriod;
import androidx.media3.exoplayer.source.EmptySampleStream;
import androidx.media3.exoplayer.source.MediaPeriod;
import androidx.media3.exoplayer.source.MediaSource;
import androidx.media3.exoplayer.source.SampleStream;
import androidx.media3.exoplayer.source.TrackGroupArray;
import androidx.media3.exoplayer.trackselection.ExoTrackSelection;
import androidx.media3.exoplayer.trackselection.TrackSelector;
import androidx.media3.exoplayer.trackselection.TrackSelectorResult;
import androidx.media3.exoplayer.upstream.Allocator;
import java.io.IOException;

/* loaded from: classes.dex */
final class MediaPeriodHolder {
    private static final String TAG = "MediaPeriodHolder";
    public boolean allRenderersInCorrectState;
    public boolean hasEnabledTracks;
    public MediaPeriodInfo info;
    private final boolean[] mayRetainStreamFlags;
    public final MediaPeriod mediaPeriod;
    private final MediaSourceList mediaSourceList;
    private MediaPeriodHolder next;
    public boolean prepared;
    private final RendererCapabilities[] rendererCapabilities;
    private long rendererPositionOffsetUs;
    public final SampleStream[] sampleStreams;
    private TrackGroupArray trackGroups = TrackGroupArray.EMPTY;
    private final TrackSelector trackSelector;
    private TrackSelectorResult trackSelectorResult;
    public final Object uid;

    interface Factory {
        MediaPeriodHolder create(MediaPeriodInfo mediaPeriodInfo, long j);
    }

    public MediaPeriodHolder(RendererCapabilities[] rendererCapabilitiesArr, long j, TrackSelector trackSelector, Allocator allocator, MediaSourceList mediaSourceList, MediaPeriodInfo mediaPeriodInfo, TrackSelectorResult trackSelectorResult) {
        this.rendererCapabilities = rendererCapabilitiesArr;
        this.rendererPositionOffsetUs = j;
        this.trackSelector = trackSelector;
        this.mediaSourceList = mediaSourceList;
        this.uid = mediaPeriodInfo.id.periodUid;
        this.info = mediaPeriodInfo;
        this.trackSelectorResult = trackSelectorResult;
        this.sampleStreams = new SampleStream[rendererCapabilitiesArr.length];
        this.mayRetainStreamFlags = new boolean[rendererCapabilitiesArr.length];
        this.mediaPeriod = createMediaPeriod(mediaPeriodInfo.id, mediaSourceList, allocator, mediaPeriodInfo.startPositionUs, mediaPeriodInfo.endPositionUs);
    }

    public long toRendererTime(long j) {
        return j + getRendererOffset();
    }

    public long toPeriodTime(long j) {
        return j - getRendererOffset();
    }

    public long getRendererOffset() {
        return this.rendererPositionOffsetUs;
    }

    public void setRendererOffset(long j) {
        this.rendererPositionOffsetUs = j;
    }

    public long getStartPositionRendererTime() {
        return this.info.startPositionUs + this.rendererPositionOffsetUs;
    }

    public boolean isFullyBuffered() {
        return this.prepared && (!this.hasEnabledTracks || this.mediaPeriod.getBufferedPositionUs() == Long.MIN_VALUE);
    }

    public long getBufferedPositionUs() {
        if (!this.prepared) {
            return this.info.startPositionUs;
        }
        long bufferedPositionUs = this.hasEnabledTracks ? this.mediaPeriod.getBufferedPositionUs() : Long.MIN_VALUE;
        return bufferedPositionUs == Long.MIN_VALUE ? this.info.durationUs : bufferedPositionUs;
    }

    public long getNextLoadPositionUs() {
        if (this.prepared) {
            return this.mediaPeriod.getNextLoadPositionUs();
        }
        return 0L;
    }

    public void handlePrepared(float f, Timeline timeline) throws ExoPlaybackException {
        this.prepared = true;
        this.trackGroups = this.mediaPeriod.getTrackGroups();
        TrackSelectorResult trackSelectorResultSelectTracks = selectTracks(f, timeline);
        long jMax = this.info.startPositionUs;
        if (this.info.durationUs != C.TIME_UNSET && jMax >= this.info.durationUs) {
            jMax = Math.max(0L, this.info.durationUs - 1);
        }
        long jApplyTrackSelection = applyTrackSelection(trackSelectorResultSelectTracks, jMax, false);
        this.rendererPositionOffsetUs += this.info.startPositionUs - jApplyTrackSelection;
        this.info = this.info.copyWithStartPositionUs(jApplyTrackSelection);
    }

    public void reevaluateBuffer(long j) {
        Assertions.checkState(isLoadingMediaPeriod());
        if (this.prepared) {
            this.mediaPeriod.reevaluateBuffer(toPeriodTime(j));
        }
    }

    public void continueLoading(long j, float f, long j2) {
        Assertions.checkState(isLoadingMediaPeriod());
        this.mediaPeriod.continueLoading(new LoadingInfo.Builder().setPlaybackPositionUs(toPeriodTime(j)).setPlaybackSpeed(f).setLastRebufferRealtimeMs(j2).build());
    }

    public TrackSelectorResult selectTracks(float f, Timeline timeline) throws ExoPlaybackException {
        TrackSelectorResult trackSelectorResultSelectTracks = this.trackSelector.selectTracks(this.rendererCapabilities, getTrackGroups(), this.info.id, timeline);
        for (int i = 0; i < trackSelectorResultSelectTracks.length; i++) {
            if (trackSelectorResultSelectTracks.isRendererEnabled(i)) {
                if (trackSelectorResultSelectTracks.selections[i] == null && this.rendererCapabilities[i].getTrackType() != -2) {
                    z = false;
                }
                Assertions.checkState(z);
            } else {
                Assertions.checkState(trackSelectorResultSelectTracks.selections[i] == null);
            }
        }
        for (ExoTrackSelection exoTrackSelection : trackSelectorResultSelectTracks.selections) {
            if (exoTrackSelection != null) {
                exoTrackSelection.onPlaybackSpeed(f);
            }
        }
        return trackSelectorResultSelectTracks;
    }

    public long applyTrackSelection(TrackSelectorResult trackSelectorResult, long j, boolean z) {
        return applyTrackSelection(trackSelectorResult, j, z, new boolean[this.rendererCapabilities.length]);
    }

    public long applyTrackSelection(TrackSelectorResult trackSelectorResult, long j, boolean z, boolean[] zArr) {
        int i = 0;
        while (true) {
            boolean z2 = true;
            if (i >= trackSelectorResult.length) {
                break;
            }
            boolean[] zArr2 = this.mayRetainStreamFlags;
            if (z || !trackSelectorResult.isEquivalent(this.trackSelectorResult, i)) {
                z2 = false;
            }
            zArr2[i] = z2;
            i++;
        }
        disassociateNoSampleRenderersWithEmptySampleStream(this.sampleStreams);
        disableTrackSelectionsInResult();
        this.trackSelectorResult = trackSelectorResult;
        enableTrackSelectionsInResult();
        long jSelectTracks = this.mediaPeriod.selectTracks(trackSelectorResult.selections, this.mayRetainStreamFlags, this.sampleStreams, zArr, j);
        associateNoSampleRenderersWithEmptySampleStream(this.sampleStreams);
        this.hasEnabledTracks = false;
        int i2 = 0;
        while (true) {
            SampleStream[] sampleStreamArr = this.sampleStreams;
            if (i2 >= sampleStreamArr.length) {
                return jSelectTracks;
            }
            if (sampleStreamArr[i2] != null) {
                Assertions.checkState(trackSelectorResult.isRendererEnabled(i2));
                if (this.rendererCapabilities[i2].getTrackType() != -2) {
                    this.hasEnabledTracks = true;
                }
            } else {
                Assertions.checkState(trackSelectorResult.selections[i2] == null);
            }
            i2++;
        }
    }

    public void release() {
        disableTrackSelectionsInResult();
        releaseMediaPeriod(this.mediaSourceList, this.mediaPeriod);
    }

    public void setNext(MediaPeriodHolder mediaPeriodHolder) {
        if (mediaPeriodHolder == this.next) {
            return;
        }
        disableTrackSelectionsInResult();
        this.next = mediaPeriodHolder;
        enableTrackSelectionsInResult();
    }

    public MediaPeriodHolder getNext() {
        return this.next;
    }

    public TrackGroupArray getTrackGroups() {
        return this.trackGroups;
    }

    public TrackSelectorResult getTrackSelectorResult() {
        return this.trackSelectorResult;
    }

    public void updateClipping() {
        if (this.mediaPeriod instanceof ClippingMediaPeriod) {
            ((ClippingMediaPeriod) this.mediaPeriod).updateClipping(0L, this.info.endPositionUs == C.TIME_UNSET ? Long.MIN_VALUE : this.info.endPositionUs);
        }
    }

    public boolean hasLoadingError() {
        try {
            if (!this.prepared) {
                this.mediaPeriod.maybeThrowPrepareError();
            } else {
                for (SampleStream sampleStream : this.sampleStreams) {
                    if (sampleStream != null) {
                        sampleStream.maybeThrowError();
                    }
                }
            }
            return false;
        } catch (IOException unused) {
            return true;
        }
    }

    private void enableTrackSelectionsInResult() {
        if (isLoadingMediaPeriod()) {
            for (int i = 0; i < this.trackSelectorResult.length; i++) {
                boolean zIsRendererEnabled = this.trackSelectorResult.isRendererEnabled(i);
                ExoTrackSelection exoTrackSelection = this.trackSelectorResult.selections[i];
                if (zIsRendererEnabled && exoTrackSelection != null) {
                    exoTrackSelection.enable();
                }
            }
        }
    }

    private void disableTrackSelectionsInResult() {
        if (isLoadingMediaPeriod()) {
            for (int i = 0; i < this.trackSelectorResult.length; i++) {
                boolean zIsRendererEnabled = this.trackSelectorResult.isRendererEnabled(i);
                ExoTrackSelection exoTrackSelection = this.trackSelectorResult.selections[i];
                if (zIsRendererEnabled && exoTrackSelection != null) {
                    exoTrackSelection.disable();
                }
            }
        }
    }

    private void disassociateNoSampleRenderersWithEmptySampleStream(SampleStream[] sampleStreamArr) {
        int i = 0;
        while (true) {
            RendererCapabilities[] rendererCapabilitiesArr = this.rendererCapabilities;
            if (i >= rendererCapabilitiesArr.length) {
                return;
            }
            if (rendererCapabilitiesArr[i].getTrackType() == -2) {
                sampleStreamArr[i] = null;
            }
            i++;
        }
    }

    private void associateNoSampleRenderersWithEmptySampleStream(SampleStream[] sampleStreamArr) {
        int i = 0;
        while (true) {
            RendererCapabilities[] rendererCapabilitiesArr = this.rendererCapabilities;
            if (i >= rendererCapabilitiesArr.length) {
                return;
            }
            if (rendererCapabilitiesArr[i].getTrackType() == -2 && this.trackSelectorResult.isRendererEnabled(i)) {
                sampleStreamArr[i] = new EmptySampleStream();
            }
            i++;
        }
    }

    private boolean isLoadingMediaPeriod() {
        return this.next == null;
    }

    private static MediaPeriod createMediaPeriod(MediaSource.MediaPeriodId mediaPeriodId, MediaSourceList mediaSourceList, Allocator allocator, long j, long j2) {
        MediaPeriod mediaPeriodCreatePeriod = mediaSourceList.createPeriod(mediaPeriodId, allocator, j);
        return j2 != C.TIME_UNSET ? new ClippingMediaPeriod(mediaPeriodCreatePeriod, true, 0L, j2) : mediaPeriodCreatePeriod;
    }

    private static void releaseMediaPeriod(MediaSourceList mediaSourceList, MediaPeriod mediaPeriod) {
        try {
            if (mediaPeriod instanceof ClippingMediaPeriod) {
                mediaSourceList.releasePeriod(((ClippingMediaPeriod) mediaPeriod).mediaPeriod);
            } else {
                mediaSourceList.releasePeriod(mediaPeriod);
            }
        } catch (RuntimeException e) {
            Log.e(TAG, "Period release failed.", e);
        }
    }

    public boolean canBeUsedForMediaPeriodInfo(MediaPeriodInfo mediaPeriodInfo) {
        return MediaPeriodQueue.areDurationsCompatible(this.info.durationUs, mediaPeriodInfo.durationUs) && this.info.startPositionUs == mediaPeriodInfo.startPositionUs && this.info.id.equals(mediaPeriodInfo.id);
    }
}
