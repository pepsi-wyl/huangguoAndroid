package androidx.media3.exoplayer.hls;

import androidx.media3.datasource.DataSource;

/* loaded from: classes.dex */
public final class DefaultHlsDataSourceFactory implements HlsDataSourceFactory {
    private final DataSource.Factory dataSourceFactory;

    public DefaultHlsDataSourceFactory(DataSource.Factory factory) {
        this.dataSourceFactory = factory;
    }

    @Override // androidx.media3.exoplayer.hls.HlsDataSourceFactory
    public DataSource createDataSource(int i) {
        return this.dataSourceFactory.createDataSource();
    }
}
