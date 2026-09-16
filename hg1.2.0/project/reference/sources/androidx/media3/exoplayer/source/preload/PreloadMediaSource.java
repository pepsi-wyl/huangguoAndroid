package androidx.media3.exoplayer.source.preload;

import android.os.Handler;
import android.os.Looper;
import android.util.Pair;
import androidx.media3.common.C;
import androidx.media3.common.MediaItem;
import androidx.media3.common.Timeline;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Log;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.ExoPlaybackException;
import androidx.media3.exoplayer.LoadingInfo;
import androidx.media3.exoplayer.RendererCapabilities;
import androidx.media3.exoplayer.analytics.PlayerId;
import androidx.media3.exoplayer.drm.DrmSessionManagerProvider;
import androidx.media3.exoplayer.source.MediaPeriod;
import androidx.media3.exoplayer.source.MediaSource;
import androidx.media3.exoplayer.source.WrappingMediaSource;
import androidx.media3.exoplayer.trackselection.TrackSelector;
import androidx.media3.exoplayer.trackselection.TrackSelectorResult;
import androidx.media3.exoplayer.upstream.Allocator;
import androidx.media3.exoplayer.upstream.BandwidthMeter;
import androidx.media3.exoplayer.upstream.CmcdConfiguration;
import androidx.media3.exoplayer.upstream.LoadErrorHandlingPolicy;
import androidx.media3.extractor.text.SubtitleParser;
import java.util.Arrays;

/* loaded from: classes.dex */
public final class PreloadMediaSource extends WrappingMediaSource {
    private static final String TAG = "PreloadMediaSource";
    private final Allocator allocator;
    private final BandwidthMeter bandwidthMeter;
    private boolean onSourcePreparedNotified;
    private boolean onUsedByPlayerNotified;
    private Pair<PreloadMediaPeriod, MediaSource.MediaPeriodId> playingPreloadedMediaPeriodAndId;
    private boolean preloadCalled;
    private final PreloadControl preloadControl;
    private final Handler preloadHandler;
    private Pair<PreloadMediaPeriod, MediaPeriodKey> preloadingMediaPeriodAndKey;
    private boolean prepareChildSourceCalled;
    private final RendererCapabilities[] rendererCapabilities;
    private long startPositionUs;
    private Timeline timeline;
    private final TrackSelector trackSelector;

    public interface PreloadControl {

