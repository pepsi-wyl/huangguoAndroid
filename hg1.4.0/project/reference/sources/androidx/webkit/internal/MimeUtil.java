package androidx.webkit.internal;

import java.net.URLConnection;
import kotlin.text.Typography;

/* loaded from: classes.dex */
class MimeUtil {
    MimeUtil() {
    }

    public static String getMimeFromFileName(String str) {
        if (str == null) {
            return null;
        }
        String strGuessContentTypeFromName = URLConnection.guessContentTypeFromName(str);
        return strGuessContentTypeFromName != null ? strGuessContentTypeFromName : guessHardcodedMime(str);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static String guessHardcodedMime(String str) {
        char c = '.';
        int iLastIndexOf = str.lastIndexOf(46);
        if (iLastIndexOf == -1) {
            return null;
        }
        String lowerCase = str.substring(iLastIndexOf + 1).toLowerCase();
        lowerCase.hashCode();
        switch (lowerCase.hashCode()) {
            case 3315:
                if (!lowerCase.equals("gz")) {
                    c = 65535;
                    break;
                } else {
                    c = 0;
                    break;
                }
            case 3401:
                if (lowerCase.equals("js")) {
                    c = 1;
                    break;
                }
                break;
            case 97669:
                if (lowerCase.equals("bmp")) {
                    c = 2;
                    break;
                }
                break;
            case 98819:
                if (lowerCase.equals("css")) {
                    c = 3;
                    break;
                }
                break;
            case 102340:
                if (lowerCase.equals("gif")) {
                    c = 4;
                    break;
                }
                break;
            case 103649:
                if (lowerCase.equals("htm")) {
                    c = 5;
                    break;
                }
                break;
            case 104085:
                if (lowerCase.equals("ico")) {
                    c = 6;
                    break;
                }
                break;
            case 105441:
                if (lowerCase.equals("jpg")) {
                    c = 7;
                    break;
                }
                break;
            case 106458:
                if (lowerCase.equals("m4a")) {
                    c = '\b';
                    break;
                }
                break;
            case 106479:
                if (lowerCase.equals("m4v")) {
                    c = '\t';
                    break;
                }
                break;
            case 108089:
                if (lowerCase.equals("mht")) {
                    c = '\n';
                    break;
                }
                break;
            case 108150:
                if (lowerCase.equals("mjs")) {
                    c = 11;
                    break;
                }
                break;
            case 108272:
                if (lowerCase.equals("mp3")) {
                    c = '\f';
                    break;
                }
                break;
            case 108273:
                if (lowerCase.equals("mp4")) {
                    c = '\r';
                    break;
                }
                break;
            case 108324:
                if (lowerCase.equals("mpg")) {
                    c = 14;
                    break;
                }
                break;
            case 109961:
                if (lowerCase.equals("oga")) {
                    c = 15;
                    break;
                }
                break;
            case 109967:
                if (lowerCase.equals("ogg")) {
                    c = 16;
                    break;
                }
                break;
            case 109973:
                if (lowerCase.equals("ogm")) {
                    c = 17;
                    break;
                }
                break;
            case 109982:
                if (lowerCase.equals("ogv")) {
                    c = 18;
                    break;
                }
                break;
            case 110834:
                if (lowerCase.equals("pdf")) {
                    c = 19;
                    break;
                }
                break;
            case 111030:
                if (lowerCase.equals("pjp")) {
                    c = 20;
                    break;
                }
                break;
            case 111145:
                if (lowerCase.equals("png")) {
                    c = 21;
                    break;
                }
                break;
            case 114276:
                if (lowerCase.equals("svg")) {
                    c = 22;
                    break;
                }
                break;
            case 114791:
                if (lowerCase.equals("tgz")) {
                    c = 23;
                    break;
                }
                break;
            case 114833:
                if (lowerCase.equals("tif")) {
                    c = 24;
                    break;
                }
                break;
            case 117484:
                if (lowerCase.equals("wav")) {
                    c = 25;
                    break;
                }
                break;
            case 118660:
                if (lowerCase.equals("xht")) {
                    c = 26;
                    break;
                }
                break;
            case 118807:
                if (lowerCase.equals("xml")) {
                    c = 27;
                    break;
                }
                break;
            case 120609:
                if (lowerCase.equals("zip")) {
                    c = 28;
                    break;
                }
                break;
            case 3000872:
                if (lowerCase.equals("apng")) {
                    c = 29;
                    break;
                }
                break;
            case 3145576:
                if (lowerCase.equals("flac")) {
                    c = 30;
                    break;
                }
                break;
            case 3213227:
                if (lowerCase.equals("html")) {
                    c = 31;
                    break;
                }
                break;
            case 3259225:
                if (lowerCase.equals("jfif")) {
                    c = ' ';
                    break;
                }
                break;
            case 3268712:
                if (lowerCase.equals("jpeg")) {
                    c = '!';
                    break;
                }
                break;
            case 3271912:
                if (lowerCase.equals("json")) {
                    c = Typography.quote;
                    break;
                }
                break;
            case 3358085:
                if (lowerCase.equals("mpeg")) {
                    c = '#';
                    break;
                }
                break;
            case 3418175:
                if (lowerCase.equals("opus")) {
                    c = Typography.dollar;
                    break;
                }
                break;
            case 3529614:
                if (lowerCase.equals("shtm")) {
                    c = '%';
                    break;
                }
                break;
            case 3542678:
                if (lowerCase.equals("svgz")) {
                    c = Typography.amp;
                    break;
                }
                break;
            case 3559925:
                if (lowerCase.equals("tiff")) {
                    c = '\'';
                    break;
                }
                break;
            case 3642020:
                if (lowerCase.equals("wasm")) {
                    c = '(';
                    break;
                }
                break;
            case 3645337:
                if (lowerCase.equals("webm")) {
                    c = ')';
                    break;
                }
                break;
            case 3645340:
                if (lowerCase.equals("webp")) {
                    c = '*';
                    break;
                }
                break;
            case 3655064:
                if (lowerCase.equals("woff")) {
                    c = '+';
                    break;
                }
                break;
            case 3678569:
                if (lowerCase.equals("xhtm")) {
                    c = ',';
                    break;
                }
                break;
            case 96488848:
                if (lowerCase.equals("ehtml")) {
                    c = '-';
                    break;
                }
                break;
            case 103877016:
                if (!lowerCase.equals("mhtml")) {
                }
                break;
            case 106703064:
                if (lowerCase.equals("pjpeg")) {
                    c = '/';
                    break;
                }
                break;
            case 109418142:
                if (lowerCase.equals("shtml")) {
                    c = '0';
                    break;
                }
                break;
            case 114035747:
                if (lowerCase.equals("xhtml")) {
                    c = '1';
                    break;
                }
                break;
        }
        switch (c) {
        }
        return null;
    }
}
