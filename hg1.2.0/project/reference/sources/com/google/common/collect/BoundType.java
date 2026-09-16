package com.google.common.collect;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public enum BoundType {
    OPEN(false),
    CLOSED(true);

    final boolean inclusive;

    BoundType(boolean inclusive) {
        this.inclusive = inclusive;
    }

    static BoundType forBoolean(boolean inclusive) {
        return inclusive ? CLOSED : OPEN;
    }
}
