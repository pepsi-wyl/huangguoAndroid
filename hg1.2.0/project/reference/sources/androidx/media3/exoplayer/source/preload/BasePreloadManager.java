package androidx.media3.exoplayer.source.preload;

import android.os.Handler;
import androidx.media3.common.C;
import androidx.media3.common.MediaItem;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;
import androidx.media3.exoplayer.source.MediaSource;
import androidx.media3.exoplayer.source.preload.TargetPreloadStatusControl;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.PriorityQueue;

/* loaded from: classes.dex */
public abstract class BasePreloadManager<T> {
    private final MediaSource.Factory mediaSourceFactory;
    protected final Comparator<T> rankingDataComparator;
    private final TargetPreloadStatusControl<T> targetPreloadStatusControl;
    private TargetPreloadStatusControl.PreloadStatus targetPreloadStatusOfCurrentPreloadingSource;
    private final Object lock = new Object();
    private final Map<MediaItem, BasePreloadManager<T>.MediaSourceHolder> mediaItemMediaSourceHolderMap = new HashMap();
    private final Handler startPreloadingHandler = Util.createHandlerForCurrentOrMainLooper();
    private final PriorityQueue<BasePreloadManager<T>.MediaSourceHolder> sourceHolderPriorityQueue = new PriorityQueue<>();

    protected abstract void clearSourceInternal(MediaSource mediaSource);

    protected MediaSource createMediaSourceForPreloading(MediaSource mediaSource) {
        return mediaSource;
    }

    protected abstract void preloadSourceInternal(MediaSource mediaSource, long j);

    protected void releaseInternal() {
    }

    protected abstract void releaseSourceInternal(MediaSource mediaSource);

    protected boolean shouldStartPreloadingNextSource() {
        return true;
    }

    protected static abstract class BuilderBase<T> {
        protected final MediaSource.Factory mediaSourceFactory;
        protected final Comparator<T> rankingDataComparator;
        protected final TargetPreloadStatusControl<T> targetPreloadStatusControl;

        public abstract BasePreloadManager<T> build();

        public BuilderBase(Comparator<T> comparator, TargetPreloadStatusControl<T> targetPreloadStatusControl, MediaSource.Factory factory) {
            this.rankingDataComparator = comparator;
            this.targetPreloadStatusControl = targetPreloadStatusControl;
            this.mediaSourceFactory = factory;
        }
    }

    protected BasePreloadManager(Comparator<T> comparator, TargetPreloadStatusControl<T> targetPreloadStatusControl, MediaSource.Factory factory) {
        this.rankingDataComparator = comparator;
        this.targetPreloadStatusControl = targetPreloadStatusControl;
        this.mediaSourceFactory = factory;
    }

    public final int getSourceCount() {
        return this.mediaItemMediaSourceHolderMap.size();
    }

    public final void add(MediaItem mediaItem, T t) {
        add(this.mediaSourceFactory.createMediaSource(mediaItem), (MediaSource) t);
    }

    public final void add(MediaSource mediaSource, T t) {
        MediaSource mediaSourceCreateMediaSourceForPreloading = createMediaSourceForPreloading(mediaSource);
        this.mediaItemMediaSourceHolderMap.put(mediaSourceCreateMediaSourceForPreloading.getMediaItem(), new MediaSourceHolder(this, mediaSourceCreateMediaSourceForPreloading, t));
    }

    public final void invalidate() {
        synchronized (this.lock) {
            this.sourceHolderPriorityQueue.clear();
            this.sourceHolderPriorityQueue.addAll(this.mediaItemMediaSourceHolderMap.values());
            while (!this.sourceHolderPriorityQueue.isEmpty() && !maybeStartPreloadNextSource()) {
                this.sourceHolderPriorityQueue.poll();
            }
        }
    }

    public final MediaSource getMediaSource(MediaItem mediaItem) {
        if (this.mediaItemMediaSourceHolderMap.containsKey(mediaItem)) {
            return this.mediaItemMediaSourceHolderMap.get(mediaItem).mediaSource;
        }
        return null;
    }

    public final boolean remove(MediaItem mediaItem) {
        if (!this.mediaItemMediaSourceHolderMap.containsKey(mediaItem)) {
            return false;
        }
        MediaSource mediaSource = this.mediaItemMediaSourceHolderMap.get(mediaItem).mediaSource;
        this.mediaItemMediaSourceHolderMap.remove(mediaItem);
        releaseSourceInternal(mediaSource);
        return true;
    }

