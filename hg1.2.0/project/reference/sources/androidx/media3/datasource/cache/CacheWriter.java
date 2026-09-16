package androidx.media3.datasource.cache;

import androidx.media3.datasource.DataSourceUtil;
import androidx.media3.datasource.DataSpec;
import androidx.media3.datasource.cache.ContentMetadata;
import java.io.IOException;
import java.io.InterruptedIOException;

/* loaded from: classes.dex */
public final class CacheWriter {
    public static final int DEFAULT_BUFFER_SIZE_BYTES = 131072;
    private long bytesCached;
    private final Cache cache;
    private final String cacheKey;
    private final CacheDataSource dataSource;
    private final DataSpec dataSpec;
    private long endPosition;
    private volatile boolean isCanceled;
    private long nextPosition;
    private final ProgressListener progressListener;
    private final byte[] temporaryBuffer;

    public interface ProgressListener {
        void onProgress(long j, long j2, long j3);
    }

    public CacheWriter(CacheDataSource cacheDataSource, DataSpec dataSpec, byte[] bArr, ProgressListener progressListener) {
        this.dataSource = cacheDataSource;
        this.cache = cacheDataSource.getCache();
        this.dataSpec = dataSpec;
        this.temporaryBuffer = bArr == null ? new byte[131072] : bArr;
        this.progressListener = progressListener;
        this.cacheKey = cacheDataSource.getCacheKeyFactory().buildCacheKey(dataSpec);
        this.nextPosition = dataSpec.position;
    }

    public void cancel() {
        this.isCanceled = true;
    }

    public void cache() throws IOException {
        throwIfCanceled();
        this.bytesCached = this.cache.getCachedBytes(this.cacheKey, this.dataSpec.position, this.dataSpec.length);
        if (this.dataSpec.length != -1) {
            this.endPosition = this.dataSpec.position + this.dataSpec.length;
        } else {
            long contentLength = ContentMetadata.CC.getContentLength(this.cache.getContentMetadata(this.cacheKey));
            if (contentLength == -1) {
                contentLength = -1;
            }
            this.endPosition = contentLength;
        }
        ProgressListener progressListener = this.progressListener;
        if (progressListener != null) {
            progressListener.onProgress(getLength(), this.bytesCached, 0L);
        }
        while (true) {
            long j = this.endPosition;
            if (j != -1 && this.nextPosition >= j) {
                return;
            }
            throwIfCanceled();
            long j2 = this.endPosition;
            long cachedLength = this.cache.getCachedLength(this.cacheKey, this.nextPosition, j2 == -1 ? Long.MAX_VALUE : j2 - this.nextPosition);
            if (cachedLength > 0) {
                this.nextPosition += cachedLength;
            } else {
                long j3 = -cachedLength;
                if (j3 == Long.MAX_VALUE) {
                    j3 = -1;
                }
                long j4 = this.nextPosition;
                this.nextPosition = j4 + readBlockToCache(j4, j3);
            }
        }
    }

    private long readBlockToCache(long j, long j2) throws IOException {
        long jOpen;
        boolean z = true;
        boolean z2 = j + j2 == this.endPosition || j2 == -1;
        if (j2 != -1) {
            try {
                jOpen = this.dataSource.open(this.dataSpec.buildUpon().setPosition(j).setLength(j2).build());
            } catch (IOException unused) {
                DataSourceUtil.closeQuietly(this.dataSource);
            }
        } else {
            jOpen = -1;
            z = false;
        }
        if (!z) {
            throwIfCanceled();
            try {
                jOpen = this.dataSource.open(this.dataSpec.buildUpon().setPosition(j).setLength(-1L).build());
            } catch (IOException e) {
                DataSourceUtil.closeQuietly(this.dataSource);
                throw e;
            }
        }
        if (z2 && jOpen != -1) {
            try {
                onRequestEndPosition(jOpen + j);
            } catch (IOException e2) {
                DataSourceUtil.closeQuietly(this.dataSource);
                throw e2;
            }
        }
        int i = 0;
        int i2 = 0;
        while (i != -1) {
            throwIfCanceled();
            CacheDataSource cacheDataSource = this.dataSource;
            byte[] bArr = this.temporaryBuffer;
            i = cacheDataSource.read(bArr, 0, bArr.length);
            if (i != -1) {
                onNewBytesCached(i);
                i2 += i;
            }
        }
        if (z2) {
            onRequestEndPosition(j + i2);
        }
        this.dataSource.close();
        return i2;
    }

    private void onRequestEndPosition(long j) {
        if (this.endPosition == j) {
            return;
        }
        this.endPosition = j;
        ProgressListener progressListener = this.progressListener;
        if (progressListener != null) {
            progressListener.onProgress(getLength(), this.bytesCached, 0L);
        }
    }

    private void onNewBytesCached(long j) {
        this.bytesCached += j;
        ProgressListener progressListener = this.progressListener;
        if (progressListener != null) {
            progressListener.onProgress(getLength(), this.bytesCached, j);
        }
    }

    private long getLength() {
        long j = this.endPosition;
        if (j == -1) {
            return -1L;
        }
        return j - this.dataSpec.position;
    }

    private void throwIfCanceled() throws InterruptedIOException {
        if (this.isCanceled) {
            throw new InterruptedIOException();
        }
    }
}
