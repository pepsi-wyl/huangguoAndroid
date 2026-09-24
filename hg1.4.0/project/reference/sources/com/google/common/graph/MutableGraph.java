package com.google.common.graph;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public interface MutableGraph<N> extends Graph<N> {
    boolean addNode(N node);

    boolean putEdge(EndpointPair<N> endpoints);

    boolean putEdge(N nodeU, N nodeV);

    boolean removeEdge(EndpointPair<N> endpoints);

    boolean removeEdge(N nodeU, N nodeV);

    boolean removeNode(N node);
}
