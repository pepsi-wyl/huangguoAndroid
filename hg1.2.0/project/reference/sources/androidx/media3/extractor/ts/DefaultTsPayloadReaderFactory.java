package androidx.media3.extractor.ts;

import android.util.SparseArray;
import androidx.media3.common.Format;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.util.CodecSpecificDataUtil;
import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.extractor.ts.TsPayloadReader;
import com.google.common.collect.ImmutableList;
import com.google.common.primitives.SignedBytes;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public final class DefaultTsPayloadReaderFactory implements TsPayloadReader.Factory {
    private static final int DESCRIPTOR_TAG_CAPTION_SERVICE = 134;
    public static final int FLAG_ALLOW_NON_IDR_KEYFRAMES = 1;
    public static final int FLAG_DETECT_ACCESS_UNITS = 8;
    public static final int FLAG_ENABLE_HDMV_DTS_AUDIO_STREAMS = 64;
    public static final int FLAG_IGNORE_AAC_STREAM = 2;
    public static final int FLAG_IGNORE_H264_STREAM = 4;
    public static final int FLAG_IGNORE_SPLICE_INFO_STREAM = 16;
    public static final int FLAG_OVERRIDE_CAPTION_DESCRIPTORS = 32;
    private final List<Format> closedCaptionFormats;
    private final int flags;

    @Target({ElementType.TYPE_USE})
    @Documented
    @Retention(RetentionPolicy.SOURCE)
    public @interface Flags {
    }

    public DefaultTsPayloadReaderFactory() {
        this(0);
    }

    public DefaultTsPayloadReaderFactory(int i) {
        this(i, ImmutableList.of());
    }

    public DefaultTsPayloadReaderFactory(int i, List<Format> list) {
        this.flags = i;
        this.closedCaptionFormats = list;
    }

    @Override // androidx.media3.extractor.ts.TsPayloadReader.Factory
    public SparseArray<TsPayloadReader> createInitialPayloadReaders() {
        return new SparseArray<>();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0057  */
    @Override // androidx.media3.extractor.ts.TsPayloadReader.Factory
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public androidx.media3.extractor.ts.TsPayloadReader createPayloadReader(int r5, androidx.media3.extractor.ts.TsPayloadReader.EsInfo r6) {
        /*
            Method dump skipped, instructions count: 382
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.media3.extractor.ts.DefaultTsPayloadReaderFactory.createPayloadReader(int, androidx.media3.extractor.ts.TsPayloadReader$EsInfo):androidx.media3.extractor.ts.TsPayloadReader");
    }

    private SeiReader buildSeiReader(TsPayloadReader.EsInfo esInfo) {
        return new SeiReader(getClosedCaptionFormats(esInfo));
    }

    private UserDataReader buildUserDataReader(TsPayloadReader.EsInfo esInfo) {
        return new UserDataReader(getClosedCaptionFormats(esInfo));
    }

    private List<Format> getClosedCaptionFormats(TsPayloadReader.EsInfo esInfo) {
        String str;
        int i;
        List<byte[]> listBuildCea708InitializationData;
        if (isSet(32)) {
            return this.closedCaptionFormats;
        }
        ParsableByteArray parsableByteArray = new ParsableByteArray(esInfo.descriptorBytes);
        List<Format> arrayList = this.closedCaptionFormats;
        while (parsableByteArray.bytesLeft() > 0) {
            int unsignedByte = parsableByteArray.readUnsignedByte();
            int position = parsableByteArray.getPosition() + parsableByteArray.readUnsignedByte();
            if (unsignedByte == 134) {
                arrayList = new ArrayList<>();
                int unsignedByte2 = parsableByteArray.readUnsignedByte() & 31;
                for (int i2 = 0; i2 < unsignedByte2; i2++) {
                    String string = parsableByteArray.readString(3);
                    int unsignedByte3 = parsableByteArray.readUnsignedByte();
                    boolean z = (unsignedByte3 & 128) != 0;
                    if (z) {
                        i = unsignedByte3 & 63;
                        str = MimeTypes.APPLICATION_CEA708;
                    } else {
                        str = MimeTypes.APPLICATION_CEA608;
                        i = 1;
                    }
                    byte unsignedByte4 = (byte) parsableByteArray.readUnsignedByte();
                    parsableByteArray.skipBytes(1);
                    if (z) {
                        listBuildCea708InitializationData = CodecSpecificDataUtil.buildCea708InitializationData((unsignedByte4 & SignedBytes.MAX_POWER_OF_TWO) != 0);
                    } else {
                        listBuildCea708InitializationData = null;
                    }
                    arrayList.add(new Format.Builder().setSampleMimeType(str).setLanguage(string).setAccessibilityChannel(i).setInitializationData(listBuildCea708InitializationData).build());
                }
            }
            parsableByteArray.setPosition(position);
        }
        return arrayList;
    }

    private boolean isSet(int i) {
        return (i & this.flags) != 0;
    }
}