        /* renamed from: androidx.media3.exoplayer.source.preload.PreloadMediaSource$PreloadControl$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static void $default$onLoadedToTheEndOfSource(PreloadControl _this, PreloadMediaSource preloadMediaSource) {
            }
        }

        boolean onContinueLoadingRequested(PreloadMediaSource preloadMediaSource, long j);

        void onLoadedToTheEndOfSource(PreloadMediaSource preloadMediaSource);

        boolean onSourcePrepared(PreloadMediaSource preloadMediaSource);

        boolean onTracksSelected(PreloadMediaSource preloadMediaSource);

        void onUsedByPlayer(PreloadMediaSource preloadMediaSource);
    }

    public static final class Factory implements MediaSource.Factory {
        private final Allocator allocator;
        private final BandwidthMeter bandwidthMeter;
        private final MediaSource.Factory mediaSourceFactory;
        private final PreloadControl preloadControl;
        private final Looper preloadLooper;
        private final RendererCapabilities[] rendererCapabilities;
        private final TrackSelector trackSelector;

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public /* synthetic */ MediaSource.Factory experimentalParseSubtitlesDuringExtraction(boolean z) {
            return MediaSource.Factory.CC.$default$experimentalParseSubtitlesDuringExtraction(this, z);
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public /* synthetic */ MediaSource.Factory setSubtitleParserFactory(SubtitleParser.Factory factory) {
            return MediaSource.Factory.CC.$default$setSubtitleParserFactory(this, factory);
        }

        public Factory(MediaSource.Factory factory, PreloadControl preloadControl, TrackSelector trackSelector, BandwidthMeter bandwidthMeter, RendererCapabilities[] rendererCapabilitiesArr, Allocator allocator, Looper looper) {
            this.mediaSourceFactory = factory;
            this.preloadControl = preloadControl;
            this.trackSelector = trackSelector;
            this.bandwidthMeter = bandwidthMeter;
            this.rendererCapabilities = (RendererCapabilities[]) Arrays.copyOf(rendererCapabilitiesArr, rendererCapabilitiesArr.length);
            this.allocator = allocator;
            this.preloadLooper = looper;
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public Factory setCmcdConfigurationFactory(CmcdConfiguration.Factory factory) {
            this.mediaSourceFactory.setCmcdConfigurationFactory(factory);
            return this;
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public Factory setDrmSessionManagerProvider(DrmSessionManagerProvider drmSessionManagerProvider) {
            this.mediaSourceFactory.setDrmSessionManagerProvider(drmSessionManagerProvider);
            return this;
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public Factory setLoadErrorHandlingPolicy(LoadErrorHandlingPolicy loadErrorHandlingPolicy) {
            this.mediaSourceFactory.setLoadErrorHandlingPolicy(loadErrorHandlingPolicy);
            return this;
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public int[] getSupportedTypes() {
            return this.mediaSourceFactory.getSupportedTypes();
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public PreloadMediaSource createMediaSource(MediaItem mediaItem) {
            return new PreloadMediaSource(this.mediaSourceFactory.createMediaSource(mediaItem), this.preloadControl, this.trackSelector, this.bandwidthMeter, this.rendererCapabilities, this.allocator, this.preloadLooper);
        }

        public PreloadMediaSource createMediaSource(MediaSource mediaSource) {
            return new PreloadMediaSource(mediaSource, this.preloadControl, this.trackSelector, this.bandwidthMeter, this.rendererCapabilities, this.allocator, this.preloadLooper);
        }
    }

    private PreloadMediaSource(MediaSource mediaSource, PreloadControl preloadControl, TrackSelector trackSelector, BandwidthMeter bandwidthMeter, RendererCapabilities[] rendererCapabilitiesArr, Allocator allocator, Looper looper) {
        super(mediaSource);
        this.preloadControl = preloadControl;
        this.trackSelector = trackSelector;
        this.bandwidthMeter = bandwidthMeter;
        this.rendererCapabilities = rendererCapabilitiesArr;
        this.allocator = allocator;
        this.preloadHandler = Util.createHandler(looper, null);
        this.startPositionUs = C.TIME_UNSET;
    }

    public void preload(final long j) {
        this.preloadHandler.post(new Runnable() { // from class: androidx.media3.exoplayer.source.preload.PreloadMediaSource$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m297xf99e9a56(j);
            }
        });
    }

    /* renamed from: lambda$preload$0$androidx-media3-exoplayer-source-preload-PreloadMediaSource, reason: not valid java name */
    /* synthetic */ void m297xf99e9a56(long j) {
        this.preloadCalled = true;
        this.startPositionUs = j;
        this.onSourcePreparedNotified = false;
        if (isUsedByPlayer()) {
            notifyOnUsedByPlayer();
        } else {
            setPlayerId(PlayerId.UNSET);
            prepareSourceInternal(this.bandwidthMeter.getTransferListener());
        }
    }

    public void clear() {
        this.preloadHandler.post(new Runnable() { // from class: androidx.media3.exoplayer.source.preload.PreloadMediaSource$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m295xcf4780db();
            }
        });
    }

    /* renamed from: lambda$clear$1$androidx-media3-exoplayer-source-preload-PreloadMediaSource, reason: not valid java name */
    /* synthetic */ void m295xcf4780db() {
        if (this.preloadingMediaPeriodAndKey != null) {
            this.mediaSource.releasePeriod(((PreloadMediaPeriod) this.preloadingMediaPeriodAndKey.first).mediaPeriod);
            this.preloadingMediaPeriodAndKey = null;
        }
    }

    @Override // androidx.media3.exoplayer.source.WrappingMediaSource
    protected void prepareSourceInternal() {
        if (isUsedByPlayer() && !this.onUsedByPlayerNotified) {
            notifyOnUsedByPlayer();
        }
        Timeline timeline = this.timeline;
        if (timeline != null) {
            onChildSourceInfoRefreshed(timeline);
        } else {
            if (this.prepareChildSourceCalled) {
                return;
            }
            this.prepareChildSourceCalled = true;
            prepareChildSource();
        }
    }

    @Override // androidx.media3.exoplayer.source.WrappingMediaSource
    protected void onChildSourceInfoRefreshed(final Timeline timeline) {
        this.timeline = timeline;
        refreshSourceInfo(timeline);
        this.preloadHandler.post(new Runnable() { // from class: androidx.media3.exoplayer.source.preload.PreloadMediaSource$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m296xd674fafd(timeline);
            }
        });
    }

    /* renamed from: lambda$onChildSourceInfoRefreshed$2$androidx-media3-exoplayer-source-preload-PreloadMediaSource, reason: not valid java name */
    /* synthetic */ void m296xd674fafd(Timeline timeline) {
        if (isUsedByPlayer() || this.onSourcePreparedNotified) {
            return;
        }
        this.onSourcePreparedNotified = true;
        if (this.preloadControl.onSourcePrepared(this)) {
            Pair<Object, Long> periodPositionUs = timeline.getPeriodPositionUs(new Timeline.Window(), new Timeline.Period(), 0, this.startPositionUs);
            createPeriod(new MediaSource.MediaPeriodId(periodPositionUs.first), this.allocator, ((Long) periodPositionUs.second).longValue()).preload(new PreloadMediaPeriodCallback(((Long) periodPositionUs.second).longValue()), ((Long) periodPositionUs.second).longValue());
        }
    }

    @Override // androidx.media3.exoplayer.source.WrappingMediaSource, androidx.media3.exoplayer.source.MediaSource
    public PreloadMediaPeriod createPeriod(MediaSource.MediaPeriodId mediaPeriodId, Allocator allocator, long j) {
        MediaPeriodKey mediaPeriodKey = new MediaPeriodKey(mediaPeriodId, j);
        Pair<PreloadMediaPeriod, MediaPeriodKey> pair = this.preloadingMediaPeriodAndKey;
        if (pair != null && mediaPeriodKey.equals(pair.second)) {
            PreloadMediaPeriod preloadMediaPeriod = (PreloadMediaPeriod) ((Pair) Assertions.checkNotNull(this.preloadingMediaPeriodAndKey)).first;
            if (isUsedByPlayer()) {
                this.preloadingMediaPeriodAndKey = null;
                this.playingPreloadedMediaPeriodAndId = new Pair<>(preloadMediaPeriod, mediaPeriodId);
            }
            return preloadMediaPeriod;
        }
        if (this.preloadingMediaPeriodAndKey != null) {
            this.mediaSource.releasePeriod(((PreloadMediaPeriod) ((Pair) Assertions.checkNotNull(this.preloadingMediaPeriodAndKey)).first).mediaPeriod);
            this.preloadingMediaPeriodAndKey = null;
        }
        PreloadMediaPeriod preloadMediaPeriod2 = new PreloadMediaPeriod(this.mediaSource.createPeriod(mediaPeriodId, allocator, j));
        if (!isUsedByPlayer()) {
            this.preloadingMediaPeriodAndKey = new Pair<>(preloadMediaPeriod2, mediaPeriodKey);
        }
        return preloadMediaPeriod2;
    }

    @Override // androidx.media3.exoplayer.source.WrappingMediaSource
    protected MediaSource.MediaPeriodId getMediaPeriodIdForChildMediaPeriodId(MediaSource.MediaPeriodId mediaPeriodId) {
        Pair<PreloadMediaPeriod, MediaSource.MediaPeriodId> pair = this.playingPreloadedMediaPeriodAndId;
        return (pair == null || !mediaPeriodIdEqualsWithoutWindowSequenceNumber(mediaPeriodId, (MediaSource.MediaPeriodId) ((Pair) Assertions.checkNotNull(pair)).second)) ? mediaPeriodId : (MediaSource.MediaPeriodId) ((Pair) Assertions.checkNotNull(this.playingPreloadedMediaPeriodAndId)).second;
    }

    @Override // androidx.media3.exoplayer.source.WrappingMediaSource, androidx.media3.exoplayer.source.MediaSource
    public void releasePeriod(MediaPeriod mediaPeriod) {
        PreloadMediaPeriod preloadMediaPeriod = (PreloadMediaPeriod) mediaPeriod;
        Pair<PreloadMediaPeriod, MediaPeriodKey> pair = this.preloadingMediaPeriodAndKey;
        if (pair != null && preloadMediaPeriod == ((Pair) Assertions.checkNotNull(pair)).first) {
            this.preloadingMediaPeriodAndKey = null;
        } else {
            Pair<PreloadMediaPeriod, MediaSource.MediaPeriodId> pair2 = this.playingPreloadedMediaPeriodAndId;
            if (pair2 != null && preloadMediaPeriod == ((Pair) Assertions.checkNotNull(pair2)).first) {
                this.playingPreloadedMediaPeriodAndId = null;
            }
        }
        this.mediaSource.releasePeriod(preloadMediaPeriod.mediaPeriod);
    }

    @Override // androidx.media3.exoplayer.source.CompositeMediaSource, androidx.media3.exoplayer.source.BaseMediaSource
    protected void releaseSourceInternal() {
        if (isUsedByPlayer()) {
            return;
        }
        this.onUsedByPlayerNotified = false;
        if (this.preloadCalled) {
            return;
        }
        this.timeline = null;
        this.prepareChildSourceCalled = false;
        super.releaseSourceInternal();
    }

    public void releasePreloadMediaSource() {
        this.preloadHandler.post(new Runnable() { // from class: androidx.media3.exoplayer.source.preload.PreloadMediaSource$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m298xd9831bcd();
            }
        });
    }

    /* renamed from: lambda$releasePreloadMediaSource$3$androidx-media3-exoplayer-source-preload-PreloadMediaSource, reason: not valid java name */
    /* synthetic */ void m298xd9831bcd() {
        this.preloadCalled = false;
        this.startPositionUs = C.TIME_UNSET;
        this.onSourcePreparedNotified = false;
        if (this.preloadingMediaPeriodAndKey != null) {
            this.mediaSource.releasePeriod(((PreloadMediaPeriod) this.preloadingMediaPeriodAndKey.first).mediaPeriod);
            this.preloadingMediaPeriodAndKey = null;
        }
        releaseSourceInternal();
        this.preloadHandler.removeCallbacksAndMessages(null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    class PreloadMediaPeriodCallback implements MediaPeriod.Callback {
        private final long periodStartPositionUs;
        private boolean prepared;

        public PreloadMediaPeriodCallback(long j) {
            this.periodStartPositionUs = j;
        }

        @Override // androidx.media3.exoplayer.source.MediaPeriod.Callback
        public void onPrepared(final MediaPeriod mediaPeriod) {
            this.prepared = true;
            PreloadMediaSource.this.preloadHandler.post(new Runnable() { // from class: androidx.media3.exoplayer.source.preload.PreloadMediaSource$PreloadMediaPeriodCallback$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m300x5a2a8722(mediaPeriod);
                }
            });
        }

        /* renamed from: lambda$onPrepared$0$androidx-media3-exoplayer-source-preload-PreloadMediaSource$PreloadMediaPeriodCallback, reason: not valid java name */
        /* synthetic */ void m300x5a2a8722(MediaPeriod mediaPeriod) {
            TrackSelectorResult trackSelectorResultSelectTracks;
            if (PreloadMediaSource.this.isUsedByPlayer()) {
                return;
            }
            PreloadMediaPeriod preloadMediaPeriod = (PreloadMediaPeriod) mediaPeriod;
            try {
                trackSelectorResultSelectTracks = PreloadMediaSource.this.trackSelector.selectTracks(PreloadMediaSource.this.rendererCapabilities, preloadMediaPeriod.getTrackGroups(), ((MediaPeriodKey) ((Pair) Assertions.checkNotNull(PreloadMediaSource.this.preloadingMediaPeriodAndKey)).second).mediaPeriodId, (Timeline) Assertions.checkNotNull(PreloadMediaSource.this.timeline));
            } catch (ExoPlaybackException e) {
                Log.e(PreloadMediaSource.TAG, "Failed to select tracks", e);
                trackSelectorResultSelectTracks = null;
            }
            if (trackSelectorResultSelectTracks != null) {
                preloadMediaPeriod.selectTracksForPreloading(trackSelectorResultSelectTracks.selections, this.periodStartPositionUs);
                if (PreloadMediaSource.this.preloadControl.onTracksSelected(PreloadMediaSource.this)) {
                    preloadMediaPeriod.continueLoading(new LoadingInfo.Builder().setPlaybackPositionUs(this.periodStartPositionUs).build());
                }
            }
        }

        @Override // androidx.media3.exoplayer.source.SequenceableLoader.Callback
        public void onContinueLoadingRequested(final MediaPeriod mediaPeriod) {
            PreloadMediaSource.this.preloadHandler.post(new Runnable() { // from class: androidx.media3.exoplayer.source.preload.PreloadMediaSource$PreloadMediaPeriodCallback$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m299xba37e565(mediaPeriod);
                }
            });
        }

        /* renamed from: lambda$onContinueLoadingRequested$1$androidx-media3-exoplayer-source-preload-PreloadMediaSource$PreloadMediaPeriodCallback, reason: not valid java name */
        /* synthetic */ void m299xba37e565(MediaPeriod mediaPeriod) {
            if (PreloadMediaSource.this.isUsedByPlayer()) {
                return;
            }
            PreloadMediaPeriod preloadMediaPeriod = (PreloadMediaPeriod) mediaPeriod;
            if (this.prepared && mediaPeriod.getBufferedPositionUs() == Long.MIN_VALUE) {
                PreloadMediaSource.this.preloadControl.onLoadedToTheEndOfSource(PreloadMediaSource.this);
            } else if (!this.prepared || PreloadMediaSource.this.preloadControl.onContinueLoadingRequested(PreloadMediaSource.this, preloadMediaPeriod.getBufferedPositionUs())) {
                preloadMediaPeriod.continueLoading(new LoadingInfo.Builder().setPlaybackPositionUs(this.periodStartPositionUs).build());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isUsedByPlayer() {
        return prepareSourceCalled();
    }

    private void notifyOnUsedByPlayer() {
        this.preloadControl.onUsedByPlayer(this);
        this.onUsedByPlayerNotified = true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean mediaPeriodIdEqualsWithoutWindowSequenceNumber(MediaSource.MediaPeriodId mediaPeriodId, MediaSource.MediaPeriodId mediaPeriodId2) {
        return mediaPeriodId.periodUid.equals(mediaPeriodId2.periodUid) && mediaPeriodId.adGroupIndex == mediaPeriodId2.adGroupIndex && mediaPeriodId.adIndexInAdGroup == mediaPeriodId2.adIndexInAdGroup && mediaPeriodId.nextAdGroupIndex == mediaPeriodId2.nextAdGroupIndex;
    }

    private static class MediaPeriodKey {
        public final MediaSource.MediaPeriodId mediaPeriodId;
        private final Long startPositionUs;

        public MediaPeriodKey(MediaSource.MediaPeriodId mediaPeriodId, long j) {
            this.mediaPeriodId = mediaPeriodId;
            this.startPositionUs = Long.valueOf(j);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof MediaPeriodKey)) {
                return false;
            }
            MediaPeriodKey mediaPeriodKey = (MediaPeriodKey) obj;
            return PreloadMediaSource.mediaPeriodIdEqualsWithoutWindowSequenceNumber(this.mediaPeriodId, mediaPeriodKey.mediaPeriodId) && this.startPositionUs.equals(mediaPeriodKey.startPositionUs);
        }

        public int hashCode() {
            return ((((((((527 + this.mediaPeriodId.periodUid.hashCode()) * 31) + this.mediaPeriodId.adGroupIndex) * 31) + this.mediaPeriodId.adIndexInAdGroup) * 31) + this.mediaPeriodId.nextAdGroupIndex) * 31) + this.startPositionUs.intValue();
        }
    }
}
