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
        To view partially-correct add '--show-bad-code' argument
    */
    public int getOffsetBefore(java.lang.CharSequence r9, int r10) {
        /*
            Method dump skipped, instructions count: 342
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: io.flutter.plugin.editing.FlutterTextUtils.getOffsetBefore(java.lang.CharSequence, int):int");
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x0142 A[ADDED_TO_REGION, EDGE_INSN: B:100:0x0142->B:94:0x0142 BREAK  A[LOOP:1: B:52:0x00a6->B:105:?], REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0136 A[PHI: r2 r4 r6
      0x0136: PHI (r2v2 int) = (r2v1 int), (r2v4 int), (r2v6 int) binds: [B:58:0x00b9, B:81:0x0112, B:87:0x0135] A[DONT_GENERATE, DONT_INLINE]
      0x0136: PHI (r4v2 int) = (r4v1 int), (r4v4 int), (r4v6 int) binds: [B:58:0x00b9, B:81:0x0112, B:87:0x0135] A[DONT_GENERATE, DONT_INLINE]
      0x0136: PHI (r6v6 boolean) = (r6v5 boolean), (r6v5 boolean), (r6v9 boolean) binds: [B:58:0x00b9, B:81:0x0112, B:87:0x0135] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:91:0x013a A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public int getOffsetAfter(java.lang.CharSequence r10, int r11) {
        /*
            Method dump skipped, instructions count: 324
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: io.flutter.plugin.editing.FlutterTextUtils.getOffsetAfter(java.lang.CharSequence, int):int");
    }
}
