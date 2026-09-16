package com.google.common.collect;

import java.util.concurrent.ConcurrentMap;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class ForwardingConcurrentMap<K, V> extends ForwardingMap<K, V> implements ConcurrentMap<K, V> {
    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.common.collect.ForwardingMap, com.google.common.collect.ForwardingObject
    public abstract ConcurrentMap<K, V> delegate();

    protected ForwardingConcurrentMap() {
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    @CheckForNull
    public V putIfAbsent(K key, V value) {
        return delegate().putIfAbsent(key, value);
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public boolean remove(@CheckForNull Object key, @CheckForNull Object value) {
        return delegate().remove(key, value);
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    @CheckForNull
    public V replace(K key, V value) {
        return delegate().replace(key, value);
    }

    @Override // java.util.Map, java.util.concurrent.ConcurrentMap
    public boolean replace(K key, V oldValue, V newValue) {
        return delegate().replace(key, oldValue, newValue);
    }
}
