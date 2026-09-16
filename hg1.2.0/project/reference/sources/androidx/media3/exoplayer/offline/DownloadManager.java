package androidx.media3.exoplayer.offline;

import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Log;
import androidx.media3.common.util.Util;
import androidx.media3.database.DatabaseProvider;
import androidx.media3.datasource.DataSource;
import androidx.media3.datasource.cache.Cache;
import androidx.media3.datasource.cache.CacheDataSource;
import androidx.media3.exoplayer.DefaultLoadControl;
import androidx.media3.exoplayer.offline.Downloader;
import androidx.media3.exoplayer.scheduler.Requirements;
import androidx.media3.exoplayer.scheduler.RequirementsWatcher;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class DownloadManager {
    public static final int DEFAULT_MAX_PARALLEL_DOWNLOADS = 3;
    public static final int DEFAULT_MIN_RETRY_COUNT = 5;
    public static final Requirements DEFAULT_REQUIREMENTS = new Requirements(1);
    private static final int MSG_ADD_DOWNLOAD = 7;
    private static final int MSG_CONTENT_LENGTH_CHANGED = 11;
    private static final int MSG_DOWNLOAD_UPDATE = 3;
    private static final int MSG_INITIALIZE = 1;
    private static final int MSG_INITIALIZED = 1;
    private static final int MSG_PROCESSED = 2;
    private static final int MSG_RELEASE = 13;
    private static final int MSG_REMOVE_ALL_DOWNLOADS = 9;
    private static final int MSG_REMOVE_DOWNLOAD = 8;
    private static final int MSG_SET_DOWNLOADS_PAUSED = 2;
    private static final int MSG_SET_MAX_PARALLEL_DOWNLOADS = 5;
    private static final int MSG_SET_MIN_RETRY_COUNT = 6;
    private static final int MSG_SET_NOT_MET_REQUIREMENTS = 3;
    private static final int MSG_SET_STOP_REASON = 4;
    private static final int MSG_TASK_STOPPED = 10;
    private static final int MSG_UPDATE_PROGRESS = 12;
    private static final String TAG = "DownloadManager";
    private int activeTaskCount;
    private final Handler applicationHandler;
    private final Context context;
    private final WritableDownloadIndex downloadIndex;
    private List<Download> downloads;
    private boolean downloadsPaused;
    private boolean initialized;
    private final InternalHandler internalHandler;
    private final CopyOnWriteArraySet<Listener> listeners;
    private int maxParallelDownloads;
    private int minRetryCount;
    private int notMetRequirements;
    private int pendingMessages;
    private final RequirementsWatcher.Listener requirementsListener;
    private RequirementsWatcher requirementsWatcher;
    private boolean waitingForRequirements;

    public interface Listener {

        /* renamed from: androidx.media3.exoplayer.offline.DownloadManager$Listener$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static void $default$onDownloadChanged(Listener _this, DownloadManager downloadManager, Download download, Exception exc) {
            }

            public static void $default$onDownloadRemoved(Listener _this, DownloadManager downloadManager, Download download) {
            }

            public static void $default$onDownloadsPausedChanged(Listener _this, DownloadManager downloadManager, boolean z) {
            }

            public static void $default$onIdle(Listener _this, DownloadManager downloadManager) {
            }

            public static void $default$onInitialized(Listener _this, DownloadManager downloadManager) {
            }

            public static void $default$onRequirementsStateChanged(Listener _this, DownloadManager downloadManager, Requirements requirements, int i) {
            }

            public static void $default$onWaitingForRequirementsChanged(Listener _this, DownloadManager downloadManager, boolean z) {
            }
        }

        void onDownloadChanged(DownloadManager downloadManager, Download download, Exception exc);

        void onDownloadRemoved(DownloadManager downloadManager, Download download);

        void onDownloadsPausedChanged(DownloadManager downloadManager, boolean z);

        void onIdle(DownloadManager downloadManager);

        void onInitialized(DownloadManager downloadManager);

        void onRequirementsStateChanged(DownloadManager downloadManager, Requirements requirements, int i);

        void onWaitingForRequirementsChanged(DownloadManager downloadManager, boolean z);
    }

    public DownloadManager(Context context, DatabaseProvider databaseProvider, Cache cache, DataSource.Factory factory, Executor executor) {
        this(context, new DefaultDownloadIndex(databaseProvider), new DefaultDownloaderFactory(new CacheDataSource.Factory().setCache(cache).setUpstreamDataSourceFactory(factory), executor));
    }

    public DownloadManager(Context context, WritableDownloadIndex writableDownloadIndex, DownloaderFactory downloaderFactory) {
        this.context = context.getApplicationContext();
        this.downloadIndex = writableDownloadIndex;
        this.maxParallelDownloads = 3;
        this.minRetryCount = 5;
        this.downloadsPaused = true;
        this.downloads = Collections.emptyList();
        this.listeners = new CopyOnWriteArraySet<>();
        Handler handlerCreateHandlerForCurrentOrMainLooper = Util.createHandlerForCurrentOrMainLooper(new Handler.Callback() { // from class: androidx.media3.exoplayer.offline.DownloadManager$$ExternalSyntheticLambda0
            @Override // android.os.Handler.Callback
            public final boolean handleMessage(Message message) {
                return this.f$0.handleMainMessage(message);
            }
        });
        this.applicationHandler = handlerCreateHandlerForCurrentOrMainLooper;
        HandlerThread handlerThread = new HandlerThread("ExoPlayer:DownloadManager");
        handlerThread.start();
        InternalHandler internalHandler = new InternalHandler(handlerThread, writableDownloadIndex, downloaderFactory, handlerCreateHandlerForCurrentOrMainLooper, this.maxParallelDownloads, this.minRetryCount, this.downloadsPaused);
        this.internalHandler = internalHandler;
        RequirementsWatcher.Listener listener = new RequirementsWatcher.Listener() { // from class: androidx.media3.exoplayer.offline.DownloadManager$$ExternalSyntheticLambda1
            @Override // androidx.media3.exoplayer.scheduler.RequirementsWatcher.Listener
            public final void onRequirementsStateChanged(RequirementsWatcher requirementsWatcher, int i) {
                this.f$0.onRequirementsStateChanged(requirementsWatcher, i);
            }
        };
        this.requirementsListener = listener;
        RequirementsWatcher requirementsWatcher = new RequirementsWatcher(context, listener, DEFAULT_REQUIREMENTS);
        this.requirementsWatcher = requirementsWatcher;
        int iStart = requirementsWatcher.start();
        this.notMetRequirements = iStart;
        this.pendingMessages = 1;
        internalHandler.obtainMessage(1, iStart, 0).sendToTarget();
    }

    public Looper getApplicationLooper() {
        return this.applicationHandler.getLooper();
    }

    public boolean isInitialized() {
        return this.initialized;
    }

    public boolean isIdle() {
        return this.activeTaskCount == 0 && this.pendingMessages == 0;
    }

    public boolean isWaitingForRequirements() {
        return this.waitingForRequirements;
    }

    public void addListener(Listener listener) {
        Assertions.checkNotNull(listener);
        this.listeners.add(listener);
    }

    public void removeListener(Listener listener) {
        this.listeners.remove(listener);
    }

    public Requirements getRequirements() {
        return this.requirementsWatcher.getRequirements();
    }

    public int getNotMetRequirements() {
        return this.notMetRequirements;
    }

    public void setRequirements(Requirements requirements) {
        if (requirements.equals(this.requirementsWatcher.getRequirements())) {
            return;
        }
        this.requirementsWatcher.stop();
        RequirementsWatcher requirementsWatcher = new RequirementsWatcher(this.context, this.requirementsListener, requirements);
        this.requirementsWatcher = requirementsWatcher;
        onRequirementsStateChanged(this.requirementsWatcher, requirementsWatcher.start());
    }

    public int getMaxParallelDownloads() {
        return this.maxParallelDownloads;
    }

    public void setMaxParallelDownloads(int i) {
        Assertions.checkArgument(i > 0);
        if (this.maxParallelDownloads == i) {
            return;
        }
        this.maxParallelDownloads = i;
        this.pendingMessages++;
        this.internalHandler.obtainMessage(5, i, 0).sendToTarget();
    }

    public int getMinRetryCount() {
        return this.minRetryCount;
    }

    public void setMinRetryCount(int i) {
        Assertions.checkArgument(i >= 0);
        if (this.minRetryCount == i) {
            return;
        }
        this.minRetryCount = i;
        this.pendingMessages++;
        this.internalHandler.obtainMessage(6, i, 0).sendToTarget();
    }

    public DownloadIndex getDownloadIndex() {
        return this.downloadIndex;
    }

    public List<Download> getCurrentDownloads() {
        return this.downloads;
    }

    public boolean getDownloadsPaused() {
        return this.downloadsPaused;
    }

    public void resumeDownloads() {
        setDownloadsPaused(false);
    }

    public void pauseDownloads() {
        setDownloadsPaused(true);
    }

    public void setStopReason(String str, int i) {
        this.pendingMessages++;
        this.internalHandler.obtainMessage(4, i, 0, str).sendToTarget();
    }

    public void addDownload(DownloadRequest downloadRequest) {
        addDownload(downloadRequest, 0);
    }

    public void addDownload(DownloadRequest downloadRequest, int i) {
        this.pendingMessages++;
        this.internalHandler.obtainMessage(7, i, 0, downloadRequest).sendToTarget();
    }

    public void removeDownload(String str) {
        this.pendingMessages++;
        this.internalHandler.obtainMessage(8, str).sendToTarget();
    }

    public void removeAllDownloads() {
        this.pendingMessages++;
        this.internalHandler.obtainMessage(9).sendToTarget();
    }

    public void release() {
        synchronized (this.internalHandler) {
            if (this.internalHandler.released) {
                return;
            }
            this.internalHandler.sendEmptyMessage(13);
            boolean z = false;
            while (!this.internalHandler.released) {
                try {
                    this.internalHandler.wait();
                } catch (InterruptedException unused) {
                    z = true;
                }
            }
            if (z) {
                Thread.currentThread().interrupt();
            }
            this.applicationHandler.removeCallbacksAndMessages(null);
            this.requirementsWatcher.stop();
            this.downloads = Collections.emptyList();
            this.pendingMessages = 0;
            this.activeTaskCount = 0;
            this.initialized = false;
            this.notMetRequirements = 0;
            this.waitingForRequirements = false;
        }
    }

    private void setDownloadsPaused(boolean z) {
        if (this.downloadsPaused == z) {
            return;
        }
        this.downloadsPaused = z;
        this.pendingMessages++;
        this.internalHandler.obtainMessage(2, z ? 1 : 0, 0).sendToTarget();
        boolean zUpdateWaitingForRequirements = updateWaitingForRequirements();
        Iterator<Listener> it = this.listeners.iterator();
        while (it.hasNext()) {
            it.next().onDownloadsPausedChanged(this, z);
        }
        if (zUpdateWaitingForRequirements) {
            notifyWaitingForRequirementsChanged();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onRequirementsStateChanged(RequirementsWatcher requirementsWatcher, int i) {
        Requirements requirements = requirementsWatcher.getRequirements();
        if (this.notMetRequirements != i) {
            this.notMetRequirements = i;
            this.pendingMessages++;
            this.internalHandler.obtainMessage(3, i, 0).sendToTarget();
        }
        boolean zUpdateWaitingForRequirements = updateWaitingForRequirements();
        Iterator<Listener> it = this.listeners.iterator();
        while (it.hasNext()) {
            it.next().onRequirementsStateChanged(this, requirements, i);
        }
        if (zUpdateWaitingForRequirements) {
            notifyWaitingForRequirementsChanged();
        }
    }

    private boolean updateWaitingForRequirements() {
        boolean z;
        if (this.downloadsPaused || this.notMetRequirements == 0) {
            z = false;
        } else {
            for (int i = 0; i < this.downloads.size(); i++) {
                if (this.downloads.get(i).state == 0) {
                    z = true;
                    break;
                }
            }
            z = false;
        }
        boolean z2 = this.waitingForRequirements != z;
        this.waitingForRequirements = z;
        return z2;
    }

    private void notifyWaitingForRequirementsChanged() {
        Iterator<Listener> it = this.listeners.iterator();
        while (it.hasNext()) {
            it.next().onWaitingForRequirementsChanged(this, this.waitingForRequirements);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean handleMainMessage(Message message) {
        int i = message.what;
        if (i == 1) {
            onInitialized((List) message.obj);
        } else if (i == 2) {
            onMessageProcessed(message.arg1, message.arg2);
        } else if (i == 3) {
            onDownloadUpdate((DownloadUpdate) message.obj);
        } else {
            throw new IllegalStateException();
        }
        return true;
    }

    private void onInitialized(List<Download> list) {
        this.initialized = true;
        this.downloads = Collections.unmodifiableList(list);
        boolean zUpdateWaitingForRequirements = updateWaitingForRequirements();
        Iterator<Listener> it = this.listeners.iterator();
        while (it.hasNext()) {
            it.next().onInitialized(this);
        }
        if (zUpdateWaitingForRequirements) {
            notifyWaitingForRequirementsChanged();
        }
    }

    private void onDownloadUpdate(DownloadUpdate downloadUpdate) {
        this.downloads = Collections.unmodifiableList(downloadUpdate.downloads);
        Download download = downloadUpdate.download;
        boolean zUpdateWaitingForRequirements = updateWaitingForRequirements();
        if (downloadUpdate.isRemove) {
            Iterator<Listener> it = this.listeners.iterator();
            while (it.hasNext()) {
                it.next().onDownloadRemoved(this, download);
            }
        } else {
            Iterator<Listener> it2 = this.listeners.iterator();
            while (it2.hasNext()) {
                it2.next().onDownloadChanged(this, download, downloadUpdate.finalException);
            }
        }
        if (zUpdateWaitingForRequirements) {
            notifyWaitingForRequirementsChanged();
        }
    }

    private void onMessageProcessed(int i, int i2) {
        this.pendingMessages -= i;
        this.activeTaskCount = i2;
        if (isIdle()) {
            Iterator<Listener> it = this.listeners.iterator();
            while (it.hasNext()) {
                it.next().onIdle(this);
            }
        }
    }

    static Download mergeRequest(Download download, DownloadRequest downloadRequest, int i, long j) {
        int i2 = download.state;
        return new Download(download.request.copyWithMergedRequest(downloadRequest), (i2 == 5 || i2 == 7) ? 7 : i != 0 ? 1 : 0, (i2 == 5 || download.isTerminalState()) ? j : download.startTimeMs, j, -1L, i, 0);
    }

    /* JADX INFO: Access modifiers changed from: private */
    static final class InternalHandler extends Handler {
        private static final int UPDATE_PROGRESS_INTERVAL_MS = 5000;
        private int activeDownloadTaskCount;
        private final HashMap<String, Task> activeTasks;
        private final WritableDownloadIndex downloadIndex;
        private final DownloaderFactory downloaderFactory;
        private final ArrayList<Download> downloads;
        private boolean downloadsPaused;
        private boolean hasActiveRemoveTask;
        private final Handler mainHandler;
        private int maxParallelDownloads;
        private int minRetryCount;
        private int notMetRequirements;
        public boolean released;
        private final HandlerThread thread;

        public InternalHandler(HandlerThread handlerThread, WritableDownloadIndex writableDownloadIndex, DownloaderFactory downloaderFactory, Handler handler, int i, int i2, boolean z) {
            super(handlerThread.getLooper());
            this.thread = handlerThread;
            this.downloadIndex = writableDownloadIndex;
            this.downloaderFactory = downloaderFactory;
            this.mainHandler = handler;
            this.maxParallelDownloads = i;
            this.minRetryCount = i2;
            this.downloadsPaused = z;
            this.downloads = new ArrayList<>();
            this.activeTasks = new HashMap<>();
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) throws IOException {
            int i = 0;
            switch (message.what) {
                case 1:
                    initialize(message.arg1);
                    i = 1;
                    this.mainHandler.obtainMessage(2, i, this.activeTasks.size()).sendToTarget();
                    return;
                case 2:
                    setDownloadsPaused(message.arg1 != 0);
                    i = 1;
                    this.mainHandler.obtainMessage(2, i, this.activeTasks.size()).sendToTarget();
                    return;
                case 3:
                    setNotMetRequirements(message.arg1);
                    i = 1;
                    this.mainHandler.obtainMessage(2, i, this.activeTasks.size()).sendToTarget();
                    return;
                case 4:
                    setStopReason((String) message.obj, message.arg1);
                    i = 1;
                    this.mainHandler.obtainMessage(2, i, this.activeTasks.size()).sendToTarget();
                    return;
                case 5:
                    setMaxParallelDownloads(message.arg1);
                    i = 1;
                    this.mainHandler.obtainMessage(2, i, this.activeTasks.size()).sendToTarget();
                    return;
                case 6:
                    setMinRetryCount(message.arg1);
                    i = 1;
                    this.mainHandler.obtainMessage(2, i, this.activeTasks.size()).sendToTarget();
                    return;
                case 7:
                    addDownload((DownloadRequest) message.obj, message.arg1);
                    i = 1;
                    this.mainHandler.obtainMessage(2, i, this.activeTasks.size()).sendToTarget();
                    return;
                case 8:
                    removeDownload((String) message.obj);
                    i = 1;
                    this.mainHandler.obtainMessage(2, i, this.activeTasks.size()).sendToTarget();
                    return;
                case 9:
                    removeAllDownloads();
                    i = 1;
                    this.mainHandler.obtainMessage(2, i, this.activeTasks.size()).sendToTarget();
                    return;
                case 10:
                    onTaskStopped((Task) message.obj);
                    this.mainHandler.obtainMessage(2, i, this.activeTasks.size()).sendToTarget();
                    return;
                case 11:
                    onContentLengthChanged((Task) message.obj, Util.toLong(message.arg1, message.arg2));
                    return;
                case 12:
                    updateProgress();
                    return;
                case 13:
                    release();
                    return;
                default:
                    throw new IllegalStateException();
            }
        }

        private void initialize(int i) throws IOException {
            this.notMetRequirements = i;
            DownloadCursor downloads = null;
            try {
                try {
                    this.downloadIndex.setDownloadingStatesToQueued();
                    downloads = this.downloadIndex.getDownloads(0, 1, 2, 5, 7);
                    while (downloads.moveToNext()) {
                        this.downloads.add(downloads.getDownload());
                    }
                } catch (IOException e) {
                    Log.e(DownloadManager.TAG, "Failed to load index.", e);
                    this.downloads.clear();
                }
                Util.closeQuietly(downloads);
                this.mainHandler.obtainMessage(1, new ArrayList(this.downloads)).sendToTarget();
                syncTasks();
            } catch (Throwable th) {
                Util.closeQuietly(downloads);
                throw th;
            }
        }

        private void setDownloadsPaused(boolean z) {
            this.downloadsPaused = z;
            syncTasks();
        }

        private void setNotMetRequirements(int i) {
            this.notMetRequirements = i;
            syncTasks();
        }

        private void setStopReason(String str, int i) {
            if (str == null) {
                for (int i2 = 0; i2 < this.downloads.size(); i2++) {
                    setStopReason(this.downloads.get(i2), i);
                }
                try {
                    this.downloadIndex.setStopReason(i);
                } catch (IOException e) {
                    Log.e(DownloadManager.TAG, "Failed to set manual stop reason", e);
                }
            } else {
                Download download = getDownload(str, false);
                if (download != null) {
                    setStopReason(download, i);
                } else {
                    try {
                        this.downloadIndex.setStopReason(str, i);
                    } catch (IOException e2) {
                        Log.e(DownloadManager.TAG, "Failed to set manual stop reason: " + str, e2);
                    }
                }
            }
            syncTasks();
        }

        private void setStopReason(Download download, int i) {
            if (i == 0) {
                if (download.state == 1) {
                    putDownloadWithState(download, 0, 0);
                }
            } else if (i != download.stopReason) {
                int i2 = download.state;
                if (i2 == 0 || i2 == 2) {
                    i2 = 1;
                }
                putDownload(new Download(download.request, i2, download.startTimeMs, System.currentTimeMillis(), download.contentLength, i, 0, download.progress));
            }
        }

        private void setMaxParallelDownloads(int i) {
            this.maxParallelDownloads = i;
            syncTasks();
        }

        private void setMinRetryCount(int i) {
            this.minRetryCount = i;
        }

        private void addDownload(DownloadRequest downloadRequest, int i) {
            Download download = getDownload(downloadRequest.id, true);
            long jCurrentTimeMillis = System.currentTimeMillis();
            if (download != null) {
                putDownload(DownloadManager.mergeRequest(download, downloadRequest, i, jCurrentTimeMillis));
            } else {
                putDownload(new Download(downloadRequest, i != 0 ? 1 : 0, jCurrentTimeMillis, jCurrentTimeMillis, -1L, i, 0));
            }
            syncTasks();
        }

        private void removeDownload(String str) {
            Download download = getDownload(str, true);
            if (download == null) {
                Log.e(DownloadManager.TAG, "Failed to remove nonexistent download: " + str);
            } else {
                putDownloadWithState(download, 5, 0);
                syncTasks();
            }
        }

        private void removeAllDownloads() {
            ArrayList arrayList = new ArrayList();
            try {
                DownloadCursor downloads = this.downloadIndex.getDownloads(3, 4);
                while (downloads.moveToNext()) {
                    try {
                        arrayList.add(downloads.getDownload());
                    } finally {
                    }
                }
                if (downloads != null) {
                    downloads.close();
                }
            } catch (IOException unused) {
                Log.e(DownloadManager.TAG, "Failed to load downloads.");
            }
            for (int i = 0; i < this.downloads.size(); i++) {
                ArrayList<Download> arrayList2 = this.downloads;
                arrayList2.set(i, copyDownloadWithState(arrayList2.get(i), 5, 0));
            }
            for (int i2 = 0; i2 < arrayList.size(); i2++) {
                this.downloads.add(copyDownloadWithState((Download) arrayList.get(i2), 5, 0));
            }
            Collections.sort(this.downloads, new DownloadManager$InternalHandler$$ExternalSyntheticLambda0());
            try {
                this.downloadIndex.setStatesToRemoving();
            } catch (IOException e) {
                Log.e(DownloadManager.TAG, "Failed to update index.", e);
            }
            ArrayList arrayList3 = new ArrayList(this.downloads);
            for (int i3 = 0; i3 < this.downloads.size(); i3++) {
                this.mainHandler.obtainMessage(3, new DownloadUpdate(this.downloads.get(i3), false, arrayList3, null)).sendToTarget();
            }
            syncTasks();
        }

        private void release() {
            Iterator<Task> it = this.activeTasks.values().iterator();
            while (it.hasNext()) {
                it.next().cancel(true);
            }
            try {
                this.downloadIndex.setDownloadingStatesToQueued();
            } catch (IOException e) {
                Log.e(DownloadManager.TAG, "Failed to update index.", e);
            }
            this.downloads.clear();
            this.thread.quit();
            synchronized (this) {
                this.released = true;
                notifyAll();
            }
        }

        private void syncTasks() {
            int i = 0;
            for (int i2 = 0; i2 < this.downloads.size(); i2++) {
                Download download = this.downloads.get(i2);
                Task taskSyncQueuedDownload = this.activeTasks.get(download.request.id);
                int i3 = download.state;
                if (i3 == 0) {
                    taskSyncQueuedDownload = syncQueuedDownload(taskSyncQueuedDownload, download);
                } else if (i3 == 1) {
                    syncStoppedDownload(taskSyncQueuedDownload);
                } else if (i3 == 2) {
                    Assertions.checkNotNull(taskSyncQueuedDownload);
                    syncDownloadingDownload(taskSyncQueuedDownload, download, i);
                } else if (i3 == 5 || i3 == 7) {
                    syncRemovingDownload(taskSyncQueuedDownload, download);
                } else {
                    throw new IllegalStateException();
                }
                if (taskSyncQueuedDownload != null && !taskSyncQueuedDownload.isRemove) {
                    i++;
                }
            }
        }

        private void syncStoppedDownload(Task task) {
            if (task != null) {
                Assertions.checkState(!task.isRemove);
                task.cancel(false);
            }
        }

        private Task syncQueuedDownload(Task task, Download download) {
            if (task == null) {
                if (!canDownloadsRun() || this.activeDownloadTaskCount >= this.maxParallelDownloads) {
                    return null;
                }
                Download downloadPutDownloadWithState = putDownloadWithState(download, 2, 0);
                Task task2 = new Task(downloadPutDownloadWithState.request, this.downloaderFactory.createDownloader(downloadPutDownloadWithState.request), downloadPutDownloadWithState.progress, false, this.minRetryCount, this);
                this.activeTasks.put(downloadPutDownloadWithState.request.id, task2);
                int i = this.activeDownloadTaskCount;
                this.activeDownloadTaskCount = i + 1;
                if (i == 0) {
                    sendEmptyMessageDelayed(12, 5000L);
                }
                task2.start();
                return task2;
            }
            Assertions.checkState(!task.isRemove);
            task.cancel(false);
            return task;
        }

        private void syncDownloadingDownload(Task task, Download download, int i) {
            Assertions.checkState(!task.isRemove);
            if (!canDownloadsRun() || i >= this.maxParallelDownloads) {
                putDownloadWithState(download, 0, 0);
                task.cancel(false);
            }
        }

        private void syncRemovingDownload(Task task, Download download) {
            if (task == null) {
                if (this.hasActiveRemoveTask) {
                    return;
                }
                Task task2 = new Task(download.request, this.downloaderFactory.createDownloader(download.request), download.progress, true, this.minRetryCount, this);
                this.activeTasks.put(download.request.id, task2);
                this.hasActiveRemoveTask = true;
                task2.start();
                return;
            }
            if (task.isRemove) {
                return;
            }
            task.cancel(false);
        }

        private void onContentLengthChanged(Task task, long j) {
            Download download = (Download) Assertions.checkNotNull(getDownload(task.request.id, false));
            if (j == download.contentLength || j == -1) {
                return;
            }
            putDownload(new Download(download.request, download.state, download.startTimeMs, System.currentTimeMillis(), j, download.stopReason, download.failureReason, download.progress));
        }

        private void onTaskStopped(Task task) {
            String str = task.request.id;
            this.activeTasks.remove(str);
            boolean z = task.isRemove;
            if (z) {
                this.hasActiveRemoveTask = false;
            } else {
                int i = this.activeDownloadTaskCount - 1;
                this.activeDownloadTaskCount = i;
                if (i == 0) {
                    removeMessages(12);
                }
            }
            if (task.isCanceled) {
                syncTasks();
                return;
            }
            Exception exc = task.finalException;
            if (exc != null) {
                Log.e(DownloadManager.TAG, "Task failed: " + task.request + ", " + z, exc);
            }
            Download download = (Download) Assertions.checkNotNull(getDownload(str, false));
            int i2 = download.state;
            if (i2 == 2) {
                Assertions.checkState(!z);
                onDownloadTaskStopped(download, exc);
            } else if (i2 == 5 || i2 == 7) {
                Assertions.checkState(z);
                onRemoveTaskStopped(download);
            } else {
                throw new IllegalStateException();
            }
            syncTasks();
        }

        private void onDownloadTaskStopped(Download download, Exception exc) {
            Download download2 = new Download(download.request, exc == null ? 3 : 4, download.startTimeMs, System.currentTimeMillis(), download.contentLength, download.stopReason, exc == null ? 0 : 1, download.progress);
            this.downloads.remove(getDownloadIndex(download2.request.id));
            try {
                this.downloadIndex.putDownload(download2);
            } catch (IOException e) {
                Log.e(DownloadManager.TAG, "Failed to update index.", e);
            }
            this.mainHandler.obtainMessage(3, new DownloadUpdate(download2, false, new ArrayList(this.downloads), exc)).sendToTarget();
        }

        private void onRemoveTaskStopped(Download download) {
            if (download.state == 7) {
                putDownloadWithState(download, download.stopReason == 0 ? 0 : 1, download.stopReason);
                syncTasks();
            } else {
                this.downloads.remove(getDownloadIndex(download.request.id));
                try {
                    this.downloadIndex.removeDownload(download.request.id);
                } catch (IOException unused) {
                    Log.e(DownloadManager.TAG, "Failed to remove from database");
                }
                this.mainHandler.obtainMessage(3, new DownloadUpdate(download, true, new ArrayList(this.downloads), null)).sendToTarget();
            }
        }

        private void updateProgress() {
            for (int i = 0; i < this.downloads.size(); i++) {
                Download download = this.downloads.get(i);
                if (download.state == 2) {
                    try {
                        this.downloadIndex.putDownload(download);
                    } catch (IOException e) {
                        Log.e(DownloadManager.TAG, "Failed to update index.", e);
                    }
                }
            }
            sendEmptyMessageDelayed(12, 5000L);
        }

        private boolean canDownloadsRun() {
            return !this.downloadsPaused && this.notMetRequirements == 0;
        }

        private Download putDownloadWithState(Download download, int i, int i2) {
            Assertions.checkState((i == 3 || i == 4) ? false : true);
            return putDownload(copyDownloadWithState(download, i, i2));
        }

        private Download putDownload(Download download) {
            Assertions.checkState((download.state == 3 || download.state == 4) ? false : true);
            int downloadIndex = getDownloadIndex(download.request.id);
            if (downloadIndex == -1) {
                this.downloads.add(download);
                Collections.sort(this.downloads, new DownloadManager$InternalHandler$$ExternalSyntheticLambda0());
            } else {
                boolean z = download.startTimeMs != this.downloads.get(downloadIndex).startTimeMs;
                this.downloads.set(downloadIndex, download);
                if (z) {
                    Collections.sort(this.downloads, new DownloadManager$InternalHandler$$ExternalSyntheticLambda0());
                }
            }
            try {
                this.downloadIndex.putDownload(download);
            } catch (IOException e) {
                Log.e(DownloadManager.TAG, "Failed to update index.", e);
            }
            this.mainHandler.obtainMessage(3, new DownloadUpdate(download, false, new ArrayList(this.downloads), null)).sendToTarget();
            return download;
        }

        private Download getDownload(String str, boolean z) {
            int downloadIndex = getDownloadIndex(str);
            if (downloadIndex != -1) {
                return this.downloads.get(downloadIndex);
            }
            if (!z) {
                return null;
            }
            try {
                return this.downloadIndex.getDownload(str);
            } catch (IOException e) {
                Log.e(DownloadManager.TAG, "Failed to load download: " + str, e);
                return null;
            }
        }

        private int getDownloadIndex(String str) {
            for (int i = 0; i < this.downloads.size(); i++) {
                if (this.downloads.get(i).request.id.equals(str)) {
                    return i;
                }
            }
            return -1;
        }

        private static Download copyDownloadWithState(Download download, int i, int i2) {
            return new Download(download.request, i, download.startTimeMs, System.currentTimeMillis(), download.contentLength, i2, 0, download.progress);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static int compareStartTimes(Download download, Download download2) {
            return Util.compareLong(download.startTimeMs, download2.startTimeMs);
        }
    }

    private static class Task extends Thread implements Downloader.ProgressListener {
        private long contentLength;
        private final DownloadProgress downloadProgress;
        private final Downloader downloader;
        private Exception finalException;
        private volatile InternalHandler internalHandler;
        private volatile boolean isCanceled;
        private final boolean isRemove;
        private final int minRetryCount;
        private final DownloadRequest request;

        private Task(DownloadRequest downloadRequest, Downloader downloader, DownloadProgress downloadProgress, boolean z, int i, InternalHandler internalHandler) {
            this.request = downloadRequest;
            this.downloader = downloader;
            this.downloadProgress = downloadProgress;
            this.isRemove = z;
            this.minRetryCount = i;
            this.internalHandler = internalHandler;
            this.contentLength = -1L;
        }

        public void cancel(boolean z) {
            if (z) {
                this.internalHandler = null;
            }
            if (this.isCanceled) {
                return;
            }
            this.isCanceled = true;
            this.downloader.cancel();
            interrupt();
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() throws InterruptedException, IOException {
            try {
                if (this.isRemove) {
                    this.downloader.remove();
                } else {
                    long j = -1;
                    int i = 0;
                    while (!this.isCanceled) {
                        try {
                            this.downloader.download(this);
                            break;
                        } catch (IOException e) {
                            if (!this.isCanceled) {
                                long j2 = this.downloadProgress.bytesDownloaded;
                                if (j2 != j) {
                                    j = j2;
                                    i = 0;
                                }
                                i++;
                                if (i > this.minRetryCount) {
                                    throw e;
                                }
                                Thread.sleep(getRetryDelayMillis(i));
                            }
                        }
                    }
                }
            } catch (InterruptedException unused) {
                Thread.currentThread().interrupt();
            } catch (Exception e2) {
                this.finalException = e2;
            }
            InternalHandler internalHandler = this.internalHandler;
            if (internalHandler != null) {
                internalHandler.obtainMessage(10, this).sendToTarget();
            }
        }

        @Override // androidx.media3.exoplayer.offline.Downloader.ProgressListener
        public void onProgress(long j, long j2, float f) {
            this.downloadProgress.bytesDownloaded = j2;
            this.downloadProgress.percentDownloaded = f;
            if (j != this.contentLength) {
                this.contentLength = j;
                InternalHandler internalHandler = this.internalHandler;
                if (internalHandler != null) {
                    internalHandler.obtainMessage(11, (int) (j >> 32), (int) j, this).sendToTarget();
                }
            }
        }

        private static int getRetryDelayMillis(int i) {
            return Math.min((i - 1) * 1000, DefaultLoadControl.DEFAULT_BUFFER_FOR_PLAYBACK_AFTER_REBUFFER_MS);
        }
    }

    private static final class DownloadUpdate {
        public final Download download;
        public final List<Download> downloads;
        public final Exception finalException;
        public final boolean isRemove;

        public DownloadUpdate(Download download, boolean z, List<Download> list, Exception exc) {
            this.download = download;
            this.isRemove = z;
            this.downloads = list;
            this.finalException = exc;
        }
    }
}
