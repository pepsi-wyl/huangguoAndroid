package androidx.media3.exoplayer.rtsp;

import androidx.media3.datasource.DataSource;
import androidx.media3.exoplayer.rtsp.RtspMessageChannel;
import java.io.IOException;

/* loaded from: classes.dex */
interface RtpDataChannel extends DataSource {

    public interface Factory {

        /* renamed from: androidx.media3.exoplayer.rtsp.RtpDataChannel$Factory$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static Factory $default$createFallbackDataChannelFactory(Factory _this) {
                return null;
            }
        }

        RtpDataChannel createAndOpenDataChannel(int i) throws IOException;

        Factory createFallbackDataChannelFactory();
    }

    RtspMessageChannel.InterleavedBinaryDataListener getInterleavedBinaryDataListener();

    int getLocalPort();

    String getTransport();

    boolean needsClosingOnLoadCompletion();
}
