package io.flutter.plugin.platform;

import android.app.AlertDialog;
import android.app.Presentation;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.MutableContextWrapper;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import io.flutter.Log;

/* loaded from: classes2.dex */
class SingleViewPresentation extends Presentation {
    private static final String TAG = "PlatformViewsController";
    private final AccessibilityEventsDelegate accessibilityEventsDelegate;
    private FrameLayout container;
    private final View.OnFocusChangeListener focusChangeListener;
    private final Context outerContext;
    private AccessibilityDelegatingFrameLayout rootView;
    private boolean startFocused;
    private final PresentationState state;
    private int viewId;

    static class PresentationState {
        private SingleViewFakeWindowViewGroup fakeWindowViewGroup;
        private PlatformView platformView;
        private WindowManagerHandler windowManagerHandler;

        PresentationState() {
        }
    }

    public SingleViewPresentation(Context context, Display display, PlatformView platformView, AccessibilityEventsDelegate accessibilityEventsDelegate, int i, View.OnFocusChangeListener onFocusChangeListener) {
        super(new ImmContext(context), display);
        this.startFocused = false;
        this.accessibilityEventsDelegate = accessibilityEventsDelegate;
        this.viewId = i;
        this.focusChangeListener = onFocusChangeListener;
        this.outerContext = context;
        PresentationState presentationState = new PresentationState();
        this.state = presentationState;
        presentationState.platformView = platformView;
        getWindow().setFlags(8, 8);
        getWindow().setType(2030);
    }

    public SingleViewPresentation(Context context, Display display, AccessibilityEventsDelegate accessibilityEventsDelegate, PresentationState presentationState, View.OnFocusChangeListener onFocusChangeListener, boolean z) {
        super(new ImmContext(context), display);
        this.startFocused = false;
        this.accessibilityEventsDelegate = accessibilityEventsDelegate;
        this.state = presentationState;
        this.focusChangeListener = onFocusChangeListener;
        this.outerContext = context;
        getWindow().setFlags(8, 8);
        this.startFocused = z;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getWindow().setBackgroundDrawable(new ColorDrawable(0));
        if (this.state.fakeWindowViewGroup == null) {
            this.state.fakeWindowViewGroup = new SingleViewFakeWindowViewGroup(getContext());
        }
        if (this.state.windowManagerHandler == null) {
            WindowManager windowManager = (WindowManager) getContext().getSystemService("window");
            PresentationState presentationState = this.state;
            presentationState.windowManagerHandler = new WindowManagerHandler(windowManager, presentationState.fakeWindowViewGroup);
        }
        this.container = new FrameLayout(getContext());
        PresentationContext presentationContext = new PresentationContext(getContext(), this.state.windowManagerHandler, this.outerContext);
        View view = this.state.platformView.getView();
        if (view.getContext() instanceof MutableContextWrapper) {
            ((MutableContextWrapper) view.getContext()).setBaseContext(presentationContext);
        } else {
            Log.w(TAG, "Unexpected platform view context for view ID " + this.viewId + "; some functionality may not work correctly. When constructing a platform view in the factory, ensure that the view returned from PlatformViewFactory#create returns the provided context from getContext(). If you are unable to associate the view with that context, consider using Hybrid Composition instead.");
        }
        this.container.addView(view);
        AccessibilityDelegatingFrameLayout accessibilityDelegatingFrameLayout = new AccessibilityDelegatingFrameLayout(getContext(), this.accessibilityEventsDelegate, view);
        this.rootView = accessibilityDelegatingFrameLayout;
        accessibilityDelegatingFrameLayout.addView(this.container);
        this.rootView.addView(this.state.fakeWindowViewGroup);
        view.setOnFocusChangeListener(this.focusChangeListener);
        this.rootView.setFocusableInTouchMode(true);
        if (this.startFocused) {
            view.requestFocus();
        } else {
            this.rootView.requestFocus();
        }
        setContentView(this.rootView);
    }

    public PresentationState detachState() {
        FrameLayout frameLayout = this.container;
        if (frameLayout != null) {
            frameLayout.removeAllViews();
        }
        AccessibilityDelegatingFrameLayout accessibilityDelegatingFrameLayout = this.rootView;
        if (accessibilityDelegatingFrameLayout != null) {
            accessibilityDelegatingFrameLayout.removeAllViews();
        }
        return this.state;
    }

    public PlatformView getView() {
        return this.state.platformView;
    }

    private static class ImmContext extends ContextWrapper {
        private final InputMethodManager inputMethodManager;

        ImmContext(Context context) {
            this(context, null);
        }

        private ImmContext(Context context, InputMethodManager inputMethodManager) {
            super(context);
            this.inputMethodManager = inputMethodManager == null ? (InputMethodManager) context.getSystemService("input_method") : inputMethodManager;
        }

        @Override // android.content.ContextWrapper, android.content.Context
        public Object getSystemService(String str) {
            if ("input_method".equals(str)) {
                return this.inputMethodManager;
            }
            return super.getSystemService(str);
        }

        @Override // android.content.ContextWrapper, android.content.Context
        public Context createDisplayContext(Display display) {
            return new ImmContext(super.createDisplayContext(display), this.inputMethodManager);
        }
    }

    private static class PresentationContext extends ContextWrapper {
        private final Context flutterAppWindowContext;
        private WindowManager windowManager;
        private final WindowManagerHandler windowManagerHandler;

        PresentationContext(Context context, WindowManagerHandler windowManagerHandler, Context context2) {
            super(context);
            this.windowManagerHandler = windowManagerHandler;
            this.flutterAppWindowContext = context2;
        }

        @Override // android.content.ContextWrapper, android.content.Context
        public Object getSystemService(String str) {
            if ("window".equals(str)) {
                if (isCalledFromAlertDialog()) {
                    return this.flutterAppWindowContext.getSystemService(str);
                }
                return getWindowManager();
            }
            return super.getSystemService(str);
        }

        private WindowManager getWindowManager() {
            if (this.windowManager == null) {
                this.windowManager = this.windowManagerHandler;
            }
            return this.windowManager;
        }

        private boolean isCalledFromAlertDialog() {
            StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
            for (int i = 0; i < stackTrace.length && i < 11; i++) {
                if (stackTrace[i].getClassName().equals(AlertDialog.class.getCanonicalName()) && stackTrace[i].getMethodName().equals("<init>")) {
                    return true;
                }
            }
            return false;
        }
    }

    private static class AccessibilityDelegatingFrameLayout extends FrameLayout {
        private final AccessibilityEventsDelegate accessibilityEventsDelegate;
        private final View embeddedView;

        public AccessibilityDelegatingFrameLayout(Context context, AccessibilityEventsDelegate accessibilityEventsDelegate, View view) {
            super(context);
            this.accessibilityEventsDelegate = accessibilityEventsDelegate;
            this.embeddedView = view;
        }

        @Override // android.view.ViewGroup, android.view.ViewParent
        public boolean requestSendAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
            return this.accessibilityEventsDelegate.requestSendAccessibilityEvent(this.embeddedView, view, accessibilityEvent);
        }
    }
}
