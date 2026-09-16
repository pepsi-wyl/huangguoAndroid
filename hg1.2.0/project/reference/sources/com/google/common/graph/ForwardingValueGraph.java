package com.google.common.graph;

import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
abstract class ForwardingValueGraph<N, V> extends AbstractValueGraph<N, V> {
    abstract ValueGraph<N, V> delegate();

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.common.graph.AbstractValueGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.PredecessorsFunction
    public /* bridge */ /* synthetic */ Iterable predecessors(Object node) {
        return predecessors((ForwardingValueGraph<N, V>) node);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.common.graph.AbstractValueGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.SuccessorsFunction
    public /* bridge */ /* synthetic */ Iterable successors(Object node) {
        return successors((ForwardingValueGraph<N, V>) node);
    }

    ForwardingValueGraph() {
    }

    @Override // com.google.common.graph.BaseGraph, com.google.common.graph.Graph
    public Set<N> nodes() {
        return delegate().nodes();
    }

    @Override // com.google.common.graph.AbstractBaseGraph
    protected long edgeCount() {
        return delegate().edges().size();
    }

    @Override // com.google.common.graph.BaseGraph, com.google.common.graph.Graph
    public boolean isDirected() {
        return delegate().isDirected();
    }

    @Override // com.google.common.graph.BaseGraph, com.google.common.graph.Graph
    public boolean allowsSelfLoops() {
        return delegate().allowsSelfLoops();
    }

    @Override // com.google.common.graph.BaseGraph, com.google.common.graph.Graph
    public ElementOrder<N> nodeOrder() {
        return delegate().nodeOrder();
    }

    @Override // com.google.common.graph.AbstractValueGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public ElementOrder<N> incidentEdgeOrder() {
        return delegate().incidentEdgeOrder();
    }

    @Override // com.google.common.graph.BaseGraph, com.google.common.graph.Graph
    public Set<N> adjacentNodes(N node) {
        return delegate().adjacentNodes(node);
    }

    @Override // com.google.common.graph.AbstractValueGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.PredecessorsFunction
    public Set<N> predecessors(N node) {
        return delegate().predecessors((ValueGraph<N, V>) node);
    }

    @Override // com.google.common.graph.AbstractValueGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.SuccessorsFunction
    public Set<N> successors(N node) {
        return delegate().successors((ValueGraph<N, V>) node);
    }

    @Override // com.google.common.graph.AbstractValueGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public int degree(N node) {
        return delegate().degree(node);
    }

    @Override // com.google.common.graph.AbstractValueGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public int inDegree(N node) {
        return delegate().inDegree(node);
    }

    @Override // com.google.common.graph.AbstractValueGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public int outDegree(N node) {
        return delegate().outDegree(node);
    }

    @Override // com.google.common.graph.AbstractValueGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public boolean hasEdgeConnecting(N nodeU, N nodeV) {
        return delegate().hasEdgeConnecting(nodeU, nodeV);
    }

    @Override // com.google.common.graph.AbstractValueGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public boolean hasEdgeConnecting(EndpointPair<N> endpoints) {
        return delegate().hasEdgeConnecting(endpoints);
    }

    @Override // com.google.common.graph.ValueGraph
    @CheckForNull
    public V edgeValueOrDefault(N nodeU, N nodeV, @CheckForNull V defaultValue) {
        return delegate().edgeValueOrDefault(nodeU, nodeV, defaultValue);
    }

    @Override // com.google.common.graph.ValueGraph
    @CheckForNull
    public V edgeValueOrDefault(EndpointPair<N> endpoints, @CheckForNull V defaultValue) {
        return delegate().edgeValueOrDefault(endpoints, defaultValue);
    }
}
