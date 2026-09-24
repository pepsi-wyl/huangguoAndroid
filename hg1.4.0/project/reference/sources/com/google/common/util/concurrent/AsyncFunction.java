package com.google.common.util.concurrent;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface AsyncFunction<I, O> {
    ListenableFuture<O> apply(@ParametricNullness I input) throws Exception;
}
