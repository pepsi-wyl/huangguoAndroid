package com.ryanheise.just_audio;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;

/* loaded from: classes2.dex */
public class BetterEventChannel implements EventChannel.EventSink {
    private EventChannel.EventSink eventSink;

    public BetterEventChannel(BinaryMessenger binaryMessenger, String str) {
        new EventChannel(binaryMessenger, str).setStreamHandler(new EventChannel.StreamHandler() { // from class: com.ryanheise.just_audio.BetterEventChannel.1
            @Override // io.flutter.plugin.common.EventChannel.StreamHandler
            public void onListen(Object obj, EventChannel.EventSink eventSink) {
                BetterEventChannel.this.eventSink = eventSink;
            }

            @Override // io.flutter.plugin.common.EventChannel.StreamHandler
            public void onCancel(Object obj) {
                BetterEventChannel.this.eventSink = null;
            }
        });
    }

    @Override // io.flutter.plugin.common.EventChannel.EventSink
    public void success(Object obj) {
        EventChannel.EventSink eventSink = this.eventSink;
        if (eventSink != null) {
            eventSink.success(obj);
        }
    }

    @Override // io.flutter.plugin.common.EventChannel.EventSink
    public void error(String str, String str2, Object obj) {
        EventChannel.EventSink eventSink = this.eventSink;
        if (eventSink != null) {
            eventSink.error(str, str2, obj);
        }
    }

    @Override // io.flutter.plugin.common.EventChannel.EventSink
    public void endOfStream() {
        EventChannel.EventSink eventSink = this.eventSink;
        if (eventSink != null) {
            eventSink.endOfStream();
        }
    }
}
