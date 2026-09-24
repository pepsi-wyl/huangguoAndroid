package io.flutter.plugin.editing;

import io.flutter.embedding.engine.FlutterJNI;

/* loaded from: classes2.dex */
class FlutterTextUtils {
    public static final int CANCEL_TAG = 917631;
    public static final int CARRIAGE_RETURN = 13;
    public static final int COMBINING_ENCLOSING_KEYCAP = 8419;
    public static final int LINE_FEED = 10;
    public static final int ZERO_WIDTH_JOINER = 8205;
    private final FlutterJNI flutterJNI;

    public boolean isKeycapBase(int i) {
        return (48 <= i && i <= 57) || i == 35 || i == 42;
    }

    public boolean isTagSpecChar(int i) {
        return 917536 <= i && i <= 917630;
    }

    public FlutterTextUtils(FlutterJNI flutterJNI) {
        this.flutterJNI = flutterJNI;
    }

    public boolean isEmoji(int i) {
        return this.flutterJNI.isCodePointEmoji(i);
    }

    public boolean isEmojiModifier(int i) {
        return this.flutterJNI.isCodePointEmojiModifier(i);
    }

    public boolean isEmojiModifierBase(int i) {
        return this.flutterJNI.isCodePointEmojiModifierBase(i);
    }

    public boolean isVariationSelector(int i) {
        return this.flutterJNI.isCodePointVariantSelector(i);
    }

