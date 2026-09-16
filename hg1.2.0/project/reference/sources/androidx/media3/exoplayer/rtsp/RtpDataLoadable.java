package androidx.media3.exoplayer.rtsp;

import android.os.Handler;
import androidx.media3.common.C;
import androidx.media3.common.DataReader;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;
import androidx.media3.datasource.DataSourceUtil;
import androidx.media3.exoplayer.rtsp.RtpDataChannel;
import androidx.media3.exoplayer.upstream.Loader;
import androidx.media3.extractor.DefaultExtractorInput;
import androidx.media3.extractor.ExtractorInput;
import androidx.media3.extractor.ExtractorOutput;
import androidx.media3.extractor.PositionHolder;
import java.io.IOException;

/* loaded from: classes.dex */
final class RtpDataLoadable implements Loader.Loadable {
    private RtpDataChannel dataChannel;
    private final EventListener eventListener;
    private RtpExtractor extractor;
    private DefaultExtractorInput extractorInput;
    private volatile boolean loadCancelled;
    private volatile long nextRtpTimestamp;
    private final ExtractorOutput output;
    private final RtpDataChannel.Factory rtpDataChannelFactory;
    public final RtspMediaTrack rtspMediaTrack;
    public final int trackId;
    private final Handler playbackThreadHandler = Util.createHandlerForCurrentLooper();
    private volatile long pendingSeekPositionUs = C.TIME_UNSET;

    public interface EventListener {
        void onTransportReady(String str, RtpDataChannel rtpDataChannel);
    }

    public RtpDataLoadable(int i, RtspMediaTrack rtspMediaTrack, EventListener eventListener, ExtractorOutput extractorOutput, RtpDataChannel.Factory factory) {
        this.trackId = i;
        this.rtspMediaTrack = rtspMediaTrack;
        this.eventListener = eventListener;
        this.output = extractorOutput;
        this.rtpDataChannelFactory = factory;
    }

    public void setTimestamp(long j) {
        if (j == C.TIME_UNSET || ((RtpExtractor) Assertions.checkNotNull(this.extractor)).hasReadFirstRtpPacket()) {
            return;
        }
        this.extractor.setFirstTimestamp(j);
    }

    public void setSequenceNumber(int i) {
        if (((RtpExtractor) Assertions.checkNotNull(this.extractor)).hasReadFirstRtpPacket()) {
            return;
        }
        this.extractor.setFirstSequenceNumber(i);
    }

    @Override // androidx.media3.exoplayer.upstream.Loader.Loadable
    public void cancelLoad() {
        this.loadCancelled = true;
    }

    @Override // androidx.media3.exoplayer.upstream.Loader.Loadable
    public void load() throws IOException {
        if (this.loadCancelled) {
            this.loadCancelled = false;
        }
        try {
            if (this.dataChannel == null) {
                RtpDataChannel rtpDataChannelCreateAndOpenDataChannel = this.rtpDataChannelFactory.createAndOpenDataChannel(this.trackId);
                this.dataChannel = rtpDataChannelCreateAndOpenDataChannel;
                final String transport = rtpDataChannelCreateAndOpenDataChannel.getTransport();
                final RtpDataChannel rtpDataChannel = this.dataChannel;
                this.playbackThreadHandler.post(new Runnable() { // from class: androidx.media3.exoplayer.rtsp.RtpDataLoadable$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.f$0.m267lambda$load$0$androidxmedia3exoplayerrtspRtpDataLoadable(transport, rtpDataChannel);
                    }
                });
                this.extractorInput = new DefaultExtractorInput((DataReader) Assertions.checkNotNull(this.dataChannel), 0L, -1L);
                RtpExtractor rtpExtractor = new RtpExtractor(this.rtspMediaTrack.payloadFormat, this.trackId);
                this.extractor = rtpExtractor;
                rtpExtractor.init(this.output);
            }
            while (!this.loadCancelled) {
                if (this.pendingSeekPositionUs != C.TIME_UNSET) {
                    ((RtpExtractor) Assertions.checkNotNull(this.extractor)).seek(this.nextRtpTimestamp, this.pendingSeekPositionUs);
                    this.pendingSeekPositionUs = C.TIME_UNSET;
                }
                if (((RtpExtractor) Assertions.checkNotNull(this.extractor)).read((ExtractorInput) Assertions.checkNotNull(this.extractorInput), new PositionHolder()) == -1) {
                    break;
                }
            }
            this.loadCancelled = false;
        } finally {
            if (((RtpDataChannel) Assertions.checkNotNull(this.dataChannel)).needsClosingOnLoadCompletion()) {
                DataSourceUtil.closeQuietly(this.dataChannel);
                this.dataChannel = null;
            }
        }
    }

    /* renamed from: lambda$load$0$androidx-media3-exoplayer-rtsp-RtpDataLoadable, reason: not valid java name */
    /* synthetic */ void m267lambda$load$0$androidxmedia3exoplayerrtspRtpDataLoadable(String str, RtpDataChannel rtpDataChannel) {
        this.eventListener.onTransportReady(str, rtpDataChannel);
    }

    public void resetForSeek() {
        ((RtpExtractor) Assertions.checkNotNull(this.extractor)).preSeek();
    }

    public void seekToUs(long j, long j2) {
        this.pendingSeekPositionUs = j;
        this.nextRtpTimestamp = j2;
    }
}
