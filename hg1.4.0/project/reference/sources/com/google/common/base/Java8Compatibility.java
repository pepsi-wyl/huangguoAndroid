package com.google.common.base;

import java.nio.Buffer;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class Java8Compatibility {
    static void clear(Buffer b) {
        b.clear();
    }

    static void flip(Buffer b) {
        b.flip();
    }

    static void limit(Buffer b, int limit) {
        b.limit(limit);
    }

    static void position(Buffer b, int position) {
        b.position(position);
    }

    private Java8Compatibility() {
    }
}
