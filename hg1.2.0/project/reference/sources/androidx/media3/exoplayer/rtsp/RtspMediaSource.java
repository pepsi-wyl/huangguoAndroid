package androidx.media3.exoplayer.rtsp;

import android.net.Uri;
import androidx.media3.common.C;
import androidx.media3.common.MediaItem;
import androidx.media3.common.MediaLibraryInfo;
import androidx.media3.common.Timeline;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;
import androidx.media3.datasource.TransferListener;
import androidx.media3.exoplayer.drm.DrmSessionManagerProvider;
import androidx.media3.exoplayer.rtsp.RtpDataChannel;
import androidx.media3.exoplayer.rtsp.RtspMediaPeriod;
import androidx.media3.exoplayer.source.BaseMediaSource;
import androidx.media3.exoplayer.source.ForwardingTimeline;
import androidx.media3.exoplayer.source.MediaPeriod;
import androidx.media3.exoplayer.source.MediaSource;
import androidx.media3.exoplayer.source.MediaSourceFactory;
import androidx.media3.exoplayer.source.SinglePeriodTimeline;
import androidx.media3.exoplayer.upstream.Allocator;
import androidx.media3.exoplayer.upstream.CmcdConfiguration;
import androidx.media3.exoplayer.upstream.LoadErrorHandlingPolicy;
import androidx.media3.extractor.text.SubtitleParser;
import java.io.IOException;
import javax.net.SocketFactory;

/* loaded from: classes.dex */
public final class RtspMediaSource extends BaseMediaSource {
    public static final long DEFAULT_TIMEOUT_MS = 8000;
    private final boolean debugLoggingEnabled;
    private MediaItem mediaItem;
    private final RtpDataChannel.Factory rtpDataChannelFactory;
    private final SocketFactory socketFactory;
    private boolean timelineIsLive;
    private boolean timelineIsSeekable;
    private final Uri uri;
    private final String userAgent;
    private long timelineDurationUs = C.TIME_UNSET;
    private boolean timelineIsPlaceholder = true;

    @Override // androidx.media3.exoplayer.source.MediaSource
    public void maybeThrowSourceInfoRefreshError() {
    }

    @Override // androidx.media3.exoplayer.source.BaseMediaSource
    protected void releaseSourceInternal() {
    }

    static {
        MediaLibraryInfo.registerModule("media3.exoplayer.rtsp");
    }

