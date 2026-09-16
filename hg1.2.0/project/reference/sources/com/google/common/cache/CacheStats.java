package com.google.common.cache;

import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.math.LongMath;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* loaded from: classes.dex */
public final class CacheStats {
    private final long evictionCount;
    private final long hitCount;
    private final long loadExceptionCount;
    private final long loadSuccessCount;
    private final long missCount;
    private final long totalLoadTime;

    public CacheStats(long hitCount, long missCount, long loadSuccessCount, long loadExceptionCount, long totalLoadTime, long evictionCount) {
        Preconditions.checkArgument(hitCount >= 0);
        Preconditions.checkArgument(missCount >= 0);
        Preconditions.checkArgument(loadSuccessCount >= 0);
        Preconditions.checkArgument(loadExceptionCount >= 0);
        Preconditions.checkArgument(totalLoadTime >= 0);
        Preconditions.checkArgument(evictionCount >= 0);
        this.hitCount = hitCount;
        this.missCount = missCount;
        this.loadSuccessCount = loadSuccessCount;
        this.loadExceptionCount = loadExceptionCount;
        this.totalLoadTime = totalLoadTime;
        this.evictionCount = evictionCount;
    }

    public long requestCount() {
        return LongMath.saturatedAdd(this.hitCount, this.missCount);
    }

    public long hitCount() {
        return this.hitCount;
    }

    public double hitRate() {
        long jRequestCount = requestCount();
        if (jRequestCount == 0) {
            return 1.0d;
        }
        return this.hitCount / jRequestCount;
    }

    public long missCount() {
        return this.missCount;
    }

    public double missRate() {
        long jRequestCount = requestCount();
        if (jRequestCount == 0) {
            return 0.0d;
        }
        return this.missCount / jRequestCount;
    }

    public long loadCount() {
        return LongMath.saturatedAdd(this.loadSuccessCount, this.loadExceptionCount);
    }

    public long loadSuccessCount() {
        return this.loadSuccessCount;
    }

    public long loadExceptionCount() {
        return this.loadExceptionCount;
    }

    public double loadExceptionRate() {
        long jSaturatedAdd = LongMath.saturatedAdd(this.loadSuccessCount, this.loadExceptionCount);
        if (jSaturatedAdd == 0) {
            return 0.0d;
        }
        return this.loadExceptionCount / jSaturatedAdd;
    }

    public long totalLoadTime() {
        return this.totalLoadTime;
    }

    public double averageLoadPenalty() {
        long jSaturatedAdd = LongMath.saturatedAdd(this.loadSuccessCount, this.loadExceptionCount);
        if (jSaturatedAdd == 0) {
            return 0.0d;
        }
        return this.totalLoadTime / jSaturatedAdd;
    }

    public long evictionCount() {
        return this.evictionCount;
    }

    public CacheStats minus(CacheStats other) {
        return new CacheStats(Math.max(0L, LongMath.saturatedSubtract(this.hitCount, other.hitCount)), Math.max(0L, LongMath.saturatedSubtract(this.missCount, other.missCount)), Math.max(0L, LongMath.saturatedSubtract(this.loadSuccessCount, other.loadSuccessCount)), Math.max(0L, LongMath.saturatedSubtract(this.loadExceptionCount, other.loadExceptionCount)), Math.max(0L, LongMath.saturatedSubtract(this.totalLoadTime, other.totalLoadTime)), Math.max(0L, LongMath.saturatedSubtract(this.evictionCount, other.evictionCount)));
    }

    public CacheStats plus(CacheStats other) {
        return new CacheStats(LongMath.saturatedAdd(this.hitCount, other.hitCount), LongMath.saturatedAdd(this.missCount, other.missCount), LongMath.saturatedAdd(this.loadSuccessCount, other.loadSuccessCount), LongMath.saturatedAdd(this.loadExceptionCount, other.loadExceptionCount), LongMath.saturatedAdd(this.totalLoadTime, other.totalLoadTime), LongMath.saturatedAdd(this.evictionCount, other.evictionCount));
    }

    public int hashCode() {
        return Objects.hashCode(Long.valueOf(this.hitCount), Long.valueOf(this.missCount), Long.valueOf(this.loadSuccessCount), Long.valueOf(this.loadExceptionCount), Long.valueOf(this.totalLoadTime), Long.valueOf(this.evictionCount));
    }

    public boolean equals(@CheckForNull Object object) {
        if (!(object instanceof CacheStats)) {
            return false;
        }
        CacheStats cacheStats = (CacheStats) object;
        return this.hitCount == cacheStats.hitCount && this.missCount == cacheStats.missCount && this.loadSuccessCount == cacheStats.loadSuccessCount && this.loadExceptionCount == cacheStats.loadExceptionCount && this.totalLoadTime == cacheStats.totalLoadTime && this.evictionCount == cacheStats.evictionCount;
    }

    public String toString() {
        return MoreObjects.toStringHelper(this).add("hitCount", this.hitCount).add("missCount", this.missCount).add("loadSuccessCount", this.loadSuccessCount).add("loadExceptionCount", this.loadExceptionCount).add("totalLoadTime", this.totalLoadTime).add("evictionCount", this.evictionCount).toString();
    }
}
