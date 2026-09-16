package androidx.browser.customtabs;

import android.os.Bundle;

/* loaded from: classes.dex */
public interface EngagementSignalsCallback {

    /* renamed from: androidx.browser.customtabs.EngagementSignalsCallback$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static void $default$onGreatestScrollPercentageIncreased(EngagementSignalsCallback _this, int i, Bundle bundle) {
        }

        public static void $default$onSessionEnded(EngagementSignalsCallback _this, boolean z, Bundle bundle) {
        }

        public static void $default$onVerticalScrollEvent(EngagementSignalsCallback _this, boolean z, Bundle bundle) {
        }
    }

    void onGreatestScrollPercentageIncreased(int i, Bundle bundle);

    void onSessionEnded(boolean z, Bundle bundle);

    void onVerticalScrollEvent(boolean z, Bundle bundle);
}
