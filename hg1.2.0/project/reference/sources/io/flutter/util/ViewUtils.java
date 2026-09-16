package io.flutter.util;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;
import android.view.ViewGroup;
import androidx.window.layout.WindowMetrics;
import androidx.window.layout.WindowMetricsCalculator;

/* loaded from: classes2.dex */
public final class ViewUtils {

    public interface DisplayUpdater {
        void updateDisplayMetrics(float f, float f2, float f3);
    }

    public interface ViewVisitor {
        boolean run(View view);
    }

    public static void calculateMaximumDisplayMetrics(Context context, DisplayUpdater displayUpdater) {
        Activity activity = getActivity(context);
        if (activity != null) {
            WindowMetrics windowMetricsComputeMaximumWindowMetrics = WindowMetricsCalculator.CC.getOrCreate().computeMaximumWindowMetrics(activity);
            displayUpdater.updateDisplayMetrics(windowMetricsComputeMaximumWindowMetrics.getBounds().width(), windowMetricsComputeMaximumWindowMetrics.getBounds().height(), context.getResources().getDisplayMetrics().density);
        }
    }

    public static Activity getActivity(Context context) {
        if (context == null) {
            return null;
        }
        if (context instanceof Activity) {
            return (Activity) context;
        }
        if (context instanceof ContextWrapper) {
            return getActivity(((ContextWrapper) context).getBaseContext());
        }
        return null;
    }

    public static boolean childHasFocus(View view) {
        return traverseHierarchy(view, new ViewVisitor() { // from class: io.flutter.util.ViewUtils$$ExternalSyntheticLambda1
            @Override // io.flutter.util.ViewUtils.ViewVisitor
            public final boolean run(View view2) {
                return view2.hasFocus();
            }
        });
    }

    public static boolean hasChildViewOfType(View view, final Class<? extends View>[] clsArr) {
        return traverseHierarchy(view, new ViewVisitor() { // from class: io.flutter.util.ViewUtils$$ExternalSyntheticLambda0
            @Override // io.flutter.util.ViewUtils.ViewVisitor
            public final boolean run(View view2) {
                return ViewUtils.lambda$hasChildViewOfType$1(clsArr, view2);
            }
        });
    }

    static /* synthetic */ boolean lambda$hasChildViewOfType$1(Class[] clsArr, View view) {
        for (Class cls : clsArr) {
            if (cls.isInstance(view)) {
                return true;
            }
        }
        return false;
    }

    public static boolean traverseHierarchy(View view, ViewVisitor viewVisitor) {
        if (view == null) {
            return false;
        }
        if (viewVisitor.run(view)) {
            return true;
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                if (traverseHierarchy(viewGroup.getChildAt(i), viewVisitor)) {
                    return true;
                }
            }
        }
        return false;
    }
}
