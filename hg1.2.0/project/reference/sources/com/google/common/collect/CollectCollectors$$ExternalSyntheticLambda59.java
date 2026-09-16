package com.google.common.collect;

import com.google.common.collect.CollectCollectors;
import java.util.function.Function;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class CollectCollectors$$ExternalSyntheticLambda59 implements Function {
    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        return ((CollectCollectors.EnumMapAccumulator) obj).toImmutableMap();
    }
}
