package androidx.media3.datasource;

import java.io.IOException;
import java.util.Arrays;

/* loaded from: classes.dex */
public final class DataSourceUtil {
    private DataSourceUtil() {
    }

    public static byte[] readToEnd(DataSource dataSource) throws IOException {
        byte[] bArrCopyOf = new byte[1024];
        int i = 0;
        int i2 = 0;
        while (i != -1) {
            if (i2 == bArrCopyOf.length) {
                bArrCopyOf = Arrays.copyOf(bArrCopyOf, bArrCopyOf.length * 2);
            }
            i = dataSource.read(bArrCopyOf, i2, bArrCopyOf.length - i2);
            if (i != -1) {
                i2 += i;
            }
        }
        return Arrays.copyOf(bArrCopyOf, i2);
    }

    public static byte[] readExactly(DataSource dataSource, int i) throws IOException {
        byte[] bArr = new byte[i];
        int i2 = 0;
        while (i2 < i) {
            int i3 = dataSource.read(bArr, i2, i - i2);
            if (i3 == -1) {
                throw new IllegalStateException("Not enough data could be read: " + i2 + " < " + i);
            }
            i2 += i3;
        }
        return bArr;
    }

    public static void closeQuietly(DataSource dataSource) {
        if (dataSource != null) {
            try {
                dataSource.close();
            } catch (IOException unused) {
            }
        }
    }
}
