package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.collect.Maps;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class ForwardingMap<K, V> extends ForwardingObject implements Map<K, V> {
    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.common.collect.ForwardingObject
    public abstract Map<K, V> delegate();

    protected ForwardingMap() {
    }

    public int size() {
        return delegate().size();
    }

    public boolean isEmpty() {
        return delegate().isEmpty();
    }

    @CheckForNull
    public V remove(@CheckForNull Object key) {
        return delegate().remove(key);
    }

    public void clear() {
        delegate().clear();
    }

    public boolean containsKey(@CheckForNull Object key) {
        return delegate().containsKey(key);
    }

    public boolean containsValue(@CheckForNull Object value) {
        return delegate().containsValue(value);
    }

    @CheckForNull
    public V get(@CheckForNull Object key) {
        return delegate().get(key);
    }

    @CheckForNull
    public V put(@ParametricNullness K key, @ParametricNullness V value) {
        return delegate().put(key, value);
    }

    public void putAll(Map<? extends K, ? extends V> map) {
        delegate().putAll(map);
    }

    public Set<K> keySet() {
        return delegate().keySet();
    }

    public Collection<V> values() {
        return delegate().values();
    }

    public Set<Map.Entry<K, V>> entrySet() {
        return delegate().entrySet();
    }

    public boolean equals(@CheckForNull Object object) {
        return object == this || delegate().equals(object);
    }

    public int hashCode() {
        return delegate().hashCode();
    }

    protected void standardPutAll(Map<? extends K, ? extends V> map) {
        Maps.putAllImpl(this, map);
    }

    @CheckForNull
    protected V standardRemove(@CheckForNull Object key) {
        Iterator<Map.Entry<K, V>> it = entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<K, V> next = it.next();
            if (Objects.equal(next.getKey(), key)) {
                V value = next.getValue();
                it.remove();
                return value;
            }
        }
        return null;
    }

    protected void standardClear() {
        Iterators.clear(entrySet().iterator());
    }

    protected class StandardKeySet extends Maps.KeySet<K, V> {
        public StandardKeySet(final ForwardingMap this$0) {
            super(this$0);
        }
    }

    protected boolean standardContainsKey(@CheckForNull Object key) {
        return Maps.containsKeyImpl(this, key);
    }

    protected class StandardValues extends Maps.Values<K, V> {
        public StandardValues(final ForwardingMap this$0) {
            super(this$0);
        }
    }

    protected boolean standardContainsValue(@CheckForNull Object value) {
        return Maps.containsValueImpl(this, value);
    }

    protected abstract class StandardEntrySet extends Maps.EntrySet<K, V> {
        protected StandardEntrySet() {
        }

        @Override // com.google.common.collect.Maps.EntrySet
        Map<K, V> map() {
            return ForwardingMap.this;
        }
    }

    protected boolean standardIsEmpty() {
        return !entrySet().iterator().hasNext();
    }

    protected boolean standardEquals(@CheckForNull Object object) {
        return Maps.equalsImpl(this, object);
    }

    protected int standardHashCode() {
        return Sets.hashCodeImpl(entrySet());
    }

    protected String standardToString() {
        return Maps.toStringImpl(this);
    }
}
