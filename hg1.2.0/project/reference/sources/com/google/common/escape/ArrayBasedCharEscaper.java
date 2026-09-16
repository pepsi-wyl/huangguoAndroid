package com.google.common.escape;

import com.google.common.base.Preconditions;
import java.util.Map;
import javax.annotation.CheckForNull;
import kotlin.jvm.internal.CharCompanionObject;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class ArrayBasedCharEscaper extends CharEscaper {
    private final char[][] replacements;
    private final int replacementsLength;
    private final char safeMax;
    private final char safeMin;

    @CheckForNull
    protected abstract char[] escapeUnsafe(char c);

    protected ArrayBasedCharEscaper(Map<Character, String> replacementMap, char safeMin, char safeMax) {
        this(ArrayBasedEscaperMap.create(replacementMap), safeMin, safeMax);
    }

    protected ArrayBasedCharEscaper(ArrayBasedEscaperMap escaperMap, char safeMin, char safeMax) {
        Preconditions.checkNotNull(escaperMap);
        char[][] replacementArray = escaperMap.getReplacementArray();
        this.replacements = replacementArray;
        this.replacementsLength = replacementArray.length;
        if (safeMax < safeMin) {
            safeMax = 0;
            safeMin = CharCompanionObject.MAX_VALUE;
        }
        this.safeMin = safeMin;
        this.safeMax = safeMax;
    }

    @Override // com.google.common.escape.CharEscaper, com.google.common.escape.Escaper
    public final String escape(String s) {
        Preconditions.checkNotNull(s);
        for (int i = 0; i < s.length(); i++) {
            char cCharAt = s.charAt(i);
            if ((cCharAt < this.replacementsLength && this.replacements[cCharAt] != null) || cCharAt > this.safeMax || cCharAt < this.safeMin) {
                return escapeSlow(s, i);
            }
        }
        return s;
    }

    @Override // com.google.common.escape.CharEscaper
    @CheckForNull
    protected final char[] escape(char c) {
        char[] cArr;
        if (c < this.replacementsLength && (cArr = this.replacements[c]) != null) {
            return cArr;
        }
        if (c < this.safeMin || c > this.safeMax) {
            return escapeUnsafe(c);
        }
        return null;
    }
}
