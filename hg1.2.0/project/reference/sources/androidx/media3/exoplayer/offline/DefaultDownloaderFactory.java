package androidx.media3.exoplayer.offline;

import android.util.SparseArray;
import androidx.media3.common.MediaItem;
import androidx.media3.common.util.Assertions;
import androidx.media3.common.util.Util;
import androidx.media3.datasource.cache.CacheDataSource;
import androidx.media3.exoplayer.dash.offline.DashDownloader$$ExternalSyntheticLambda0;
import java.lang.reflect.Constructor;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public class DefaultDownloaderFactory implements DownloaderFactory {
    private static final SparseArray<Constructor<? extends Downloader>> CONSTRUCTORS = createDownloaderConstructors();
    private final CacheDataSource.Factory cacheDataSourceFactory;
    private final Executor executor;

    @Deprecated
    public DefaultDownloaderFactory(CacheDataSource.Factory factory) {
        this(factory, new DashDownloader$$ExternalSyntheticLambda0());
    }

    public DefaultDownloaderFactory(CacheDataSource.Factory factory, Executor executor) {
        this.cacheDataSourceFactory = (CacheDataSource.Factory) Assertions.checkNotNull(factory);
        this.executor = (Executor) Assertions.checkNotNull(executor);
    }

    @Override // androidx.media3.exoplayer.offline.DownloaderFactory
    public Downloader createDownloader(DownloadRequest downloadRequest) {
        int iInferContentTypeForUriAndMimeType = Util.inferContentTypeForUriAndMimeType(downloadRequest.uri, downloadRequest.mimeType);
        if (iInferContentTypeForUriAndMimeType == 0 || iInferContentTypeForUriAndMimeType == 1 || iInferContentTypeForUriAndMimeType == 2) {
            return createDownloader(downloadRequest, iInferContentTypeForUriAndMimeType);
        }
        if (iInferContentTypeForUriAndMimeType == 4) {
            return new ProgressiveDownloader(new MediaItem.Builder().setUri(downloadRequest.uri).setCustomCacheKey(downloadRequest.customCacheKey).build(), this.cacheDataSourceFactory, this.executor);
        }
        throw new IllegalArgumentException("Unsupported type: " + iInferContentTypeForUriAndMimeType);
    }

    private Downloader createDownloader(DownloadRequest downloadRequest, int i) {
        Constructor<? extends Downloader> constructor = CONSTRUCTORS.get(i);
        if (constructor == null) {
            throw new IllegalStateException("Module missing for content type " + i);
        }
        try {
            return constructor.newInstance(new MediaItem.Builder().setUri(downloadRequest.uri).setStreamKeys(downloadRequest.streamKeys).setCustomCacheKey(downloadRequest.customCacheKey).build(), this.cacheDataSourceFactory, this.executor);
        } catch (Exception e) {
            throw new IllegalStateException("Failed to instantiate downloader for content type " + i, e);
        }
    }

    private static SparseArray<Constructor<? extends Downloader>> createDownloaderConstructors() {
        SparseArray<Constructor<? extends Downloader>> sparseArray = new SparseArray<>();
        try {
            sparseArray.put(0, getDownloaderConstructor(Class.forName("androidx.media3.exoplayer.dash.offline.DashDownloader")));
        } catch (ClassNotFoundException unused) {
        }
        try {
            sparseArray.put(2, getDownloaderConstructor(Class.forName("androidx.media3.exoplayer.hls.offline.HlsDownloader")));
        } catch (ClassNotFoundException unused2) {
        }
        try {
            sparseArray.put(1, getDownloaderConstructor(Class.forName("androidx.media3.exoplayer.smoothstreaming.offline.SsDownloader")));
        } catch (ClassNotFoundException unused3) {
        }
        return sparseArray;
    }

    private static Constructor<? extends Downloader> getDownloaderConstructor(Class<?> cls) {
        try {
            return cls.asSubclass(Downloader.class).getConstructor(MediaItem.class, CacheDataSource.Factory.class, Executor.class);
        } catch (NoSuchMethodException e) {
            throw new IllegalStateException("Downloader constructor missing", e);
        }
    }
}
