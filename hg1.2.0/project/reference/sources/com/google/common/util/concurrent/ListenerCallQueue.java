package com.google.common.util.concurrent;

import androidx.core.app.NotificationCompat;
import com.google.common.base.Preconditions;
import com.google.common.collect.Queues;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Queue;
import java.util.concurrent.Executor;
import java.util.logging.Level;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class ListenerCallQueue<L> {
    private static final LazyLogger logger = new LazyLogger(ListenerCallQueue.class);
    private final List<PerListenerQueue<L>> listeners = Collections.synchronizedList(new ArrayList());

    interface Event<L> {
        void call(L listener);
    }

    ListenerCallQueue() {
    }

    public void addListener(L listener, Executor executor) {
        Preconditions.checkNotNull(listener, "listener");
        Preconditions.checkNotNull(executor, "executor");
        this.listeners.add(new PerListenerQueue<>(listener, executor));
    }

    public void enqueue(Event<L> event) {
        enqueueHelper(event, event);
    }

    public void enqueue(Event<L> event, String label) {
        enqueueHelper(event, label);
    }

    private void enqueueHelper(Event<L> event, Object label) {
        Preconditions.checkNotNull(event, NotificationCompat.CATEGORY_EVENT);
        Preconditions.checkNotNull(label, "label");
        synchronized (this.listeners) {
            Iterator<PerListenerQueue<L>> it = this.listeners.iterator();
            while (it.hasNext()) {
                it.next().add(event, label);
            }
        }
    }

    public void dispatch() throws Exception {
        for (int i = 0; i < this.listeners.size(); i++) {
            this.listeners.get(i).dispatch();
        }
    }

    private static final class PerListenerQueue<L> implements Runnable {
        final Executor executor;
        boolean isThreadScheduled;
        final L listener;
        final Queue<Event<L>> waitQueue = Queues.newArrayDeque();
        final Queue<Object> labelQueue = Queues.newArrayDeque();

        PerListenerQueue(L l, Executor executor) {
            this.listener = (L) Preconditions.checkNotNull(l);
            this.executor = (Executor) Preconditions.checkNotNull(executor);
        }

        synchronized void add(Event<L> event, Object label) {
            this.waitQueue.add(event);
            this.labelQueue.add(label);
        }

        void dispatch() throws Exception {
            boolean z;
            synchronized (this) {
                if (this.isThreadScheduled) {
                    z = false;
                } else {
                    z = true;
                    this.isThreadScheduled = true;
                }
            }
            if (z) {
                try {
                    this.executor.execute(this);
                } catch (Exception e) {
                    synchronized (this) {
                        this.isThreadScheduled = false;
                        ListenerCallQueue.logger.get().log(Level.SEVERE, "Exception while running callbacks for " + this.listener + " on " + this.executor, (Throwable) e);
                        throw e;
                    }
                }
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:12:0x0020, code lost:
        
            r2.call(r9.listener);
         */
        /* JADX WARN: Code restructure failed: missing block: B:14:0x0026, code lost:
        
            r2 = move-exception;
         */
        /* JADX WARN: Code restructure failed: missing block: B:15:0x0027, code lost:
        
            com.google.common.util.concurrent.ListenerCallQueue.logger.get().log(java.util.logging.Level.SEVERE, "Exception while executing callback: " + r9.listener + " " + r3, (java.lang.Throwable) r2);
         */
        /* JADX WARN: Removed duplicated region for block: B:27:0x005f  */
        @Override // java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void run() throws java.lang.Throwable {
            /*
                r9 = this;
            L0:
                r0 = 0
                r1 = 1
                monitor-enter(r9)     // Catch: java.lang.Throwable -> L5c
                boolean r2 = r9.isThreadScheduled     // Catch: java.lang.Throwable -> L50
                com.google.common.base.Preconditions.checkState(r2)     // Catch: java.lang.Throwable -> L50
                java.util.Queue<com.google.common.util.concurrent.ListenerCallQueue$Event<L>> r2 = r9.waitQueue     // Catch: java.lang.Throwable -> L50
                java.lang.Object r2 = r2.poll()     // Catch: java.lang.Throwable -> L50
                com.google.common.util.concurrent.ListenerCallQueue$Event r2 = (com.google.common.util.concurrent.ListenerCallQueue.Event) r2     // Catch: java.lang.Throwable -> L50
                java.util.Queue<java.lang.Object> r3 = r9.labelQueue     // Catch: java.lang.Throwable -> L50
                java.lang.Object r3 = r3.poll()     // Catch: java.lang.Throwable -> L50
                if (r2 != 0) goto L1f
                r9.isThreadScheduled = r0     // Catch: java.lang.Throwable -> L50
                monitor-exit(r9)     // Catch: java.lang.Throwable -> L1c
                return
            L1c:
                r1 = move-exception
                r2 = 0
                goto L53
            L1f:
                monitor-exit(r9)     // Catch: java.lang.Throwable -> L50
                L r4 = r9.listener     // Catch: java.lang.Exception -> L26 java.lang.Throwable -> L5c
                r2.call(r4)     // Catch: java.lang.Exception -> L26 java.lang.Throwable -> L5c
                goto L0
            L26:
                r2 = move-exception
                com.google.common.util.concurrent.LazyLogger r4 = com.google.common.util.concurrent.ListenerCallQueue.access$000()     // Catch: java.lang.Throwable -> L5c
                java.util.logging.Logger r4 = r4.get()     // Catch: java.lang.Throwable -> L5c
                java.util.logging.Level r5 = java.util.logging.Level.SEVERE     // Catch: java.lang.Throwable -> L5c
                java.lang.StringBuilder r6 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L5c
                r6.<init>()     // Catch: java.lang.Throwable -> L5c
                java.lang.String r7 = "Exception while executing callback: "
                r6.append(r7)     // Catch: java.lang.Throwable -> L5c
                L r7 = r9.listener     // Catch: java.lang.Throwable -> L5c
                r6.append(r7)     // Catch: java.lang.Throwable -> L5c
                java.lang.String r7 = " "
                r6.append(r7)     // Catch: java.lang.Throwable -> L5c
                r6.append(r3)     // Catch: java.lang.Throwable -> L5c
                java.lang.String r3 = r6.toString()     // Catch: java.lang.Throwable -> L5c
                r4.log(r5, r3, r2)     // Catch: java.lang.Throwable -> L5c
                goto L0
            L50:
                r2 = move-exception
                r1 = r2
                r2 = 1
            L53:
                monitor-exit(r9)     // Catch: java.lang.Throwable -> L5a
                throw r1     // Catch: java.lang.Throwable -> L55
            L55:
                r1 = move-exception
                r8 = r2
                r2 = r1
                r1 = r8
                goto L5d
            L5a:
                r1 = move-exception
                goto L53
            L5c:
                r2 = move-exception
            L5d:
                if (r1 == 0) goto L67
                monitor-enter(r9)
                r9.isThreadScheduled = r0     // Catch: java.lang.Throwable -> L64
                monitor-exit(r9)     // Catch: java.lang.Throwable -> L64
                goto L67
            L64:
                r0 = move-exception
                monitor-exit(r9)     // Catch: java.lang.Throwable -> L64
                throw r0
            L67:
                throw r2
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.common.util.concurrent.ListenerCallQueue.PerListenerQueue.run():void");
        }
    }
}
