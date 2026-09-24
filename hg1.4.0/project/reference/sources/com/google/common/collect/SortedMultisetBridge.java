package com.google.common.collect;

import java.util.SortedSet;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
interface SortedMultisetBridge<E> extends Multiset<E> {
    @Override // com.google.common.collect.Multiset
    SortedSet<E> elementSet();

    /* renamed from: com.google.common.collect.SortedMultisetBridge$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
    }
}
