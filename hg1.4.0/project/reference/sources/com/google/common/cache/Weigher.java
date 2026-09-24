package com.google.common.cache;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface Weigher<K, V> {
    int weigh(K key, V value);
}
