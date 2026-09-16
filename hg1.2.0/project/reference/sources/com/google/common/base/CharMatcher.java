package com.google.common.base;

import java.util.Arrays;
import java.util.BitSet;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class CharMatcher implements Predicate<Character> {
    private static final int DISTINCT_CHARS = 65536;

    private static boolean isSmall(int totalCharacters, int tableLength) {
        return totalCharacters <= 1023 && tableLength > totalCharacters * 64;
    }

    public abstract boolean matches(char c);

    public static CharMatcher any() {
        return Any.INSTANCE;
    }

    public static CharMatcher none() {
        return None.INSTANCE;
    }

    public static CharMatcher whitespace() {
        return Whitespace.INSTANCE;
    }

    public static CharMatcher breakingWhitespace() {
        return BreakingWhitespace.INSTANCE;
    }

    public static CharMatcher ascii() {
        return Ascii.INSTANCE;
    }

    @Deprecated
    public static CharMatcher digit() {
        return Digit.INSTANCE;
    }

    @Deprecated
    public static CharMatcher javaDigit() {
        return JavaDigit.INSTANCE;
    }

    @Deprecated
    public static CharMatcher javaLetter() {
        return JavaLetter.INSTANCE;
    }

    @Deprecated
    public static CharMatcher javaLetterOrDigit() {
        return JavaLetterOrDigit.INSTANCE;
    }

    @Deprecated
    public static CharMatcher javaUpperCase() {
        return JavaUpperCase.INSTANCE;
    }

    @Deprecated
    public static CharMatcher javaLowerCase() {
        return JavaLowerCase.INSTANCE;
    }

    public static CharMatcher javaIsoControl() {
        return JavaIsoControl.INSTANCE;
    }

    @Deprecated
    public static CharMatcher invisible() {
        return Invisible.INSTANCE;
    }

    @Deprecated
    public static CharMatcher singleWidth() {
        return SingleWidth.INSTANCE;
    }

    public static CharMatcher is(final char match) {
        return new Is(match);
    }

    public static CharMatcher isNot(final char match) {
        return new IsNot(match);
    }

    public static CharMatcher anyOf(final CharSequence sequence) {
        int length = sequence.length();
        if (length == 0) {
            return none();
        }
        if (length == 1) {
            return is(sequence.charAt(0));
        }
        if (length == 2) {
            return isEither(sequence.charAt(0), sequence.charAt(1));
        }
        return new AnyOf(sequence);
    }

    public static CharMatcher noneOf(CharSequence sequence) {
        return anyOf(sequence).negate();
    }

    public static CharMatcher inRange(final char startInclusive, final char endInclusive) {
        return new InRange(startInclusive, endInclusive);
    }

    public static CharMatcher forPredicate(final Predicate<? super Character> predicate) {
        return predicate instanceof CharMatcher ? (CharMatcher) predicate : new ForPredicate(predicate);
    }

    protected CharMatcher() {
    }

    public CharMatcher negate() {
        return new Negated(this);
    }

    public CharMatcher and(CharMatcher other) {
        return new And(this, other);
    }

    public CharMatcher or(CharMatcher other) {
        return new Or(this, other);
    }

    public CharMatcher precomputed() {
        return Platform.precomputeCharMatcher(this);
    }

    CharMatcher precomputedInternal() {
        String strSubstring;
        BitSet bitSet = new BitSet();
        setBits(bitSet);
        int iCardinality = bitSet.cardinality();
        if (iCardinality * 2 <= 65536) {
            return precomputedPositive(iCardinality, bitSet, toString());
        }
        bitSet.flip(0, 65536);
        int i = 65536 - iCardinality;
        final String string = toString();
        if (string.endsWith(".negate()")) {
            strSubstring = string.substring(0, string.length() - 9);
        } else {
            strSubstring = string + ".negate()";
        }
        return new NegatedFastMatcher(this, precomputedPositive(i, bitSet, strSubstring)) { // from class: com.google.common.base.CharMatcher.1
            @Override // com.google.common.base.CharMatcher.Negated, com.google.common.base.CharMatcher
            public String toString() {
                return string;
            }
        };
    }

    private static CharMatcher precomputedPositive(int totalCharacters, BitSet table, String description) {
        if (totalCharacters == 0) {
            return none();
        }
        if (totalCharacters == 1) {
            return is((char) table.nextSetBit(0));
        }
        if (totalCharacters == 2) {
            char cNextSetBit = (char) table.nextSetBit(0);
            return isEither(cNextSetBit, (char) table.nextSetBit(cNextSetBit + 1));
        }
        if (isSmall(totalCharacters, table.length())) {
            return SmallCharMatcher.from(table, description);
        }
        return new BitSetMatcher(table, description);
    }

    void setBits(BitSet table) {
        for (int i = 65535; i >= 0; i--) {
            if (matches((char) i)) {
                table.set(i);
            }
        }
    }

    public boolean matchesAnyOf(CharSequence sequence) {
        return !matchesNoneOf(sequence);
    }

    public boolean matchesAllOf(CharSequence sequence) {
        for (int length = sequence.length() - 1; length >= 0; length--) {
            if (!matches(sequence.charAt(length))) {
                return false;
            }
        }
        return true;
    }

    public boolean matchesNoneOf(CharSequence sequence) {
        return indexIn(sequence) == -1;
    }

    public int indexIn(CharSequence sequence) {
        return indexIn(sequence, 0);
    }

    public int indexIn(CharSequence sequence, int start) {
        int length = sequence.length();
        Preconditions.checkPositionIndex(start, length);
        while (start < length) {
            if (matches(sequence.charAt(start))) {
                return start;
            }
            start++;
        }
        return -1;
    }

    public int lastIndexIn(CharSequence sequence) {
        for (int length = sequence.length() - 1; length >= 0; length--) {
            if (matches(sequence.charAt(length))) {
                return length;
            }
        }
        return -1;
    }

    public int countIn(CharSequence sequence) {
        int i = 0;
        for (int i2 = 0; i2 < sequence.length(); i2++) {
            if (matches(sequence.charAt(i2))) {
                i++;
            }
        }
        return i;
    }

    public String removeFrom(CharSequence sequence) {
        String string = sequence.toString();
        int iIndexIn = indexIn(string);
        if (iIndexIn == -1) {
            return string;
        }
        char[] charArray = string.toCharArray();
        int i = 1;
        while (true) {
            iIndexIn++;
            while (iIndexIn != charArray.length) {
                if (matches(charArray[iIndexIn])) {
                    break;
                }
                charArray[iIndexIn - i] = charArray[iIndexIn];
                iIndexIn++;
            }
            return new String(charArray, 0, iIndexIn - i);
            i++;
        }
    }

    public String retainFrom(CharSequence sequence) {
        return negate().removeFrom(sequence);
    }

    public String replaceFrom(CharSequence sequence, char replacement) {
        String string = sequence.toString();
        int iIndexIn = indexIn(string);
        if (iIndexIn == -1) {
            return string;
        }
        char[] charArray = string.toCharArray();
        charArray[iIndexIn] = replacement;
        while (true) {
            iIndexIn++;
            if (iIndexIn < charArray.length) {
                if (matches(charArray[iIndexIn])) {
                    charArray[iIndexIn] = replacement;
                }
            } else {
                return new String(charArray);
            }
        }
    }

    public String replaceFrom(CharSequence sequence, CharSequence replacement) {
        int length = replacement.length();
        if (length == 0) {
            return removeFrom(sequence);
        }
        int i = 0;
        if (length == 1) {
            return replaceFrom(sequence, replacement.charAt(0));
        }
        String string = sequence.toString();
        int iIndexIn = indexIn(string);
        if (iIndexIn == -1) {
            return string;
        }
        int length2 = string.length();
        StringBuilder sb = new StringBuilder(((length2 * 3) / 2) + 16);
        do {
            sb.append((CharSequence) string, i, iIndexIn);
            sb.append(replacement);
            i = iIndexIn + 1;
            iIndexIn = indexIn(string, i);
        } while (iIndexIn != -1);
        sb.append((CharSequence) string, i, length2);
        return sb.toString();
    }

    public String trimFrom(CharSequence sequence) {
        int length = sequence.length();
        int i = 0;
        while (i < length && matches(sequence.charAt(i))) {
            i++;
        }
        int i2 = length - 1;
        while (i2 > i && matches(sequence.charAt(i2))) {
            i2--;
        }
        return sequence.subSequence(i, i2 + 1).toString();
    }

    public String trimLeadingFrom(CharSequence sequence) {
        int length = sequence.length();
        for (int i = 0; i < length; i++) {
            if (!matches(sequence.charAt(i))) {
                return sequence.subSequence(i, length).toString();
            }
        }
        return "";
    }

    public String trimTrailingFrom(CharSequence sequence) {
        for (int length = sequence.length() - 1; length >= 0; length--) {
            if (!matches(sequence.charAt(length))) {
                return sequence.subSequence(0, length + 1).toString();
            }
        }
        return "";
    }

    public String collapseFrom(CharSequence sequence, char replacement) {
        int length = sequence.length();
        int i = 0;
        while (i < length) {
            char cCharAt = sequence.charAt(i);
            if (matches(cCharAt)) {
                if (cCharAt != replacement || (i != length - 1 && matches(sequence.charAt(i + 1)))) {
                    StringBuilder sb = new StringBuilder(length);
                    sb.append(sequence, 0, i);
                    sb.append(replacement);
                    return finishCollapseFrom(sequence, i + 1, length, replacement, sb, true);
                }
                i++;
            }
            i++;
        }
        return sequence.toString();
    }

    public String trimAndCollapseFrom(CharSequence sequence, char replacement) {
        int length = sequence.length();
        int i = length - 1;
        int i2 = 0;
        while (i2 < length && matches(sequence.charAt(i2))) {
            i2++;
        }
        int i3 = i;
        while (i3 > i2 && matches(sequence.charAt(i3))) {
            i3--;
        }
        if (i2 == 0 && i3 == i) {
            return collapseFrom(sequence, replacement);
        }
        int i4 = i3 + 1;
        return finishCollapseFrom(sequence, i2, i4, replacement, new StringBuilder(i4 - i2), false);
    }

    private String finishCollapseFrom(CharSequence sequence, int start, int end, char replacement, StringBuilder builder, boolean inMatchingGroup) {
        while (start < end) {
            char cCharAt = sequence.charAt(start);
            if (!matches(cCharAt)) {
                builder.append(cCharAt);
                inMatchingGroup = false;
            } else if (!inMatchingGroup) {
                builder.append(replacement);
                inMatchingGroup = true;
            }
            start++;
        }
        return builder.toString();
    }

    @Override // com.google.common.base.Predicate
    @Deprecated
    public boolean apply(Character character) {
        return matches(character.charValue());
    }

    public String toString() {
        return super.toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String showCharacter(char c) {
        char[] cArr = {'\\', 'u', 0, 0, 0, 0};
        for (int i = 0; i < 4; i++) {
            cArr[5 - i] = "0123456789ABCDEF".charAt(c & 15);
            c = (char) (c >> 4);
        }
        return String.copyValueOf(cArr);
    }

    static abstract class FastMatcher extends CharMatcher {
        @Override // com.google.common.base.CharMatcher
        public final CharMatcher precomputed() {
            return this;
        }

        FastMatcher() {
        }

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        @Override // com.google.common.base.CharMatcher
        public CharMatcher negate() {
            return new NegatedFastMatcher(this);
        }
    }

    static abstract class NamedFastMatcher extends FastMatcher {
        private final String description;

        NamedFastMatcher(String description) {
            this.description = (String) Preconditions.checkNotNull(description);
        }

        @Override // com.google.common.base.CharMatcher
        public final String toString() {
            return this.description;
        }
    }

    private static class NegatedFastMatcher extends Negated {
        @Override // com.google.common.base.CharMatcher
        public final CharMatcher precomputed() {
            return this;
        }

        NegatedFastMatcher(CharMatcher original) {
            super(original);
        }
    }

    private static final class BitSetMatcher extends NamedFastMatcher {
        private final BitSet table;

        private BitSetMatcher(BitSet table, String description) {
            super(description);
            this.table = table.length() + 64 < table.size() ? (BitSet) table.clone() : table;
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return this.table.get(c);
        }

        @Override // com.google.common.base.CharMatcher
        void setBits(BitSet bitSet) {
            bitSet.or(this.table);
        }
    }

    private static final class Any extends NamedFastMatcher {
        static final CharMatcher INSTANCE = new Any();

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return true;
        }

        private Any() {
            super("CharMatcher.any()");
        }

        @Override // com.google.common.base.CharMatcher
        public int indexIn(CharSequence sequence) {
            return sequence.length() == 0 ? -1 : 0;
        }

        @Override // com.google.common.base.CharMatcher
        public int indexIn(CharSequence sequence, int start) {
            int length = sequence.length();
            Preconditions.checkPositionIndex(start, length);
            if (start == length) {
                return -1;
            }
            return start;
        }

        @Override // com.google.common.base.CharMatcher
        public int lastIndexIn(CharSequence sequence) {
            return sequence.length() - 1;
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matchesAllOf(CharSequence sequence) {
            Preconditions.checkNotNull(sequence);
            return true;
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matchesNoneOf(CharSequence sequence) {
            return sequence.length() == 0;
        }

        @Override // com.google.common.base.CharMatcher
        public String removeFrom(CharSequence sequence) {
            Preconditions.checkNotNull(sequence);
            return "";
        }

        @Override // com.google.common.base.CharMatcher
        public String replaceFrom(CharSequence sequence, char replacement) {
            char[] cArr = new char[sequence.length()];
            Arrays.fill(cArr, replacement);
            return new String(cArr);
        }

        @Override // com.google.common.base.CharMatcher
        public String replaceFrom(CharSequence sequence, CharSequence replacement) {
            StringBuilder sb = new StringBuilder(sequence.length() * replacement.length());
            for (int i = 0; i < sequence.length(); i++) {
                sb.append(replacement);
            }
            return sb.toString();
        }

        @Override // com.google.common.base.CharMatcher
        public String collapseFrom(CharSequence sequence, char replacement) {
            return sequence.length() == 0 ? "" : String.valueOf(replacement);
        }

        @Override // com.google.common.base.CharMatcher
        public String trimFrom(CharSequence sequence) {
            Preconditions.checkNotNull(sequence);
            return "";
        }

        @Override // com.google.common.base.CharMatcher
        public int countIn(CharSequence sequence) {
            return sequence.length();
        }

        @Override // com.google.common.base.CharMatcher
        public CharMatcher and(CharMatcher other) {
            return (CharMatcher) Preconditions.checkNotNull(other);
        }

        @Override // com.google.common.base.CharMatcher
        public CharMatcher or(CharMatcher other) {
            Preconditions.checkNotNull(other);
            return this;
        }

        @Override // com.google.common.base.CharMatcher.FastMatcher, com.google.common.base.CharMatcher
        public CharMatcher negate() {
            return none();
        }
    }

    private static final class None extends NamedFastMatcher {
        static final CharMatcher INSTANCE = new None();

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return false;
        }

        private None() {
            super("CharMatcher.none()");
        }

        @Override // com.google.common.base.CharMatcher
        public int indexIn(CharSequence sequence) {
            Preconditions.checkNotNull(sequence);
            return -1;
        }

        @Override // com.google.common.base.CharMatcher
        public int indexIn(CharSequence sequence, int start) {
            Preconditions.checkPositionIndex(start, sequence.length());
            return -1;
        }

        @Override // com.google.common.base.CharMatcher
        public int lastIndexIn(CharSequence sequence) {
            Preconditions.checkNotNull(sequence);
            return -1;
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matchesAllOf(CharSequence sequence) {
            return sequence.length() == 0;
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matchesNoneOf(CharSequence sequence) {
            Preconditions.checkNotNull(sequence);
            return true;
        }

        @Override // com.google.common.base.CharMatcher
        public String removeFrom(CharSequence sequence) {
            return sequence.toString();
        }

        @Override // com.google.common.base.CharMatcher
        public String replaceFrom(CharSequence sequence, char replacement) {
            return sequence.toString();
        }

        @Override // com.google.common.base.CharMatcher
        public String replaceFrom(CharSequence sequence, CharSequence replacement) {
            Preconditions.checkNotNull(replacement);
            return sequence.toString();
        }

        @Override // com.google.common.base.CharMatcher
        public String collapseFrom(CharSequence sequence, char replacement) {
            return sequence.toString();
        }

        @Override // com.google.common.base.CharMatcher
        public String trimFrom(CharSequence sequence) {
            return sequence.toString();
        }

        @Override // com.google.common.base.CharMatcher
        public String trimLeadingFrom(CharSequence sequence) {
            return sequence.toString();
        }

        @Override // com.google.common.base.CharMatcher
        public String trimTrailingFrom(CharSequence sequence) {
            return sequence.toString();
        }

        @Override // com.google.common.base.CharMatcher
        public int countIn(CharSequence sequence) {
            Preconditions.checkNotNull(sequence);
            return 0;
        }

        @Override // com.google.common.base.CharMatcher
        public CharMatcher and(CharMatcher other) {
            Preconditions.checkNotNull(other);
            return this;
        }

        @Override // com.google.common.base.CharMatcher
        public CharMatcher or(CharMatcher other) {
            return (CharMatcher) Preconditions.checkNotNull(other);
        }

        @Override // com.google.common.base.CharMatcher.FastMatcher, com.google.common.base.CharMatcher
        public CharMatcher negate() {
            return any();
        }
    }

    static final class Whitespace extends NamedFastMatcher {
        static final int MULTIPLIER = 1682554634;
        static final String TABLE = "\u2002\u3000\r\u0085\u200a\u2005\u2000\u3000\u2029\u000b\u3000\u2008\u2003\u205f\u3000\u1680\t \u2006\u2001  \f\u2009\u3000\u2004\u3000\u3000\u2028\n \u3000";
        static final int SHIFT = Integer.numberOfLeadingZeros(31);
        static final CharMatcher INSTANCE = new Whitespace();

        Whitespace() {
            super("CharMatcher.whitespace()");
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return TABLE.charAt((MULTIPLIER * c) >>> SHIFT) == c;
        }

        @Override // com.google.common.base.CharMatcher
        void setBits(BitSet table) {
            for (int i = 0; i < 32; i++) {
                table.set(TABLE.charAt(i));
            }
        }
    }

    private static final class BreakingWhitespace extends CharMatcher {
        static final CharMatcher INSTANCE = new BreakingWhitespace();

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            if (c != ' ' && c != 133 && c != 5760) {
                if (c == 8199) {
                    return false;
                }
                if (c != 8287 && c != 12288 && c != 8232 && c != 8233) {
                    switch (c) {
                        case '\t':
                        case '\n':
                        case 11:
                        case '\f':
                        case '\r':
                            break;
                        default:
                            return c >= 8192 && c <= 8202;
                    }
                }
            }
            return true;
        }

        private BreakingWhitespace() {
        }

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.breakingWhitespace()";
        }
    }

    private static final class Ascii extends NamedFastMatcher {
        static final CharMatcher INSTANCE = new Ascii();

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return c <= 127;
        }

        Ascii() {
            super("CharMatcher.ascii()");
        }
    }

    private static class RangesMatcher extends CharMatcher {
        private final String description;
        private final char[] rangeEnds;
        private final char[] rangeStarts;

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        RangesMatcher(String description, char[] rangeStarts, char[] rangeEnds) {
            this.description = description;
            this.rangeStarts = rangeStarts;
            this.rangeEnds = rangeEnds;
            Preconditions.checkArgument(rangeStarts.length == rangeEnds.length);
            int i = 0;
            while (i < rangeStarts.length) {
                Preconditions.checkArgument(rangeStarts[i] <= rangeEnds[i]);
                int i2 = i + 1;
                if (i2 < rangeStarts.length) {
                    Preconditions.checkArgument(rangeEnds[i] < rangeStarts[i2]);
                }
                i = i2;
            }
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            int iBinarySearch = Arrays.binarySearch(this.rangeStarts, c);
            if (iBinarySearch >= 0) {
                return true;
            }
            int i = (~iBinarySearch) - 1;
            return i >= 0 && c <= this.rangeEnds[i];
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return this.description;
        }
    }

    private static final class Digit extends RangesMatcher {
        static final CharMatcher INSTANCE = new Digit();
        private static final String ZEROES = "0٠۰߀०০੦૦୦௦౦೦൦෦๐໐༠၀႐០᠐᥆᧐᪀᪐᭐᮰᱀᱐꘠꣐꤀꧐꧰꩐꯰０";

        private static char[] zeroes() {
            return ZEROES.toCharArray();
        }

        private static char[] nines() {
            char[] cArr = new char[37];
            for (int i = 0; i < 37; i++) {
                cArr[i] = (char) (ZEROES.charAt(i) + '\t');
            }
            return cArr;
        }

        private Digit() {
            super("CharMatcher.digit()", zeroes(), nines());
        }
    }

    private static final class JavaDigit extends CharMatcher {
        static final CharMatcher INSTANCE = new JavaDigit();

        private JavaDigit() {
        }

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return Character.isDigit(c);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.javaDigit()";
        }
    }

    private static final class JavaLetter extends CharMatcher {
        static final CharMatcher INSTANCE = new JavaLetter();

        private JavaLetter() {
        }

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return Character.isLetter(c);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.javaLetter()";
        }
    }

    private static final class JavaLetterOrDigit extends CharMatcher {
        static final CharMatcher INSTANCE = new JavaLetterOrDigit();

        private JavaLetterOrDigit() {
        }

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return Character.isLetterOrDigit(c);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.javaLetterOrDigit()";
        }
    }

    private static final class JavaUpperCase extends CharMatcher {
        static final CharMatcher INSTANCE = new JavaUpperCase();

        private JavaUpperCase() {
        }

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return Character.isUpperCase(c);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.javaUpperCase()";
        }
    }

    private static final class JavaLowerCase extends CharMatcher {
        static final CharMatcher INSTANCE = new JavaLowerCase();

        private JavaLowerCase() {
        }

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return Character.isLowerCase(c);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.javaLowerCase()";
        }
    }

    private static final class JavaIsoControl extends NamedFastMatcher {
        static final CharMatcher INSTANCE = new JavaIsoControl();

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return c <= 31 || (c >= 127 && c <= 159);
        }

        private JavaIsoControl() {
            super("CharMatcher.javaIsoControl()");
        }
    }

    private static final class Invisible extends RangesMatcher {
        static final CharMatcher INSTANCE = new Invisible();
        private static final String RANGE_ENDS = "  \u00ad\u0605\u061c\u06dd\u070f\u0891\u08e2\u1680\u180e\u200f \u2064\u206f\u3000\uf8ff\ufeff\ufffb";
        private static final String RANGE_STARTS = "\u0000\u007f\u00ad\u0600\u061c\u06dd\u070f\u0890\u08e2\u1680\u180e\u2000\u2028\u205f\u2066\u3000\ud800\ufeff\ufff9";

        private Invisible() {
            super("CharMatcher.invisible()", RANGE_STARTS.toCharArray(), RANGE_ENDS.toCharArray());
        }
    }

    private static final class SingleWidth extends RangesMatcher {
        static final CharMatcher INSTANCE = new SingleWidth();

        private SingleWidth() {
            super("CharMatcher.singleWidth()", "\u0000־א׳\u0600ݐ\u0e00Ḁ℀ﭐﹰ｡".toCharArray(), "ӹ־ת״ۿݿ\u0e7f₯℺\ufdff\ufeffￜ".toCharArray());
        }
    }

    private static class Negated extends CharMatcher {
        final CharMatcher original;

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        Negated(CharMatcher original) {
            this.original = (CharMatcher) Preconditions.checkNotNull(original);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return !this.original.matches(c);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matchesAllOf(CharSequence sequence) {
            return this.original.matchesNoneOf(sequence);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matchesNoneOf(CharSequence sequence) {
            return this.original.matchesAllOf(sequence);
        }

        @Override // com.google.common.base.CharMatcher
        public int countIn(CharSequence sequence) {
            return sequence.length() - this.original.countIn(sequence);
        }

        @Override // com.google.common.base.CharMatcher
        void setBits(BitSet table) {
            BitSet bitSet = new BitSet();
            this.original.setBits(bitSet);
            bitSet.flip(0, 65536);
            table.or(bitSet);
        }

        @Override // com.google.common.base.CharMatcher
        public CharMatcher negate() {
            return this.original;
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return this.original + ".negate()";
        }
    }

    private static final class And extends CharMatcher {
        final CharMatcher first;
        final CharMatcher second;

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        And(CharMatcher a, CharMatcher b) {
            this.first = (CharMatcher) Preconditions.checkNotNull(a);
            this.second = (CharMatcher) Preconditions.checkNotNull(b);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return this.first.matches(c) && this.second.matches(c);
        }

        @Override // com.google.common.base.CharMatcher
        void setBits(BitSet table) {
            BitSet bitSet = new BitSet();
            this.first.setBits(bitSet);
            BitSet bitSet2 = new BitSet();
            this.second.setBits(bitSet2);
            bitSet.and(bitSet2);
            table.or(bitSet);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.and(" + this.first + ", " + this.second + ")";
        }
    }

    private static final class Or extends CharMatcher {
        final CharMatcher first;
        final CharMatcher second;

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        Or(CharMatcher a, CharMatcher b) {
            this.first = (CharMatcher) Preconditions.checkNotNull(a);
            this.second = (CharMatcher) Preconditions.checkNotNull(b);
        }

        @Override // com.google.common.base.CharMatcher
        void setBits(BitSet table) {
            this.first.setBits(table);
            this.second.setBits(table);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return this.first.matches(c) || this.second.matches(c);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.or(" + this.first + ", " + this.second + ")";
        }
    }

    private static final class Is extends FastMatcher {
        private final char match;

        Is(char match) {
            this.match = match;
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return c == this.match;
        }

        @Override // com.google.common.base.CharMatcher
        public String replaceFrom(CharSequence sequence, char replacement) {
            return sequence.toString().replace(this.match, replacement);
        }

        @Override // com.google.common.base.CharMatcher
        public CharMatcher and(CharMatcher other) {
            return other.matches(this.match) ? this : none();
        }

        @Override // com.google.common.base.CharMatcher
        public CharMatcher or(CharMatcher other) {
            return other.matches(this.match) ? other : super.or(other);
        }

        @Override // com.google.common.base.CharMatcher.FastMatcher, com.google.common.base.CharMatcher
        public CharMatcher negate() {
            return isNot(this.match);
        }

        @Override // com.google.common.base.CharMatcher
        void setBits(BitSet table) {
            table.set(this.match);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.is('" + CharMatcher.showCharacter(this.match) + "')";
        }
    }

    private static final class IsNot extends FastMatcher {
        private final char match;

        IsNot(char match) {
            this.match = match;
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return c != this.match;
        }

        @Override // com.google.common.base.CharMatcher
        public CharMatcher and(CharMatcher other) {
            return other.matches(this.match) ? super.and(other) : other;
        }

        @Override // com.google.common.base.CharMatcher
        public CharMatcher or(CharMatcher other) {
            return other.matches(this.match) ? any() : this;
        }

        @Override // com.google.common.base.CharMatcher
        void setBits(BitSet table) {
            table.set(0, this.match);
            table.set(this.match + 1, 65536);
        }

        @Override // com.google.common.base.CharMatcher.FastMatcher, com.google.common.base.CharMatcher
        public CharMatcher negate() {
            return is(this.match);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.isNot('" + CharMatcher.showCharacter(this.match) + "')";
        }
    }

    private static IsEither isEither(char c1, char c2) {
        return new IsEither(c1, c2);
    }

    private static final class IsEither extends FastMatcher {
        private final char match1;
        private final char match2;

        IsEither(char match1, char match2) {
            this.match1 = match1;
            this.match2 = match2;
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return c == this.match1 || c == this.match2;
        }

        @Override // com.google.common.base.CharMatcher
        void setBits(BitSet table) {
            table.set(this.match1);
            table.set(this.match2);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.anyOf(\"" + CharMatcher.showCharacter(this.match1) + CharMatcher.showCharacter(this.match2) + "\")";
        }
    }

    private static final class AnyOf extends CharMatcher {
        private final char[] chars;

        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        @Deprecated
        public /* bridge */ /* synthetic */ boolean apply(Character character) {
            return super.apply(character);
        }

        public AnyOf(CharSequence chars) {
            char[] charArray = chars.toString().toCharArray();
            this.chars = charArray;
            Arrays.sort(charArray);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return Arrays.binarySearch(this.chars, c) >= 0;
        }

        @Override // com.google.common.base.CharMatcher
        void setBits(BitSet table) {
            for (char c : this.chars) {
                table.set(c);
            }
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            StringBuilder sb = new StringBuilder("CharMatcher.anyOf(\"");
            for (char c : this.chars) {
                sb.append(CharMatcher.showCharacter(c));
            }
            sb.append("\")");
            return sb.toString();
        }
    }

    private static final class InRange extends FastMatcher {
        private final char endInclusive;
        private final char startInclusive;

        InRange(char startInclusive, char endInclusive) {
            Preconditions.checkArgument(endInclusive >= startInclusive);
            this.startInclusive = startInclusive;
            this.endInclusive = endInclusive;
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return this.startInclusive <= c && c <= this.endInclusive;
        }

        @Override // com.google.common.base.CharMatcher
        void setBits(BitSet table) {
            table.set(this.startInclusive, this.endInclusive + 1);
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.inRange('" + CharMatcher.showCharacter(this.startInclusive) + "', '" + CharMatcher.showCharacter(this.endInclusive) + "')";
        }
    }

    private static final class ForPredicate extends CharMatcher {
        private final Predicate<? super Character> predicate;

        ForPredicate(Predicate<? super Character> predicate) {
            this.predicate = (Predicate) Preconditions.checkNotNull(predicate);
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return this.predicate.apply(Character.valueOf(c));
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.google.common.base.CharMatcher, com.google.common.base.Predicate
        public boolean apply(Character character) {
            return this.predicate.apply(Preconditions.checkNotNull(character));
        }

        @Override // com.google.common.base.CharMatcher
        public String toString() {
            return "CharMatcher.forPredicate(" + this.predicate + ")";
        }
    }
}
