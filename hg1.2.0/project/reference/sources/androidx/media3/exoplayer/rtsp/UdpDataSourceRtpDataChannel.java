package androidx.media3.exoplayer.rtsp;

import android.net.Uri;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;
import androidx.media3.datasource.DataSpec;
import androidx.media3.datasource.TransferListener;
import androidx.media3.datasource.UdpDataSource;
import androidx.media3.exoplayer.rtsp.RtspMessageChannel;
import com.google.common.primitives.Ints;
import java.io.IOException;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
final class UdpDataSourceRtpDataChannel implements RtpDataChannel {
    private static final String DEFAULT_UDP_TRANSPORT_FORMAT = "RTP/AVP;unicast;client_port=%d-%d";
    private final UdpDataSource dataSource;
    private UdpDataSourceRtpDataChannel rtcpChannel;

    @Override // androidx.media3.exoplayer.rtsp.RtpDataChannel
    public RtspMessageChannel.InterleavedBinaryDataListener getInterleavedBinaryDataListener() {
        return null;
    }

    @Override // androidx.media3.datasource.DataSource
    public /* synthetic */ Map getResponseHeaders() {
        return Collections.emptyMap();
    }

    @Override // androidx.media3.exoplayer.rtsp.RtpDataChannel
    public boolean needsClosingOnLoadCompletion() {
        return true;
    }

    public UdpDataSourceRtpDataChannel(long j) {
        this.dataSource = new UdpDataSource(2000, Ints.checkedCast(j));
    }

    @Override // androidx.media3.exoplayer.rtsp.RtpDataChannel
    public String getTransport() {
        int localPort = getLocalPort();
        Assertions.checkState(localPort != -1);
        return Util.formatInvariant(DEFAULT_UDP_TRANSPORT_FORMAT, Integer.valueOf(localPort), Integer.valueOf(localPort + 1));
    }

    @Override // androidx.media3.exoplayer.rtsp.RtpDataChannel
    public int getLocalPort() {
        int localPort = this.dataSource.getLocalPort();
        if (localPort == -1) {
            return -1;
        }
        return localPort;
    }

    @Override // androidx.media3.datasource.DataSource
    public void addTransferListener(TransferListener transferListener) {
        this.dataSource.addTransferListener(transferListener);
    }

    @Override // androidx.media3.datasource.DataSource
    public long open(DataSpec dataSpec) throws IOException {
        return this.dataSource.open(dataSpec);
    }

    @Override // androidx.media3.datasource.DataSource
    public Uri getUri() {
        return this.dataSource.getUri();
    }

    @Override // androidx.media3.datasource.DataSource
    public void close() throws IOException {
        this.dataSource.close();
        UdpDataSourceRtpDataChannel udpDataSourceRtpDataChannel = this.rtcpChannel;
        if (udpDataSourceRtpDataChannel != null) {
            udpDataSourceRtpDataChannel.close();
        }
    }

    @Override // androidx.media3.common.DataReader
    public int read(byte[] bArr, int i, int i2) throws IOException {
        try {
            return this.dataSource.read(bArr, i, i2);
        } catch (UdpDataSource.UdpDataSourceException e) {
            if (e.reason == 2002) {
                return -1;
            }
            throw e;
        }
    }

    public void setRtcpChannel(UdpDataSourceRtpDataChannel udpDataSourceRtpDataChannel) {
        Assertions.checkArgument(this != udpDataSourceRtpDataChannel);
        this.rtcpChannel = udpDataSourceRtpDataChannel;
    }
}
