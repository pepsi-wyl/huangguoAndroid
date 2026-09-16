package com.google.common.collect;

import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class NullnessCasts {
    @ParametricNullness
    static <T> T uncheckedCastNullableTToT(@CheckForNull T t) {
        return t;
    }

    @ParametricNullness
    static <T> T unsafeNull() {
        return null;
    }

    private NullnessCasts() {
    }
}
