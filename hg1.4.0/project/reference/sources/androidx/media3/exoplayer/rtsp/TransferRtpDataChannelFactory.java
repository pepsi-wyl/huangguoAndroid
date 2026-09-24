package androidx.media3.exoplayer.rtsp;

import androidx.media3.exoplayer.rtsp.RtpDataChannel;

/* loaded from: classes.dex */
final class TransferRtpDataChannelFactory implements RtpDataChannel.Factory {
    private static final int INTERLEAVED_CHANNELS_PER_TRACK = 2;
    private final long timeoutMs;

    @Override // androidx.media3.exoplayer.rtsp.RtpDataChannel.Factory
    public /* synthetic */ RtpDataChannel.Factory createFallbackDataChannelFactory() {
        return RtpDataChannel.Factory.CC.$default$createFallbackDataChannelFactory(this);
    }

    public TransferRtpDataChannelFactory(long j) {
        this.timeoutMs = j;
    }

    @Override // androidx.media3.exoplayer.rtsp.RtpDataChannel.Factory
    public RtpDataChannel createAndOpenDataChannel(int i) {
        TransferRtpDataChannel transferRtpDataChannel = new TransferRtpDataChannel(this.timeoutMs);
        transferRtpDataChannel.open(RtpUtils.getIncomingRtpDataSpec(i * 2));
        return transferRtpDataChannel;
    }
}
