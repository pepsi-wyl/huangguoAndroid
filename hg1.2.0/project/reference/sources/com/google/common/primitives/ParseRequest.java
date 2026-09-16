package com.google.common.primitives;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class ParseRequest {
    final int radix;
    final String rawValue;

    private ParseRequest(String rawValue, int radix) {
        this.rawValue = rawValue;
        this.radix = radix;
    }

    static ParseRequest fromString(String stringValue) {
        if (stringValue.length() == 0) {
            throw new NumberFormatException("empty string");
        }
        char cCharAt = stringValue.charAt(0);
        int i = 16;
        if (stringValue.startsWith("0x") || stringValue.startsWith("0X")) {
            stringValue = stringValue.substring(2);
        } else if (cCharAt == '#') {
            stringValue = stringValue.substring(1);
        } else if (cCharAt != '0' || stringValue.length() <= 1) {
            i = 10;
        } else {
            stringValue = stringValue.substring(1);
            i = 8;
        }
        return new ParseRequest(stringValue, i);
    }
}
