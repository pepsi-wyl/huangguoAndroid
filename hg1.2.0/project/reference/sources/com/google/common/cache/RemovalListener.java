package com.google.common.cache;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface RemovalListener<K, V> {
    void onRemoval(RemovalNotification<K, V> notification);
}
