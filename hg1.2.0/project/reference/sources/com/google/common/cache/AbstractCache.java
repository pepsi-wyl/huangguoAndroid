package com.google.common.cache;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutionException;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class AbstractCache<K, V> implements Cache<K, V> {

    public interface StatsCounter {
        void recordEviction();

        void recordHits(int count);

        void recordLoadException(long loadTime);

        void recordLoadSuccess(long loadTime);

        void recordMisses(int count);

        CacheStats snapshot();
    }

    @Override // com.google.common.cache.Cache
    public void cleanUp() {
    }

    protected AbstractCache() {
    }

    @Override // com.google.common.cache.Cache
    public V get(K key, Callable<? extends V> valueLoader) throws ExecutionException {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.common.cache.Cache
    public ImmutableMap<K, V> getAllPresent(Iterable<? extends Object> keys) {
        V ifPresent;
        LinkedHashMap linkedHashMapNewLinkedHashMap = Maps.newLinkedHashMap();
        for (Object obj : keys) {
            if (!linkedHashMapNewLinkedHashMap.containsKey(obj) && (ifPresent = getIfPresent(obj)) != null) {
                linkedHashMapNewLinkedHashMap.put(obj, ifPresent);
            }
        }
        return ImmutableMap.copyOf((Map) linkedHashMapNewLinkedHashMap);
    }

    @Override // com.google.common.cache.Cache
    public void put(K key, V value) {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.common.cache.Cache
    public void putAll(Map<? extends K, ? extends V> m) {
        for (Map.Entry<? extends K, ? extends V> entry : m.entrySet()) {
            put(entry.getKey(), entry.getValue());
        }
    }

    @Override // com.google.common.cache.Cache
    public long size() {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.common.cache.Cache
    public void invalidate(Object key) {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.common.cache.Cache
    public void invalidateAll(Iterable<? extends Object> keys) {
        Iterator<? extends Object> it = keys.iterator();
        while (it.hasNext()) {
            invalidate(it.next());
        }
    }

    @Override // com.google.common.cache.Cache
    public void invalidateAll() {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.common.cache.Cache
    public CacheStats stats() {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.common.cache.Cache
    public ConcurrentMap<K, V> asMap() {
        throw new UnsupportedOperationException();
    }

    public static final class SimpleStatsCounter implements StatsCounter {
        private final LongAddable hitCount = LongAddables.create();
        private final LongAddable missCount = LongAddables.create();
        private final LongAddable loadSuccessCount = LongAddables.create();
        private final LongAddable loadExceptionCount = LongAddables.create();
        private final LongAddable totalLoadTime = LongAddables.create();
        private final LongAddable evictionCount = LongAddables.create();

        private static long negativeToMaxValue(long value) {
            if (value >= 0) {
                return value;
            }
            return Long.MAX_VALUE;
        }

        @Override // com.google.common.cache.AbstractCache.StatsCounter
        public void recordHits(int count) {
            this.hitCount.add(count);
        }

        @Override // com.google.common.cache.AbstractCache.StatsCounter
        public void recordMisses(int count) {
            this.missCount.add(count);
        }

        @Override // com.google.common.cache.AbstractCache.StatsCounter
        public void recordLoadSuccess(long loadTime) {
            this.loadSuccessCount.increment();
            this.totalLoadTime.add(loadTime);
        }

        @Override // com.google.common.cache.AbstractCache.StatsCounter
        public void recordLoadException(long loadTime) {
            this.loadExceptionCount.increment();
            this.totalLoadTime.add(loadTime);
        }

        @Override // com.google.common.cache.AbstractCache.StatsCounter
        public void recordEviction() {
            this.evictionCount.increment();
        }

        @Override // com.google.common.cache.AbstractCache.StatsCounter
        public CacheStats snapshot() {
            return new CacheStats(negativeToMaxValue(this.hitCount.sum()), negativeToMaxValue(this.missCount.sum()), negativeToMaxValue(this.loadSuccessCount.sum()), negativeToMaxValue(this.loadExceptionCount.sum()), negativeToMaxValue(this.totalLoadTime.sum()), negativeToMaxValue(this.evictionCount.sum()));
        }

        public void incrementBy(StatsCounter other) {
            CacheStats cacheStatsSnapshot = other.snapshot();
            this.hitCount.add(cacheStatsSnapshot.hitCount());
            this.missCount.add(cacheStatsSnapshot.missCount());
            this.loadSuccessCount.add(cacheStatsSnapshot.loadSuccessCount());
            this.loadExceptionCount.add(cacheStatsSnapshot.loadExceptionCount());
            this.totalLoadTime.add(cacheStatsSnapshot.totalLoadTime());
            this.evictionCount.add(cacheStatsSnapshot.evictionCount());
        }
    }
}
