package io.flutter.plugin.platform;

import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import io.flutter.view.AccessibilityBridge;

/* loaded from: classes2.dex */
class AccessibilityEventsDelegate {
    private AccessibilityBridge accessibilityBridge;

    AccessibilityEventsDelegate() {
    }

    public boolean requestSendAccessibilityEvent(View view, View view2, AccessibilityEvent accessibilityEvent) {
        AccessibilityBridge accessibilityBridge = this.accessibilityBridge;
        if (accessibilityBridge == null) {
            return false;
        }
        return accessibilityBridge.externalViewRequestSendAccessibilityEvent(view, view2, accessibilityEvent);
    }

    public boolean onAccessibilityHoverEvent(MotionEvent motionEvent, boolean z) {
        AccessibilityBridge accessibilityBridge = this.accessibilityBridge;
        if (accessibilityBridge == null) {
            return false;
        }
        return accessibilityBridge.onAccessibilityHoverEvent(motionEvent, z);
    }

    void setAccessibilityBridge(AccessibilityBridge accessibilityBridge) {
        this.accessibilityBridge = accessibilityBridge;
    }
}
