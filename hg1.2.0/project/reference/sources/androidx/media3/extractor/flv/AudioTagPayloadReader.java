package androidx.media3.extractor.flv;

import androidx.media3.common.Format;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.ParserException;
import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.extractor.AacUtil;
import androidx.media3.extractor.TrackOutput;
import androidx.media3.extractor.flv.TagPayloadReader;
import java.util.Collections;

/* loaded from: classes.dex */
final class AudioTagPayloadReader extends TagPayloadReader {
    private static final int AAC_PACKET_TYPE_AAC_RAW = 1;
    private static final int AAC_PACKET_TYPE_SEQUENCE_HEADER = 0;
    private static final int AUDIO_FORMAT_AAC = 10;
    private static final int AUDIO_FORMAT_ALAW = 7;
    private static final int AUDIO_FORMAT_MP3 = 2;
    private static final int AUDIO_FORMAT_ULAW = 8;
    private static final int[] AUDIO_SAMPLING_RATE_TABLE = {5512, 11025, 22050, 44100};
    private int audioFormat;
    private boolean hasOutputFormat;
    private boolean hasParsedAudioDataHeader;

    @Override // androidx.media3.extractor.flv.TagPayloadReader
    public void seek() {
    }

    public AudioTagPayloadReader(TrackOutput trackOutput) {
        super(trackOutput);
    }

    @Override // androidx.media3.extractor.flv.TagPayloadReader
    protected boolean parseHeader(ParsableByteArray parsableByteArray) throws TagPayloadReader.UnsupportedFormatException {
        if (!this.hasParsedAudioDataHeader) {
            int unsignedByte = parsableByteArray.readUnsignedByte();
            int i = (unsignedByte >> 4) & 15;
            this.audioFormat = i;
            if (i == 2) {
                this.output.format(new Format.Builder().setSampleMimeType(MimeTypes.AUDIO_MPEG).setChannelCount(1).setSampleRate(AUDIO_SAMPLING_RATE_TABLE[(unsignedByte >> 2) & 3]).build());
                this.hasOutputFormat = true;
            } else if (i == 7 || i == 8) {
                this.output.format(new Format.Builder().setSampleMimeType(i == 7 ? MimeTypes.AUDIO_ALAW : MimeTypes.AUDIO_MLAW).setChannelCount(1).setSampleRate(8000).build());
                this.hasOutputFormat = true;
            } else if (i != 10) {
                throw new TagPayloadReader.UnsupportedFormatException("Audio format not supported: " + this.audioFormat);
            }
            this.hasParsedAudioDataHeader = true;
        } else {
            parsableByteArray.skipBytes(1);
        }
        return true;
    }

    @Override // androidx.media3.extractor.flv.TagPayloadReader
    protected boolean parsePayload(ParsableByteArray parsableByteArray, long j) throws ParserException {
        if (this.audioFormat == 2) {
            int iBytesLeft = parsableByteArray.bytesLeft();
            this.output.sampleData(parsableByteArray, iBytesLeft);
            this.output.sampleMetadata(j, 1, iBytesLeft, 0, null);
            return true;
        }
        int unsignedByte = parsableByteArray.readUnsignedByte();
        if (unsignedByte == 0 && !this.hasOutputFormat) {
            int iBytesLeft2 = parsableByteArray.bytesLeft();
            byte[] bArr = new byte[iBytesLeft2];
            parsableByteArray.readBytes(bArr, 0, iBytesLeft2);
            AacUtil.Config audioSpecificConfig = AacUtil.parseAudioSpecificConfig(bArr);
            this.output.format(new Format.Builder().setSampleMimeType(MimeTypes.AUDIO_AAC).setCodecs(audioSpecificConfig.codecs).setChannelCount(audioSpecificConfig.channelCount).setSampleRate(audioSpecificConfig.sampleRateHz).setInitializationData(Collections.singletonList(bArr)).build());
            this.hasOutputFormat = true;
            return false;
        }
        if (this.audioFormat == 10 && unsignedByte != 1) {
            return false;
        }
        int iBytesLeft3 = parsableByteArray.bytesLeft();
        this.output.sampleData(parsableByteArray, iBytesLeft3);
        this.output.sampleMetadata(j, 1, iBytesLeft3, 0, null);
        return true;
    }
}
