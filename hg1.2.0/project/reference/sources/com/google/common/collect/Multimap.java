package com.google.common.collect;

import com.google.errorprone.annotations.DoNotMock;
import java.util.Collection;
import java.util.Map;
import java.util.Set;
import javax.annotation.CheckForNull;

@DoNotMock("Use ImmutableMultimap, HashMultimap, or another implementation")
@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface Multimap<K, V> {
    Map<K, Collection<V>> asMap();

    void clear();

    boolean containsEntry(@CheckForNull Object key, @CheckForNull Object value);

    boolean containsKey(@CheckForNull Object key);

    boolean containsValue(@CheckForNull Object value);

    Collection<Map.Entry<K, V>> entries();

    boolean equals(@CheckForNull Object obj);

    Collection<V> get(@ParametricNullness K key);

    int hashCode();

    boolean isEmpty();

    Set<K> keySet();

    Multiset<K> keys();

    boolean put(@ParametricNullness K key, @ParametricNullness V value);

    boolean putAll(Multimap<? extends K, ? extends V> multimap);

    boolean putAll(@ParametricNullness K key, Iterable<? extends V> values);

    boolean remove(@CheckForNull Object key, @CheckForNull Object value);

    Collection<V> removeAll(@CheckForNull Object key);

    Collection<V> replaceValues(@ParametricNullness K key, Iterable<? extends V> values);

    int size();

    Collection<V> values();
}
