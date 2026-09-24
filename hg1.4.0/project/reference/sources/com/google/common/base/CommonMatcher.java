package com.google.common.base;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
abstract class CommonMatcher {
    public abstract int end();

    public abstract boolean find();

    public abstract boolean find(int index);

    public abstract boolean matches();

    public abstract String replaceAll(String replacement);

    public abstract int start();

    CommonMatcher() {
    }
}
