package androidx.media3.exoplayer.video.spherical;

import androidx.media3.common.util.ParsableBitArray;
import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.video.spherical.Projection;
import java.util.ArrayList;
import java.util.zip.Inflater;

/* loaded from: classes.dex */
final class ProjectionDecoder {
    private static final int MAX_COORDINATE_COUNT = 10000;
    private static final int MAX_TRIANGLE_INDICES = 128000;
    private static final int MAX_VERTEX_COUNT = 32000;
    private static final int TYPE_DFL8 = 1684433976;
    private static final int TYPE_MESH = 1835365224;
    private static final int TYPE_MSHP = 1836279920;
    private static final int TYPE_PROJ = 1886547818;
    private static final int TYPE_RAW = 1918990112;
    private static final int TYPE_YTMP = 2037673328;

    private static int decodeZigZag(int i) {
        return (-(i & 1)) ^ (i >> 1);
    }

    private ProjectionDecoder() {
    }

    public static Projection decode(byte[] bArr, int i) {
        ArrayList<Projection.Mesh> proj;
        ParsableByteArray parsableByteArray = new ParsableByteArray(bArr);
        try {
            proj = isProj(parsableByteArray) ? parseProj(parsableByteArray) : parseMshp(parsableByteArray);
        } catch (ArrayIndexOutOfBoundsException unused) {
            proj = null;
        }
        if (proj == null) {
            return null;
        }
        int size = proj.size();
        if (size == 1) {
            return new Projection(proj.get(0), i);
        }
        if (size != 2) {
            return null;
        }
        return new Projection(proj.get(0), proj.get(1), i);
    }

    private static boolean isProj(ParsableByteArray parsableByteArray) {
        parsableByteArray.skipBytes(4);
        int i = parsableByteArray.readInt();
        parsableByteArray.setPosition(0);
        return i == 1886547818;
    }

    private static ArrayList<Projection.Mesh> parseProj(ParsableByteArray parsableByteArray) {
        int i;
        parsableByteArray.skipBytes(8);
        int position = parsableByteArray.getPosition();
        int iLimit = parsableByteArray.limit();
        while (position < iLimit && (i = parsableByteArray.readInt() + position) > position && i <= iLimit) {
            int i2 = parsableByteArray.readInt();
            if (i2 == TYPE_YTMP || i2 == TYPE_MSHP) {
                parsableByteArray.setLimit(i);
                return parseMshp(parsableByteArray);
            }
            parsableByteArray.setPosition(i);
            position = i;
        }
        return null;
    }

    private static ArrayList<Projection.Mesh> parseMshp(ParsableByteArray parsableByteArray) {
        if (parsableByteArray.readUnsignedByte() != 0) {
            return null;
        }
        parsableByteArray.skipBytes(7);
        int i = parsableByteArray.readInt();
        if (i == TYPE_DFL8) {
            ParsableByteArray parsableByteArray2 = new ParsableByteArray();
            Inflater inflater = new Inflater(true);
            try {
                if (!Util.inflate(parsableByteArray, parsableByteArray2, inflater)) {
                    return null;
                }
                inflater.end();
                parsableByteArray = parsableByteArray2;
            } finally {
                inflater.end();
            }
        } else if (i != TYPE_RAW) {
            return null;
        }
        return parseRawMshpData(parsableByteArray);
    }

    private static ArrayList<Projection.Mesh> parseRawMshpData(ParsableByteArray parsableByteArray) {
        ArrayList<Projection.Mesh> arrayList = new ArrayList<>();
        int position = parsableByteArray.getPosition();
        int iLimit = parsableByteArray.limit();
        while (position < iLimit) {
            int i = parsableByteArray.readInt() + position;
            if (i <= position || i > iLimit) {
                return null;
            }
            if (parsableByteArray.readInt() == TYPE_MESH) {
                Projection.Mesh mesh = parseMesh(parsableByteArray);
                if (mesh == null) {
                    return null;
                }
                arrayList.add(mesh);
            }
            parsableByteArray.setPosition(i);
            position = i;
        }
        return arrayList;
    }

    private static Projection.Mesh parseMesh(ParsableByteArray parsableByteArray) {
        int i = parsableByteArray.readInt();
        if (i > 10000) {
            return null;
        }
        float[] fArr = new float[i];
        for (int i2 = 0; i2 < i; i2++) {
            fArr[i2] = parsableByteArray.readFloat();
        }
        int i3 = parsableByteArray.readInt();
        if (i3 > MAX_VERTEX_COUNT) {
            return null;
        }
        double d = 2.0d;
        double dLog = Math.log(2.0d);
        int iCeil = (int) Math.ceil(Math.log(i * 2.0d) / dLog);
        ParsableBitArray parsableBitArray = new ParsableBitArray(parsableByteArray.getData());
        int i4 = 8;
        parsableBitArray.setPosition(parsableByteArray.getPosition() * 8);
        float[] fArr2 = new float[i3 * 5];
        int i5 = 5;
        int[] iArr = new int[5];
        int i6 = 0;
        int i7 = 0;
        while (i6 < i3) {
            int i8 = 0;
            while (i8 < i5) {
                int iDecodeZigZag = iArr[i8] + decodeZigZag(parsableBitArray.readBits(iCeil));
                if (iDecodeZigZag >= i || iDecodeZigZag < 0) {
                    return null;
                }
                fArr2[i7] = fArr[iDecodeZigZag];
                iArr[i8] = iDecodeZigZag;
                i8++;
                i7++;
                i5 = 5;
            }
            i6++;
            i5 = 5;
        }
        parsableBitArray.setPosition((parsableBitArray.getPosition() + 7) & (-8));
        int i9 = 32;
        int bits = parsableBitArray.readBits(32);
        Projection.SubMesh[] subMeshArr = new Projection.SubMesh[bits];
        int i10 = 0;
        while (i10 < bits) {
            int bits2 = parsableBitArray.readBits(i4);
            int bits3 = parsableBitArray.readBits(i4);
            int bits4 = parsableBitArray.readBits(i9);
            if (bits4 > MAX_TRIANGLE_INDICES) {
                return null;
            }
            int iCeil2 = (int) Math.ceil(Math.log(i3 * d) / dLog);
            float[] fArr3 = new float[bits4 * 3];
            float[] fArr4 = new float[bits4 * 2];
            int iDecodeZigZag2 = 0;
            for (int i11 = 0; i11 < bits4; i11++) {
                iDecodeZigZag2 += decodeZigZag(parsableBitArray.readBits(iCeil2));
                if (iDecodeZigZag2 < 0 || iDecodeZigZag2 >= i3) {
                    return null;
                }
                int i12 = i11 * 3;
                int i13 = iDecodeZigZag2 * 5;
                fArr3[i12] = fArr2[i13];
                fArr3[i12 + 1] = fArr2[i13 + 1];
                fArr3[i12 + 2] = fArr2[i13 + 2];
                int i14 = i11 * 2;
                fArr4[i14] = fArr2[i13 + 3];
                fArr4[i14 + 1] = fArr2[i13 + 4];
            }
            subMeshArr[i10] = new Projection.SubMesh(bits2, fArr3, fArr4, bits3);
            i10++;
            i9 = 32;
            d = 2.0d;
            i4 = 8;
        }
        return new Projection.Mesh(subMeshArr);
    }
}
