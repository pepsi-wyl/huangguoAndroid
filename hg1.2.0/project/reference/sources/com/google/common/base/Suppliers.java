package com.google.common.base;

import com.google.common.base.Suppliers;
import java.io.Serializable;
import java.util.concurrent.TimeUnit;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Suppliers {

    private interface SupplierFunction<T> extends Function<Supplier<T>, T> {
    }

    private Suppliers() {
    }

    public static <F, T> Supplier<T> compose(Function<? super F, T> function, Supplier<F> supplier) {
        return new SupplierComposition(function, supplier);
    }

    private static class SupplierComposition<F, T> implements Supplier<T>, Serializable {
        private static final long serialVersionUID = 0;
        final Function<? super F, T> function;
        final Supplier<F> supplier;

        SupplierComposition(Function<? super F, T> function, Supplier<F> supplier) {
            this.function = (Function) Preconditions.checkNotNull(function);
            this.supplier = (Supplier) Preconditions.checkNotNull(supplier);
        }

        @Override // com.google.common.base.Supplier
        @ParametricNullness
        public T get() {
            return this.function.apply(this.supplier.get());
        }

        public boolean equals(@CheckForNull Object obj) {
            if (!(obj instanceof SupplierComposition)) {
                return false;
            }
            SupplierComposition supplierComposition = (SupplierComposition) obj;
            return this.function.equals(supplierComposition.function) && this.supplier.equals(supplierComposition.supplier);
        }

        public int hashCode() {
            return Objects.hashCode(this.function, this.supplier);
        }

        public String toString() {
            return "Suppliers.compose(" + this.function + ", " + this.supplier + ")";
        }
    }

    public static <T> Supplier<T> memoize(Supplier<T> delegate) {
        if ((delegate instanceof NonSerializableMemoizingSupplier) || (delegate instanceof MemoizingSupplier)) {
            return delegate;
        }
        if (delegate instanceof Serializable) {
            return new MemoizingSupplier(delegate);
        }
        return new NonSerializableMemoizingSupplier(delegate);
    }

    static class MemoizingSupplier<T> implements Supplier<T>, Serializable {
        private static final long serialVersionUID = 0;
        final Supplier<T> delegate;
        volatile transient boolean initialized;

        @CheckForNull
        transient T value;

        MemoizingSupplier(Supplier<T> delegate) {
            this.delegate = (Supplier) Preconditions.checkNotNull(delegate);
        }

        @Override // com.google.common.base.Supplier
        @ParametricNullness
        public T get() {
            if (!this.initialized) {
                synchronized (this) {
                    if (!this.initialized) {
                        T t = this.delegate.get();
                        this.value = t;
                        this.initialized = true;
                        return t;
                    }
                }
            }
            return (T) NullnessCasts.uncheckedCastNullableTToT(this.value);
        }

        public String toString() {
            Object obj;
            StringBuilder sb = new StringBuilder("Suppliers.memoize(");
            if (this.initialized) {
                obj = "<supplier that returned " + this.value + ">";
            } else {
                obj = this.delegate;
            }
            sb.append(obj);
            sb.append(")");
            return sb.toString();
        }
    }

    static class NonSerializableMemoizingSupplier<T> implements Supplier<T> {
        private static final Supplier<Void> SUCCESSFULLY_COMPUTED = new Supplier() { // from class: com.google.common.base.Suppliers$NonSerializableMemoizingSupplier$$ExternalSyntheticLambda0
            @Override // com.google.common.base.Supplier
            public final Object get() {
                return Suppliers.NonSerializableMemoizingSupplier.lambda$static$0();
            }
        };
        private volatile Supplier<T> delegate;

        @CheckForNull
        private T value;

        static /* synthetic */ Void lambda$static$0() {
            throw new IllegalStateException();
        }

        NonSerializableMemoizingSupplier(Supplier<T> delegate) {
            this.delegate = (Supplier) Preconditions.checkNotNull(delegate);
        }

        @Override // com.google.common.base.Supplier
        @ParametricNullness
        public T get() {
            Supplier<T> supplier = this.delegate;
            Supplier<T> supplier2 = (Supplier<T>) SUCCESSFULLY_COMPUTED;
            if (supplier != supplier2) {
                synchronized (this) {
                    if (this.delegate != supplier2) {
                        T t = this.delegate.get();
                        this.value = t;
                        this.delegate = supplier2;
                        return t;
                    }
                }
            }
            return (T) NullnessCasts.uncheckedCastNullableTToT(this.value);
        }

        public String toString() {
            Object obj = this.delegate;
            StringBuilder sb = new StringBuilder("Suppliers.memoize(");
            if (obj == SUCCESSFULLY_COMPUTED) {
                obj = "<supplier that returned " + this.value + ">";
            }
            sb.append(obj);
            sb.append(")");
            return sb.toString();
        }
    }

    public static <T> Supplier<T> memoizeWithExpiration(Supplier<T> delegate, long duration, TimeUnit unit) {
        return new ExpiringMemoizingSupplier(delegate, duration, unit);
    }

    static class ExpiringMemoizingSupplier<T> implements Supplier<T>, Serializable {
        private static final long serialVersionUID = 0;
        final Supplier<T> delegate;
        final long durationNanos;
        volatile transient long expirationNanos;

        @CheckForNull
        volatile transient T value;

        ExpiringMemoizingSupplier(Supplier<T> delegate, long duration, TimeUnit unit) {
            this.delegate = (Supplier) Preconditions.checkNotNull(delegate);
            this.durationNanos = unit.toNanos(duration);
            Preconditions.checkArgument(duration > 0, "duration (%s %s) must be > 0", duration, unit);
        }

        @Override // com.google.common.base.Supplier
        @ParametricNullness
        public T get() {
            long j = this.expirationNanos;
            long jNanoTime = System.nanoTime();
            if (j == 0 || jNanoTime - j >= 0) {
                synchronized (this) {
                    if (j == this.expirationNanos) {
                        T t = this.delegate.get();
                        this.value = t;
                        long j2 = jNanoTime + this.durationNanos;
                        if (j2 == 0) {
                            j2 = 1;
                        }
                        this.expirationNanos = j2;
                        return t;
                    }
                }
            }
            return (T) NullnessCasts.uncheckedCastNullableTToT(this.value);
        }

        public String toString() {
            return "Suppliers.memoizeWithExpiration(" + this.delegate + ", " + this.durationNanos + ", NANOS)";
        }
    }

    public static <T> Supplier<T> ofInstance(@ParametricNullness T instance) {
        return new SupplierOfInstance(instance);
    }

    private static class SupplierOfInstance<T> implements Supplier<T>, Serializable {
        private static final long serialVersionUID = 0;

        @ParametricNullness
        final T instance;

        SupplierOfInstance(@ParametricNullness T instance) {
            this.instance = instance;
        }

        @Override // com.google.common.base.Supplier
        @ParametricNullness
        public T get() {
            return this.instance;
        }

        public boolean equals(@CheckForNull Object obj) {
            if (obj instanceof SupplierOfInstance) {
                return Objects.equal(this.instance, ((SupplierOfInstance) obj).instance);
            }
            return false;
        }

        public int hashCode() {
            return Objects.hashCode(this.instance);
        }

        public String toString() {
            return "Suppliers.ofInstance(" + this.instance + ")";
        }
    }

    public static <T> Supplier<T> synchronizedSupplier(Supplier<T> delegate) {
        return new ThreadSafeSupplier(delegate);
    }

    private static class ThreadSafeSupplier<T> implements Supplier<T>, Serializable {
        private static final long serialVersionUID = 0;
        final Supplier<T> delegate;

        ThreadSafeSupplier(Supplier<T> delegate) {
            this.delegate = (Supplier) Preconditions.checkNotNull(delegate);
        }

        @Override // com.google.common.base.Supplier
        @ParametricNullness
        public T get() {
            T t;
            synchronized (this.delegate) {
                t = this.delegate.get();
            }
            return t;
        }

        public String toString() {
            return "Suppliers.synchronizedSupplier(" + this.delegate + ")";
        }
    }

    public static <T> Function<Supplier<T>, T> supplierFunction() {
        return SupplierFunctionImpl.INSTANCE;
    }

    private enum SupplierFunctionImpl implements SupplierFunction<Object> {
        INSTANCE;

        @Override // com.google.common.base.Function
        @CheckForNull
        public Object apply(Supplier<Object> input) {
            return input.get();
        }

        @Override // java.lang.Enum
        public String toString() {
            return "Suppliers.supplierFunction()";
        }
    }
}
