package androidx.media3.exoplayer.dash;

import androidx.media3.common.C;
import androidx.media3.common.Format;
import androidx.media3.common.util.Util;
import androidx.media3.decoder.DecoderInputBuffer;
import androidx.media3.exoplayer.FormatHolder;
import androidx.media3.exoplayer.dash.manifest.EventStream;
import androidx.media3.exoplayer.source.SampleStream;
import androidx.media3.extractor.metadata.emsg.EventMessageEncoder;
import java.io.IOException;

/* loaded from: classes.dex */
final class EventSampleStream implements SampleStream {
    private int currentIndex;
    private EventStream eventStream;
    private boolean eventStreamAppendable;
    private long[] eventTimesUs;
    private boolean isFormatSentDownstream;
    private final Format upstreamFormat;
    private final EventMessageEncoder eventMessageEncoder = new EventMessageEncoder();
    private long pendingSeekPositionUs = C.TIME_UNSET;

    @Override // androidx.media3.exoplayer.source.SampleStream
    public boolean isReady() {
        return true;
    }

    @Override // androidx.media3.exoplayer.source.SampleStream
    public void maybeThrowError() throws IOException {
    }

    public EventSampleStream(EventStream eventStream, Format format, boolean z) {
        this.upstreamFormat = format;
        this.eventStream = eventStream;
        this.eventTimesUs = eventStream.presentationTimesUs;
        updateEventStream(eventStream, z);
    }

    public String eventStreamId() {
        return this.eventStream.id();
    }

    public void updateEventStream(EventStream eventStream, boolean z) {
        int i = this.currentIndex;
        long j = i == 0 ? -9223372036854775807L : this.eventTimesUs[i - 1];
        this.eventStreamAppendable = z;
        this.eventStream = eventStream;
        long[] jArr = eventStream.presentationTimesUs;
        this.eventTimesUs = jArr;
        long j2 = this.pendingSeekPositionUs;
        if (j2 != C.TIME_UNSET) {
            seekToUs(j2);
        } else if (j != C.TIME_UNSET) {
            this.currentIndex = Util.binarySearchCeil(jArr, j, false, false);
        }
    }

    public void seekToUs(long j) {
        int iBinarySearchCeil = Util.binarySearchCeil(this.eventTimesUs, j, true, false);
        this.currentIndex = iBinarySearchCeil;
        if (!this.eventStreamAppendable || iBinarySearchCeil != this.eventTimesUs.length) {
            j = C.TIME_UNSET;
        }
        this.pendingSeekPositionUs = j;
    }

    @Override // androidx.media3.exoplayer.source.SampleStream
    public int readData(FormatHolder formatHolder, DecoderInputBuffer decoderInputBuffer, int i) throws IOException {
        int i2 = this.currentIndex;
        boolean z = i2 == this.eventTimesUs.length;
        if (z && !this.eventStreamAppendable) {
            decoderInputBuffer.setFlags(4);
            return -4;
        }
        if ((i & 2) != 0 || !this.isFormatSentDownstream) {
            formatHolder.format = this.upstreamFormat;
            this.isFormatSentDownstream = true;
            return -5;
        }
        if (z) {
            return -3;
        }
        if ((i & 1) == 0) {
            this.currentIndex = i2 + 1;
        }
        if ((i & 4) == 0) {
            byte[] bArrEncode = this.eventMessageEncoder.encode(this.eventStream.events[i2]);
            decoderInputBuffer.ensureSpaceForWrite(bArrEncode.length);
            decoderInputBuffer.data.put(bArrEncode);
        }
        decoderInputBuffer.timeUs = this.eventTimesUs[i2];
        decoderInputBuffer.setFlags(1);
        return -4;
    }

    @Override // androidx.media3.exoplayer.source.SampleStream
    public int skipData(long j) {
        int iMax = Math.max(this.currentIndex, Util.binarySearchCeil(this.eventTimesUs, j, true, false));
        int i = iMax - this.currentIndex;
        this.currentIndex = iMax;
        return i;
    }
}
