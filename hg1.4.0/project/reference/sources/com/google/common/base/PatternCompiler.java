package com.google.common.base;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
interface PatternCompiler {
    CommonPattern compile(String pattern);

    boolean isPcreLike();
}
