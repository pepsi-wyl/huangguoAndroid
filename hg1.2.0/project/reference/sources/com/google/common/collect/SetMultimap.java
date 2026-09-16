package com.google.common.collect;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface SetMultimap<K, V> extends Multimap<K, V> {
    @Override // com.google.common.collect.Multimap, com.google.common.collect.ListMultimap
    Map<K, Collection<V>> asMap();

    @Override // com.google.common.collect.Multimap
    Set<Map.Entry<K, V>> entries();

    @Override // com.google.common.collect.Multimap, com.google.common.collect.ListMultimap
    boolean equals(@CheckForNull Object obj);

    @Override // com.google.common.collect.Multimap
    Set<V> get(@ParametricNullness K key);

    @Override // com.google.common.collect.Multimap
    Set<V> removeAll(@CheckForNull Object key);

    @Override // com.google.common.collect.Multimap
    Set<V> replaceValues(@ParametricNullness K key, Iterable<? extends V> values);

    /* renamed from: com.google.common.collect.SetMultimap$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
    }
}
