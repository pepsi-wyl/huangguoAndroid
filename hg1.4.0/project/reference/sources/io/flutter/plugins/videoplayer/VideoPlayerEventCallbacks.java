package io.flutter.plugins.videoplayer;

import androidx.core.app.NotificationCompat;
import io.flutter.plugin.common.EventChannel;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;

/* loaded from: classes2.dex */
final class VideoPlayerEventCallbacks implements VideoPlayerCallbacks {
    private final EventChannel.EventSink eventSink;

    static VideoPlayerEventCallbacks bindTo(EventChannel eventChannel) {
        final QueuingEventSink queuingEventSink = new QueuingEventSink();
        eventChannel.setStreamHandler(new EventChannel.StreamHandler() { // from class: io.flutter.plugins.videoplayer.VideoPlayerEventCallbacks.1
            @Override // io.flutter.plugin.common.EventChannel.StreamHandler
            public void onListen(Object obj, EventChannel.EventSink eventSink) {
                queuingEventSink.setDelegate(eventSink);
            }

            @Override // io.flutter.plugin.common.EventChannel.StreamHandler
            public void onCancel(Object obj) {
                queuingEventSink.setDelegate(null);
            }
        });
        return withSink(queuingEventSink);
    }

    static VideoPlayerEventCallbacks withSink(EventChannel.EventSink eventSink) {
        return new VideoPlayerEventCallbacks(eventSink);
    }

    private VideoPlayerEventCallbacks(EventChannel.EventSink eventSink) {
        this.eventSink = eventSink;
    }

    @Override // io.flutter.plugins.videoplayer.VideoPlayerCallbacks
    public void onInitialized(int i, int i2, long j, int i3) {
        HashMap map = new HashMap();
        map.put(NotificationCompat.CATEGORY_EVENT, "initialized");
        map.put("width", Integer.valueOf(i));
        map.put("height", Integer.valueOf(i2));
        map.put("duration", Long.valueOf(j));
        if (i3 != 0) {
            map.put("rotationCorrection", Integer.valueOf(i3));
        }
        this.eventSink.success(map);
    }

    @Override // io.flutter.plugins.videoplayer.VideoPlayerCallbacks
    public void onBufferingStart() {
        HashMap map = new HashMap();
        map.put(NotificationCompat.CATEGORY_EVENT, "bufferingStart");
        this.eventSink.success(map);
    }

    @Override // io.flutter.plugins.videoplayer.VideoPlayerCallbacks
    public void onBufferingUpdate(long j) {
        HashMap map = new HashMap();
        map.put(NotificationCompat.CATEGORY_EVENT, "bufferingUpdate");
        map.put("values", Collections.singletonList(Arrays.asList(0, Long.valueOf(j))));
        this.eventSink.success(map);
    }

    @Override // io.flutter.plugins.videoplayer.VideoPlayerCallbacks
    public void onBufferingEnd() {
        HashMap map = new HashMap();
        map.put(NotificationCompat.CATEGORY_EVENT, "bufferingEnd");
        this.eventSink.success(map);
    }

    @Override // io.flutter.plugins.videoplayer.VideoPlayerCallbacks
    public void onCompleted() {
        HashMap map = new HashMap();
        map.put(NotificationCompat.CATEGORY_EVENT, "completed");
        this.eventSink.success(map);
    }

    @Override // io.flutter.plugins.videoplayer.VideoPlayerCallbacks
    public void onError(String str, String str2, Object obj) {
        this.eventSink.error(str, str2, obj);
    }

    @Override // io.flutter.plugins.videoplayer.VideoPlayerCallbacks
    public void onIsPlayingStateUpdate(boolean z) {
        HashMap map = new HashMap();
        map.put(NotificationCompat.CATEGORY_EVENT, "isPlayingStateUpdate");
        map.put("isPlaying", Boolean.valueOf(z));
        this.eventSink.success(map);
    }
}
