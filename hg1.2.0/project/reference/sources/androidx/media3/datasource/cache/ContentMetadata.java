package androidx.media3.datasource.cache;

import android.net.Uri;

/* loaded from: classes.dex */
public interface ContentMetadata {
    public static final String KEY_CONTENT_LENGTH = "exo_len";
    public static final String KEY_CUSTOM_PREFIX = "custom_";
    public static final String KEY_REDIRECTED_URI = "exo_redir";

    boolean contains(String str);

    long get(String str, long j);

    String get(String str, String str2);

    byte[] get(String str, byte[] bArr);

    /* renamed from: androidx.media3.datasource.cache.ContentMetadata$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static long getContentLength(ContentMetadata contentMetadata) {
            return contentMetadata.get(ContentMetadata.KEY_CONTENT_LENGTH, -1L);
        }

        public static Uri getRedirectedUri(ContentMetadata contentMetadata) {
            String str = contentMetadata.get(ContentMetadata.KEY_REDIRECTED_URI, (String) null);
            if (str == null) {
                return null;
            }
            return Uri.parse(str);
        }
    }
}
