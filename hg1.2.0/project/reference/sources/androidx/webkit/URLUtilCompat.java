package androidx.webkit;

import android.net.Uri;
import android.webkit.MimeTypeMap;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes.dex */
public final class URLUtilCompat {
    private static final Pattern DISPOSITION_PATTERN = Pattern.compile("\\s*(\\S+?) # Group 1: parameter name\n\\s*=\\s* # Match equals sign\n(?: # non-capturing group of options\n   '( (?: [^'\\\\] | \\\\. )* )' # Group 2: single-quoted\n | \"( (?: [^\"\\\\] | \\\\. )*  )\" # Group 3: double-quoted\n | ( [^'\"][^;\\s]* ) # Group 4: un-quoted parameter\n)\\s*;? # Optional end semicolon", 4);

    private URLUtilCompat() {
    }

    public static String guessFileName(String str, String str2, String str3) {
        String filenameSuggestion = getFilenameSuggestion(str, str2);
        String strSuggestExtensionFromMimeType = suggestExtensionFromMimeType(str3);
        if (filenameSuggestion.indexOf(46) < 0) {
            return filenameSuggestion + strSuggestExtensionFromMimeType;
        }
        if (str3 == null || !extensionDifferentFromMimeType(filenameSuggestion, str3)) {
            return filenameSuggestion;
        }
        return filenameSuggestion + strSuggestExtensionFromMimeType;
    }

    private static String getFilenameSuggestion(String str, String str2) {
        String lastPathSegment;
        String filenameFromContentDisposition;
        if (str2 != null && (filenameFromContentDisposition = getFilenameFromContentDisposition(str2)) != null) {
            return replacePathSeparators(filenameFromContentDisposition);
        }
        Uri uri = Uri.parse(str);
        if (uri != null && (lastPathSegment = uri.getLastPathSegment()) != null) {
            return replacePathSeparators(lastPathSegment);
        }
        return "downloadfile";
    }

    private static String replacePathSeparators(String str) {
        return str.replaceAll("/", "_");
    }

    private static boolean extensionDifferentFromMimeType(String str, String str2) {
        String mimeTypeFromExtension = MimeTypeMap.getSingleton().getMimeTypeFromExtension(str.substring(str.lastIndexOf(46) + 1));
        return (mimeTypeFromExtension == null || mimeTypeFromExtension.equalsIgnoreCase(str2)) ? false : true;
    }

    private static String suggestExtensionFromMimeType(String str) {
        if (str == null) {
            return ".bin";
        }
        String extensionFromMimeType = MimeTypeMap.getSingleton().getExtensionFromMimeType(str);
        if (extensionFromMimeType != null) {
            return "." + extensionFromMimeType;
        }
        if (str.equalsIgnoreCase("text/html")) {
            return ".html";
        }
        if (!str.toLowerCase(Locale.ROOT).startsWith("text/")) {
            return ".bin";
        }
        return ".txt";
    }

    public static String getFilenameFromContentDisposition(String str) {
        String strGroup;
        String[] strArrSplit = str.trim().split(";", 2);
        String extValueString = null;
        if (strArrSplit.length < 2 || "inline".equalsIgnoreCase(strArrSplit[0].trim())) {
            return null;
        }
        Matcher matcher = DISPOSITION_PATTERN.matcher(strArrSplit[1]);
        String str2 = null;
        while (matcher.find()) {
            String strGroup2 = matcher.group(1);
            if (matcher.group(2) != null) {
                strGroup = removeSlashEscapes(matcher.group(2));
            } else if (matcher.group(3) != null) {
                strGroup = removeSlashEscapes(matcher.group(3));
            } else {
                strGroup = matcher.group(4);
            }
            if (strGroup2 != null && strGroup != null) {
                if ("filename*".equalsIgnoreCase(strGroup2)) {
                    extValueString = parseExtValueString(strGroup);
                } else if ("filename".equalsIgnoreCase(strGroup2)) {
                    str2 = strGroup;
                }
            }
        }
        return extValueString != null ? extValueString : str2;
    }

    private static String removeSlashEscapes(String str) {
        if (str == null) {
            return null;
        }
        return str.replaceAll("\\\\(.)", "$1");
    }

    private static String parseExtValueString(String str) {
        String[] strArrSplit = str.split("'", 3);
        if (strArrSplit.length < 3) {
            return null;
        }
        String str2 = strArrSplit[0];
        try {
            return URLDecoder.decode(encodePlusCharacters(strArrSplit[2], str2), str2);
        } catch (UnsupportedEncodingException | RuntimeException unused) {
            return null;
        }
    }

    private static String encodePlusCharacters(String str, String str2) {
        Charset charsetForName = Charset.forName(str2);
        StringBuilder sb = new StringBuilder();
        for (byte b : charsetForName.encode("+").array()) {
            sb.append(String.format("%02x", Byte.valueOf(b)));
        }
        return str.replaceAll("\\+", sb.toString());
    }
}
