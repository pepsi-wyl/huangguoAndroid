package androidx.media3.extractor.mp4;

import androidx.media3.common.util.ParsableByteArray;
import androidx.media3.extractor.ExtractorInput;
import androidx.media3.extractor.SniffFailure;
import java.io.IOException;

/* loaded from: classes.dex */
final class Sniffer {
    public static final int BRAND_HEIC = 1751476579;
    public static final int BRAND_QUICKTIME = 1903435808;
    private static final int[] COMPATIBLE_BRANDS = {1769172845, 1769172786, 1769172787, 1769172788, 1769172789, 1769172790, 1769172793, Atom.TYPE_avc1, Atom.TYPE_hvc1, Atom.TYPE_hev1, Atom.TYPE_av01, 1836069937, 1836069938, 862401121, 862401122, 862417462, 862417718, 862414134, 862414646, 1295275552, 1295270176, 1714714144, 1801741417, 1295275600, BRAND_QUICKTIME, 1297305174, 1684175153, 1769172332, 1885955686};
    private static final int SEARCH_LENGTH = 4096;

    public static SniffFailure sniffFragmented(ExtractorInput extractorInput) throws IOException {
        return sniffInternal(extractorInput, true, false);
    }

    public static SniffFailure sniffUnfragmented(ExtractorInput extractorInput, boolean z) throws IOException {
        return sniffInternal(extractorInput, false, z);
    }

    private static SniffFailure sniffInternal(ExtractorInput extractorInput, boolean z, boolean z2) throws IOException {
        boolean z3;
        long j;
        int i;
        boolean z4;
        int[] iArr;
        long length = extractorInput.getLength();
        long j2 = 4096;
        long j3 = -1;
        if (length != -1 && length <= 4096) {
            j2 = length;
        }
        int i2 = (int) j2;
        ParsableByteArray parsableByteArray = new ParsableByteArray(64);
        int i3 = 0;
        int i4 = 0;
        boolean z5 = false;
        while (i4 < i2) {
            parsableByteArray.reset(8);
            if (!extractorInput.peekFully(parsableByteArray.getData(), i3, 8, true)) {
                break;
            }
            long unsignedInt = parsableByteArray.readUnsignedInt();
            int i5 = parsableByteArray.readInt();
            if (unsignedInt == 1) {
                extractorInput.peekFully(parsableByteArray.getData(), 8, 8);
                i = 16;
                parsableByteArray.setLimit(16);
                j = parsableByteArray.readLong();
            } else {
                if (unsignedInt == 0) {
                    long length2 = extractorInput.getLength();
                    if (length2 != j3) {
                        unsignedInt = (length2 - extractorInput.getPeekPosition()) + 8;
                    }
                }
                j = unsignedInt;
                i = 8;
            }
            long j4 = i;
            if (j < j4) {
                return new AtomSizeTooSmallSniffFailure(i5, j, i);
            }
            i4 += i;
            if (i5 == 1836019574) {
                i2 += (int) j;
                if (length != -1 && i2 > length) {
                    i2 = (int) length;
                }
                j3 = -1;
            } else {
                if (i5 == 1836019558 || i5 == 1836475768) {
                    z3 = true;
                    break;
                }
                long j5 = length;
                if (i5 == 1835295092) {
                    z5 = true;
                }
                if ((i4 + j) - j4 >= i2) {
                    break;
                }
                int i6 = (int) (j - j4);
                i4 += i6;
                if (i5 == 1718909296) {
                    if (i6 < 8) {
                        return new AtomSizeTooSmallSniffFailure(i5, i6, 8);
                    }
                    parsableByteArray.reset(i6);
                    extractorInput.peekFully(parsableByteArray.getData(), 0, i6);
                    int i7 = parsableByteArray.readInt();
                    if (isCompatibleBrand(i7, z2)) {
                        z5 = true;
                    }
                    parsableByteArray.skipBytes(4);
                    int iBytesLeft = parsableByteArray.bytesLeft() / 4;
                    if (!z5 && iBytesLeft > 0) {
                        iArr = new int[iBytesLeft];
                        int i8 = 0;
                        while (true) {
                            if (i8 >= iBytesLeft) {
                                z4 = z5;
                                break;
                            }
                            int i9 = parsableByteArray.readInt();
                            iArr[i8] = i9;
                            if (isCompatibleBrand(i9, z2)) {
                                z4 = true;
                                break;
                            }
                            i8++;
                        }
                    } else {
                        z4 = z5;
                        iArr = null;
                    }
                    if (!z4) {
                        return new UnsupportedBrandsSniffFailure(i7, iArr);
                    }
                    z5 = z4;
                } else if (i6 != 0) {
                    extractorInput.advancePeekPosition(i6);
                }
                length = j5;
                j3 = -1;
                i3 = 0;
            }
        }
        z3 = false;
        if (!z5) {
            return NoDeclaredBrandSniffFailure.INSTANCE;
        }
        if (z == z3) {
            return null;
        }
        if (z3) {
            return IncorrectFragmentationSniffFailure.FILE_FRAGMENTED;
        }
        return IncorrectFragmentationSniffFailure.FILE_NOT_FRAGMENTED;
    }

    private static boolean isCompatibleBrand(int i, boolean z) {
        if ((i >>> 8) == 3368816) {
            return true;
        }
        if (i == 1751476579 && z) {
            return true;
        }
        for (int i2 : COMPATIBLE_BRANDS) {
            if (i2 == i) {
                return true;
            }
        }
        return false;
    }

    private Sniffer() {
    }
}