    public boolean isRegionalIndicatorSymbol(int i) {
        return this.flutterJNI.isCodePointRegionalIndicator(i);
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x0154 A[ADDED_TO_REGION, EDGE_INSN: B:102:0x0154->B:95:0x0154 BREAK  A[LOOP:2: B:64:0x00d6->B:105:?], REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0148 A[PHI: r2 r4 r5
      0x0148: PHI (r2v6 int) = (r2v3 int), (r2v8 int), (r2v9 int) binds: [B:80:0x0117, B:82:0x0124, B:88:0x0147] A[DONT_GENERATE, DONT_INLINE]
      0x0148: PHI (r4v5 int) = (r4v3 int), (r4v7 int), (r4v8 int) binds: [B:80:0x0117, B:82:0x0124, B:88:0x0147] A[DONT_GENERATE, DONT_INLINE]
      0x0148: PHI (r5v9 boolean) = (r5v8 boolean), (r5v8 boolean), (r5v12 boolean) binds: [B:80:0x0117, B:82:0x0124, B:88:0x0147] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:92:0x014c A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int getOffsetBefore(CharSequence charSequence, int i) {
        int iCodePointBefore;
        int iCharCount;
        int iCharCount2;
        int iCharCount3 = 0;
        int i2 = 1;
        if (i <= 1 || (iCharCount2 = i - (iCharCount = Character.charCount((iCodePointBefore = Character.codePointBefore(charSequence, i))))) == 0) {
            return 0;
        }
        if (iCodePointBefore == 10) {
            if (Character.codePointBefore(charSequence, iCharCount2) == 13) {
                iCharCount++;
            }
            return i - iCharCount;
        }
        if (isRegionalIndicatorSymbol(iCodePointBefore)) {
            int iCodePointBefore2 = Character.codePointBefore(charSequence, iCharCount2);
            int iCharCount4 = iCharCount2 - Character.charCount(iCodePointBefore2);
            while (iCharCount4 > 0 && isRegionalIndicatorSymbol(iCodePointBefore2)) {
                iCodePointBefore2 = Character.codePointBefore(charSequence, iCharCount4);
                iCharCount4 -= Character.charCount(iCodePointBefore2);
                i2++;
            }
            if (i2 % 2 == 0) {
                iCharCount += 2;
            }
            return i - iCharCount;
        }
        if (iCodePointBefore == 8419) {
            int iCodePointBefore3 = Character.codePointBefore(charSequence, iCharCount2);
            int iCharCount5 = iCharCount2 - Character.charCount(iCodePointBefore3);
            if (iCharCount5 > 0 && isVariationSelector(iCodePointBefore3)) {
                int iCodePointBefore4 = Character.codePointBefore(charSequence, iCharCount5);
                if (isKeycapBase(iCodePointBefore4)) {
                    iCharCount += Character.charCount(iCodePointBefore3) + Character.charCount(iCodePointBefore4);
                }
            } else if (isKeycapBase(iCodePointBefore3)) {
                iCharCount += Character.charCount(iCodePointBefore3);
            }
            return i - iCharCount;
        }
        if (iCodePointBefore == 917631) {
            iCodePointBefore = Character.codePointBefore(charSequence, iCharCount2);
            int iCharCount6 = Character.charCount(iCodePointBefore);
            while (true) {
                iCharCount2 -= iCharCount6;
                if (iCharCount2 <= 0 || !isTagSpecChar(iCodePointBefore)) {
                    break;
                }
                iCharCount += Character.charCount(iCodePointBefore);
                iCodePointBefore = Character.codePointBefore(charSequence, iCharCount2);
                iCharCount6 = Character.charCount(iCodePointBefore);
            }
            if (!isEmoji(iCodePointBefore)) {
                return i - 2;
            }
            iCharCount += Character.charCount(iCodePointBefore);
        }
        if (isVariationSelector(iCodePointBefore)) {
            iCodePointBefore = Character.codePointBefore(charSequence, iCharCount2);
            if (!isEmoji(iCodePointBefore)) {
                return i - iCharCount;
            }
            iCharCount += Character.charCount(iCodePointBefore);
            iCharCount2 -= iCharCount;
        }
        if (isEmoji(iCodePointBefore)) {
            boolean z = false;
            int i3 = 0;
            while (true) {
                if (z) {
                    iCharCount += Character.charCount(iCodePointBefore) + i3 + 1;
                    z = false;
                }
                if (isEmojiModifier(iCodePointBefore)) {
                    int iCodePointBefore5 = Character.codePointBefore(charSequence, iCharCount2);
                    int iCharCount7 = iCharCount2 - Character.charCount(iCodePointBefore5);
                    if (iCharCount7 > 0 && isVariationSelector(iCodePointBefore5)) {
                        iCodePointBefore5 = Character.codePointBefore(charSequence, iCharCount7);
                        if (!isEmoji(iCodePointBefore5)) {
                            return i - iCharCount;
                        }
                        iCharCount3 = Character.charCount(iCodePointBefore5);
                        Character.charCount(iCodePointBefore5);
                    }
                    if (isEmojiModifierBase(iCodePointBefore5)) {
                        iCharCount += iCharCount3 + Character.charCount(iCodePointBefore5);
                    }
                } else if (iCharCount2 > 0) {
                    iCodePointBefore = Character.codePointBefore(charSequence, iCharCount2);
                    iCharCount2 -= Character.charCount(iCodePointBefore);
                    if (iCodePointBefore == 8205) {
                        iCodePointBefore = Character.codePointBefore(charSequence, iCharCount2);
                        iCharCount2 -= Character.charCount(iCodePointBefore);
                        if (iCharCount2 > 0 && isVariationSelector(iCodePointBefore)) {
                            iCodePointBefore = Character.codePointBefore(charSequence, iCharCount2);
                            int iCharCount8 = Character.charCount(iCodePointBefore);
                            iCharCount2 -= Character.charCount(iCodePointBefore);
                            i3 = iCharCount8;
                            z = true;
                            if (iCharCount2 == 0) {
                                break;
                            }
                        } else {
                            z = true;
                            i3 = 0;
                            if (iCharCount2 == 0 || !z || !isEmoji(iCodePointBefore)) {
                                break;
                            }
                        }
                    } else {
                        i3 = 0;
                        if (iCharCount2 == 0) {
                        }
                    }
                }
            }
        }
        return i - iCharCount;
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x0142 A[ADDED_TO_REGION, EDGE_INSN: B:100:0x0142->B:94:0x0142 BREAK  A[LOOP:1: B:52:0x00a6->B:105:?], REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0136 A[PHI: r2 r4 r6
      0x0136: PHI (r2v2 int) = (r2v1 int), (r2v4 int), (r2v6 int) binds: [B:58:0x00b9, B:81:0x0112, B:87:0x0135] A[DONT_GENERATE, DONT_INLINE]
      0x0136: PHI (r4v2 int) = (r4v1 int), (r4v4 int), (r4v6 int) binds: [B:58:0x00b9, B:81:0x0112, B:87:0x0135] A[DONT_GENERATE, DONT_INLINE]
      0x0136: PHI (r6v6 boolean) = (r6v5 boolean), (r6v5 boolean), (r6v9 boolean) binds: [B:58:0x00b9, B:81:0x0112, B:87:0x0135] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:91:0x013a A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public int getOffsetAfter(CharSequence charSequence, int i) {
        int iCharCount;
        int length = charSequence.length();
        int i2 = length - 1;
        if (i >= i2) {
            return length;
        }
        int iCodePointAt = Character.codePointAt(charSequence, i);
        int iCharCount2 = Character.charCount(iCodePointAt);
        int iCharCount3 = i + iCharCount2;
        int i3 = 0;
        if (iCharCount3 == 0) {
            return 0;
        }
        if (iCodePointAt == 10) {
            if (Character.codePointAt(charSequence, iCharCount3) == 13) {
                iCharCount2++;
            }
            return i + iCharCount2;
        }
        if (isRegionalIndicatorSymbol(iCodePointAt)) {
            if (iCharCount3 >= i2 || !isRegionalIndicatorSymbol(Character.codePointAt(charSequence, iCharCount3))) {
                return iCharCount3;
            }
            int iCharCount4 = i;
            while (iCharCount4 > 0 && isRegionalIndicatorSymbol(Character.codePointBefore(charSequence, i))) {
                iCharCount4 -= Character.charCount(Character.codePointBefore(charSequence, i));
                i3++;
            }
            if (i3 % 2 == 0) {
                iCharCount2 += 2;
            }
            return i + iCharCount2;
        }
        if (isKeycapBase(iCodePointAt)) {
            iCharCount2 += Character.charCount(iCodePointAt);
        }
        if (iCodePointAt == 8419) {
            int iCodePointBefore = Character.codePointBefore(charSequence, iCharCount3);
            int iCharCount5 = iCharCount3 + Character.charCount(iCodePointBefore);
            if (iCharCount5 < length && isVariationSelector(iCodePointBefore)) {
                int iCodePointAt2 = Character.codePointAt(charSequence, iCharCount5);
                if (isKeycapBase(iCodePointAt2)) {
                    iCharCount2 += Character.charCount(iCodePointBefore) + Character.charCount(iCodePointAt2);
                }
            } else if (isKeycapBase(iCodePointBefore)) {
                iCharCount2 += Character.charCount(iCodePointBefore);
            }
            return i + iCharCount2;
        }
        if (isEmoji(iCodePointAt)) {
            boolean z = false;
            int i4 = 0;
            do {
                if (z) {
                    iCharCount2 += Character.charCount(iCodePointAt) + i4 + 1;
                    z = false;
                }
                if (isEmojiModifier(iCodePointAt)) {
                    break;
                }
                if (iCharCount3 < length) {
                    iCodePointAt = Character.codePointAt(charSequence, iCharCount3);
                    iCharCount3 += Character.charCount(iCodePointAt);
                    if (iCodePointAt == 8419) {
                        int iCodePointBefore2 = Character.codePointBefore(charSequence, iCharCount3);
                        int iCharCount6 = iCharCount3 + Character.charCount(iCodePointBefore2);
                        if (iCharCount6 < length && isVariationSelector(iCodePointBefore2)) {
                            int iCodePointAt3 = Character.codePointAt(charSequence, iCharCount6);
                            if (isKeycapBase(iCodePointAt3)) {
                                iCharCount2 += Character.charCount(iCodePointBefore2) + Character.charCount(iCodePointAt3);
                            }
                        } else if (isKeycapBase(iCodePointBefore2)) {
                            iCharCount2 += Character.charCount(iCodePointBefore2);
                        }
                        return i + iCharCount2;
                    }
                    if (isEmojiModifier(iCodePointAt)) {
                        iCharCount = Character.charCount(iCodePointAt);
                    } else if (isVariationSelector(iCodePointAt)) {
                        iCharCount = Character.charCount(iCodePointAt);
                    } else if (iCodePointAt == 8205) {
                        iCodePointAt = Character.codePointAt(charSequence, iCharCount3);
                        iCharCount3 += Character.charCount(iCodePointAt);
                        if (iCharCount3 >= length || !isVariationSelector(iCodePointAt)) {
                            z = true;
                            i4 = 0;
                            if (iCharCount3 >= length || !z) {
                                break;
                            }
                        } else {
                            iCodePointAt = Character.codePointAt(charSequence, iCharCount3);
                            int iCharCount7 = Character.charCount(iCodePointAt);
                            iCharCount3 += Character.charCount(iCodePointAt);
                            i4 = iCharCount7;
                            z = true;
                            if (iCharCount3 >= length) {
                                break;
                            }
                        }
                    } else {
                        i4 = 0;
                        if (iCharCount3 >= length) {
                        }
                    }
                    iCharCount2 += iCharCount;
                    break;
                }
            } while (isEmoji(iCodePointAt));
        }
        return i + iCharCount2;
    }
}
