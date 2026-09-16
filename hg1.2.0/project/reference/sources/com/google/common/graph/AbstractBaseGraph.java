package com.google.common.graph;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Iterators;
import com.google.common.collect.Sets;
import com.google.common.collect.UnmodifiableIterator;
import com.google.common.math.IntMath;
import com.google.common.primitives.Ints;
import java.util.AbstractSet;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
abstract class AbstractBaseGraph<N> implements BaseGraph<N> {
    @Override // com.google.common.graph.PredecessorsFunction
    public /* bridge */ /* synthetic */ Iterable predecessors(Object obj) {
        return predecessors((AbstractBaseGraph<N>) ((BaseGraph) obj));
    }

    @Override // com.google.common.graph.SuccessorsFunction
    public /* bridge */ /* synthetic */ Iterable successors(Object obj) {
        return successors((AbstractBaseGraph<N>) ((BaseGraph) obj));
    }

    AbstractBaseGraph() {
    }

    protected long edgeCount() {
        long jDegree = 0;
        while (nodes().iterator().hasNext()) {
            jDegree += degree(r0.next());
        }
        Preconditions.checkState((1 & jDegree) == 0);
        return jDegree >>> 1;
    }

    @Override // com.google.common.graph.BaseGraph
    public Set<EndpointPair<N>> edges() {
        return new AbstractSet<EndpointPair<N>>() { // from class: com.google.common.graph.AbstractBaseGraph.1
            @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
            public UnmodifiableIterator<EndpointPair<N>> iterator() {
                return EndpointPairIterator.of(AbstractBaseGraph.this);
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
            public int size() {
                return Ints.saturatedCast(AbstractBaseGraph.this.edgeCount());
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
            public boolean remove(@CheckForNull Object o) {
                throw new UnsupportedOperationException();
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
            public boolean contains(@CheckForNull Object obj) {
                if (!(obj instanceof EndpointPair)) {
                    return false;
                }
                EndpointPair<?> endpointPair = (EndpointPair) obj;
                return AbstractBaseGraph.this.isOrderingCompatible(endpointPair) && AbstractBaseGraph.this.nodes().contains(endpointPair.nodeU()) && AbstractBaseGraph.this.successors(endpointPair.nodeU()).contains(endpointPair.nodeV());
            }
        };
    }

    @Override // com.google.common.graph.BaseGraph
    public ElementOrder<N> incidentEdgeOrder() {
        return ElementOrder.unordered();
    }

    @Override // com.google.common.graph.BaseGraph
    public Set<EndpointPair<N>> incidentEdges(N node) {
        Preconditions.checkNotNull(node);
        Preconditions.checkArgument(nodes().contains(node), "Node %s is not an element of this graph.", node);
        return new AnonymousClass2(this, this, node);
    }

    /* renamed from: com.google.common.graph.AbstractBaseGraph$2, reason: invalid class name */
    class AnonymousClass2 extends IncidentEdgeSet<N> {
        AnonymousClass2(final AbstractBaseGraph this$0, BaseGraph graph, Object node) {
            super(graph, node);
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
        public UnmodifiableIterator<EndpointPair<N>> iterator() {
            if (this.graph.isDirected()) {
                return Iterators.unmodifiableIterator(Iterators.concat(Iterators.transform(this.graph.predecessors((BaseGraph<N>) this.node).iterator(), new Function() { // from class: com.google.common.graph.AbstractBaseGraph$2$$ExternalSyntheticLambda0
                    @Override // com.google.common.base.Function
                    public final Object apply(Object obj) {
                        return this.f$0.m412lambda$iterator$0$comgooglecommongraphAbstractBaseGraph$2(obj);
                    }
                }), Iterators.transform(Sets.difference(this.graph.successors((BaseGraph<N>) this.node), ImmutableSet.of(this.node)).iterator(), new Function() { // from class: com.google.common.graph.AbstractBaseGraph$2$$ExternalSyntheticLambda1
                    @Override // com.google.common.base.Function
                    public final Object apply(Object obj) {
                        return this.f$0.m413lambda$iterator$1$comgooglecommongraphAbstractBaseGraph$2(obj);
                    }
                })));
            }
            return Iterators.unmodifiableIterator(Iterators.transform(this.graph.adjacentNodes(this.node).iterator(), new Function() { // from class: com.google.common.graph.AbstractBaseGraph$2$$ExternalSyntheticLambda2
                @Override // com.google.common.base.Function
                public final Object apply(Object obj) {
                    return this.f$0.m414lambda$iterator$2$comgooglecommongraphAbstractBaseGraph$2(obj);
                }
            }));
        }

        /* renamed from: lambda$iterator$0$com-google-common-graph-AbstractBaseGraph$2, reason: not valid java name */
        /* synthetic */ EndpointPair m412lambda$iterator$0$comgooglecommongraphAbstractBaseGraph$2(Object obj) {
            return EndpointPair.ordered(obj, this.node);
        }

        /* renamed from: lambda$iterator$1$com-google-common-graph-AbstractBaseGraph$2, reason: not valid java name */
        /* synthetic */ EndpointPair m413lambda$iterator$1$comgooglecommongraphAbstractBaseGraph$2(Object obj) {
            return EndpointPair.ordered(this.node, obj);
        }

        /* renamed from: lambda$iterator$2$com-google-common-graph-AbstractBaseGraph$2, reason: not valid java name */
        /* synthetic */ EndpointPair m414lambda$iterator$2$comgooglecommongraphAbstractBaseGraph$2(Object obj) {
            return EndpointPair.unordered(this.node, obj);
        }
    }

    @Override // com.google.common.graph.BaseGraph
    public int degree(N node) {
        if (isDirected()) {
            return IntMath.saturatedAdd(predecessors((Object) node).size(), successors((Object) node).size());
        }
        Set<N> setAdjacentNodes = adjacentNodes(node);
        return IntMath.saturatedAdd(setAdjacentNodes.size(), (allowsSelfLoops() && setAdjacentNodes.contains(node)) ? 1 : 0);
    }

    @Override // com.google.common.graph.BaseGraph
    public int inDegree(N node) {
        return isDirected() ? predecessors((Object) node).size() : degree(node);
    }

    @Override // com.google.common.graph.BaseGraph
    public int outDegree(N node) {
        return isDirected() ? successors((Object) node).size() : degree(node);
    }

    @Override // com.google.common.graph.BaseGraph
    public boolean hasEdgeConnecting(N nodeU, N nodeV) {
        Preconditions.checkNotNull(nodeU);
        Preconditions.checkNotNull(nodeV);
        return nodes().contains(nodeU) && successors((Object) nodeU).contains(nodeV);
    }

    @Override // com.google.common.graph.BaseGraph
    public boolean hasEdgeConnecting(EndpointPair<N> endpoints) {
        Preconditions.checkNotNull(endpoints);
        if (!isOrderingCompatible(endpoints)) {
            return false;
        }
        N nNodeU = endpoints.nodeU();
        return nodes().contains(nNodeU) && successors((Object) nNodeU).contains(endpoints.nodeV());
    }

    protected final void validateEndpoints(EndpointPair<?> endpoints) {
        Preconditions.checkNotNull(endpoints);
        Preconditions.checkArgument(isOrderingCompatible(endpoints), "Mismatch: endpoints' ordering is not compatible with directionality of the graph");
    }

    protected final boolean isOrderingCompatible(EndpointPair<?> endpoints) {
        return endpoints.isOrdered() == isDirected();
    }
}
