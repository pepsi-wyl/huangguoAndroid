package com.google.common.base;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Map;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class MoreObjects {
    public static <T> T firstNonNull(@CheckForNull T first, @CheckForNull T second) {
        if (first != null) {
            return first;
        }
        if (second != null) {
            return second;
        }
        throw new NullPointerException("Both parameters are null");
    }

    public static ToStringHelper toStringHelper(Object self) {
        return new ToStringHelper(self.getClass().getSimpleName());
    }

    public static ToStringHelper toStringHelper(Class<?> clazz) {
        return new ToStringHelper(clazz.getSimpleName());
    }

    public static ToStringHelper toStringHelper(String className) {
        return new ToStringHelper(className);
    }

    public static final class ToStringHelper {
        private final String className;
        private final ValueHolder holderHead;
        private ValueHolder holderTail;
        private boolean omitEmptyValues;
        private boolean omitNullValues;

        private ToStringHelper(String className) {
            ValueHolder valueHolder = new ValueHolder();
            this.holderHead = valueHolder;
            this.holderTail = valueHolder;
            this.omitNullValues = false;
            this.omitEmptyValues = false;
            this.className = (String) Preconditions.checkNotNull(className);
        }

        public ToStringHelper omitNullValues() {
            this.omitNullValues = true;
            return this;
        }

        public ToStringHelper add(String name, @CheckForNull Object value) {
            return addHolder(name, value);
        }

        public ToStringHelper add(String name, boolean value) {
            return addUnconditionalHolder(name, String.valueOf(value));
        }

        public ToStringHelper add(String name, char value) {
            return addUnconditionalHolder(name, String.valueOf(value));
        }

        public ToStringHelper add(String name, double value) {
            return addUnconditionalHolder(name, String.valueOf(value));
        }

        public ToStringHelper add(String name, float value) {
            return addUnconditionalHolder(name, String.valueOf(value));
        }

        public ToStringHelper add(String name, int value) {
            return addUnconditionalHolder(name, String.valueOf(value));
        }

        public ToStringHelper add(String name, long value) {
            return addUnconditionalHolder(name, String.valueOf(value));
        }

        public ToStringHelper addValue(@CheckForNull Object value) {
            return addHolder(value);
        }

        public ToStringHelper addValue(boolean value) {
            return addUnconditionalHolder(String.valueOf(value));
        }

        public ToStringHelper addValue(char value) {
            return addUnconditionalHolder(String.valueOf(value));
        }

        public ToStringHelper addValue(double value) {
            return addUnconditionalHolder(String.valueOf(value));
        }

        public ToStringHelper addValue(float value) {
            return addUnconditionalHolder(String.valueOf(value));
        }

        public ToStringHelper addValue(int value) {
            return addUnconditionalHolder(String.valueOf(value));
        }

        public ToStringHelper addValue(long value) {
            return addUnconditionalHolder(String.valueOf(value));
        }

        private static boolean isEmpty(Object value) {
            if (value instanceof CharSequence) {
                return ((CharSequence) value).length() == 0;
            }
            if (value instanceof Collection) {
                return ((Collection) value).isEmpty();
            }
            if (value instanceof Map) {
                return ((Map) value).isEmpty();
            }
            if (value instanceof Optional) {
                return !((Optional) value).isPresent();
            }
            return value.getClass().isArray() && Array.getLength(value) == 0;
        }

        /* JADX WARN: Removed duplicated region for block: B:12:0x0030  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public java.lang.String toString() {
            /*
                r8 = this;
                boolean r0 = r8.omitNullValues
                boolean r1 = r8.omitEmptyValues
                java.lang.StringBuilder r2 = new java.lang.StringBuilder
                r3 = 32
                r2.<init>(r3)
                java.lang.String r3 = r8.className
                r2.append(r3)
                r3 = 123(0x7b, float:1.72E-43)
                r2.append(r3)
                com.google.common.base.MoreObjects$ToStringHelper$ValueHolder r3 = r8.holderHead
                com.google.common.base.MoreObjects$ToStringHelper$ValueHolder r3 = r3.next
                java.lang.String r4 = ""
            L1b:
                if (r3 == 0) goto L68
                java.lang.Object r5 = r3.value
                boolean r6 = r3 instanceof com.google.common.base.MoreObjects.ToStringHelper.UnconditionalValueHolder
                if (r6 != 0) goto L30
                if (r5 != 0) goto L28
                if (r0 != 0) goto L65
                goto L30
            L28:
                if (r1 == 0) goto L30
                boolean r6 = isEmpty(r5)
                if (r6 != 0) goto L65
            L30:
                r2.append(r4)
                java.lang.String r4 = r3.name
                if (r4 == 0) goto L41
                java.lang.String r4 = r3.name
                r2.append(r4)
                r4 = 61
                r2.append(r4)
            L41:
                if (r5 == 0) goto L60
                java.lang.Class r4 = r5.getClass()
                boolean r4 = r4.isArray()
                if (r4 == 0) goto L60
                r4 = 1
                java.lang.Object[] r6 = new java.lang.Object[r4]
                r7 = 0
                r6[r7] = r5
                java.lang.String r5 = java.util.Arrays.deepToString(r6)
                int r6 = r5.length()
                int r6 = r6 - r4
                r2.append(r5, r4, r6)
                goto L63
            L60:
                r2.append(r5)
            L63:
                java.lang.String r4 = ", "
            L65:
                com.google.common.base.MoreObjects$ToStringHelper$ValueHolder r3 = r3.next
                goto L1b
            L68:
                r0 = 125(0x7d, float:1.75E-43)
                r2.append(r0)
                java.lang.String r0 = r2.toString()
                return r0
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.common.base.MoreObjects.ToStringHelper.toString():java.lang.String");
        }

        private ValueHolder addHolder() {
            ValueHolder valueHolder = new ValueHolder();
            this.holderTail.next = valueHolder;
            this.holderTail = valueHolder;
            return valueHolder;
        }

        private ToStringHelper addHolder(@CheckForNull Object value) {
            addHolder().value = value;
            return this;
        }

        private ToStringHelper addHolder(String name, @CheckForNull Object value) {
            ValueHolder valueHolderAddHolder = addHolder();
            valueHolderAddHolder.value = value;
            valueHolderAddHolder.name = (String) Preconditions.checkNotNull(name);
            return this;
        }

        private UnconditionalValueHolder addUnconditionalHolder() {
            UnconditionalValueHolder unconditionalValueHolder = new UnconditionalValueHolder();
            this.holderTail.next = unconditionalValueHolder;
            this.holderTail = unconditionalValueHolder;
            return unconditionalValueHolder;
        }

        private ToStringHelper addUnconditionalHolder(Object value) {
            addUnconditionalHolder().value = value;
            return this;
        }

        private ToStringHelper addUnconditionalHolder(String name, Object value) {
            UnconditionalValueHolder unconditionalValueHolderAddUnconditionalHolder = addUnconditionalHolder();
            unconditionalValueHolderAddUnconditionalHolder.value = value;
            unconditionalValueHolderAddUnconditionalHolder.name = (String) Preconditions.checkNotNull(name);
            return this;
        }

        static class ValueHolder {

            @CheckForNull
            String name;

            @CheckForNull
            ValueHolder next;

            @CheckForNull
            Object value;

            ValueHolder() {
            }
        }

        private static final class UnconditionalValueHolder extends ValueHolder {
            private UnconditionalValueHolder() {
            }
        }
    }

    private MoreObjects() {
    }
}
