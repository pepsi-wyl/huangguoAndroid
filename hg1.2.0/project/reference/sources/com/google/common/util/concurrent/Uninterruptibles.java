package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.base.Verify;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class Uninterruptibles {
    public static void awaitUninterruptibly(CountDownLatch latch) {
        boolean z = false;
        while (true) {
            try {
                latch.await();
                break;
            } catch (InterruptedException unused) {
                z = true;
            } catch (Throwable th) {
                if (z) {
                    Thread.currentThread().interrupt();
                }
                throw th;
            }
        }
        if (z) {
            Thread.currentThread().interrupt();
        }
    }

    public static boolean awaitUninterruptibly(CountDownLatch latch, long timeout, TimeUnit unit) {
        boolean z = false;
        try {
            long nanos = unit.toNanos(timeout);
            while (true) {
                try {
                    break;
                } catch (InterruptedException unused) {
                    z = true;
                    nanos = (System.nanoTime() + nanos) - System.nanoTime();
                }
            }
            return latch.await(nanos, TimeUnit.NANOSECONDS);
        } finally {
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static boolean awaitUninterruptibly(Condition condition, long timeout, TimeUnit unit) {
        boolean z = false;
        try {
            long nanos = unit.toNanos(timeout);
            while (true) {
                try {
                    break;
                } catch (InterruptedException unused) {
                    z = true;
                    nanos = (System.nanoTime() + nanos) - System.nanoTime();
                }
            }
            return condition.await(nanos, TimeUnit.NANOSECONDS);
        } finally {
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static void joinUninterruptibly(Thread toJoin) {
        boolean z = false;
        while (true) {
            try {
                toJoin.join();
                break;
            } catch (InterruptedException unused) {
                z = true;
            } catch (Throwable th) {
                if (z) {
                    Thread.currentThread().interrupt();
                }
                throw th;
            }
        }
        if (z) {
            Thread.currentThread().interrupt();
        }
    }

    public static void joinUninterruptibly(Thread toJoin, long timeout, TimeUnit unit) {
        Preconditions.checkNotNull(toJoin);
        boolean z = false;
        try {
            long nanos = unit.toNanos(timeout);
            long jNanoTime = System.nanoTime() + nanos;
            while (true) {
                try {
                    TimeUnit.NANOSECONDS.timedJoin(toJoin, nanos);
                    break;
                } catch (InterruptedException unused) {
                    z = true;
                    nanos = jNanoTime - System.nanoTime();
                }
            }
        } finally {
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    @ParametricNullness
    public static <V> V getUninterruptibly(Future<V> future) throws ExecutionException {
        V v;
        boolean z = false;
        while (true) {
            try {
                v = future.get();
                break;
            } catch (InterruptedException unused) {
                z = true;
            } catch (Throwable th) {
                if (z) {
                    Thread.currentThread().interrupt();
                }
                throw th;
            }
        }
        if (z) {
            Thread.currentThread().interrupt();
        }
        return v;
    }

    @ParametricNullness
    public static <V> V getUninterruptibly(Future<V> future, long timeout, TimeUnit unit) throws ExecutionException, TimeoutException {
        boolean z = false;
        try {
            long nanos = unit.toNanos(timeout);
            while (true) {
                try {
                    break;
                } catch (InterruptedException unused) {
                    z = true;
                    nanos = (System.nanoTime() + nanos) - System.nanoTime();
                }
            }
            return future.get(nanos, TimeUnit.NANOSECONDS);
        } finally {
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static <E> E takeUninterruptibly(BlockingQueue<E> queue) {
        E eTake;
        boolean z = false;
        while (true) {
            try {
                eTake = queue.take();
                break;
            } catch (InterruptedException unused) {
                z = true;
            } catch (Throwable th) {
                if (z) {
                    Thread.currentThread().interrupt();
                }
                throw th;
            }
        }
        if (z) {
            Thread.currentThread().interrupt();
        }
        return eTake;
    }

    public static <E> void putUninterruptibly(BlockingQueue<E> queue, E element) {
        boolean z = false;
        while (true) {
            try {
                queue.put(element);
                break;
            } catch (InterruptedException unused) {
                z = true;
            } catch (Throwable th) {
                if (z) {
                    Thread.currentThread().interrupt();
                }
                throw th;
            }
        }
        if (z) {
            Thread.currentThread().interrupt();
        }
    }

    public static void sleepUninterruptibly(long sleepFor, TimeUnit unit) {
        boolean z = false;
        try {
            long nanos = unit.toNanos(sleepFor);
            long jNanoTime = System.nanoTime() + nanos;
            while (true) {
                try {
                    TimeUnit.NANOSECONDS.sleep(nanos);
                    break;
                } catch (InterruptedException unused) {
                    z = true;
                    nanos = jNanoTime - System.nanoTime();
                }
            }
        } finally {
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static boolean tryAcquireUninterruptibly(Semaphore semaphore, long timeout, TimeUnit unit) {
        return tryAcquireUninterruptibly(semaphore, 1, timeout, unit);
    }

    public static boolean tryAcquireUninterruptibly(Semaphore semaphore, int permits, long timeout, TimeUnit unit) {
        boolean z = false;
        try {
            long nanos = unit.toNanos(timeout);
            while (true) {
                try {
                    break;
                } catch (InterruptedException unused) {
                    z = true;
                    nanos = (System.nanoTime() + nanos) - System.nanoTime();
                }
            }
            return semaphore.tryAcquire(permits, nanos, TimeUnit.NANOSECONDS);
        } finally {
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static boolean tryLockUninterruptibly(Lock lock, long timeout, TimeUnit unit) {
        boolean z = false;
        try {
            long nanos = unit.toNanos(timeout);
            while (true) {
                try {
                    break;
                } catch (InterruptedException unused) {
                    z = true;
                    nanos = (System.nanoTime() + nanos) - System.nanoTime();
                }
            }
            return lock.tryLock(nanos, TimeUnit.NANOSECONDS);
        } finally {
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    public static void awaitTerminationUninterruptibly(ExecutorService executor) {
        Verify.verify(awaitTerminationUninterruptibly(executor, Long.MAX_VALUE, TimeUnit.NANOSECONDS));
    }

    public static boolean awaitTerminationUninterruptibly(ExecutorService executor, long timeout, TimeUnit unit) {
        boolean z = false;
        try {
            long nanos = unit.toNanos(timeout);
            while (true) {
                try {
                    break;
                } catch (InterruptedException unused) {
                    z = true;
                    nanos = (System.nanoTime() + nanos) - System.nanoTime();
                }
            }
            return executor.awaitTermination(nanos, TimeUnit.NANOSECONDS);
        } finally {
            if (z) {
                Thread.currentThread().interrupt();
            }
        }
    }

    private Uninterruptibles() {
    }
}
