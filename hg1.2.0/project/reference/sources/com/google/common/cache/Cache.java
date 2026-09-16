package com.google.common.cache;

import com.google.common.collect.ImmutableMap;
import com.google.errorprone.annotations.DoNotMock;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutionException;
import javax.annotation.CheckForNull;

@DoNotMock("Use CacheBuilder.newBuilder().build()")
@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface Cache<K, V> {
    ConcurrentMap<K, V> asMap();

    void cleanUp();

    V get(K key, Callable<? extends V> loader) throws ExecutionException;

    ImmutableMap<K, V> getAllPresent(Iterable<? extends Object> keys);

    @CheckForNull
    V getIfPresent(Object key);

    void invalidate(Object key);

    void invalidateAll();

    void invalidateAll(Iterable<? extends Object> keys);

    void put(K key, V value);

    void putAll(Map<? extends K, ? extends V> m);

    long size();

    CacheStats stats();
}
