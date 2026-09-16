package com.google.common.base;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Predicates {

    enum ObjectPredicate implements Predicate<Object> {
        ALWAYS_TRUE { // from class: com.google.common.base.Predicates.ObjectPredicate.1
            @Override // com.google.common.base.Predicate
            public boolean apply(@CheckForNull Object o) {
                return true;
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Predicates.alwaysTrue()";
            }
        },
        ALWAYS_FALSE { // from class: com.google.common.base.Predicates.ObjectPredicate.2
            @Override // com.google.common.base.Predicate
            public boolean apply(@CheckForNull Object o) {
                return false;
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Predicates.alwaysFalse()";
            }
        },
        IS_NULL { // from class: com.google.common.base.Predicates.ObjectPredicate.3
            @Override // com.google.common.base.Predicate
            public boolean apply(@CheckForNull Object o) {
                return o == null;
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Predicates.isNull()";
            }
        },
        NOT_NULL { // from class: com.google.common.base.Predicates.ObjectPredicate.4
            @Override // com.google.common.base.Predicate
            public boolean apply(@CheckForNull Object o) {
                return o != null;
            }

            @Override // java.lang.Enum
            public String toString() {
                return "Predicates.notNull()";
            }
        };

        <T> Predicate<T> withNarrowedType() {
            return this;
        }
    }

    private Predicates() {
    }

    public static <T> Predicate<T> alwaysTrue() {
        return ObjectPredicate.ALWAYS_TRUE.withNarrowedType();
    }

    public static <T> Predicate<T> alwaysFalse() {
        return ObjectPredicate.ALWAYS_FALSE.withNarrowedType();
    }

    public static <T> Predicate<T> isNull() {
        return ObjectPredicate.IS_NULL.withNarrowedType();
    }

    public static <T> Predicate<T> notNull() {
        return ObjectPredicate.NOT_NULL.withNarrowedType();
    }

    public static <T> Predicate<T> not(Predicate<T> predicate) {
        return new NotPredicate(predicate);
    }

    public static <T> Predicate<T> and(Iterable<? extends Predicate<? super T>> components) {
        return new AndPredicate(defensiveCopy(components));
    }

    @SafeVarargs
    public static <T> Predicate<T> and(Predicate<? super T>... components) {
        return new AndPredicate(defensiveCopy(components));
    }

    public static <T> Predicate<T> and(Predicate<? super T> first, Predicate<? super T> second) {
        return new AndPredicate(asList((Predicate) Preconditions.checkNotNull(first), (Predicate) Preconditions.checkNotNull(second)));
    }

    public static <T> Predicate<T> or(Iterable<? extends Predicate<? super T>> components) {
        return new OrPredicate(defensiveCopy(components));
    }

    @SafeVarargs
    public static <T> Predicate<T> or(Predicate<? super T>... components) {
        return new OrPredicate(defensiveCopy(components));
    }

    public static <T> Predicate<T> or(Predicate<? super T> first, Predicate<? super T> second) {
        return new OrPredicate(asList((Predicate) Preconditions.checkNotNull(first), (Predicate) Preconditions.checkNotNull(second)));
    }

    public static <T> Predicate<T> equalTo(@ParametricNullness T target) {
        if (target == null) {
            return isNull();
        }
        return new IsEqualToPredicate(target).withNarrowedType();
    }

    public static <T> Predicate<T> instanceOf(Class<?> clazz) {
        return new InstanceOfPredicate(clazz);
    }

    public static Predicate<Class<?>> subtypeOf(Class<?> clazz) {
        return new SubtypeOfPredicate(clazz);
    }

    public static <T> Predicate<T> in(Collection<? extends T> target) {
        return new InPredicate(target);
    }

    public static <A, B> Predicate<A> compose(Predicate<B> predicate, Function<A, ? extends B> function) {
        return new CompositionPredicate(predicate, function);
    }

    public static Predicate<CharSequence> containsPattern(String pattern) {
        return new ContainsPatternFromStringPredicate(pattern);
    }

    public static Predicate<CharSequence> contains(Pattern pattern) {
        return new ContainsPatternPredicate(new JdkPattern(pattern));
    }

    private static class NotPredicate<T> implements Predicate<T>, Serializable {
        private static final long serialVersionUID = 0;
        final Predicate<T> predicate;

        NotPredicate(Predicate<T> predicate) {
            this.predicate = (Predicate) Preconditions.checkNotNull(predicate);
        }

        @Override // com.google.common.base.Predicate
        public boolean apply(@ParametricNullness T t) {
            return !this.predicate.apply(t);
        }

        public int hashCode() {
            return ~this.predicate.hashCode();
        }

        @Override // com.google.common.base.Predicate
        public boolean equals(@CheckForNull Object obj) {
            if (obj instanceof NotPredicate) {
                return this.predicate.equals(((NotPredicate) obj).predicate);
            }
            return false;
        }

        public String toString() {
            return "Predicates.not(" + this.predicate + ")";
        }
    }

    private static class AndPredicate<T> implements Predicate<T>, Serializable {
        private static final long serialVersionUID = 0;
        private final List<? extends Predicate<? super T>> components;

        private AndPredicate(List<? extends Predicate<? super T>> components) {
            this.components = components;
        }

        @Override // com.google.common.base.Predicate
        public boolean apply(@ParametricNullness T t) {
            for (int i = 0; i < this.components.size(); i++) {
                if (!this.components.get(i).apply(t)) {
                    return false;
                }
            }
            return true;
        }

        public int hashCode() {
            return this.components.hashCode() + 306654252;
        }

        @Override // com.google.common.base.Predicate
        public boolean equals(@CheckForNull Object obj) {
            if (obj instanceof AndPredicate) {
                return this.components.equals(((AndPredicate) obj).components);
            }
            return false;
        }

        public String toString() {
            return Predicates.toStringHelper("and", this.components);
        }
    }

    private static class OrPredicate<T> implements Predicate<T>, Serializable {
        private static final long serialVersionUID = 0;
        private final List<? extends Predicate<? super T>> components;

        private OrPredicate(List<? extends Predicate<? super T>> components) {
            this.components = components;
        }

        @Override // com.google.common.base.Predicate
        public boolean apply(@ParametricNullness T t) {
            for (int i = 0; i < this.components.size(); i++) {
                if (this.components.get(i).apply(t)) {
                    return true;
                }
            }
            return false;
        }

        public int hashCode() {
            return this.components.hashCode() + 87855567;
        }

        @Override // com.google.common.base.Predicate
        public boolean equals(@CheckForNull Object obj) {
            if (obj instanceof OrPredicate) {
                return this.components.equals(((OrPredicate) obj).components);
            }
            return false;
        }

        public String toString() {
            return Predicates.toStringHelper("or", this.components);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String toStringHelper(String methodName, Iterable<?> components) {
        StringBuilder sb = new StringBuilder("Predicates.");
        sb.append(methodName);
        sb.append('(');
        boolean z = true;
        for (Object obj : components) {
            if (!z) {
                sb.append(',');
            }
            sb.append(obj);
            z = false;
        }
        sb.append(')');
        return sb.toString();
    }

    private static class IsEqualToPredicate implements Predicate<Object>, Serializable {
        private static final long serialVersionUID = 0;
        private final Object target;

        <T> Predicate<T> withNarrowedType() {
            return this;
        }

        private IsEqualToPredicate(Object target) {
            this.target = target;
        }

        @Override // com.google.common.base.Predicate
        public boolean apply(@CheckForNull Object o) {
            return this.target.equals(o);
        }

        public int hashCode() {
            return this.target.hashCode();
        }

        @Override // com.google.common.base.Predicate
        public boolean equals(@CheckForNull Object obj) {
            if (obj instanceof IsEqualToPredicate) {
                return this.target.equals(((IsEqualToPredicate) obj).target);
            }
            return false;
        }

        public String toString() {
            return "Predicates.equalTo(" + this.target + ")";
        }
    }

    private static class InstanceOfPredicate<T> implements Predicate<T>, Serializable {
        private static final long serialVersionUID = 0;
        private final Class<?> clazz;

        private InstanceOfPredicate(Class<?> clazz) {
            this.clazz = (Class) Preconditions.checkNotNull(clazz);
        }

        @Override // com.google.common.base.Predicate
        public boolean apply(@ParametricNullness T o) {
            return this.clazz.isInstance(o);
        }

        public int hashCode() {
            return this.clazz.hashCode();
        }

        @Override // com.google.common.base.Predicate
        public boolean equals(@CheckForNull Object obj) {
            return (obj instanceof InstanceOfPredicate) && this.clazz == ((InstanceOfPredicate) obj).clazz;
        }

        public String toString() {
            return "Predicates.instanceOf(" + this.clazz.getName() + ")";
        }
    }

    private static class SubtypeOfPredicate implements Predicate<Class<?>>, Serializable {
        private static final long serialVersionUID = 0;
        private final Class<?> clazz;

        private SubtypeOfPredicate(Class<?> clazz) {
            this.clazz = (Class) Preconditions.checkNotNull(clazz);
        }

        @Override // com.google.common.base.Predicate
        public boolean apply(Class<?> input) {
            return this.clazz.isAssignableFrom(input);
        }

        public int hashCode() {
            return this.clazz.hashCode();
        }

        @Override // com.google.common.base.Predicate
        public boolean equals(@CheckForNull Object obj) {
            return (obj instanceof SubtypeOfPredicate) && this.clazz == ((SubtypeOfPredicate) obj).clazz;
        }

        public String toString() {
            return "Predicates.subtypeOf(" + this.clazz.getName() + ")";
        }
    }

    private static class InPredicate<T> implements Predicate<T>, Serializable {
        private static final long serialVersionUID = 0;
        private final Collection<?> target;

        private InPredicate(Collection<?> target) {
            this.target = (Collection) Preconditions.checkNotNull(target);
        }

        @Override // com.google.common.base.Predicate
        public boolean apply(@ParametricNullness T t) {
            try {
                return this.target.contains(t);
            } catch (ClassCastException | NullPointerException unused) {
                return false;
            }
        }

        @Override // com.google.common.base.Predicate
        public boolean equals(@CheckForNull Object obj) {
            if (obj instanceof InPredicate) {
                return this.target.equals(((InPredicate) obj).target);
            }
            return false;
        }

        public int hashCode() {
            return this.target.hashCode();
        }

        public String toString() {
            return "Predicates.in(" + this.target + ")";
        }
    }

    private static class CompositionPredicate<A, B> implements Predicate<A>, Serializable {
        private static final long serialVersionUID = 0;
        final Function<A, ? extends B> f;
        final Predicate<B> p;

        private CompositionPredicate(Predicate<B> p, Function<A, ? extends B> f) {
            this.p = (Predicate) Preconditions.checkNotNull(p);
            this.f = (Function) Preconditions.checkNotNull(f);
        }

        @Override // com.google.common.base.Predicate
        public boolean apply(@ParametricNullness A a) {
            return this.p.apply(this.f.apply(a));
        }

        @Override // com.google.common.base.Predicate
        public boolean equals(@CheckForNull Object obj) {
            if (!(obj instanceof CompositionPredicate)) {
                return false;
            }
            CompositionPredicate compositionPredicate = (CompositionPredicate) obj;
            return this.f.equals(compositionPredicate.f) && this.p.equals(compositionPredicate.p);
        }

        public int hashCode() {
            return this.f.hashCode() ^ this.p.hashCode();
        }

        public String toString() {
            return this.p + "(" + this.f + ")";
        }
    }

    private static class ContainsPatternPredicate implements Predicate<CharSequence>, Serializable {
        private static final long serialVersionUID = 0;
        final CommonPattern pattern;

        ContainsPatternPredicate(CommonPattern pattern) {
            this.pattern = (CommonPattern) Preconditions.checkNotNull(pattern);
        }

        @Override // com.google.common.base.Predicate
        public boolean apply(CharSequence t) {
            return this.pattern.matcher(t).find();
        }

        public int hashCode() {
            return Objects.hashCode(this.pattern.pattern(), Integer.valueOf(this.pattern.flags()));
        }

        @Override // com.google.common.base.Predicate
        public boolean equals(@CheckForNull Object obj) {
            if (!(obj instanceof ContainsPatternPredicate)) {
                return false;
            }
            ContainsPatternPredicate containsPatternPredicate = (ContainsPatternPredicate) obj;
            return Objects.equal(this.pattern.pattern(), containsPatternPredicate.pattern.pattern()) && this.pattern.flags() == containsPatternPredicate.pattern.flags();
        }

        public String toString() {
            return "Predicates.contains(" + MoreObjects.toStringHelper(this.pattern).add("pattern", this.pattern.pattern()).add("pattern.flags", this.pattern.flags()).toString() + ")";
        }
    }

    private static class ContainsPatternFromStringPredicate extends ContainsPatternPredicate {
        private static final long serialVersionUID = 0;

        ContainsPatternFromStringPredicate(String string) {
            super(Platform.compilePattern(string));
        }

        @Override // com.google.common.base.Predicates.ContainsPatternPredicate
        public String toString() {
            return "Predicates.containsPattern(" + this.pattern.pattern() + ")";
        }
    }

    private static <T> List<Predicate<? super T>> asList(Predicate<? super T> first, Predicate<? super T> second) {
        return Arrays.asList(first, second);
    }

    private static <T> List<T> defensiveCopy(T... array) {
        return defensiveCopy(Arrays.asList(array));
    }

    static <T> List<T> defensiveCopy(Iterable<T> iterable) {
        ArrayList arrayList = new ArrayList();
        Iterator<T> it = iterable.iterator();
        while (it.hasNext()) {
            arrayList.add(Preconditions.checkNotNull(it.next()));
        }
        return arrayList;
    }
}
