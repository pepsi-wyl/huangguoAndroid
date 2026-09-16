package com.github.gzuliyujiang.oaid;

import android.util.Log;

/* loaded from: classes.dex */
public final class OAIDLog {
    private static final String TAG = "OAID";
    private static boolean enable = false;

    private OAIDLog() {
    }

    public static void enable() {
        enable = true;
    }

    public static void print(Object obj) {
        if (enable) {
            if (obj == null) {
                obj = "<null>";
            }
            Log.i(TAG, obj.toString());
        }
    }
}
