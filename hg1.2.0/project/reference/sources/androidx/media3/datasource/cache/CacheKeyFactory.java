package androidx.media3.datasource.cache;

import androidx.media3.datasource.DataSpec;
import androidx.media3.datasource.cache.CacheKeyFactory;

/* loaded from: classes.dex */
public interface CacheKeyFactory {
    public static final CacheKeyFactory DEFAULT = new CacheKeyFactory() { // from class: androidx.media3.datasource.cache.CacheKeyFactory$$ExternalSyntheticLambda0
        @Override // androidx.media3.datasource.cache.CacheKeyFactory
        public final String buildCacheKey(DataSpec dataSpec) {
            return CacheKeyFactory.CC.lambda$static$0(dataSpec);
        }
    };

    String buildCacheKey(DataSpec dataSpec);

    /* renamed from: androidx.media3.datasource.cache.CacheKeyFactory$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        static {
            CacheKeyFactory cacheKeyFactory = CacheKeyFactory.DEFAULT;
        }

        public static /* synthetic */ String lambda$static$0(DataSpec dataSpec) {
            return dataSpec.key != null ? dataSpec.key : dataSpec.uri.toString();
        }
    }
}
