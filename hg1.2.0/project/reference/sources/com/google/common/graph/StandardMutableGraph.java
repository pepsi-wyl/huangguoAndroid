package com.google.common.graph;

import com.google.common.graph.GraphConstants;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class StandardMutableGraph<N> extends ForwardingGraph<N> implements MutableGraph<N> {
    private final MutableValueGraph<N, GraphConstants.Presence> backingValueGraph;

    StandardMutableGraph(AbstractGraphBuilder<? super N> builder) {
        this.backingValueGraph = new StandardMutableValueGraph(builder);
    }

    @Override // com.google.common.graph.ForwardingGraph
    BaseGraph<N> delegate() {
        return this.backingValueGraph;
    }

    @Override // com.google.common.graph.MutableGraph
    public boolean addNode(N node) {
        return this.backingValueGraph.addNode(node);
    }

    @Override // com.google.common.graph.MutableGraph
    public boolean putEdge(N nodeU, N nodeV) {
        return this.backingValueGraph.putEdgeValue(nodeU, nodeV, GraphConstants.Presence.EDGE_EXISTS) == null;
    }

    @Override // com.google.common.graph.MutableGraph
    public boolean putEdge(EndpointPair<N> endpoints) {
        validateEndpoints(endpoints);
        return putEdge(endpoints.nodeU(), endpoints.nodeV());
    }

    @Override // com.google.common.graph.MutableGraph
    public boolean removeNode(N node) {
        return this.backingValueGraph.removeNode(node);
    }

    @Override // com.google.common.graph.MutableGraph
    public boolean removeEdge(N nodeU, N nodeV) {
        return this.backingValueGraph.removeEdge(nodeU, nodeV) != null;
    }

    @Override // com.google.common.graph.MutableGraph
    public boolean removeEdge(EndpointPair<N> endpoints) {
        validateEndpoints(endpoints);
        return removeEdge(endpoints.nodeU(), endpoints.nodeV());
    }
}
