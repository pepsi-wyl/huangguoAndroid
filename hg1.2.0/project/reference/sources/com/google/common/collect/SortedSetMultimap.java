package com.google.common.collect;

import java.util.Collection;
import java.util.Comparator;
import java.util.Map;
import java.util.SortedSet;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface SortedSetMultimap<K, V> extends SetMultimap<K, V> {
    @Override // com.google.common.collect.SetMultimap, com.google.common.collect.Multimap, com.google.common.collect.ListMultimap
    Map<K, Collection<V>> asMap();

    @Override // com.google.common.collect.SetMultimap, com.google.common.collect.Multimap
    SortedSet<V> get(@ParametricNullness K key);

    @Override // com.google.common.collect.SetMultimap, com.google.common.collect.Multimap
    SortedSet<V> removeAll(@CheckForNull Object key);

    @Override // com.google.common.collect.SetMultimap, com.google.common.collect.Multimap
    SortedSet<V> replaceValues(@ParametricNullness K key, Iterable<? extends V> values);

    @CheckForNull
    Comparator<? super V> valueComparator();

    /* renamed from: com.google.common.collect.SortedSetMultimap$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
    }
}
