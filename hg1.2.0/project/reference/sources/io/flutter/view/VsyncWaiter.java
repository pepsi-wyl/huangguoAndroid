package io.flutter.view;

import android.hardware.display.DisplayManager;
import android.view.Choreographer;
import io.flutter.embedding.engine.FlutterJNI;
import java.util.Objects;

/* loaded from: classes2.dex */
public class VsyncWaiter {
    private static VsyncWaiter instance;
    private static DisplayListener listener;
    private FlutterJNI flutterJNI;
    private long refreshPeriodNanos = -1;
    private FrameCallback frameCallback = new FrameCallback(0);
    private final FlutterJNI.AsyncWaitForVsyncDelegate asyncWaitForVsyncDelegate = new FlutterJNI.AsyncWaitForVsyncDelegate() { // from class: io.flutter.view.VsyncWaiter.1
        private Choreographer.FrameCallback obtainFrameCallback(long j) {
            if (VsyncWaiter.this.frameCallback != null) {
                VsyncWaiter.this.frameCallback.cookie = j;
                FrameCallback frameCallback = VsyncWaiter.this.frameCallback;
                VsyncWaiter.this.frameCallback = null;
                return frameCallback;
            }
            return VsyncWaiter.this.new FrameCallback(j);
        }

        @Override // io.flutter.embedding.engine.FlutterJNI.AsyncWaitForVsyncDelegate
        public void asyncWaitForVsync(long j) {
            Choreographer.getInstance().postFrameCallback(obtainFrameCallback(j));
        }
    };

    class DisplayListener implements DisplayManager.DisplayListener {
        private DisplayManager displayManager;

        @Override // android.hardware.display.DisplayManager.DisplayListener
        public void onDisplayAdded(int i) {
        }

        @Override // android.hardware.display.DisplayManager.DisplayListener
        public void onDisplayRemoved(int i) {
        }

        DisplayListener(DisplayManager displayManager) {
            this.displayManager = displayManager;
        }

        void register() {
            this.displayManager.registerDisplayListener(this, null);
        }

        @Override // android.hardware.display.DisplayManager.DisplayListener
        public void onDisplayChanged(int i) {
            if (i == 0) {
                float refreshRate = this.displayManager.getDisplay(0).getRefreshRate();
                VsyncWaiter.this.refreshPeriodNanos = (long) (1.0E9d / refreshRate);
                VsyncWaiter.this.flutterJNI.setRefreshRateFPS(refreshRate);
            }
        }
    }

    public static VsyncWaiter getInstance(float f, FlutterJNI flutterJNI) {
        if (instance == null) {
            instance = new VsyncWaiter(flutterJNI);
        }
        flutterJNI.setRefreshRateFPS(f);
        VsyncWaiter vsyncWaiter = instance;
        vsyncWaiter.refreshPeriodNanos = (long) (1.0E9d / f);
        return vsyncWaiter;
    }

    public static VsyncWaiter getInstance(DisplayManager displayManager, FlutterJNI flutterJNI) {
        if (instance == null) {
            instance = new VsyncWaiter(flutterJNI);
        }
        if (listener == null) {
            VsyncWaiter vsyncWaiter = instance;
            Objects.requireNonNull(vsyncWaiter);
            DisplayListener displayListener = vsyncWaiter.new DisplayListener(displayManager);
            listener = displayListener;
            displayListener.register();
        }
        if (instance.refreshPeriodNanos == -1) {
            float refreshRate = displayManager.getDisplay(0).getRefreshRate();
            instance.refreshPeriodNanos = (long) (1.0E9d / refreshRate);
            flutterJNI.setRefreshRateFPS(refreshRate);
        }
        return instance;
    }

    public static void reset() {
        instance = null;
        listener = null;
    }

    private class FrameCallback implements Choreographer.FrameCallback {
        private long cookie;

        FrameCallback(long j) {
            this.cookie = j;
        }

        @Override // android.view.Choreographer.FrameCallback
        public void doFrame(long j) {
            long jNanoTime = System.nanoTime() - j;
            VsyncWaiter.this.flutterJNI.onVsync(jNanoTime < 0 ? 0L : jNanoTime, VsyncWaiter.this.refreshPeriodNanos, this.cookie);
            VsyncWaiter.this.frameCallback = this;
        }
    }

    private VsyncWaiter(FlutterJNI flutterJNI) {
        this.flutterJNI = flutterJNI;
    }

    public void init() {
        this.flutterJNI.setAsyncWaitForVsyncDelegate(this.asyncWaitForVsyncDelegate);
    }
}
