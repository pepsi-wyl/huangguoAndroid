package androidx.media3.extractor.ogg;

import androidx.media3.common.ParserException;
import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.extractor.ExtractorInput;
import androidx.media3.extractor.ExtractorUtil;
import java.io.IOException;

/* loaded from: classes.dex */
final class OggPageHeader {
    private static final int CAPTURE_PATTERN = 1332176723;
    private static final int CAPTURE_PATTERN_SIZE = 4;
    public static final int EMPTY_PAGE_HEADER_SIZE = 27;
    public static final int MAX_PAGE_PAYLOAD = 65025;
    public static final int MAX_PAGE_SIZE = 65307;
    public static final int MAX_SEGMENT_COUNT = 255;
    public int bodySize;
    public long granulePosition;
    public int headerSize;
    public long pageChecksum;
    public int pageSegmentCount;
    public long pageSequenceNumber;
    public int revision;
    public long streamSerialNumber;
    public int type;
    public final int[] laces = new int[255];
    private final ParsableByteArray scratch = new ParsableByteArray(255);

    OggPageHeader() {
    }

    public void reset() {
        this.revision = 0;
        this.type = 0;
        this.granulePosition = 0L;
        this.streamSerialNumber = 0L;
        this.pageSequenceNumber = 0L;
        this.pageChecksum = 0L;
        this.pageSegmentCount = 0;
        this.headerSize = 0;
        this.bodySize = 0;
    }

    public boolean skipToNextPage(ExtractorInput extractorInput) throws IOException {
        return skipToNextPage(extractorInput, -1L);
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0051, code lost:
    
        if (r10 == (-1)) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x0059, code lost:
    
        if (r9.getPosition() >= r10) goto L28;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0060, code lost:
    
        if (r9.skip(1) == (-1)) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0063, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean skipToNextPage(androidx.media3.extractor.ExtractorInput r9, long r10) throws java.io.IOException {
        /*
            r8 = this;
            long r0 = r9.getPosition()
            long r2 = r9.getPeekPosition()
            r4 = 0
            r5 = 1
            int r6 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r6 != 0) goto L10
            r0 = 1
            goto L11
        L10:
            r0 = 0
        L11:
            androidx.media3.common.util.Assertions.checkArgument(r0)
            androidx.media3.common.util.ParsableByteArray r0 = r8.scratch
            r1 = 4
            r0.reset(r1)
        L1a:
            r2 = -1
            int r0 = (r10 > r2 ? 1 : (r10 == r2 ? 0 : -1))
            if (r0 == 0) goto L2b
            long r2 = r9.getPosition()
            r6 = 4
            long r2 = r2 + r6
            int r6 = (r2 > r10 ? 1 : (r2 == r10 ? 0 : -1))
            if (r6 >= 0) goto L51
        L2b:
            androidx.media3.common.util.ParsableByteArray r2 = r8.scratch
            byte[] r2 = r2.getData()
            boolean r2 = androidx.media3.extractor.ExtractorUtil.peekFullyQuietly(r9, r2, r4, r1, r5)
            if (r2 == 0) goto L51
            androidx.media3.common.util.ParsableByteArray r0 = r8.scratch
            r0.setPosition(r4)
            androidx.media3.common.util.ParsableByteArray r0 = r8.scratch
            long r2 = r0.readUnsignedInt()
            r6 = 1332176723(0x4f676753, double:6.58182753E-315)
            int r0 = (r2 > r6 ? 1 : (r2 == r6 ? 0 : -1))
            if (r0 != 0) goto L4d
            r9.resetPeekPosition()
            return r5
        L4d:
            r9.skipFully(r5)
            goto L1a
        L51:
            if (r0 == 0) goto L5b
            long r1 = r9.getPosition()
            int r3 = (r1 > r10 ? 1 : (r1 == r10 ? 0 : -1))
            if (r3 >= 0) goto L63
        L5b:
            int r1 = r9.skip(r5)
            r2 = -1
            if (r1 == r2) goto L63
            goto L51
        L63:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.extractor.ogg.OggPageHeader.skipToNextPage(androidx.media3.extractor.ExtractorInput, long):boolean");
    }

    public boolean populate(ExtractorInput extractorInput, boolean z) throws IOException {
        reset();
        this.scratch.reset(27);
        if (!ExtractorUtil.peekFullyQuietly(extractorInput, this.scratch.getData(), 0, 27, z) || this.scratch.readUnsignedInt() != 1332176723) {
            return false;
        }
        int unsignedByte = this.scratch.readUnsignedByte();
        this.revision = unsignedByte;
        if (unsignedByte != 0) {
            if (z) {
                return false;
            }
            throw ParserException.createForUnsupportedContainerFeature("unsupported bit stream revision");
        }
        this.type = this.scratch.readUnsignedByte();
        this.granulePosition = this.scratch.readLittleEndianLong();
        this.streamSerialNumber = this.scratch.readLittleEndianUnsignedInt();
        this.pageSequenceNumber = this.scratch.readLittleEndianUnsignedInt();
        this.pageChecksum = this.scratch.readLittleEndianUnsignedInt();
        int unsignedByte2 = this.scratch.readUnsignedByte();
        this.pageSegmentCount = unsignedByte2;
        this.headerSize = unsignedByte2 + 27;
        this.scratch.reset(unsignedByte2);
        if (!ExtractorUtil.peekFullyQuietly(extractorInput, this.scratch.getData(), 0, this.pageSegmentCount, z)) {
            return false;
        }
        for (int i = 0; i < this.pageSegmentCount; i++) {
            this.laces[i] = this.scratch.readUnsignedByte();
            this.bodySize += this.laces[i];
        }
        return true;
    }
}
