package androidx.media3.exoplayer.upstream;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import androidx.media3.common.C;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Log;
import androidx.media3.common.util.TraceUtil;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.DefaultLoadControl;
import java.io.IOException;
import java.util.concurrent.ExecutorService;

/* loaded from: classes.dex */
public final class Loader implements LoaderErrorThrower {
    private static final int ACTION_TYPE_DONT_RETRY = 2;
    private static final int ACTION_TYPE_DONT_RETRY_FATAL = 3;
    private static final int ACTION_TYPE_RETRY = 0;
    private static final int ACTION_TYPE_RETRY_AND_RESET_ERROR_COUNT = 1;
    public static final LoadErrorAction DONT_RETRY;
    public static final LoadErrorAction DONT_RETRY_FATAL;
    public static final LoadErrorAction RETRY;
    public static final LoadErrorAction RETRY_RESET_ERROR_COUNT;
    private static final String THREAD_NAME_PREFIX = "ExoPlayer:Loader:";
    private LoadTask<? extends Loadable> currentTask;
    private final ExecutorService downloadExecutorService;
    private IOException fatalError;

    public interface Callback<T extends Loadable> {
        void onLoadCanceled(T t, long j, long j2, boolean z);

        void onLoadCompleted(T t, long j, long j2);

        LoadErrorAction onLoadError(T t, long j, long j2, IOException iOException, int i);
    }

    public interface Loadable {
        void cancelLoad();

        void load() throws IOException;
    }

    public interface ReleaseCallback {
        void onLoaderReleased();
    }

    public static final class UnexpectedLoaderException extends IOException {
        public UnexpectedLoaderException(Throwable th) {
            String str;
            StringBuilder sb = new StringBuilder("Unexpected ");
            sb.append(th.getClass().getSimpleName());
            if (th.getMessage() != null) {
                str = ": " + th.getMessage();
            } else {
                str = "";
            }
            sb.append(str);
            super(sb.toString(), th);
        }
    }

    static {
        long j = C.TIME_UNSET;
        RETRY = createRetryAction(false, C.TIME_UNSET);
        RETRY_RESET_ERROR_COUNT = createRetryAction(true, C.TIME_UNSET);
        DONT_RETRY = new LoadErrorAction(2, j);
        DONT_RETRY_FATAL = new LoadErrorAction(3, j);
    }

    public static final class LoadErrorAction {
        private final long retryDelayMillis;
        private final int type;

        private LoadErrorAction(int i, long j) {
            this.type = i;
            this.retryDelayMillis = j;
        }

        public boolean isRetry() {
            int i = this.type;
            return i == 0 || i == 1;
        }
    }

    public Loader(String str) {
        this.downloadExecutorService = Util.newSingleThreadExecutor(THREAD_NAME_PREFIX + str);
    }

    public static LoadErrorAction createRetryAction(boolean z, long j) {
        return new LoadErrorAction(z ? 1 : 0, j);
    }

    public boolean hasFatalError() {
        return this.fatalError != null;
    }

    public void clearFatalError() {
        this.fatalError = null;
    }

    public <T extends Loadable> long startLoading(T t, Callback<T> callback, int i) {
        Looper looper = (Looper) Assertions.checkStateNotNull(Looper.myLooper());
        this.fatalError = null;
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        new LoadTask(looper, t, callback, i, jElapsedRealtime).start(0L);
        return jElapsedRealtime;
    }

    public boolean isLoading() {
        return this.currentTask != null;
    }

    public void cancelLoading() {
        ((LoadTask) Assertions.checkStateNotNull(this.currentTask)).cancel(false);
    }

    public void release() {
        release(null);
    }

    public void release(ReleaseCallback releaseCallback) {
        LoadTask<? extends Loadable> loadTask = this.currentTask;
        if (loadTask != null) {
            loadTask.cancel(true);
        }
        if (releaseCallback != null) {
            this.downloadExecutorService.execute(new ReleaseTask(releaseCallback));
        }
        this.downloadExecutorService.shutdown();
    }

    @Override // androidx.media3.exoplayer.upstream.LoaderErrorThrower
    public void maybeThrowError() throws IOException {
        maybeThrowError(Integer.MIN_VALUE);
    }

    @Override // androidx.media3.exoplayer.upstream.LoaderErrorThrower
    public void maybeThrowError(int i) throws IOException {
        IOException iOException = this.fatalError;
        if (iOException != null) {
            throw iOException;
        }
        LoadTask<? extends Loadable> loadTask = this.currentTask;
        if (loadTask != null) {
            if (i == Integer.MIN_VALUE) {
                i = loadTask.defaultMinRetryCount;
            }
            loadTask.maybeThrowError(i);
        }
    }

    private final class LoadTask<T extends Loadable> extends Handler implements Runnable {
        private static final int MSG_FATAL_ERROR = 4;
        private static final int MSG_FINISH = 2;
        private static final int MSG_IO_EXCEPTION = 3;
        private static final int MSG_START = 1;
        private static final String TAG = "LoadTask";
        private Callback<T> callback;
        private boolean canceled;
        private IOException currentError;
        public final int defaultMinRetryCount;
        private int errorCount;
        private Thread executorThread;
        private final T loadable;
        private volatile boolean released;
        private final long startTimeMs;

