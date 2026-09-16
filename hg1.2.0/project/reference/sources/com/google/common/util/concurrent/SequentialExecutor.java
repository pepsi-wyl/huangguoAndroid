package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
final class SequentialExecutor implements Executor {
    private static final LazyLogger log = new LazyLogger(SequentialExecutor.class);
    private final Executor executor;
    private final Deque<Runnable> queue = new ArrayDeque();
    private WorkerRunningState workerRunningState = WorkerRunningState.IDLE;
    private long workerRunCount = 0;
    private final QueueWorker worker = new QueueWorker();

    enum WorkerRunningState {
        IDLE,
        QUEUING,
        QUEUED,
        RUNNING
    }

    static /* synthetic */ long access$308(SequentialExecutor sequentialExecutor) {
        long j = sequentialExecutor.workerRunCount;
        sequentialExecutor.workerRunCount = 1 + j;
        return j;
    }

    SequentialExecutor(Executor executor) {
        this.executor = (Executor) Preconditions.checkNotNull(executor);
    }

    @Override // java.util.concurrent.Executor
    public void execute(final Runnable task) {
        Preconditions.checkNotNull(task);
        synchronized (this.queue) {
            if (this.workerRunningState != WorkerRunningState.RUNNING && this.workerRunningState != WorkerRunningState.QUEUED) {
                long j = this.workerRunCount;
                Runnable runnable = new Runnable(this) { // from class: com.google.common.util.concurrent.SequentialExecutor.1
                    @Override // java.lang.Runnable
                    public void run() {
                        task.run();
                    }

                    public String toString() {
                        return task.toString();
                    }
                };
                this.queue.add(runnable);
                this.workerRunningState = WorkerRunningState.QUEUING;
                try {
                    this.executor.execute(this.worker);
                    if (this.workerRunningState != WorkerRunningState.QUEUING) {
                        return;
                    }
                    synchronized (this.queue) {
                        if (this.workerRunCount == j && this.workerRunningState == WorkerRunningState.QUEUING) {
                            this.workerRunningState = WorkerRunningState.QUEUED;
                        }
                    }
                    return;
                } catch (Throwable th) {
                    synchronized (this.queue) {
                        boolean z = (this.workerRunningState == WorkerRunningState.IDLE || this.workerRunningState == WorkerRunningState.QUEUING) && this.queue.removeLastOccurrence(runnable);
                        if (!(th instanceof RejectedExecutionException) || z) {
                            throw th;
                        }
                        return;
                    }
                }
            }
            this.queue.add(task);
        }
    }

    private final class QueueWorker implements Runnable {

        @CheckForNull
        Runnable task;

        private QueueWorker() {
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                workOnQueue();
            } catch (Error e) {
                synchronized (SequentialExecutor.this.queue) {
                    SequentialExecutor.this.workerRunningState = WorkerRunningState.IDLE;
                    throw e;
                }
            }
        }

