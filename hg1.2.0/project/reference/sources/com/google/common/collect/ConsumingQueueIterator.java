package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Queue;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class ConsumingQueueIterator<T> extends AbstractIterator<T> {
    private final Queue<T> queue;

    ConsumingQueueIterator(Queue<T> queue) {
        this.queue = (Queue) Preconditions.checkNotNull(queue);
    }

    @Override // com.google.common.collect.AbstractIterator
    @CheckForNull
    protected T computeNext() {
        if (this.queue.isEmpty()) {
            return endOfData();
        }
        return this.queue.remove();
    }
}
