package com.google.common.collect;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public abstract class ForwardingObject {
    protected abstract Object delegate();

    protected ForwardingObject() {
    }

    public String toString() {
        return delegate().toString();
    }
}
