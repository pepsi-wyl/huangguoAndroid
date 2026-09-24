package com.google.common.graph;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.UnmodifiableIterator;
import java.util.Collection;
import java.util.Objects;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class StandardMutableNetwork<N, E> extends StandardNetwork<N, E> implements MutableNetwork<N, E> {
    StandardMutableNetwork(NetworkBuilder<? super N, ? super E> builder) {
        super(builder);
    }

    @Override // com.google.common.graph.MutableNetwork
    public boolean addNode(N node) {
        Preconditions.checkNotNull(node, "node");
        if (containsNode(node)) {
            return false;
        }
        addNodeInternal(node);
        return true;
    }

    private NetworkConnections<N, E> addNodeInternal(N node) {
        NetworkConnections<N, E> networkConnectionsNewConnections = newConnections();
        Preconditions.checkState(this.nodeConnections.put(node, networkConnectionsNewConnections) == null);
        return networkConnectionsNewConnections;
    }

    @Override // com.google.common.graph.MutableNetwork
    public boolean addEdge(N nodeU, N nodeV, E edge) {
        Preconditions.checkNotNull(nodeU, "nodeU");
        Preconditions.checkNotNull(nodeV, "nodeV");
        Preconditions.checkNotNull(edge, "edge");
        if (containsEdge(edge)) {
            EndpointPair<N> endpointPairIncidentNodes = incidentNodes(edge);
            EndpointPair endpointPairOf = EndpointPair.of(this, nodeU, nodeV);
            Preconditions.checkArgument(endpointPairIncidentNodes.equals(endpointPairOf), "Edge %s already exists between the following nodes: %s, so it cannot be reused to connect the following nodes: %s.", edge, endpointPairIncidentNodes, endpointPairOf);
            return false;
        }
        NetworkConnections<N, E> networkConnectionsAddNodeInternal = this.nodeConnections.get(nodeU);
        if (!allowsParallelEdges()) {
            Preconditions.checkArgument(networkConnectionsAddNodeInternal == null || !networkConnectionsAddNodeInternal.successors().contains(nodeV), "Nodes %s and %s are already connected by a different edge. To construct a graph that allows parallel edges, call allowsParallelEdges(true) on the Builder.", nodeU, nodeV);
        }
        boolean zEquals = nodeU.equals(nodeV);
        if (!allowsSelfLoops()) {
            Preconditions.checkArgument(!zEquals, "Cannot add self-loop edge on node %s, as self-loops are not allowed. To construct a graph that allows self-loops, call allowsSelfLoops(true) on the Builder.", nodeU);
        }
        if (networkConnectionsAddNodeInternal == null) {
            networkConnectionsAddNodeInternal = addNodeInternal(nodeU);
        }
        networkConnectionsAddNodeInternal.addOutEdge(edge, nodeV);
        NetworkConnections<N, E> networkConnectionsAddNodeInternal2 = this.nodeConnections.get(nodeV);
        if (networkConnectionsAddNodeInternal2 == null) {
            networkConnectionsAddNodeInternal2 = addNodeInternal(nodeV);
        }
        networkConnectionsAddNodeInternal2.addInEdge(edge, nodeU, zEquals);
        this.edgeToReferenceNode.put(edge, nodeU);
        return true;
    }

    @Override // com.google.common.graph.MutableNetwork
    public boolean addEdge(EndpointPair<N> endpoints, E edge) {
        validateEndpoints(endpoints);
        return addEdge(endpoints.nodeU(), endpoints.nodeV(), edge);
    }

    @Override // com.google.common.graph.MutableNetwork
    public boolean removeNode(N node) {
        Preconditions.checkNotNull(node, "node");
        NetworkConnections<N, E> networkConnections = this.nodeConnections.get(node);
        if (networkConnections == null) {
            return false;
        }
        UnmodifiableIterator<E> it = ImmutableList.copyOf((Collection) networkConnections.incidentEdges()).iterator();
        while (it.hasNext()) {
            removeEdge(it.next());
        }
        this.nodeConnections.remove(node);
        return true;
    }

    @Override // com.google.common.graph.MutableNetwork
    public boolean removeEdge(E edge) {
        Preconditions.checkNotNull(edge, "edge");
        N n = this.edgeToReferenceNode.get(edge);
        boolean z = false;
        if (n == null) {
            return false;
        }
        NetworkConnections networkConnections = (NetworkConnections) Objects.requireNonNull(this.nodeConnections.get(n));
        Object objAdjacentNode = networkConnections.adjacentNode(edge);
        NetworkConnections networkConnections2 = (NetworkConnections) Objects.requireNonNull(this.nodeConnections.get(objAdjacentNode));
        networkConnections.removeOutEdge(edge);
        if (allowsSelfLoops() && n.equals(objAdjacentNode)) {
            z = true;
        }
        networkConnections2.removeInEdge(edge, z);
        this.edgeToReferenceNode.remove(edge);
        return true;
    }

    private NetworkConnections<N, E> newConnections() {
        if (isDirected()) {
            if (allowsParallelEdges()) {
                return DirectedMultiNetworkConnections.of();
            }
            return DirectedNetworkConnections.of();
        }
        if (allowsParallelEdges()) {
            return UndirectedMultiNetworkConnections.of();
        }
        return UndirectedNetworkConnections.of();
    }
}
