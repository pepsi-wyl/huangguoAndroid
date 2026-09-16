package androidx.media3.extractor.ts;

import androidx.media3.common.C;
import androidx.media3.common.ParserException;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Log;
import androidx.media3.common.util.ParsableBitArray;
import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.common.util.TimestampAdjuster;
import androidx.media3.extractor.ExtractorOutput;
import androidx.media3.extractor.ts.TsPayloadReader;
import org.checkerframework.checker.nullness.qual.RequiresNonNull;

/* loaded from: classes.dex */
public final class PesReader implements TsPayloadReader {
    private static final int HEADER_SIZE = 9;
    private static final int MAX_HEADER_EXTENSION_SIZE = 10;
    private static final int PES_SCRATCH_SIZE = 10;
    private static final int STATE_FINDING_HEADER = 0;
    private static final int STATE_READING_BODY = 3;
    private static final int STATE_READING_HEADER = 1;
    private static final int STATE_READING_HEADER_EXTENSION = 2;
    private static final String TAG = "PesReader";
    private int bytesRead;
    private boolean dataAlignmentIndicator;
    private boolean dtsFlag;
    private int extendedHeaderLength;
    private int payloadSize;
    private boolean ptsFlag;
    private final ElementaryStreamReader reader;
    private boolean seenFirstDts;
    private long timeUs;
    private TimestampAdjuster timestampAdjuster;
    private final ParsableBitArray pesScratch = new ParsableBitArray(new byte[10]);
    private int state = 0;

    public PesReader(ElementaryStreamReader elementaryStreamReader) {
        this.reader = elementaryStreamReader;
    }

    @Override // androidx.media3.extractor.ts.TsPayloadReader
    public void init(TimestampAdjuster timestampAdjuster, ExtractorOutput extractorOutput, TsPayloadReader.TrackIdGenerator trackIdGenerator) {
        this.timestampAdjuster = timestampAdjuster;
        this.reader.createTracks(extractorOutput, trackIdGenerator);
    }

    @Override // androidx.media3.extractor.ts.TsPayloadReader
    public void seek() {
        this.state = 0;
        this.bytesRead = 0;
        this.seenFirstDts = false;
        this.reader.seek();
    }

    @Override // androidx.media3.extractor.ts.TsPayloadReader
    public void consume(ParsableByteArray parsableByteArray, int i) throws ParserException {
        Assertions.checkStateNotNull(this.timestampAdjuster);
        if ((i & 1) != 0) {
            int i2 = this.state;
            if (i2 != 0 && i2 != 1) {
                if (i2 == 2) {
                    Log.w(TAG, "Unexpected start indicator reading extended header");
                } else if (i2 == 3) {
                    if (this.payloadSize != -1) {
                        Log.w(TAG, "Unexpected start indicator: expected " + this.payloadSize + " more bytes");
                    }
                    this.reader.packetFinished(parsableByteArray.limit() == 0);
                } else {
                    throw new IllegalStateException();
                }
            }
            setState(1);
        }
        while (parsableByteArray.bytesLeft() > 0) {
            int i3 = this.state;
            if (i3 == 0) {
                parsableByteArray.skipBytes(parsableByteArray.bytesLeft());
            } else if (i3 != 1) {
                if (i3 == 2) {
                    if (continueRead(parsableByteArray, this.pesScratch.data, Math.min(10, this.extendedHeaderLength)) && continueRead(parsableByteArray, null, this.extendedHeaderLength)) {
                        parseHeaderExtension();
                        i |= this.dataAlignmentIndicator ? 4 : 0;
                        this.reader.packetStarted(this.timeUs, i);
                        setState(3);
                    }
                } else if (i3 == 3) {
                    int iBytesLeft = parsableByteArray.bytesLeft();
                    int i4 = this.payloadSize;
                    int i5 = i4 == -1 ? 0 : iBytesLeft - i4;
                    if (i5 > 0) {
                        iBytesLeft -= i5;
                        parsableByteArray.setLimit(parsableByteArray.getPosition() + iBytesLeft);
                    }
                    this.reader.consume(parsableByteArray);
                    int i6 = this.payloadSize;
                    if (i6 != -1) {
                        int i7 = i6 - iBytesLeft;
                        this.payloadSize = i7;
                        if (i7 == 0) {
                            this.reader.packetFinished(false);
                            setState(1);
                        }
                    }
                } else {
                    throw new IllegalStateException();
                }
            } else if (continueRead(parsableByteArray, this.pesScratch.data, 9)) {
                setState(parseHeader() ? 2 : 0);
            }
        }
    }

    public boolean canConsumeSynthesizedEmptyPusi(boolean z) {
        return this.state == 3 && this.payloadSize == -1 && !(z && (this.reader instanceof H262Reader));
    }

    private void setState(int i) {
        this.state = i;
        this.bytesRead = 0;
    }

    private boolean continueRead(ParsableByteArray parsableByteArray, byte[] bArr, int i) {
        int iMin = Math.min(parsableByteArray.bytesLeft(), i - this.bytesRead);
        if (iMin <= 0) {
            return true;
        }
        if (bArr == null) {
            parsableByteArray.skipBytes(iMin);
        } else {
            parsableByteArray.readBytes(bArr, this.bytesRead, iMin);
        }
        int i2 = this.bytesRead + iMin;
        this.bytesRead = i2;
        return i2 == i;
    }

    private boolean parseHeader() {
        this.pesScratch.setPosition(0);
        int bits = this.pesScratch.readBits(24);
        if (bits != 1) {
            Log.w(TAG, "Unexpected start code prefix: " + bits);
            this.payloadSize = -1;
            return false;
        }
        this.pesScratch.skipBits(8);
        int bits2 = this.pesScratch.readBits(16);
        this.pesScratch.skipBits(5);
        this.dataAlignmentIndicator = this.pesScratch.readBit();
        this.pesScratch.skipBits(2);
        this.ptsFlag = this.pesScratch.readBit();
        this.dtsFlag = this.pesScratch.readBit();
        this.pesScratch.skipBits(6);
        int bits3 = this.pesScratch.readBits(8);
        this.extendedHeaderLength = bits3;
        if (bits2 == 0) {
            this.payloadSize = -1;
        } else {
            int i = (bits2 - 3) - bits3;
            this.payloadSize = i;
            if (i < 0) {
                Log.w(TAG, "Found negative packet payload size: " + this.payloadSize);
                this.payloadSize = -1;
            }
        }
        return true;
    }

    @RequiresNonNull({"timestampAdjuster"})
    private void parseHeaderExtension() {
        this.pesScratch.setPosition(0);
        this.timeUs = C.TIME_UNSET;
        if (this.ptsFlag) {
            this.pesScratch.skipBits(4);
            this.pesScratch.skipBits(1);
            this.pesScratch.skipBits(1);
            long bits = (this.pesScratch.readBits(3) << 30) | (this.pesScratch.readBits(15) << 15) | this.pesScratch.readBits(15);
            this.pesScratch.skipBits(1);
            if (!this.seenFirstDts && this.dtsFlag) {
                this.pesScratch.skipBits(4);
                this.pesScratch.skipBits(1);
                this.pesScratch.skipBits(1);
                this.pesScratch.skipBits(1);
                this.timestampAdjuster.adjustTsTimestamp((this.pesScratch.readBits(3) << 30) | (this.pesScratch.readBits(15) << 15) | this.pesScratch.readBits(15));
                this.seenFirstDts = true;
            }
            this.timeUs = this.timestampAdjuster.adjustTsTimestamp(bits);
        }
    }
}
