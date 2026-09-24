package com.google.common.base;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Strings {
    private Strings() {
    }

    public static String nullToEmpty(@CheckForNull String string) {
        return Platform.nullToEmpty(string);
    }

    @CheckForNull
    public static String emptyToNull(@CheckForNull String string) {
        return Platform.emptyToNull(string);
    }

    public static boolean isNullOrEmpty(@CheckForNull String string) {
        return Platform.stringIsNullOrEmpty(string);
    }

    public static String padStart(String string, int minLength, char padChar) {
        Preconditions.checkNotNull(string);
        if (string.length() >= minLength) {
            return string;
        }
        StringBuilder sb = new StringBuilder(minLength);
        for (int length = string.length(); length < minLength; length++) {
            sb.append(padChar);
        }
        sb.append(string);
        return sb.toString();
    }

    public static String padEnd(String string, int minLength, char padChar) {
        Preconditions.checkNotNull(string);
        if (string.length() >= minLength) {
            return string;
        }
        StringBuilder sb = new StringBuilder(minLength);
        sb.append(string);
        for (int length = string.length(); length < minLength; length++) {
            sb.append(padChar);
        }
        return sb.toString();
    }

    public static String repeat(String string, int count) {
        Preconditions.checkNotNull(string);
        if (count <= 1) {
            Preconditions.checkArgument(count >= 0, "invalid count: %s", count);
            return count == 0 ? "" : string;
        }
        int length = string.length();
        long j = length * count;
        int i = (int) j;
        if (i != j) {
            throw new ArrayIndexOutOfBoundsException("Required array size too large: " + j);
        }
        char[] cArr = new char[i];
        string.getChars(0, length, cArr, 0);
        while (true) {
            int i2 = i - length;
            if (length < i2) {
                System.arraycopy(cArr, 0, cArr, length, length);
                length <<= 1;
            } else {
                System.arraycopy(cArr, 0, cArr, length, i2);
                return new String(cArr);
            }
        }
    }

    public static String commonPrefix(CharSequence a, CharSequence b) {
        Preconditions.checkNotNull(a);
        Preconditions.checkNotNull(b);
        int iMin = Math.min(a.length(), b.length());
        int i = 0;
        while (i < iMin && a.charAt(i) == b.charAt(i)) {
            i++;
        }
        int i2 = i - 1;
        if (validSurrogatePairAt(a, i2) || validSurrogatePairAt(b, i2)) {
            i--;
        }
        return a.subSequence(0, i).toString();
    }

    public static String commonSuffix(CharSequence a, CharSequence b) {
        Preconditions.checkNotNull(a);
        Preconditions.checkNotNull(b);
        int iMin = Math.min(a.length(), b.length());
        int i = 0;
        while (i < iMin && a.charAt((a.length() - i) - 1) == b.charAt((b.length() - i) - 1)) {
            i++;
        }
        if (validSurrogatePairAt(a, (a.length() - i) - 1) || validSurrogatePairAt(b, (b.length() - i) - 1)) {
            i--;
        }
        return a.subSequence(a.length() - i, a.length()).toString();
    }

    static boolean validSurrogatePairAt(CharSequence string, int index) {
        return index >= 0 && index <= string.length() + (-2) && Character.isHighSurrogate(string.charAt(index)) && Character.isLowSurrogate(string.charAt(index + 1));
    }

    public static String lenientFormat(@CheckForNull String template, @CheckForNull Object... args) {
        int iIndexOf;
        String strValueOf = String.valueOf(template);
        int i = 0;
        if (args == null) {
            args = new Object[]{"(Object[])null"};
        } else {
            for (int i2 = 0; i2 < args.length; i2++) {
                args[i2] = lenientToString(args[i2]);
            }
        }
        StringBuilder sb = new StringBuilder(strValueOf.length() + (args.length * 16));
        int i3 = 0;
        while (i < args.length && (iIndexOf = strValueOf.indexOf("%s", i3)) != -1) {
            sb.append((CharSequence) strValueOf, i3, iIndexOf);
            sb.append(args[i]);
            i3 = iIndexOf + 2;
            i++;
        }
        sb.append((CharSequence) strValueOf, i3, strValueOf.length());
        if (i < args.length) {
            sb.append(" [");
            sb.append(args[i]);
            for (int i4 = i + 1; i4 < args.length; i4++) {
                sb.append(", ");
                sb.append(args[i4]);
            }
            sb.append(']');
        }
        return sb.toString();
    }

    private static String lenientToString(@CheckForNull Object o) {
        if (o == null) {
            return "null";
        }
        try {
            return o.toString();
        } catch (Exception e) {
            String str = o.getClass().getName() + '@' + Integer.toHexString(System.identityHashCode(o));
            Logger.getLogger("com.google.common.base.Strings").log(Level.WARNING, "Exception during lenientFormat for " + str, (Throwable) e);
            return "<" + str + " threw " + e.getClass().getName() + ">";
        }
    }
}
