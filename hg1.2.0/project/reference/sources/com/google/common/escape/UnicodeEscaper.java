package com.google.common.escape;

import com.google.common.base.Preconditions;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class UnicodeEscaper extends Escaper {
    private static final int DEST_PAD = 32;

    @CheckForNull
    protected abstract char[] escape(int cp);

    protected UnicodeEscaper() {
    }

    @Override // com.google.common.escape.Escaper
    public String escape(String string) {
        Preconditions.checkNotNull(string);
        int length = string.length();
        int iNextEscapeIndex = nextEscapeIndex(string, 0, length);
        return iNextEscapeIndex == length ? string : escapeSlow(string, iNextEscapeIndex);
    }

    protected int nextEscapeIndex(CharSequence csq, int start, int end) {
        while (start < end) {
            int iCodePointAt = codePointAt(csq, start, end);
            if (iCodePointAt < 0 || escape(iCodePointAt) != null) {
                break;
            }
            start += Character.isSupplementaryCodePoint(iCodePointAt) ? 2 : 1;
        }
        return start;
    }

    protected final String escapeSlow(String s, int index) {
        int length = s.length();
        char[] cArrCharBufferFromThreadLocal = Platform.charBufferFromThreadLocal();
        int i = 0;
        int length2 = 0;
        while (index < length) {
            int iCodePointAt = codePointAt(s, index, length);
            if (iCodePointAt < 0) {
                throw new IllegalArgumentException("Trailing high surrogate at end of input");
            }
            char[] cArrEscape = escape(iCodePointAt);
            int i2 = (Character.isSupplementaryCodePoint(iCodePointAt) ? 2 : 1) + index;
            if (cArrEscape != null) {
                int i3 = index - i;
                int i4 = length2 + i3;
                int length3 = cArrEscape.length + i4;
                if (cArrCharBufferFromThreadLocal.length < length3) {
                    cArrCharBufferFromThreadLocal = growBuffer(cArrCharBufferFromThreadLocal, length2, length3 + (length - index) + 32);
                }
                if (i3 > 0) {
                    s.getChars(i, index, cArrCharBufferFromThreadLocal, length2);
                    length2 = i4;
                }
                if (cArrEscape.length > 0) {
                    System.arraycopy(cArrEscape, 0, cArrCharBufferFromThreadLocal, length2, cArrEscape.length);
                    length2 += cArrEscape.length;
                }
                i = i2;
            }
            index = nextEscapeIndex(s, i2, length);
        }
        int i5 = length - i;
        if (i5 > 0) {
            int i6 = i5 + length2;
            if (cArrCharBufferFromThreadLocal.length < i6) {
                cArrCharBufferFromThreadLocal = growBuffer(cArrCharBufferFromThreadLocal, length2, i6);
            }
            s.getChars(i, length, cArrCharBufferFromThreadLocal, length2);
            length2 = i6;
        }
        return new String(cArrCharBufferFromThreadLocal, 0, length2);
    }

    protected static int codePointAt(CharSequence seq, int index, int end) {
        Preconditions.checkNotNull(seq);
        if (index < end) {
            int i = index + 1;
            char cCharAt = seq.charAt(index);
            if (cCharAt < 55296 || cCharAt > 57343) {
                return cCharAt;
            }
            if (cCharAt > 56319) {
                throw new IllegalArgumentException("Unexpected low surrogate character '" + cCharAt + "' with value " + ((int) cCharAt) + " at index " + index + " in '" + ((Object) seq) + "'");
            }
            if (i == end) {
                return -cCharAt;
            }
            char cCharAt2 = seq.charAt(i);
            if (!Character.isLowSurrogate(cCharAt2)) {
                throw new IllegalArgumentException("Expected low surrogate but got char '" + cCharAt2 + "' with value " + ((int) cCharAt2) + " at index " + i + " in '" + ((Object) seq) + "'");
            }
            return Character.toCodePoint(cCharAt, cCharAt2);
        }
        throw new IndexOutOfBoundsException("Index exceeds specified range");
    }

    private static char[] growBuffer(char[] dest, int index, int size) {
        if (size < 0) {
            throw new AssertionError("Cannot increase internal buffer any further");
        }
        char[] cArr = new char[size];
        if (index > 0) {
            System.arraycopy(dest, 0, cArr, 0, index);
        }
        return cArr;
    }
}
