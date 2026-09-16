package androidx.media3.exoplayer.rtsp.reader;

import androidx.media3.common.C;
import androidx.media3.common.ParserException;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Log;
import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.common.util.Util;
import androidx.media3.container.NalUnitUtil;
import androidx.media3.exoplayer.rtsp.RtpPayloadFormat;
import androidx.media3.extractor.ExtractorOutput;
import androidx.media3.extractor.TrackOutput;
import com.google.common.primitives.SignedBytes;
import kotlinx.coroutines.scheduling.WorkQueueKt;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: classes.dex */
final class RtpH265Reader implements RtpPayloadReader {
    private static final int FU_PAYLOAD_OFFSET = 3;
    private static final int MEDIA_CLOCK_FREQUENCY = 90000;
    private static final int NAL_IDR_N_LP = 20;
    private static final int NAL_IDR_W_RADL = 19;
    private static final int RTP_PACKET_TYPE_AP = 48;
    private static final int RTP_PACKET_TYPE_FU = 49;
    private static final String TAG = "RtpH265Reader";
    private int bufferFlags;
    private int fragmentedSampleSizeBytes;
    private final RtpPayloadFormat payloadFormat;
    private long startTimeOffsetUs;
    private TrackOutput trackOutput;
    private final ParsableByteArray fuScratchBuffer = new ParsableByteArray();
    private final ParsableByteArray nalStartCodeArray = new ParsableByteArray(NalUnitUtil.NAL_START_CODE);
    private long firstReceivedTimestamp = C.TIME_UNSET;
    private int previousSequenceNumber = -1;

    private static int getBufferFlagsFromNalType(int i) {
        return (i == 19 || i == 20) ? 1 : 0;
    }

    @Override // androidx.media3.exoplayer.rtsp.reader.RtpPayloadReader
    public void onReceivingFirstPacket(long j, int i) {
    }

    public RtpH265Reader(RtpPayloadFormat rtpPayloadFormat) {
        this.payloadFormat = rtpPayloadFormat;
    }

    @Override // androidx.media3.exoplayer.rtsp.reader.RtpPayloadReader
    public void createTracks(ExtractorOutput extractorOutput, int i) {
        TrackOutput trackOutputTrack = extractorOutput.track(i, 2);
        this.trackOutput = trackOutputTrack;
        trackOutputTrack.format(this.payloadFormat.format);
    }

    @Override // androidx.media3.exoplayer.rtsp.reader.RtpPayloadReader
    public void consume(ParsableByteArray parsableByteArray, long j, int i, boolean z) throws ParserException {
        if (parsableByteArray.getData().length == 0) {
            throw ParserException.createForMalformedManifest("Empty RTP data packet.", null);
        }
        int i2 = (parsableByteArray.getData()[0] >> 1) & 63;
        Assertions.checkStateNotNull(this.trackOutput);
        if (i2 >= 0 && i2 < RTP_PACKET_TYPE_AP) {
            processSingleNalUnitPacket(parsableByteArray);
        } else {
            if (i2 == RTP_PACKET_TYPE_AP) {
                throw new UnsupportedOperationException("need to implement processAggregationPacket");
            }
            if (i2 == RTP_PACKET_TYPE_FU) {
                processFragmentationUnitPacket(parsableByteArray, i);
            } else {
                throw ParserException.createForMalformedManifest(String.format("RTP H265 payload type [%d] not supported.", Integer.valueOf(i2)), null);
            }
        }
        if (z) {
            if (this.firstReceivedTimestamp == C.TIME_UNSET) {
                this.firstReceivedTimestamp = j;
            }
            this.trackOutput.sampleMetadata(RtpReaderUtils.toSampleTimeUs(this.startTimeOffsetUs, j, this.firstReceivedTimestamp, MEDIA_CLOCK_FREQUENCY), this.bufferFlags, this.fragmentedSampleSizeBytes, 0, null);
            this.fragmentedSampleSizeBytes = 0;
        }
        this.previousSequenceNumber = i;
    }

    @Override // androidx.media3.exoplayer.rtsp.reader.RtpPayloadReader
    public void seek(long j, long j2) {
        this.firstReceivedTimestamp = j;
        this.fragmentedSampleSizeBytes = 0;
        this.startTimeOffsetUs = j2;
    }

    @RequiresNonNull({"trackOutput"})
    private void processSingleNalUnitPacket(ParsableByteArray parsableByteArray) {
        int iBytesLeft = parsableByteArray.bytesLeft();
        this.fragmentedSampleSizeBytes += writeStartCode();
        this.trackOutput.sampleData(parsableByteArray, iBytesLeft);
        this.fragmentedSampleSizeBytes += iBytesLeft;
        this.bufferFlags = getBufferFlagsFromNalType((parsableByteArray.getData()[0] >> 1) & 63);
    }

    @RequiresNonNull({"trackOutput"})
    private void processFragmentationUnitPacket(ParsableByteArray parsableByteArray, int i) throws ParserException {
        if (parsableByteArray.getData().length < 3) {
            throw ParserException.createForMalformedManifest("Malformed FU header.", null);
        }
        int i2 = parsableByteArray.getData()[1] & 7;
        byte b = parsableByteArray.getData()[2];
        int i3 = b & 63;
        boolean z = (b & 128) > 0;
        boolean z2 = (b & SignedBytes.MAX_POWER_OF_TWO) > 0;
        if (z) {
            this.fragmentedSampleSizeBytes += writeStartCode();
            parsableByteArray.getData()[1] = (byte) ((i3 << 1) & WorkQueueKt.MASK);
            parsableByteArray.getData()[2] = (byte) i2;
            this.fuScratchBuffer.reset(parsableByteArray.getData());
            this.fuScratchBuffer.setPosition(1);
        } else {
            int i4 = (this.previousSequenceNumber + 1) % 65535;
            if (i != i4) {
                Log.w(TAG, Util.formatInvariant("Received RTP packet with unexpected sequence number. Expected: %d; received: %d. Dropping packet.", Integer.valueOf(i4), Integer.valueOf(i)));
                return;
            } else {
                this.fuScratchBuffer.reset(parsableByteArray.getData());
                this.fuScratchBuffer.setPosition(3);
            }
        }
        int iBytesLeft = this.fuScratchBuffer.bytesLeft();
        this.trackOutput.sampleData(this.fuScratchBuffer, iBytesLeft);
        this.fragmentedSampleSizeBytes += iBytesLeft;
        if (z2) {
            this.bufferFlags = getBufferFlagsFromNalType(i3);
        }
    }

    private int writeStartCode() {
        this.nalStartCodeArray.setPosition(0);
        int iBytesLeft = this.nalStartCodeArray.bytesLeft();
        ((TrackOutput) Assertions.checkNotNull(this.trackOutput)).sampleData(this.nalStartCodeArray, iBytesLeft);
        return iBytesLeft;
    }
}
