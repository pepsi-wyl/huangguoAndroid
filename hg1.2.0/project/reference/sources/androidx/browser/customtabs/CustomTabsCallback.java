package androidx.browser.customtabs;

import android.net.Uri;
import android.os.Bundle;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* loaded from: classes.dex */
public class CustomTabsCallback {
    public static final int ACTIVITY_LAYOUT_STATE_BOTTOM_SHEET = 1;
    public static final int ACTIVITY_LAYOUT_STATE_BOTTOM_SHEET_MAXIMIZED = 2;
    public static final int ACTIVITY_LAYOUT_STATE_FULL_SCREEN = 5;
    public static final int ACTIVITY_LAYOUT_STATE_SIDE_SHEET = 3;
    public static final int ACTIVITY_LAYOUT_STATE_SIDE_SHEET_MAXIMIZED = 4;
    public static final int ACTIVITY_LAYOUT_STATE_UNKNOWN = 0;
    public static final int NAVIGATION_ABORTED = 4;
    public static final int NAVIGATION_FAILED = 3;
    public static final int NAVIGATION_FINISHED = 2;
    public static final int NAVIGATION_STARTED = 1;
    public static final String ONLINE_EXTRAS_KEY = "online";
    public static final int TAB_HIDDEN = 6;
    public static final int TAB_SHOWN = 5;

    @Retention(RetentionPolicy.SOURCE)
    public @interface ActivityLayoutState {
    }

    public void extraCallback(String str, Bundle bundle) {
    }

    public Bundle extraCallbackWithResult(String str, Bundle bundle) {
        return null;
    }

    public void onActivityLayout(int i, int i2, int i3, int i4, int i5, Bundle bundle) {
    }

    public void onActivityResized(int i, int i2, Bundle bundle) {
    }

    public void onMessageChannelReady(Bundle bundle) {
    }

    public void onMinimized(Bundle bundle) {
    }

    public void onNavigationEvent(int i, Bundle bundle) {
    }

    public void onPostMessage(String str, Bundle bundle) {
    }

    public void onRelationshipValidationResult(int i, Uri uri, boolean z, Bundle bundle) {
    }

    public void onUnminimized(Bundle bundle) {
    }

    public void onWarmupCompleted(Bundle bundle) {
    }
}
