package androidx.media3.extractor.ts;

import androidx.media3.common.C;
import androidx.media3.common.Format;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.ParserException;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.ParsableBitArray;
import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.common.util.Util;
import androidx.media3.extractor.ExtractorOutput;
import androidx.media3.extractor.TrackOutput;
import androidx.media3.extractor.ts.MpeghUtil;
import androidx.media3.extractor.ts.TsPayloadReader;
import com.google.common.collect.ImmutableList;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: classes.dex */
public final class MpeghReader implements ElementaryStreamReader {
    private static final int MAX_MHAS_PACKET_HEADER_SIZE = 15;
    private static final int MHAS_SYNC_WORD_LENGTH = 3;
    private static final int MIN_MHAS_PACKET_HEADER_SIZE = 2;
    private static final int STATE_FINDING_SYNC = 0;
    private static final int STATE_READING_PACKET_HEADER = 1;
    private static final int STATE_READING_PACKET_PAYLOAD = 2;
    private boolean configFound;
    private boolean dataPending;
    private int flags;
    private String formatId;
    private int frameBytes;
    private TrackOutput output;
    private int payloadBytesRead;
    private int syncBytes;
    private int truncationSamples;
    private int state = 0;
    private final ParsableByteArray headerScratchBytes = new ParsableByteArray(new byte[15], 2);
    private final ParsableBitArray headerScratchBits = new ParsableBitArray();
    private final ParsableByteArray dataScratchBytes = new ParsableByteArray();
    private MpeghUtil.MhasPacketHeader header = new MpeghUtil.MhasPacketHeader();
    private int samplingRate = C.RATE_UNSET_INT;
    private int standardFrameLength = -1;
    private long mainStreamLabel = -1;
    private boolean rapPending = true;
    private boolean headerDataFinished = true;
    private double timeUs = -9.223372036854776E18d;
    private double timeUsPending = -9.223372036854776E18d;

    private boolean shouldParsePacket(int i) {
        return i == 1 || i == 17;
    }

    @Override // androidx.media3.extractor.ts.ElementaryStreamReader
    public void packetFinished(boolean z) {
    }

    @Override // androidx.media3.extractor.ts.ElementaryStreamReader
    public void seek() {
        this.state = 0;
        this.syncBytes = 0;
        this.headerScratchBytes.reset(2);
        this.payloadBytesRead = 0;
        this.frameBytes = 0;
        this.samplingRate = C.RATE_UNSET_INT;
        this.standardFrameLength = -1;
        this.truncationSamples = 0;
        this.mainStreamLabel = -1L;
        this.configFound = false;
        this.dataPending = false;
        this.headerDataFinished = true;
        this.rapPending = true;
        this.timeUs = -9.223372036854776E18d;
        this.timeUsPending = -9.223372036854776E18d;
    }

    @Override // androidx.media3.extractor.ts.ElementaryStreamReader
    public void createTracks(ExtractorOutput extractorOutput, TsPayloadReader.TrackIdGenerator trackIdGenerator) {
        trackIdGenerator.generateNewId();
        this.formatId = trackIdGenerator.getFormatId();
        this.output = extractorOutput.track(trackIdGenerator.getTrackId(), 1);
    }

    @Override // androidx.media3.extractor.ts.ElementaryStreamReader
    public void packetStarted(long j, int i) {
        this.flags = i;
        if (!this.rapPending && (this.frameBytes != 0 || !this.headerDataFinished)) {
            this.dataPending = true;
        }
        if (j != C.TIME_UNSET) {
            if (this.dataPending) {
                this.timeUsPending = j;
            } else {
                this.timeUs = j;
            }
        }
    }

    @Override // androidx.media3.extractor.ts.ElementaryStreamReader
    public void consume(ParsableByteArray parsableByteArray) throws ParserException {
        Assertions.checkStateNotNull(this.output);
        while (parsableByteArray.bytesLeft() > 0) {
            int i = this.state;
            if (i != 0) {
                if (i == 1) {
                    copyData(parsableByteArray, this.headerScratchBytes, false);
                    if (this.headerScratchBytes.bytesLeft() == 0) {
                        if (parseHeader()) {
                            this.headerScratchBytes.setPosition(0);
                            TrackOutput trackOutput = this.output;
                            ParsableByteArray parsableByteArray2 = this.headerScratchBytes;
                            trackOutput.sampleData(parsableByteArray2, parsableByteArray2.limit());
                            this.headerScratchBytes.reset(2);
                            this.dataScratchBytes.reset(this.header.packetLength);
                            this.headerDataFinished = true;
                            this.state = 2;
                        } else if (this.headerScratchBytes.limit() < 15) {
                            ParsableByteArray parsableByteArray3 = this.headerScratchBytes;
                            parsableByteArray3.setLimit(parsableByteArray3.limit() + 1);
                            this.headerDataFinished = false;
                        }
                    } else {
                        this.headerDataFinished = false;
                    }
                } else if (i == 2) {
                    if (shouldParsePacket(this.header.packetType)) {
                        copyData(parsableByteArray, this.dataScratchBytes, true);
                    }
                    writeSampleData(parsableByteArray);
                    if (this.payloadBytesRead == this.header.packetLength) {
                        if (this.header.packetType == 1) {
                            parseConfig(new ParsableBitArray(this.dataScratchBytes.getData()));
                        } else if (this.header.packetType == 17) {
                            this.truncationSamples = MpeghUtil.parseAudioTruncationInfo(new ParsableBitArray(this.dataScratchBytes.getData()));
                        } else if (this.header.packetType == 2) {
                            finalizeFrame();
                        }
                        this.state = 1;
                    }
                } else {
                    throw new IllegalStateException();
                }
            } else if (skipToNextSync(parsableByteArray)) {
                this.state = 1;
            }
        }
    }

