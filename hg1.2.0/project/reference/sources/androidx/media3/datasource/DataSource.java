package androidx.media3.datasource;

import android.net.Uri;
import androidx.media3.common.DataReader;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public interface DataSource extends DataReader {

    public interface Factory {
        DataSource createDataSource();
    }

    void addTransferListener(TransferListener transferListener);

    void close() throws IOException;

    Map<String, List<String>> getResponseHeaders();

    Uri getUri();

    long open(DataSpec dataSpec) throws IOException;

    /* renamed from: androidx.media3.datasource.DataSource$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
    }
}
