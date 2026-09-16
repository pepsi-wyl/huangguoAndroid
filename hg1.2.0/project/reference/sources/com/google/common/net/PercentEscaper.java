package com.google.common.net;

import com.google.common.base.Preconditions;
import com.google.common.escape.UnicodeEscaper;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class PercentEscaper extends UnicodeEscaper {
    private static final char[] PLUS_SIGN = {'+'};
    private static final char[] UPPER_HEX_DIGITS = "0123456789ABCDEF".toCharArray();
    private final boolean plusForSpace;
    private final boolean[] safeOctets;

    public PercentEscaper(String safeChars, boolean plusForSpace) {
        Preconditions.checkNotNull(safeChars);
        if (safeChars.matches(".*[0-9A-Za-z].*")) {
            throw new IllegalArgumentException("Alphanumeric characters are always 'safe' and should not be explicitly specified");
        }
        String str = safeChars + "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        if (plusForSpace && str.contains(" ")) {
            throw new IllegalArgumentException("plusForSpace cannot be specified when space is a 'safe' character");
        }
        this.plusForSpace = plusForSpace;
        this.safeOctets = createSafeOctets(str);
    }

    private static boolean[] createSafeOctets(String safeChars) {
        char[] charArray = safeChars.toCharArray();
        int iMax = -1;
        for (char c : charArray) {
            iMax = Math.max((int) c, iMax);
        }
        boolean[] zArr = new boolean[iMax + 1];
        for (char c2 : charArray) {
            zArr[c2] = true;
        }
        return zArr;
    }

    @Override // com.google.common.escape.UnicodeEscaper
    protected int nextEscapeIndex(CharSequence csq, int index, int end) {
        Preconditions.checkNotNull(csq);
        while (index < end) {
            char cCharAt = csq.charAt(index);
            boolean[] zArr = this.safeOctets;
            if (cCharAt >= zArr.length || !zArr[cCharAt]) {
                break;
            }
            index++;
        }
        return index;
    }

    @Override // com.google.common.escape.UnicodeEscaper, com.google.common.escape.Escaper
    public String escape(String s) {
        Preconditions.checkNotNull(s);
        int length = s.length();
        for (int i = 0; i < length; i++) {
            char cCharAt = s.charAt(i);
            boolean[] zArr = this.safeOctets;
            if (cCharAt >= zArr.length || !zArr[cCharAt]) {
                return escapeSlow(s, i);
            }
        }
        return s;
    }

    @Override // com.google.common.escape.UnicodeEscaper
    @CheckForNull
    protected char[] escape(int cp) {
        boolean[] zArr = this.safeOctets;
        if (cp < zArr.length && zArr[cp]) {
            return null;
        }
        if (cp == 32 && this.plusForSpace) {
            return PLUS_SIGN;
        }
        if (cp <= 127) {
            char[] cArr = UPPER_HEX_DIGITS;
            return new char[]{'%', cArr[cp >>> 4], cArr[cp & 15]};
        }
        if (cp <= 2047) {
            char[] cArr2 = UPPER_HEX_DIGITS;
            char c = cArr2[cp & 15];
            return new char[]{'%', cArr2[(cp >>> 10) | 12], cArr2[(cp >>> 6) & 15], '%', cArr2[8 | ((cp >>> 4) & 3)], c};
        }
        if (cp <= 65535) {
            char[] cArr3 = UPPER_HEX_DIGITS;
            char c2 = cArr3[cp & 15];
            char c3 = cArr3[((cp >>> 4) & 3) | 8];
            return new char[]{'%', 'E', cArr3[cp >>> 12], '%', cArr3[((cp >>> 10) & 3) | 8], cArr3[(cp >>> 6) & 15], '%', c3, c2};
        }
        if (cp <= 1114111) {
            char[] cArr4 = UPPER_HEX_DIGITS;
            char c4 = cArr4[cp & 15];
            char c5 = cArr4[((cp >>> 4) & 3) | 8];
            char c6 = cArr4[(cp >>> 6) & 15];
            char c7 = cArr4[((cp >>> 10) & 3) | 8];
            return new char[]{'%', 'F', cArr4[(cp >>> 18) & 7], '%', cArr4[((cp >>> 16) & 3) | 8], cArr4[(cp >>> 12) & 15], '%', c7, c6, '%', c5, c4};
        }
        throw new IllegalArgumentException("Invalid unicode character value " + cp);
    }
}
