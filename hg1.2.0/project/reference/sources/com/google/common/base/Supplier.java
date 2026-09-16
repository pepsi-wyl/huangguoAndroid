package com.google.common.base;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface Supplier<T> {
    @ParametricNullness
    T get();
}
