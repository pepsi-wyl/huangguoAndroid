package io.flutter.plugin.platform;

import android.view.Surface;

/* loaded from: classes2.dex */
public interface PlatformViewRenderTarget {

    /* renamed from: io.flutter.plugin.platform.PlatformViewRenderTarget$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static void $default$scheduleFrame(PlatformViewRenderTarget _this) {
        }
    }

    int getHeight();

    long getId();

    Surface getSurface();

    int getWidth();

    boolean isReleased();

    void release();

    void resize(int i, int i2);

    void scheduleFrame();
}