        public LoadTask(Looper looper, T t, Callback<T> callback, int i, long j) {
            super(looper);
            this.loadable = t;
            this.callback = callback;
            this.defaultMinRetryCount = i;
            this.startTimeMs = j;
        }

        public void maybeThrowError(int i) throws IOException {
            IOException iOException = this.currentError;
            if (iOException != null && this.errorCount > i) {
                throw iOException;
            }
        }

        public void start(long j) {
            Assertions.checkState(Loader.this.currentTask == null);
            Loader.this.currentTask = this;
            if (j > 0) {
                sendEmptyMessageDelayed(1, j);
            } else {
                execute();
            }
        }

        public void cancel(boolean z) {
            this.released = z;
            this.currentError = null;
            if (hasMessages(1)) {
                this.canceled = true;
                removeMessages(1);
                if (!z) {
                    sendEmptyMessage(2);
                }
            } else {
                synchronized (this) {
                    this.canceled = true;
                    this.loadable.cancelLoad();
                    Thread thread = this.executorThread;
                    if (thread != null) {
                        thread.interrupt();
                    }
                }
            }
            if (z) {
                finish();
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                ((Callback) Assertions.checkNotNull(this.callback)).onLoadCanceled(this.loadable, jElapsedRealtime, jElapsedRealtime - this.startTimeMs, true);
                this.callback = null;
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            boolean z;
            try {
                synchronized (this) {
                    z = !this.canceled;
                    this.executorThread = Thread.currentThread();
                }
                if (z) {
                    TraceUtil.beginSection("load:" + this.loadable.getClass().getSimpleName());
                    try {
                        this.loadable.load();
                        TraceUtil.endSection();
                    } catch (Throwable th) {
                        TraceUtil.endSection();
                        throw th;
                    }
                }
                synchronized (this) {
                    this.executorThread = null;
                    Thread.interrupted();
                }
                if (this.released) {
                    return;
                }
                sendEmptyMessage(2);
            } catch (IOException e) {
                if (this.released) {
                    return;
                }
                obtainMessage(3, e).sendToTarget();
            } catch (Error e2) {
                if (!this.released) {
                    Log.e(TAG, "Unexpected error loading stream", e2);
                    obtainMessage(4, e2).sendToTarget();
                }
                throw e2;
            } catch (Exception e3) {
                if (this.released) {
                    return;
                }
                Log.e(TAG, "Unexpected exception loading stream", e3);
                obtainMessage(3, new UnexpectedLoaderException(e3)).sendToTarget();
            } catch (OutOfMemoryError e4) {
                if (this.released) {
                    return;
                }
                Log.e(TAG, "OutOfMemory error loading stream", e4);
                obtainMessage(3, new UnexpectedLoaderException(e4)).sendToTarget();
            }
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            long retryDelayMillis;
            if (this.released) {
                return;
            }
            if (message.what == 1) {
                execute();
                return;
            }
            if (message.what == 4) {
                throw ((Error) message.obj);
            }
            finish();
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            long j = jElapsedRealtime - this.startTimeMs;
            Callback callback = (Callback) Assertions.checkNotNull(this.callback);
            if (this.canceled) {
                callback.onLoadCanceled(this.loadable, jElapsedRealtime, j, false);
                return;
            }
            int i = message.what;
            if (i == 2) {
                try {
                    callback.onLoadCompleted(this.loadable, jElapsedRealtime, j);
                    return;
                } catch (RuntimeException e) {
                    Log.e(TAG, "Unexpected exception handling load completed", e);
                    Loader.this.fatalError = new UnexpectedLoaderException(e);
                    return;
                }
            }
            if (i != 3) {
                return;
            }
            IOException iOException = (IOException) message.obj;
            this.currentError = iOException;
            int i2 = this.errorCount + 1;
            this.errorCount = i2;
            LoadErrorAction loadErrorActionOnLoadError = callback.onLoadError(this.loadable, jElapsedRealtime, j, iOException, i2);
            if (loadErrorActionOnLoadError.type != 3) {
                if (loadErrorActionOnLoadError.type != 2) {
                    if (loadErrorActionOnLoadError.type == 1) {
                        this.errorCount = 1;
                    }
                    if (loadErrorActionOnLoadError.retryDelayMillis != C.TIME_UNSET) {
                        retryDelayMillis = loadErrorActionOnLoadError.retryDelayMillis;
                    } else {
                        retryDelayMillis = getRetryDelayMillis();
                    }
                    start(retryDelayMillis);
                    return;
                }
                return;
            }
            Loader.this.fatalError = this.currentError;
        }

        private void execute() {
            this.currentError = null;
            Loader.this.downloadExecutorService.execute((Runnable) Assertions.checkNotNull(Loader.this.currentTask));
        }

        private void finish() {
            Loader.this.currentTask = null;
        }

        private long getRetryDelayMillis() {
            return Math.min((this.errorCount - 1) * 1000, DefaultLoadControl.DEFAULT_BUFFER_FOR_PLAYBACK_AFTER_REBUFFER_MS);
        }
    }

    private static final class ReleaseTask implements Runnable {
        private final ReleaseCallback callback;

        public ReleaseTask(ReleaseCallback releaseCallback) {
            this.callback = releaseCallback;
        }

        @Override // java.lang.Runnable
        public void run() {
            this.callback.onLoaderReleased();
        }
    }
}
