package io.flutter.plugin.common;

/* loaded from: classes2.dex */
public class FlutterException extends RuntimeException {
    private static final String TAG = "FlutterException#";
    public final String code;
    public final Object details;

    FlutterException(String str, String str2, Object obj) {
        super(str2);
        this.code = str;
        this.details = obj;
    }
}
