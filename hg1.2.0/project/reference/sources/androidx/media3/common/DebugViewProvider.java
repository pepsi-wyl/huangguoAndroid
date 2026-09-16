package androidx.media3.common;

import android.view.SurfaceView;
import androidx.media3.common.DebugViewProvider;

/* loaded from: classes.dex */
public interface DebugViewProvider {
    public static final DebugViewProvider NONE = new DebugViewProvider() { // from class: androidx.media3.common.DebugViewProvider$$ExternalSyntheticLambda0
        @Override // androidx.media3.common.DebugViewProvider
        public final SurfaceView getDebugPreviewSurfaceView(int i, int i2) {
            return DebugViewProvider.CC.lambda$static$0(i, i2);
        }
    };

    /* renamed from: androidx.media3.common.DebugViewProvider$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        static {
            DebugViewProvider debugViewProvider = DebugViewProvider.NONE;
        }

        public static /* synthetic */ SurfaceView lambda$static$0(int i, int i2) {
            return null;
        }
    }

    SurfaceView getDebugPreviewSurfaceView(int i, int i2);
}
