package androidx.media3.common.util;

import android.graphics.Bitmap;
import android.net.Uri;
import androidx.media3.common.MediaMetadata;
import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes.dex */
public interface BitmapLoader {
    ListenableFuture<Bitmap> decodeBitmap(byte[] bArr);

    ListenableFuture<Bitmap> loadBitmap(Uri uri);

    ListenableFuture<Bitmap> loadBitmapFromMetadata(MediaMetadata mediaMetadata);

    boolean supportsMimeType(String str);

    /* renamed from: androidx.media3.common.util.BitmapLoader$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static ListenableFuture $default$loadBitmapFromMetadata(BitmapLoader _this, MediaMetadata mediaMetadata) {
            if (mediaMetadata.artworkData != null) {
                return _this.decodeBitmap(mediaMetadata.artworkData);
            }
            if (mediaMetadata.artworkUri != null) {
                return _this.loadBitmap(mediaMetadata.artworkUri);
            }
            return null;
        }
    }
}