    public static final class Factory implements MediaSourceFactory {
        private boolean debugLoggingEnabled;
        private boolean forceUseRtpTcp;
        private long timeoutMs = RtspMediaSource.DEFAULT_TIMEOUT_MS;
        private String userAgent = MediaLibraryInfo.VERSION_SLASHY;
        private SocketFactory socketFactory = SocketFactory.getDefault();

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public /* synthetic */ MediaSource.Factory experimentalParseSubtitlesDuringExtraction(boolean z) {
            return MediaSource.Factory.CC.$default$experimentalParseSubtitlesDuringExtraction(this, z);
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public /* synthetic */ MediaSource.Factory setCmcdConfigurationFactory(CmcdConfiguration.Factory factory) {
            return MediaSource.Factory.CC.$default$setCmcdConfigurationFactory(this, factory);
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public Factory setDrmSessionManagerProvider(DrmSessionManagerProvider drmSessionManagerProvider) {
            return this;
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public Factory setLoadErrorHandlingPolicy(LoadErrorHandlingPolicy loadErrorHandlingPolicy) {
            return this;
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public /* synthetic */ MediaSource.Factory setSubtitleParserFactory(SubtitleParser.Factory factory) {
            return MediaSource.Factory.CC.$default$setSubtitleParserFactory(this, factory);
        }

        public Factory setForceUseRtpTcp(boolean z) {
            this.forceUseRtpTcp = z;
            return this;
        }

        public Factory setUserAgent(String str) {
            this.userAgent = str;
            return this;
        }

        public Factory setSocketFactory(SocketFactory socketFactory) {
            this.socketFactory = socketFactory;
            return this;
        }

        public Factory setDebugLoggingEnabled(boolean z) {
            this.debugLoggingEnabled = z;
            return this;
        }

        public Factory setTimeoutMs(long j) {
            Assertions.checkArgument(j > 0);
            this.timeoutMs = j;
            return this;
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public int[] getSupportedTypes() {
            return new int[]{3};
        }

        @Override // androidx.media3.exoplayer.source.MediaSource.Factory
        public RtspMediaSource createMediaSource(MediaItem mediaItem) {
            RtpDataChannel.Factory udpDataSourceRtpDataChannelFactory;
            Assertions.checkNotNull(mediaItem.localConfiguration);
            if (this.forceUseRtpTcp) {
                udpDataSourceRtpDataChannelFactory = new TransferRtpDataChannelFactory(this.timeoutMs);
            } else {
                udpDataSourceRtpDataChannelFactory = new UdpDataSourceRtpDataChannelFactory(this.timeoutMs);
            }
            return new RtspMediaSource(mediaItem, udpDataSourceRtpDataChannelFactory, this.userAgent, this.socketFactory, this.debugLoggingEnabled);
        }
    }

    public static class RtspPlaybackException extends IOException {
        public RtspPlaybackException(String str) {
            super(str);
        }

        public RtspPlaybackException(Throwable th) {
            super(th);
        }

        public RtspPlaybackException(String str, Throwable th) {
            super(str, th);
        }
    }

    public static final class RtspUdpUnsupportedTransportException extends RtspPlaybackException {
        public RtspUdpUnsupportedTransportException(String str) {
            super(str);
        }
    }

    RtspMediaSource(MediaItem mediaItem, RtpDataChannel.Factory factory, String str, SocketFactory socketFactory, boolean z) {
        this.mediaItem = mediaItem;
        this.rtpDataChannelFactory = factory;
        this.userAgent = str;
        this.uri = ((MediaItem.LocalConfiguration) Assertions.checkNotNull(mediaItem.localConfiguration)).uri;
        this.socketFactory = socketFactory;
        this.debugLoggingEnabled = z;
    }

    @Override // androidx.media3.exoplayer.source.BaseMediaSource
    protected void prepareSourceInternal(TransferListener transferListener) {
        notifySourceInfoRefreshed();
    }

    @Override // androidx.media3.exoplayer.source.MediaSource
    public synchronized MediaItem getMediaItem() {
        return this.mediaItem;
    }

    @Override // androidx.media3.exoplayer.source.BaseMediaSource, androidx.media3.exoplayer.source.MediaSource
    public boolean canUpdateMediaItem(MediaItem mediaItem) {
        MediaItem.LocalConfiguration localConfiguration = mediaItem.localConfiguration;
        return localConfiguration != null && localConfiguration.uri.equals(this.uri);
    }

    @Override // androidx.media3.exoplayer.source.BaseMediaSource, androidx.media3.exoplayer.source.MediaSource
    public synchronized void updateMediaItem(MediaItem mediaItem) {
        this.mediaItem = mediaItem;
    }

    @Override // androidx.media3.exoplayer.source.MediaSource
    public MediaPeriod createPeriod(MediaSource.MediaPeriodId mediaPeriodId, Allocator allocator, long j) {
        return new RtspMediaPeriod(allocator, this.rtpDataChannelFactory, this.uri, new RtspMediaPeriod.Listener() { // from class: androidx.media3.exoplayer.rtsp.RtspMediaSource.1
            @Override // androidx.media3.exoplayer.rtsp.RtspMediaPeriod.Listener
            public void onSourceInfoRefreshed(RtspSessionTiming rtspSessionTiming) {
                RtspMediaSource.this.timelineDurationUs = Util.msToUs(rtspSessionTiming.getDurationMs());
                RtspMediaSource.this.timelineIsSeekable = !rtspSessionTiming.isLive();
                RtspMediaSource.this.timelineIsLive = rtspSessionTiming.isLive();
                RtspMediaSource.this.timelineIsPlaceholder = false;
                RtspMediaSource.this.notifySourceInfoRefreshed();
            }

            @Override // androidx.media3.exoplayer.rtsp.RtspMediaPeriod.Listener
            public void onSeekingUnsupported() {
                RtspMediaSource.this.timelineIsSeekable = false;
                RtspMediaSource.this.notifySourceInfoRefreshed();
            }
        }, this.userAgent, this.socketFactory, this.debugLoggingEnabled);
    }

    @Override // androidx.media3.exoplayer.source.MediaSource
    public void releasePeriod(MediaPeriod mediaPeriod) throws IOException {
        ((RtspMediaPeriod) mediaPeriod).release();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifySourceInfoRefreshed() {
        Timeline singlePeriodTimeline = new SinglePeriodTimeline(this.timelineDurationUs, this.timelineIsSeekable, false, this.timelineIsLive, (Object) null, getMediaItem());
        if (this.timelineIsPlaceholder) {
            singlePeriodTimeline = new ForwardingTimeline(singlePeriodTimeline) { // from class: androidx.media3.exoplayer.rtsp.RtspMediaSource.2
                @Override // androidx.media3.exoplayer.source.ForwardingTimeline, androidx.media3.common.Timeline
                public Timeline.Window getWindow(int i, Timeline.Window window, long j) {
                    super.getWindow(i, window, j);
                    window.isPlaceholder = true;
                    return window;
                }

                @Override // androidx.media3.exoplayer.source.ForwardingTimeline, androidx.media3.common.Timeline
                public Timeline.Period getPeriod(int i, Timeline.Period period, boolean z) {
                    super.getPeriod(i, period, z);
                    period.isPlaceholder = true;
                    return period;
                }
            };
        }
        refreshSourceInfo(singlePeriodTimeline);
    }
}
