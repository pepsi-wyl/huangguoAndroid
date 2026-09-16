package com.google.common.escape;

import com.google.common.base.Preconditions;
import java.util.Map;
import javax.annotation.CheckForNull;
import kotlin.jvm.internal.CharCompanionObject;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class ArrayBasedUnicodeEscaper extends UnicodeEscaper {
    private final char[][] replacements;
    private final int replacementsLength;
    private final int safeMax;
    private final char safeMaxChar;
    private final int safeMin;
    private final char safeMinChar;

    @CheckForNull
    protected abstract char[] escapeUnsafe(int cp);

    protected ArrayBasedUnicodeEscaper(Map<Character, String> replacementMap, int safeMin, int safeMax, String unsafeReplacement) {
        this(ArrayBasedEscaperMap.create(replacementMap), safeMin, safeMax, unsafeReplacement);
    }

    protected ArrayBasedUnicodeEscaper(ArrayBasedEscaperMap escaperMap, int safeMin, int safeMax, String unsafeReplacement) {
        Preconditions.checkNotNull(escaperMap);
        char[][] replacementArray = escaperMap.getReplacementArray();
        this.replacements = replacementArray;
        this.replacementsLength = replacementArray.length;
        if (safeMax < safeMin) {
            safeMax = -1;
            safeMin = Integer.MAX_VALUE;
        }
        this.safeMin = safeMin;
        this.safeMax = safeMax;
        if (safeMin >= 55296) {
            this.safeMinChar = CharCompanionObject.MAX_VALUE;
            this.safeMaxChar = (char) 0;
        } else {
            this.safeMinChar = (char) safeMin;
            this.safeMaxChar = (char) Math.min(safeMax, 55295);
        }
    }

    @Override // com.google.common.escape.UnicodeEscaper, com.google.common.escape.Escaper
    public final String escape(String s) {
        Preconditions.checkNotNull(s);
        for (int i = 0; i < s.length(); i++) {
            char cCharAt = s.charAt(i);
            if ((cCharAt < this.replacementsLength && this.replacements[cCharAt] != null) || cCharAt > this.safeMaxChar || cCharAt < this.safeMinChar) {
                return escapeSlow(s, i);
            }
        }
        return s;
    }

    @Override // com.google.common.escape.UnicodeEscaper
    @CheckForNull
    protected final char[] escape(int cp) {
        char[] cArr;
        if (cp < this.replacementsLength && (cArr = this.replacements[cp]) != null) {
            return cArr;
        }
        if (cp < this.safeMin || cp > this.safeMax) {
            return escapeUnsafe(cp);
        }
        return null;
    }

    @Override // com.google.common.escape.UnicodeEscaper
    protected final int nextEscapeIndex(CharSequence csq, int index, int end) {
        while (index < end) {
            char cCharAt = csq.charAt(index);
            if ((cCharAt < this.replacementsLength && this.replacements[cCharAt] != null) || cCharAt > this.safeMaxChar || cCharAt < this.safeMinChar) {
                break;
            }
            index++;
        }
        return index;
    }
}
