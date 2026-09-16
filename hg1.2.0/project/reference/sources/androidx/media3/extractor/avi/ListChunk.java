package androidx.media3.extractor.avi;

import androidx.media3.common.util.ParsableByteArray;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.UnmodifiableIterator;

/* loaded from: classes.dex */
final class ListChunk implements AviChunk {
    public final ImmutableList<AviChunk> children;
    private final int type;

    public static ListChunk parseFrom(int i, ParsableByteArray parsableByteArray) {
        AviChunk aviChunkCreateBox;
        ImmutableList.Builder builder = new ImmutableList.Builder();
        int iLimit = parsableByteArray.limit();
        int trackType = -2;
        while (parsableByteArray.bytesLeft() > 8) {
            int littleEndianInt = parsableByteArray.readLittleEndianInt();
            int position = parsableByteArray.getPosition() + parsableByteArray.readLittleEndianInt();
            parsableByteArray.setLimit(position);
            if (littleEndianInt == 1414744396) {
                aviChunkCreateBox = parseFrom(parsableByteArray.readLittleEndianInt(), parsableByteArray);
            } else {
                aviChunkCreateBox = createBox(littleEndianInt, trackType, parsableByteArray);
            }
            if (aviChunkCreateBox != null) {
                if (aviChunkCreateBox.getType() == 1752331379) {
                    trackType = ((AviStreamHeaderChunk) aviChunkCreateBox).getTrackType();
                }
                builder.add((ImmutableList.Builder) aviChunkCreateBox);
            }
            parsableByteArray.setPosition(position);
            parsableByteArray.setLimit(iLimit);
        }
        return new ListChunk(i, builder.build());
    }

    private ListChunk(int i, ImmutableList<AviChunk> immutableList) {
        this.type = i;
        this.children = immutableList;
    }

    @Override // androidx.media3.extractor.avi.AviChunk
    public int getType() {
        return this.type;
    }

    public <T extends AviChunk> T getChild(Class<T> cls) {
        UnmodifiableIterator<AviChunk> it = this.children.iterator();
        while (it.hasNext()) {
            T t = (T) it.next();
            if (t.getClass() == cls) {
                return t;
            }
        }
        return null;
    }

    private static AviChunk createBox(int i, int i2, ParsableByteArray parsableByteArray) {
        switch (i) {
            case AviExtractor.FOURCC_strf /* 1718776947 */:
                return StreamFormatChunk.parseFrom(i2, parsableByteArray);
            case AviExtractor.FOURCC_avih /* 1751742049 */:
                return AviMainHeaderChunk.parseFrom(parsableByteArray);
            case AviExtractor.FOURCC_strh /* 1752331379 */:
                return AviStreamHeaderChunk.parseFrom(parsableByteArray);
            case AviExtractor.FOURCC_strn /* 1852994675 */:
                return StreamNameChunk.parseFrom(parsableByteArray);
            default:
                return null;
        }
    }
}