    public final boolean remove(MediaSource mediaSource) {
        MediaItem mediaItem = mediaSource.getMediaItem();
        if (!this.mediaItemMediaSourceHolderMap.containsKey(mediaItem) || mediaSource != this.mediaItemMediaSourceHolderMap.get(mediaItem).mediaSource) {
            return false;
        }
        this.mediaItemMediaSourceHolderMap.remove(mediaItem);
        releaseSourceInternal(mediaSource);
        return true;
    }

    public final void reset() {
        Iterator<BasePreloadManager<T>.MediaSourceHolder> it = this.mediaItemMediaSourceHolderMap.values().iterator();
        while (it.hasNext()) {
            releaseSourceInternal(it.next().mediaSource);
        }
        this.mediaItemMediaSourceHolderMap.clear();
        synchronized (this.lock) {
            this.sourceHolderPriorityQueue.clear();
            this.targetPreloadStatusOfCurrentPreloadingSource = null;
        }
    }

    public final void release() {
        reset();
        releaseInternal();
    }

    protected final void onPreloadCompleted(final MediaSource mediaSource) {
        this.startPreloadingHandler.post(new Runnable() { // from class: androidx.media3.exoplayer.source.preload.BasePreloadManager$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m294x846d5e27(mediaSource);
            }
        });
    }

    /* renamed from: lambda$onPreloadCompleted$0$androidx-media3-exoplayer-source-preload-BasePreloadManager, reason: not valid java name */
    /* synthetic */ void m294x846d5e27(MediaSource mediaSource) {
        synchronized (this.lock) {
            if (!this.sourceHolderPriorityQueue.isEmpty() && ((MediaSourceHolder) Assertions.checkNotNull(this.sourceHolderPriorityQueue.peek())).mediaSource == mediaSource) {
                do {
                    this.sourceHolderPriorityQueue.poll();
                    if (this.sourceHolderPriorityQueue.isEmpty()) {
                        break;
                    }
                } while (!maybeStartPreloadNextSource());
            }
        }
    }

    protected final TargetPreloadStatusControl.PreloadStatus getTargetPreloadStatus(MediaSource mediaSource) {
        synchronized (this.lock) {
            if (!this.sourceHolderPriorityQueue.isEmpty() && ((MediaSourceHolder) Assertions.checkNotNull(this.sourceHolderPriorityQueue.peek())).mediaSource == mediaSource) {
                return this.targetPreloadStatusOfCurrentPreloadingSource;
            }
            return null;
        }
    }

    private boolean maybeStartPreloadNextSource() {
        if (!shouldStartPreloadingNextSource()) {
            return false;
        }
        MediaSourceHolder mediaSourceHolder = (MediaSourceHolder) Assertions.checkNotNull(this.sourceHolderPriorityQueue.peek());
        TargetPreloadStatusControl.PreloadStatus targetPreloadStatus = this.targetPreloadStatusControl.getTargetPreloadStatus(mediaSourceHolder.rankingData);
        this.targetPreloadStatusOfCurrentPreloadingSource = targetPreloadStatus;
        if (targetPreloadStatus != null) {
            preloadSourceInternal(mediaSourceHolder.mediaSource, mediaSourceHolder.startPositionUs);
            return true;
        }
        clearSourceInternal(mediaSourceHolder.mediaSource);
        return false;
    }

    private final class MediaSourceHolder implements Comparable<BasePreloadManager<T>.MediaSourceHolder> {
        public final MediaSource mediaSource;
        public final T rankingData;
        public final long startPositionUs;

        public MediaSourceHolder(BasePreloadManager basePreloadManager, MediaSource mediaSource, T t) {
            this(mediaSource, t, C.TIME_UNSET);
        }

        public MediaSourceHolder(MediaSource mediaSource, T t, long j) {
            this.mediaSource = mediaSource;
            this.rankingData = t;
            this.startPositionUs = j;
        }

        @Override // java.lang.Comparable
        public int compareTo(BasePreloadManager<T>.MediaSourceHolder mediaSourceHolder) {
            return BasePreloadManager.this.rankingDataComparator.compare(this.rankingData, mediaSourceHolder.rankingData);
        }
    }
}