        /* JADX WARN: Code restructure failed: missing block: B:19:0x004e, code lost:
        
            return;
         */
        /* JADX WARN: Code restructure failed: missing block: B:22:0x0054, code lost:
        
            r1 = r1 | java.lang.Thread.interrupted();
            r2 = null;
         */
        /* JADX WARN: Code restructure failed: missing block: B:23:0x0056, code lost:
        
            r8.task.run();
         */
        /* JADX WARN: Code restructure failed: missing block: B:26:0x005e, code lost:
        
            r0 = move-exception;
         */
        /* JADX WARN: Code restructure failed: missing block: B:28:0x0060, code lost:
        
            r3 = move-exception;
         */
        /* JADX WARN: Code restructure failed: missing block: B:29:0x0061, code lost:
        
            com.google.common.util.concurrent.SequentialExecutor.log.get().log(java.util.logging.Level.SEVERE, "Exception while executing runnable " + r8.task, (java.lang.Throwable) r3);
         */
        /* JADX WARN: Code restructure failed: missing block: B:31:0x0082, code lost:
        
            r8.task = null;
         */
        /* JADX WARN: Code restructure failed: missing block: B:32:0x0084, code lost:
        
            throw r0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:49:?, code lost:
        
            return;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private void workOnQueue() {
            /*
                r8 = this;
                r0 = 0
                r1 = 0
            L2:
                com.google.common.util.concurrent.SequentialExecutor r2 = com.google.common.util.concurrent.SequentialExecutor.this     // Catch: java.lang.Throwable -> L88
                java.util.Deque r2 = com.google.common.util.concurrent.SequentialExecutor.access$100(r2)     // Catch: java.lang.Throwable -> L88
                monitor-enter(r2)     // Catch: java.lang.Throwable -> L88
                if (r0 != 0) goto L2d
                com.google.common.util.concurrent.SequentialExecutor r0 = com.google.common.util.concurrent.SequentialExecutor.this     // Catch: java.lang.Throwable -> L85
                com.google.common.util.concurrent.SequentialExecutor$WorkerRunningState r0 = com.google.common.util.concurrent.SequentialExecutor.access$200(r0)     // Catch: java.lang.Throwable -> L85
                com.google.common.util.concurrent.SequentialExecutor$WorkerRunningState r3 = com.google.common.util.concurrent.SequentialExecutor.WorkerRunningState.RUNNING     // Catch: java.lang.Throwable -> L85
                if (r0 != r3) goto L20
                monitor-exit(r2)     // Catch: java.lang.Throwable -> L85
                if (r1 == 0) goto L1f
                java.lang.Thread r0 = java.lang.Thread.currentThread()
                r0.interrupt()
            L1f:
                return
            L20:
                com.google.common.util.concurrent.SequentialExecutor r0 = com.google.common.util.concurrent.SequentialExecutor.this     // Catch: java.lang.Throwable -> L85
                com.google.common.util.concurrent.SequentialExecutor.access$308(r0)     // Catch: java.lang.Throwable -> L85
                com.google.common.util.concurrent.SequentialExecutor r0 = com.google.common.util.concurrent.SequentialExecutor.this     // Catch: java.lang.Throwable -> L85
                com.google.common.util.concurrent.SequentialExecutor$WorkerRunningState r3 = com.google.common.util.concurrent.SequentialExecutor.WorkerRunningState.RUNNING     // Catch: java.lang.Throwable -> L85
                com.google.common.util.concurrent.SequentialExecutor.access$202(r0, r3)     // Catch: java.lang.Throwable -> L85
                r0 = 1
            L2d:
                com.google.common.util.concurrent.SequentialExecutor r3 = com.google.common.util.concurrent.SequentialExecutor.this     // Catch: java.lang.Throwable -> L85
                java.util.Deque r3 = com.google.common.util.concurrent.SequentialExecutor.access$100(r3)     // Catch: java.lang.Throwable -> L85
                java.lang.Object r3 = r3.poll()     // Catch: java.lang.Throwable -> L85
                java.lang.Runnable r3 = (java.lang.Runnable) r3     // Catch: java.lang.Throwable -> L85
                r8.task = r3     // Catch: java.lang.Throwable -> L85
                if (r3 != 0) goto L4f
                com.google.common.util.concurrent.SequentialExecutor r0 = com.google.common.util.concurrent.SequentialExecutor.this     // Catch: java.lang.Throwable -> L85
                com.google.common.util.concurrent.SequentialExecutor$WorkerRunningState r3 = com.google.common.util.concurrent.SequentialExecutor.WorkerRunningState.IDLE     // Catch: java.lang.Throwable -> L85
                com.google.common.util.concurrent.SequentialExecutor.access$202(r0, r3)     // Catch: java.lang.Throwable -> L85
                monitor-exit(r2)     // Catch: java.lang.Throwable -> L85
                if (r1 == 0) goto L4e
                java.lang.Thread r0 = java.lang.Thread.currentThread()
                r0.interrupt()
            L4e:
                return
            L4f:
                monitor-exit(r2)     // Catch: java.lang.Throwable -> L85
                boolean r2 = java.lang.Thread.interrupted()     // Catch: java.lang.Throwable -> L88
                r1 = r1 | r2
                r2 = 0
                java.lang.Runnable r3 = r8.task     // Catch: java.lang.Throwable -> L5e java.lang.Exception -> L60
                r3.run()     // Catch: java.lang.Throwable -> L5e java.lang.Exception -> L60
            L5b:
                r8.task = r2     // Catch: java.lang.Throwable -> L88
                goto L2
            L5e:
                r0 = move-exception
                goto L82
            L60:
                r3 = move-exception
                com.google.common.util.concurrent.LazyLogger r4 = com.google.common.util.concurrent.SequentialExecutor.access$400()     // Catch: java.lang.Throwable -> L5e
                java.util.logging.Logger r4 = r4.get()     // Catch: java.lang.Throwable -> L5e
                java.util.logging.Level r5 = java.util.logging.Level.SEVERE     // Catch: java.lang.Throwable -> L5e
                java.lang.StringBuilder r6 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L5e
                r6.<init>()     // Catch: java.lang.Throwable -> L5e
                java.lang.String r7 = "Exception while executing runnable "
                r6.append(r7)     // Catch: java.lang.Throwable -> L5e
                java.lang.Runnable r7 = r8.task     // Catch: java.lang.Throwable -> L5e
                r6.append(r7)     // Catch: java.lang.Throwable -> L5e
                java.lang.String r6 = r6.toString()     // Catch: java.lang.Throwable -> L5e
                r4.log(r5, r6, r3)     // Catch: java.lang.Throwable -> L5e
                goto L5b
            L82:
                r8.task = r2     // Catch: java.lang.Throwable -> L88
                throw r0     // Catch: java.lang.Throwable -> L88
            L85:
                r0 = move-exception
                monitor-exit(r2)     // Catch: java.lang.Throwable -> L85
                throw r0     // Catch: java.lang.Throwable -> L88
            L88:
                r0 = move-exception
                if (r1 == 0) goto L92
                java.lang.Thread r1 = java.lang.Thread.currentThread()
                r1.interrupt()
            L92:
                throw r0
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.common.util.concurrent.SequentialExecutor.QueueWorker.workOnQueue():void");
        }

        public String toString() {
            Runnable runnable = this.task;
            if (runnable != null) {
                return "SequentialExecutorWorker{running=" + runnable + "}";
            }
            return "SequentialExecutorWorker{state=" + SequentialExecutor.this.workerRunningState + "}";
        }
    }

    public String toString() {
        return "SequentialExecutor@" + System.identityHashCode(this) + "{" + this.executor + "}";
    }
}
