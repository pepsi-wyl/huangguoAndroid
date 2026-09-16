package io.flutter.embedding.engine.systemchannels;

import android.window.BackEvent;
import androidx.core.app.NotificationCompat;
import io.flutter.Log;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.StandardMethodCodec;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class BackGestureChannel {
    private static final String TAG = "BackGestureChannel";
    public final MethodChannel channel;
    private final MethodChannel.MethodCallHandler defaultHandler;

    public BackGestureChannel(DartExecutor dartExecutor) {
        MethodChannel.MethodCallHandler methodCallHandler = new MethodChannel.MethodCallHandler() { // from class: io.flutter.embedding.engine.systemchannels.BackGestureChannel.1
            @Override // io.flutter.plugin.common.MethodChannel.MethodCallHandler
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                result.success(null);
            }
        };
        this.defaultHandler = methodCallHandler;
        MethodChannel methodChannel = new MethodChannel(dartExecutor, "flutter/backgesture", StandardMethodCodec.INSTANCE);
        this.channel = methodChannel;
        methodChannel.setMethodCallHandler(methodCallHandler);
    }

    public void startBackGesture(BackEvent backEvent) {
        Log.v(TAG, "Sending message to start back gesture");
        this.channel.invokeMethod("startBackGesture", backEventToJsonMap(backEvent));
    }

    public void updateBackGestureProgress(BackEvent backEvent) {
        Log.v(TAG, "Sending message to update back gesture progress");
        this.channel.invokeMethod("updateBackGestureProgress", backEventToJsonMap(backEvent));
    }

    public void commitBackGesture() {
        Log.v(TAG, "Sending message to commit back gesture");
        this.channel.invokeMethod("commitBackGesture", null);
    }

    public void cancelBackGesture() {
        Log.v(TAG, "Sending message to cancel back gesture");
        this.channel.invokeMethod("cancelBackGesture", null);
    }

    public void setMethodCallHandler(MethodChannel.MethodCallHandler methodCallHandler) {
        this.channel.setMethodCallHandler(methodCallHandler);
    }

    private Map<String, Object> backEventToJsonMap(BackEvent backEvent) {
        HashMap map = new HashMap(3);
        float touchX = backEvent.getTouchX();
        float touchY = backEvent.getTouchY();
        map.put("touchOffset", (Float.isNaN(touchX) || Float.isNaN(touchY)) ? null : Arrays.asList(Float.valueOf(touchX), Float.valueOf(touchY)));
        map.put(NotificationCompat.CATEGORY_PROGRESS, Float.valueOf(backEvent.getProgress()));
        map.put("swipeEdge", Integer.valueOf(backEvent.getSwipeEdge()));
        return map;
    }
}