    private void copyData(ParsableByteArray parsableByteArray, ParsableByteArray parsableByteArray2, boolean z) {
        int position = parsableByteArray.getPosition();
        int iMin = Math.min(parsableByteArray.bytesLeft(), parsableByteArray2.bytesLeft());
        parsableByteArray.readBytes(parsableByteArray2.getData(), parsableByteArray2.getPosition(), iMin);
        parsableByteArray2.skipBytes(iMin);
        if (z) {
            parsableByteArray.setPosition(position);
        }
    }

    private boolean skipToNextSync(ParsableByteArray parsableByteArray) {
        int i = this.flags;
        if ((i & 2) == 0) {
            parsableByteArray.setPosition(parsableByteArray.limit());
            return false;
        }
        if ((i & 4) != 0) {
            return true;
        }
        while (parsableByteArray.bytesLeft() > 0) {
            int i2 = this.syncBytes << 8;
            this.syncBytes = i2;
            int unsignedByte = i2 | parsableByteArray.readUnsignedByte();
            this.syncBytes = unsignedByte;
            if (MpeghUtil.isSyncWord(unsignedByte)) {
                parsableByteArray.setPosition(parsableByteArray.getPosition() - 3);
                this.syncBytes = 0;
                return true;
            }
        }
        return false;
    }

    private boolean parseHeader() throws ParserException {
        int iLimit = this.headerScratchBytes.limit();
        this.headerScratchBits.reset(this.headerScratchBytes.getData(), iLimit);
        boolean mhasPacketHeader = MpeghUtil.parseMhasPacketHeader(this.headerScratchBits, this.header);
        if (mhasPacketHeader) {
            this.payloadBytesRead = 0;
            this.frameBytes += this.header.packetLength + iLimit;
        }
        return mhasPacketHeader;
    }

    @RequiresNonNull({"output"})
    private void writeSampleData(ParsableByteArray parsableByteArray) {
        int iMin = Math.min(parsableByteArray.bytesLeft(), this.header.packetLength - this.payloadBytesRead);
        this.output.sampleData(parsableByteArray, iMin);
        this.payloadBytesRead += iMin;
    }

    @RequiresNonNull({"output"})
    private void parseConfig(ParsableBitArray parsableBitArray) throws ParserException {
        MpeghUtil.Mpegh3daConfig mpegh3daConfig = MpeghUtil.parseMpegh3daConfig(parsableBitArray);
        this.samplingRate = mpegh3daConfig.samplingFrequency;
        this.standardFrameLength = mpegh3daConfig.standardFrameLength;
        if (this.mainStreamLabel != this.header.packetLabel) {
            this.mainStreamLabel = this.header.packetLabel;
            String str = "mhm1";
            if (mpegh3daConfig.profileLevelIndication != -1) {
                str = "mhm1" + String.format(".%02X", Integer.valueOf(mpegh3daConfig.profileLevelIndication));
            }
            this.output.format(new Format.Builder().setId(this.formatId).setSampleMimeType(MimeTypes.AUDIO_MPEGH_MHM1).setSampleRate(this.samplingRate).setCodecs(str).setInitializationData((mpegh3daConfig.compatibleProfileLevelSet == null || mpegh3daConfig.compatibleProfileLevelSet.length <= 0) ? null : ImmutableList.of(Util.EMPTY_BYTE_ARRAY, mpegh3daConfig.compatibleProfileLevelSet)).build());
        }
        this.configFound = true;
    }

    @RequiresNonNull({"output"})
    private void finalizeFrame() {
        int i;
        if (this.configFound) {
            this.rapPending = false;
            i = 1;
        } else {
            i = 0;
        }
        double d = ((this.standardFrameLength - this.truncationSamples) * 1000000.0d) / this.samplingRate;
        long jRound = Math.round(this.timeUs);
        if (this.dataPending) {
            this.dataPending = false;
            this.timeUs = this.timeUsPending;
        } else {
            this.timeUs += d;
        }
        this.output.sampleMetadata(jRound, i, this.frameBytes, 0, null);
        this.configFound = false;
        this.truncationSamples = 0;
        this.frameBytes = 0;
    }
}
