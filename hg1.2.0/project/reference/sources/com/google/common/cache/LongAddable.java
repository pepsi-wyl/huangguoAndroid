package com.google.common.cache;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
interface LongAddable {
    void add(long x);

    void increment();

    long sum();
}
