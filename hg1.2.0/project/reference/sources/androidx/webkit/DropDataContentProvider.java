package androidx.webkit;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import androidx.webkit.internal.WebViewGlueCommunicator;
import java.io.FileNotFoundException;
import org.chromium.support_lib_boundary.DropDataContentProviderBoundaryInterface;

/* loaded from: classes.dex */
public final class DropDataContentProvider extends ContentProvider {
    DropDataContentProviderBoundaryInterface mImpl;

    @Override // android.content.ContentProvider
    public boolean onCreate() {
        return true;
    }

    @Override // android.content.ContentProvider
    public ParcelFileDescriptor openFile(Uri uri, String str) throws FileNotFoundException {
        return getDropImpl().openFile(this, uri);
    }

    @Override // android.content.ContentProvider
    public Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        return getDropImpl().query(uri, strArr, str, strArr2, str2);
    }

    @Override // android.content.ContentProvider
    public String getType(Uri uri) {
        return getDropImpl().getType(uri);
    }

    @Override // android.content.ContentProvider
    public Uri insert(Uri uri, ContentValues contentValues) {
        throw new UnsupportedOperationException("Insert method is not supported.");
    }

    @Override // android.content.ContentProvider
    public int delete(Uri uri, String str, String[] strArr) {
        throw new UnsupportedOperationException("delete method is not supported.");
    }

    @Override // android.content.ContentProvider
    public int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        throw new UnsupportedOperationException("update method is not supported.");
    }

    @Override // android.content.ContentProvider
    public Bundle call(String str, String str2, Bundle bundle) {
        return getDropImpl().call(str, str2, bundle);
    }

    private DropDataContentProviderBoundaryInterface getDropImpl() {
        if (this.mImpl == null) {
            DropDataContentProviderBoundaryInterface dropDataProvider = WebViewGlueCommunicator.getFactory().getDropDataProvider();
            this.mImpl = dropDataProvider;
            dropDataProvider.onCreate();
        }
        return this.mImpl;
    }
}
