package androidx.webkit.internal;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.util.TypedValue;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;

/* loaded from: classes.dex */
public class AssetHelper {
    public static final String DEFAULT_MIME_TYPE = "text/plain";
    private Context mContext;

    public AssetHelper(Context context) {
        this.mContext = context;
    }

    private static InputStream handleSvgzStream(String str, InputStream inputStream) throws IOException {
        return str.endsWith(".svgz") ? new GZIPInputStream(inputStream) : inputStream;
    }

    private static String removeLeadingSlash(String str) {
        return (str.length() <= 1 || str.charAt(0) != '/') ? str : str.substring(1);
    }

    private int getFieldId(String str, String str2) {
        return this.mContext.getResources().getIdentifier(str2, str, this.mContext.getPackageName());
    }

    private int getValueType(int i) throws Resources.NotFoundException {
        TypedValue typedValue = new TypedValue();
        this.mContext.getResources().getValue(i, typedValue, true);
        return typedValue.type;
    }

    public InputStream openResource(String str) throws Resources.NotFoundException, IOException {
        String strRemoveLeadingSlash = removeLeadingSlash(str);
        String[] strArrSplit = strRemoveLeadingSlash.split("/", -1);
        if (strArrSplit.length != 2) {
            throw new IllegalArgumentException("Incorrect resource path: " + strRemoveLeadingSlash);
        }
        String str2 = strArrSplit[0];
        String strSubstring = strArrSplit[1];
        int iLastIndexOf = strSubstring.lastIndexOf(46);
        if (iLastIndexOf != -1) {
            strSubstring = strSubstring.substring(0, iLastIndexOf);
        }
        int fieldId = getFieldId(str2, strSubstring);
        int valueType = getValueType(fieldId);
        if (valueType != 3) {
            throw new IOException(String.format("Expected %s resource to be of TYPE_STRING but was %d", strRemoveLeadingSlash, Integer.valueOf(valueType)));
        }
        return handleSvgzStream(strRemoveLeadingSlash, this.mContext.getResources().openRawResource(fieldId));
    }

    public InputStream openAsset(String str) throws IOException {
        String strRemoveLeadingSlash = removeLeadingSlash(str);
        return handleSvgzStream(strRemoveLeadingSlash, this.mContext.getAssets().open(strRemoveLeadingSlash, 2));
    }

    public static InputStream openFile(File file) throws IOException {
        return handleSvgzStream(file.getPath(), new FileInputStream(file));
    }

    public static File getCanonicalFileIfChild(File file, String str) throws IOException {
        String canonicalDirPath = getCanonicalDirPath(file);
        String canonicalPath = new File(file, str).getCanonicalPath();
        if (canonicalPath.startsWith(canonicalDirPath)) {
            return new File(canonicalPath);
        }
        return null;
    }

    public static String getCanonicalDirPath(File file) throws IOException {
        String canonicalPath = file.getCanonicalPath();
        if (canonicalPath.endsWith("/")) {
            return canonicalPath;
        }
        return canonicalPath + "/";
    }

    public static File getDataDir(Context context) {
        if (Build.VERSION.SDK_INT >= 24) {
            return ApiHelperForN.getDataDir(context);
        }
        return context.getCacheDir().getParentFile();
    }

    public static String guessMimeType(String str) {
        String mimeFromFileName = MimeUtil.getMimeFromFileName(str);
        return mimeFromFileName == null ? DEFAULT_MIME_TYPE : mimeFromFileName;
    }
}
