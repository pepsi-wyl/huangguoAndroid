package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.lang.Enum;
import java.util.EnumMap;
import java.util.Map;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class ImmutableEnumMap<K extends Enum<K>, V> extends ImmutableMap.IteratorBasedImmutableMap<K, V> {
    private final transient EnumMap<K, V> delegate;

    @Override // com.google.common.collect.ImmutableMap
    boolean isPartialView() {
        return false;
    }

    static <K extends Enum<K>, V> ImmutableMap<K, V> asImmutable(EnumMap<K, V> map) {
        int size = map.size();
        if (size == 0) {
            return ImmutableMap.of();
        }
        if (size == 1) {
            Map.Entry entry = (Map.Entry) Iterables.getOnlyElement(map.entrySet());
            return ImmutableMap.of((Enum) entry.getKey(), entry.getValue());
        }
        return new ImmutableEnumMap(map);
    }

    private ImmutableEnumMap(EnumMap<K, V> delegate) {
        this.delegate = delegate;
        Preconditions.checkArgument(!delegate.isEmpty());
    }

    @Override // com.google.common.collect.ImmutableMap
    UnmodifiableIterator<K> keyIterator() {
        return Iterators.unmodifiableIterator(this.delegate.keySet().iterator());
    }

    @Override // java.util.Map
    public int size() {
        return this.delegate.size();
    }

    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    public boolean containsKey(@CheckForNull Object key) {
        return this.delegate.containsKey(key);
    }

    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    @CheckForNull
    public V get(@CheckForNull Object key) {
        return this.delegate.get(key);
    }

    @Override // com.google.common.collect.ImmutableMap, java.util.Map
    public boolean equals(@CheckForNull Object object) {
        if (object == this) {
            return true;
        }
        if (object instanceof ImmutableEnumMap) {
            object = ((ImmutableEnumMap) object).delegate;
        }
        return this.delegate.equals(object);
    }

    @Override // com.google.common.collect.ImmutableMap.IteratorBasedImmutableMap
    UnmodifiableIterator<Map.Entry<K, V>> entryIterator() {
        return Maps.unmodifiableEntryIterator(this.delegate.entrySet().iterator());
    }

    @Override // com.google.common.collect.ImmutableMap.IteratorBasedImmutableMap, com.google.common.collect.ImmutableMap
    Object writeReplace() {
        return new EnumSerializedForm(this.delegate);
    }

    private void readObject(ObjectInputStream stream) throws InvalidObjectException {
        throw new InvalidObjectException("Use EnumSerializedForm");
    }

    private static class EnumSerializedForm<K extends Enum<K>, V> implements Serializable {
        private static final long serialVersionUID = 0;
        final EnumMap<K, V> delegate;

        EnumSerializedForm(EnumMap<K, V> delegate) {
            this.delegate = delegate;
        }

        Object readResolve() {
            return new ImmutableEnumMap(this.delegate);
        }
    }
}
