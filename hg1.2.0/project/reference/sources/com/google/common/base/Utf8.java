package com.google.common.base;

import tv.danmaku.ijk.media.player.IjkMediaMeta;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Utf8 {
    public static int encodedLength(CharSequence sequence) {
        int length = sequence.length();
        int i = 0;
        while (i < length && sequence.charAt(i) < 128) {
            i++;
        }
        int iEncodedLengthGeneral = length;
        while (true) {
            if (i < length) {
                char cCharAt = sequence.charAt(i);
                if (cCharAt >= 2048) {
                    iEncodedLengthGeneral += encodedLengthGeneral(sequence, i);
                    break;
                }
                iEncodedLengthGeneral += (127 - cCharAt) >>> 31;
                i++;
            } else {
                break;
            }
        }
        if (iEncodedLengthGeneral >= length) {
            return iEncodedLengthGeneral;
        }
        throw new IllegalArgumentException("UTF-8 length does not fit in int: " + (iEncodedLengthGeneral + IjkMediaMeta.AV_CH_WIDE_RIGHT));
    }

    private static int encodedLengthGeneral(CharSequence sequence, int start) {
        int length = sequence.length();
        int i = 0;
        while (start < length) {
            char cCharAt = sequence.charAt(start);
            if (cCharAt < 2048) {
                i += (127 - cCharAt) >>> 31;
            } else {
                i += 2;
                if (55296 <= cCharAt && cCharAt <= 57343) {
                    if (Character.codePointAt(sequence, start) == cCharAt) {
                        throw new IllegalArgumentException(unpairedSurrogateMsg(start));
                    }
                    start++;
                }
            }
            start++;
        }
        return i;
    }

    public static boolean isWellFormed(byte[] bytes) {
        return isWellFormed(bytes, 0, bytes.length);
    }

    public static boolean isWellFormed(byte[] bytes, int off, int len) {
        int i = len + off;
        Preconditions.checkPositionIndexes(off, i, bytes.length);
        while (off < i) {
            if (bytes[off] < 0) {
                return isWellFormedSlowPath(bytes, off, i);
            }
            off++;
        }
        return true;
    }

    private static boolean isWellFormedSlowPath(byte[] bytes, int off, int end) {
        byte b;
        while (off < end) {
            int i = off + 1;
            byte b2 = bytes[off];
            if (b2 < 0) {
                if (b2 < -32) {
                    if (i != end && b2 >= -62) {
                        off += 2;
                        if (bytes[i] > -65) {
                        }
                    }
                    return false;
                }
                if (b2 < -16) {
                    int i2 = off + 2;
                    if (i2 < end && (b = bytes[i]) <= -65 && ((b2 != -32 || b >= -96) && (b2 != -19 || -96 > b))) {
                        off += 3;
                        if (bytes[i2] > -65) {
                        }
                    }
                    return false;
                }
                if (off + 3 >= end) {
                    return false;
                }
                int i3 = off + 2;
                byte b3 = bytes[i];
                if (b3 <= -65 && (((b2 << Ascii.FS) + (b3 + 112)) >> 30) == 0) {
                    int i4 = off + 3;
                    if (bytes[i3] <= -65) {
                        off += 4;
                        if (bytes[i4] > -65) {
                        }
                    }
                }
                return false;
            }
            off = i;
        }
        return true;
    }

    private static String unpairedSurrogateMsg(int i) {
        return "Unpaired surrogate at index " + i;
    }

    private Utf8() {
    }
}
