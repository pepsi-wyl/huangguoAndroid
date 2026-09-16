package androidx.media3.extractor.flv;

import androidx.media3.common.ParserException;
import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.extractor.TrackOutput;

/* loaded from: classes.dex */
abstract class TagPayloadReader {
    protected final TrackOutput output;

    protected abstract boolean parseHeader(ParsableByteArray parsableByteArray) throws ParserException;

    protected abstract boolean parsePayload(ParsableByteArray parsableByteArray, long j) throws ParserException;

    public abstract void seek();

    public static final class UnsupportedFormatException extends ParserException {
        public UnsupportedFormatException(String str) {
            super(str, null, false, 1);
        }
    }

    protected TagPayloadReader(TrackOutput trackOutput) {
        this.output = trackOutput;
    }

    public final boolean consume(ParsableByteArray parsableByteArray, long j) throws ParserException {
        return parseHeader(parsableByteArray) && parsePayload(parsableByteArray, j);
    }
}
