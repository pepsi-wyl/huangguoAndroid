package com.google.common.base;

import java.io.IOException;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public class Joiner {
    private final String separator;

    public static Joiner on(String separator) {
        return new Joiner(separator);
    }

    public static Joiner on(char separator) {
        return new Joiner(String.valueOf(separator));
    }

    private Joiner(String separator) {
        this.separator = (String) Preconditions.checkNotNull(separator);
    }

    private Joiner(Joiner prototype) {
        this.separator = prototype.separator;
    }

    public <A extends Appendable> A appendTo(A a, Iterable<? extends Object> iterable) throws IOException {
        return (A) appendTo((Joiner) a, iterable.iterator());
    }

    public <A extends Appendable> A appendTo(A appendable, Iterator<? extends Object> parts) throws IOException {
        Preconditions.checkNotNull(appendable);
        if (parts.hasNext()) {
            appendable.append(toString(parts.next()));
            while (parts.hasNext()) {
                appendable.append(this.separator);
                appendable.append(toString(parts.next()));
            }
        }
        return appendable;
    }

    public final <A extends Appendable> A appendTo(A a, Object[] objArr) throws IOException {
        return (A) appendTo((Joiner) a, (Iterable<? extends Object>) Arrays.asList(objArr));
    }

    public final <A extends Appendable> A appendTo(A a, @CheckForNull Object obj, @CheckForNull Object obj2, Object... objArr) throws IOException {
        return (A) appendTo((Joiner) a, iterable(obj, obj2, objArr));
    }

    public final StringBuilder appendTo(StringBuilder builder, Iterable<? extends Object> parts) {
        return appendTo(builder, parts.iterator());
    }

    public final StringBuilder appendTo(StringBuilder builder, Iterator<? extends Object> parts) {
        try {
            appendTo((Joiner) builder, parts);
            return builder;
        } catch (IOException e) {
            throw new AssertionError(e);
        }
    }

    public final StringBuilder appendTo(StringBuilder builder, Object[] parts) {
        return appendTo(builder, (Iterable<? extends Object>) Arrays.asList(parts));
    }

    public final StringBuilder appendTo(StringBuilder builder, @CheckForNull Object first, @CheckForNull Object second, Object... rest) {
        return appendTo(builder, iterable(first, second, rest));
    }

    public final String join(Iterable<? extends Object> parts) {
        return join(parts.iterator());
    }

    public final String join(Iterator<? extends Object> parts) {
        return appendTo(new StringBuilder(), parts).toString();
    }

    public final String join(Object[] parts) {
        return join(Arrays.asList(parts));
    }

    public final String join(@CheckForNull Object first, @CheckForNull Object second, Object... rest) {
        return join(iterable(first, second, rest));
    }

    public Joiner useForNull(final String nullText) {
        Preconditions.checkNotNull(nullText);
        return new Joiner(this) { // from class: com.google.common.base.Joiner.1
            @Override // com.google.common.base.Joiner
            CharSequence toString(@CheckForNull Object part) {
                return part == null ? nullText : Joiner.this.toString(part);
            }

            @Override // com.google.common.base.Joiner
            public Joiner useForNull(String nullText2) {
                throw new UnsupportedOperationException("already specified useForNull");
            }

            @Override // com.google.common.base.Joiner
            public Joiner skipNulls() {
                throw new UnsupportedOperationException("already specified useForNull");
            }
        };
    }

    public Joiner skipNulls() {
        return new Joiner(this) { // from class: com.google.common.base.Joiner.2
            @Override // com.google.common.base.Joiner
            public <A extends Appendable> A appendTo(A appendable, Iterator<? extends Object> parts) throws IOException {
                Preconditions.checkNotNull(appendable, "appendable");
                Preconditions.checkNotNull(parts, "parts");
                while (true) {
                    if (!parts.hasNext()) {
                        break;
                    }
                    Object next = parts.next();
                    if (next != null) {
                        appendable.append(Joiner.this.toString(next));
                        break;
                    }
                }
                while (parts.hasNext()) {
                    Object next2 = parts.next();
                    if (next2 != null) {
                        appendable.append(Joiner.this.separator);
                        appendable.append(Joiner.this.toString(next2));
                    }
                }
                return appendable;
            }

            @Override // com.google.common.base.Joiner
            public Joiner useForNull(String nullText) {
                throw new UnsupportedOperationException("already specified skipNulls");
            }

            @Override // com.google.common.base.Joiner
            public MapJoiner withKeyValueSeparator(String kvs) {
                throw new UnsupportedOperationException("can't use .skipNulls() with maps");
            }
        };
    }

    public MapJoiner withKeyValueSeparator(char keyValueSeparator) {
        return withKeyValueSeparator(String.valueOf(keyValueSeparator));
    }

    public MapJoiner withKeyValueSeparator(String keyValueSeparator) {
        return new MapJoiner(keyValueSeparator);
    }

    public static final class MapJoiner {
        private final Joiner joiner;
        private final String keyValueSeparator;

        private MapJoiner(Joiner joiner, String keyValueSeparator) {
            this.joiner = joiner;
            this.keyValueSeparator = (String) Preconditions.checkNotNull(keyValueSeparator);
        }

        public <A extends Appendable> A appendTo(A a, Map<?, ?> map) throws IOException {
            return (A) appendTo((MapJoiner) a, (Iterable<? extends Map.Entry<?, ?>>) map.entrySet());
        }

        public StringBuilder appendTo(StringBuilder builder, Map<?, ?> map) {
            return appendTo(builder, (Iterable<? extends Map.Entry<?, ?>>) map.entrySet());
        }

        public <A extends Appendable> A appendTo(A a, Iterable<? extends Map.Entry<?, ?>> iterable) throws IOException {
            return (A) appendTo((MapJoiner) a, iterable.iterator());
        }

        public <A extends Appendable> A appendTo(A appendable, Iterator<? extends Map.Entry<?, ?>> parts) throws IOException {
            Preconditions.checkNotNull(appendable);
            if (parts.hasNext()) {
                Map.Entry<?, ?> next = parts.next();
                appendable.append(this.joiner.toString(next.getKey()));
                appendable.append(this.keyValueSeparator);
                appendable.append(this.joiner.toString(next.getValue()));
                while (parts.hasNext()) {
                    appendable.append(this.joiner.separator);
                    Map.Entry<?, ?> next2 = parts.next();
                    appendable.append(this.joiner.toString(next2.getKey()));
                    appendable.append(this.keyValueSeparator);
                    appendable.append(this.joiner.toString(next2.getValue()));
                }
            }
            return appendable;
        }

        public StringBuilder appendTo(StringBuilder builder, Iterable<? extends Map.Entry<?, ?>> entries) {
            return appendTo(builder, entries.iterator());
        }

        public StringBuilder appendTo(StringBuilder builder, Iterator<? extends Map.Entry<?, ?>> entries) {
            try {
                appendTo((MapJoiner) builder, entries);
                return builder;
            } catch (IOException e) {
                throw new AssertionError(e);
            }
        }

        public String join(Map<?, ?> map) {
            return join(map.entrySet());
        }

        public String join(Iterable<? extends Map.Entry<?, ?>> entries) {
            return join(entries.iterator());
        }

        public String join(Iterator<? extends Map.Entry<?, ?>> entries) {
            return appendTo(new StringBuilder(), entries).toString();
        }

        public MapJoiner useForNull(String nullText) {
            return new MapJoiner(this.joiner.useForNull(nullText), this.keyValueSeparator);
        }
    }

    CharSequence toString(@CheckForNull Object part) {
        java.util.Objects.requireNonNull(part);
        return part instanceof CharSequence ? (CharSequence) part : part.toString();
    }

    private static Iterable<Object> iterable(@CheckForNull final Object first, @CheckForNull final Object second, final Object[] rest) {
        Preconditions.checkNotNull(rest);
        return new AbstractList<Object>() { // from class: com.google.common.base.Joiner.3
            @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
            public int size() {
                return rest.length + 2;
            }

            @Override // java.util.AbstractList, java.util.List
            @CheckForNull
            public Object get(int index) {
                if (index == 0) {
                    return first;
                }
                if (index == 1) {
                    return second;
                }
                return rest[index - 2];
            }
        };
    }
}
