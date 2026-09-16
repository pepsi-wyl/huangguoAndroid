package com.google.common.graph;

import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
interface NetworkConnections<N, E> {
    void addInEdge(E edge, N node, boolean isSelfLoop);

    void addOutEdge(E edge, N node);

    N adjacentNode(E edge);

    Set<N> adjacentNodes();

    Set<E> edgesConnecting(N node);

    Set<E> inEdges();

    Set<E> incidentEdges();

    Set<E> outEdges();

    Set<N> predecessors();

    @CheckForNull
    N removeInEdge(E edge, boolean isSelfLoop);

    N removeOutEdge(E edge);

    Set<N> successors();
}
