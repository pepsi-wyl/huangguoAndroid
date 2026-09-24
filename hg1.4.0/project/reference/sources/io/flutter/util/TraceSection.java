package io.flutter.util;

import androidx.tracing.Trace;
import java.lang.reflect.InvocationTargetException;

/* loaded from: classes2.dex */
public final class TraceSection implements AutoCloseable {
    public static TraceSection scoped(String str) {
        return new TraceSection(str);
    }

    private TraceSection(String str) {
        begin(str);
    }

    @Override // java.lang.AutoCloseable
    public void close() throws RuntimeException {
        end();
    }

    private static String cropSectionName(String str) {
        if (str.length() < 124) {
            return str;
        }
        return str.substring(0, 124) + "...";
    }

    public static void begin(String str) {
        Trace.beginSection(cropSectionName(str));
    }

    public static void end() throws RuntimeException {
        Trace.endSection();
    }

    public static void beginAsyncSection(String str, int i) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Trace.beginAsyncSection(cropSectionName(str), i);
    }

    public static void endAsyncSection(String str, int i) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Trace.endAsyncSection(cropSectionName(str), i);
    }
}
